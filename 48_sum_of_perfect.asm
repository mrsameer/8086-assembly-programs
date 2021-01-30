include 'emu8086.inc' 
mov si,0
mov di,4 
loopp: 
cmp list[si],1
je yes
mov cx, list[si] 
dec cx
mov bx, 1
loop0:
    mov ax, list[si]
    mov dx, 0
    div bx
    cmp dx, 0
    je ad 
loop1:
    inc bx
    loop loop0
mov ax, sum
cmp ax, list[si]
je yes 
loop2:
add si,2
dec di
jnz loopp 
mov ax, asum
call print_num_uns
hlt        
ad:
  add sum, bx
  jmp loop1
yes:
    mov ax, asum
    add ax, list[si] 
    mov asum,ax
    jmp loop2       
define_print_num_uns
define_scan_num  
sum dw 0
list dw 1,1,6,4 
asum dd 0