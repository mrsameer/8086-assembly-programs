; program to print the palindromes present in an array  
include 'emu8086.inc'
mov ax, N
mov bx, 2
mul bx
mov N, ax
mov si, 0
labelA:
    cmp si, N
    je exit
    mov ax, array[si]
    mov bl, ah
    mov bh, al
    mov cl, bh
    mov ch, bl
    rol cl, 4
    rol ch, 4
    cmp bx, cx
    je true 
    labelB:
        add si, 2
        jmp labelA

true:
    call print_num_uns
    printn
    jmp labelB
        
exit:
    hlt     
N dd 4 
array dw N dup(1221h, 0000h, 1234h, 1231h)
define_print_num_uns