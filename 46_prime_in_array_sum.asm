; program to find sum of prime numbers present in an array
include 'emu8086.inc'
mov si, 0  
mov cx, count
start:
cmp list[si], 1
jle yes  
cmp list[si], 2
je exit 
mov bx, 2 
mov ax, list[si]
loop0:
   cmp bx, list[si]
   je exit
   mov dx, 0
   div bx 
   mov ax, list[si]
   inc bx
   cmp dx, 0
   je yes
   jmp loop0 
loop1:   
   add si, 2
   dec cx
   jnz start 
hlt
yes: 
    jmp loop1
hlt          
exit:
    mov ax, list[si]
    call print_num_uns
    printn   
    jmp loop1 
define_scan_num
define_print_num_uns
list dw 5,17,9,1,0
count equ 5 