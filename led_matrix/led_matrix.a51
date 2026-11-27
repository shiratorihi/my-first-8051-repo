; Using Prechin A2 learning board with STC89C52RC

SRCLK equ 0B6H ; P3.6
RCLK  equ 0B5H ; P3.5
SER   equ 0B4H ; P3.4

P0 equ 80H
SP equ 81H

start:
    mov SP, #7FH
mainloop:
    mov a, #80H
    acall hc595_load
    mov dptr, #display_data
    mov a, #0
    movc a, @a+dptr
    mov P0, a
    inc dptr
    
    mov a, #40H
    acall hc595_load
    mov dptr, #display_data
    mov a, #1
    movc a, @a+dptr
    mov P0, a
    inc dptr
    
    mov a, #20H
    acall hc595_load
    mov dptr, #display_data
    mov a, #2
    movc a, @a+dptr
    mov P0, a
    inc dptr
    
    mov a, #10H
    acall hc595_load
    mov dptr, #display_data
    mov a, #3
    movc a, @a+dptr
    mov P0, a
    inc dptr
    
    mov a, #08H
    acall hc595_load
    mov dptr, #display_data
    mov a, #4
    movc a, @a+dptr
    mov P0, a
    inc dptr
    
    mov a, #04H
    acall hc595_load
    mov dptr, #display_data
    mov a, #5
    movc a, @a+dptr
    mov P0, a
    inc dptr
    
    mov a, #02H
    acall hc595_load
    mov dptr, #display_data
    mov a, #6
    movc a, @a+dptr
    mov P0, a
    inc dptr
    
    mov a, #01H
    acall hc595_load
    mov dptr, #display_data
    mov a, #7
    movc a, @a+dptr
    mov P0, a
    inc dptr
    
    sjmp mainloop

hc595_load:
    ; Input data to load with a before calling
    ; Clobbers are c
    
    mov c, acc.7
    mov SER, c
    setb SRCLK
    clr SRCLK
    
    mov c, acc.6
    mov SER, c
    setb SRCLK
    clr SRCLK
    
    mov c, acc.5
    mov SER, c
    setb SRCLK
    clr SRCLK
    
    mov c, acc.4
    mov SER, c
    setb SRCLK
    clr SRCLK
    
    mov c, acc.3
    mov SER, c
    setb SRCLK
    clr SRCLK
    
    mov c, acc.2
    mov SER, c
    setb SRCLK
    clr SRCLK
    
    mov c, acc.1
    mov SER, c
    setb SRCLK
    clr SRCLK
    
    mov c, acc.0
    mov SER, c
    setb SRCLK
    clr SRCLK
    
    mov P0, #0FFH ; Clear column output to avoid ghosting
    setb RCLK
    clr RCLK
    
    ret

display_data:
    ; 0 for on, 1 for off
    db 11111111B
    db 10011001B
    db 10011001B
    db 11100111B
    db 11000011B
    db 11000011B
    db 11011011B
    db 11111111B
    
end