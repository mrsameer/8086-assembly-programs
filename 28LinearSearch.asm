; linear search

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
    print 'Enter the key: ' 
    call scan_num
    mov bx, cx  
    printn ; carriage return
    mov si, 0    
labelB: 
      cmp si, N
      je exit    
      cmp bx, array[si]
      je found 
      add si, 2
      jmp labelB

found:
    mov ax, si
    mov bx, 2
    div bx        ; to calculate index
    print 'Element found at index: '  
    call print_num         
    hlt
    
exit:
    printn 'Key not Found'      
    hlt 
    
N dd ?  
array dw N dup(?)    ; allocation of array of word data type  and initialized with NULL values
define_scan_num
define_print_num
define_print_num_uns
