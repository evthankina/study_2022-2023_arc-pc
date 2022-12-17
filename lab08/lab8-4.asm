%include 'in_out.asm'
section .data
msg1 db 'Введите x: ',0h
msg2 db "Введите a: ",0h
msg3 db "Функция равна: ",0h

section .bss
x: resb 10
a: resb 10
answer: resb 10

section .text
GLOBAL _start
_start:
mov eax,msg1
call sprint

mov ecx,x
mov edx,10
call sread

mov eax,x
call atoi
mov [x],eax

mov eax, msg2
call sprint

mov ecx,a
mov edx,10
call sread

mov eax,a
call atoi
mov [a],eax

mov eax, [x]

cmp eax, [a]
jg Func1
jng Func2

Func1:
mov eax, [x]
sub eax, [a]
mov eax,eax
mov esi, [x]
mul esi
mov [answer], eax
jmp Final


Func2: 
mov [answer], 15
jmp Final

Final: 
mov eax,msg3
call sprint
mov eax, [answer]
call iprintLF
call quit

