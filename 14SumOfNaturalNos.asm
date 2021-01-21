include 'emu8086.inc'
print 'Enter the number: '
call scan_num
gotoxy 0,1
mov ax, cx
inc ax
mul cx 
sar ax, 1     ; divide by 2 by shifting it to right
call print_num
hlt
define_scan_num
define_print_num
define_print_num_uns