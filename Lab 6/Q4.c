#include <LPC17xx.h>
#include <stdio.h>

unsigned long i, count;

int main(void) {
    LPC_PINCON->PINSEL3 &= 0x0000FFFF;

    LPC_GPIO1->FIODIR |= 0xFF000000;  

    while (1) {
        for (count = 0; count < 256; count++) {
            LPC_GPIO1->FIOPIN = (count << 24);

            for (i = 0; i < 10; i++);  
        }
    }
}
