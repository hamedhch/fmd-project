//Project: qaz.prj
// Device: FT62F28X
// Memory: Flash 8KX14b, EEPROM 128X8b, SRAM 616X8b
// Author: 
//Company: 
//Version:
//   Date: 
//===========================================================
//===========================================================
#include	"SYSCFG.h";
#include	"touch.h";
#include	"Dis.h";
//===========================================================
//Variable definition
//===========================================================
 void Delay2Us(unsigned int Time)
{    
   while(Time>0)
   { 
      _nop(); 
      CLRWDT();
      Time--;
   }
}

/*-------------------------------------------------
 *  函数名：POWER_INITIAL
 *	功能：  上电系统初始化
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/	
void SYS_INITIAL (void) 
{
	 
	OSCCON = 0B01110000;//WDT 32KHZ IRCF=110=16MHZ/4=4MHZ,0.25US/T
											//Bit0=1,系统时钟为内部振荡器
											//Bit0=0,时钟源由FOSC<2：0>决定即编译选项时选择
	OPTION = 0B00001000;	//Bit3 PSA   预分频器分配位 0= 预分频器分配给Timer0模块 1：分配给WDT 
											//Bit2：0：预分频比选择位 000: 1:2 
		                           

	INTCON = 0;  					//暂禁止所有中断
    
	 PORTA =0;
	 PORTB = 0;
     PORTD=0;
     PORTC = 0;
    
	TRISA =  0B11111111;		// 0-输出 1-输入        RA4 -
    TRISB =  0B11111111;		// B4-B7  TK5-TK2    PB7--touch
    TRISC =  0B11111111;
    TRISD =  0B11111111;	// TKCAP PD5
	 MSCON1|=0X02;
	WPUA =  0B00000000;     	//PA端口上拉控制 1-开上拉 0-关上拉
    WPUB =  0B00000000;
    WPUC =  0B00000000;
    WPUD =  0B00000000;
	WPDA =  0B00000000;     	//PA端口上拉控制 1-开上拉 0-关上拉
    WPDB =  0B00000000;
    WPDC =  0B00000000;
    WPDD =  0B00000000;   
    MSCON1&=~0X02;
    
    ANSEL1 =0B10000000;     // TKCAP （D2）设为模拟输入脚		  	
   
   TX_IO_ADDR  &= ~TX_IO;		 	   
}

//===========================================================
//Funtion name：interrupt ISR
//parameters：无
//returned value：无
//===========================================================
 
unsigned char temp=0;
void interrupt ISR(void)//PIC_HI-TECH使用
{ 
		if(AUXPGE==0) //BANK0-3
		{
			temp = 0;
		}
		else
		{
			AUXPGE = 0;
			temp = 1;
		}

    
		if(AUXPGE==0)//BANK0-3
		{
			AUXPGE = temp ;
		}
		else
		{
			AUXPGE = 0;
			AUXPGE = temp ;
		}
} 
//====================
 
//===========================================================
//Funtion name：main
//parameters：无
//returned value：无
//===========================================================
 
void main(void )
{
 
   unsigned long x;
    SYS_INITIAL ();
    Touch_init();

    x=5;
    while (1)
    {
	 
	    TSC_Start();
        if (TSC_DataProcessing()==1)
        {
		   if (x==0)
           {
              SendDataToPC();
              Delay2Us(2500);
              Delay2Us(2500); //20220401 延时加长上传给上位机
              Delay2Us(2500); //20220401 延时加长上传给上位机
           }
           else x--;
        }
	}  
    
}
//===========================================================
