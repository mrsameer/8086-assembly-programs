; program to implement selection sort 

include 'emu8086.inc'  

print 'Enter the number of elements: '
call scan_num 
mov N, cx

printn
printn 'Enter the elements'
mov cx, 0
mov si, 0
loopInput:
    cmp si, N
    je gotoSort  
    call scan_num
    mov array[si], cl 
    printn
    inc si
    jmp loopInput
    
gotoSort:    
mov dx, N
dec dx
sort:
    mov si, 0
    labelA:  
        cmp si, dx
        je printarr
        mov bp, si  ; bp holds minimum index 
        mov di, si
        inc di
        labelB:
            cmp di, N
            je labelC 
            mov al, array[bp]
            cmp al, array[di]
            jg update
            labelB1:
                inc di
                jmp labelB
            labelC:   
                mov al, array[bp]
                mov bl, array[si]
                mov array[si], al  
                mov array[bp], bl
                inc si
                jmp labelA
update:
    mov bp, di
    jmp labelB1
           
 
printarr:  
    mov si, 0
    mov ax, 0 
    loopA:
    cmp si, N
    je exit 
    mov al, array[si]
    call print_num 
    print ' '   
    inc si
    jmp loopA  
    
exit:
    hlt    
N dd ?
array db N DUP(?)
define_print_num
define_print_num_uns 
define_scan_num
