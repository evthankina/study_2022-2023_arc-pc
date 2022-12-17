%include 'in_out.asm'
SECTION .data
msg: DB 'Введите x: ',0
result: DB '2(3x-1)+7=',0
SECTION .bss
x: RESB 80
rez: RESB 80
SECTION .text
GLOBAL _start
_start:

mov eax, msg
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax,x
call atoi
call _calculator
call _calcul 
mov eax,result
call sprint
mov eax,[rez]
call iprintLF
call quit

_calculator:
mov ebx,3
mul ebx
sub eax,1
mov [rez],eax
ret 
_calcul:
mov ebx,2
mul ebx
add eax,7
mov [rez],eax
ret 

