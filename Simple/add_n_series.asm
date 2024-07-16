;add 1 to n number

section .data
	msg db"%d",0
	msg1 db "enter no:",10,0
	msg2 db "number is: %d",10,0
	msg3 db"addition is: %d",10,0

section .bss
	n resd 1
	sum resd 1

section .text
	global main
	extern printf ,scanf
main:
	push msg1
	call printf
	add esp,4

	push n
	push msg
	call scanf
	add esp,8

	push dword[n]
	push msg2
	call printf
	add esp,8
	
	
	mov eax ,dword[n]
	mov dword[sum],0
	
lp:	cmp eax ,0
	jz end
	add dword[sum] ,eax
	dec eax 
	jmp lp
end:
	push dword[sum]
	push msg3
	call printf
	add esp,8
	ret	
