;print given two strings are equal or not-------------

section .data
	str1 db "paaa!",0
	str2 db "paaa!",0
	format db "str is equal",10,0
	format1 db "str is not equal",10,0

section .text
	global main
	extern printf
main:
	mov esi ,str1
	mov edi ,str2
lp:
	mov al ,byte[esi]
	mov bl ,byte[edi]
	cmp al ,0
	jz true
	cmp bl ,0
	jz true
	cmp al ,bl
	jnz false

	inc esi
	inc edi
	jmp lp

true:
	cmp al ,bl
	jnz false
	push format
	call printf
	add esp,4
	jmp end

false:
	push format1
	call printf
	add esp,4
	jmp end
end:
	ret
