;---print a given string using macros-----------

%macro mystring 1
	mov eax ,%1
	
%endmacro

section .data
	string db"poojaransing",0

section .text
	global main
	extern printf
main:
	mystring string
	push string 
	call printf
	add esp,4
	ret

