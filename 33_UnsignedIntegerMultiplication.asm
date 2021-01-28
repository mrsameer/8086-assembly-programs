; program for unsigned integer multiplication

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
    shr b, 1    
    jc labelAdd ; if lsb of b == 1, then add multiplicand to accumulator's left most side (to ah)
    labelB:
        shr ax, 1  ; right shift accumulator by 1 (multiplier also included)
    loop labelA   

call print_num
hlt

labelAdd:
    add ah, a
    jmp labelB    

a db ?
b db ?
define_scan_num  
define_print_num 
define_print_num_uns
