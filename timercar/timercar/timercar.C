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
*  OUT-----------|2(PA2)    (PA4)7|------------ACC
*  LED-----------|3(PA1)    (PA5)6|----------
*       ---------|4(PA3)    (PA0)5|-----------door
*			      ----------------
*/
//*********************************************************
#include "SYSCFG.h"
//***********************宏定义****************************
#define  unchar         unsigned int 

#define  ACC		PA4   

#define	 OUT		PA2
#define	 LED		PA1
#define	 door		PA0



volatile unsigned char S=0,M=0,H=0, mode=0 ,Lock=1,Lock2=1 ;

volatile unsigned int Puls_Count;

void interrupt ISR(void)			
{ 

	if(T0IE && T0IF)					//16.384ms翻转一次≈30Hz
	{
		TMR0 = 239;					//注意:对TMR0重新赋值TMR0在两个周期内不变化	 
		T0IF = 0; 
        
        Puls_Count++;
        
        if(Puls_Count>=2000){
			Puls_Count=0;
            LED = ~LED;
            S++;
            
        }
        
        if(S>=60)S=0,M++;
        if(M>=60)M=0;
        
       
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
	TRISA  = 0B00011001;				//PA输入输出 0-输出 1-输入
                                        //PA2-IN PA4-OUT
	WPUA   = 0B00000001;     			//PA端口上拉控制 1-开上拉 0-关上拉								
					 		            //开PA2上拉
	MSCKCON = 0B00000000;
}


void TIMER0_INITIAL (void)  
{
	OPTION = 0B00000110;	 	
    
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
    
    
    
	while(1)
	{
    
    
		if(door==0){
			LED=0;
			DelayMs(500);
            LED=1;
            DelayMs(500);
            LED=0;
            DelayMs(500);
            LED=1;
            DelayMs(500);
            LED=0;
            DelayMs(500);
            LED=1;
            DelayMs(500);
            LED=0;
            
            
            mode=1;
        }
		
        if(ACC==0){
        
            T0IE=1;
            
            if( S==20 && Lock==0 ){
				OUT=1;
                
            }
            if( S==21 && Lock==0 ){
				
                OUT=0;
                
                Lock=1;
            }
            
            
            if( M==20 && S==10 && Lock2==0 && mode==1){
				
                OUT=1;
                
            }
             if( M==20 && S==11 && Lock2==0 && mode==1 ){
				
                OUT=0;
                
                Lock2=1;
            }
            
            //if( M==15){
			//	OUT=1;
            //    DelayMs(500);
             //   OUT=0;
            //    M++;
            //}
            
            
        }
        if(ACC==1 ){
        
            T0IE=0;
            S=0;
            M=0;
            
            OUT=0;
            
            LED=0;
            Lock=0;
            Lock2=0;
            mode=0;
            
        }
        
        
        
        
	}
}
