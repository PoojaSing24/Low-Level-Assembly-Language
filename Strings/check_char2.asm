 ;print substring to given string-------------

section .data
	str1 db "rutuyasheri",0
	str2 db "yash",0
	f1 db"yes",10,0
	f2 db"no",10,0

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
	jz end1
	cmp bl ,0
	jz end
	cmp al ,bl
	jnz lp2
	inc esi
	inc edi
	jmp lp
lp2:
	inc esi 
	jmp lp

end:
	push f1
	call printf
	add esp ,4
	ret
end1:
	push f2
	call printf
	add esp, 4
	ret
