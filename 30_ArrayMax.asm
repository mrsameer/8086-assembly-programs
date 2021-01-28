; program to find the maximum element in the array 

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
    mov si, 0
    mov ax, array[si]   ; initially max element = array[si]
    labelMain: 
        cmp si, N          ; if si == N then exit 
        je exit
        cmp ax, array[si]   ; if ax < array[si] then update the max element
        jl updateMax 
        labelB:
            add si, 2
            jmp labelMain
    
    updateMax:
        mov ax, array[si]
        jmp labelB    

exit: 
    print 'The maximum element is: '
    call print_num
    hlt
    
N dd ?  
array dw N dup(?)    ; allocation of array and initialized with NULL values
define_scan_num
define_print_num
define_print_num_uns