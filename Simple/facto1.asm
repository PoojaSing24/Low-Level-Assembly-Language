section .data
	num dd 5
	msg db"factorial is:%d",10,0

section .text
	global main
	extern printf
main:
	xor edx,edx
	mov ecx, dword[num]
	mov eax,1
	
lp:	cmp ecx,0
	jz end
	mul ecx
	dec ecx
	jmp lp
		
end:	
	push eax
	push msg
	call printf
	add esp,8
	ret
