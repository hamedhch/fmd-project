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
#define	 LED_3		PA0
#define	 LED_1		PA4
#define	 LED_2		PA5


#define  ZEROC 		PA1


int ReadAPin  , R=20 , G=20, B=20 ;

unsigned char	 ir_status , ir_timer , Counter ,Set=1, mode ,re , repeat , Counter_On_set=40 , Counter_On=40,s,m,h,CountINT ,RGB , timer , one , modetime,countz,Rq,Gq,Bq;

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
    
    
    /*
    
	 if(PAIE && PAIF)		
    {
    
      pin=~pin;
        
        if(Counter>150){
        
			Counter=0;
			
			LED_1=0;
			LED_2=0;
			LED_3=0;
        }
        
		
        
		if(Set==1){
			if(Counter_On>Counter_On_set){
				Counter_On=Counter_On-1;
			}else{
				Counter_On=Counter_On_set;
			}
		}
		
		if(Set==0 && Counter_On<=160)
		{
			Counter_On=Counter_On+2;
		}
        
        
    
    
    
    
    
		ReadAPin = PORTA; 	
		PAIF = 0;
        
        
        //Backup=Counter;
        
		CountINT++;
        if(CountINT>=100){
			CountINT=0;
			s++;
            re=0;
			if(s>=60){
				s=0;
				if(timer>0)m++;
            }

            if(m>=60)m=0,h++;
		}
    
        
      
        
    }

	
    
    
    
    */
    
    
    
    if(TMR2IE && TMR2IF)			  //200us中断一次 = 2.5kHz
	{
    
		TMR2IF = 0;
        TMR2IE = 1;
        
        
        
        
        
        
        if(ZEROC==0){
			pin=~pin;
            countz++;
            
        }else{
			countz=0;
			pin=0;
		}
        
        
        
        
        
        if(countz==2){
        
			if(Counter>150){
			
				Counter=0;
				
				LED_1=0;
				LED_2=0;
				LED_3=0;
			}
			Rq=0;
			Gq=0;
            Bq=0;
			
			if(Set==1){
				if(Counter_On>Counter_On_set){
					Counter_On=Counter_On-1;
				}else{
					Counter_On=Counter_On_set;
				}
			}
			
			if(Set==0 && Counter_On<=160)
			{
				Counter_On=Counter_On+2;
			}
        
        }
        
        
        
        
        Counter++;
		
		if(Counter>=Counter_On)
		{
        
			if(Rq==1)LED_1=0,Rq=2;
            if(Gq==1)LED_2=0,Gq=2;
            if(Bq==1)LED_3=0,Bq=2;
            
            
            
        
			if(Counter>=R && Rq==0){
				Rq=1;
				LED_1=1;
			}
            
			if(Counter>=G && Gq==0){
				Gq=1;
				LED_2=1;
			}
            
			if(Counter>=B && Bq==0){
				Bq=1;
				LED_3=1;
			}
            
            
		}
        
        
        
        
        
        
        
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
	WPUA   = 0B00000010;     			//PA端口上拉控制 1-开上拉 0-关上拉								
					 		            //开PA2上拉
	MSCKCON = 0B00000000;
}


void PA1_Level_Change_INITIAL(void)
{
	TRISA1 =1; 				
	ReadAPin = PORTA;		
	PAIF =0;   				
    IOCA1 =1;  		
    INTEDG=0;
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
	       
    //PA1_Level_Change_INITIAL();
    TIMER2_INITIAL();
    
	GIE = 1; 				 
    				 
    PAIE =1;
    TMR2IE = 1;
    
	while(1)
	{
    
		if(h==timer && h!=0){
			Set=0;
			m=0;
			h=0;
			timer=0;
		}
		
		
		
		if(mode==2 || mode==1 ){
			if(Counter%modetime==0){
				
				if(RGB==0 ){//B=0   R=160  G=160
                    G=G-1;
                    if(G<=0)RGB=1;
				}
				if(RGB==1 ){//B=0   R=160  G=0
                    B=B+1;
                    if(B>=160)RGB=2;
				}
				if(RGB==2 ){//B=160 R=160  G=0
					R=R-1;
                    if(R<=0)RGB=3;
				}
				if(RGB==3 ){//B=160 R=0    G=0
					G=G+1;
                    if(G>=160)RGB=4;
				}
                if(RGB==4 ){//B=160 R=0    G=160
					B=B-1;
                    if(B<=0)RGB=5;
				}
                if(RGB==5 ){//B=0   R=0    G=160
					G=G-1;
                    if(G<=0)RGB=6;
				}
                if(RGB==6 ){//B=0   R=0    G=0
					G=G+1;
                    R=R+1;
                    if(G>=160 && R>=160 )RGB=0;
				}
			}
		
		}
		
		
		if(mode==3){
			if((CountINT==50||CountINT==0)&&re==0)re=1,RGB++;
			
			if(RGB==0) R=160 , G=160, B=0 ;
			if(RGB==1) R=160 , G=0  , B=160 ;
			if(RGB==2) R=0   , G=160, B=160 ;
			if(RGB>=3) RGB=0;
		}
		
		if(mode==4&&Set==1){
        
			if(s%2==0&&re==0)re=1,RGB++;
			if(s%2==0){
				if(CountINT%10==0)LED_1=1,LED_2=1,LED_3=1;
                if(CountINT%10==5)R=160 , G=160 , B=160 ,LED_1=0,LED_2=0,LED_3=0;
            }else {
				if(RGB==1) R=160 , G=160, B=0 ;
				if(RGB==2) R=160 , G=0  , B=160 ;
				if(RGB==3) R=0   , G=160, B=160 ;
				if(RGB>=3) RGB=0;
            }
            
			
		}
		
		if(mode==5&&Set==1){
        
			if(s%2==0&&re==0)re=1;
			if(s%2==0){
				if(CountINT%10==0)LED_1=1,LED_2=1,LED_3=1;
                if(CountINT%10==5)R=160 , G=160 , B=160 ,LED_1=0,LED_2=0,LED_3=0;
            }else {
				R=0   , G=0, B=0;
            }
            
			
		}
		
		
        
		if(ReceiveFinish ||  repeat)
        {
        	ReceiveFinish = 0;
            
            
            rdata1 = 0xFF - IRDataTimer[0];
            rdata2 = 0xFF - IRDataTimer[2];
            if((rdata1 == IRDataTimer[1])&&(rdata2 == IRDataTimer[3]))
            {
            	//LED_1 = ~LED_1;
                
				if( rdata2==0xED && repeat==0)//power-off
                {
					Set++;
					if(Set==1)
					{
						//LED_1=1;
						//LED_2=0;
						//PAIE =1;
						//TRIAC= 1;
					}
					else
					{
						//LED_1=0;
						//LED_2=1;
						//PAIE =0;
						Set=0;
						//TRIAC= 0;
					}
                }
                
                
                
                
                if(rdata1==0x7F && rdata2==0xE1 )//power-on
                {
					mode=0;
                    if(one==0)one=1,RGB=0 , R=160 , G= 160 , B=0;
                    
					if(RGB==0 ){//B=0   R=160  G=160
						G=G-10;
						if(G<=0)RGB=1;
					}
					if(RGB==1 ){//B=0   R=160  G=0
						B=B+10;
						if(B>=160)RGB=2;
					}
					if(RGB==2 ){//B=160 R=160  G=0
						R=R-10;
						if(R<=0)RGB=3;
					}
					if(RGB==3 ){//B=160 R=0    G=0
						G=G+10;
						if(G>=160)RGB=4;
					}
					if(RGB==4 ){//B=160 R=0    G=160
						B=B-10;
						if(B<=0)RGB=5;
					}
					if(RGB==5 ){//B=0   R=0    G=160
						G=G-10;
						if(G<=0)RGB=6;
					}
					if(RGB==6 ){//B=0   R=0    G=0
						G=G+10;
						R=R+10;
						if(G>=160 && R>=160 )RGB=0;
					}
                }
                
                
                
                
                if( rdata2==0xF9 && Set==1 && repeat==0 )//up
                {
					if(Counter_On_set>40){
						Counter_On_set=Counter_On_set-15;
                        
                        if(Counter_On_set<=40  ){
							Counter_On_set=0;
							PAIE=0;
							TMR2IE=0;
							LED_1=0,LED_2=0,LED_3=0;
							DelayMs(100);
							PAIE=1;
							TMR2IE=1;
                        }
                    }
                }
                
                if( rdata2==0xFB && Set==1 && repeat==0 )//down
                {
					if(Counter_On_set<130){
                    
						Counter_On_set=Counter_On_set+15;
                        
                        if(Counter_On_set>=130  ){
							PAIE=0;
							TMR2IE=0;
							LED_1=1,LED_2=1,LED_3=1;
							DelayMs(100);
							PAIE=1;
							TMR2IE=1;
                        }
                    }
                }
                
                if(rdata1==0x7F && rdata2==0xF7 && repeat==0 && Set==1)//timer
                {
					PAIE=0;
                    TMR2IE=0;
                    
                    
					timer=timer+2;
                    m=0;
                    h=0;
                    if(timer>=8){
						timer=0;
						LED_1=1,LED_2=1,LED_3=1;
						DelayS(2);
						
                    }else{
						unsigned char a;
						for(a=0;a<(timer/2);a++)
						{
							PAIE=0;
							TMR2IE=0;
                            
							LED_1=1,LED_2=1,LED_3=1;
							DelayMs(200);
                            
                            PAIE=1;
							TMR2IE=1;
                            
							DelayMs(150);
						}
                    }
                    
                    
                    
					
                    
                    PAIE=1;
                    TMR2IE=1;
                }
                
                if(rdata1==0x7F && rdata2==0xFD && repeat==0 && Set==1)//RGB
                {
					R=160 , G=160, B=0;
                    
                    one=0;
                    
                    PAIE=0;
                    TMR2IE=0;
					LED_1=1,LED_2=1,LED_3=1;
					DelayMs(100);
					LED_1=0,LED_2=0,LED_3=0;
                    mode++;
                    if(mode>5)mode=1;
                    if(mode==1)modetime=10;
                    if(mode==2)modetime=140;
                    PAIE=1;
                    TMR2IE=1;
                }
                
                
            }
            
            rdata1=0;
            rdata2=0;
            repeat=0;
            
            
        }
    
        
        
	}
}
