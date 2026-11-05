.module running_led

; .equ P0, 0x80

.area CSEG (ABS, CODE)
.org 0x0000

start:
    ljmp main

    .org 0x0030
main:
    mov sp, #0x7F
    mov a, #0xFE

loop:
    mov P0, a
    lcall delay
    rl a
    sjmp loop

delay:
    mov r2, #0xFF
outer:
    mov r3, #0xFF
inner:
    nop
    djnz r3, inner
    djnz r2, outer
    ret
