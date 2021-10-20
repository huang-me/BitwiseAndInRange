# Lab1: RV32I Simulator
###### tags: `Computer Architecture`
### Leetcode 201. Bitwise AND of Numbers Range
Given two integers left and right that represent the range [left, right], return the bitwise AND of all numbers in this range, inclusive.
### Assembly code
```cpp=
.data
left:     .word 23
right:    .word 23
str1:     .string "Bitwise AND of Numbers from "
str2:     .string " to "
str3:     .string " is "

.text
main:
    lw   a0, left
    lw   s0, left
    lw   a1, right
    lw   s1, right
    add  t0, x0, x0
    
shiftAndCnt:
    bge   a0, a1, printAndExit
    srli  a0, a0, 1
    srli  a1, a1, 1
    addi  t0, t0, 1
    j     shiftAndCnt
    
printAndExit:
    sll t0, a0, t0
    
    la a0, str1
    li a7, 4
    ecall
    mv a0, s0
    li a7, 1
    ecall
    la a0, str2
    li a7, 4
    ecall
    mv a0, s1
    li a7, 1
    ecall
    la a0, str3
    li a7, 4
    ecall
    mv a0, t0
    li a7, 1
    ecall
    
    li a7, 10
    ecall
```

### Examples
|           |  MSB  |       |     | LSB |
|:---------:|:-----:|:-----:|:---:|:---:|
| **left**  |   1   |   1   |  0  |  0  |
| **right** |   1   |   1   |  1  |  1  |

**Concept:** 
The value changes from least significant bit and stop when two values are same, in the such process the bits never change is the highest consecutive set bits, which means that the result is equal to highest consecutive set bits.  
**Test:**
The result of the input [12, 15] should be 12, since both number have 2 two consecutive set bit in the front.  
**Explanation:**  
10-13: load value of left, right into register.  
14: clear `t0` in order to count shifts.

17: check the equality of left and right to decide whether stop execution or not.  
18-19: shift left and right logically for one bit.  
20: increment `t0`
21: jump backward to check if left and right equal now.  
