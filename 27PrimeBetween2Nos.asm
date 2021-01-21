; program to display prime numbers between two numbers 

include 'emu8086.inc'

print 'Enter tha a: '
call scan_num 
mov a, cx 

gotoxy 0, 1

print 'Enter the b: '
call scan_num 
mov b, cx

gotoxy 0, 2

print 'The prime numbers are: '

labelA:          ; loop labelA for all the numbers [a,b]
    mov ax, a
    cmp ax, b       
    jg exit      ; if a > b then exit 
    mov bx, 2    ; move 2 into bx register 
    labelB:
        cmp bx, a   ; if bx == a then it is prime
        je prime
        cmp a, 1    ; if a <= 1 then it is not prime
        jle labelC 
        mov ax, a
        mov dx, 0
        div bx 
        cmp dx, 0
        je labelC    ; remainder is 0, so it is not prime
        inc bx
        jmp labelB   ; loop labelB for all values of bx < a
    
prime:
    mov ax, bx  
    call print_num
    print ', '
    labelC:          ; a++ and jump to labelA
        inc a         
        jmp labelA  
     
exit:
    hlt    
    
a dd ? 
b dd ?
define_scan_num 
define_print_num
define_print_num_uns