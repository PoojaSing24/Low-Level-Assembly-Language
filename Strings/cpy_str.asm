;copy given string


section .data
	string db"this is your change",10,0
	len equ $-string

section .bss
	revstr resb len
	
section .text
	global main
	extern puts
main:
	mov esi ,string
	mov edi ,revstr
	mov ecx ,len
	sub ecx,2
	xor eax ,eax

lp:	cmp eax ,ecx
	jz end
	mov al, byte[esi]
	mov byte[edi],al
	inc edi
	inc esi
	loop lp
	push revstr
	call puts
	add esp,4
end:
	ret



