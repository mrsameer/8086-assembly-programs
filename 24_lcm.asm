include 'emu8086.inc'

print 'Enter the a: '
call scan_num 
mov a, cx 
gotoxy 0,1  

print 'Enter the b: '
call scan_num    
mov b, cx
gotoxy 0, 2

mov bx, 1       ; iterator bx
labelA:         ; iterates until bx <= a && bx <= b
    cmp bx, a 
    jg exit    
    cmp bx, b
    jg exit
    labelB: 
        mov ax, a      
        mov dx, 0
        div bx      ; divide a with bx
        cmp dx, 0
        je checkremb   ; if remainder is 0 and then check remainder of b/bx
        labelC:
            inc bx
            jmp labelA

checkremb:     ; to check whether b%bx == 0 
    mov ax, b
    div bx
    cmp dx, 0
    jne  labelC
    mov gcd, bx   ; if remainder is 0 then gcd = bx
    jmp labelC  

exit:
    mov ax, a      
    mul b         ; ax = a * b
    mov dx, 0
    div gcd       ; ax = ax / gcd
    call print_num
    hlt
                
a dd ?
b dd ?   
gcd dd ?
define_scan_num
define_print_num
define_print_num_uns