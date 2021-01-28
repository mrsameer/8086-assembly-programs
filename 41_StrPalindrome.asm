; program to check whether the string is palindrome or not 

include 'emu8086.inc' 

mov si, 0
mov al, len 
mov di, ax
dec di  ; last character index = len-1
labelA:
    cmp si, di
    jg true
    mov al, str[si]  
    cmp al, str[di]
    jne false  
    inc si
    dec di
    jmp labelA

false:
    print 'Not Palindrome'
    hlt    
    
true:
    print 'Palindrome'
            
hlt

str db "bananab$"
len db $-str-1   ; -1 so as to remove $ count in length 
define_print_num
define_print_num_uns