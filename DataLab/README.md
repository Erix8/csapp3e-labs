# 🧪 CSAPP Data Lab

> **Bits, logic, and floats — solved with nothing but bitwise wizardry.** 🧙‍♂️

This is my solution to the **CS:APP Data Lab**, the classic bit-manipulation lab from
[*Computer Systems: A Programmer's Perspective (3rd Edition)*](https://csapp.cs.cmu.edu/).

All 13 puzzles are solved in `bits.c` — every integer function obeys the strict
coding rules (no `if`, no loops, no big constants, no casts), and the three
floating-point puzzles are handled at the bit level too. ✨

---

## 📂 What's in this directory?

| File | Purpose |
| --- | --- |
| `bits.c` | 📝 My solutions (this is the file you hand in) |
| `btest.c` / `decl.c` / `tests.c` | 🧪 Test harness sources |
| `dlc` | 🔍 Data Lab Compiler — checks coding-rule compliance |
| `driver.pl` | 🚗 Autograder (runs `dlc` + `btest`) |
| `fshow.c` / `ishow.c` | 🔎 Float / int representation explorers |

## 🔗 Official Resources

Get the official lab guide and the self-study handout from the CS:APP site:

- 📘 [Data Lab writeup](https://csapp.cs.cmu.edu/3e/datalab.pdf) — the official lab guide
- 📦 [Self-study handout `datalab-handout.tar`](https://csapp.cs.cmu.edu/3e/datalab-handout.tar)

## 🚀 Quick Start

```bash
# 1. Rule-check your code (silent = all good)
./dlc bits.c

# 2. See operator counts per function
./dlc -e bits.c

# 3. Build & run the correctness test harness
make btest
./btest

# 4. Full autograde (dlc + btest together)
./driver.pl

# 5. Rebuild from scratch after editing bits.c
make clean && make btest
```

### 🔎 Helper programs

```bash
make                     # build btest, fshow, ishow
./ishow 0x27             # Hex = 0x00000027, Signed = 39, Unsigned = 39
./fshow 0x15213243       # decompose a float's bit pattern
```

## ✅ My Test Results

```bash
Correctness Results     Perf Results
Points  Rating  Errors  Points  Ops     Puzzle
1       1       0       2       8       bitXor
1       1       0       2       1       tmin
1       1       0       2       6       isTmax
2       2       0       2       7       allOddBits
2       2       0       2       2       negate
3       3       0       2       11      isAsciiDigit
3       3       0       2       8       conditional
3       3       0       2       13      isLessOrEqual
4       4       0       2       5       logicalNeg
4       4       0       2       32      howManyBits
4       4       0       2       11      floatScale2
4       4       0       2       16      floatFloat2Int
4       4       0       2       9       floatPower2

Score = 62/62 [36/36 Corr + 26/26 Perf] (129 total operators)
```

## 🙏 Credits

- Lab by [CS:APP](https://csapp.cs.cmu.edu/) — *Randal E. Bryant & David R. O'Hallaron*
- Original handout structure preserved; solution explanations written by me.
