;write a fibonacci  series----

section .data
	num dd 10
	format db"fibbonaci series is: %d",10,0
	
section .bss
	n1 resd 1
	n2 resd 1
	n3 resd 1

section .text
	global main
	extern printf
main:
	mov dword[n1],1
	mov dword[n2],1
	mov dword[n3],0

	mov eax ,dword[n1]
	mov ebx ,dword[n2]

	push eax
	push format
	call printf
	add esp ,8
	
	push ebx
	push format
	call printf
	add esp,8
	
	mov esi ,dword[num]
	mov ecx ,2
	
lp:
	cmp ecx ,esi
	jge end
	add eax,ebx
	mov dword[n3],eax
	
	
	
;	add dword[n3],eax
;	add dword[n3],ebx
;	mov eax ,ebx
;	mov ebx ,dword[n3]
	push dword[n3]
	push format
	call printf
	add esp,8

	mov dword[n1],ebx
	mov dword[n2],eax
	inc ecx
	jmp lp
	
end:
	ret
	

