include 'emu8086.inc'

print 'Enter the a: '
call scan_num  ; /* stores user entered value into register cx */
mov a, cx      ; /* copy data from register cx to user defined variable a */

gotoxy 0,1     ; /* cursor Moves to location in canvas (0,1)

print 'Enter the b: '
call scan_num
mov b, cx

gotoxy 0,2

print 'a - b = '
mov ax, a
sub ax, b  ; substracts ax and b and stores result in ax
call print_num

a dd ?  ; dd Define Doubleword
b dd ?   
define_scan_num    
define_print_num
define_print_num_uns
