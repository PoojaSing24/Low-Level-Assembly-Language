;print given string with one character line ane next line add one character and also it ---


section .data
	string db "everything",0
	len equ $-string 
	newl db 10

section .text
	global main
main:
	xor esi ,esi        ;esi=0

lp:
	mov edi ,string    ;edi =everything
	inc esi 
	
	mov eax ,4
	mov ebx ,1
	mov ecx ,string
	mov edx ,esi
	int 80h

	mov eax ,4
	mov ebx ,1
	mov ecx ,newl
	mov edx ,1
	int 80h		
	
	cmp esi ,len
	jnz lp
	mov esi,len
	dec esi
lp1:
	dec esi
	mov edi ,string
	mov eax ,4
	mov ebx ,1
	mov ecx ,string
	mov edx ,esi
	int 80h
	
	mov eax ,4
	mov ebx ,1
	mov ecx ,newl
	mov edx ,1
	int 80h
	
	cmp esi,0
	jnz lp1	
	ret	
	
	
