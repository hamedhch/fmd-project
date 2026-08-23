#ifndef     TOUCH_H
#define     TOUCH_H

#include	"SYSCFG.h";

//如果通讯要换成其他IO口修改此处， 注意main.c文件内SysInit函数里对应的通讯IO口要设成输出
#define  TX      PC5
#define  TX_IO      	0x20
#define  TX_IO_ADDR  TRISC   

#define BANKSEL4_7	MSCON1|=0X02;
#define BANKSEL0_3	MSCON1&=~0X02;

volatile unsigned int           TransferData     @ 0x70; //前后两个bank传递参数
volatile unsigned int           TransferAddr    	@ 0x72; //前后两个bank传递参数

#define Multiple1      50   //放大倍数. 


const unsigned char  Multiple=Multiple1;


#define   KEY0_ON					0
#define   KEY1_ON					0
#define   KEY2_ON					0
#define   KEY3_ON					1
#define   KEY4_ON					1
#define   KEY5_ON					1
#define   KEY6_ON					1
#define   KEY7_ON					1
#define   KEY8_ON					1
#define   KEY9_ON					1
#define   KEY10_ON					1
#define   KEY11_ON					0
#define   KEY12_ON					0
#define   KEY13_ON					0
#define   KEY14_ON					0
#define   KEY15_ON					0
#define   KEY16_ON					0
#define   KEY17_ON					0
#define   KEY18_ON					0
#define   KEY19_ON					0
#define   KEY20_ON					0
#define   KEY21_ON					0
#define   KEY22_ON					0
#define   KEY23_ON					0
#define   KEY24_ON					0
#define   KEY25_ON					0
#define   KEY26_ON					0
#define   KEY27_ON					0

//林敏度
const unsigned char ACTIVE_SENSOR_DELTA[28]=
{
 KEY0_ON, KEY1_ON, KEY2_ON, KEY3_ON, KEY4_ON, KEY5_ON, KEY6_ON, KEY7_ON,
 KEY8_ON, KEY9_ON, KEY10_ON,KEY11_ON,KEY12_ON,KEY13_ON,KEY14_ON,KEY15_ON,
 KEY16_ON,KEY17_ON,KEY18_ON,KEY19_ON,KEY20_ON,KEY21_ON,KEY22_ON,KEY23_ON,
 KEY24_ON,KEY25_ON,KEY26_ON,KEY27_ON   
};
void Write_SpecialRam(unsigned int addr,unsigned int data);
unsigned int  Read_SpecialRam(unsigned int addr);
void ReadCap(unsigned char chset) ;
unsigned char  TSC_DataProcessing();

void TSC_Start(void);
void Touch_init();
#endif

























