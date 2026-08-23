/**
  *********************************************************************************
  * @file    	    main.c
  * @author  	    FMD AE
  * @brief   	    Device: FT62F28X
  *                 Memory: Flash 8KX14b, EEPROM 128X8b, SRAM 616X8b
  *                 主函数，touch库的使用示例	
  * @version 	    V2.0.1           
  * @data		    2022-04-08
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
#include	"led.h";

//===========================================================
//Variable definition
//===========================================================
unsigned char strongest = 0; //demo_test
unsigned char Sav_strongest = 0; //demo_test

unsigned char temp = 0;

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
    
	TRISA =  0B00000000;	// 0-输出 1-输入     RA4 -
    TRISB =  0B00000000;	// B4-B7  TK5-TK2    PB7--touch
    TRISC =  0B00000000;
    TRISD =  0B00100000;	// TKCAP PD5
//	TRISD =  0B00100100;	// TKCAP PD5  //PD2 遥控器的机械按键IO
    
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

/**********************************************************************************
  * @brief  Sleep_Enable  program.
  * @param  None
  * @note   进出睡眠的相关处理
  * @retval None
  *********************************************************************************
*/
void Sleep_Enable(void)
{ 
   if(bSleepMode == 1)
   {
         bSleepMode = 0;
       
//////////触摸按键低功耗处理，请勿修改///////////////////////
         TKON = 0; //触摸按键寄存器	       		//2CLK    
         TKEN0 = 0; //关闭按键通道寄存器     	//1CLK
         TKEN1 = 0; //关闭按键通道寄存器      	//1CLK
         TKEN2 = 0; //关闭按键通道寄存器      	//2CLK
         TKEN3 = 0; //关闭按键通道寄存器      	//1CLK 
         LVDEN = 0; //关闭LVD侦测功能    		//3CLK      
         T0CON0 = 0x01; //关闭T0CKRUN        	//1CLK 
         ///////////////////////////////               
		 SLEEP();  //进入睡眠	  				//1CLK                  
         ///////////////////////////////                
         T0CON0 = 0x05; //开启T0CKRUN           //1CLK      
         LVDEN = 1; //开启LVD侦测功能           //3CLK               
         bSleepScanEnable = 1; //启动睡眠扫描     //2CLK       
//////////触摸按键低功耗处理，请勿修改///////////////////////

	}
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
    
    LED(); //led.c  demo_test
    
 	////触摸按键低功耗处理标志////////////////////
    bSleepUserFlag = 1;   //为1表示可进入低功耗，用户可以使用这个标志来控制是否要进入低功耗状态
    bSleepUserWakeFlag = 0; //设置为1表示强制退出低功耗，用户可以使用这个标志来控制是否强制退出低耗
    ////触摸按键低功耗处理标志////////////////////
    
//	//////demo_test/////////////////////
//	TRISC |= 0B00000001; //PC0设为输入
//    //////demo_test/////////////////////
    
    while (1)
    {
		//清看门狗   
	    CLRWDT();  
//////////触摸按键低功耗处理，请勿修改///////////////////////
        if(bSleepScanEnable == 1)
        {
//            //////demo_test/////////////////////
//            if(PC0==1)//检测到PC0高电平将bSleepUserWakeFlag置1
//            {
//                bSleepUserWakeFlag = 1; //设置为1表示强制退出低功耗，用户可以使用这个标志来控制是否强制退出低耗
//            }
            //////demo_test/////////////////////
            
            if(TSC_SleepPrcoessing()==1) //被按键唤醒退出低功耗模式 或 bSleepUserWakeFlag=1，强制退出低功耗
            {
                GIE = bIEBackupsFlag;
				bSleepUserWakeFlag = 0; //强制唤醒标志清除
                 
                //////--start--退出低功耗模式用户自定义处理/////                
				//用户自定义处理
                //////--end---退出低功耗模式用户自定义处理/////
            }   																	
        }
        else
//////////触摸按键低功耗处理，请勿修改///////////////////////
        {  
            //按键扫描
            TSC_Start(); 
            
			if(TSC_DataProcessing()== 1) //返回1表示所有按键处理完成一次。
			{
				//////demo_test/////////////////////
				strongest = TSC_GetStrongest();
				if(Sav_strongest != strongest)
				{
					LED_Scan(); //led.c  按键按下点亮对应的led                   
				}
				Sav_strongest = strongest;
				//////demo_test/////////////////////
                
				if(bSleepMode == 1) //1为表示要进入低功耗
                {          
					 bIEBackupsFlag = GIE;  
					 GIE = 0;	  
					 ////start--进入低功耗用户自定义处理////////////////////			
					 
					 ////end---进入低功耗用户自定义处理/////////////////////             
                }  
			}
            
        }
                		
//////////触摸按键低功耗处理，请勿修改////////////////////////////////////////
        Sleep_Enable();       
//////////触摸按键低功耗处理，请勿修改///////////////////////////////////////
        
    }     
    
}

//===========================================================
