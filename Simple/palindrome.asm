
section .data
	msg db "poop",0
	format db"Palindrome",10,0
	format1 db "NOt Paliandrome",10,0


section .text
	global main
	extern puts
main:
	mov esi,msg
	mov edi,msg

lp:
	mov bl ,byte[edi]
	cmp bl,0
	jz compare
	inc edi
	jmp lp

compare:
	dec edi
	jmp check

check:
	mov al,byte[esi]
	mov bl,byte[edi]
	cmp al,bl
	jnz false
	cmp esi,edi
	jz true
	jg true
	dec edi
	inc esi
	jmp check

true:
	push format
	call puts
	add esp,4
	jmp end

false:
	push format1
	call puts
	add esp,4
	
end:
	ret

