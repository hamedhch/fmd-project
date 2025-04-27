//Project: Remute-RF-RX-FMD.prj
// Device: FT61E02X
// Memory: Flash 2KX14b, EEPROM 256X8b, SRAM 128X8b
// Author: Mahdi Khalilian
//Company: Aria Elec
//Version: V1.0
//   Date: 2024/11/05
//===========================================================
//===========================================================
#include	"SYSCFG.h"
//===========================================================
#define OUTPUT(A,B,C,D,E,F,G,P) PA4=A;PC0=B;PC1=C;PC2=D;PC3=E;PC4=F;PC5=G;PC6=P;
#define LED PC7
#define DATA PA2
#define KEY_1 PA6
#define KEY_2 PA7

//Variable definition
volatile unsigned int Belink=0,CountKey1=0,CountKey2=0,Timer=0,Time=0;
volatile unsigned char True=0,State=0,Set=0,Data[3],DataM[3],DataS[5][3],RFData[3],RFCode;
volatile unsigned char Frist=0,Start=0,Count=0,Lock=0,Buffer=0,Bit=0,Finish=0,Learn=0,Save=0;	

//===========================================================

void POWER_INITIAL(void);
void TIMER2_INITIAL(void);
unsigned char EEPROMread(unsigned char EEAddr);
void EEPROMwrite(unsigned char EEAddr,unsigned char Data);
void DelayUs(unsigned char Time);
void DelayMs(unsigned int Time);

void interrupt ISR(void)
{ 
 if(TMR2IE && TMR2IF)			//100us 5KHz
 {
	TMR2IF = 0;
    CLRWDT();
 if(DATA==0){Time++;Frist=1;Timer=0;}
 else
 {
  Timer++;
  if(Timer>500){Timer=0;Finish=0;}
	if(Frist==1 & Finish==0)
	{
		Timer=0;
		if(Start==1)
		{
			Bit--;
			if(Time>14 & Time< 25)
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
                        RFCode=DataM[2]&0XF;
                        DataM[2]=DataM[2]>>4;
                        DataM[2]=DataM[2]<<4;
                        Finish=1;
                        Lock=1;
					}  
                } 
				Buffer=0;
			}
		}
        if(Time>150 & Time<250){Start=1;Bit=8;}
		Frist=0;
        Time=0;
	}			
 }
 }
 
 
}

void main()
{
 POWER_INITIAL();
 TIMER2_INITIAL();
 OUTPUT(1,1,1,1,1,1,1,1);
 Save=EEPROMread(0x50);
 if(Save<6)
 {
	char i;
	for(i=0;i<Save;i++)
    {
		CLRWDT();
        DataS[i][0]=EEPROMread(Save*3);
        DataS[i][1]=EEPROMread((Save*3)+1);
        DataS[i][2]=EEPROMread((Save*3)+2);
    }
 }

 State=8;
 Set=1;
 Start=0;
 
 while(1)
 {
	CLRWDT();
    if(Lock==1 & Learn==0)
    {
        Lock=0;
        char i;
        for(i=0;i<Save;i++)
        {
			if(DataM[0]==DataS[i][0] && DataM[1]==DataS[i][1] && DataM[2]==DataS[i][2])
            {
				True=1;
                break;
            }
        }
        if(True==1)
        {
			switch(RFCode)
			{
				case 1:OUTPUT(1,1,1,1,1,1,1,1);State=8;break; 
				case 2:OUTPUT(0,0,0,0,0,0,0,0);State=0;break;
				case 4:State++;if(State>=8){State=8;}break;
				case 8:State--;if(State==255){State=0;}break;          
			}
            //DataM[0]=DataM[1]=DataM[2]=0;
            True=0;
            LED=1;
            DelayMs(200);
            LED=0; 
        }
	}
    //KEY 1
    if(KEY_1==0)
    {
		if(CountKey1<240){CountKey1++;}
        if(KEY_1==0 & CountKey1>225 & CountKey1<235)
        {
			CountKey1=250;
            //if(State!=8){State=8; Set=1;}
            //else if(State==8){State=0;Set=0;}
            if(Learn==1){Learn=0;}
            else if(Learn==0){Learn=1;}
            LED=1;
            DelayMs(200);
            LED=0;
        }
    }
    else
    {
		CountKey1=0;
    }
    //KEY 2
    if(KEY_2==0)
    {
		if(CountKey2<240){CountKey2++;}
        if(KEY_2==0 & CountKey2>225 & CountKey2<235)
        {
			CountKey2=250;
            //if(State<=8 & Set==0){State++;if(State==8){Set=1;}}
            //else if(State>=0 & Set==1){State--;if(State==0){Set=0;}}
            char i;
            for(i=0;i<6;i++)
            {
				CLRWDT();
                DataS[i][0]=DataS[i][1]=DataS[i][2]=0;
                Save=0;
				EEPROMwrite((i+1*3),0x00);
                EEPROMwrite((i*3)+1,0x00);
                EEPROMwrite((i*3)+2,0x00);
                EEPROMwrite(0x50,0x00);
                LED=1;
				DelayMs(100);
				LED=0;
                DelayMs(100);
            }
        }
    }
    else
    {
		CountKey2=0;
    }
    
    if(Learn==1)
    {
		Belink++;
        if(Belink>10000)
        {
			LED=!LED;
            Belink=0;
        }
        if(Lock==1)
        {
			Save++;
            if(Save<6)
            {
				EEPROMwrite((Save*3),DataM[0]);
                DelayMs(10);
				EEPROMwrite(((Save*3)+1),DataM[1]);
                DelayMs(10);
				EEPROMwrite(((Save*3)+2),DataM[2]);
                DelayMs(10);
				EEPROMwrite(0x50,Save);
                DelayMs(10);
				DataS[Save-1][0]=DataM[0];
				DataS[Save-1][1]=DataM[1];
				DataS[Save-1][2]=DataM[2];
				LED=1;
				DelayMs(1000);
				LED=0;
            }
            else
            {
				Save=5;
                char i;
                LED=0;
                for(i=0;i<5;i++)
                {
					LED=!LED;
					DelayMs(300);
                }
                LED=0;
            }
            Lock=0;
            Learn=0;
            Belink=0;
        }
    }
				
    //OUTPUT
    switch(State)
	{
		case 0:OUTPUT(0,0,0,0,0,0,0,0);break;    
		case 1:OUTPUT(1,0,0,0,0,0,0,0);break;    
		case 2:OUTPUT(1,1,0,0,0,0,0,0);break;    
		case 3:OUTPUT(1,1,1,0,0,0,0,0);break;    
		case 4:OUTPUT(1,1,1,1,0,0,0,0);break;    
		case 5:OUTPUT(1,1,1,1,1,0,0,0);break;    
		case 6:OUTPUT(1,1,1,1,1,1,0,0);break;    
		case 7:OUTPUT(1,1,1,1,1,1,1,0);break;   
		case 8:OUTPUT(1,1,1,1,1,1,1,1);break;           
	}
 }
}




void POWER_INITIAL(void) 
{ 
	OSCCON = 0B01110001; //IRCF=111=16MHz/2T=8MHz,0.125us  
	INTCON = 0;
	PORTA = 0B00000000;		
	TRISA = 0B11000110;
	PORTC = 0B00000000; 	
	TRISC = 0B00000000;	
	WPUA = 0B11000110;
	OPTION = 0B00001000;      
	MSCKCON = 0B00000000;	
	CMCON0 = 0B00000111;
}

void TIMER2_INITIAL(void) 
{
	 
	T2CON = 0B00000001; 
	TMR2 = 0;  				
	PR2 = 100;//50uS
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
