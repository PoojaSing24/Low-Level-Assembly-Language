#include<stdio.h>
#include<stdlib.h>

int n=10;
int sum;

int main()
{
	asm("pushl %ecx\n\t"
	    "movl n ,%ecx\n\t"
	    "movl $0 ,sum\n\t"
	    "lp:cmpl $0 ,%ecx\n\t"
	       "jz end\n\t"
	       "addl  %ecx,sum\n\t"
	       "dec %ecx\n\t"
	       "jmp lp\n\t"
	       "end:\n\t"
	       "popl %ecx\n\t");
	printf("\nsum is:%d",sum);
}
