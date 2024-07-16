;cpy string--------------

%macro mystring 3
	mov esi ,%1
	mov edi ,%2
	mov ecx ,%3
	
	add edi ,ecx	
lp:
	dec edi
	mov al ,byte[esi]
	cmp al ,0
	jz end
	mov byte[edi],al
	inc edi
	jmp lp	 
	
end:

%endmacro


section .data
	string db "princes",0
	len equ $-string 

section .bss
	str resd len

section .text
	global main
main:
       mystring   string ,str ,len
	mov eax ,4
	mov ebx ,1
	mov ecx ,str
	mov edx ,len
	int 80h
	ret 
