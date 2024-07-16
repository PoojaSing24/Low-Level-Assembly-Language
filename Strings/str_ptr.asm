;print string using system call

section .data
	string db "mayra",0

section .text
	global main
main:
	mov esi,string
	xor ecx ,ecx
	
lp:
	cmp byte[esi],0
	jz end
	inc esi
	inc ecx
	jmp lp

end:
	mov eax ,4
	mov ebx ,1
	mov ecx ,string
	mov edx ,ecx
	int 80h
	ret
