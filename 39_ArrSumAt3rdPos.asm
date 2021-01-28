; program to find the sum of the numbers at every 3rd position in an array 

include 'emu8086.inc'

print 'Enter the size: '
call scan_num
mov N, cx
printn

; calcualtion of size of array based on data type dw 
mov ax, N
mov bx, 2   ; size of dw data type 
mul bx 
mov size, ax 

; taking array elements from user and storing them 
printn 'Enter the elements'
mov si, 0
labelInput: 
         cmp si, size
         je calcSum
         call scan_num 
         mov array[si], cx    
         printn
         add si, 2
         jmp labelInput 

calcSum:
    ; calculation of sum of elements at every third index
    mov si, 4; first 3rd position
    labelA:
        cmp si, size 
        jge printSum
        mov ax, sum 
        add ax, array[si]
        mov sum,ax
        add si,4
        jmp labelA

printSum:
    ; printing sum  
    printn
    print 'The sum = '
    mov ax, sum 
    call print_num  

hlt       
         
N dd ? 
size dd ?   
sum dd 0
array dw N dup(?)
define_scan_num
define_print_num
define_print_num_uns