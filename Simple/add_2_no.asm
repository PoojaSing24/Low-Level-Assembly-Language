;add two given numbers---------------


;section .data
;	num1 dd 0104
;	num2 dd 0305
;	sum db"addition of two number is: %d",10,0

;
;section .text
;	global main
;	extern printf
	
;main:
;	mov eax,[num1];load the values at address num1 into eax
;	add eax,[num2]
;	
;	push eax
;	push sum
;	call printf
;	add esp,8
;	ret


;---------------------------------------------------------------------------

;print addition of given any two no-----

section .data
	msg1 db"n1 :",10,0
	num1 db"%d",0
	msg2 db"n2",10,0
	num2 db"%d",0
	sum db"addition is: %d",10,0

section .bss
	n1 resd 1
	n2 resd 1

section .text
	global main
	extern printf,scanf

	
main:
	push msg1
	call printf
	add esp,4

	push n1
	push num1
	call scanf
	add esp,8
	
	push msg2
	call printf
	add esp,4

	push n2
	push num2
	call scanf
	add esp,8
	
	mov eax,[n1]
	add eax,[n2]

	push eax
	push sum
	call printf
	add esp,8

	ret
	

