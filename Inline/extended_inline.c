//extended inline function
//used local variable direct
//sysntacx for 
//::=>output is nothing



#include<stdio.h>
int main()
{
	int data1=10; 
	int data2=20;
	int result;
	asm("add %%ebx ,%%edx\n\t"
	      "movl %%edx ,%%eax" : "=a"(result): "b"(data1),"d"(data2));
	printf("the result is: %d\n",result);
	return 0;
}
