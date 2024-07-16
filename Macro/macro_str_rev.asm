;reverse string using macros

%macro mystring  3
	mov esi ,%1
	mov edi ,%2
	mov ecx ,%3

	add esi ,ecx
	
lp:
	dec esi
	mov al ,byte[esi]
	mov byte[edi],al
	inc edi
	cmp esi ,%1
	jnz lp
	
%endmacro

section .data
	string db"pooja",0
	len equ $-string

section .bss
	revstr resb len

section .text
	global main

main:
	 mystring string ,revstr , len
	mov eax ,4
	mov ebx ,1
	mov ecx ,revstr
	mov edx ,len
	int 80h
	ret 
