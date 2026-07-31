# **CSAPP：DataLab**

## 第1题

``` c
/*
 * bitXor - x^y using only ~ and &
 *   Example: bitXor(4, 5) = 1
 *   Legal ops: ~ &
 *   Max ops: 14
 */
int bitXor(int x, int y)
{
  /* XOR is (x & ~y) | (~x & y), 
  	 use ~ and & to simulate | via De Morgan */
  return ~(~(x & ~y) & ~(~x & y));
} // dlc:bits.c:148:bitXor: 8 operators
```

-  **异或的等价转换**：异或可以用 “与” 和 “非” 表示为：

   ```c
   x XOR y = (x & ~y) | (~x & y)
   ```

   - `x & ~y`：只保留 x 中为 1 且 y 中为 0 的位（结果为 1 的位）。
   - `~x & y`：只保留 y 中为 1 且 x 中为 0 的位（结果为 1 的位）。
   - 两者通过 “或（|）” 合并，即得到异或结果。

- **用 `~` 和 `&` 模拟 “或（|）”**：题目不允许直接使用 `|`，但可以通过 **德摩根定律** 转换：

   ```c
   a | b = ~(~a & ~b)
   ```

- **组合上述两步**：将 `a = (x & ~y)`，`b = (~x & y)` 代入德摩根定律：

   ```c
   x XOR y = ~( ~(x & ~y) & ~(~x & y) )
   ```

## 第2题

``` c
/*
 * tmin - return minimum two's complement integer
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 */
int tmin(void)
{
  /* TMin is 0x80000000, which is 1 shifted left by 31 */
  return 1 << 31;
} // dlc:bits.c:159:tmin: 1 operators
```

- 在二进制补码中，`0x80000000` 的值为 `-2^31`，正是 32 位补码系统中最小的整数。
- 求解 `TMIN` 即要构造 `0x80000000`，最直接的方式是利用**左移操作**：
- 初始值 `1` 的二进制为 `000...0001`（31 个 0 + 1 个 1）。
  
- 将 `1` 左移 31 位（`1 << 31`），得到 `100...0000`（最高位为 1，其余 31 位为 0），恰好是 `0x80000000`，即 TMin。

## 第3题

```c
/*
 * isTmax - returns 1 if x is the maximum, two's complement number,
 *     and 0 otherwise
 *   Legal ops: ! ~ & ^ | +
 *   Max ops: 10
 */
int isTmax(int x)
{
  /* TMax + 1 = TMin, and TMax ^ TMin = all 1s. 
  	 Also handle x = -1 edge case */
  int x_plus_1 = x + 1;
  int xor = x ^ x_plus_1;
  int not_xor = ~xor;
  int is_neg1 = !(x_plus_1);
  return !(not_xor | is_neg1);
} // dlc:bits.c:176:isTmax: 6 operators
```

- `TMAX` 为 `0x7FFFFFFFF` 在此题目中无法使用移位构造，但 `TMAX` 有两个关键特性：
  - `TMAX + 1 = TMIN`（TMin 是最小整数 `-2^31`，二进制为 `0x80000000`）。
  - `TMAX ^ TMIN = 0xFFFFFFFF`（全 1，因为 TMax 和 TMin 的二进制位全相反）。
- 基于 TMax 的特性，设计判断逻辑：
  - 若 `x` 是 TMax，则 `x + 1` 必为 TMin，且 `x ^ (x + 1)` 的结果为全 1（`0xFFFFFFFF`）；此时 `not_xor` 为0，其余情况下均非0。
  - 需排除一个特殊情况：`x = -1`（二进制 `0xFFFFFFFF`）。因为 `-1 + 1 = 0`，而 `(-1) ^ 0 = 0xFFFFFFFF`，会误触发上述条件，需单独过滤。
  - 最终当且仅当 `x` 不是-1且 `not_xor` 结果为0时满足条件返回1；其余情形都会正确返回0作为结果。

## 第4题

``` c
/*
 * allOddBits - return 1 if all odd-numbered bits in word set to 1
 *   where bits are numbered from 0 (least significant) to 31 (most significant)
 *   Examples allOddBits(0xFFFFFFFD) = 0, allOddBits(0xAAAAAAAA) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 */
int allOddBits(int x)
{
  /* Create mask with odd bits set (0xAAAAAAAA), 
  	 check x & mask == mask */
  int mask = 0xAA;
  mask |= mask << 8;
  mask |= mask << 16;
  return !((x & mask) ^ mask);
} // dlc:bits.c:192:allOddBits: 7 operators
```

- **构造奇数位掩码**：生成一个 32 位整数，其中所有奇数位（1、3、5、…、31）为 1，偶数位为 0，这个掩码的十六进制表示为 `0xAAAAAAAA`；因为题目不允许使用大于 `0xFF` 的常数，因此需要使用 `<<` 和 `|` 运算两次构造。
- **验证匹配性**：用 `x` 与掩码进行 “与运算”（`x & mask`），如果结果等于掩码本身，说明 `x` 的所有奇数位都是 1，否则存在奇数位为 0；使用 `^` 来检验 `x&mask` 和 `mask` 是否完全相同。

## 第5题

``` c
/*
 * negate - return -x
 *   Example: negate(1) = -1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 */
int negate(int x)
{
  /* Two's complement negation: ~x + 1 */
  return ~x + 1;
} // dlc:bits.c:204:negate: 2 operators
```

- 二进制补码中，`~x` 等价于 `-x - 1`（因为 `x + (~x) = -1`）。因此一个整数 `x` 的相反数 `-x` 可以通过 **“按位取反后加 1”** 得到。

- 重点需要对边界情况验证：
  - 对于 `x = 0`：`~0` 是全 1（即 `-1`），`~0 + 1 = -1 + 1 = 0`，正确。
  - 对于最小的 32 位补码整数 `TMin = 0x80000000`（即 `-2^31`）：其相反数理论上是 `2^31`，但 32 位补码无法表示 `2^31`，此时 `~TMin + 1` 的结果仍为 `TMin`

## 第6题

``` c
/*
 * isAsciiDigit - return 1 if 0x30 <= x <= 0x39
 * 								(ASCII codes for characters '0' to '9')
 *   Example: isAsciiDigit(0x35) = 1.
 *            isAsciiDigit(0x3a) = 0.
 *            isAsciiDigit(0x05) = 0.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 */
int isAsciiDigit(int x)
{
  /* Check x >= 0x30 and x <= 0x39 */
  int lower = x + (~0x30 + 1); // x - 0x30
  int upper = 0x39 + (~x + 1); // 0x39 - x
  return !(lower >> 31) & !(upper >> 31);
} // dlc:bits.c:221:isAsciiDigit: 11 operators
```

- 要判断 `x` 是否在 `[0x30, 0x39]` 范围内，需要同时满足两个条件：`x` 大于等于下界 `0x30`（即 `x - 0x30 ≥ 0`）且`x` 小于等于上界 `0x39`（即 `0x39 - x ≥ 0`）。
- 通过**补码运算**实现减法，并利用**符号位**判断结果是否非负，最终将两个条件的结果合并：
  - `x - 0x30` 可表示为 `x + (~0x30 + 1)`。若结果非负，其符号位（第 31 位）为 `0`，右移 31 位后结果为 `0`，再用 `!` 取反得到 `1`（表示满足 `x ≥ 0x30`）。
  - `0x39 - x` 可表示为 `0x39 + (~x + 1)`。若结果非负，符号位为 `0`，右移 31 位后用 `!` 取反得到 `1`（表示满足 `x ≤ 0x39`）。
  - 只有当两个条件同时为 `1` 时，`x` 才是 ASCII 数字，因此用 `&` 操作符合并结果。

## 第7题

``` c
/*
 * conditional - same as x ? y : z
 *   Example: conditional(2,4,5) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 */
int conditional(int x, int y, int z)
{
  /* Generate mask: 0xFFFFFFFF if x != 0, 
  	 0x00000000 otherwise */
  int mask = ~(!!x) + 1;
  return (y & mask) | (z & ~mask);
} // dlc:bits.c:234:conditional: 8 operators
```

- 当 `x != 0` 时，`!!x = 1`，则 `~1 + 1 = 0xFFFFFFFE + 1 = 0xFFFFFFFF`，生成全 1 掩码（`0xFFFFFFFF`）；用该掩码保留 `y` 并屏蔽 `z`（`y & mask` 保留 `y`，`z & ~mask` 结果为 0）。
- 当 `x == 0` 时，`!!x = 0`，则 `~0 + 1 = 0xFFFFFFFF + 1 = 0x00000000`，生成全 0 掩码（`0x00000000`）；用该掩码屏蔽 `y` 并保留 `z`（`y & mask` 结果为 0，`z & ~mask` 保留 `z`）

## 第8题

``` c
/*
 * isLessOrEqual - if x <= y  then return 1, else return 0
 *   Example: isLessOrEqual(4,5) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 */
int isLessOrEqual(int x, int y)
{
  /* Compare the sign of x and y, handle x_sign & !y_sign
     if x & y have same sign, handle y - x >= 0 */
  int x_sign = x >> 31;
  int y_sign = y >> 31;
  // Case1: different signs, x <= y when x is neg
  int sign_diff_less = x_sign & !y_sign;
  // Case2: same signs, x <= y when y - x >= 0
  int y_minus_x = y + (~x + 1);
  int non_neg = !(y_minus_x >> 31);
  int sign_eq = !(x_sign ^ y_sign);
  int same_sign_less_or_eq = sign_eq & non_neg;
  return sign_diff_less | same_sign_less_or_eq;
} // dlc:bits.c:259:isLessOrEqual: 13 operators
```

- 首先提取参数 `x` 和参数 `y` 的符号位，可以有以下两种情况
  - **符号差异判断**：当 `x` 为负且 `y` 为非负时，`x <= y` 必然成立。
  - **符号相同时**：计算 `y - x`，若结果非负，则 `x <= y`。
- 对于符号不同的情况，计算 `x_sign & !y_sign` ，需要注意的是 `x` 为负时符号位为1，所以`x_sign` 取逻辑正而 `y_sign` 取逻辑负，`sign_diff_less` 为0或1。

|   `x_sign`   |   `y_sign`   | `x_sign & !y_sign` |
| :----------: | :----------: | :----------------: |
| `0xFFFFFFFF` | `0xFFFFFFFF` |         0          |
| `0xFFFFFFFF` | `0x00000000` |         1          |
| `0x00000000` | `0xFFFFFFFF` |         0          |
| `0x00000000` | `0x00000000` |         0          |

- 对于符号相同的情况首先计算 `y-x` ，根据补码性质 `-x=~x+1` 可完成运算；当且仅当 `y-x` 的符号位为0时结果非负，所以需要逻辑取反， `same_sign_less_or_eq` 为0或1。

- 最终结果对 `sign_diff_less` 和 `same_sign_less_or_eq` 进行按位或运算即可。

## 第9题

``` c
/*
 * logicalNeg - implement the ! operator, using all of
 *              the legal operators except !
 *   Examples: logicalNeg(3) = 0, logicalNeg(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 */
int logicalNeg(int x)
{
  /* 0 and -0 have same sign bit. 
     For x=0, ~x +1 =0, so sign bit is 0. */
  return ((x | (~x + 1)) >> 31) + 1;
} // dlc:bits.c:273:logicalNeg: 5 operators
```

- **计算 `x | (-x)`**：对于非 0 的 `x`，`x | (-x)` 的符号位为 1（因为 `x` 和 `-x` 符号相反，按位或后符号位必为 1）；对于 `x = 0`，`x | (-x) = 0`，符号位为 0。
- **提取符号位**：将 `x | (-x)` 右移 31 位（算术右移），得到符号位的扩展结果：非 0 时，结果为 `0xFFFFFFFF`（符号位 1 扩展）；0 时，结果为 `0x00000000`（符号位 0 扩展）。
- **转换为逻辑非结果**：非 0 时，`0xFFFFFFFF + 1 = 0x00000000`（即返回 0）；0 时，`0x00000000 + 1 = 0x00000001`（即返回 1）。

## 第10题

```c
/* howManyBits - return the minimum number of bits 
 *							 required to represent x in two's complement
 *  Examples: howManyBits(12) = 5
 *            howManyBits(298) = 10
 *            howManyBits(-5) = 4
 *            howManyBits(0)  = 1
 *            howManyBits(-1) = 1
 *            howManyBits(0x80000000) = 32
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 90
 */
int howManyBits(int x)
{
  int sign, b16, b8, b4, b2, b1, b0;
  // Convert to positive if x is negative
  sign = x >> 31;
  x = (sign & ~x) | (~sign & x);
  // Check if higher 16 bits have any set bits
  b16 = !!(x >> 16) << 4;
  x >>= b16;
  // Check next 8 bits
  b8 = !!(x >> 8) << 3;
  x >>= b8;
  // Check next 4 bits
  b4 = !!(x >> 4) << 2;
  x >>= b4;
  // Check next 2 bits
  b2 = !!(x >> 2) << 1;
  x >>= b2;
  // Check next 1 bit
  b1 = !!(x >> 1);
  x >>= b1;
  // Check remaining bit
  b0 = x;
  return b16 + b8 + b4 + b2 + b1 + b0 + 1;
} // dlc:bits.c:310:howManyBits: 36 operators
```

- **关键思想**：寻找“从最高有效位起，第一个与符号位不同的位”的位置。所需位数 = 该位置索引 + 2（索引从 0 开始，加上符号位）。若 `x` 为负数，则令 `x = ~x`：负数补码高位为 1，取反后可将问题统一为正数情况“求最高 1 的位置”。
- 在非负数上采用**二分查找式位移**判断最高 1 所在区间：

  - 依次检测高 16、8、4、2、1 位区间（从右侧开始数）是否包含 1；通过 `!!(x >> k)` 生成布尔结果（是否有高位 1），再用 `<<n` 转换为相应位数增量；
  - 若结果为 1，右移对应位数以在高位继续查找，同时累加该位移量到 `bx`；若结果为0则不进行右移在低位继续查找。
- 最终将所有位移量 (`b16+b8+b4+b2+b1+b0`) 相加再加 1 个符号位，即为所需最小位数。

## 第11题

``` c
/*
 * floatScale2 - Return bit-level equivalent of expression 2*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 */
unsigned floatScale2(unsigned uf)
{
  /* Extract sign, exponent, fraction */
  unsigned sign = uf & 0x80000000;
  unsigned exp = uf & 0x7F800000;
  unsigned frac = uf & 0x007FFFFF;
  // Check for NaN or infinity (exp is all 1s)
  if (exp == 0x7F800000)
  {
    return uf; // NaN or infinity, return as is
  }
  // Denormalized (exp is 0)
  if (exp == 0)
  {
    // Shift fraction left by 1 (scale by 2)
    frac <<= 1;
    // If fraction overflows into exponent, becomes normalized
    if (frac & 0x00800000)
    {
      exp = 0x00800000;   // exp = 1
      frac &= 0x007FFFFF; // clear overflow bit
    }
    return sign | exp | frac;
  }
  // Normalized (exp is not 0 and not all 1s)
  exp += 0x00800000; // increment exponent by 1 (scale by 2)
  // Check if new exp is all 1s (infinity)
  if (exp == 0x7F800000)
  {
    frac = 0; // infinity has 0 fraction
  }
  return sign | exp | frac;
} // dlc:bits.c:355:floatScale2: 14 operators
```

- 拆分浮点数结构：提取符号位 `sign`、指数位 `exp` 和尾数位 `frac`。
- 特殊情况处理：若 `exp` 全为 1（此时 `uf` 表示 `NaN` 或无穷大），直接返回原数。
- 非规格化数（`exp` 全为 0）：将 `frac` 左移 1 位（实现 ×2），若移位后 `frac` 溢出，则转为规格化数（`exp`设为 1，`frac`清溢出位）。
- 规格化数（`exp` 非全 0 且非全 1）：将`exp` 加 1（实现 ×2），若指数位因此变为全 1，则将 `frac` 清零（和符号位组合后表示正 / 负无穷大）。
- 重组结果：将 `sign`、处理后的 `exp` 和 `frac` 重新组合并返回，即为所得结果。

## 第12题

``` c
/*
 * floatFloat2Int - Return bit-level equivalent of expression (int) f
 *   for floating point argument f.
 *   Argument is passed as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point value.
 *   Anything out of range (including NaN and infinity) should return
 *   0x80000000u.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 */
int floatFloat2Int(unsigned uf)
{
  unsigned sign, frac, mantissa;
  int exp, bias, e, result;
  sign = uf >> 31;
  exp = (uf >> 23) & 0xFF;
  frac = uf & 0x7FFFFF;
  bias = 127;
  e = exp - bias;
  // Check for out of range (exp too large or NaN/infinity)
  if (exp == 0xFF || e > 30)
    return 0x80000000u;
  // Check for values less than 1 (exp too small)
  if (e < 0)
    return 0;
  // Add implicit leading 1 to fraction
  mantissa = frac | 0x800000;
  // Shift mantissa to get integer value
  if (e >= 23)
    result = mantissa << (e - 23);
  else
    result = mantissa >> (23 - e);
  // Apply sign
  if (sign)
    result = -result;
  return result;
} // dlc:bits.c:404:floatFloat2Int: 16 operators
```

- **解析浮点数结构**：提取符号位 `sign`、指数位 `exp` 和尾数位 `frac`。
- **边界检查**：
  - 若 `exp` 为全 1（NaN 或无穷大），或 `exp` 减去偏移量（127）后大于 30（超出 32 位整数范围），返回 0x80000000u。
  - 若 `exp` 减去偏移量后小于 0（数值小于 1），返回 0（即向0舍入）
- **计算有效数字**：`frac` 补全隐含的前导 1，形成 24 位有效数字。
- **规格化转换**：根据指数值 `e` 调整有效数字的移位方向（左移扩大或右移缩小），得到整数部分。
  - 左移（`e ≥23`）：用于指数较大的浮点数，通过扩大有效数字得到大整数。
  - 右移（`e <23`）：用于指数较小的浮点数，通过缩小有效数字丢弃小数部分（向0舍入）。

- **应用符号**：根据符号位对结果取反（若为负数），最终返回转换后的整数。

## 第13题

``` c
/*
 * floatPower2 - Return bit-level equivalent of the expression 2.0^x
 *   (2.0 raised to the power x) for any 32-bit integer x.
 *
 *   The unsigned value that is returned should have the identical bit
 *   representation as the single-precision floating-point number 2.0^x.
 *   If the result is too small to be represented as a denorm, return
 *   0. If too large, return +INF.
 *
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. Also if, while
 *   Max ops: 30
 */
unsigned floatPower2(int x)
{
  /*
   * Single-precision float has exponent bias 127. For 2.0^x:
   * - If x is too large (exponent exceeds max), return +INF
   * - If x is too small (exponent below denorm range), return 0
   * - Otherwise, construct normalized or denormalized representation
   */
  int max_exp = 127;         // Maximum exponent for normalized
  int min_norm_exp = -126;   // Minimum exponent for normalized
  int min_denorm_exp = -149; // Minimum exponent for denormalized
  // Case 1: Result is too large (exceeds +INF threshold)
  if (x > max_exp)
    return 0x7F800000; // +INF (sign 0, exp all 1s, frac 0)
  // Case 2: Result is too small (below denormalized range)
  if (x < min_denorm_exp)
    return 0;
  // Case 3: Denormalized (between min_denorm_exp and min_norm_exp - 1)
  if (x < min_norm_exp)
  {
    // For denorm: 2^x = (frac / 2^23) × 2^(-126)
    return 1 << (x + 149); // sign 0, exp 0, frac = 2^(x + 149)
  }
  // Case 4: Normalized (between min_norm_exp and max_exp)
  return (x + 127) << 23; // Sign 0, frac 0, exp in exponent field
} // dlc:bits.c:447:floatPower2: 9 operators
```

- **超范围（过大）处理**：单精度浮点数规范指数最大值为 127（对应`2^127`），若`x>127`，结果超出表示上限，返回正无穷（位模式`0x7F800000`，符号位 0 + 指数位全 1 + 尾数位全 0）。

- **超范围（过小）处理**：浮点数非规格化最小指数为 -149（`2^-149 = 2^-126 * 2^-23`，-126 是规格化最小指数，23 是尾数位长度），若`x<-149`，结果超出表示下限，返回 0。

- **非规格化表示（x 在 [-149, -126)）**：此时指数位全 0，指数为默认值-126，通过尾数位存储有效信息：`2^x = (frac / 2^23) × 2^(-126)`，因此可得位模式为 `1 << (x + 149)`。

- **规格化表示（x 在 [-126, 127]）**：符合规格化浮点数规则，指数位值为`x+127`（加偏移量 127），尾数位全 0（因`2.0^x`无小数部分，隐含整数 1 已涵盖有效信息），最终位模式为`(x+127) << 23`（符号位 0 + 计算后指数位 + 尾数位全 0）。
