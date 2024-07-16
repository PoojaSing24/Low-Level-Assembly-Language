;addition of two no using macro


%macro myadd 3
	mov eax ,%1
	add eax ,%2
	mov %3 ,eax

%endmacro

section .text
	global main
	extern printf
main:
	myadd 12,12 ,eax
	
	;push eax
	;call printf
	;add esp,4
	ret
	
