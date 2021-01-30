include 'emu8086.inc' 
mov dx, count
mov si, 0
loop0:
    mov freq[si], 1   
    mov di, si
    add di, 2       
loop1:
    mov ax, list[si]
    cmp ax, list[di]
    je addfreq 
loop2: 
     add di,2
     cmp di,8 ; count*2 for dw
     jle loop1 
     add si, 2
     dec dx
     jnz loop0
print 'Characters and their frequencies: ' 
print 0AH
print 0DH
mov cx, count  
mov si, 0
display:
    cmp list[si], 0
    je skip  
    mov ax, list[si]
    call print_num_uns 
    print ' '
    mov ax, freq[si] 
    call print_num_uns
    print 0AH
    print 0DH
   moveon:
        add si, 2
        loop display    
                   
hlt        
skip:
    jmp moveon         
hlt       
addfreq:
    inc freq[si]
    mov list[di], 0
    jmp loop2            
            

define_print_num_uns
list dw 1,2,12,12,1 
freq dw ?, ?, ?, ?,?   
count equ 5