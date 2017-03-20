---
layout: post
comments: true
title: operator precedence
tags: 
---
## JavaScript Operator Precedence Values

Value | Operator | Description            | Example
----- | -------- | ---------------------- | --------------
19    | ( )      | Expression grouping    | (3 + 4)
      |          |                        |
18    | .        | Member                 | person.name
18    | []       | Member                 | person["name"]
      |          |                        |
17    | ()       | Function call          | myFunction()
17    | new      | Create                 | new Date()
      |          |                        |
16    | ++       | Postfix Increment      | i++
16    | --       | Postfix Decrement      | i--
      |          |                        |
15    | ++       | Prefix Increment       | ++i
15    | --       | Prefix Decrement       | --i
15    | !        | Logical not            | !(x==y)
15    | typeof   | Type                   | typeof x
      |          |                        |
14    | \*       | Multiplication         | 10 * 5
14    | /        | Division               | 10 / 5
14    | %        | Modulo division        | 10 % 5
14    | \**      | Exponentiation         | 10 ** 2
      |          |                        |
13    | +        | Addition               | 10 + 5
13    | -        | Subtraction            | 10 - 5
      |          |                        |
12    | <<       | Shift left             | x << 2
12    | >>       | Shift right            | x >> 2
12    | >>>      | Shift right (unsigned) | x >>> 2
      |          |                        |
11    | <        | Less than              | x < y
11    | <=       | Less than or equal     | x <= y
11    | >        | Greater than           | x > y
11    | >=       | Greater than or equal  | x >= y
      |          |                        |
10    | ==       | Equal                  | x == y
10    | ===      | Strict equal           | x === y
10    | !=       | Unequal                | x != y
10    | !==      | Strict unequal         | x !== y
      |          |                        |
6     | &&       | Logical and            | x && y
5     | ||       | Logical or             | x || y
      |          |                        |
3     | =        | Assignment             | x = y
3     | +=       | Assignment             | x += y
3     | -=       | Assignment             | x -= y
3     | \*=      | Assignment             | x *= y
3     | %=       | Assignment             | x %= y
3     | <<=      | Assignment             | x <<= y
3     | >>=      | Assignment             | x >>= y
3     | >>>=     | Assignment             | x >>>= y
3     | &=       | Assignment             | x &= y
3     | ^=       | Assignment             | x ^= y
3     | |=       | Assignment             | x |= y

Pale red entries indicates experimental or proposed technology (ECMASScript 2016 or ES7)

Expressions in parentheses are fully computed before the value is
used in the rest of the expression.

