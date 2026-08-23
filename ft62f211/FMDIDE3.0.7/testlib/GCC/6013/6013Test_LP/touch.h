/**
  *********************************************************************************
  * @file    	    touch.h
  * @author  	    FMD AE
  * @brief   	    库头文件
  * @version 	    V2.0.0           
  * @data		    2022-01-20
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

  /**********************************************************************************
  * @芯片资源
  **********************************************************************************
  */
 
#ifndef _TOUCH_H
#define _TOUCH_H

///////////头文件/////////////////////////////////////
#include <string.h>
#include "SYSCFG.h"

//如果通讯要换成其它IO口，注意POWER_INITIAL函数里面对应的通讯IO要设成输出
#define  TX  			RA7     
#define  TX_IO    		0x80
#define  TX_IO_ADDR   	TRISA   

/////////////定义系统时钟///////////////////////////////////////////
#define SYS_OSCCON   0B01110001

/////////按键对应芯片KEYIO映射定义//////////////////////////
#define   KEY0_INDEX_MAP       7
#define   KEY1_INDEX_MAP       6
#define   KEY2_INDEX_MAP       5
#define   KEY3_INDEX_MAP       4
#define   KEY4_INDEX_MAP       2
#define   KEY5_INDEX_MAP       3
#define   KEY6_INDEX_MAP       0
#define   KEY7_INDEX_MAP       1
#define   KEY_NUMBER   8  //目前最大8条
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

//////////////io setting,此处请勿修改////////////////////////////////
#define SLEEP_SCAN_KEY_GROUP       4  	// 取值范围 1~4
const unsigned char ucSleepGroupMax = SLEEP_SCAN_KEY_GROUP;
unsigned int uiSleepGroupBuffer[SLEEP_SCAN_KEY_GROUP];

#define 	TouchIoMaskB 	 0x03
#define 	TouchIoMaskC 	 0xFC
const unsigned char ucTouchIoMaskB = TouchIoMaskB;	
const unsigned char ucTouchIoMaskC = TouchIoMaskC;

#define   	SleepTrisB_0	 0x00
#define   	SleepTrisC_0     0x03
#define   	SleepTK_0        0x03
#define   	SleepTrisB_1	 0xC0
#define   	SleepTrisC_1     0x00
#define   	SleepTK_1        0x0C
#define   	SleepTrisB_2	 0x30
#define   	SleepTrisC_2     0x00
#define  	SleepTK_2        0x30
#define   	SleepTrisB_3	 0x0C
#define   	SleepTrisC_3     0x00
#define   	SleepTK_3        0xC0
const unsigned char ucSleepTrisB_0 = SleepTrisB_0;	
const unsigned char ucSleepTrisC_0 = SleepTrisC_0;
const unsigned char ucSleepTK_0 = SleepTK_0;
const unsigned char ucSleepTrisB_1 = SleepTrisB_1;	
const unsigned char ucSleepTrisC_1 = SleepTrisC_1;
const unsigned char ucSleepTK_1 = SleepTK_1;
const unsigned char ucSleepTrisB_2 = SleepTrisB_2;	
const unsigned char ucSleepTrisC_2 = SleepTrisC_2;
const unsigned char ucSleepTK_2 = SleepTK_2;
const unsigned char ucSleepTrisB_3 = SleepTrisB_3;	
const unsigned char ucSleepTrisC_3 = SleepTrisC_3;
const unsigned char ucSleepTK_3 = SleepTK_3;

///////////功能函数定义/////////////////////////////////////

void TOUCH_INITIAL(void);  //触摸按键配置初始化          
unsigned char TSC_SleepPrcoessing(void);//低功耗下的唤醒处理
unsigned int Read_SpecialRam(unsigned char KeyIdx);//获取相对应按键的数据    

#endif
