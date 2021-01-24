;Program to find the length of the string
include 'emu8086.inc'

print 'The length of the string is: '
mov al, len
call print_num 
hlt

str db "Some String$" ; $indicates terminating character
len db $-str  
define_print_num
define_print_num_uns