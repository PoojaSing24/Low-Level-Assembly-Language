;print string using functions---

section .data
	string db"my name is anu",10,0
	
section .text
	global function,main
	extern printf

function:
	push string
	call printf
	add esp,4
	ret
	
main:
	call function 
	ret
