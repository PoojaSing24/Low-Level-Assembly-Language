;print addition of given array-----------------

section .data
	Array dd 10,30,50,70,30,-1
	msg db"Addition of array is: %d",10,0
	
section .bss
	sum resd 1

section .text
	global main
	extern printf
main:
	xor ecx ,ecx     ;ecx=0
	mov dword[sum], 0    ;sum=0
	


lp:
        mov esi ,dword[Array+ecx*4]  ;base+addrees*index
	cmp esi ,-1
	jz end
	add dword[sum],esi
	inc esi
	inc ecx
	jmp lp

;-----------------------------------------------------
;lp:
;	mov esi ,Array
;	mov eax ,4     ;accumulator eax=4
;	mul ecx       ;eax=ecx*eax
;	add esi ,eax     ;esi=0+0
;	cmp dword[esi] ,-1
;	mov edi ,dword[esi]
;	jz end
;	add dword[sum] ,edi
;	inc ecx
;	jmp lp
;---------------------------------------------------------------
		
end:
	push dword[sum]
	push msg
	call printf
	add esp , 8
	ret
	
