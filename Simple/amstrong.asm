;amstrong number--------------


section .data
	num dd 133
	format db"number is amstrong",10,0
	format1 db"number is not amstrong",10,0
	msg db"amstrong no is: %d",10,0
section .bss
	sum resd 1
	rem resd 1

section .text 
	global main 
	extern printf
main:
	mov esi ,dword[num]
	mov dword[sum],0
	
	push eax
	mov eax ,1
	mov ecx ,eax
	mul ecx
	mul ecx
	add dword[sum],eax
	pop eax
	
	
	push eax
	mov eax ,3
	mov ecx ,eax
	mul ecx
	mul ecx
	add dword[sum],eax
	pop eax
	
	push eax
	mov eax ,3
	mov ecx ,eax
	mul ecx
	mul ecx
	add dword[sum],eax
	pop eax

	push dword[sum] 
	push msg
	call printf
	add esp,8

lp:
	cmp dword[sum],esi
	jz true
	jnz false
true:
	push format
	call printf
	add esp,4	
	ret

false:
	push format1
	call printf
	add esp,4
	ret
