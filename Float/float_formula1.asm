;ifloting point-------------------
;quadratic equation----------------

section .data
	num dd 4
	msg db"%d",0
	format db"quadratic quation = %f",10,0
	msg1 db"value of a is:%d",10,0
	msg2 db"value of b is: %d",10,0
	msg3 db"value of c is : %d",10,0

section .bss
	a resd 1
	b resd 1
	c resd 1 
section .text
	global main
	extern printf, scanf
main:
;input value of a
	push a
	push msg
	call scanf
	add esp,8

;print value of a
	push dword[a]
	push msg1
	call printf
	add esp,8

;input value of b
	push b
	push msg
	call scanf
	add esp,8

;print b
	push dword[b]
	push msg2
	call printf
	add esp,8

	push c
	push msg
	call scanf
	add esp,8

	push dword[c]
	push msg3
	call printf
	add esp,8

;function or code for floating point

	fild dword[b]    ;b
	fmul st0         ;b*b
	fild dword[num]   ;b*b,4
	fild dword[a]     ;b*b,4,a
	fmul st1          ;b*b,4a
	fild dword[c]     ;b*b ,4a,c
	fmul st1           ;b*b,4ac
	fsubp            ;b*b-4ac
	fchs
	fsqrt             ;sqrtb*b-4ac
	
	fild dword[b]      ;b,sqrtb*b-4ac
	fchs 
	faddp            ;-b+sqrtb*b-4ac

	fild dword[a]    ;a
	fadd st0          ;a+a
	
	faddp        ;fdiv  st1      ;-b+sqrtb*b-4ac/2a
	 
;display result	 
	sub esp,8
	fstp qword[esp]
	push  format
	call printf
	add esp,12
	ret
	


			
	
	

