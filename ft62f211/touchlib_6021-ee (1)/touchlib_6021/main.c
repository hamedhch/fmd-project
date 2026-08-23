//********************************************************* 
/*
*                  	 FT62F211 SOP8 
*                  ----------------
*  zero  ------------|1(PA4)         (PA3)8|-------------LED1 
*  CAP-------------|2(TKCAP)      (PA0)7|-------------LED2
*  NC---------------|3(VDD)	     (PA1)6|-------------key2 
*  NC---------------|4(VSS)    	 (PA2)5|-------------key1
*			       ----------------
*/
//*********************************************************

ÐäÊÔÐäÊ

#include "Touch.h"

#define  unchar   unsigned char 
#define  unint      unsigned int
#define  unlong   unsigned long

//#define BUZZER(x)   PA4=x;NOP();
#define LED_1(x)     PA3=x;NOP();
//#define LED_W(x)    PA1=!x;NOP();
//#define LED_B(x)     PA0=!x;NOP();



unchar	ReadAPin;

volatile unsigned char GKeyValue,Last=0,State=0,i=0,Effect=0,Mute=0,Flag=0,Time=0,Trig=0,CountTrig=0,Lock=1;	
volatile  unsigned int StartTouchTime,CountKey=0;
bit awaken;  

void interrupt ISR(void)
{ 
    
	if(T0IE && T0IF)
    {
	    T0IF = 0;
 		TMR0 = 206;                       
        StartTouchTime++; 
//        if(Effect==1)   
//        {
//            if(State==1)
//            {
//                if(Lock==0)
//                {
//					CountTrig++;
//					if(CountTrig>100)
//					{
//						CountTrig=0;
//						Trig++;
//                        if(Trig>90)
//                        {
//                            Trig=100;
//                            Lock=1;
//                        }
//					}
//					if(Flag==0)
//					{
//						TRIAC(1);
//					}
//					else
//					{
//						Time++;
//						if(Time>Trig)
//						{
//							TRIAC(0);
//							Flag=0;
//							Time=0;
//						}
//					}
//                }
//                else
//                {
//                    TRIAC(0);
//                }
//            }
//            else
//            {
//                if(Lock==0)
//                {
//					CountTrig++;
//					if(CountTrig>100)
//					{
//						CountTrig=0;
//						Trig--;
//                        if(Trig<30)
//                        {
//                            Trig=0;
//                            Lock=1;
//                        }
//					}
//					if(Flag==0)
//					{
//						TRIAC(1);
//					}
//					else
//					{
//						Time++;
//						if(Time>Trig)
//						{
//							TRIAC(0);
//							Flag=0;
//							Time=0;
//						}
//					}
//                }
//                else
//                {
//                    TRIAC(1);
//                }
//            }
//        }
//        else
//        {
//            if(State==1)
//            {
//                TRIAC(0);
//            }
//            else
//            {
//                TRIAC(1);
//            }
//        }
    }  
    
	if(PAIE && PAIF)		
    {
        
		if(State==1)//OFF
			{
				LED_1(1);
			}
		else if(State==0)//ON
			{
					LED_1(0);
			}
		
//        if(Counter>150){
//        
//			Counter=0;
//            LED_1=0;
//        }
//        
//		if(Set==1){
//			if(Counter_On>Counter_On_set){
//				Counter_On=Counter_On-1;
//			}else{
//				Counter_On=Counter_On_set;
//			}
//		}
//		
//		if(Set==0 && Counter_On<=180)
//		{
//			Counter_On=Counter_On+2;
//		}
//        
		ReadAPin = PORTA; 		
		PAIF = 0; 				
		IOCA2 =0;  				
    }
} 



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

void PA4_Level_Change_INITIAL(void)
{
	TRISA4 = 1; 			     	//ÉèÖÃ PA2 ÊäÈë
	ReadAPin = PORTA;	     		//ÇåPAµçÆ½±ä»¯ÖÐ¶Ï
	PAIF = 0;   			     	//ÇåPA INTÖÐ¶Ï±êÖ¾Î»
    IOCA4 = 1;  			     	//Ê¹ÄÜPA2µçÆ½±ä»¯ÖÐ¶Ï
	PAIE = 1;   			     	//Ê¹ÄÜPA INTÖÐ¶Ï
}


void main()
{
    TRISA =  0B00000000; 					
	PORTA = 0B00000000;
	SYS_INITIAL();	
    
	State=EEPROMread(0x10); 
    if(State>1)State=1;
	LED_1(State);


    DelayMs(200);
    
	//PA4_Level_Change_INITIAL();

    TIMER0_INITIAL();
	Touch_init(); 
    

	

	while(1)
	{   
        Delay_Us(10);  		 
		if(StartTouchTime >= (2500/SCANNINGTIME/TouchCount))
        {
			StartTouchTime = 0;	
			GKeyValue = TouchKeyScan(); 	
        } 
        if(GKeyValue!=0)
        {
            if(GKeyValue==4)
            {
				if(CountKey<305)
                {
                    CountKey++;
                    if(CountKey>300)
                    {
                        CountKey=310;
                        
						if(State==1)//OFF
						{
							State=0;
                            LED_1(0);
                            EEPROMwrite(0x10,0);
							//Lock=0;
							//CountTrig=0;
							//Trig=100;
						}
						else if(State==0)//ON
						{
							State=1;
                            LED_1(1);
                            EEPROMwrite(0x10,1);
							//Lock=0;
							//CountTrig=0;
							//Trig=30;
						}
///
                    }
                } 
            }     
            if(Last!=GKeyValue)
            {
                if(GKeyValue==4)
                {
                    _nop();
//					 if(State==1)//OFF
//					{
//						LED_W(0);
//						LED_B(1);
//						BUZZER(1);
//						TRIAC(1);
//						DelayMs(50);
//						BUZZER(0);
//						State=0;
//	//                  Lock=0;
//	//					CountTrig=0;
//	//					Trig=100;
//					}
//					else if(State==0)//ON
//					{
//						LED_W(1);
//						LED_B(0);
//						BUZZER(1);
//						TRIAC(0);
//						DelayMs(50);
//						BUZZER(0);
//						State=1;
//						
//	//                    Lock=0;
//	//					CountTrig=0;
//	//					Trig=30;
//					}
                }      
            }
            Last=GKeyValue;
            //GKeyValue=0;
        }
        else
        {
            Last=0;
            if(CountKey>10 & CountKey<20000)
            {
                
				
			}
            CountKey=0;
        }
    }
}


