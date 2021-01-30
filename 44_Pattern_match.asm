; program to find the index of the given substring in a string 

include 'emu8086.inc'

mov bl, strlen
sub bl, substrlen
mov si, 0
labelA:
     cmp si, bx 
     jg exit
     mov di, 0  
     mov dx, si
     labelB:
        mov cl, substrlen 
        cmp di, cx
        je found   
        mov al, str[si]
        cmp al, substr[di]
        jne labelC
        inc di 
        inc si
        jmp labelB 
    labelC:
        mov si, dx
        inc si
        jmp labelA    
    
found:
    mov ax, dx   
    print 'Found at index: '
    call print_num        
    hlt    

exit:
    print 'Not found'     

str db "hello world"
strlen db $-str
substr db "world"
substrlen db $-substr 
define_print_num
define_print_num_uns