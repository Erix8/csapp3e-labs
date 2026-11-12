# 🎯 CSAPP Attack Lab

> **Code injection & return-oriented programming — hijacking `getbuf()` one byte at a time.** 🔫

This is my solution to the **Attack Lab** from
[*Computer Systems: A Programmer's Perspective (3rd Edition)*](https://csapp.cs.cmu.edu/). The lab is about exploiting a stack buffer
overflow to take control of a program — first by injecting code, then, once the
stack gets boring, by stitching together existing code with ROP. ✨

## 📂 What's in this directory?

| File | Purpose |
| --- | --- |
| `ctarget` | 🎯 Code-injection target (Phases 1–3) |
| `rtarget` | 🧩 ROP target (Phases 4–5) |
| `farm.c` | 🌾 Source of `rtarget`'s gadget farm |
| `hex2raw` | 🔧 Converts hex-byte payloads into raw input bytes |
| `ctarget0*.txt` | 💉 My code injection payloads |
| `rtarget0*.txt` | 💉 My ROP payloads |
| `cookie.txt` | 🍪 personal per-instance value |

## 🔗 Official Resources

Get the official lab guide and the self-study handout from the CS:APP site:

- 📘 [Attack Lab writeup](https://csapp.cs.cmu.edu/3e/attacklab.pdf) — the official lab guide
- 📦 [Self-study handout](https://csapp.cs.cmu.edu/3e/target1.tar)

## 🚀 Quick Start

```bash
# Try a solution: hex-parse the payload, feed it to the target
cat solution.txt | ./hex2raw | setarch x86_64 -R ./ctarget -q

# Generate byte codes with assemble and disassemble
gcc -c example.s && objdump -d example.o > example.d
```

## ✅ Test Results

| Phase | Payload | Result |
| --- | --- | --- |
| 1 | `ctarget01.txt` | ✅ `Valid solution for level 1 with target ctarget` |
| 2 | `ctarget02.txt` | ✅ `Valid solution for level 2 with target ctarget` |
| 3 | `ctarget03.txt` | ✅ `Valid solution for level 3 with target ctarget` |
| 4 | `rtarget02.txt` | ✅ `Valid solution for level 2 with target rtarget` |
| 5 | `rtarget03.txt` | ✅ `Valid solution for level 3 with target rtarget` |

## 🙏 Credits

- Lab by [CS:APP](https://csapp.cs.cmu.edu/) — *Randal E. Bryant & David R. O'Hallaron*
- Solution explanations written by me, verified against the actual binaries
  (`ctarget`, `rtarget`) and their disassemblies (`ctarget.d`, `rtarget.d`)
