; Using Prechin A2 learning board with STC89C52RC

P0 equ 80H
P2 equ 0A0H
SP equ 81H

start:
    mov SP, #7FH ; Init Stack Pointer
mainloop:
    mov a, #7
    acall select_digit
    mov a, #1
    acall display_num
    
    mov a, #6
    acall select_digit
    mov a, #2
    acall display_num
    
    mov a, #5
    acall select_digit
    mov a, #3
    acall display_num
    
    mov a, #4
    acall select_digit
    mov a, #4
    acall display_num
    
    mov a, #3
    acall select_digit
    mov a, #10 ; A
    acall display_num
    
    mov a, #2
    acall select_digit
    mov a, #11 ; b
    acall display_num
    
    mov a, #1
    acall select_digit
    mov a, #12 ; c
    acall display_num
    
    mov a, #0
    acall select_digit
    mov a, #13 ; d
    acall display_num
    
    sjmp mainloop

display_num:
    ; a as input
    mov dptr, #seg_table
    movc a, @a+dptr
    mov P0, a ; Display
    ret

select_digit:
    ; a as input
    mov P0, #00H ; Clear seg output to avoid ghosting
    mov dptr, #digit_table
    movc a, @a+dptr
    mov P2, a ; Select
    ret

seg_table:
    db 03FH, 006H, 05BH, 04FH, 066H ; 0 to 4
    db 06DH, 07DH, 007H, 07FH, 06FH ; 5 to 9
    db 077H, 07CH, 058H, 05EH, 079H, 071H ; A to F
    
digit_table:
    db 0E3H, 0E7H, 0EBH, 0EFH ; 0 to 3
    db 0F3H, 0F7H, 0FBH, 0FFH ; 4 to 7

end