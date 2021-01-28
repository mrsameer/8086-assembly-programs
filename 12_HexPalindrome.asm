include 'emu8086.inc'

mov cx, 3223h   ; 3223h is a palindrome
mov ax, cx      ; copy data from the counter into the accumulator
mov cl, ah
mov ch, al
rol cl, 4
rol ch, 4
cmp ax, cx
jne false  

print 'Palindrome' 
hlt

false:
    print 'Not palindrome'