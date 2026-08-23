//********************************************************* 
/*  文件名：
*	 功能：    FT60F21x-touch功能演示
*   IC:         
*   晶振：   16M/4T                    
*   说明：   程序实现一路触摸按键
*                FT62F021F-MRB  MSOP-10
*                 			--------------------
*  VDD-----------|1(VDD)    (VSS)10|------------GND     
*  NC------------|2(PA5)    	 (TK0)9|-------------NC 
*  NC------------|3(PA4)    	 (TK1)8|-------------NC
*  NC------------|4(TK3)   	 (TK2)7|-------------NC
*  NC------------|5(TKCAP)     (NC)6|-------------NC
*				  		  ----------------------
*/
//*********************************************************

#include "syscfg.h"
#include "touch.h"
//*********************************************************
//***********************宏定义*****************************
#define  unchar     unsigned char 
#define  unint        unsigned int
#define  unlong     unsigned long


#define  DemoPortOut	PA5   
volatile unsigned char SAFlag  @0xA0;
volatile unsigned char TestCount;
volatile unsigned char ReadCom;
volatile unsigned int ChargeCount;
volatile unsigned char TreCount;
volatile unsigned char TCount;

void uart_delay(void);
void uart_tx(unsigned char  data);


/*-------------------------------------------------
 *  函数名：interrupt ISR
 *	功能：  中断处理函数
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/
void interrupt ISR(void)
{ 
 		T0IF = 0;
 		TMR0 = 7;                     
        TCount++;
	    DemoPortOut = ~DemoPortOut; //翻转电平  
} 


/*----------------------------------------------------
 *	函数名称：TIMER0_INITIAL
 *	功能：初始化设置定时器
 *	相关寄存器：T0CS T0SE PSA 
 *	设置TMR0定时时长2ms=(1/16000000)*4*32*255(16M-4T-PSA 1:32- TMR0=255溢出)	                      
 ----------------------------------------------------*/
void TIMER0_INITIAL (void)  
{
	OPTION = 0B00000100;	//Bit5 T0CS Timer0时钟源选择 
							//1-外部引脚电平变化T0CKI 0-内部时钟(FOSC/2)
							//Bit4 T0CKI引脚触发方式 1-下降沿 0-上升沿
							//Bit3 PSA 预分频器分配位 0-Timer0 1-WDT 
							//Bit2:0 PS2 8个预分频比 100 - 1:32
    TMR0 = 7;                     
    T0IF = 0;				//清空T0软件中断
}
/*-------------------------------------------------
 *  函数名：POWER_INITIAL
 *	功能：  上电系统初始化
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void POWER_INITIAL (void) 
{ 
	OSCCON = 0B01110000;	//WDT 32KHZ   IRCF=111=16MHZ/4=4MHZ,0.25US/T
	INTCON = 0;  					//暂禁止所有中断
	PORTA = 0B00110000;
	TRISA =  0B00001111;				
	WPUA =  0B00000000;     
	OPTION = 0B00000000;
    
    TX_IO_ADDR &= ~TX_IO;	
}


void uart_delay(void)
{
   ///*     16M/4T  波特率 38400
    NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
    NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
    NOP();NOP();NOP();NOP();//NOP();NOP();//NOP();NOP();//NOP();//NOP();
}

void uart_tx(unsigned char  data)
{
	GIE  = 0; 
	TX =0; //start
	uart_delay();
	if(data & 0x01)  //1码  1
	{
		TX = 1;
		uart_delay(); 	 
	}
	else //0码
	{
		TX = 0;
        NOP();NOP();
		uart_delay();
	}
	if(data & 0x02)  //1码  1
	{
		TX = 1;
		uart_delay(); 	 
	}
	else //0码
	{
		TX = 0;
        NOP();NOP();
		uart_delay();
	}
	if(data & 0x04)  //1码  1
	{
		TX = 1;
		uart_delay(); 	 
	}
	else //0码
	{
		TX = 0;
        NOP();NOP();
		uart_delay();
	}
	if(data & 0x08)  //1码  1
	{
		TX = 1;
		uart_delay(); 	 
	}
	else //0码
	{
		TX = 0;
        NOP();NOP();
		uart_delay();
	}
	if(data & 0x10)  //1码  1
	{
		TX = 1;
		uart_delay(); 	 
	}
	else //0码
	{
		TX = 0;
        NOP();NOP();
		uart_delay();
	}
	if(data & 0x20)  //1码  1
	{
		TX = 1;
		uart_delay(); 	 
	}
	else //0码
	{
		TX = 0;
        NOP();NOP();
		uart_delay();
	}
	if(data & 0x40)  //1码  1
	{
		TX = 1;
		uart_delay(); 	 
	}
	else //0码
	{
		TX = 0;
        NOP();NOP();
		uart_delay();
	}
	if(data & 0x80)  //1码  1
	{
		TX = 1;
		uart_delay(); 	 
	}
	else //0码
	{
		TX = 0;
        NOP();NOP();
		uart_delay();
	}
	TX = 1; //stop
	uart_delay ();
	GIE  =1; 
}

/*-------------------------------------------------
 *  函数名:  main 
 *	功能：  主函数
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/
void main(void)
{
	POWER_INITIAL();		//系统初始化
	TIMER0_INITIAL();      
    //DelayMs(200);
	
		
	GIE  = 1; 				//开中断
	T0IE = 1;				//开定时器/计数器0中断			
    TCount   =  0;
	while(1)
	{		
			
             SendDataToPC();
	}
}

