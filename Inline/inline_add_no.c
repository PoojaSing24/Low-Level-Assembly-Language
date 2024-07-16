//add given two number-----------
//
#include<stdio.h>
#include<stdlib.h>

int data1=10;
int data2=20;
int result;

int main()
{
	asm("movl data1 ,%eax\n\t"
	     "addl data2 , %eax\n\t"
	     "movl %eax,(result)");
	printf("Addition is: %d",result);
	printf("\n\t");
	//printf("hello\n\t");
	
}


