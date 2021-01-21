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
cmp ax, R
jl swap   ; R = min(R, N-R)

; figure out (N! / deno!)
A:    
 mov ax, N
 sub ax, R
 mov deno, ax  ; deno = N-R
 
 mov ax, 1
 mov bx, N
 B:                  ;iterate from N to deno-1 and muliply with ax
    cmp bx, deno 
    je C 
    mul bx
    dec bx
    jmp B
    
C:                    ;divide the result with R!
  cmp R, 0            ; iterate from R to 1 and divide whatever present in ax
  je exit
  mov dx, 0
  div R
  dec R
  jmp C

exit:
    call print_num
    hlt
swap:
    mov R, ax
    jmp A

N dd ?
R dd ? 
deno dd ?
define_scan_num
define_print_num 
define_print_num_uns