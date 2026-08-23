
//Test All version
//2020.03.25

#include "syscfg.h"
#include "touch.h"
#include "Delay.h" 

//===========================================================
//Variable definition
volatile char W_TMP  @ 0x70 ;//系统占用不可以删除和修改
volatile char BSR_TMP  @ 0x71 ;//系统占用不可以删除和修改
void user_isr();//用户中断程序，不可删除
//===========================================================
volatile unsigned int 	readKeyNum;     							//返回的键值  bit0~bit14对应key1~key15  0没有按下，1按下
volatile unsigned char  fmd_a,fmd_u;

volatile unsigned delaydata[]={20,20,13,11,9,7,5,3,1,1,1,1,1,1,1,1,1};
//----------------------------------------------------- 
void interrupt ISR(void)
{
#asm;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
	NOP;//系统设置不可以删除和修改
#endasm;//系统设置不可以删除和修改

	user_isr(); //用户中断函数
}
//===========================================================
//Function name：user_isr
//parameters：无
//returned value：无
//===========================================================
void user_isr() //用户中断函数
{
}
//-----------------------------------------------------
void SysInit(void)
{
	OSCCON = 0B01100001;		//WDT 32KHZ IRCF=110=8M Hz
												//Bit0=1,系统时钟为内部振荡器
												//Bit0=0,时钟源由FOSC<2：0>决定即编译选项时选择
	INTCON = 0;  						//暂禁止所有中断
    PORTA   = 0B00000000;		
	TRISA    = 0B11110011;		//PA输入输出 0-输出 1-输入
											 
	PORTB = 0B00000000;		
	TRISB  =  0B10111111;		//PB输入输出 0-输出 1-输入							
	PORTC = 0B00000000; 	
	TRISC  =  0B11111111;		//PC输入输出 0-输出 1-输入  	
    PORTD = 0B00000000;		
	TRISD  = 0B11111111;		//PD输入输出 0-输出 1-输入
	
	WPUA = 0B00000000;     	//PA端口上拉控制 1-开上拉 0-关上拉
	WPUB = 0B00000000;     	//PB端口上拉控制 1-开上拉 0-关上拉
	WPUC = 0B00001000;     	//PC端口上拉控制 1-开上拉 0-关上拉
	WPUD = 0B00000000;     	//PD端口上拉控制 1-开上拉 0-关上拉

	TX_IO_ADDR  &= ~TX_IO;
}

//===========================================================
//Funtion name：main
//parameters：    无
//returned value：无
//===========================================================
void main(void)
{
	SysInit();
    
	fmd_a=0;                
	for(fmd_u=0;fmd_u<15;fmd_u++)
	{
		if((IO_TOUCH_ATTR >> fmd_u) & 0x01) 		
		{
			fmd_a++;
		}
	}
    
	while(1)
	{  
		SendDataToPC();        
		DelayMs(delaydata[fmd_a]);
	}
}






