

;display formula of => z= -b+ or - sqrt b*b-4ac divide by 2a


section .data
	msg db"%d",0
	format db"result = %f",10,0
	msg1 db"value of a is:%d",10,0
	msg2 db"value of b is: %d",10,0
	msg3 db"value of c is : %d",10,0
	
section .bss
	a resd 1
	b resd 1
	c resd 1 
	r1 resd 1
	r2 resd 1

section .text
	global main
	extern printf, scanf
main:
	
	push a
	push msg
	call scanf
	add esp,8

	push dword[a]
	push msg1
	call printf
	add esp,8

	push b
	push msg
	call scanf
	add esp,8

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

;floating code	

lp:
	fild dword[a]   ;a
	fadd st0        ;2a
	fild dword[a]   ;a,2a
	fild dword[c]   ;c ,a,2a
	fmulp st1        ;ac ,2a
	fadd st0        ;2ac ,2a
	fadd st0        ;4ac ,2a
	;fchs
	fild dword[b]    ;b ,4ac ,2a
	fild dword[b]     ;b,b ,4ac,2a
	fmulp st1         ;b*b ,4ac ,2a
	fsub st1           ;b*b-4ac ,2a

	ftst              ;compare b*b-4ac with 0
	fstsw ax         ;store status in ax
	sahf
	jb lp1
	
	fsqrt              ;sqrt b*b-4ac ,2a
	fild dword[b]       ;b ,sqrt b*b-4ac ,2a
	fchs               ;-b ,sqrt b*b-4ac ,2a
	fadd st1            ;-b+sqrt b*b-4ac ,sqrt b*b-4ac ,2a
	fdiv st2            ;-b+sqrt b*b-4ac/2a ,sqrt b*b-4ac ,2a

	mov eax ,r1
	fstp qword[eax]
	fchs
	fild dword[b]
	fsubp st1
	fdivrp st1
	mov eax ,r2
	fstp qword[eax]
	mov eax ,1
	jmp end

lp1:
	sub eax,eax       ;eax=0
end:	
	sub esp,8
	fst qword[esp]
	push  format
	call printf
	add esp,12
	ret
	 		
