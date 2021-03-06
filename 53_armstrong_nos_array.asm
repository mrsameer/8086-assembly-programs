; program to find armstrong number in an array 

include 'emu8086.inc'

loopMain:
    mov si, 0 
    cmp si, 10
    je halt     
    mov ax, array[si]
    mov num, ax
    mov temp, ax   

;figure out the number of digits in the num 
mov ax, num  ; copy the data of num into accumulator   
mov bx, 10  ; bx is used to divide num by 10
labelA:
    cmp ax, 0
    je labelB    ; goes to labelB after finding the length of the number
    inc length 
    mov dx, 0     ; clear everything in  dx before dividing
    div bx
    jmp labelA    ; loops labelA until ax is 0

; extract last digit from num and calculate pow(last digit, length) and add it to sum     
labelB:
    cmp temp, 0 
    je exit  ; goes to label exit if num is 0    
    mov ax, temp    ; fill ax with temp 
    mov dx, 0       ; clear dx register before division
    div bx          ; divide ax with bx (10)
    mov temp, ax    ; update temp with the quotient from ax register
    mov ax, dx      ; place remainder in ax regsiter 
    mov rem, dx     ; copy remainder from dx register to rem 
    jmp labelc  ;goto labelc and calculate the pow(remainder, length) and add it to sum and come back to labeld
    labeld:
        jmp labelB   ; loop labelB until temp becomes 0 
    
labelc:
      mov cx, length  ; place length into counter register 
      dec cx           ; already remainder present in ax register so we need to mutliply itself with length-1 times
      labele:
        mul rem 
        loop labele
      ; add result to sum 
      add ax, sum     
      mov sum, ax     ; add result to the sum variable 
      jmp labeld      ; go back to the label labeld    
              
        
exit:
    mov ax, num 
    cmp ax, sum         ; if sum == num then it is armstrong number
    je true 
    add si, 2
    jmp loopMain 
    
true:
    call print_num_uns
    printn 
    add si, 2 
    jmp loopMain    

halt:
    hlt    

num dd ? ; declaration of variable num of double word data type 
length dd 0 ; declaration and definition of variable length of double word data type
sum dd 0 ; declaration and definition of variable sum of double word data type
temp dd ? ; declaration of variable temp of double word data type 
rem dd ?  ; declaration of variable rem of double word data type

array dw 5 dup(153, 45, 8934, 345, 45)
define_print_num_uns