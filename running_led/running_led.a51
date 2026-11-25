; Using Prechin A2 learning board with STC89C52RC
P2 equ 0A0H

start:
    mov P2, #0FFH
start_loop:
    acall delay
    mov a, P2
    rrc a
    mov P2, a
    sjmp start_loop

delay:
    mov r0, #0FFH
delay_outer:
    mov r1, #0FFH
delay_inner:
    djnz r1, delay_inner
    djnz r0, delay_outer
    ret

end