include 'emu8086.inc'

print 'Enter the N: '
call scan_num 
mov N, cx 
gotoxy 0,1  

print 'Enter the R: '
call scan_num    
mov R, cx
gotoxy 0, 2

mov ax, N
sub ax, R
mov R, ax    ; R = N-R

mov ax, 1
mov bx, N
A:            ; iterate from N = N to R and multiply N everytime with ax
  cmp bx, R
  je exit
  mul bx
  dec bx
  jmp A

exit:
    call print_num    

N dd ?
R dd ?
define_scan_num
define_print_num 
define_print_num_uns