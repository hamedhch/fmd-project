#ifndef _TOUCH_H_
#define _TOUCH_H_

#include	"SYSCFG.h";

#define  TX      PA7
#define  TX_IO_ADDR      TRISA
#define  TX_IO      	0x80



#define   IO_TOUCH_ATTR	                     0x00FF	//定义所使用的按键Bit 0~7对应key1~key8，0不使用，1使用


#define MULTIPLE_1   								80    //放大倍数

const unsigned char     IO_TOUCH_ATTR1   = IO_TOUCH_ATTR;
const unsigned char     Multiple = MULTIPLE_1;

void SendDataToPC();

#endif
