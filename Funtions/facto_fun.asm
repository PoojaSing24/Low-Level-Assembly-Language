

;write a factorial pogram using function------------------------------------



section .data
	msg db"argument %d is %s",10,0
	msg1 db"number of argument are %d",10,0


section .text
	global main,function
	extern printf,scanf


main:
	push ebp
	mov ebp,esp
	mov esi,dword[ebp+8]
	push eax
	
	call atoi
	add esi,4
	mov esi,eax
	push eax
	call function
	add esp,4
	push eax
	push esi
	push msg
	call printf
	add esp,12
	leave
	ret


function:
	push ebp 
	mov ebp,esp
	mov ecx,dword[ebp+8]
	mov dword[ebp-4],1
	mov eax,dword[ebp-4]
	xor edx,edx
	mul ecx
	loop lp
	leave
	ret	
		
