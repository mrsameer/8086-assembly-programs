; insertion sort
include 'emu8086.inc'

print 'Enter the number of elements: '
call scan_num 
mov N, cx
               
mov ax, 2     ; move 2 into ax 
mul N
mov N, ax     ; size = N * 2 because dw is word data type which is of 2 bytes

printn  ; carriage return purpose
printn 'Enter the elements into the array: ' 
mov si, 0 
labelA:
     cmp si, N
     je labelAexit
     call scan_num 
     mov array[si], cx 
     printn  ; for carriage return
     add si, 2      ; increment si by 2
     jmp labelA 
        
labelAexit:
     ; outer loop goes from 1 to N-1 
     mov di, 2  ; index of 2nd element 
     labelOuter:
        cmp  di, N
        je exit 
        mov ax, array[di]       ; store key in ax
        mov si, di    ; di stores location of the key 
        sub si, 2     ; si contains location prior to that of key 
        labelInner:
            cmp si, 0
            jl labelOuterFlag
            cmp ax, array[si]
            jl MoveAhead        ; if si >= 0 && key < array[si] then move move si element one position ahead
            labelOuterFlag:
                mov array[si+2], ax   ; place the key in the correct position
                add di, 2
                jmp labelOuter

MoveAhead:
    mov bx, array[si]
    mov array[si+2], bx
    sub si, 2
    jmp labelInner
            
        
exit:
    printn 'Sorted array'
    mov si, 0
    mov ax, N
    mov cx, 2
    mov dx, 0
    div cx
    mov cx, ax
    printarr:
        mov ax, array[si]
        call print_num
        print ' '
        add si, 2
        loop printarr
hlt 
                        
N dd ? 
array dw N dup(?)    ; allocation of array and initialized with NULL values
define_scan_num
define_print_num
define_print_num_uns     