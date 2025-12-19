//********************************************************* 
/* 文件名：TEST_FT62F21x_SPI.c
* 功能：   FT62F21x-SPI功能演示
* IC:	   FT62F211 SOP8
* 晶振：   16M/4T                    
* 说明：   该程序读取(25C64)0x12地址的值,取反后存入0x13地址
*
*                  FT62F211 SOP8 
*                ----------------
*  MISO---------|1(PA4)    (PA3)8|----------MOSI  
*  NC-----------|2(TKCAP)  (PA0)7|------------NC
*  VDD----------|3(VDD)    (PA1)6|------------CS
*  GND----------|4(VSS)    (PA2)5|-----------SCK
*			     ----------------
*/
//*********************************************************
#include	"SYSCFG.h";
#include	"FT62F21X.h";
//***********************宏定义****************************
#define	 uchar	unsigned char 
#define	 uint	unsigned int
 
#define	 MISO	PA4   
#define	 MOSI	PA3
#define	 SCK	PA2   
#define	 CS		PA1

uchar	 SPIReadData;
 /*-------------------------------------------------
 * 函数名：POWER_INITIAL
 * 功能：  上电系统初始化
 * 输入：  无
 * 输出：  无
 --------------------------------------------------*/	
void POWER_INITIAL (void) 
{
	OSCCON = 0B01110000;				//IRCF=111=16MHz/4=4MHz,0.25us
	INTCON = 0;  						//暂禁止所有中断

	PORTA = 0B00000000;				
	TRISA = 0B00010000;					//PA输入输出 0-输出 1-输入  
	WPUA = 0B00010000;     				//PA端口上拉控制 1-开上拉 0-关上拉

	OPTION = 0B00001000;				//Bit3=1 WDT MODE,PS=000=1:1 WDT RATE
	MSCON = 0B00000000;		                             
}
 /*-------------------------------------------------
 * 函数名：init_25c64_io
 * 功能：  25c64初始化
 * 输入：  无
 * 输出：  无
 --------------------------------------------------*/	
void init_25c64_io (void) 
{
	CS=1;
    SCK=0;
    MOSI=0;			                             
}
 /*-------------------------------------------------
 * 函数名：SPI_RW
 * 功能：  主机输出以及输入一个字节
 * 输入：  data
 * 输出：  根据接收的data输出给从机一个字节
 --------------------------------------------------*/
 uchar SPI_RW(uchar data)
 {
    uchar i;
    for(i=0;i<8;i++)
    {
        if(data&0x80)
			MOSI=1;
        else
			MOSI=0;
        NOP();
        data<<=1;
        SCK=1;
        NOP();
        if(MISO)
			data|=0x01;
        else
			data&=0xFE;
        NOP();
        SCK=0;
    }
    return data;
 }
/*-------------------------------------------------
 * 函数名：WriteEnable
 * 功能：  写允许（将WEN置位）
 --------------------------------------------------*/
 void WriteEnable(void)
 {
     CS=0;
     SPI_RW(0X06);
     CS=1;
}
/*-------------------------------------------------
 * 函数名：WriteDisable
 * 功能：  写禁止（将WEN复位）
 --------------------------------------------------*/
 void WriteDisable(void)
 {
     CS=0;
     SPI_RW(0X04);
     CS=1;
 }
/*-------------------------------------------------
 * 函数名：SPI_ReadStatus
 * 功能：  读取25C64芯片的状态 
 * 返回值：状态寄存器数据字节
 * 注：    25C64内部状态寄存器第0位=0表示空闲，0位=1表示忙。
 --------------------------------------------------*/
 uchar SPI_ReadStatus(void)
 {
     uchar status=0;
     CS=0;
     SPI_RW(0X05);						//0x05读取状态的命令字
     status=SPI_RW(0X00);
     CS=1;								//关闭片选
     return status;
 }/*-------------------------------------------------
 * 函数名：SPI_WriteStatus
 * 功能：  写25C64芯片的状态寄存器 
 * 注：    只有BP1、BP0(bit7、3、2)可以写
		   25C64内部状态寄存器第0位=0表示空闲，0位=1表示忙。
 --------------------------------------------------*/
 void SPI_WriteStatus(uchar Status)
 {
     CS=0;
     SPI_RW(0X01);						//0X01写入状态的命令字
     SPI_RW(Status);					//写入一个字节
     CS=1;								//关闭片选
 }
/*-------------------------------------------------
 * 函数名：SPI_Read
 * 输入：  16位的地址
 * 返回：  读取的数据
 * 说明：  从25C64指定的地址读取一个字节
 --------------------------------------------------*/
 uchar SPI_Read(uint addr)
 {
     uchar spidata;
     while(SPI_ReadStatus()&0x01);		//判断是否忙
     CS=0;								//使能器件
     SPI_RW(0X03);						//发送读取命令
     SPI_RW((uchar)((addr)>>8));
     SPI_RW((uchar)addr);
     spidata=SPI_RW(0X00);				//读出数据
     CS=1;
     return spidata;
 }
/*-------------------------------------------------
 * 函数名：SPI_Write
 * 输入：  地址，字节数据
 * 说明：  将一个字节写入指定的地址
 --------------------------------------------------*/
void SPI_Write(uint addr , uchar dat)
 {
     while(SPI_ReadStatus()&0x01);		//判断是否忙
     WriteEnable();						//置位 WEN
     CS=0;								//使能器件
     SPI_RW(0X02);						//发送写命令
     SPI_RW((uchar)((addr)>>8));			
     SPI_RW((uchar)addr);
     
     SPI_RW(dat);     CS=1;								//关闭片选
     WriteDisable();
     while(SPI_ReadStatus()&0x01);
 }
/*-------------------------------------------------
 * 函数名：main
 * 功能：  主函数 
 * 输入：  无
 * 输出：  无
 --------------------------------------------------*/
void main(void)
{
    POWER_INITIAL();					//系统初始化
    init_25c64_io();
	SPIReadData=SPI_Read(0x0012);		//读取0x12地址EEPROM值
    SPI_Write(0x0013,~SPIReadData);		//取反写入地址0x13
    
    while(1)
    {
        NOP();
    }
}
