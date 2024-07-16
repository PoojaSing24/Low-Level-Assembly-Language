

;count character of given string


section .data
	msg db"pooja",0
	format db"count : %d",10,0

section .text
	global main
	extern printf
	
main:
	xor ecx ,ecx
	mov esi ,msg
lp:
	mov al ,byte[esi]
	cmp al ,0
	jz end
	cmp al ,'o'
	jnz lp1
	inc ecx
	inc esi
	jmp lp

lp1:
	inc esi
	jmp lp
end:
	push ecx
	push format
	call printf
	add esp,8
	ret
	
	
	
	
