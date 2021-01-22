; binary search

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
    mov lo, 0       ; lo = 0
    mov ax, N
    sub ax, 2
    mov hi, ax      ; hi = N-2
labelB:  
      mov ax, lo
      add ax, hi
      mov si, 2
      mov dx, 0
      div si
      mov si, ax      ; si = (lo + hi)/2
      mov ax, hi
      cmp ax, lo      ; if (ax < lo) exit
      jl exit  
      cmp bx, array[si]
      je found            ; if key == array[si]
      cmp bx, array[si]
      jg left             ; if key > array[si] then lo = si + 2
      mov ax, si
      sub ax, 2
      mov hi, ax          ; else hi = si - 2
      jmp labelB

left:
    mov ax, si
    add ax, 2
    mov lo, ax
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
lo dd ?
hi dd ?
array dw N dup(?)    ; allocation of array and initialized with NULL values
define_scan_num
define_print_num
define_print_num_uns