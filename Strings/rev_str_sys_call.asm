

;reverse str using system call

section .data
	string db"NEW-YEAR!",0

section .text
	global main
main:
	mov esi ,string
	xor ecx ,ecx
lp:
	cmp byte[esi],0
	jz lp2
	inc ecx
	inc esi
	jmp lp
lp2:
	dec esi
	mov al ,byte[esi]
	mov byte[edi],al
	cmp  edi ,string
	jnz end
	jmp lp2
end:
	mov eax ,4
	mov ebx ,1
	mov ecx ,edi
	mov edx ,ecx
	int 80h
	ret
	

