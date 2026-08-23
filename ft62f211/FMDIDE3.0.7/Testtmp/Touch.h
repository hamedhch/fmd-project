#ifndef _TOUCH_H_
#define _TOUCH_H_

#include	"SYSCFG.h";

#define  TX      PA1
#define  TX_IO_ADDR      TRISA
#define  TX_IO      	0x2



#define   IO_TOUCH_ATTR	                     0x0008	//定义所使用的按键Bit 0~3对应key1~key4，0不使用，1使用

const unsigned char     IO_TOUCH_ATTR1   = IO_TOUCH_ATTR;
void SendDataToPC();

#endif
