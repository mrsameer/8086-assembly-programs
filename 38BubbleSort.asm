; bubble sort
include 'emu8086.inc'

print 'Enter the number of elements: '
call scan_num 
mov N, cx
               
mov outerCount, cx     ;outer loop iterates N-1 times 
dec outerCount          

                  
mov ax, 2     ; move 2 into ax 
mul N
mov N, ax     ; size = N * 2 because dw is word data type which is of 2 bytes

sub ax, 2
mov innerCount, ax  ; inner loop goes from 0 to N*2 - 2

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
    mov cx, outerCount
    labelB0: 
    mov si, 0
    labelB:
        cmp si, innerCount
        je labelC
        mov ax, array[si]
        cmp ax, array[si+2]     ; compare with adjacent element    
        jg swap 
        labelB2:
            add si, 2
            jmp labelB
        labelC:
            loop labelB0   

printn 'Sorted array'
mov si, 0
mov cx, OuterCount
inc cx      ; iterate for OuterCount + 1 times to print array 
printarr:
    mov ax, array[si]
    call print_num
    print ' '
    add si, 2
    loop printarr
hlt 

swap:
    xchg ax, array[si+2]
    xchg ax, array[si]
    jmp labelB2
                        
N dd ? 
outerCount dd ? 
innerCount dd ?
array dw N dup(?)    ; allocation of array and initialized with NULL values
define_scan_num
define_print_num
define_print_num_uns
