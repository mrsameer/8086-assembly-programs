; program to find the sum of digits in a number

include 'emu8086.inc'

print 'Enter the number: '
call scan_num               ; store user input in cx register 
mov ax, cx                  ; copy data from cx register into ax register 

gotoxy 0, 1                 ; places the cursor at location (0,1) in the console

mov bx, 10

A:                          ; loop the label A as long as ax != 0
   cmp ax, 0
   je exit                  ; if data in ax register is 0 then go to lable exit
   mov dx, 0
   div bx                   ; divide by 10 and remainder gets stored into dx register and quotient in ax register
   add sum,dx               ; sum += dx
   jmp A

exit:
    mov ax, sum             ; copy data from sum into ax register 
    call print_num          ; prints whatever data present in ax register   
     
sum dd 0                    ; declaration & definition of variable sum of double word data type     
define_scan_num 
define_print_num 
define_print_num_uns