;multiplication table

section .data
	       num dd 5
		msg1 db "mult is: %d",10,0

section .text
	global main
	extern printf

main:
       mov ecx,1      ;ecx=1
	
lp:
	cmp ecx,11
       mov eax, dword[num]	
	je end

	mul ecx    ;eax=ecx*eax
	pusha
	push eax
	push msg1
	call printf 
	add esp,8
	popa
	inc ecx 
	jmp lp
	

end:
    ret
  
	
