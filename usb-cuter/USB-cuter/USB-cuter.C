
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
*       ---------|2(PA2)    (PA4)7|------------out 
*  LED_1---------|3(PA1)    (PA5)6|----------LED_3
*   BTN ---------|4(PA3)    (PA0)5|----------LED_2
*			      ----------------
*/
//*********************************************************
#include "SYSCFG.h"
//***********************宏定义****************************

 
#define  BTN		PA3

#define	 LED_1		PA1
#define	 LED_2		PA0
#define	 LED_3		PA5
#define	 out  		PA4


volatile unsigned int Puls_Count , conter=0 , conter2=0;

volatile unsigned char S=0,M=0,H=0, mode=4 ,Lock=0;

void interrupt ISR(void)			
{ 

	if(T0IE && T0IF)					//16.384ms翻转一次≈30Hz
	{
		TMR0 = 239;					//注意:对TMR0重新赋值TMR0在两个周期内不变化	 
		T0IF = 0; 
        
        Puls_Count++;
        
        if(Puls_Count>=1000)Puls_Count=0,S++;
        
        if(S>=60)S=0,M++;
        if(M>=60)M=0,H++;
        
       
	} 
    
    
	

	
    

} 



void DelayUs(unsigned char Time)
{
	unsigned char a;
	for(a=0;a<Time;a++)
	{
		NOP();
	}
}                  


void DelayMs(unsigned char Time)
{
	unsigned char a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<5;b++)
		{
		 	DelayUs(98);     //快1%
		}
	}
}


void DelayS(unsigned char Time)
{
	unsigned char a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<10;b++)
		{
		 	DelayMs(100); 	
		}
	}
}


void POWER_INITIAL (void) 
{
	OSCCON = 0B01110001;				//IRCF=111=16MHz/4T=4MHz，0.25us
                                 
	INTCON = 0;  						//暂禁止所有中断
	OPTION = 0B00001000;				//Bit3=1，WDT MODE，PS=000=WDT RATE 1:1

	PORTA  = 0B00000000;					
	TRISA  = 0B00001000;				//PA输入输出 0-输出 1-输入
                                        //PA2-IN PA4-OUT
	WPUA   = 0B00001000;     			//PA端口上拉控制 1-开上拉 0-关上拉								
					 		            //开PA2上拉
	MSCKCON = 0B00000000;
}


void TIMER0_INITIAL (void)  
{
	OPTION = 0B00000110;	 			//时钟源为指令时钟，预分频比为1:256
	//Bit5:	T0CS Timer0时钟源选择 
	//		1-外部引脚电平变化T0CKI 0-内部时钟(FOSC/4)
	//Bit4:	T0SE T0CKI引脚触发方式 1-下降沿 0-上升沿
	//Bit3:	PSA 预分频器分配位 0-Timer0 1-WDT 
	//Bit[2:0]:PS 8位预分频比 111 - 1:256
	TMR0 = 239; 
    T0IF = 0;	
    T0IE = 1;								
}







void main()
{
	POWER_INITIAL();		 
	TIMER0_INITIAL();   
    
    
	GIE = 1; 				 
    
	T0IE = 0;	
    
    out=1;
    mode=4;
    
	while(1)
	{
    
		if(BTN==0 && Lock==0){
			conter++;
            if(conter>=1000){
				conter=0;
                
				Lock=1;
				mode++;
				
				if(mode>=5)mode=1;
				
				S=0,M=0,H=0;
            }
        }
        
        if(BTN==1 && Lock==1){
			conter2++;
            if(conter2>=1000){
				conter=0;
                conter2=0;
				Lock=0;
            }
        }
        
        
        
		if(mode==0 )LED_1=0,LED_2=0,LED_3=0,out=0 , T0IE=0;
        
		if(mode==1 )LED_1=1,LED_2=0,LED_3=0,out=1 , T0IE=1;
		if(mode==2 )LED_1=0,LED_2=1,LED_3=0,out=1 , T0IE=1;
		if(mode==3 )LED_1=0,LED_2=0,LED_3=1,out=1 , T0IE=1;
		
		if(mode==4 )LED_1=1,LED_2=1,LED_3=1,out=1 , T0IE=0;
		
        
        if(mode==1 && M==45 && H==0 && out==1)  mode=0 ; 
		
        if(mode==2 && M==30 && H==1 && out==1)  mode=0 ;
      
        if(mode==3 && M==30 && H==2 && out==1)  mode=0 ;
      
        
        
	}
}
