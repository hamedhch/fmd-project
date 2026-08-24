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
*  data_touch----|2(PA2)    (PA4)7|------------out1
*  out3----------|3(PA1)    (PA5)6|------------out4
*  RF------------|4(PA3)    (PA0)5|------------out2
*			      ----------------
*/


// FMD-HT



//===========================================================
//===========================================================
#include	"SYSCFG.h"





#define RF PA3

#define out1 PA4
#define out2 PA0
#define out3 PA1
#define out4 PA5

#define data_touch PA2






#define	unchar	unsigned char


//Variable definition
volatile unsigned int conternotRF=0, conterout=0 , conteroutnot=0;
volatile unsigned char Timedown=0 , Data[3] ,DataM[3],DataS[4][3],RFData[3] , eerom=0;
volatile unsigned char  lastKey=0 ,LernRFKey=0 , Count=0 , Buffer=0,Bit=0 ;	

volatile bit  O1=0,O2=0,O3=0,O4=0,Start=0,state1=0 ,state2=0 ,state3=0 ,state4=0  , LernRFblink=0 , LernRF=0,Frist=0,Finish=0,Lock=0;
//===========================================================

void POWER_INITIAL(void);
void TIMER2_INITIAL(void);
void TIMER0_INITIAL(void);

unsigned char EEPROMread(unsigned char EEAddr);
void EEPROMwrite(unsigned char EEAddr,unsigned int Data);
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
        
        
        if(LernRF==1){
			conternotRF++;
        }
        
		if(conternotRF>=20000 ){//“„«‰ Õ–› —Ì„Ê  «“ ò·Ìœ
			conternotRF=0;
            
            DataM[0]=0;
            DataM[1]=0;
            DataM[2]=0;
            
			Lock=1;
		}
        
        
        if(data_touch==0){
             conterout++;
             conteroutnot=0;
        }
        
        if(data_touch==1 && conteroutnot<=500){
             conteroutnot++;
        }
        
						//conterout>5 && conterout<15
        if(data_touch==1 && conterout>230 && conterout<360 ){
			conterout++;
        }
        
        if(conteroutnot>300 ){
			 
             //conterout>53 && conterout<57
            if(conterout>1080 && conterout<1150 ){

                 
                if(lastKey==1)conterout=470;
                if(lastKey==2)conterout=590;
                if(lastKey==3)conterout=710;
                if(lastKey==4)conterout=840;
                
                LernRFblink=1;
                
                
			}
            
            
             //conterout>18 && conterout<22
            if(((conterout>450 && conterout<490 ) || O1==1 ) && LernRFKey!=1){

                if(state1==0){
					state1=1;
                }else{
					state1=0;
                }
                
                eerom=1;
                if(O1!=1)lastKey=1;
                out1=state1;
                O1=0;
			}
             
             //conterout>25 && conterout<29
            if(((conterout>570 && conterout<610 ) || O2==1) && LernRFKey!=2){

                if(state2==0){
					state2=1;
                }else{
					state2=0;
                }
                eerom=2;
                
                out2=state2;
                if(O2!=1)lastKey=2;
                O2=0;
			}
           
             //conterout>32 && conterout<36
            if(((conterout>690 && conterout<725 ) || O3==1) && LernRFKey!=3){

                if(state3==0){
					state3=1;
                }else{
					state3=0;
                }
                eerom=3;
                
                out3=state3;
                if(O3!=1)lastKey=3;
                O3=0;
			}
			
             //conterout>39 && conterout<43
            if(((conterout>820 && conterout<850 ) || O4==1) && LernRFKey!=4){

                if(state4==0){
					state4=1;
                }else{
					state4=0;
                }
                eerom=4;
                
                out4=state4;
               if(O4!=1)lastKey=4;
               O4=0;
            }
            //----------------------------------------------------------
            
            conterout=0;
        }
        
	} 



if(TMR2IE && TMR2IF)			//100us 5KHz
 {
 
	//out1=!out1;
    
	TMR2IF = 0;
    CLRWDT();
    
	 if(RF==0){
		Timedown++;Frist=1;
        
	 }
	 else
	 {
		
        
		if(Timedown>250){
			Finish=0;
			Timedown=0;
        }
        
		if(Frist==1 & Finish==0)
        {
			
			if(Start==1)
			{
				Bit--;
				if(Timedown>15 & Timedown< 30){
					Buffer = Buffer << 1;  
				}
				else if(Timedown>5 & Timedown< 12){
					Buffer = Buffer << 1;
					Buffer = Buffer + 1;
				}
                else{
					Count=0;
                    Bit=8;
                    Buffer=0;
                    Start=0;
                }
                
				if(Bit == 0){
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
						}else
						{
                         NOP();
                        }
					} 
					Buffer=0;
				}
			}
            
			if(Timedown>200 && Timedown<240){ 
				Start=1;Bit=8;
            }
            
			Frist=0;
			
		}
        			Timedown=0;
	 }
 
 }
 
}


//===========================================================

void main()
{
 POWER_INITIAL();
 TIMER2_INITIAL();
 TIMER0_INITIAL();       
 
 TMR2IE = 1;   

Finish=0;

state1=EEPROMread(31);
state2=EEPROMread(32);
state3=EEPROMread(33);
state4=EEPROMread(34);
 

out1=state1;
out2=state2;
out3=state3;
out4=state4;
 
char i;
for(i=0;i<4;i++)
{
	CLRWDT();
	DataS[i][0]=EEPROMread(i*3);
	DataS[i][1]=EEPROMread((i*3)+1);
	DataS[i][2]=EEPROMread((i*3)+2);
}


Start=0;

 while(1)
 {
	CLRWDT();
    
    if(eerom!=0){
		if(eerom==1)EEPROMwrite(31,state1);
        if(eerom==2)EEPROMwrite(32,state2);
        if(eerom==3)EEPROMwrite(33,state3);
        if(eerom==4)EEPROMwrite(34,state4);
        eerom=0;
    }
   
    
    if(LernRFblink==1){
		
        if(lastKey==1) DelayMs(200) ,out1=!out1 , DelayMs(200) , out1=!out1 , LernRFKey=1;
		if(lastKey==2) DelayMs(200) ,out2=!out2 , DelayMs(200) , out2=!out2 , LernRFKey=2 ;
		if(lastKey==3) DelayMs(200) ,out3=!out3 , DelayMs(200) , out3=!out3 , LernRFKey=3 ;
		if(lastKey==4) DelayMs(200) ,out4=!out4 , DelayMs(200) , out4=!out4 , LernRFKey=4 ;
		
        LernRFblink=0;
        conternotRF=0;
        LernRF=1;
        
    }
    
    if(Lock==1 & LernRF==0)
    {
        Lock=0;
        char i;
        for(i=0;i<4;i++)
        {
			if(DataM[0]==DataS[i][0] && DataM[1]==DataS[i][1] && DataM[2]==DataS[i][2]){
				if(i==0)O1=1;
				if(i==1)O2=1;
				if(i==2)O3=1;
				if(i==3)O4=1;
            }
        }
	}
    
    
    if(Lock==1 & LernRF==1)
    {
		EEPROMwrite(((LernRFKey-1)*3),DataM[0]);
		DelayMs(10);
		EEPROMwrite((((LernRFKey-1)*3)+1),DataM[1]);
		DelayMs(10);
		EEPROMwrite((((LernRFKey-1)*3)+2),DataM[2]);
		DelayMs(10);
		DataS[LernRFKey-1][0]=DataM[0];
		DataS[LernRFKey-1][1]=DataM[1];
		DataS[LernRFKey-1][2]=DataM[2];
			
		if(LernRFKey==1)conterout=20;
		if(LernRFKey==2)conterout=27;
		if(LernRFKey==3)conterout=34;
		if(LernRFKey==4)conterout=41;
		
		LernRFKey=0;
		Lock=0;
		LernRF=0;
		
    }
    
 }
}


//===========================================================






void POWER_INITIAL(void) 
{ 
	OSCCON = 0B01110000; //IRCF=111=16MHz/2T=8MHz,0.125us  
    
	INTCON = 0;
    OPTION = 0B00001000;    
    
	PORTA = 0B00000100;		
	TRISA = 0B00001100;
    
	WPUA = 0B00001100;
    
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
	OPTION = 0B00000110;	 			// ±÷”‘¥Œ™÷∏¡Ó ±÷”£¨‘§∑÷∆µ±»Œ™1:256
	//Bit5:	T0CS Timer0 ±÷”‘¥—°‘Ò 
	//		1-Õ‚≤ø“˝Ω≈µÁ∆Ω±‰ªØT0CKI 0-ƒ⁄≤ø ±÷”(FOSC/4)
	//Bit4:	T0SE T0CKI“˝Ω≈¥•∑¢∑Ω Ω 1-œ¬Ωµ—ÿ 0-…œ…˝—ÿ
	//Bit3:	PSA ‘§∑÷∆µ∆˜∑÷≈‰Œª 0-Timer0 1-WDT 
	//Bit[2:0]:PS 8Œª‘§∑÷∆µ±» 111 - 1:256
	TMR0 = 239; 
    T0IF = 0;	
    T0IE = 1;						//«Âø’T0»Ìº˛÷–∂œ
}

unsigned char EEPROMread(unsigned char EEAddr)
{
	unsigned char ReEEPROMread;

	EEADR = EEAddr;    
	RD = 1;
	ReEEPROMread = EEDAT;
	return ReEEPROMread;
}

void EEPROMwrite(unsigned char EEAddr,unsigned int Data)
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
