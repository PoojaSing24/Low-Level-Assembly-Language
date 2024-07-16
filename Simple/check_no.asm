;check given number is positive or negative

section .data
	num dd 4
	result db"positive no:",10,0
	result1 db"negative no:",10,0
section .text
	global main
	extern printf
main:
	mov eax ,dword[num]
	cmp eax,0
	je true
	jl false

true:
	push result
	call printf
	add esp,4
	ret

false:
	push result1
	call printf
	add esp,4
	ret

