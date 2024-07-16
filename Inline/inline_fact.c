#include<stdio.h>
#include<stdlib.h>

int n=5;
int fact;

int main()
{
	asm("pushl %eax\n\t"
	    "movl n, %ebx\n\t"
	    "movl $1 , %eax\n\t"
	     "lp:cmpl $0 , %ebx\n\t"
	     	"jz end\n\t"
		 "mul  %ebx\n\t"
		 "dec  %ebx\n\t"
		 "jmp lp\n\t"
		 "end: movl %eax,fact\n\t"
		  "popl %eax\n\t");
	printf("factorial is:%d",fact);
}


/*
	asm("pushl %eax\n\t"
	    "movl n, %ecx\n\t"
	    "movl $1, %eax\n\t"
	    "lp: mul %ecx\n\t"
	    "loop lp\n\t"
	    "movl %eax ,fact\n\t"
	    "popl %eax\n\t");
	printf("factorial is:%d",fact);

}
*/

