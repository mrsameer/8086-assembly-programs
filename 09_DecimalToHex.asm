include 'emu8086.inc'

print 'Enter the number: '
call scan_num 
gotoxy 0, 1            ; goto coordinate 0,1
mov ax, cx             ; copy data from register cx into ax   

mov bx, 16d             ; move decimal 16 into register bx
loop0:
    cmp ax, 0          
    je exit    
    mov dx, 0          ; empty the dx register
    div bx
    push dx            ; push remainder on to the stack 
    inc c              ; increment c 
    jmp loop0

exit:  
    cmp c, 0           ; if input is 0 we do not print anything and halt the program
    je halt
    mov cx, c          ; mov value of c into cx register 
    loop1:
        pop ax         ; pop value from the peak of the stack and store in ax 
        call print_num
        loop loop1     ; loop the loop1   

halt:
    hlt
c dd 0  ; define a variable c with data type as double double and intial value 0
define_scan_num  
define_print_num
define_print_num_uns
