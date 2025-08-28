#include <LPC17XX.h>  

int i;
int main(){
	
LPC_PINCON -> PINSEL1 &= 0x0000FFFF;
LPC_GPIO1 ->FIODIR = 0xFF000000;	

while(1){
LPC_GPIO1 -> FIOSET=0xFF000000;
for(i=0;i<=1000;i++);
LPC_GPIO1 -> FIOCLR=0xFF000000;
}
}
