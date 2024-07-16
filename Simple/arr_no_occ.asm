;count no of occureances in given array------------


section .data
	msg db"enter no:",10,0
	msg1 db"%d",0
	msg2 db"number is: %d",10,0
	msg3 db"enter array element:",10,0
	msg4 db"no of occurances is :%d",10,0


section .bss
	n resd 1
	array resd 10
	count resd 1

section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4

	push n
	push msg1
	call scanf
	add esp,8

	push dword[n]
	push msg2
	call printf
	add esp,8

	
	xor ecx ,ecx
	mov ebx ,array
lp:
	cmp ecx ,dword[n]
	jz end
	pusha
	push ebx
	push msg1
	call scanf
	add esp,8
	popa
	inc ecx
	add ebx,4
	jmp lp
end:
	xor ecx ,ecx
	xor esi ,esi
	mov ebx ,array
	mov esi ,dword[ebx]
	
lp1:
	cmp ecx ,dword[n]
	jz end1
	cmp esi ,dword[ebx]
	jne counts
	add dword[count],1
	inc ecx
	add ebx ,4
	jmp lp1

counts:
	inc ecx
	add ebx ,4
	jmp lp1
end1:
	push dword[count]
	push msg4
	call printf
	add esp,8
	ret
	
	









