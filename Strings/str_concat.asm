;concate given two string

section .data
	str1 db "good",10
	str2 db "luck!",10
	len1 equ $-str1
	len2 equ $-str2
	msg db "concate string is : %d",10,0


section .bss
	result resb len1+len2

section .text
	global main
main:
	mov edi ,str1
	mov esi,result
	
lp:
	mov al,byte[edi]
	cmp al,10
	jz lp2
	mov byte[esi],al
	inc esi
	inc edi
	jmp lp

lp2:
	mov edi ,str2
	jmp lp3
lp3:
	mov al ,byte[edi]
	cmp al,10
	jz end
	mov byte[esi],al
	inc esi
	inc edi
	jmp lp3
end:
	pusha
	mov eax,4
	mov ebx,1
	mov ecx ,result
	mov edx , len1+len2
	int 80h
	ret
	
	
	
	
