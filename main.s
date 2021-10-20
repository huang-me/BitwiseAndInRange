.data
left:     .word 23
right:    .word 29
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