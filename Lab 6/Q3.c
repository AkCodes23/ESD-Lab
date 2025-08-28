#include <LPC17XX.h>  
#include <stdio.h>
unsigned long i,x;
int main(){
	
LPC_PINCON -> PINSEL3 &= 0x0000FFFF;

LPC_GPIO1 ->FIODIR = 0xFF000000;	

while(1){
x=0x01000000;
for(i=0;i<=8;i++){
LPC_GPIO1 -> FIOSET=x;
x=x<<1;}

x=0x01000000;
for(i=0;i<=8;i++){
LPC_GPIO1 -> FIOCLR=x;
x=x<<1;}
}
}
