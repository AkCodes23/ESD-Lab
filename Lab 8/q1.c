#include <LPC17xx.h>
#include <stdio.h>

unsigned char seven_segment[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x7,0x7F,0x6F,0x77,0x7C,0x39,0x5E,0x79,0x71};
int main()
{
	int i,x,j,n,number=0,count=0;	
	SystemInit();
	SystemCoreClockUpdate();
	
	LPC_PINCON -> PINSEL0 = 0;
	LPC_PINCON -> PINSEL1 = 0;
	//LPC_PINCON -> PINSEL3 = 0;
	LPC_GPIO0 -> FIODIR = 0xFF << 4;
	LPC_GPIO1 -> FIODIR = 0xF << 23;
	//LPC_GPIO2 -> FIODIR = 0;

	while(1){
		n=number;
		for(i=0;i<4;i++){
			LPC_GPIO1->FIOPIN=i<<23;
			LPC_GPIO0->FIOPIN=seven_segment[n%10]<<4;
			n=n/10;
			for(j=0;j<2000;j++);
		}
		count++;
		if(count==250){
			count=0;
			
			x=(((LPC_GPIO0->FIOPIN >> 21)&(1) )== 1);
			if(((LPC_GPIO0->FIOPIN >> 21)&(1) )== 1){
				number = (number+1)%10000;
			}
			else{
				number = (number-1)%10000;
				if(number<0)
					number=9999;
			}
		}
	}
}
