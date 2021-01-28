; Restoring division algorithm 

include 'emu8086.inc'

print 'Enter the a: '    
call scan_num 
mov a, cl

printn
print 'Enter the b: '
call scan_num 
mov b, cl

mov ah, 0
mov al, a           ; dividend into al
mov cx, 8d          ; considering as 8 bit numbers. Need to iterate 8 times
labelA:
    shl ax, 1       ; left shift accumulator by 1 (divisor is included in the accumulator)
    sub ah, b      ; try to sub b from ah (extreme left of the accumulator)
    cmp ah, 0
    jl restore      ; if result = negative then it is unsuccessful and we need to restore it
    add al, 1       ; if it is successful we need to add 1 to the lsb in al (it means quotient is 1)
    labelB:
        loop labelA

mov bx, ax
mov ax, 0
printn
print 'The quotient is: '  
mov al, bl
call print_num
printn
print 'The remainer is: '
mov ax, 0
mov al, bh
call print_num
hlt      
    
restore:
    add ah, b
    jmp labelB    


a db ?
b db ?
define_scan_num 
define_print_num
define_print_num_uns