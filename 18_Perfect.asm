include 'emu8086.inc'

print 'Enter the number: '
call scan_num 
mov num, cx
mov ax, cx 
gotoxy 0,1

mov bx, 1    ; used to divide number present in ax register 
A:              ; extract proper divisor and add it to sum
    cmp bx, num
    jge B          ; if bx register value  >= num then exit 
    mov ax, num 
    mov dx, 0
    div bx 
    cmp dx, 0       ; if remainder is then it is a proper divisor
    je C 
    D:
      inc bx
      jmp A

C:
   mov ax, sum      ; add divisor to sum
   add ax, bx
   mov sum, ax
   jmp D    

B:
    mov ax, num     ; check whether sum == num
    cmp ax, sum
    je true 
    print 'Not Perfect Number'
    hlt

true:
    print 'Perfect Number'
    hlt   
     
num dd ?   
sum dd 0
define_scan_num