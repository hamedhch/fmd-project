/**
  *********************************************************************************
  * @file    	    main.c
  * @author  	    FMD AE
  * @brief   	    Device: FT62F13X
  *                             Memory: Flash 3KX14b, SRAM:256X8b EEPROM 128X8b  
  *                             主函数，touch库的使用示例	
  * @version 	    V2.0.0           
  * @data		    2021-12-29
  *********************************************************************************
  * @attention
  * COPYRIGHT (C) 2021 Fremont Micro Devices Corporation All rights reserved.
  *    This software is provided by the copyright holders and contributors,and the
  *software is believed to be accurate and reliable. However, Fremont Micro Devices
  *Corporation assumes no responsibility for the consequences of use of such
  *software or for any infringement of patents of other rights of third parties,
  *which may result from its use. No license is granted by implication or otherwise
  *under any patent rights of Fremont Micro Devices Corporation.
  **********************************************************************************
*/
//===========================================================
//include definition
//===========================================================
#include	"SYSCFG.h";
#include	"touch.h";
#include	"led.h"; //demo_test

//===========================================================
//Variable definition
//===========================================================
unsigned char strongest = 0; //demo_test
unsigned char Sav_strongest = 0; //demo_test

/******************************************************************************
  * @brief  DelayUs program
  * @Description  延时函数
  * @param  time
  * @note   
  * @retval  None
  *****************************************************************************
*/

void DelayUs(unsigned int Time)
{    
	unsigned int a;
	for(a=0;a<Time;a++)
	{
		NOP();
	}
}

/******************************************************************************
  * @brief  interrupt ISR	program
  * @Description  中断入口函数
  * @param  None
  * @note   
  * @retval  None
  *****************************************************************************
*/

void interrupt ISR(void)  
{ 
    
}  

/******************************************************************************
  * @brief  SYS_INITIAL	program
  * @Description  系统时钟、IO初始化
  * @param  None
  * @note   
  * @retval  None
  *****************************************************************************
*/

void SYS_INITIAL (void) 
{
	OSCCON = SYS_OSCCON;   //0B01110001 ；//WDT 32KHZ IRCF=110=16MHZ/4=4MHZ,0.25US/T
							//Bit0=1,系统时钟为内部振荡器
							//Bit0=0,时钟源由FOSC<2：0>决定即编译选项时选择
                            
	OPTION = 0B00001000;	//Bit3 PSA   预分频器分配位 0= 预分频器分配给Timer0模块 1：分配给WDT 
							//Bit2：0：预分频比选择位 000: 1:2 
									   
	INTCON = 0;  			//暂禁止所有中断
		
	PORTA = 0B00000000;
	PORTC = 0B00000000;
	PORTB = 0B00000000;
		
	TRISA = 0B00000100;		// 0-输出 1-输入   PA2(TKCAP) set input
	TRISB = 0B00000000;		// B2-B7  TK7-TK2
	TRISC = 0B00000000;     // C0-C1  TK1-TK0
		
	WPUA = 0B00000000;     	//PA端口上拉控制 1-开上拉 0-关上拉
	WPUB = 0B00000000;
		
	ANSEL0 = 0B00000100;      // TKCAP （A2）设为模拟输入脚			  
}

/******************************************************************************
  * @brief  WDT_INITIAL	program
  * @Description  初始化设置看门狗为16位计数器，用于SLEEP模式的128ms唤醒
  * @param  None
  * @note   
  * @retval  None
  *****************************************************************************
*/

void WDT_INITIAL (void) 
{
	CLRWDT();              //清看门狗
	WDTCON = 0B00001111;   //bit[6:5]WCKSRC=00=LIRC(32K) 
						   //bit[4:1]WDTPS=0110=1:2048,预分频1:1 定时时间=(4096*1)/32000=128ms  
						   //bit[0]SWDTEN= 1 开启                      	                  
}


/******************************************************************************
  * @brief  main	program
  * @Description 主函数
  * @param  None
  * @note   
  * @retval  None
  *****************************************************************************
*/

void main(void)
{ 
	SYS_INITIAL(); //系统时钟、IO初始化   
	TOUCH_INITIAL();//触摸按键初始化
	WDT_INITIAL(); //看门狗初始化
	PEIE = 1;  //使能外设中断
	GIE = 1; //使能全局中断
		
	LED();  //led.c demo_test 
		 
	while (1)
	{
		//清看门狗   
		CLRWDT();   
		
		//按键扫描  
		TSC_Start(); 
			
		//按键处理
		if(TSC_DataProcessing()==1)
		{			                         
			//////demo_test/////////////////////
			strongest = TSC_GetStrongest(); 
			if(Sav_strongest != strongest)
			{
				LED_Scan(); //led.c  按键按下点亮对应的led
			}
			Sav_strongest = strongest;   
			//////demo_test/////////////////////
		}              
	}     
}

//===========================================================
