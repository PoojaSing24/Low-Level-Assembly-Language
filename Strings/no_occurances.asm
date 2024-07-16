;find no of occurances to given any string -------------

section .data
	string db"abghabkfabkrab",0
	format db"no of occurances of is: %d",10,0

section .text
	global main
	extern printf
main:
	mov esi ,string
	xor ecx ,ecx
lp:
	mov al ,byte[esi]
	cmp al ,0
	jz end
	cmp al ,'a'
	jz lp1
	inc esi
	jmp lp
lp1:
	inc esi
	mov al ,byte[esi]
	cmp al,'b'
	jnz lp
	inc ecx
	inc esi
	jmp lp
end:
	push ecx
	push format
	call printf
	add esp,8
	ret
	
