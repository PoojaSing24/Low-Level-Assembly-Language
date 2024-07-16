section .data
	     array dd 5,6,2,1,8,-1
 
count dw 5

section .text
	     global main
	    
main:
	mov edi ,array
	mov ecx , 1     ;ecx=1

lp1:
	cmp [count],ecx  
	jz out
	mov edx,edi

lp2:
	mov eax,[edx]
	add edx,4
	cmp dword[edx],-1
	jz out1
	mov ebx,[edx]
	
	cmp eax,ebx
	jle lp2
	
	;SWAP if not less
	xchg eax,ebx
	
	;move value back in memory
	sub edx,4
	mov[edx],eax
	add edx,4
	mov [edx],ebx
	jmp lp2
	
out1:
	inc ecx
	jmp lp1

out:
	ret
