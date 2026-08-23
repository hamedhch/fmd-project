/**
  *********************************************************************************
  * @file    	    touch.h
  * @author  	    FMD AE
  * @brief   	    库头文件
  * @version 	    V2.0.0           
  * @data		    2021-12-29
  *********************************************************************************
  * @attention
  * COPYRIGHT (C) 2021 Fremont Micro Devices Corporation All rights reserved.
  *    This software is provided by the copyright holders and contributors,and the
  *software is believed to be accurate and reliable. However, Fremont Micro Devices
  *Corporation assumes no responsibility for the consequences of use of such
  *software or for any infringement of patents of other rights of third parties,
  *which may result from its use. No license is granted by implication or otherwise
  *under any patent rights of Fremont Micro Devices Corporation.
  **********************************************************************************
  */  
  
/***********************************************************************************
  * @芯片资源
  **********************************************************************************
  */  
  
#ifndef _TOUCH_H
#define _TOUCH_H

///////////头文件/////////////////////////////////////
#include <string.h>
#include "SYSCFG.h"

//如果通讯要换成其他IO口修改此处， 注意main.c文件内SysInit函数里对应的通讯IO口要设成输出
#define  TX      PC5
#define  TX_IO      	0x20
#define  TX_IO_ADDR  TRISC   

/////////系统时钟定义//////////////////////////////////////
#define SYS_OSCCON   0B01110001 //16M

/////////按键对应芯片KEYIO映射定义//////////////////////////
#define   KEY0_INDEX_MAP       	3
#define   KEY1_INDEX_MAP       	4
#define   KEY2_INDEX_MAP       	5
#define   KEY3_INDEX_MAP       	6
#define   KEY4_INDEX_MAP       	7
#define   KEY5_INDEX_MAP       	8
#define   KEY6_INDEX_MAP      	9
#define   KEY7_INDEX_MAP       	10
#define   KEY_NUMBER             8  //按键数
const unsigned char ucKeyNumberMax = KEY_NUMBER;
const unsigned char ucKeyIndexMapArray[KEY_NUMBER]=
{
    KEY0_INDEX_MAP,
    KEY1_INDEX_MAP,
    KEY2_INDEX_MAP,
    KEY3_INDEX_MAP,
    KEY4_INDEX_MAP,
    KEY5_INDEX_MAP,
    KEY6_INDEX_MAP,
	KEY7_INDEX_MAP
};


/////////BANK 切换定义////////////////////////////////////////
#define 	BANKSEL4_7		MSCON1 |= 0X02;   //间接地址为 0x200~0x3FF
#define 	BANKSEL0_3		MSCON1 &= ~0X02; //间接地址为 0x000~0x1FF


////////低功耗定义///////////////////////////////////////////////////
#define SLEEP_SCAN_KEY_GROUP     4  	 
const unsigned char ucSleepGroupMax = SLEEP_SCAN_KEY_GROUP;
#define TouchIoMaskA 0X07
#define TouchIoMaskB 0XFE
#define TouchIoMaskC 0XFF
#define TouchIoMaskD 0XFC
const unsigned char ucTouchIoMaskA = TouchIoMaskA;
const unsigned char ucTouchIoMaskB = TouchIoMaskB;
const unsigned char ucTouchIoMaskC = TouchIoMaskC;
const unsigned char ucTouchIoMaskD = TouchIoMaskD;
#define   SleepTrisAB_0	 	0x1800
#define   SleepTrisCD_0    	0x0000
#define   SleepTK01_0      	0x1800
#define   SleepTK23_0     	0x00C0
#define   SleepTrisAB_1	   	0x6000
#define   SleepTrisCD_1    	0x0000
#define   SleepTK01_1      	0x6000
#define   SleepTK23_1      	0x00C0
#define   SleepTrisAB_2	   	0x8000
#define   SleepTrisCD_2    	0x0001
#define   SleepTK01_2      	0x8001
#define   SleepTK23_2      	0x00C0
#define   SleepTrisAB_3	   	0x0001
#define   SleepTrisCD_3    	0x0002
#define   SleepTK01_3     	0x0006
#define   SleepTK23_3      	0x00C0
#define   SleepTrisAB_4	   	0x0000
#define   SleepTrisCD_4    	0x0000
#define   SleepTK01_4      	0x0000
#define   SleepTK23_4      	0x0000
#define   SleepTrisAB_5	   	0x0000
#define   SleepTrisCD_5    	0x0000
#define   SleepTK01_5      	0x0000
#define   SleepTK23_5      	0x0000
#define   SleepTrisAB_6	   	0x0000
#define   SleepTrisCD_6    	0x0000
#define   SleepTK01_6      	0x0000
#define   SleepTK23_6     	0x0000
#define   SleepTrisAB_7	   	0x0000
#define   SleepTrisCD_7    	0x0000
#define   SleepTK01_7      	0x0000
#define   SleepTK23_7      	0x0000
#define   SleepTrisAB_8	   	0x0000
#define   SleepTrisCD_8    	0x0000
#define   SleepTK01_8      	0x0000
#define   SleepTK23_8      	0x0000
#define   SleepTrisAB_9	   	0x0000
#define   SleepTrisCD_9    	0x0000
#define   SleepTK01_9      	0x0000
#define   SleepTK23_9      	0x0000

const unsigned int uiSleepTrisAB_0 	= SleepTrisAB_0;
const unsigned int uiSleepTrisCD_0 	= SleepTrisCD_0;
const unsigned int uiSleepTK01_0 	= SleepTK01_0;
const unsigned int uiSleepTK23_0 	= SleepTK23_0;
const unsigned int uiSleepTrisAB_1 	= SleepTrisAB_1;
const unsigned int uiSleepTrisCD_1 	= SleepTrisCD_1;
const unsigned int uiSleepTK01_1 	= SleepTK01_1;
const unsigned int uiSleepTK23_1 	= SleepTK23_1;
const unsigned int uiSleepTrisAB_2 	= SleepTrisAB_2;
const unsigned int uiSleepTrisCD_2 	= SleepTrisCD_2;
const unsigned int uiSleepTK01_2 	= SleepTK01_2;
const unsigned int uiSleepTK23_2 	= SleepTK23_2;
const unsigned int uiSleepTrisAB_3 	= SleepTrisAB_3;
const unsigned int uiSleepTrisCD_3 	= SleepTrisCD_3;
const unsigned int uiSleepTK01_3 	= SleepTK01_3;
const unsigned int uiSleepTK23_3 	= SleepTK23_3;  
const unsigned int uiSleepTrisAB_4 	= SleepTrisAB_4;
const unsigned int uiSleepTrisCD_4 	= SleepTrisCD_4;
const unsigned int uiSleepTK01_4 	= SleepTK01_4;
const unsigned int uiSleepTK23_4 	= SleepTK23_4;
const unsigned int uiSleepTrisAB_5 	= SleepTrisAB_5;
const unsigned int uiSleepTrisCD_5 	= SleepTrisCD_5;
const unsigned int uiSleepTK01_5  	= SleepTK01_5;
const unsigned int uiSleepTK23_5  	= SleepTK23_5;
const unsigned int uiSleepTrisAB_6 	= SleepTrisAB_6;
const unsigned int uiSleepTrisCD_6  = SleepTrisCD_6;
const unsigned int uiSleepTK01_6  	= SleepTK01_6;
const unsigned int uiSleepTK23_6  	= SleepTK23_6;
const unsigned int uiSleepTrisAB_7 	= SleepTrisAB_7;
const unsigned int uiSleepTrisCD_7 	= SleepTrisCD_7;
const unsigned int uiSleepTK01_7  	= SleepTK01_7;
const unsigned int uiSleepTK23_7 	= SleepTK23_7;
const unsigned int uiSleepTrisAB_8 	= SleepTrisAB_8;
const unsigned int uiSleepTrisCD_8 	= SleepTrisCD_8;
const unsigned int uiSleepTK01_8  	= SleepTK01_8;
const unsigned int uiSleepTK23_8 	= SleepTK23_8;
const unsigned int uiSleepTrisAB_9 	= SleepTrisAB_9;
const unsigned int uiSleepTrisCD_9 	= SleepTrisCD_9;
const unsigned int uiSleepTK01_9  	= SleepTK01_9;
const unsigned int uiSleepTK23_9 	= SleepTK23_9;

///////////功能函数定义/////////////////////////////////////
void TOUCH_INITIAL(void);  //触摸按键配置初始化          
unsigned char TSC_SleepPrcoessing(void);//低功耗下的唤醒处理
unsigned int Read_SpecialRam(unsigned char KeyIdx);//返回按键采样数据
#endif
