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
*  IRREC---------|4(PA3)    (PA0)5|----------LED_3
*			      ----------------
*/
//*********************************************************
#include "SYSCFG.h"
//***********************宏定义****************************
#define  unchar         unsigned int 

#define  IRREC		PA3

#define  TRIAC		PA2   
#define	 LED_3		PA0
#define	 LED_1		PA4
#define	 LED_2		PA5

#define  ZEROC 		PA1


unchar Puls_Count,Puls_IR,Set ,Lock=0;

unchar ReadAPin , m ;
unsigned int Backup,Counter,Counter_On,Counter_On_set ;
unsigned long ir_count,Puls_off,Puls_end;
unsigned int ir_status ,up,lockup;


void interrupt ISR(void)			
{ 
    
    
	 if(PAIE && PAIF)		
    {
		ReadAPin = PORTA; 	
		PAIF = 0;
        
        Backup=Counter;
		
		Counter=0;
		
		
		/*m++;
		if(m>=50){
			
			TRIAC=0;
		}
		if(m>=100){
			
			m=0;
			TRIAC=1;
		}*/
		
		
			
		if(Set==1){
			
			if(Counter_On>Counter_On_set){
				Counter_On=Counter_On-1;
				TRIAC= 0;
                LED_3= 0;
			}else{
				Counter_On=Counter_On_set;
				TRIAC= 0;
                LED_3= 0;
			}
			
			
		}
		
		if(Set==0)
		{
			TRIAC=0;
            LED_3=0;
			if(Counter_On<=160)
			{
				Counter_On=Counter_On+2;
			}
		}
        
        
        
    }

	
    if(TMR2IE && TMR2IF)			  //200us中断一次 = 2.5kHz
	{
    
		TMR2IF = 0;
        TMR2IE = 1;
        
        if(ir_count!=0)Puls_off++,Puls_end++;
        if(Puls_end>5000){
        
			Puls_end=0;
            ir_count=0;
            lockup=0;
        }
        
        if(ir_status != IRREC){
        
			ir_status=IRREC;
			ir_count++;
            Puls_end=0;
            
            if(ir_count>80 && lockup==0 && Set==1){
				lockup=1;
				up=~up;
            }
            if(ir_count>80 && Set==1&& ir_status){
				if(up){
					if(Counter_On_set>0)Counter_On_set=Counter_On_set-1;
				}else{
					if(Counter_On_set<140)Counter_On_set=Counter_On_set+1;
                }
            }
        }
        
        if(ir_count>60 && ir_count<80 &&  Puls_end>1700){
            
			ir_count=0;
			Puls_end=0;
            
			Set++;
			if(Set==1)
			{
				LED_1=1;
				LED_2=0;
				//PAIE =1;
				//TRIAC= 1;
			}
			else
			{
				LED_1=0;
				LED_2=1;
				//PAIE =0;
				Set=0;
				//TRIAC= 0;
			}
		}
        
        
          
        
        
        Counter++;
		
		if(Counter>=Counter_On)
		{
			TRIAC=1;
            LED_3=1;
		}
        
        
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

	PORTA  = 0B00100000;					
	TRISA  = 0B00001010;				//PA输入输出 0-输出 1-输入
                                        //PA2-IN PA4-OUT
	WPUA   = 0B00000000;     			//PA端口上拉控制 1-开上拉 0-关上拉								
					 		            //开PA2上拉
	MSCKCON = 0B00000000;
}




void PA1_Level_Change_INITIAL(void)
{
	TRISA1 =1; 				
	ReadAPin = PORTA;		
	PAIF =0;   				
    IOCA1 =1;  		
}



void TIMER2_INITIAL (void) 
{
	T2CON = 0B00000001; 	
    //Bit[6:3]: 定时器2后分频比  0000-1:1
    //Bit2:     定时器2使能位    0-关闭 1-使能
	//Bit[1:0]: 定时器2预分频比  01-1:4
     
	TMR2 = 0;  				//TMR2赋初值
	PR2 = 63;              //PR2赋值
	TMR2IF = 0;				//清TIMER2中断标志
					//使能TIMER2的中断
	TMR2ON = 1;				//使能TIMER2启动
	PEIE=1;    				//使能外设中断
	GIE = 1;   				//使能全局中断
}




void main()
{
	POWER_INITIAL();		 
	       
    PA1_Level_Change_INITIAL();
    TIMER2_INITIAL();
    
	GIE = 1; 				 
    				 
    PAIE =1;
    TMR2IE = 1;
    
	while(1)
	{
    
    
		/*
        DelayS(2);
        
        Set++;
			if(Set==1)
			{
				LED_1=1;
				LED_2=0;
				//PAIE =1;
				//TRIAC= 1;
			}
			else
			{
				LED_1=0;
				LED_2=1;
				//PAIE =0;
				Set=0;
				//TRIAC= 0;
			}
        */
        
        
        
        /*
		if(Puls_Count>10 && Lock==0){
		
			Lock=1;
			
			Set++;
			if(Set==1)
			{
				LED_1=1;
				LED_2=0;
				//PAIE =1;
				TRIAC= 1;
			}
			else
			{
				LED_1=0;
				LED_2=1;
				//PAIE =0;
				Set=0;
				TRIAC= 0;
			}
			

		}
		if(Puls_off>500 )
		{
			Lock=0;
		}
   
        */
        
        
	}
}
