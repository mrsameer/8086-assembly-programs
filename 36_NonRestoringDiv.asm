; Non-Restoring division algorithm   (unsigned division)

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
    shl ax, 1       ; left shit accumulator 
    cmp ah, 0
    jl labelAdd     ; if ah < 0 then add ah + divisor
    sub ah, b       ; else sub divisor from ah
    labelB:
        cmp ah, 0
        jl labelC
        add al, 1    ; if successful division then add 1 to msb of al
        labelC:
            loop labelA       
        
cmp ax, 0       ; final time restoring
jg labelResult
add ah, b

labelResult:        
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
        
labelAdd:
    add ah, b
    jmp labelB    
    
a db ?
b db ?   
define_scan_num 
define_print_num
define_print_num_uns