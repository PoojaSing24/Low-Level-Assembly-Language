
;---------------------------------------------------------------------------
;section .data
;	num dd 10,20,30,40,50,-1
;	msg db"addition is: %d",10,0
;section .bss
;	sum resd 1
;section .text
;	global main
;	extern printf
;main:
;	mov eax,num   ;store address of num
;	xor edx,edx   ;ecx=0
;	
;lp:	cmp dword[eax],-1
;	jz end
;	add edx,dword[eax]
;	add eax,4
;	jmp lp
;end:
;	push edx
;	push msg
;	call printf
;	add esp,8
;	ret	
;
;--------------------------------------------------------------------------

;using scanf------------

section .data
	msg db"%d",0    ;used only scanf 
	msg1 db"no is:",10,0
	msg2 db"total no of element is:%d",10,0
	msg3 db 10,"%d",0
	msg4 db"addition is: %d",10,0	

section .bss
	n resd 1
	numarray resd 50
	sum resd 1
section .text
	global main
	extern printf,scanf

main:
	push msg1
	call printf
	add esp ,4

	push n
	push msg
	call scanf
	add esp,8
	
	push dword[n]
	push msg2
	call printf
	add esp,8

;given element of array
;for(int j=0; j<n; j++)
	xor ecx,ecx                  ;ecx=0
	mov ebx ,numarray
lp:
	cmp ecx ,dword[n]
	jz end
	pusha
	push ebx
	push msg
	call scanf
	add esp,8
	popa
	inc ecx
	add ebx ,4
	jmp lp

end:
	mov dword[sum],0
	xor ecx, ecx
	mov ebx ,numarray

lp1:
	cmp ecx, dword[n]
	jz end1
	mov edx ,dword[ebx]
	add dword[sum],edx
	;pusha
;	push dword[ebx] 
;	push msg3
;	call printf
;	add esp,8
;	popa
	inc ecx
	add ebx,4
	jmp lp1

end1:
	push dword[sum]
	push msg4
	call printf
	add esp,8
	ret
	

	
	
	

