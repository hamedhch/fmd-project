//********************************************************* 
/* 
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
#define  uchar     unsigned char

#define  IRREC		PA3

#define  pin		PA2   
#define	 LED_A		PA0
#define	 LED_C		PA4
#define	 LED_B		PA5


#define  ZEROC 		PA1


int  AAA ;

uchar Edata1A,Edata2A , Edata1B,Edata2B , Edata1C,Edata2C ;

unchar  powerconter , conterlern=0 , lern=0 ; 

unsigned char	 ir_status , ir_timer, repeat ;


uchar IRbitNum = 0;		    //用于记录接收到第几位数据了
int IRbitTime = 0;		//用于计时一位的时间长短
uchar IRDataTimer[4];		//存出来的4个数据
uchar bitdata=0x01;			//用于按位或的位数据
uchar ReceiveFinish = 0;


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




void interrupt ISR(void)			
{ 
    

	
    if(T0IE && T0IF)					//16.384ms翻转一次≈30Hz
	{
		TMR0 = 1;					//注意:对TMR0重新赋值TMR0在两个周期内不变化	 
		T0IF = 0;
        
        AAA++;
        if(AAA>1000){
			AAA=0;
            //LED_C=~LED_C;
        }
    } 
    
    
    if(TMR2IE && TMR2IF)			  //200us中断一次 = 2.5kHz
	{
    
		TMR2IF = 0;
        TMR2IE = 1;
        
        
        if(ir_timer){
			IRbitTime++;
			if(IRbitTime > 1600)
			{
				ir_timer = 0;
				IRbitTime = 0;
			}
        }
        
        if(ir_status != IRREC){
			ir_status=IRREC;
            
            if(ir_status==0){
				
                ir_timer = 1;
                
				if(IRbitTime > 190)
				{
					IRDataTimer[0] = 0;
					IRDataTimer[1] = 0;
					IRDataTimer[2] = 0;
					IRDataTimer[3] = 0;
					IRbitNum = 0;
					bitdata = 0x00;
				}
                else if(IRbitTime > 150)
				{
					if(ReceiveFinish==0)repeat=1;
				}
				else if(IRbitTime > 30)
				{
					IRDataTimer[IRbitNum-1] |= bitdata;
				}
                
                IRbitTime = 0;
                bitdata<<=1;
				if(bitdata == 0)
				{
					bitdata = 0x01;
					IRbitNum++;
				}
				if(IRbitNum > 4)
				{
					IRbitNum = 0;
					ir_timer = 0;  
					ReceiveFinish = 1;		
				}
                
            }
        }
        
        
        
        
	} 


} 



void POWER_INITIAL (void) 
{
	OSCCON = 0B11110000;				//IRCF=111=16MHz/4T=4MHz，0.25us
                                 
	INTCON = 0;  						//暂禁止所有中断
	OPTION = 0B00001000;				//Bit3=1，WDT MODE，PS=000=WDT RATE 1:1

	PORTA  = 0B00000000;					
	TRISA  = 0B00001010;				//PA输入输出 0-输出 1-输入
                                        //PA2-IN PA4-OUT
	WPUA   = 0B00000000;     			//PA端口上拉控制 1-开上拉 0-关上拉								
					 		            //开PA2上拉
	MSCKCON = 0B00000000;
}




unchar EEPROMread(unchar EEAddr)
{
	unchar ReEEPROMread;
	EEADR = EEAddr;    
	RD = 1;
	ReEEPROMread = EEDAT;     			//EEPROM的读数据 ReEEPROMread = EEDATA;
	return ReEEPROMread;
}


void EEPROMwrite(unchar EEAddr,unchar Data)
{
	GIE = 0;							//写数据必须关闭中断
	while(GIE); 						//等待GIE为0
	EEADR = EEAddr; 	 				//EEPROM的地址
	EEDAT = Data;		 				//EEPROM的写数据  EEDATA = Data;
	EEIF = 0;
	EECON1|= 0x34;						//置位WREN1,WREN2,WREN3三个变量.
	WR = 1;								//置位WR启动编程
	while(WR);      					//等待EE写入完成
	GIE = 1;                            //开总中断
}





void TIMER0_INITIAL (void)  
{
	OPTION = 0B00000111;	 			//时钟源为指令时钟，预分频比为1:256
	//Bit5:	T0CS Timer0时钟源选择 
	//		1-外部引脚电平变化T0CKI 0-内部时钟(FOSC/4)
	//Bit4:	T0SE T0CKI引脚触发方式 1-下降沿 0-上升沿
	//Bit3:	PSA 预分频器分配位 0-Timer0 1-WDT 
	//Bit[2:0]:PS 8位预分频比 111 - 1:256
	TMR0 = 1; 
    T0IF = 0;							//清空T0软件中断
}


void TIMER2_INITIAL (void) 
{
	T2CON = 0B00000001; 
     
	TMR2 = 0;  				
	PR2 = 63;              
	TMR2IF = 0;				
					
	TMR2ON = 1;				
	PEIE=1;    				
	GIE = 1;   				
}




void main()
{
	uchar rdata1,rdata2;
    
	POWER_INITIAL();		 
	       
    
    TIMER0_INITIAL(); 
    TIMER2_INITIAL();
    
	GIE = 1; 				 
    				 
    PAIE =1;
    
    
    TMR2IE = 1;
    
    
    LED_C=1;
    LED_B=1;
    LED_A=1;
    
    
    powerconter = EEPROMread(0x11);
    
    
    if(powerconter <=0 || powerconter >=10 ) powerconter =0, EEPROMwrite(0x11,0);
    
    
    powerconter++;
    EEPROMwrite(0x11,powerconter);
    
    if(powerconter >=4 ){
     
		 DelayMs(500);
		 LED_A=0 , LED_B=0 , LED_C=0;
		 DelayMs(400);
		 LED_A=1 , LED_B=1 , LED_C=1;
		 DelayMs(500);
		 LED_A=0 , LED_B=0 , LED_C=0;
		 DelayMs(400);
		 LED_A=1 , LED_B=1 , LED_C=1;
		 
		 lern=1;
         T0IE = 1;
         AAA=0;
		 conterlern=0;
         
		 powerconter =0;
		 EEPROMwrite(0x11,0);
     
    }
    
    
    DelayS(2);
    
    powerconter =0;
    EEPROMwrite(0x11,0);
    
    
    
    
    Edata1A = EEPROMread(0x21);
    Edata2A = EEPROMread(0x22);
    
    Edata1B = EEPROMread(0x23);
    Edata2B = EEPROMread(0x24);
   
    Edata1C = EEPROMread(0x25);
    Edata2C = EEPROMread(0x26);
    
    
    
	while(1)
	{
    
    
		if(AAA > 500){
			T0IE = 0;
            lern = 0;
            AAA  = 0;
        }
    
        
		if(ReceiveFinish ||  repeat)
        {
        	ReceiveFinish = 0;
            
            
            rdata1 = 0xFF - IRDataTimer[0];
            rdata2 = 0xFF - IRDataTimer[2];
            if((rdata1 == IRDataTimer[1])&&(rdata2 == IRDataTimer[3]))
            {
            	//LED_1 = ~LED_1;
                
                
                if( rdata1==Edata1A && rdata2==Edata2A && lern==0 && repeat==0 )
                {
					LED_A=~LED_A;
                }
                if( rdata1==Edata1B && rdata2==Edata2B && lern==0 && repeat==0 )
                {
					LED_B=~LED_B;
                }
				if( rdata1==Edata1C && rdata2==Edata2C && lern==0 && repeat==0 )
                {
					LED_C=~LED_C;
                }
                
                
                
                if(lern==1){
                 
                 if(conterlern==0){
					EEPROMwrite(0x21,rdata1);
					EEPROMwrite(0x22,rdata2);
					
                    Edata1A=rdata1;
					Edata2A=rdata2;
                    
                    LED_A=0 ;
					DelayMs(400);
					LED_A=1 ;
                    
                 }
                 
                 if(conterlern==1){
					EEPROMwrite(0x23,rdata1);
					EEPROMwrite(0x24,rdata2);
					
                    Edata1B=rdata1;
					Edata2B=rdata2;
                    
                    LED_B=0 ;
					DelayMs(400);
					LED_B=1 ;
                 }
                 
                 if(conterlern==2){
					EEPROMwrite(0x25,rdata1);
					EEPROMwrite(0x26,rdata2);
					
                    Edata1C=rdata1;
					Edata2C=rdata2;
                    
                    LED_C=0 ;
					DelayMs(400);
					LED_C=1 ;
                    
                    lern=0;
                 }
                 
                 
				 conterlern++;
                 
				 AAA  = 0;
                 
                }
                
                
            }
            
            rdata1=0;
            rdata2=0;
            repeat=0;
            
            
        }
    
        
        
	}
}
