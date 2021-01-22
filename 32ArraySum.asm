; program to find the sum of elements in the array 

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
    mov ax, 0 ; initially the sum is = 0 
    mov si, 0     
    labelMain: 
        cmp si, N
        je exit
        add ax, array[si]
        add si, 2
        jmp labelMain

exit: 
    print 'The sum of the elements is: '
    call print_num
    hlt
    
N dd ?  
array dw N dup(?)    ; allocation of array and initialized with NULL values
define_scan_num
define_print_num
define_print_num_uns