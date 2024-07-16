

section .data
	msg db "maximun is :%d",10,0
	
section .text
	global main
	extern max ,printf
main:
	mov esi ,10
	mov edi ,20
	push esi
	push edi
	call max
	add esp ,8
	
	push eax 
	push msg
	call printf
	add esp,8

