; program to count the number of vowels present in a string 

include 'emu8086.inc'

mov bl, len
mov si, 0
labelA:    
    cmp si, bx 
    je exit
    cmp str[si], 'a'
    je vowel  
    cmp str[si], 'e'
    je vowel
    cmp str[si], 'i'
    je vowel
    cmp str[si], 'o'
    je vowel
    cmp str[si], 'u'
    je vowel
    labelB:  
        inc si
        jmp labelA

exit:
    print 'The number of vowels are: '
    mov ax, count 
    call print_num
    hlt    
vowel:
    inc count 
    jmp labelB    

count dd 0
str db "banana"
len db $-str     
define_print_num
define_print_num_uns