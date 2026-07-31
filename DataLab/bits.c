/*
 * CS:APP Data Lab
 *
 * <Please put your name and userid here>
 *
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:
 
  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>
    
  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.

 
  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting if the shift amount
     is less than 0 or greater than 31.


EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implement floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants. You can use any arithmetic,
logical, or comparison operations on int or unsigned data.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to 
     check the legality of your solutions.
  2. Each function has a maximum number of operations (integer, logical,
     or comparison) that you are allowed to use for your implementation
     of the function.  The max operator count is checked by dlc.
     Note that assignment ('=') is not counted; you may use as many of
     these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies 
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 * 
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce 
 *      the correct answers.
 */

#endif
// 1
/*
 * bitXor - x^y using only ~ and &
 *   Example: bitXor(4, 5) = 1
 *   Legal ops: ~ &
 *   Max ops: 14
 *   Rating: 1
 */
int bitXor(int x, int y)
{
  /* XOR is (x & ~y) | (~x & y), but use ~ and & to simulate | via De Morgan */
  return ~(~(x & ~y) & ~(~x & y));
}
/*
 * tmin - return minimum two's complement integer
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 *   Rating: 1
 */
int tmin(void)
{
  /* TMin is 0x80000000, which is 1 shifted left by 31 */
  return 1 << 31;
}
// 2
/*
 * isTmax - returns 1 if x is the maximum, two's complement number,
 *     and 0 otherwise
 *   Legal ops: ! ~ & ^ | +
 *   Max ops: 10
 *   Rating: 1
 */
int isTmax(int x)
{
  /* TMax + 1 = TMin, and TMax ^ TMin = all 1s. Also handle x = -1 edge case */
  int x_plus_1 = x + 1;
  int xor = x ^ x_plus_1;
  int not_xor = ~xor;
  int is_neg1 = !(x_plus_1);
  return !(not_xor | is_neg1);
}
/*
 * allOddBits - return 1 if all odd-numbered bits in word set to 1
 *   where bits are numbered from 0 (least significant) to 31 (most significant)
 *   Examples allOddBits(0xFFFFFFFD) = 0, allOddBits(0xAAAAAAAA) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 2
 */
int allOddBits(int x)
{
  /* Create mask with odd bits set (0xAAAAAAAA), check x & mask == mask */
  int mask = 0xAA;
  mask |= mask << 8;
  mask |= mask << 16;
  return !((x & mask) ^ mask);
}
/*
 * negate - return -x
 *   Example: negate(1) = -1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
int negate(int x)
{
  /* Two's complement negation: ~x + 1 */
  return ~x + 1;
}
// 3
/*
 * isAsciiDigit - return 1 if 0x30 <= x <= 0x39 (ASCII codes for characters '0' to '9')
 *   Example: isAsciiDigit(0x35) = 1.
 *            isAsciiDigit(0x3a) = 0.
 *            isAsciiDigit(0x05) = 0.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 3
 */
int isAsciiDigit(int x)
{
  /* Check x >= 0x30 and x <= 0x39 */
  int lower = x + (~0x30 + 1); // x - 0x30
  int upper = 0x39 + (~x + 1); // 0x39 - x
  return !(lower >> 31) & !(upper >> 31);
}
/*
 * conditional - same as x ? y : z
 *   Example: conditional(2,4,5) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3
 */
int conditional(int x, int y, int z)
{
  /* Generate mask: 0xFFFFFFFF if x != 0, 0x00000000 otherwise */
  int mask = ~(!!x) + 1;
  return (y & mask) | (z & ~mask);
}
/*
 * isLessOrEqual - if x <= y  then return 1, else return 0
 *   Example: isLessOrEqual(4,5) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isLessOrEqual(int x, int y)
{
  /* Compare the sign of x and y, handle x_sign & !y_sign
     if x & y have same sign, handle y - x >= 0 */
  int x_sign = x >> 31;
  int y_sign = y >> 31;
  int sign_eq = !(x_sign ^ y_sign);
  // Case1: different signs, x <= y when x is neg
  int sign_diff_less = x_sign & !y_sign;
  // Case2: same signs, x <= y when y - x >= 0
  int y_minus_x = y + (~x + 1);
  int non_neg = !(y_minus_x >> 31);
  int same_sign_less_or_eq = sign_eq & non_neg;
  return sign_diff_less | same_sign_less_or_eq;
}
// 4
/*
 * logicalNeg - implement the ! operator, using all of
 *              the legal operators except !
 *   Examples: logicalNeg(3) = 0, logicalNeg(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4
 */
int logicalNeg(int x)
{
  /* 0 and -0 have same sign bit. For x=0, ~x +1 =0, so sign bit is 0. */
  return ((x | (~x + 1)) >> 31) + 1;
}
/* howManyBits - return the minimum number of bits required to represent x in
 *             two's complement
 *  Examples: howManyBits(12) = 5
 *            howManyBits(298) = 10
 *            howManyBits(-5) = 4
 *            howManyBits(0)  = 1
 *            howManyBits(-1) = 1
 *            howManyBits(0x80000000) = 32
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 90
 *  Rating: 4
 */
int howManyBits(int x)
{
  /* Find position of highest set bit */
  int sign, b16, b8, b4, b2, b1, b0;
  sign = x >> 31;
  x = (sign & ~x) | (~sign & x); // Convert to positive if x is negative
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
}
// float
/*
 * floatScale2 - Return bit-level equivalent of expression 2*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
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
}
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
 *   Rating: 4
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
  {
    return 0x80000000u;
  }
  // Check for values less than 1 (exp too small)
  if (e < 0)
  {
    return 0;
  }
  // Add implicit leading 1 to fraction
  mantissa = frac | 0x800000;
  // Shift mantissa to get integer value
  if (e >= 23)
  {
    result = mantissa << (e - 23);
  }
  else
  {
    result = mantissa >> (23 - e);
  }
  // Apply sign
  if (sign)
  {
    result = -result;
  }
  return result;
}
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
 *   Rating: 4
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
  {
    return 0x7F800000; // +INF (sign 0, exp all 1s, frac 0)
  }
  // Case 2: Result is too small (below denormalized range)
  if (x < min_denorm_exp)
  {
    return 0;
  }
  // Case 3: Denormalized (between min_denorm_exp and min_norm_exp - 1)
  if (x < min_norm_exp)
  {
    // For denorm: 2^x = (frac / 2^23) × 2^(-126)
    return 1 << (x + 149); // sign 0, exp 0, frac = 2^(x + 149)
  }
  // Case 4: Normalized (between min_norm_exp and max_exp)
  return (x + 127) << 23; // Sign 0, frac 0, exp in exponent field
}
