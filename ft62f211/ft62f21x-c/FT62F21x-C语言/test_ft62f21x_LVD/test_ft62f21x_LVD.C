//********************************************************* 
/* 文件名：Test_62F21X_LVD.c
* 功能：   FT62F21X_LVD功能演示
* IC:      FT62F211 SOP8
* 晶振：   16M/4T                    
* 说明：   设置LVD低电压1.8V，当检测到电压低于1.8V时,DemoPortOut持续输出 频率为166.7Hz的方波
*		   高于1.8V时,DemoPortOut持续输出 频率为500Hz的方波
*
*                  	 FT62F211 SOP8 
*                  ----------------
*  DemoPortOut --|1(PA4)     (PA3)8|-------------NC 
*  NC------------|2(TKCAP)   (PA0)7|-------------NC
*  NC------------|3(VDD)	 (PA1)6|-------------NC 
*  NC------------|4(VSS) 	 (PA2)5|-------------NC
*			       ----------------
*/
//********************************************************* 
#include	"SYSCFG.h";
#include 	"FT62F21X.h";
#define  	DemoPortOut		PA4
/*-------------------------------------------------
 * 函数名：DelayUs
 * 功能：  短延时函数 --16M-4T--大概快1%左右.
 * 输入：  Time 延时时间长度 延时时长Time*2Us
 * 输出：  无 
 -------------------------------------------------*/
void DelayUs(unsigned char Time)
{
	unsigned char a;
	for(a=0;a<Time;a++)
	{
		NOP();
	}
}                  
/*------------------------------------------------- 
 * 函数名：DelayMs
 * 功能：  短延时函数 快1%
 * 输入：  Time 延时时间长度 延时时长Time ms
 * 输出：  无 
 -------------------------------------------------*/
void DelayMs(unsigned char Time)
{
	unsigned char a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<5;b++)
		{
		 	DelayUs(98); 
		}
	}
}
/*-------------------------------------------------
 * 函数名：POWER_INITIAL
 * 功能：  上电系统初始化
 * 输入：  无
 * 输出：  无
 --------------------------------------------------*/	
void POWER_INITIAL (void) 
{ 
	OSCCON = 0B01110000;	//16MHz 1:1
	INTCON = 0;  	    	//暂禁止所有中断
	OPTION = 0;
    TRISA = 0;				//1:输入 0:输出	PA4输出 PA2-IN
    PSRCA = 0;			
    //00:	4mA
    //01/10:8mA
    //11:	28mA
    //bit[3:2]控制PA5源电流
    //bit[1:0]控制PA4源电流
    
    PSINKA = 0;			//bit[1:0]:控制PA5和PA4 0:灌电流最小 1:灌电流最大
    PORTA = 0;			//1:PAx输出高电平	0:PAx输出低电平
 	WPUA = 0;			//1:使能PA口上拉	0:关闭PA口上拉   
    
	PCON = (0<<4) | (1<<3); 
    //Bit[7:4]:低电压侦测位	0:1.8V	
    //Bit[3] LVD使能位 0:关闭
}
/*-------------------------------------------------
 * 函数名: main 
 * 功能：  主函数
 * 输入：  无
 * 输出：  无
 --------------------------------------------------*/
void main()
{
    POWER_INITIAL();
    
	while(1)
    {
        if(PCON & 0X04)				//低电压标志 LVDW
        {
			DemoPortOut = 1; 		
			DelayMs(3);     		//3ms
			DemoPortOut = 0;
			DelayMs(3); 			//3ms            
		}
        else
        {
			DemoPortOut = 1; 	
			DelayMs(1);     		//1ms
			DemoPortOut = 0; 
			DelayMs(1); 			//1ms           
		}
		NOP();
	}
}
