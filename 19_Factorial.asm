include 'emu8086.inc'

print 'Enter the number: '
call scan_num 
gotoxy 0,1  

mov ax, 1
A:        ; iterate from input number to 1
  mul cx  ; multiply with whatever present in ax
  loop A

call print_num  

define_scan_num
define_print_num 
define_print_num_uns