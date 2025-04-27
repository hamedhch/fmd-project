//Project: Remute-RF-TX-FMD.prj
// Device: FT60E02X
// Memory: Flash 1KX14b, EEPROM 256X8b, SRAM 64X8b
// Author: Mahdi Khalilian
//Company: Aria Elec
//Version: V1.0
//   Date: 2024/11/13
//===========================================================
//                 FT61E023A  SOP16 
//                 ----------------
//  KEY1-D--------|1(PA1)   (PA0)16|---------C-KEY4     
//  KEY2----------|2(PA7)   (PA2)15|-----------KEY5
//  KEY3----------|3(PA6)   (PA4)14|-----------KEY6
//  VCC-----------|4(VDD)   (VEE)13|------------GND
//  LED1----------|5(PC7)   (PC0)12|--------RX-DATA
//  LED2----------|6(PC6)   (PC1)11|-----------LED4
//  LED3----------|7(PC5)   (PC2)10|-----------LED5
//  DATA-TX-------|8(PC4)   (PC3)9 |-----------LED6
//			       ----------------
//
//===========================================================
#include	"SYSCFG.h"
//===========================================================
#define DATT PC4
#define DATR PC0

#define KEY1 PA1
#define KEY2 PA7
#define KEY3 PA6
#define KEY4 PA0
#define KEY5 PA2
#define KEY6 PA4

#define LED1 PC7
#define LED2 PC6
#define LED3 PC5
#define LED4 PC1
#define LED5 PC2
#define LED6 PC3

#define	unchar	unsigned char
#define	unint	unsigned int

//Variable definition
unchar ReadAPin=0,Set=0,Learn=0,CodeKey=0,CodeLearn[3];
unint CountKey=0;
//===========================================================
void POWER_INIT(void);
void INT_INIT(void);
unchar EEPROMread(unchar EEAddr);
void EEPROMwrite(unchar EEAddr,unchar Data);
void DelayUs(unsigned int Time);
void DelayMs(unsigned int Time);
void SEND_DATA(unchar Code);
void SEND_CODE(unchar Code1,unchar Code2,unchar Code3);
void GEN_CODE();

void interrupt ISR(void)
{
	if(PAIE && PAIF)		
    {
		ReadAPin = PORTA; 	
		PAIF = 0;
    }
}

void main()
{
 POWER_INIT(); 
 INT_INIT();
 Learn=EEPROMread(0X13);
 if(Learn==1)
 {
	CodeLearn[0]=EEPROMread(0X10);
    CLRWDT();
    CodeLearn[1]=EEPROMread(0X11);
    CLRWDT();
    CodeLearn[2]=EEPROMread(0X12);
    CLRWDT();
    Learn=1;
 }
 else
 {
	CodeLearn[0]=0X59;
    CodeLearn[1]=0X95;
    CodeLearn[2]=0X40;
    Learn=0;
 }
 Learn=0;
 while(1)
 {
	if(KEY1==0){CodeKey=1;LED1=1;}
    if(KEY2==0){CodeKey=2;LED2=1;}
    if(KEY3==0){CodeKey=4;LED3=1;}
    if(KEY4==0){CodeKey=8;LED4=1;}
    if(KEY5==0){CodeKey=10;LED5=1;}
    if(KEY6==0){CodeKey=14;LED6=1;}
    if(KEY2==0 && KEY5==0 & Learn==0)
    {
		Set++;
        if(Set>30)
        {
			Set=0;
            PORTC=0X00;
			LED1=1;DelayMs(200);LED1=0;DelayMs(100);
            LED2=1;DelayMs(200);LED2=0;DelayMs(100);
            LED3=1;DelayMs(200);LED3=0;DelayMs(100);  
            LED4=1;DelayMs(200);LED4=0;DelayMs(100);
            LED5=1;DelayMs(200);LED5=0;DelayMs(100);
            LED6=1;DelayMs(200);LED6=0;DelayMs(100); 
            GEN_CODE();
        }
    }
    CodeLearn[2]=CodeLearn[2]>>4;
    CodeLearn[2]=CodeLearn[2]<<4 | CodeKey;
    SEND_CODE(CodeLearn[0],CodeLearn[1],CodeLearn[2]);
    if(KEY1==1  && KEY2==1 && KEY3==1  && KEY4==1  && KEY5==1 && KEY6==1)
    {
		PORTC=0X00;
		SLEEP();
    }
 }  
}

void POWER_INIT(void) 
{ 
	OSCCON = 0B01110001;				//IRCF=111=16MHz/2=8MHz,0.125us
	INTCON = 0; 
     			
	PORTA = 0B00000000;		
	TRISA = 0B11111111;				
	WPUA  = 0B11111111; 
    										
	PORTC = 0B00000000; 	
	TRISC = 0B00000001;		 	
    
	OPTION = 0B00001000;	//Bit3=1,WDT MODE,PS=000=WDT RATE 1:1
    MSCKCON = 0B00000000;
      
	CMCON0 = 0B00000111;
}

void INT_INIT(void)
{					
	ReadAPin = PORTA;					
	PAIF =0;   							
    IOCA0 =1;
    IOCA1 =1; 
    IOCA2 =1; 
    IOCA4 =1;
    IOCA6 =1; 
    IOCA7 =1;   							
	PAIE =1;
    GIE = 1;
}

unchar EEPROMread(unchar EEAddr)
{
	unchar ReEEPROMread;

	EEADR = EEAddr;    
	RD = 1;
	ReEEPROMread = EEDAT;   
	return ReEEPROMread;
}

void EEPROMwrite(unchar EEAddr,unchar Data)
{
	GIE = 0;				
	while(GIE); 			
	EEADR = EEAddr; 	 	
	EEDAT = Data;		 	
	EEIF = 0;
	EECON1 = 0x34;			
	WR = 1;			
	while(WR);      	
	GIE = 1;
}

void DelayUs(unsigned int Time)
{
	unsigned int a;
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


void SEND_DATA(unchar Code)
{
 unsigned char Byte = 0b10000000, Bit = 0;   
 for(Bit = 0; Bit <= 7; Bit++)
 {
  if(Code & (Byte >> Bit))
  {
    DATT = 1;
    DelayUs(600);

    DATT = 0;
    DelayUs(310);
  }
  else
  {
    DATT = 1;
    DelayUs(310);

    DATT = 0;
    DelayUs(600); 
  }
 }

}

void SEND_CODE(unchar Code1,unchar Code2,unchar Code3)
{
 DATT=0;
 DelayMs(5); //x2
 SEND_DATA(Code1);
 SEND_DATA(Code2);
 SEND_DATA(Code3);
 if(CodeKey!=1){DATT = 1;DelayUs(310);}
 else{DATT = 0;DelayUs(310);}
}
 
void GEN_CODE()
{
 unchar i=0;
 while(1)
 {
	i++;
    if(KEY3==0)
    {
		if(CountKey<510){CountKey++;}
        if(KEY3==0 & CountKey>500 & CountKey<510)
        {
			CodeLearn[0]=i;
            i-58;
            CountKey=520;
            break;
        }
    }
 }
 LED1=1;
 DelayMs(200);
 LED1=0;
 CountKey=0;
 while(1)
 {
	i--;
    if(KEY3==0)
    {
		if(CountKey<710){CountKey++;}
        if(KEY3==0 & CountKey>700 & CountKey<710)
        {
			CodeLearn[1]=i;
            i+23;
            CountKey=720;
            break;
        }
    }
 }
 LED2=1;
 DelayMs(200);
 LED2=0;
 CountKey=0;
 while(1)
 {
	i++;
    if(KEY3==0)
    {
		if(CountKey<360){CountKey++;}
        if(KEY3==0 & CountKey>350 & CountKey<360)
        {
			CodeLearn[2]=i;
            i=0;
            CountKey=370;
            break;
        }
    }
 }
 CountKey=0;
 Learn=1;
 EEPROMwrite(0X10,CodeLearn[0]);
 EEPROMwrite(0X11,CodeLearn[1]);
 EEPROMwrite(0X12,CodeLearn[2]);
 EEPROMwrite(0X13,Learn);
 LED3=1;
 DelayMs(200);
 LED3=0;
 Learn=0;
}
    
//===========================================================
