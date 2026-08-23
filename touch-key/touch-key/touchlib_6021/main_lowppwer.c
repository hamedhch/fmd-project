//********************************************************* 
/*  文件名：main.c    
*   IC:     FT62F211 SOP8	      			---------------------
*/
//*********************************************************
#include "Touch.h"
//**********************************************************
//***********************宏定义*****************************
#define  unchar   unsigned char 
#define  unint      unsigned int
#define  unlong   unsigned long

unsigned char GKeyValue=0;	
unsigned int StartTouchTime;//开始扫描时间   //40
unsigned int  sleeptime=0;		//
bit      awaken; 
bit     sleepflag;

//**************中断处理**********************************
void interrupt ISR(void)//PIC_HI-TECH使用
{ 
    
	if(T0IE && T0IF)
    {
	    T0IF = 0;
 		TMR0 = 206;                       
        StartTouchTime++;     
        sleeptime++;
    }   
 
} 
  //----------------------------------------------------*/
/*----------------------------------------------------
 *	函数名称：TIMER0_INITIAL
 *	功能：初始化设置定时器
 *	相关寄存器：T0CS T0SE PSA 
 *	设置TMR0定时时长0.4MS=(1/16000000)*4*32*255(16M-4T-PSA 1:32- TMR0=255溢出)	                      
 ----------------------------------------------------*/
void TIMER0_INITIAL (void)  
{
    TMR0 = 206;           //8us*(255-120)=1MS          
    T0IF = 0;				//清空T0软件中断
    T0IE = 1;				//开定时器/计数器0中断
}

/*-------------------------------------------------
 *  函数名：POWER_INITIAL
 *	功能：  上电系统初始化
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void SYS_INITIAL (void) //时钟先8M 写完PCON (bit7),OPTION(all bit),LVDCON(bit2),后换回16M
{
	 
	OSCCON = 0B01100000;//WDT 32KHZ IRCF=110=8MHZ/4=4MHZ,0.25US/T
											//Bit0=1,系统时钟为内部振荡器
											//Bit0=0,时钟源由FOSC<2：0>决定即编译选项时选择
	OPTION = 0B00000100;	//Bit5 T0CS Timer0时钟源选择 
							//1-外部引脚电平变化T0CKI 0-内部时钟(FOSC/2)
							//Bit4 T0CKI引脚触发方式 1-下降沿 0-上升沿
							//Bit3 PSA 预分频器分配位 0-Timer0 1-WDT 
							//Bit2:0 PS2 8个预分频比 100 - 1:32
                            
    LVDCON  = 0x03;   	//bit2 0:不经过去抖电路  bit[1:0] 00:vdd 01:pa5 10:pa4 11:touch
    PCON	= 0x88;		//开LVD  bit3 低电压侦测使能   bit[7:4]=1xxx 1.2v

	OSCCON = 0B01110000;//WDT 32KHZ IRCF=110=16MHZ/4=4MHZ,0.25US/T?
	INTCON = 0;  					//暂禁止所有中断
	PORTA = 0;
	TRISA =  0B00001111;		// 0-输出 1-输入  
	WPUA =  0B00000000;     	//PA端口上拉控制 1-开上拉 0-关上拉
    PSRCA = 0B00000000;        //PA4,PA5源电流能力设置为0
									   
}


/*-------------------------------------------------
 * 函数名称：WDT_INITIAL
 * 功能：	   初始化设置看门狗128MS时间复位
 -------------------------------------------------*/
void WDT_INITIAL (void) 
{
  
	CLRWDT();  				//清看门狗
	PSA=0;     				//时钟分频分给WDT
	if(WAKEUPFREQUENCY==16)
    {
        WDTCON = 0B00001101;
    }
    else if(WAKEUPFREQUENCY==8)//WDTPS=0111=1:4096,PS=000=1:1	定时时间=(4096*1)/32000=128ms
    {
        WDTCON = 0B00001111; 
    }
    else
    {
        WDTCON = 0B00010001;
    }  	

}
/*-------------------------------------------------
 * 函数名称：TouchSleep_init
 * 功能：	    睡眠醒来初始化
 -------------------------------------------------*/
void TouchSleep_init()
{
    if (IO_TOUCH_ATTR1 & 0x01) 
    TRISA0 =1; 
	if (IO_TOUCH_ATTR1 & 0x02) 
    TRISA1 =1;
    if (IO_TOUCH_ATTR1 & 0x04) 
    TRISA2 =1;
    if (IO_TOUCH_ATTR1 & 0x08) 
    TRISA3 =1;
}

/*------------------------------------------------------------------------------------------
 *  函数名:  main 
 *	功能：  主函数
 *  输入：  无
 *  输出：  无
 ----------------------------------------------------------------------------------------------*/
void main()
{
   unsigned char x;
	SYS_INITIAL();				//系统初始化
    TIMER0_INITIAL();  		//初始化T0
	  
    WDT_INITIAL();			//初始化watchdog

	Touch_init();
    GIE = 1;


	while(1)
	{
        CLRWDT();
//--------------------------------------------------------------休眠处理        
		if(sleepflag==1)
        {
            if(sleeptime>=2500)			//1S后进入休眠
            {  
					sleeptime = 0;  			
#asm
StartSleep:
#endasm    
				//
                TRISA = 0;//睡眠前配置IO口
				SLEEP(); 
				TouchSleep_init();
                awaken=1; 
                for(x=0;x<TouchCount; x++)
				{
					TouchKeyScan();    
				} 
				if(awaken==1)
                {
					#asm  
						goto StartSleep
					#endasm
                }
                  
			} 
               
		}
     		 
//----------------------------------------------------------------------------------
		if(StartTouchTime >= (2500/SCANNINGTIME/TouchCount))//扫描时间 根据扫描周期及按键个数计算.
        {
			StartTouchTime = 0;	
			GKeyValue = TouchKeyScan(); //按键扫描并获取按键值	
            if(GKeyValue != 0)  //有按键
            {
					sleepflag = 0;
                    sleeptime = 0;
			}
            else
            {
                sleepflag = 1;  // 无按键进入睡眠 可根据实际情况更改进入睡眠条件
			}
            
        }       
    }
                    
}


