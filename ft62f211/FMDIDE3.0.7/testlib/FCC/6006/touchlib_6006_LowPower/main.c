
#include "common.h"
#include "syscfg.h"
#include "touch.h" 

extern volatile unsigned char WSPosition1; //第一组滑条或滚轮位置输出
extern volatile unsigned char WSPosition2; //第二组滑条或滚轮位置输出

extern   uint8_t      		fmd_channels;
volatile  uint16_t 	        readKeyNum;     //返回的键值  bit0~bit14对应key1~key15  0没有按下，1按下
uint16_t  lastkey=0;
BOOL      f_lowpower=0;  					//低功耗调用标志,休眠时置1调用 TouchKeyScan() 可降低功耗

uint16_t   TouchTimeCount;
//----------------------------------------------------- 
void interrupt ISR(void)
{
     if(T4UIE && T4UIF)                	
	{
		T4UIF = 1;                            
        
		TouchTimeCount++;
	} 
}
//-----------------------------------------------------
void SysInit(void)
{
	OSCCON = 0B01110001;		//WDT 32KHZ IRCF=111=16M Hz
												//Bit0=1,系统时钟为内部振荡器
												//Bit0=0,时钟源由FOSC<2：0>决定即编译选项时选择
	INTCON = 0;  						//暂禁止所有中断
}
//***********************************************************************
//函数名称：WDT_INITIAL
//功能：   初始化设置看门狗1S时间复位
//相关寄存器：
//***********************************************************************
void WDT_Initial(void) 
{
	CLRWDT();              				//清看门狗
    MISC0  = 0B00000000;   	//看门狗时钟32k
    
	if(WAKEUPFREQUENCY==16)
    {
        WDTCON = 0B00001100;
    }
    else if(WAKEUPFREQUENCY==8)
    {
        WDTCON = 0B00001110; 
    }
    else
    {
        WDTCON = 0B00010000;
    }  	
												//休眠唤醒时间=(4096*1)/32000=128ms    
                                                //修改唤醒时间可以调节功耗，唤醒时间越短，功耗越大                                    
}
/*-------------------------------------------------
 *	函数名称：Time4Initial
 *	功能：  
 *	输入参数：
 *	返回参数：无 
 -------------------------------------------------*/
void Time4Initial(void)
{
	PCKEN |=0B00001000;      //TIME4模块时钟使能
    //CKOCON=0B00110000;
    //TCKSRC=0B00000011;		
    
    TIM4CR1	=0B00000101;
    //BIT7: 0：TIM1_ARR寄存器没有缓冲，它可以被直接写入; 1：TIM1_ARR寄存器由预装载缓冲器缓冲。
    //BIT6:保留
    //BIT5~BIT4:timer4时钟选择位。
        		//00：系统时钟/主时钟
				//01：内部快时钟HIRC
				//10：LP时钟，只有当FOSC选择LP模式时才有意义
				//11：XT时钟，只有当FOSC选择XT模式时才有意义

    //BIT3:
    //			0：在发生更新事件时，计数器不停止；
	//			1：在发生下一次更新事件(清除CEN位)时，计数器停止。

    //BIT2:
   	// 		0：如果UDIS允许产生更新事件，则下述任一事件产生一个更新中断：
				//寄存器被更新(计数器上溢/下溢)
				//软件设置UG位
				//时钟/触发控制器产生的更新
	//		1：如果UDIS允许产生更新事件，则只有当下列事件发生时才产生更新中断，并UIF置1：
				//寄存器被更新(计数器上溢/下溢)

    //BIT1:
    //		0：一旦下列事件发生，产生更新(UEV)事件：
				//计数器溢出/下溢
				//产生软件更新事件
				//时钟/触发模式控制器产生的硬件复位被缓存的寄存器被装入它们的预装载值。
	//		1：不产生更新事件，影子寄存器(ARR、PSC、CCRx)保持它们的值。如果设置了UG位或时钟/触发控制器发出了一个硬件复位，则计数器和预分频器被重新初始化。

    // BIT0: 0：禁止计数器；1：使能计数器。


    TIM4IER	=0B00000001;
    //BIT0:  0：禁止更新中断；1：允许更新中断。

    TIM4SR	=0B00000000;
    //BIT0:当产生更新事件时该位由硬件置1。它由软件写1清0
			//0：无更新事件产生；
			//1：更新事件等待响应。当寄存器被更新时该位由硬件置1：
			//若TIM4_CR1寄存器的UDIS=0，当计数器上溢或下溢时；
			//若TIM4_CR1寄存器的UDIS=0、URS=0，当设置TIM4_EGR寄存器的UG位软件对计数器
			//CNT重新初始化时；
			//若TIM4_CR1寄存器的UDIS=0、URS=0，当计数器CNT被触发事件重新初始化时。

    TIM4EGR	=0B00000000;
    //BIT0:该位由软件置1，由硬件自动清0。
	//0：无动作；
	//1：重新初始化计数器，并产生一个更新事件。注意预分频器的计数器也被清0(但是预分频系数不变)。若在中心对称模式下或DIR=0(向上计数)则计数器被清0；若DIR=1(向下计数)则计数器取TIM1_ARR的值。

    TIM4CNTR=0; //TIM4 8位计数器
    
    TIM4PSCR=0B00000111;
    //预分频器对输入的CK_PSC时钟进行分频。
	//计数器的时钟频率fCK_CNT等于fCK_PSC/2(PSC[2:0])。PSC[7:3]由硬件清0。
	//PSCR包含了当更新事件产生时装入当前预分频器寄存器的值(包括由于清除TIMx_EGR寄存器的UG位产生的计数器清除事件)。这意味着如要新的预分频值生效，必须产生更新事件或者CEN=0。

    TIM4ARR	=124;
    //ARR包含了将要装载入实际的自动重装载寄存器的值。
	//当自动重装载的值为空时，计数器不工作。

    INTCON |= 0B11000000;    //开总中断和外设中断
  }
//***********************************************************************
void main(void)
{
	SysInit();
  
	Time4Initial();
   
    TouchInital();
    WDT_Initial();

	while(1)
	{       
           CLRWDT();
            
           if(TouchTimeCount>=(1000/SCANNINGTIME))   			
		   {
				TouchTimeCount = 0;
				//f_lowpower=0;
				readKeyNum = TouchKeyScan();  	//按键扫描并获取按键值 
           }
			//-----------------------以下用户代码-----------------------------        
			if(readKeyNum!=0)  											//有按键
			{    
				if(lastkey !=readKeyNum)		
				{    
					NOP();				               
				}
				 lastkey =  readKeyNum;
			}
			else
			{
				lastkey=0;
			}			
	}
}

























