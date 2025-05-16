//Project: RF-car.prj
// Device: FT60F01X
// Memory: Flash 1KX14b, EEPROM 256X8b, SRAM 64X8b
// Author: 
//Company: 
//Version:
//   Date: 


/*                  FT60F011A  SOP8 
*                 ----------------
*  VDD-----------|1(VDD)    (GND)8|------------GND     
*  outQ----------|2(PA2)    (PA4)7|------------TX 
*  outD----------|3(PA1)    (PA5)6|------------LED
*  RX------------|4(PA3)    (PA0)5|------------DATA-touch
*			      ----------------
*/

//===========================================================
//===========================================================
#include	"SYSCFG.h"


#define DATA PA3
#define data_touch PA0
#define DATT PA4

#define LED PA5
#define outD PA1
#define outQ PA2

#define	unchar	unsigned char


//Variable definition
volatile unsigned int Timer=0, conterout=0;
volatile unsigned char Data[3],Time=0 ,DataM[3],DataS[2][3],RFData[3], contlern=0;
volatile unsigned char Start=0,Count=0,Buffer=0,Bit=0, key=0  ,leddarb=0 , ledq=0 , ledchange=0;	

volatile bit Frist=0,Learn=0,Finish=0,Lock=0;
//===========================================================

void POWER_INITIAL(void);
void TIMER2_INITIAL(void);
void TIMER0_INITIAL(void);

unsigned char EEPROMread(unsigned char EEAddr);
void EEPROMwrite(unsigned char EEAddr,unsigned char Data);
void DelayUs(unsigned char Time);
void DelayMs(unsigned int Time);

void SEND_DATA(unchar Code);
void SEND_CODE(unchar Code1,unchar Code2,unchar Code3);

//=============================================
void interrupt ISR(void)
{


  if(T0IE && T0IF)					
	{
		TMR0 = 239;					
		T0IF = 0;    
        
        if(data_touch==0){
        
             conterout++;
             LED=0;
             
        }
        if(data_touch==1 && conterout>230 && conterout<360 ){
			 
             
             conterout++;
             
        }
        
        if(data_touch==1 && conterout > 360 && conterout<850 ){
			 
            LED=1;
             
            if(conterout>450 && conterout<490){
				key=1;
                
                SEND_CODE(DataS[0][0],DataS[0][1],DataS[0][2]);
                SEND_CODE(DataS[0][0],DataS[0][1],DataS[0][2]);
                SEND_CODE(DataS[0][0],DataS[0][1],DataS[0][2]);
                SEND_CODE(DataS[0][0],DataS[0][1],DataS[0][2]);
                SEND_CODE(DataS[0][0],DataS[0][1],DataS[0][2]);
                
            
			}
			if(conterout>570 && conterout<610){
				key=2;
               
                SEND_CODE(DataS[1][0],DataS[1][1],DataS[1][2]);
                SEND_CODE(DataS[1][0],DataS[1][1],DataS[1][2]);
                SEND_CODE(DataS[1][0],DataS[1][1],DataS[1][2]);
                SEND_CODE(DataS[1][0],DataS[1][1],DataS[1][2]);
                SEND_CODE(DataS[1][0],DataS[1][1],DataS[1][2]);
                
			}
			if(conterout>690 && conterout<725){
				//key=3;
                
                if(leddarb==0){leddarb=1;
                }
                else
				{
                leddarb=0;
                }
                
                ledchange=1;
                
			}
			if(conterout>820 && conterout<850){
				//key=4;
               
               if(ledq==0){ledq=1;
                }
                else
				{
                ledq=0;
                }
                
                ledchange=2;
                
			}
              
            conterout=0;
        }
        
        
        if(data_touch==1 && conterout>1150 && conterout<1210 ){
			 
             conterout++;
             
        }
        
        if(data_touch==1 && conterout > 1210 && conterout<2100 ){
			 
            
             
            if(conterout>1550 && conterout<1590){
				key=5;
			}
			if(conterout>1670 && conterout<1710){
				key=6;
			}
			
              
              conterout=0;
              TMR2IE = 1;
              T0IE=0;
              Learn=1;
              
            
        }
        
        
        
       
        
        
	} 



if(TMR2IE && TMR2IF)			//100us 5KHz
 {
 
	conterout++;
    if(conterout>=10000){conterout=0; LED=!LED;contlern++;}
	if(contlern>30){
		key=0;
		Lock=0;
		Learn=0;
		
		TMR2IE = 0;
		conterout=0;
		LED=1;
		
		T0IE=1;
        contlern=0;
    }
    
    
	TMR2IF = 0;
    CLRWDT();
	 if(DATA==0){
		Time++;Frist=1;Timer=0;
	 }
	 else
	 {
	 
	  Timer++;
	  if(Timer>250){Timer=0;Finish=0;}
		if(Frist==1 & Finish==0)
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
						if(Data[0]==RFData[0] && Data[1]==RFData[1] &&Data[2]==RFData[2]) 
						{
							DataM[0]=RFData[0];
							DataM[1]=RFData[1];
							DataM[2]=RFData[2];
							
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


//===========================================================

void main()
{
 POWER_INITIAL();
 TIMER2_INITIAL();
 TIMER0_INITIAL();       
 
 
        LED=1;
        
        
 
char i;
for(i=0;i<2;i++)
{
	CLRWDT();
	DataS[i][0]=EEPROMread(i*3);
	DataS[i][1]=EEPROMread((i*3)+1);
	DataS[i][2]=EEPROMread((i*3)+2);
}
 
leddarb=EEPROMread(50);
ledq=EEPROMread(51);

if(leddarb!=0)leddarb=1;
if(ledq!=0)ledq=1;

outD=leddarb;
outQ=ledq;

 Start=0;
 
 DATT = 0;
 
 while(1)
 {
	CLRWDT();
    
    
    if(ledchange==1){
		ledchange=0;
		outD=leddarb;
        EEPROMwrite(50,leddarb);
		DelayMs(10);
    
    }
    if(ledchange==2){
		ledchange=0;
		outQ=ledq;
        EEPROMwrite(51,ledq);
		DelayMs(10);
    
    }
    
    
    if(Learn==1)
    {
		
        
        if(Lock==1)
        {
            
            
			EEPROMwrite(((key-5)*3),DataM[0]);
			DelayMs(10);
			EEPROMwrite((((key-5)*3)+1),DataM[1]);
			DelayMs(10);
			EEPROMwrite((((key-5)*3)+2),DataM[2]);
			DelayMs(10);
			DataS[key-5][0]=DataM[0];
			DataS[key-5][1]=DataM[1];
			DataS[key-5][2]=DataM[2];
				
            
            key=0;
            Lock=0;
            Learn=0;
            
            TMR2IE = 0;
            conterout=0;
            LED=1;
            
            T0IE=1;
        }
    }
				
    
 }
}


//===========================================================






void POWER_INITIAL(void) 
{ 
	OSCCON = 0B01110000; //IRCF=111=16MHz/2T=8MHz,0.125us  
    
	INTCON = 0;
    OPTION = 0B00001000;    
    
	PORTA = 0B00000000;		
	TRISA = 0B00001001;
    
	WPUA = 0B00000001;
    
	MSCKCON = 0B00000000;	
}

void TIMER2_INITIAL(void) 
{
	 
	T2CON = 0B00000001; 
	TMR2 = 0;  				
	PR2 = 50;//50uS
	TMR2IF = 0;	
	
	TMR2ON = 1;	
	PEIE=1;
	GIE = 1;

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
    T0IE = 1;						//清空T0软件中断
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

void SEND_DATA(unchar Code)
{
 unsigned char Byte = 0b10000000, i = 0;   
 for(i = 0; i <= 7; i++)
 {
  if(Code & (Byte >> i))
  {
    DATT = 1;
    DelayUs(420);
    DelayUs(420);
    DelayUs(420);

    DATT = 0;
    DelayUs(800);
	DelayUs(800);
    DelayUs(800);
    DelayUs(800);
	DelayUs(800);
  }
  else
  {
    DATT = 1;
    DelayUs(800);
	DelayUs(800);
    DelayUs(800);
    DelayUs(800);
	DelayUs(800);

    DATT = 0;
    DelayUs(420);
    DelayUs(420);
    DelayUs(420);
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
 
 DATT = 1;
    DelayUs(410);

    DATT = 0;
}

