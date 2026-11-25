; Using Prechin A2 learning board with STC89C52RC

BUZ equ 0A5H ; P2.5 Pin

start:
    acall delay
    acall buzz
    sjmp start
    
delay:
    mov r0, #0FFH
delay_outer:
    mov r1, #0FFH
delay_inner:
    djnz r1, delay_inner
    djnz r0, delay_outer
    ret

buzz:
    mov r0, #08H
buzz_outer:
    mov r1, #0FFH
buzz_mid:
    cpl BUZ
    mov r2, #30H
buzz_inner:
    djnz r2, buzz_inner
    djnz r1, buzz_mid
    djnz r0, buzz_outer
    clr BUZ
    ret
    
end