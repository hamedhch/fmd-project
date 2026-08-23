/**
  *********************************************************************************
  * @file    	    touch.h
  * @author  	    FMD AE
  * @brief   	    库头文件
  * @version 	    V2.0.1          
  * @data		    2022-03-25
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
  * 1. Device: FT62F28X
  * 2. Memory: Flash 8KX14b, EEPROM 128X8b, SRAM 616X8b
  *
  * @库使用资源说明:
  * 1 .TIMER0、TIMER1
  * 2. LVD中断
  * 3. ROM & SARM (key = 1,不包含led.c)  
  *     库类型               ROM *14b       	SRAM*8b
  *     touch.lpp          603+3*key              18+2*key
  *
  * 4. SRAM指定地址: 无
  **********************************************************************************
  */  
  
#ifndef _TOUCH_H
#define _TOUCH_H

///////////头文件/////////////////////////////////////
#include <string.h>
#include "SYSCFG.h"


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
unsigned int uiTkData[KEY_NUMBER]; 

const unsigned char ucKeyIndexMapArray[KEY_NUMBER]=
{
 KEY0_INDEX_MAP,
 KEY1_INDEX_MAP,
 KEY2_INDEX_MAP,
 KEY3_INDEX_MAP,
 KEY4_INDEX_MAP,
 KEY5_INDEX_MAP,
 KEY6_INDEX_MAP,
 KEY7_INDEX_MAP,   
};
/////////BANK 切换定义////////////////////////////////////////
#define 	BANKSEL4_7		MSCON1 |= 0X02;   //间接地址为 0x200~0x3FF
#define 	BANKSEL0_3		MSCON1 &= ~0X02; //间接地址为 0x000~0x1FF
///////////功能函数定义/////////////////////////////////////
void TOUCH_INITIAL(void);  //触摸按键配置初始化          
void TSC_Start(void); //按键扫描结果处理，每次只做一个按键的一次扫描处理
unsigned char TSC_Sampling(void);//所有按键采样状态: 1表示所有按键采样完成，0表示未来采样完成    
unsigned int TSC_GetSmpleData(unsigned char keyNum);//可以取出对应的按键数据，采样完成后才可使用

#endif
