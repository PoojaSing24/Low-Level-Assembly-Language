
;display element of even number

section .data
	array dd 101,210,140,560, 1260,1234,75634,-1
	msg db "%d",10,0
section .text
	global main
	extern printf
main:
	xor ecx,ecx
lp3:	mov esi, array
	mov eax,4
	mul ecx
	add esi,eax
	cmp dword[esi],-1
	jz lp2
	mov  eax,ecx
	mov ebx,2
	div ebx
	cmp edx,0
	jnz lp1
	pusha
	push dword[esi]
	push msg
	call printf
	add esp,8
	popa
lp1:
	inc ecx
	jmp lp3

lp2:	ret
	

