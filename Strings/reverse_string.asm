;reverse a given string-------------

section .data
	string db "PARAM",0
	len equ $-string

section .bss
	revstr resb len    ;revstr la jevdhi string chi len aahe tevdhi assign keli
section .text
	global main
main:
	mov esi ,string
	mov edi ,revstr
	add esi,len  ;load total len of string into esi
lp:
	dec esi
	mov al ,byte[esi]
	mov byte[edi] ,al
	inc edi
	cmp esi ,string
	jnz lp
	
	mov eax ,4   ;system call
	mov ebx ,1
        mov ecx ,revstr
	mov edx ,len
	int 80h
	ret
	
	
