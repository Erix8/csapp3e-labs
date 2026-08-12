# 🏗️ CSAPP Architecture Lab

> **Designing a pipelined Y86-64 processor — and teaching `ncopy` to fly.** ⚡

This is my solution to the **Architecture Lab** from
[*Computer Systems: A Programmer's Perspective (3rd Edition)*](https://csapp.cs.cmu.edu/),
as assigned in my university course. The lab walks through the whole stack of a
processor: hand-writing Y86-64 assembly (Part A), extending the SEQ simulator with
a brand-new `iaddq` instruction (Part B), and finally squeezing every last cycle out
of a pipelined design and a benchmark `ncopy` routine (Part C). ✨

---

## ⚠️ Disclaimer — read this first

- **Course instance, not the official handout.** The Y86-64 tools under `sim/` come
  from my course's copy of `sim.tar` and may differ in details from the official
  `archlab-handout.tar` on the CS:APP website.
- **Everything below is instance-specific.** CPE numbers and the grading thresholds
  follow the course handout for *this* instance.
- **Needs a Linux environment.** The Y86-64 tools (`yas`, `yis`, `ssim`, `psim` and
  their Tk GUI) are old Unix C code — they build and run best inside the Linux
  container at the repo root. 🤷

---

## 📂 What's in this directory?

| File | Purpose |
| --- | --- |
| `sim/` | 🛠️ The full Y86-64 toolchain + all my solutions |
| `sim/misc/*.ys` | 📝 Part A: `sum.ys`, `rsum.ys`, `copy.ys` |
| `sim/seq/seq-full.hcl` | ⚙️ Part B: SEQ control logic with `iaddq` support |
| `sim/pipe/pipe-full.hcl` | ⚙️ Part C: PIPE control logic with `iaddq` support |
| `sim/pipe/ncopy.ys` | ⚡ Part C: the optimized `ncopy` (avg CPE **7.49**) |
| `sim/y86-code/` | 🧪 Benchmark programs for the regression tests |
| `sim/ptest/` | 🧪 Regression-test suites for `ssim` / `psim` |
| `pic/` | 🖼️ Screenshots of the Y86-64 runs |
| `Makefile` | 🚗 Handin helper |

---

## 🔗 Official Resources

Get the official lab guide and the self-study handout from the CS:APP site:

- 📘 [Architecture Lab writeup](https://csapp.cs.cmu.edu/3e/archlab.pdf) — the official lab guide
- 📄 [Guide to Y86-64 Simulators](https://csapp.cs.cmu.edu/3e/simguide.pdf) — how `ssim` / `psim` work
- 📦 [Self-study handout `archlab-handout.tar`](https://csapp.cs.cmu.edu/3e/archlab-handout.tar)

---

## 🚀 Quick Start

The Y86-64 tools are old Unix C code with a Tk GUI — build & run them in the Linux
container at the repo root:

```bash
# 1. Boot the container (Ubuntu 20.04, linux/amd64)
docker compose -f docker/docker-compose.yml up -d
docker exec -it csapp3e-labs zsh

# 2. Inside the container — repo is mounted at /root/csapp3e-labs
cd ArchLab/sim

# 3. Build the whole toolchain (yas, yis, ssim, psim, ...)
make clean && make

# 4. Part A — assemble & simulate a Y86-64 program
cd misc
make sum.yo                 # yas: sum.ys -> sum.yo
./yis sum.yo                # simulate the .yo
```

---

## 🗺️ The Three Parts

| Part | Where | Goal |
| --- | --- | --- |
| A | `sim/misc` | write three Y86-64 programs by hand |
| B | `sim/seq` | add the `iaddq` instruction to the SEQ processor |
| C | `sim/pipe` | add `iaddq` to PIPE **and** optimize `ncopy` for speed |

The trick that ties it together: an instruction is just five little stages
(fetch → decode → execute → memory → write-back), and a pipeline is just an
assembly line of those stages. Parts B and C are the same idea applied to two
different simulators.

---

## 📜 Part A: Y86-64 Assembly (`sim/misc`)

Goal: write three Y86-64 programs that behave like the C functions in
`sim/misc/examples.c`, following the x86-64 calling conventions (arguments in
`%rdi`, `%rsi`, `%rdx`; return value in `%rax`; callee-saved registers preserved).
Assemble with `yas`, simulate with `yis`.

### ✅ `sum.ys` — iterative linked-list sum

```c
long sum_list(list_ptr ls)
{
    long val = 0;
    while (ls) {
        val += ls->val;
        ls = ls->next;
    }
    return val;
}
```

- `xorq %rax, %rax` — zero the accumulator.
- Loop: `andq %rdi, %rdi` checks whether `ls` is `NULL`; if so, jump out.
- `mrmovq (%rdi), %r10` loads `ls->val`, `addq %r10, %rax` accumulates,
  `mrmovq 8(%rdi), %rdi` advances `ls` to `ls->next`.
- Epilogue: restore the frame (`rrmovq %rbp, %rsp` / `popq %rbp`) and `ret`.

On the sample three-element list (`0x00a → 0x0b0 → 0xc00`) the sum is
`0x00a + 0x0b0 + 0xc00 = 0xCBA`:

``` bash
cd misc && ./yas sum.ys -o sum.yo && ./yis sum.yo 
Stopped in 31 steps at PC = 0x5b.  Status 'HLT', CC Z=1 S=0 O=0
Changes to registers:
%rax:   0x0000000000000000      0x0000000000000cba
%rsp:   0x0000000000000000      0x00000000000001f8
%r10:   0x0000000000000000      0x0000000000000c00

Changes to memory:
0x01f0: 0x0000000000000000      0x000000000000005b
0x01f8: 0x0000000000000000      0x0000000000000013
```

### ✅ `rsum.ys` — recursive linked-list sum

```c
long rsum_list(list_ptr ls)
{
    if (!ls)
        return 0;
    else {
        long val = ls->val;
        long rest = rsum_list(ls->next);
        return val + rest;
    }
}
```

- Base case: `andq %rdi, %rdi` / jump when empty → `xorq %rax, %rax` returns 0.
- Save `ls->val` in `%r10` (`mrmovq (%rdi), %r10`), advance with
  `mrmovq 8(%rdi), %rdi`, then `call` recurses.
- After the call, `addq %r10, %rax` adds the saved value to the recursive result.
- `%r10` is callee-saved, so the value is pushed (`pushq %r10`) and restored
  (`popq %r10`) around the recursion so each stack frame's data stays intact.

Same sample list → `0xCBA`:

``` bash
cd misc && ./yas rsum.ys -o rsum.yo && ./yis rsum.yo
Stopped in 57 steps at PC = 0x5b.  Status 'HLT', CC Z=0 S=0 O=0
Changes to registers:
%rax:   0x0000000000000000      0x0000000000000cba
%rsp:   0x0000000000000000      0x00000000000001f8

Changes to memory:
0x0198: 0x0000000000000000      0x0000000000000c00
0x01a0: 0x0000000000000000      0x00000000000001b8
0x01a8: 0x0000000000000000      0x000000000000008a
0x01b0: 0x0000000000000000      0x00000000000000b0
0x01b8: 0x0000000000000000      0x00000000000001d0
0x01c0: 0x0000000000000000      0x000000000000008a
0x01c8: 0x0000000000000000      0x000000000000000a
0x01d0: 0x0000000000000000      0x00000000000001e8
0x01d8: 0x0000000000000000      0x000000000000008a
0x01f0: 0x0000000000000000      0x000000000000005b
0x01f8: 0x0000000000000000      0x0000000000000013
```

### ✅ `copy.ys` — copy a block & return the XOR checksum

```c
long copy_block(long *src, long *dest, long len)
{
    long result = 0;
    while (len > 0) {
        long val = *src++;
        *dest++ = val;
        result ^= val;
        len--;
    }
    return result;
}
```

- `xorq %rax, %rax` — zero the checksum.
- Loop: `andq %rdx, %rdx` tests `len == 0`.
- `mrmovq (%rdi), %r10` reads `*src`, `rmmovq %r10, (%rsi)` stores `*dest`,
  `xorq %r10, %rax` folds the value into the checksum.
- `addq $8, %rdi` / `addq $8, %rsi` advance both pointers,
  `subq $1, %rdx` decrements the length.
- Only caller-saved scratch regs (`%r10`, `%r11`) are used — no callee-saved
  register to save/restore.

On the sample blocks (`0x00a, 0x0b0, 0xc00`) the checksum is
`0x00a ^ 0x0b0 ^ 0xc00 = 0xCBA`:

``` bash
cd misc && ./yas copy.ys -o copy.yo && ./yis copy.yo
Stopped in 48 steps at PC = 0x6f.  Status 'HLT', CC Z=1 S=0 O=0
Changes to registers:
%rax:   0x0000000000000000      0x0000000000000cba
%rsp:   0x0000000000000000      0x00000000000001f8
%rsi:   0x0000000000000000      0x0000000000000048
%rdi:   0x0000000000000000      0x0000000000000030
%r10:   0x0000000000000000      0x0000000000000c00
%r11:   0x0000000000000000      0x0000000000000001

Changes to memory:
0x0030: 0x0000000000000111      0x000000000000000a
0x0038: 0x0000000000000222      0x00000000000000b0
0x0040: 0x0000000000000333      0x0000000000000c00
0x01f0: 0x0000000000000000      0x000000000000006f
0x01f8: 0x0000000000000000      0x0000000000000013
```

---

## ⚙️ Part B: `iaddq` in SEQ (`sim/seq`)

**Goal:** extend the SEQ simulator to support `iaddq V, rB` — add an immediate to a
register, write the result back, and update the condition codes. (`iaddq -10, %rdx`
is exactly what Part C uses for the loop counters!) The `iaddq` instruction saves
*two* instructions compared to the old `irmovq` + `addq` idiom.

`iaddq` is a 10-byte instruction (opcode `0xC` + reg field `rA:rB` + 8-byte
immediate). Walking it through the six SEQ stages:

| Stage | What happens |
| --- | --- |
| Fetch | `icode:ifun ← M1[PC]`, `rA:rB ← M1[PC+1]`, `valC ← M8[PC+2]`, `valP = PC + 10` |
| Decode | read `valB ← R[rB]` (no `rA` operand) |
| Execute | `valE = valB + valC`; update ZF/SF/OF |
| Memory | none |
| Write back | `R[rB] = valE` |
| PC update | `PC = valP` (sequential) |

Adding it to `seq-full.hcl` is then just wiring those facts into the control
signals:

- `instr_valid` += `IIADDQ` (it's a legal instruction)
- `need_regids` += `IIADDQ` (has an `rB` field)
- `need_valC` += `IIADDQ` (has an 8-byte immediate)
- `srcB = rB`, `dstE = rB` (read `valB`, write the result back to `rB`)
- `aluA = valC`, `aluB = valB`, `alufun = ALUADD` (add the immediate to the register)
- `set_cc` = `{ IOPQ, IIADDQ }` (update the condition codes)
- no memory access; `PC = valP`

Build & test:

```bash
cd sim/seq
make VERSION=full                          # build ssim from seq-full.hcl
./ssim -t ../y86-code/asumi.yo             # smoke-test iaddq (asumi uses it)
(cd ../y86-code; make testssim)            # regression: old instructions still OK
(cd ../ptest; make SIM=../seq/ssim)        # full ptest suite (minus iaddq)
(cd ../ptest; make SIM=../seq/ssim TFLAGS=-i)   # ptest for iaddq itself
```

---

## ⚡ Part C: Pipeline & `ncopy` (`sim/pipe`)

Part C is the heart of the lab: get `ncopy.ys` to run as fast as possible on a
pipelined PIPE simulator. Two levers — the processor and the program — and both get
tweaked.

### `iaddq` in PIPE

The same instruction, but now pipelined: the signals split across the F/D/E/M/W
stage latches. The edits mirror Part B, with each control signal reading its own
stage's `icode`:

```hcl
bool instr_valid = f_icode in
    { INOP, IHALT, IRRMOVQ, IIRMOVQ, IRMMOVQ, IMRMOVQ,
      IOPQ, IJXX, ICALL, IRET, IPUSHQ, IPOPQ, IIADDQ };

bool need_regids =
    f_icode in { IRRMOVQ, IOPQ, IPUSHQ, IPOPQ,
                 IIRMOVQ, IRMMOVQ, IMRMOVQ, IIADDQ };

bool need_valC =
    f_icode in { IIRMOVQ, IRMMOVQ, IMRMOVQ, IJXX, ICALL, IIADDQ };

word d_srcB = [
    D_icode in { IOPQ, IRMMOVQ, IMRMOVQ, IIADDQ } : D_rB;
    D_icode in { IPUSHQ, IPOPQ, ICALL, IRET } : RRSP;
    1 : RNONE;
];

word d_dstE = [
    D_icode in { IRRMOVQ, IIRMOVQ, IOPQ, IIADDQ } : D_rB;
    D_icode in { IPUSHQ, IPOPQ, ICALL, IRET } : RRSP;
    1 : RNONE;
];

word aluA = [
    E_icode in { IRRMOVQ, IOPQ } : E_valA;
    E_icode in { IIRMOVQ, IRMMOVQ, IMRMOVQ, IIADDQ } : E_valC;
    E_icode in { ICALL, IPUSHQ } : -8;
    E_icode in { IRET, IPOPQ } : 8;
];

word aluB = [
    E_icode in { IRMMOVQ, IMRMOVQ, IOPQ, ICALL,
                 IPUSHQ, IRET, IPOPQ, IIADDQ } : E_valB;
    E_icode in { IRRMOVQ, IIRMOVQ } : 0;
];

bool set_cc = (E_icode in { IOPQ, IIADDQ }) &&
    !m_stat in { SADR, SINS, SHLT } && !W_stat in { SADR, SINS, SHLT };
```

### Optimizing `ncopy.ys`

`ncopy(src, dst, len)` copies `len` words and returns the count of positive words.
The baseline version walks the loop once per element at a leisurely **14.24 CPE**
(897 cycles for 63 elements). My version gets to **7.49 avg CPE** — past the 7.50
full-credit bar. Three tricks:

**1. 10-way loop unrolling.** Instead of processing 1 element per trip, the main
loop (Loop1…Loop10) processes **10 elements per iteration**: ten `mrmovq` loads
followed by ten `rmmovq` stores, then the counters and pointers are bumped in bulk
(`iaddq $80, %rdi`, `iaddq $80, %rsi`, `iaddq $-10, %rdx`). The branch is taken
10× less often, so 9 out of 10 loop-overhead branches just disappear.

**2. Avoiding load-use hazards with `%r10`/`%r11`.** A `mrmovq` followed
immediately by an instruction that *uses* its result stalls the pipeline. The
trick is to interleave two independent loads — one into `%r10`, the next into
`%r11` — so the consumer of `%r10` never waits on a just-loaded value:

```asm
mrmovq (%rdi), %r10       # load 0th word
mrmovq 8(%rdi), %r11      # load 1st word (independent of r10)
rmmovq %r10, (%rsi)       # store 0th word — r10 finished loading
andq   %r10, %r10         # test it — no stall
iaddq  $1, %rax           # count++ if positive
```

**3. Specialized remainder handling.** `len` isn't always a multiple of 10, so a
`Root` dispatcher classifies `len % 10` and jumps straight into the middle of the
unrolled body (Remain1…Remain9), with `iaddq`-based arithmetic on `%rdx` and
`jl`/`jg`/`je` branches doing the dispatch. Each remainder path copies and counts
exactly the leftover elements — no wasted work, and `len = 0` falls straight
through to `ret`.

Result (from my run):

```text
Average CPE      7.49
```

Build & test:

```bash
cd sim/pipe
make psim VERSION=full                       # build psim from pipe-full.hcl
make drivers                                 # build sdriver.yo + ldriver.yo
./psim -g sdriver.yo                         # 4-element test (%rax = 2)
./psim -g ldriver.yo                         # 63-element test (%rax = 31)
./correctness.pl                             # ISA: all block sizes 0..64
./correctness.pl -p                          # PIPE: all block sizes 0..64
./benchmark.pl -f ncopy.ys                   # CPE across block sizes
./check-len.pl < ncopy.yo                    # must stay under 1000 bytes
```

---

## ✅ Test Results

| Part | Test | Result |
| --- | --- | --- |
| A | `yas` + `yis` on `sum.ys` / `rsum.ys` / `copy.ys` | ✅ each halts with `%rax = 0xCBA` |
| B | `make VERSION=full`, then `ptest` (incl. `TFLAGS=-i`) | ✅ all regression tests pass |
| C | `iaddq` in `pipe-full.hcl` (regression via `../y86-code` + `../ptest`) | ✅ all pass |
| C | `correctness.pl` / `correctness.pl -p` (block sizes 0–64) | ✅ copy + count correct |
| C | `benchmark.pl -f ncopy.ys` | ⚡ average CPE **7.49** (full credit: < 7.50) |

---

## 🙏 Credits

- Lab by [CS:APP](https://csapp.cs.cmu.edu/) — *Randal E. Bryant & David R. O'Hallaron*
- Course `sim.tar` & handout by my university
- Solution explanations written by me, verified against `yas` / `yis` / `ssim` /
  `psim` and the `y86-code` + `ptest` regression suites

**May your pipeline never stall. 🚀**