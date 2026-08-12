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

---

## 🔗 Official Resources

Get the official lab guide and the self-study handout from the CS:APP site:

- 📘 [Data Lab writeup](https://csapp.cs.cmu.edu/3e/datalab.pdf) — the official lab guide
- 📦 [Self-study handout `datalab-handout.tar`](https://csapp.cs.cmu.edu/3e/datalab-handout.tar)

---

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

### Useful `btest` flags

```bash
./btest -f bitXor              # test only one function
./btest -f isLessOrEqual -1 4 -2 5   # test with specific args
./btest -g                     # compact output, no error messages
./btest -h                     # show all options
```

### 🔎 Helper programs

```bash
make                     # build btest, fshow, ishow
./ishow 0x27             # Hex = 0x00000027, Signed = 39, Unsigned = 39
./fshow 0x15213243       # decompose a float's bit pattern
```

---

## 🧩 The Puzzles

### Integer Puzzles (strict rules: only `! ~ & ^ | + << >>`, constants ≤ 0xFF)

#### 1. `bitXor` — XOR using only `~` and `&` ✂️

XOR is "x has a bit that y doesn't, or vice versa":

```c
x ^ y = (x & ~y) | (~x & y)
```

Since `|` is banned, replace it with its De Morgan equivalent `a | b = ~(~a & ~b)`:

```c
return ~(~(x & ~y) & ~(~x & y));
```

#### 2. `tmin` — return `TMin` 🏔️

`TMin = 0x80000000` is just a single `1` at bit 31. One shift does the job:

```c
return 1 << 31;
```

#### 3. `isTmax` — is `x` the maximum int? 🎯

Key facts: `TMax + 1 = TMin`, and `TMax ^ TMin = 0xFFFFFFFF` (all ones).
So for `TMax`, `~(x ^ (x+1)) == 0`. But `x = -1` is a sneaky impostor
(`-1 ^ 0 == 0xFFFFFFFF` too), so filter it out:

```c
int x_plus_1 = x + 1;
int not_xor = ~(x ^ x_plus_1);
return !(not_xor | !x_plus_1);   // strip the x == -1 case
```

#### 4. `allOddBits` — all odd-numbered bits set? 🟫

Build the `0xAAAAAAAA` mask from a `0xAA` seed using shifts (big constants are
forbidden), then check `(x & mask) == mask`:

```c
int mask = 0xAA;
mask |= mask << 8;
mask |= mask << 16;
return !((x & mask) ^ mask);
```

#### 5. `negate` — return `-x` ➖

Two's complement negation: **flip all bits, add one**.

```c
return ~x + 1;
```

Works for almost everything — except `TMin`, whose negation overflows back to itself.
That's just how 32-bit two's complement rolls. 🤷

#### 6. `isAsciiDigit` — is `0x30 ≤ x ≤ 0x39`? 🔢

Use the sign bit to test two subtractions at once:

- `x - 0x30 ≥ 0` ⇔ `x + (~0x30 + 1)` is non-negative
- `0x39 - x ≥ 0` ⇔ `0x39 + (~x + 1)` is non-negative

`>> 31` extracts the sign, `!` flips it into a boolean, and `&` combines:

```c
int lower = x + (~0x30 + 1);
int upper = 0x39 + (~x + 1);
return !(lower >> 31) & !(upper >> 31);
```

#### 7. `conditional` — `x ? y : z` 🪄

Turn `!!x` into a full 32-bit mask by negating:

| `x` | `!!x` | `mask = ~(!!x) + 1` |
| --- | --- | --- |
| non-zero | 1 | `0xFFFFFFFF` |
| zero | 0 | `0x00000000` |

Then select:

```c
int mask = ~(!!x) + 1;
return (y & mask) | (z & ~mask);
```

#### 8. `isLessOrEqual` — `x <= y`? ⚖️

Split into two cases:

- **Different signs** → `x <= y` iff `x` is negative and `y` is non-negative.
- **Same sign** → compute `y - x` and check the sign bit.

```c
int x_sign = x >> 31, y_sign = y >> 31;

// case 1: x ≤ 0, y ≥ 0  →  x <= y
int sign_diff_less = x_sign & !y_sign;

// case 2: same sign  →  y - x >= 0
int y_minus_x = y + (~x + 1);
int same_sign_less_or_eq = !(x_sign ^ y_sign) & !(y_minus_x >> 31);

return sign_diff_less | same_sign_less_or_eq;
```

#### 9. `logicalNeg` — implement `!` without `!` 🙃

Trick: `x` and `-x` always have opposite sign bits — **unless `x = 0`**.

```c
return ((x | (~x + 1)) >> 31) + 1;
```

- `x ≠ 0` → `x | -x` is negative → `>> 31` gives `0xFFFFFFFF` → `+1` → **0**
- `x == 0` → `0 | 0 = 0` → `>> 31` gives `0` → `+1` → **1**

#### 10. `howManyBits` — min bits to represent `x` in two's complement 📏

The idea: find the **highest bit that differs from the sign bit**, then add one more
bit for the sign.

- If `x < 0`, flip it (`~x`) — this maps the negative case onto "find the highest 1".
- Then binary-search for the highest set bit with a shift cascade:

```c
b16 = !!(x >> 16) << 4;  x >>= b16;   // are the top 16 bits used?
b8  = !!(x >> 8)  << 3;  x >>= b8;    // top 8?
b4  = !!(x >> 4)  << 2;  x >>= b4;    // top 4?
b2  = !!(x >> 2)  << 1;  x >>= b2;    // top 2?
b1  = !!(x >> 1);        x >>= b1;    // top 1?
b0  = x;                               // last bit itself
return b16 + b8 + b4 + b2 + b1 + b0 + 1;   // +1 for the sign bit
```

---

### Floating-Point Puzzles (looser rules: `if`/`while` and arbitrary constants OK)

All three treat a `unsigned` as the raw bit pattern of a `float`
(1 sign + 8 exponent + 23 fraction).

#### 11. `floatScale2` — multiply a float by 2 ✖️2️⃣

Split the bits and handle each class:

- **NaN / Inf** (`exp == 0xFF`) → return as-is.
- **Denormalized** (`exp == 0`) → `frac <<= 1`; if the bit spills into the exponent,
  it becomes a normalized number (`exp = 1`).
- **Normalized** → `exp += 1`; if it overflows to `0xFF`, it's now ±Inf (`frac = 0`).

#### 12. `floatFloat2Int` — cast a float to `int` 🔀

- `e = exp - 127` (unbias the exponent).
- Overflow / NaN / Inf (`exp == 0xFF` or `e > 30`) → return `0x80000000u`.
- `e < 0` (magnitude < 1) → return `0` (rounds toward zero).
- Otherwise: `mantissa = frac | 0x800000` (add the implicit leading 1), shift by
  `e - 23` (or `23 - e`), then apply the sign.

#### 13. `floatPower2` — build `2.0^x` as a float ⚡

Spot the boundary cases:

| Range | Result |
| --- | --- |
| `x > 127` | `+INF` (`0x7F800000`) |
| `x < -149` | `0` (too small for even a denorm) |
| `-149 ≤ x < -126` | denormalized: `1 << (x + 149)` |
| `-126 ≤ x ≤ 127` | normalized: `(x + 127) << 23` |

---

## 📊 Operator Counts

| Function | Ops used | Max allowed |
| --- | --- | --- |
| `bitXor` | 8 | 14 |
| `tmin` | 1 | 4 |
| `isTmax` | 6 | 10 |
| `allOddBits` | 7 | 12 |
| `negate` | 2 | 5 |
| `isAsciiDigit` | 11 | 15 |
| `conditional` | 8 | 16 |
| `isLessOrEqual` | 13 | 24 |
| `logicalNeg` | 5 | 12 |
| `howManyBits` | 36 | 90 |
| `floatScale2` | 14 | 30 |
| `floatFloat2Int` | 16 | 30 |
| `floatPower2` | 9 | 30 |

All well under budget. 😎

---

## ✅ Test Results

```bash
./dlc bits.c                       # no complaints ✅
./btest                            # all tests pass ✅
# full autograde via driver.pl:
Score = 62/62 [36/36 Corr + 26/26 Perf] (136 total operators)
```

---

## 🙏 Credits

- Lab by [CS:APP](https://csapp.cs.cmu.edu/) — *Randal E. Bryant & David R. O'Hallaron*
- Original handout structure preserved; solution explanations written by me