include 'emu8086.inc'

print 'Enter the number: '
call scan_num 
gotoxy 0, 1            ; goto coordinate 0,1 

cmp cx, 0              ; compare with data in register cx with 0
jge positive           ; if >= 0 then jump to label positive
print 'NEGATIVE'
hlt

positive:
    print 'POSITIVE'
    
define_scan_num