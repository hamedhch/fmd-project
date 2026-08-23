/**
  *********************************************************************************
  * @file    	    main.c
  * @author  	    FMD AE
  * @brief   	    Device: FT62F28X
  *                 Memory: Flash 8KX14b, EEPROM 128X8b, SRAM 616X8b
  *                 主函数，touch库的使用示例	
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

//===========================================================
//Variable definition
//===========================================================
unsigned char temp = 0;

extern void SendDataToPC(void);
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
  * @Description  中断入口函数 ，注意BANK的切换
  * @param  None
  * @note   
  * @retval  None
  *****************************************************************************
*/

void interrupt ISR(void) 
{ 
		//进中断时bank保护
		if(AUXPGE==0) //BANK0-3
		{
			temp = 0;
		}
		else
		{
			AUXPGE = 0;
			temp = 1;
		}   
        		
        
        //进中断时bank保护恢复
		if(AUXPGE==0)//BANK0-3
		{
			AUXPGE = temp ;
		}
		else
		{
			AUXPGE = 0;
			AUXPGE = temp ;
		}
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
	 
	OSCCON = SYS_OSCCON;//0B01110001;    //WDT 32KHZ IRCF=110=16MHZ/4=4MHZ,0.25US/T
							//Bit0=1,系统时钟为内部振荡器
							//Bit0=0,时钟源由FOSC<2：0>决定即编译选项时选择
                            
	OPTION = 0B00001000;	//Bit3 PSA   预分频器分配位 0= 预分频器分配给Timer0模块 1：分配给WDT 
							//Bit2：0：预分频比选择位 000: 1:2 
                            
    	INTCON = 0;  			//暂禁止所有中断
    
	PORTA = 0;
	PORTB = 0;
    	PORTD = 0;
    	PORTC = 0;
    
	TRISA = 0B11111111;	// 0-输出 1-输入     RA4 -
    	TRISB = 0B11111111;	// B4-B7  TK5-TK2    PB7--touch
    	TRISC = 0B11111111;
    	TRISD = 0B11111111;	// TKCAP PD5
    
   	ANSEL1 = 0B10000000;     // TKCAP （D2）设为模拟输入脚		
    
	BANKSEL4_7;
	WPUA =  0B00000000;     //PA端口上拉控制 1-开上拉 0-关上拉
    	WPUB =  0B00000000;
	WPUC =  0B00000000;
	WPUD =  0B00000000;
	WPDA =  0B00000000;     //PA端口上拉控制 1-开上拉 0-关上拉
    	WPDB =  0B00000000;
	WPDC =  0B00000000;
	WPDD =  0B00000000;   
    	BANKSEL0_3;	

	TX_IO_ADDR  &= ~TX_IO;	   
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
	CLRWDT();     			//清看门狗
	WDTCON = 0B00001111;    //bit[6:5]WCKSRC=00=LIRC(32K) 
							//bit[4:1]WDTPS=0110=1:4096,预分频1:1 定时时间=(4096*1)/32000=128ms  
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

void main(void )
{
    SYS_INITIAL ();//系统时钟、IO初始化   
    //////////////////////////////////////////////////
    //touch库资源使用详情请看touch.h说明
    TOUCH_INITIAL();//触摸按键初始化
    
    //低功耗定时，请勿关闭 
	WDT_INITIAL(); //看门狗初始化
    //////////////////////////////////////////////////
    
    PEIE = 1;  //使能外设中断
	GIE = 1;  //使能全局中断
    
	while(1)
	{
		//清看门狗   
		CLRWDT();  
        
		//按键扫描
		TSC_Start(); 

       		DelayUs(5000);
		DelayUs(5000); //20220401 延时加长上传给上位机
		DelayUs(5000); //20220401 延时加长上传给上位机
        
       		//发送数据
		SendDataToPC();
        
        		_nop();
       		_nop();
	}                
}

//===========================================================
