#include<stdio.h>
#include<LPC17xx.h>

unsigned int i,j;
unsigned long LED = 0x00000010;
unsigned long abc;

void delay();

int main(void){
	SystemInit();
	SystemCoreClockUpdate();
	
	LPC_PINCON->PINSEL0 = 0;
	LPC_GPIO0->FIODIR = 0x00000FF0;
	
	while(1){
		delay();
		abc = LPC_GPIO0->FIOPIN;
		if((abc&0x10)==0){
			LPC_GPIO0->FIOSET = 0x10;
		}
		else{
			
		}
	}
	
}

void delay(){
	for(int i = 0;i<100000;i++);
}