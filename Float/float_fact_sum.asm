

;find 1/1! + 1/2!+ 1/3! + ...+1/n!

section .data
	msg db"given the no : %d",10,0
	input db"%d",0
	output db " 1/1!+1/2!+..+1/n! result is : %f",10,0

section .bss
	num resd 1
	fact resd 1

section .text
	global main
	extern printf,scanf
main:
;given user no
	push num
	push input
	call scanf
	add esp,8
;print no
	push dword[num]
	push msg
	call printf
	add esp,8

;floating code 	
	fldz                 ;intially sum is zero
	mov dword[fact],1
	cmp dword[num],0
	jng end
	jmp lp
	
lp:
	fld1             ;load constant 1 st0=1
	
	;factorial code
	mov eax,1
	mov ecx ,dword[num] 
	jmp lp1
lp1:
	cmp ecx ,1	
	jz lp2
	mul ecx
	dec ecx
	jmp lp1
	
lp2:
	fild dword[fact]
	mov dword[fact],eax
	fdivp st1,st0    ;divide 1 by factorial
	faddp st1,st0    ;add the result to the sum
	
	dec dword[num]

	cmp dword[num],0
	jg lp

;display result
	sub esp,8
	fstp qword[esp]
	push output
	call printf
	add esp,12
end:
	ret





