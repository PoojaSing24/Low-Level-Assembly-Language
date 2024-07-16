
;printing the worlds in the reverse string with one word per line.----


section .data
	     string db "low level programming",0
	     len equ $-string   ;assembly directives,calculate len of str including null terminate
             newl db 10       ;new-line character
section .text
	    global main
	 

main:   
	xor esi,esi     ;esi=0   length,counter

lp:	mov edi,string
	cmp byte[edi],0
	jz lp2
	inc esi
	inc edi
	jmp lp
lp2:	
	dec esi
	mov edi,string  ;reset edi to the beginning of the str

	mov eax,4       ;write system call
	mov ebx,1
;	add edi,esi
	mov ecx,edi
	mov edx,esi
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,newl
	mov edx,1
	int 80h

	cmp esi,0
	jnz lp
	
	ret	 



	


