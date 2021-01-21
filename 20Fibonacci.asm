include 'emu8086.inc'

print 'Enter the N: '
call scan_num  
gotoxy 0,1  

; iterate from 1 to N and print the a and then add a + b and then place in b and place prior b into a
labelA:
  mov ax, a      
  call print_num 
  print ', ' 
  
  add ax, b      
  mov bx, b
  mov a, bx
  mov b, ax
  loop labelA
  
a dd 0
b dd 1
N dd ?
define_scan_num
define_print_num 
define_print_num_uns