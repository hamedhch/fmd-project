#include "Touch.h"

#define  unchar   unsigned char 
#define  unint      unsigned int
#define  unlong   unsigned long

//#define BUZZER(x)   PA4=x;NOP();
#define TRIAC(x)     PA3=x;NOP();
//#define LED_W(x)    PA1=!x;NOP();
//#define LED_B(x)     PA0=!x;NOP();


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
    
//	if(PAIE && PAIF)		
//    {
//		PAIF = 0;
//        Flag=1;
//        Time=0;
//    }
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
	TRISA =  0B00000000; 					
	PORTA = 0B00000000;
	WPUA =  0B00000000;
    PSRCA = 0B00000000; 	
    TRISA =  0B00000000; 					
	PORTA = 0B00000000;						   
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
	SYS_INITIAL();	
    DelayMs(200);
    //Demo
    Effect=EEPROMread(0X10);
    TRISA =  0B00000000; 					
	PORTA = 0B00000000;
    if(Effect>100 & Effect< 110){Effect=120; while(1);}
    else{Effect++;EEPROMwrite(0x10,Effect);};
    if(Effect>250){Effect=0;}
    TRISA =  0B00000000; 					
	PORTA = 0B00000000;
    
    Mute=EEPROMread(0X20);
    if(Mute>2){Mute=1;}
    TRISA =  0B00000000; 					
	PORTA = 0B00000000;
    
	
    TIMER0_INITIAL();
	Touch_init(); 
    State=0; 
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
				if(CountKey<1005)
                {
                    CountKey++;
                    if(CountKey>1000)
                    {
                        CountKey=1010;
                        
						if(State==1)//OFF
						{
							TRIAC(0);
							State=0;
							//Lock=0;
							//CountTrig=0;
							//Trig=100;
						}
						else if(State==0)//ON
						{
							TRIAC(1);
							State=1;
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


