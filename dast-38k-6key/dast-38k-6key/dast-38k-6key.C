//********************************************************* 
/* 
*                  FT60F011A  SOP8 
*                 ----------------
*  VDD-----------|1(VDD)    (GND)8|------------GND     
*  NC------------|2(PA2)    (PA4)7|----------IRREC 
*  NC------------|3(PA1)    (PA5)6|----------SRclk
*  SR------------|4(PA3)    (PA0)5|-----------Rclk
*			      ----------------
*/
//*********************************************************
#include "SYSCFG.h"
//***********************宏定义****************************
#define  unchar         unsigned int 
#define  uchar     unsigned char

#define  IRREC		PA4

#define  SR  		PA1   
#define	 Rclk		PA0
#define	 SRclk		PA5




unsigned char	 ir_status , ir_timer ,Set=1, repeat;
uchar outpin[8];




uchar IRbitNum = 0;		    //用于记录接收到第几位数据了
uchar IRbitTime = 0;		//用于计时一位的时间长短
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
	TRISA  = 0B00010000;				//PA输入输出 0-输出 1-输入
                                        //PA2-IN PA4-OUT
	WPUA   = 0B00000000;     			//PA端口上拉控制 1-开上拉 0-关上拉								
					 		            //开PA2上拉
	MSCKCON = 0B00000000;
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
	       
    TIMER2_INITIAL();
    
	GIE = 1; 				 
    				 
    TMR2IE = 1;
    
	while(1)
	{
    
		
        
		if(ReceiveFinish ||  repeat)
        {
        	ReceiveFinish = 0;
            
            
            rdata1 = 0xFF - IRDataTimer[0];
            rdata2 = 0xFF - IRDataTimer[2];
            
            
            if((rdata1 == IRDataTimer[1])&&(rdata2 == IRDataTimer[3]))
            {
            
            
            
				if( rdata2==0xED && repeat==0)//power-off
                {
					Set++;
					if(Set==1)
					{
						outpin[0]=0;
                        outpin[1]=0;
                        outpin[2]=0;
                        outpin[3]=0;
                        outpin[4]=0;
                        outpin[5]=0;
                        outpin[6]=0;
                        outpin[7]=0;
					}
					else
					{
						outpin[0]=1;
                        outpin[1]=1;
                        outpin[2]=1;
                        outpin[3]=1;
                        outpin[4]=1;
                        outpin[5]=1;
                        outpin[6]=1;
                        outpin[7]=1;
                        Set=0;
					}
                    
                    
                    
                    
                    Rclk=0;
                    for (int E = 0; E < 8; E++){
      
					  if(outpin[E]==0) SR=0 ;
					  if(outpin[E]==1) SR=1 ;
					  
					  DelayMs(5);
					  SRclk=1;
					  DelayMs(5);
					  SRclk=0;

					}
                    
					Rclk=1;
					DelayMs(20);
                    Rclk=0;
                    
                }
                
                
                
                
                if(rdata1==0x7F && rdata2==0xE1 )//power-on
                {
					
                }
                
                
                
                
                if( rdata2==0xF9 && Set==1)//up
                {
					
                }
                
                if( rdata2==0xFB && Set==1)//down
                {
					
                }
                
                if(rdata1==0x7F && rdata2==0xF7 && repeat==0 && Set==1)//timer
                {
					
                }
                
                if(rdata1==0x7F && rdata2==0xFD && repeat==0 && Set==1)//RGB
                {
					
                }
                
                
            }
            
            rdata1=0;
            rdata2=0;
            repeat=0;
            
            
        }
    
        
        
	}

}