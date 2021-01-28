include 'emu8086.inc'

print 'Enter the number: '
call scan_num
mov ax, cx 

gotoxy 0, 1

mov bx, 10
loop0:
    cmp ax, 0
    je exit
    mov dx, 0
    div bx
    mov temp, ax
    mov ax, dx
    call print_num
    mov ax, temp
    jmp loop0
    
exit:
    hlt

temp dd ?  
define_print_num
define_print_num_uns      
define_scan_num