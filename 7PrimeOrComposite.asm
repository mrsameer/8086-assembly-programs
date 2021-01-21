include 'emu8086.inc'

print 'Enter the number: '
call scan_num 
gotoxy 0, 1            ; goto coordinate 0,1
mov num, cx            ; copy data from register cx into ax   

; base case
cmp num, 1             ; compare num with 1
jle comp               ; jump to label comp if num is <= 1

mov bx, 2              ; acts as iterator variable
loop0:
    cmp bx, num        ; if itervar == num then it is prime
    je prime      
    mov ax, num 
    mov dx, 0          ; empty the remainder
    div bx
    cmp dx, 0          ; compare with remainder in dx register
    je comp            ; if it is 0 then go to label comp
    inc bx             ; increment the iter var
    jmp loop0          ; again loop the label loop0
    
prime:
    print 'Prime number'
    hlt
         
comp:
    print 'Composite number'    

ret    

num dd ?               ; variable num of double word data type
define_scan_num         
