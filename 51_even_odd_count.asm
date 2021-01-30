; program to count the even and odd numbers present in an array

include 'emu8086.inc'
mov ax, N
mov bx, 2
mul bx   
mov N, ax
mov si, 0 
labelA:
    cmp si, N
    jge exit   
    mov ax, array[si]
    mov dx, 0
    div bx 
    cmp dx, 0
    je inceven
    inc odd
    labelB:
        add si, 2
        jmp labelA 

inceven:
    inc even 
    jmp labelB    

exit:       
    mov ax, 0
    print 'The count of even numbers = '
    mov al, even 
    call print_num_uns
    printn
    print 'The count of odd numbers is = '  
    mov al, odd
    call print_num_uns
    hlt    

N dd 5
array dw N DUP(1,2,3,4,5)
even db 0
odd db 0    
define_print_num_uns