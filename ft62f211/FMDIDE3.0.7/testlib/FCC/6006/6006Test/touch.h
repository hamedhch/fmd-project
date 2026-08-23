
#ifndef	_TOUCH_
#define	_TOUCH_

#define  IO_TOUCH_ATTR	   0x007f	//定义所使用的按键Bit 0~14对应key1~key15，0不使用，1使用	                   								

#define  ANTI_WATER     	0  	//1,防水,0,不防水
#define  LOW_POWER    	1  	//1,开低功耗,0不开启低功耗
#define  CSTYPE				0  	//0,选频不使能,不为0,选频使能

const unsigned char  	ANTI_WATER1=ANTI_WATER;
const unsigned char  	LOW_POWER1=LOW_POWER;
const unsigned char  	CSTYPE1=CSTYPE;

const  unsigned int    IO_TOUCH_ATTR1 = IO_TOUCH_ATTR;
void SendDataToPC();

#endif	
