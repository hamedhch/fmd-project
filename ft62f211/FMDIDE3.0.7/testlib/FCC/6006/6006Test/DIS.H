#ifndef	_DIS_H_
#define	_DIS_H_
#include "syscfg.h"
 
 
#define     TX  RB6

void uart_tx(unsigned char data);
void SEND_16(unsigned int data);
void  SendHead();
void  SendHead1();

#endif	

