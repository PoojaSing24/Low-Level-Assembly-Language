;print given number is even or add


section .data
	num dd 11
	format db "enen",10,0
	format1 db "odd",10,0

section .text
	global main
	extern printf
main:
	mov eax ,dword[num]
	mov ebx ,2
	xor edx ,edx      ;remainder store in edx 
	div ebx 
	cmp edx ,0
	jz even
	jnz odd

even:
	push format
	call printf
	add esp,4
	ret

odd:
	push format1
	call printf
	add esp ,4
	ret	

	
	
	
