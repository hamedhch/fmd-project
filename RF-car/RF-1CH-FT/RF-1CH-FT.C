//Project: RF-1CH-FT.prj
// Device: FMD
// Memory: Flash 2KX14b, EEPROM 256X8b, SRAM 128X8b
// Author: MAHDI KHLILIAN
//Company: ARIA ELEC
//Version: V1.0
//   Date: 2024/11/23
// P/N   : 09308551020
//===========================================================
//===========================================================
#include	"SYSCFG.h"
//===========================================================
//Variable definition
//===========================================================

#define LED PA2
#define RELAY PA1
#define DATA PA0
#define KEY PA5
#define SEL PA4
#define  BOOL          bit
//Variable definition
volatile unsigned int CountKey=0;
volatile unsigned char Belink=0,Data[3],DataS[7][3],RFData[3],Timer=0,Time=0;
volatile unsigned char Count=0,Buffer=0,Bit=0,Save=0;	
volatile BOOL Frist=0,Start=0,Learn=0,Finish=0,Lock=0;
//===========================================================

void POWER_INITIAL(void);
void TIMER2_INITIAL(void);
unsigned char EEPROMread(unsigned char EEAddr);
void EEPROMwrite(unsigned char EEAddr,unsigned char Data);
void DelayUs(unsigned char Time);
void DelayMs(unsigned int Time);

void interrupt ISR(void)
{ 
 if(PAIE && PAIF)		
{
	PAIF = 0; 
}
 if(TMR2IE && TMR2IF)			//100us 5KHz
 {
	TMR2IF = 0;
    CLRWDT();
    //LED=!LED;
 if(SEL){Finish=0;}
 if(DATA==0){Time++;Frist=1;Timer=0;}
 else
 {
  Timer++;
  if(Timer>250){Timer=0;Finish=0; if(SEL){RELAY=0;}}
	if(Frist==1 && Finish==0 && Lock==0)
	{
		Timer=0;
		if(Start==1)
		{
			Bit--;
			if(Time>10 & Time< 30)
            {
				Buffer = Buffer << 1;  
            }
            else
            {
				Buffer = Buffer << 1;
                Buffer = Buffer + 1;
                            
            }
			if(Bit == 0)
			{
				Bit=8;
                Data[Count]=RFData[Count];
				RFData[Count]=Buffer;
                Count++;
                
                if(Count>=3)
                {
					Count=0;
                    Start=0;
					if(Data[0]==RFData[0] && Data[1]==RFData[1] && Data[2]==RFData[2]) 
					{
                        Finish=1;
                        Lock=1;
					}  
                } 
				Buffer=0;
			}
		}
        if(Time>120 & Time<250){Start=1;Bit=8;}
		Frist=0;
        Time=0;
	}			
 }
 }
}

void main()
{
 POWER_INITIAL();
 DelayMs(10);
 Save=EEPROMread(0x30);
 DelayMs(1);
 if(Save<8)
 {
	char i;
	for(i=1;i<8;i++)
    {
		CLRWDT();
        DataS[i-1][0]=EEPROMread(i*3);
        DelayMs(1);
        DataS[i-1][1]=EEPROMread((i*3)+1);
        DelayMs(1);
        DataS[i-1][2]=EEPROMread((i*3)+2);
        DelayMs(1);
    }
 }
 TIMER2_INITIAL();
 Start=0;
 Learn=0;
 LED=1;
 DelayMs(500);
 LED=0;
 while(1)
 {
	CLRWDT();
    if(Lock==1 & Learn==0)
    {
        Lock=0;
        char i;
        for(i=0;i<Save;i++)
        {
			CLRWDT();
			if(RFData[0]==DataS[i][0] && RFData[1]==DataS[i][1] && RFData[2]==DataS[i][2])
            {
				 LED=1;
				if(SEL==0)
				{
					RELAY=!RELAY;
					DelayMs(200);
					LED=0; 
				}
				else
				{
					RELAY=1;
					DelayMs(10);
					LED=0; 
				}
                break;
            }
        }
	}
    //KEY
    if(KEY==0)
    {
		if(CountKey<1100){CountKey++;}
        if(KEY==0 & CountKey>1000 & CountKey<1035)
        {
			CountKey=1550;
            char i;
            for(i=0;i<7;i++)
            {
				CLRWDT();
                DataS[i][0]=DataS[i][1]=DataS[i][2]=0;
                Save=0;
				EEPROMwrite((i*3),0x00);
                EEPROMwrite((i*3)+1,0x00);
                EEPROMwrite((i*3)+2,0x00);
                LED=1;
				DelayMs(100);
				LED=0;
                DelayMs(100);
            }
            EEPROMwrite(0x30,0x00);
        }
    }
    else
    {
		if(CountKey>100 & CountKey<1000)
        {
			if(Learn==1){Learn=0;}
            else if(Learn==0){Learn=1;}
            LED=1;
            DelayMs(200);
            LED=0;
        }
		CountKey=0;
    }
    DelayMs(1);    
    if(Learn==1)
    {
		Belink++;
        if(Belink>60)
        {
			LED=!LED;
            Belink=0;
        }
        if(Lock==1)
        {
			Save++;
            if(Save<=7)
            {
				EEPROMwrite((Save*3),RFData[0]);
                DelayMs(10);
				EEPROMwrite(((Save*3)+1),RFData[1]);
                DelayMs(10);
				EEPROMwrite(((Save*3)+2),RFData[2]);
                DelayMs(10);
				EEPROMwrite(0x30,Save);
                DelayMs(10);
				DataS[Save-1][0]=RFData[0];
				DataS[Save-1][1]=RFData[1];
				DataS[Save-1][2]=RFData[2];
				LED=1;
				DelayMs(500);
				LED=0;
            }
            else
            {
				Save=7;
                char i;
                LED=0;
                for(i=0;i<5;i++)
                {
					LED=!LED;
					DelayMs(200);
                }
                LED=0;
            }
            Lock=0;
            Learn=0;
            Belink=0;
        }
    }
 }
}

void POWER_INITIAL (void) 
{ 
    OSCCON = 0B01110001;				//IRCF=111=16MHz/4T=4MHz,0.25us                             
	INTCON = 0;  						
	PORTA  = 0B00000000;					
	TRISA  = 0B11111001;				
	WPUA   = 0B11111000; 
    OPTION = 0B00001000;				//Bit3=1,WDT MODE,PS=000=WDT RATE 1:1 
	MSCKCON = 0B00000000;
    TRISA0 =1; 
	PAIF =0; 
    IOCA0 =1;  
	PAIE =1;  
}

void TIMER2_INITIAL(void) 
{
	 
	T2CON = 0B00000001; 
	TMR2 = 0;  				
	PR2 = 50;//50uS
	TMR2IF = 0;	
	TMR2IE = 1;
	TMR2ON = 1;	
	PEIE=1;
	GIE = 1;

}

unsigned char EEPROMread(unsigned char EEAddr)
{
	unsigned char ReEEPROMread;

	EEADR = EEAddr;    
	RD = 1;
	ReEEPROMread = EEDAT;
	return ReEEPROMread;
}

void EEPROMwrite(unsigned char EEAddr,unsigned char Data)
{
	GIE = 0;						
	while(GIE); 					
	EEADR = EEAddr; 	 			
	EEDAT = Data;		 			
	EEIF = 0;
	EECON1 |= 0x34;					
	WR = 1;							
	while(WR);      				
	GIE = 1;
}

void DelayUs(unsigned char Time)
{
	unsigned char a;
	for(a=0;a<Time;a++)
	{
		NOP();
        CLRWDT(); 
	}
}                  

void DelayMs(unsigned int Time)
{
	unsigned int a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<5;b++)
		{
		 	DelayUs(197);
		}
	}
}
//===========================================================
