; Using Prechin A2 learning board with STC89C52RC

K0 equ 0B1H
K1 equ 0B0H
K2 equ 0B2H
K3 equ 0B3H

P0 equ 80H
P2 equ 0A0H
P3 equ 0B0H

dseg at 20H
k0_sample: ds 1
k1_sample: ds 1
k2_sample: ds 1
k3_sample: ds 1

cseg
start:
    mov P0, #00H ; Clear output to 7-seg
    mov P3, #0FFH ; Enable digital read from P3
    mov k0_sample, #0
    mov k1_sample, #0
    mov k2_sample, #0
    mov k3_sample, #0
mainloop:
    acall delay
    acall check_key
    cpl a
    mov P2, a
    sjmp mainloop
    
delay:
    ; Approx. 0.5ms @ ~11.0592-12MHz
    mov r0, #0FFH
delay_loop:
    djnz r0, delay_loop
    ret
    
check_key:
    ; Returns acc.3:0 as key 3:0
    ; Clobbers c, r0
    mov c, K0
    jnc k0_down
    mov k0_sample, #0 ; Resets combo
    sjmp k0_end
k0_down:
    mov r0, k0_sample
    cjne r0, #10, k0_notmax
    sjmp k0_end
k0_notmax:
    inc k0_sample
k0_end:
    mov c, K1
    jnc k1_down
    mov k1_sample, #0 ; Resets combo
    sjmp k1_end
k1_down:
    mov r0, k1_sample
    cjne r0, #10, k1_notmax
    sjmp k1_end
k1_notmax:
    inc k1_sample
k1_end:
    mov c, K2
    jnc k2_down
    mov k2_sample, #0 ; Resets combo
    sjmp k2_end
k2_down:
    mov r0, k2_sample
    cjne r0, #10, k2_notmax
    sjmp k2_end
k2_notmax:
    inc k2_sample
k2_end:
    mov c, K3
    jnc k3_down
    mov k3_sample, #0 ; Resets combo
    sjmp k3_end
k3_down:
    mov r0, k3_sample
    cjne r0, #10, k3_notmax
    sjmp k3_end
k3_notmax:
    inc k3_sample
k3_end:
    clr a
    mov r0, k0_sample
    cjne r0, #10, k0_not_pressed
    add a, #1
k0_not_pressed:
    mov r0, k1_sample
    cjne r0, #10, k1_not_pressed
    add a, #2
k1_not_pressed:
    mov r0, k2_sample
    cjne r0, #10, k2_not_pressed
    add a, #4
k2_not_pressed:
    mov r0, k3_sample
    cjne r0, #10, k3_not_pressed
    add a, #8
k3_not_pressed:
    ret

select_digit:
    ; a as input
    mov P0, #00H ; Clear seg output to avoid ghosting
    mov dptr, #digit_table
    movc a, @a+dptr
    mov P2, a ; Select
    ret

digit_table:
    db 0E3H, 0E7H, 0EBH, 0EFH ; 0 to 3
    db 0F3H, 0F7H, 0FBH, 0FFH ; 4 to 7
    
end