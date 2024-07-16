;print the given string--------------

section .data
	msg db "today is a big challage",10,0
	msg1 db"%s",0
	msg2 db"challange is: %s",10.0

section .bss
	target resd 1

section .text
	global main
	extern printf,scanf
main:
	
	push msg
	call printf
	add esp,4
	
	push target
	push msg1
	call scanf
	add esp,8

	push target
	push msg2
	call printf
	add esp,8
	ret
	

;-------------------------------------------------------------

