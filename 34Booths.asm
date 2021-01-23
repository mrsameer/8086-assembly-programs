; program for signed integer multiplication (Booth's algorithm)

include 'emu8086.inc'

print 'Enter the a: '    
call scan_num 
mov a, cl

printn
print 'Enter the b: '
call scan_num 
mov b, cl

printn
print 'axb=: '

mov ah, 0       ; move 0 into al which acts as accumulator
mov al, b       ; move multiplier into ah 

mov cx, 8d      ; #of steps = 8 (for 8 bit numbers)
labelA:
    mov bx, ax
    shr bx, 1
    jc labelSub   ; for 0(q) to 1(lsb of b) transition sub  Multiplicand from ah
    jmp labelAdd  ; for 1 to 0 transition add  Multiplicand to ah
    labelB:
        sar ax, 1  ; right shift accumulator by 1 (multiplier also included) 
        jc incQ    ; if lsb == 1 then make q = 1 else q = 0
        mov q, 0
        labelC:
            loop labelA   

call print_num
hlt

labelAdd:
    cmp q, 1
    jne labelB
    add ah, a
    jmp labelB 

labelSub: 
    cmp q, 0
    jne labelB
    sub ah, a
    jmp labelB
           
incQ:
    move q,1
    jmp labelC
    
a db ?
b db ?
q db 0  ; initially q = 0
define_scan_num  
define_print_num 
define_print_num_uns
