#ifndef	_DIS_H_
#define	_DIS_H_
#include "syscfg.h"
#include "FT60F21X.h"
 
//#include "user.h"
//TM1638模块引脚定义
//#define 	DIO RC3
//#define 	CLK RC1
//#define 	STB RC0

#define 	TX	RA5
#define 	DIO RA5
#define 	CLK RA6
//#define 	STB RA7
void TM1638_Write(unsigned char	DATA);
unsigned char TM1638_Read(void)	;
void Write_COM(unsigned char cmd);		//发送命令字
unsigned char Read_key(void);
void Write_DATA(unsigned char add,unsigned char DATA);
void Write_allLED(unsigned char LED_flag);
void init_TM1638(void);
void Dis10(int a);
void Dis1010(int a);
void Dis16(int a,int b);
void Dis1610(int a,int b);

void uart_tx(unsigned char data);
void SEND_16(unsigned int data);

extern void DelayUs(unsigned char Time);
#endif	

