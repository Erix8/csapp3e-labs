# 🏗️ CSAPP Architecture Lab

> **Designing a pipelined Y86-64 processor — and teaching `ncopy` to fly.** ⚡

This is my solution to the **Architecture Lab** from [*Computer Systems: A Programmer's Perspective (3rd Edition)*](https://csapp.cs.cmu.edu/).
The lab walks through the whole stack of a processor: hand-writing Y86-64 assembly (Part A),
extending the SEQ simulator with a brand-new `iaddq` instruction (Part B),
and finally squeezing every last cycle out of a pipelined design and a benchmark `ncopy` routine (Part C). ✨

## 📂 What's in this directory?

| File | Purpose |
| --- | --- |
| `sim/misc/*.ys` | 📝 Part A: `sum.ys`, `rsum.ys`, `copy.ys` |
| `sim/seq/seq-full.hcl` | ⚙️ Part B: SEQ control logic with `iaddq` support |
| `sim/pipe/pipe-full.hcl` | ⚙️ Part C: PIPE control logic with `iaddq` support |
| `sim/pipe/ncopy.ys` | ⚡ Part C: the optimized `ncopy` (avg CPE **7.49**) |
| `sim/y86-code/` | 🧪 Benchmark programs for the regression tests |
| `sim/ptest/` | 🧪 Regression-test suites for `ssim` / `psim` |
| `Makefile` | 🚗 Handin helper |

## 🔗 Official Resources

Get the official lab guide and the self-study handout from the CS:APP site:

- 📘 [Architecture Lab writeup](https://csapp.cs.cmu.edu/3e/archlab.pdf) — the official lab guide
- 📄 [Guide to Y86-64 Simulators](https://csapp.cs.cmu.edu/3e/simguide.pdf) — how `ssim` / `psim` work
- 📦 [Self-study handout](https://csapp.cs.cmu.edu/3e/archlab-handout.tar)

## ✅ My Test Results

| Part | Test | Result |
| --- | --- | --- |
| A | `yas` + `yis` on `sum.ys` / `rsum.ys` / `copy.ys` | ✅ each halts with `%rax = 0xCBA` |
| B | `make VERSION=full`, then `ptest` (incl. `TFLAGS=-i`) | ✅ all regression tests pass |
| C | `iaddq` in `pipe-full.hcl` (regression via `../y86-code` + `../ptest`) | ✅ all pass |
| C | `correctness.pl` / `correctness.pl -p` (block sizes 0–64) | ✅ copy + count correct |
| C | `benchmark.pl -f ncopy.ys` | ⚡ average CPE **7.49** (full credit: < 7.50) |

## 🙏 Credits

- Copyright (c) 2002, 2010, 2015, R. Bryant and D. O'Hallaron, All rights reserved.
- Solutions written by me, verified against `yas` / `yis` / `ssim` /
  `psim` and the `y86-code` + `ptest` regression suites
