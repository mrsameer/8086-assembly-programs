include 'emu8086.inc'

print 'Enter number: '
call scan_num 
gotoxy 0, 1
mov num, cx  ; copy data from cx register into num
mov temp, cx ; copy data from counter regiser (cx) into temp

mov bx, 10              ; to divide temp by 10 everytime to obtain it's last digit
loop0:
    cmp temp, 0         ; exits loop if temp = 0
    je exit 
    mov ax, temp            
    mov dx, 0
    div bx  
    mov temp, ax
    mov rem, dx
    mov ax, rem
    mul rem
    mul rem
    add ax, sum
    mov sum, ax
    jmp loop0

exit:
    mov ax, sum
    cmp ax, num         ; if cubes of digits sum = num then it is armstrong 
    je yes
    print 'Not an Armstrong number'
    hlt

yes:
    print 'Armstrong number'          

sum dd 0  ; variable of double word data type initialized to 0
temp dd ?  ; variable of double word data type
num dd ?  ; variable of double word data type   
rem dd ?  ; variable of double word data type
define_scan_num
