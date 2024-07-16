;check whether given charachter are present in string or not

section .data
	string db"pooju",0
	format db"present",10,0
	format1 db"not present",10,0

section .text
	global main
	extern printf
main:
	mov esi ,string
	
lp:
	mov al ,byte[esi]
	cmp al ,0
	jz end
	cmp al ,'a'
	jz true
	inc esi
	jmp lp

true:
	push format
	call printf
	add esp,4
	ret

end:
	push format1
	call printf
	add esp,4
	ret 
