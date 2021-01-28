include 'emu8086.inc'

print 'Enter the number: '
call scan_num     
mov num, cx
gotoxy 0, 1 ; move the cursor to coordinate (0,1)

; extract every digit from the num and place it on to the stack and as well as keep track of the length of the num
mov ax, num  
mov bx, 10d  ; move 10 into bx which is used to divide num
labelA: 
    cmp ax, 0
    je labelB  ; if ax is 0 then go to label labelB
    mov dx, 0
    div bx
    push dx
    inc length
    jmp labelA

; pop every from the stack and compare it to the digits in the number until length/2    
labelB:
    mov ax, length 
    mov dx, 0
    mov bx, 2d 
    div bx 
        
    ; now extract digit from num and pop a element from stack and compare both     
    mov cx, ax 
    mov ax, num 
    mov bx, 10d
    labelC:
         pop temp 
         mov dx, 0 
         div bx 
         cmp dx, temp 
         jne false 
         loop labelC
         
    print 'Palindrome'
    hlt 
false:
    print 'Not a Palindrome'
    hlt     
    
length dd 0 ; length variable of double word data type and it is initialized to 0
num dd ?  ; declared variable of double word data type 
temp dd ?

define_scan_num