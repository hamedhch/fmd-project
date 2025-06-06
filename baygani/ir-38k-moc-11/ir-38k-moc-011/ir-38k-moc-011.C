//********************************************************* 
/* 文件名：test_60F01x_Timer2.c
* 功能：   FT60F01x Time2功能演示
* IC:      FT60F011A SOP16
* 晶振：   16M/4T                    
* 说明：   当DemoPortIn悬空或者高电平时，
*		   DemoPortOut输出2.5kHz占空比50%的波形-Timer2实现
*		   当DemoPortIn接地时，DemoPortOut输出高电平
*
*                  FT60F011A  SOP8 
*                 ----------------
*  VDD-----------|1(VDD)    (GND)8|------------GND     
*  TRIAC---------|2(PA2)    (PA4)7|----------LED_1 
*  NC------------|3(PA1)    (PA5)6|----------LED_2
*  IRREC---------|4(PA3)    (PA0)5|----------IRTRN
*			      ----------------
*/
//*********************************************************
#include "SYSCFG.h"
//***********************宏定义****************************
#define  unchar         unsigned int 

#define  IRREC		PA3

#define  TRIAC		PA2   
#define	 IRTRN		PA0
#define	 LED_1		PA4
#define	 LED_2		PA5

#define  ZEROC 		PA1


//unchar Puls_Count,Puls_off,Puls_IR,Set,Lock=0;

/*-------------------------------------------------
 * 函数名：interrupt ISR
 * 功能：  定时器2中断处理程序
 * 输入：  无
 * 输出：  无
 --------------------------------------------------*/
void interrupt ISR(void)			
{ 
	if(TMR2IE && TMR2IF)			  //200us中断一次 = 2.5kHz
	{
		TMR2IF = 0;
        TMR2IE = 1;
        
        LED_1=~LED_1;
        
        //IRTRN = ~IRTRN;
        
        /*
        Puls_IR++;
        
        if(Puls_IR<41){
			IRTRN = ~IRTRN;   
        }
        if(Puls_IR>80){
			Puls_IR=0;
        }
        
        */
        
        
	} 
} 
/*-------------------------------------------------
 * 函数名：POWER_INITIAL
 * 功能：  上电系统初始化
 * 输入：  无
 * 输出：  无
 --------------------------------------------------*/	
void POWER_INITIAL (void) 
{
	OSCCON = 0B01110000;				//IRCF=111=16MHz/4T=4MHz，0.25us
                                 
	INTCON = 0;  						//暂禁止所有中断
	OPTION = 0B00001000;				//Bit3=1，WDT MODE，PS=000=WDT RATE 1:1

	PORTA  = 0B00100000;					
	TRISA  = 0B00001010;				//PA输入输出 0-输出 1-输入
                                        //PA2-IN PA4-OUT
	WPUA   = 0B00000000;     			//PA端口上拉控制 1-开上拉 0-关上拉								
					 		            //开PA2上拉
	MSCKCON = 0B00000000;
	//Bit4=0,禁止LVR(60F01x O版之前)       
	//Bit4=0,LVREN使能时,开启LVR(60F01x O版及O版之后)  
    //Bit4=1,LVREN使能时,工作时开启LVR,睡眠时自动关闭LVR(60F01x O版及O版后)
}
/*-------------------------------------------------
 * 函数名称：TIMER2_INITIAL
 * 功能：    初始化设置定时器1 
 * 设置TMR2定时时长=1/系统时钟频率*4*预分频值*后分频值*PR2
                   =(1/16000000)*4*4*1*200=200us
 -------------------------------------------------*/
void TIMER2_INITIAL (void) 
{
	T2CON = 0B00000001; 	
    //Bit[6:3]: 定时器2后分频比  0000-1:1
    //Bit2:     定时器2使能位    0-关闭 1-使能
	//Bit[1:0]: 定时器2预分频比  01-1:4
     
	TMR2 = 0;  				//TMR2赋初值
	PR2 = 63;              //PR2赋值
	TMR2IF = 0;				//清TIMER2中断标志
	TMR2IE = 1;				//使能TIMER2的中断
	TMR2ON = 1;				//使能TIMER2启动
	PEIE=1;    				//使能外设中断
	GIE = 1;   				//使能全局中断
}
/*-------------------------------------------------
 * 函数名: main 
 * 功能：  主函数
 * 输入：  无
 * 输出：  无
 --------------------------------------------------*/
void main()
{
	POWER_INITIAL();		//系统初始化
	TIMER2_INITIAL();  		//初始化Timer2
	
	while(1)
	{ 
    
    /*
		if(Puls_IR==40){
			if(IRREC==0){
				LED_1=~LED_1;
				Puls_Count++;
				Puls_off=0;
				
			}else
			{
				Puls_off++;
				Puls_Count=0;
			}
		}
        
        if(Puls_IR==78){
			if(IRREC!=0){
				LED_1=~LED_1;
				Puls_Count++;
				Puls_off++;
			}else
			{
				Puls_off=0;
				Puls_Count=0;
			}
		}
        
        if(Puls_Count>10 && Lock==0){
        
			Lock=1;
            
            LED_2=~LED_2;
            
			/*Set++;
			if(Set==1)
			{
				LED_1=1;
				LED_2=0;
				//TRIAC= 1;
			}
			else
			{
				LED_1=0;
				LED_2=1;
				Set=0;
				//TRIAC= 0;
			}

		}
		if(Puls_off>300 )
		{
			Lock=0;
		}
		
        */
       
    
    
	}
}
