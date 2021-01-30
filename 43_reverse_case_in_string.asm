; program to reverse the case of the characters in a string 

include 'emu8086.inc'

mov bl, len 
mov si, 0
labelA:
    cmp si, bx 
    je exit 
    cmp str[si], 'a'
    jge lowercase   
    labelB:
        cmp str[si], 'A'
        jge uppercase 
    labelC:
        inc si
        jmp labelA    
hlt
        
uppercase:
    cmp str[si], 'Z'
    jle toLowercase
    jmp labelC
            
toLowercase:  
    mov dx, 0
    mov dl, str[si] 
    add dl, 32d
    mov ah, 2h
    int 21h
    jmp labelC
    
lowercase:
    cmp str[si], 'z'
    jle toUppercase 
    jmp labelB

toUppercase: 
    mov dl, 0
    mov dl, str[si]
    sub dl, 32d 
    mov ah, 2h
    int 21h
    jmp labelB        
    
exit:
hlt    

str db "HelLoWoRlD"
len db $-str