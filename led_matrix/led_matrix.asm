; For use with Prechin 51 Experiment Board with STC89C52
; Using on-board LED 8x8 matrix, with 74HC595 as col control
; P0 as row control, P3.6 as SRCLK, P3.5 as RCLK, P3.4 as SER

.module led_matrix

.equ _sp_init_addr, 0x7F
.equ _stack_size, 0xFF - _sp_init_addr

.equ SRCLK, 0xB6 ; P3.6, bit addr
.equ RCLK, 0xB5 ; P3.5, bit addr
.equ SER, 0xB4 ; P3.4, bit addr

.equ P0, 0x80 ; Data addr

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

