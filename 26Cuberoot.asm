; program to find the cube root of the given perfect cube root number 

include 'emu8086.inc'

print 'Enter the number: '
call scan_num               ; user input gets stored in cx register 
mov num,cx                  ; copy data from cx register into num 

gotoxy 0,1                  ; place the cursor at the location (0,1)

mov ax, 0                   ; move data 0 into register ax
mov bx, 0

A:                          ; loop label A until value in ax < num                               
    cmp ax, num 
    je found                ; if ax == num, then perfect cube root exists
    jg notFound             ; if ax > num, then perfect cube root does not exists
    inc bx                  ; bx++
    mov ax, bx 
    mul bx 
    mul bx                  ; multiply thrice 
    jmp A  

found:
    mov ax, bx 
    call print_num
    hlt                     ; terminate the program 

notFound:
    print 'Perfect cubic root does not exits'
    hlt            
                            
num dd ?                    ; declaration of variable num of double word data type
define_scan_num 
define_print_num 
define_print_num_uns    
    