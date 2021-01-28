include 'emu8086.inc'

print 'Enter the a: '
call scan_num  ; /* stores user entered value into register cx */
mov a, cx      ; /* copy data from register cx to user defined variable a */

gotoxy 0,1     ; /* cursor Moves to location in canvas (0,1)

print 'Enter the b: '
call scan_num
mov b, cx

gotoxy 0,2

print 'a * b = '
mov ax, a
mul b         ; multiplies b with data present in ax register and stores result back in ax register. 
call print_num    ; displays whatever data present in ax register

a dd ?  ; dd Define Doubleword
b dd ?   
define_scan_num    
define_print_num
define_print_num_uns
