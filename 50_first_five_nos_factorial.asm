; program to find the factorial fo the first five numbers and store in array 
include 'emu8086.inc'
mov si, 0
labelA:
    cmp si, 5
    je exit  
    mov ax, 1
    mov bx, si
    inc bx 
    labelB:
        cmp bx, 1
        je labelC
        mul bx
        dec bx 
        jmp labelB
    
    labelC:
        mov array[si], al
        inc si
        jmp labelA    

exit:
    mov si, 0
    labelPrint:
        cmp si, 5
        je halt  
        mov al, array[si]
        call print_num_uns
        printn
        inc si
        jmp labelPrint
        
halt:
    hlt            

array db 5 dup(?)
define_print_num_uns