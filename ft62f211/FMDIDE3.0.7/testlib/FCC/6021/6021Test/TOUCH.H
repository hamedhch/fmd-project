#ifndef	_TOUCH_
#define	_TOUCH_
#define  IO_TOUCH_ATTR	    0x000f// 	KEY 3~2~1~0        对应通道  1为开启，0为不开启



const unsigned char     IO_TOUCH_ATTR1   = IO_TOUCH_ATTR;


void SendDataToPC();
#endif


