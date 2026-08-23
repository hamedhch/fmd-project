//********************************************************* 
/* ???:TEST_FT62F21x_PA_INT.c
* ??:   FT62F21x-PA?????????
* IC:	   FT62F211 SOP8
* ??:   16M/4T                    
* ??:   ???DemoPortOut(PA4)??100?50HZ?????50%????,MCU????,???????;
*		   ???PA2?????????,??????;
*
*                  	 FT62F211 SOP8 
*                  ----------------
*  data  ------------|1(PA4)        (PA3)8|-------------k1-t4-8
*  NC---------------|2(TKCAP)    (PA0)7|-------------k2-t1-1
*  NC---------------|3(VDD)	     (PA1)6|-------------k3-t2-2
*  NC---------------|4(VSS)   	 (PA2)5|-------------k4-t3-4
*			       ----------------
*/
//*********************************************************


#include "Touch.h"

#define  unchar   unsigned char 
#define  unint      unsigned int
#define  unlong   unsigned long

//#define BUZZER(x)   PA4=x;NOP();
#define DATA(x)     PA4=x;NOP();
//#define LED_W(x)    PA1=!x;NOP();
//#define LED_B(x)     PA0=!x;NOP();



unchar	ReadAPin;

volatile unsigned char GKeyValue,Last=0,Lern=0,State=0,i=0,Effect=0,Flag=0,Time=0,CountTrig=0,Lock=0;	
volatile  unsigned int StartTouchTime,topTouchTime,CountKey=0;
bit awaken;  




void Delay_Us(unsigned int Time)
{
	unsigned int a;
	for(a=0;a<Time;a++)
	{
		_nop();
        CLRWDT();       		 
	}
}

void DelayMs(unsigned int Time)
{
	unsigned int a;
	for(a=0;a<Time;a++)
	{
      	Delay_Us(1000);	 
	}
}



void interrupt ISR(void)
{ 
    
	if(T0IE && T0IF)
    {
	    T0IF = 0;
 		TMR0 = 206;    
                           
        StartTouchTime++; 
        
		if(topTouchTime < 20000  &&  Last!=0)topTouchTime++;


    }  
    
	if(PAIE && PAIF)		
    {
      
		ReadAPin = PORTA; 		
		PAIF = 0; 				
		IOCA2 =0;  				
    }
} 



void TIMER0_INITIAL (void)  
{
    TMR0 = 206;           //8us*(255-120)=1MS          
    T0IF = 0;				
    T0IE = 1;
    GIE = 1;
}

void SYS_INITIAL (void) 
{
	OSCCON = 0B01100000;//WDT 32KHZ IRCF=110=8MHZ/4=4MHZ,0.25US/T
	OPTION = 0B00000100;	
    TRISA =  0B00000000; 					
	PORTA = 0B00000000;
    LVDCON  = 0x03;
    PCON	= 0x88;
    TRISA =  0B00000000; 					
	PORTA = 0B00000000;
	OSCCON = 0B01110000;//WDT 32KHZ IRCF=110=16MHZ/4=4MHZ,0.25US/T
	INTCON = 0; 
	
	PORTA = 0B00000000;		
    TRISA =  0B00000000; 
    WPUA =  0B00000000;
    PSRCA = 0B00000000; 								   
}

unchar EEPROMread(unchar EEAddr)
{
	unchar ReEEPROMread;
    EEADR = EEAddr;
    RD=1;
    NOP();
    NOP();
    NOP();
    NOP();
    CLRWDT();
    ReEEPROMread =EEDAT;
    return ReEEPROMread;
}

void EEPROMwrite(unchar EEAddr,unchar Data)
{
	GIE = 0;					
	while(GIE); 				
	EEADR = EEAddr; 	 		
	EEDAT = Data;		 		
	EEIF = 0;
	EECON1 |= 0x34;				
	WR = 1;						
    NOP();
    NOP();
    NOP();
    NOP();
    CLRWDT();
	while(WR);  
        		
	GIE = 1;
}


void main()
{
    TRISA =  0B00000000; 					
	PORTA = 0B00000000;
    
	DATA(1);
    
	SYS_INITIAL();	
    
    
    TIMER0_INITIAL();
	Touch_init(); 
    
    
    
	while(1)
	{   
        Delay_Us(10);  	
        
        
        
        if(topTouchTime > 10000  &&  Lern==0 &&  Last!=0){
			
	  
			DATA(0);
			DelayMs(1);
			DATA(1);
			DelayMs(1);
			
			DATA(0);
			DelayMs(6);
			DATA(1);
			
			DelayMs(20);
		
			Lern=1;
            Last=0;
            
        }
        
        
        
        
        
        
        	 
		if(StartTouchTime >= (2500/SCANNINGTIME/TouchCount))
        {
			StartTouchTime = 0;	
			GKeyValue = TouchKeyScan(); 	
            
        } 
        
        if(GKeyValue!=0 )
        {
			
            if(GKeyValue==8)//k1
            {
				if(CountKey<5)
                {
                
                    CountKey++;
                    topTouchTime=0;
            
                    if(CountKey>2)
                    {
                        CountKey=6;
                        DATA(0);
						DelayMs(1);
						
						DATA(1);
						DelayMs(1);
						
						DATA(0);
						DelayMs(1);
						DATA(1);
						
						DelayMs(10);
                        
                    }
                } 
            }     
            
			if(GKeyValue==1)//k2
            {
				if(CountKey<5)
                {
                    CountKey++;
                    topTouchTime=0;
            
                    if(CountKey>2)
                    {
                        CountKey=6;
                       
						DATA(0);
						DelayMs(1);
						
						DATA(1);
						DelayMs(1);
						
						DATA(0);
						DelayMs(2);
						DATA(1);
						
						DelayMs(10);
                        
                    }
                } 
            }     
            
			if(GKeyValue==2)//k3
            {
				if(CountKey<5)
                {
                    CountKey++;
                    topTouchTime=0;
            
                    if(CountKey>2)
                    {
                        CountKey=6;
										
						DATA(0);
						DelayMs(1);
						
						DATA(1);
						DelayMs(1);
						
						DATA(0);
						DelayMs(3);
						DATA(1);
						
						DelayMs(10);
                        
                    }
                } 
            }     
            

			if(GKeyValue==4)//k4
            {
				if(CountKey<5)
                {
                    CountKey++;
                    topTouchTime=0;
            
                    if(CountKey>2)
                    {
                        CountKey=6;
										
						DATA(0);
						DelayMs(1);
						
						DATA(1);
						DelayMs(1);
						
						DATA(0);
						DelayMs(4);
						DATA(1);
						
						DelayMs(10);
                        
                        


                    }
                } 
            }     
            

            
            
            
            
            
			if(Last!=GKeyValue)
            {
             if(GKeyValue==1)
                {
                    _nop();
                    
                }  
                 if(GKeyValue==2)
                {
                    _nop();
                    
                }  
                 if(GKeyValue==4)
                {
                    _nop();
                    
                }  
                if(GKeyValue==8)
                {
                    _nop();
                    
                }      
            }
            

			Last=GKeyValue;
            //GKeyValue=0;
        }
        else
        {
            
            if(CountKey>5 & CountKey<20000)
            {
                Lern=0;
				Last=0;
                GKeyValue=0;
			}
            CountKey=0;
        }
    }
}


