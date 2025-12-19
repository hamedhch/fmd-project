//*****************************************************
/* 文件名：Test_62F21X_io.c
* 功能：   FT62F21X-IO功能演示
* IC:      FT62F21X SOP8
* 晶振：   16M/4T                    
* 说明：   当DemoPortIn悬空或者高电平时,
*		   DemoPortOut输出50Hz占空比50%的波形
*		   当DemoPortIn接地时,DemoPortOut输出高电平
*
*                  FT62F21X SOP8 
*                 ----------------
*  DemoPortOut --|1(PA4)    (PA3)8 |-------------NC 
*  NC------------|2(TKCAP)  (PA0)7 |-------------NC
*  NC------------|3(VDD)	(PA1)6 |-------------NC 
*  NC------------|4(VSS)   	(PA2)5 |-----DemoPortIn
*			      ----------------
*/
//*****************************************************
#include	"SYSCFG.h";
#include 	"FT62F21X.h";

#define	DemoPortOut	PA4   
#define	DemoPortIn	PA2
/*-------------------------------------------------
 * 函数名：DelayUs
 * 功能：  短延时函数 --16M-4T--大概快1%左右.
 * 输入：  Time延时时间长度 延时时长Time*2Us
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
 * 输入： Time延时时间长度 延时时长Time ms
 * 输出： 无 
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
 * 功能： 上电系统初始化
 * 输入：  无
 * 输出：  无
 --------------------------------------------------*/	
void POWER_INITIAL (void) 
{ 
	OSCCON = 0B01110001;	//16MHz 1:1
	INTCON = 0;  			//暂禁止所有中断
    
	OPTION = 0;
    TRISA = 1<<2;			//1:输入 0:输出 PA2为输入模式 PA4输出模式
    PSRCA = 0;				//00:4mA	01/10:8mA	11:28mA	bit[3:2]控制PA5源电流	bit[1:0]控制PA4源电流
    PSINKA = 0;				//bit[1:0]	控制PA5和PA4 0:灌电流最小 1:灌电流最大
    PORTA = 0;				//1:PAx输出高电平	0:PAx输出低电平	PA4输出低电平
 	WPUA = 1<<2;			//1:使能PA2口上拉	0:关闭PA口上拉  PA2 上拉
}
/*-------------------------------------------------
 * 函数名：main 
 * 功能：  主函数
 * 输入：  无
 * 输出：  无
 --------------------------------------------------*/
void main()
{
 	POWER_INITIAL();		//系统初始化
    
	while(1)
	{
		DemoPortOut = 1; 			
		DelayMs(10);     	//10ms
		if(DemoPortIn == 1) //判断输入是否为高电平 
		{
			DemoPortOut = 0;
		}
		DelayMs(10); 
	}   
}
