; Using Prechin A2 learning board with STC89C52RC

P0 equ 80H

start:
    mov a, #00H
mainloop:
    inc a ; Increase the number to show by one
;    da a ; Adjust 0AH to 10H, not needed when displaying in HEX
    anl a, #0FH ; Mask off high 4 bits to loopback to 00H
    acall display_num
    acall delay
    sjmp mainloop
    
delay:
    mov r0, #0FFH
delay_outer:
    mov r1, #0FFH
delay_inner:
    djnz r1, delay_inner
    djnz r0, delay_outer
    ret
    
display_num:
    ; a as input, left unchanged upon return
    mov r0, a
    mov dptr, #seg_table
    movc a, @a+dptr
    mov P0, a ; Display
    mov a, r0
    ret
    
seg_table:
    db 03FH, 006H, 05BH, 04FH, 066H ; 0 to 4
    db 06DH, 07DH, 007H, 07FH, 06FH ; 5 to 9
    db 077H, 07CH, 058H, 05EH, 079H, 071H ; A to F

end