;print string param is---
;
;
;
;
;

section .data
	string db "param",0
	len equ $-string
	newl db 10

section .text
	global main
main:
        mov esi ,len

lp:
	dec esi
	mov edi ,string
	
	mov eax ,4
	mov ebx ,1
	mov ecx ,string 
	mov edx ,esi
	int 80h

	mov eax,4
	mov ebx ,1
	mov ecx ,newl
	mov edx ,1
	int 80h
	
	cmp esi ,0
	jnz lp
	ret

