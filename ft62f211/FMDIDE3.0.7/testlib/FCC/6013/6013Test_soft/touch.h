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
  * 1.Device: FT62F13X
  * 2.Memory: Flash 3KX14b, SRAM:256X8b EEPROM 128X8b 
  * @触摸按键库使用资源说明:
  * 1.TIMER0、TIMER1
  * 2.LVD中断
  * 3.ROM & SARM (key = 1,不包含led.c)  
  *     库类型            ROM *14b       SRAM*8b
  *     touch.lpp          1285 		   77
  *     touch_cs.lpp       1285			   77
  *
  * 4.SRAM指定地址:
  * 	指定地址 特殊变量应用定义：10BYTE (0x70 ~ 0x79)
  * 	指定地址 按键数据保存区：10BYTE/键 (0x120 ~ 0x120 + Key*10)
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

#define   KEY_NUMBER   		   8  //目前最大8条
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

//////////采集数据处理相关定义///////////////////////////////////////////
#define MULTIPLE_1   					80    	//放大倍数
const unsigned char ucMultiple = MULTIPLE_1;

///////////功能函数定义/////////////////////////////////////
void TOUCH_INITIAL(void);  //触摸按键配置初始化          
void TSC_Start(void); //按键扫描结果处理，每次只做一个按键的一次扫描处理
unsigned int Read_SpecialRam(unsigned char KeyIdx);//返回按键采样数据
    
#endif
