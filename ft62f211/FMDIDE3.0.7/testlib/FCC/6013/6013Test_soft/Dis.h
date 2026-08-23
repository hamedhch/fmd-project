#ifndef	_DIS_H_
#define	_DIS_H_
#include "syscfg.h"
 

void uart_tx(unsigned char data);
void SEND_16(unsigned int data);
void SEND_16asc(unsigned int data);
void  SendHead();
void SendDataToPC();


#endif	

