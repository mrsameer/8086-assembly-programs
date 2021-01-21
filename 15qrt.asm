include 'emu8086.inc'

print 'Enter the number(only number to which perfect square root exists): '
call scan_num
gotoxy 0, 1 
mov num, cx

mov ax, 0
loop0:
    cmp ax, num
    jge exit
    inc i
    mov ax, i
    mul ax
    jmp loop0

exit:  
    mov ax, i
    call print_num
    
num dd ?   
i dd 0
define_scan_num
define_print_num
define_print_num_uns