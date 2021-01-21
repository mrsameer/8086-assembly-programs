include 'emu8086.inc'

print 'Enter the number: '
call scan_num 
gotoxy 0, 1            ; goto coordinate 0,1
mov ax, cx             ; copy data from register cx into ax   

mov bx, 2d             ; store decimal 2 into bx
div bx
cmp dx, 0              ; compare remainder in dx register with 0
je yes                 ; jump to label yes if both are equal 
print 'Odd number'
hlt                    ; halt the program 
yes:
    print 'Even number'

ret
 
define_scan_num    
