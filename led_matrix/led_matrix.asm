; For use with Prechin 51 Experiment Board with STC89C52
; Using on-board LED 8x8 matrix

.module led_matrix

.equ _sp_init_addr, 0x7F
.equ _stack_size, 0xFF - _sp_init_addr

.area REG (ABS, DATA) ; Ensure reg area safe from being overlapped by linker
.org 0x00
.ds 0x08 ; Only covers register group 0

.area STACK (ABS, DATA)
.org _sp_init_addr + 1
.ds _stack_size

.area CSEG (ABS, CODE)
.org 0x0000

start:
    sjmp startup

.org 0x0030

startup:
    mov sp, #_sp_init_addr ; Stack Pointer initialize

main:

