//********************************************************* 
/*  文件名：main.c
*   IC:     FT62F13X  
*   时钟：  16M/4T                    
*/
//*********************************************************
#include "syscfg.h"
#include "Touch.h"
//**********************************************************
//***********************宏定义*****************************
#define  unchar   unsigned char 
#define  unint      unsigned int
#define  unlong   unsigned long


#define  DemoPortOut	RA4
volatile unsigned char SAFlag  @0xA0;
volatile unsigned char TestCount;
volatile unsigned char ReadCom;
volatile unsigned int ChargeCount;
volatile unsigned char TreCount;
volatile unsigned char TCount;


void uart_delay(void);
void uart_tx(unsigned char  data);

//**************中断处理**********************************
void interrupt ISR(void)//PIC_HI-TECH使用
{ 
    
	if(T0IE && T0IF)
    {
	    T0IF = 0;                         
     } 

  //定时器1的中断处理**********************
	if(TMR1IE && TMR1IF)			
	{
		TMR1IF = 0;

	} 	 
    
  //定时器2的中断处理**********************
	if(TMR2IE && TMR2IF)			//
	{      
		TMR2IF = 0;
		//408us
		TCount++;   
      
	} 
} 

/*----------------------------------------------------
 *	函数名称：TIMER0_INITIAL
 *	功能：初始化设置定时器
 *	相关寄存器?
 *	设置TMR0	                      
 ----------------------------------------------------*/
void TIMER0_INITIAL (void)  
{
	T0ON=0;
    OPTION = 0B00000000;  		//bit0-bit2  timer0 的分频比 000 1：2 
    PR0 = 1;   //7        				//当TKMODE=1，开启TOUCH硬件检测时，TIMER0用于产生TOUCH的PWM控制信号，T0DUTY是该PWM 的周期寄存器。  
    T0DUTY = 1;   //4   			  //当TKMODE= 1，开启TOUCH硬件检测时，TIMER0 用于产生TOUCH的PWM   
    TMR0= 0;
    T0IF = 0;							 //清空T0软件中断

  //  T0IE = 1;							//开定时器/计数器0中断
}
/*-------------------------------------------------
 * 函数名称：   TIMER1_INITIAL
 * 功能：      初始化设置定时器1   
 * 相关寄存器： 
 -------------------------------------------------*/
void TIMER1_INITIAL (void) 
{  
          
    T1CON0  = 0B00010001; 		//bit1:0-T1CKSRC[1:0]  T1时钟源选择 00=指令时钟 01=HIRC 10 =LP时钟 
													//bit2  T1ON  1:Timer1 打开  0 Timer1 关闭
                                                    //bit3 TICKRUN 1=T1CK睡眠时保持工作 0=T1CK睡眠时停止工作
                                                    //bit4 T1CKPSA 预分频器分配位 1=预分频器分配给Timer1 0=预分频器分配给Timer0
    						
    TMR1H  = 0;							  //定时器1计数寄存器
    TMR1L   = 0;
    
    
	PR1H    = 0XF; 						 //周期=（PR+1）*Tt2ck*TMR2预分频(蜂鸣器模式周期*2)
	PR1L    = 0xFF;	                //8M/(1+1)=4M
      
        	    				 			
	TMR1IF  = 0;						//清TMER1中断标志
    
//	T1ON  = 1;						//使能TMER1启动

	GIE     = 1;   				  		//使能全局中断
}

void TIMER2_INITIAL(void)
{
       T2CON0  = 0B01111000; 			//T2预分频1:1，后分频1：4
    //BIT7: 0：无意义； 1：把PR2/P1xDTy缓冲值分别更新到PR2寄存器和P1xDTy_ACT
    //BIT6~BIT3: 定时器2输出后分频比选择 0000:1:1;0001:1:2;……1:16
    //BIT2:0:关闭定时器2；1：打开定时器2
    //BIT1~0:定时器2预分频选择 00:1;01:4;1x:16
    
	T2CON1  = 0B00000000;		   //T2时钟来自系统时钟,PWM1连续模式
	//BIT4: PWM模式选择 0:连续模式；1：单脉冲模式
    //BIT3: 0:PWM模式；1：蜂鸣器模式	
    //Timer2时钟源选择：000：指令时钟；001：系统时钟；010：HIRC的2倍频；100：HIRC；101：LIRC
    						
    TMR2H  	= 1;					//定时器2计数寄存器  =1/16*16*4*500
    TMR2L  	= 0XF0;
    
    
	PR2H    = 1; 					//周期=（PR+1）*Tt2ck*TMR2预分频(蜂鸣器模式周期*2)
	PR2L    = 0XF0;	  
    
    P1ADTH	= 0;					//脉宽=P1xDT*Tt2ck*TMR2预分频(蜂鸣器模式没用到)
    P1ADTL	= 50;
    
    //P1OE 	= 0B00000000;			//充许P1A0输出PWM（配置成timer定时器时这位清零）
    //BIT7: 0:禁止P1C输出到管脚;1:充许P1C输出到管脚
    //BIT6: 0:禁止P1B输出到管脚;1:充许P1B输出到管脚
    //BIT5~BIT0: 0:禁止P1Ax输出到管脚;1:充许P1Ax输出到管脚
    
    //P1POL 	= 0B00000000;			//高电平有效
    //BIT7: 0:P1C高电平有效;1:P1C低电平有效
    //BIT6: 0:P1B高电平有效;1:P1B低电平有效
    //BIT5~BIT0: 0:P1Ax高电平有效;1:P1Ax低电平有效
    
    //P1CON	= 0B00000000;
    //BIT7:PWM1 重启使能位
	//1 = 故障刹车时，P1BEVT位在退出关闭事件时自动清零，PWM1自动重启
	//0 = 故障刹车时，必须用软件将P1BEVT清零以重启PWM1
    //BIT6~0:PWM1死区时间设置
	//P1DCn = 预定MPWM信号应转变为有效与PWM信号实际转为有效之间的T2CK周期数
        
    //MSCON0   = 0B00110000;		    //bit0: 0:T2睡眠时停止工作	
    //BIT5:PSRCAH4和PSRCA[4]共同决定源电流。00：4mA; 11: 33mA; 01、10:8mA
    //BIT4:PSRCAH3和PSRCA[3]共同决定源电流。00：4mA; 11: 33mA; 01、10:8mA
    //BIT3:UCFG1<1:0>为01时此位有意义。0：禁止LVR；1：打开LVR
    //BIT2:快时钟测量慢周期的平均模式。0：关闭平均模式；1：打开平均模式
    //BIT1:0：关闭快时钟测量慢周期；1：打开快时钟测量慢周期
    //BIT0:0：睡眠时停止工作：1： 睡眠时保持工作。当T2时钟不是选择指令时钟的时候
     
				 					//设置TMR2输出比较值定时15us=(1/4000000)*60(PR2)
	TMR2IF  = 0;					//清TMER2中断标志
	TMR2IE = 1;						//使能TMER2的中断（配置成timer定时器时不注释）
	TMR2ON  = 1;					//使能TMER2启动
	PEIE    = 1;    				//使能外设中断
	GIE     = 1;   					//使能全局中断
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
	OPTION = 0B00000000;	//Bit3 PSA   预分频器分配位 0= 预分频器分配给Timer0模块 1：分配给WDT 
										//Bit2：0：预分频比选择位 000: 1:2 
                                        
	INTCON = 0;  			 	//暂禁止所有中断
    
	PORTA = 0;
	PORTB = 0;
    
	TRISA = 0B11111111;	// 0-输出 1-输入  
	TRISB = 0B11111111;	// B2-B7  TK7-TK2
	TRISC = 0B11111111;	// B0-B1  TK1-TK0
    
	WPUA =  0B00000000;     //PA端口上拉控制 1-开上拉 0-关上拉
	WPUB =  0B00000000;
    
	ANSEL0 =0B00000100;      // TKCAP （A2）设为模拟输入脚		
      	
	TX_IO_ADDR &= ~TX_IO;	//测试数据传送脚 									   
}



void TOUCH_INITIAL(void)
{
    
	TKCON0 = 0;

	LVDCON = 0x17;   //bit2 0: 101/110/111: TOUCH  
							    //bit3 LVDDEB LVD 电平输出是否经过去抖电路 1：经过去抖 0：不经过去抖 
							    //bit 4 LVDP  1:表示VDD高于所设阀值,0：表示低于所设阀值  			
                                		
	PCON	 = 0x80;		//bit[7:4]=1xxx 1.2v   低电压选择位     

}



/*-------------------------------------------------
 * 函数名称：WDT_INITIAL
 * 功能：	   初始化设置看门狗64MS时间复位
 -------------------------------------------------*/
void WDT_INITIAL (void) 
{
  
	CLRWDT();  						//清看门狗
    
	PSA = 0;     						//时钟分频分给WDT
    
	WDTCON = 0B00001111;	//WDTPS=0110=1:1024,PS=000=1:1
											//定时时间=(2048*1)/32000=64ms
}	


void uart_delay(void)
{
   ///*     16M/2T  波特率 115200
    NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
    NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
    NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
    NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
    NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
    NOP();NOP();NOP();NOP();NOP();NOP();NOP();
}


void uart_tx(unsigned char  data)
{
	GIE  = 0; 
	TX =0; //start
	uart_delay();
	if(data & 0x01)  //1码  1
	{
		TX = 1;
		uart_delay(); 	 
	}
	else //0码
	{
		TX = 0;
        NOP();NOP();
		uart_delay();
	}
	if(data & 0x02)  //1码  1
	{
		TX = 1;
		uart_delay(); 	 
	}
	else //0码
	{
		TX = 0;
        NOP();NOP();
		uart_delay();
	}
	if(data & 0x04)  //1码  1
	{
		TX = 1;
		uart_delay(); 	 
	}
	else //0码
	{
		TX = 0;
        NOP();NOP();
		uart_delay();
	}
	if(data & 0x08)  //1码  1
	{
		TX = 1;
		uart_delay(); 	 
	}
	else //0码
	{
		TX = 0;
        NOP();NOP();
		uart_delay();
	}
	if(data & 0x10)  //1码  1
	{
		TX = 1;
		uart_delay(); 	 
	}
	else //0码
	{
		TX = 0;
        NOP();NOP();
		uart_delay();
	}
	if(data & 0x20)  //1码  1
	{
		TX = 1;
		uart_delay(); 	 
	}
	else //0码
	{
		TX = 0;
        NOP();NOP();
		uart_delay();
	}
	if(data & 0x40)  //1码  1
	{
		TX = 1;
		uart_delay(); 	 
	}
	else //0码
	{
		TX = 0;
        NOP();NOP();
		uart_delay();
	}
	if(data & 0x80)  //1码  1
	{
		TX = 1;
		uart_delay(); 	 
	}
	else //0码
	{
		TX = 0;
        NOP();NOP();
		uart_delay();
	}
	TX = 1; //stop
	uart_delay ();
	GIE  =1; 
}

/*-------------------------------------------------
 *  函数名:  main 
 *	功能：  主函数
 *  输入：  无
 *  输出：  无
 --------------------------------------------------*/
void main()
{
	SYS_INITIAL();				//系统初始化
    TIMER0_INITIAL();  		//初始化TIM0 & PWM  
	TIMER1_INITIAL();  	   //初始化TIM1   
    TOUCH_INITIAL();
    TIMER2_INITIAL();
   
    TCount   =  0;
	while(1)
	{
        
             SendDataToPC();    //8us*(255-120)=1MS  
     }
                    
}



