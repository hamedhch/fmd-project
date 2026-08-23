/**
  *********************************************************************************
  * @file    	    touch.h
  * @author  	    FMD AE
  * @brief   	    库头文件
  * @version 	    V2.0.1           
  * @data		    2022-04-08
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
  * 1. Device: FT62F13X
  * 2. Memory: Flash 3KX14b, SRAM:256X8b EEPROM 128X8b 
  *
  * @触摸按键库使用资源说明:
  * 1. TIMER0、TIMER1
  * 2. LVD中断
  * 3. ROM & SARM (Key= 1,Ks=1不包含led.c)  
  *     库类型            		  ROM *14b       	SRAM*8b			
  * touch_soft.lpp		1,151+3*Key	52+8*Key
  * touch.lpp		1,262+3*Key	55+8*Key
  * touch_cs_ac.lpp		1,400+4*Key	62+8*Key
  * touch_cs_uac.lpp		1,473+4*Key	65+8*Key
  * touch_lp.lpp		1,650+3*Key	59+8*Key+2*Ks
  * touch_cs_lp_ac.lpp	1,790+4*Key	64+8*Key+2*Ks
  * touch_cs_lp_uac.lpp	1,844+4*Key	67+8*Key+2*Ks
  *
  * 4.SRAM指定地址:
  * 	指定地址 特殊变量应用定义：0x20 、0x21、 0x72~ 0x79
  * 	指定地址 按键数据保存区：8BYTE/键 (0x120 ~ 0x120 + 8*Key)
  **********************************************************************************
  */
 
#ifndef _TOUCH_H
#define _TOUCH_H

///////////头文件/////////////////////////////////////
#include <string.h>
#include "SYSCFG.h"

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
unsigned int stTkData[KEY_NUMBER][4] @ 0x120;
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
/////////////按键有效阀值////////////////////////////////////
#define   KEY0_ON					35 
#define   KEY1_ON					35 
#define   KEY2_ON					35 
#define   KEY3_ON					35 
#define   KEY4_ON					35 
#define   KEY5_ON					35 
#define   KEY6_ON					35 
#define   KEY7_ON					35 
const unsigned char ucActiveSensorDeltaArray[KEY_NUMBER]=
{
 KEY0_ON,  KEY1_ON,  KEY2_ON,  KEY3_ON,  KEY4_ON,  KEY5_ON,  KEY6_ON,  KEY7_ON  
};
///////////按键无效阀值//////////////////////////////////////
#define   KEY0_OFF					24
#define   KEY1_OFF					24
#define   KEY2_OFF					24
#define   KEY3_OFF					24
#define   KEY4_OFF					24
#define   KEY5_OFF					24
#define   KEY6_OFF					24
#define   KEY7_OFF					24
const unsigned char ucInActiveSensorDeltaArray[KEY_NUMBER]=
{
 KEY0_OFF,  KEY1_OFF,  KEY2_OFF,  KEY3_OFF,  KEY4_OFF,  KEY5_OFF,  KEY6_OFF,  KEY7_OFF 
};

////////正常状态或CS模式下的条件判定///////////////////////////////////////////
#define RESONANCE_CHANGER_FREQ_COUNT_FILTER            1000 	// 共振处理时长
const unsigned int uiResonanceChangerFreqCountFilter = RESONANCE_CHANGER_FREQ_COUNT_FILTER;	
#define RESONANCE_DATA_FILTER                   16  //	变化量增大于一定范围认为是共振
const unsigned char ucResonanceDataFilter = RESONANCE_DATA_FILTER;
//////CS状态下多键处理定义///////////////////////////////////////////////////////////////
#define ABNORMAL_WAIT_COUNT_FILTER              1000 	//异常状态下多键无效的时长
const unsigned int uiAbnormalWaitCountFilter = ABNORMAL_WAIT_COUNT_FILTER;	
#define NORMAL_COUNT_FILTER                     200  	//数据正常判断次数，连续200次就恢复正常模式
const unsigned char ucNormalCountFilter = NORMAL_COUNT_FILTER;
#define ABNORMAL_COUNT_FILTER                   3   	//数据异常判断次数，连续3次就进CS模式
const unsigned char ucAbnormalCountFilter = ABNORMAL_COUNT_FILTER;
#define KEY_OFF_ABNORMAL_UP_FILTER              5  		//按键非按下值的异常上限值
const unsigned char ucKeyOffAbnormalUpFilter = KEY_OFF_ABNORMAL_UP_FILTER;
#define KEY_ON_ABNORMAL_UP_FILTER            	5 		//按键按下值的异常上限
const unsigned char ucKeyOnAbnormalUpFilter = KEY_ON_ABNORMAL_UP_FILTER;
#define KEY_ON_ABNORMAL_DOWN_FILTER             16 		//按键按下值的异常下限
const unsigned char ucKeyOnAbnormalDownFilter = KEY_ON_ABNORMAL_DOWN_FILTER;

//////采集数据处理相关定义///////////////////////////////////////////////////
#define MULTIPLE_1   					80    	//放大倍数
#define STRONG_FILTER_1   				4		//滤波次数
#define SINGLE_FILTER_1  				4		//滤波次数
#define BASE_LINE_DOWN_SPEED_1   		64    	//向下更新速度
#define BASE_LINE_UP_SPEED_1  			64	    //向下更新速度
#define BASE_LINE_EQUAL_UP_SPEED_1   	100		//向上快速更新
#define BASE_LINE_EQUAL_DOWN_SPEED_1   	200		//向下快速更新
#define SIGNAL_NOISE_RATIO_1  			30    	//整体信噪比
#define MEANTIME_MAX_KEY_NUM_1  		KEY_NUMBER		//最大按键数
const unsigned char ucMultiple = MULTIPLE_1;
const unsigned char ucStrongFilter = STRONG_FILTER_1;
const unsigned char ucSingleFilter = SINGLE_FILTER_1;
const unsigned char ucBaselineDownSpeed = 128 + BASE_LINE_DOWN_SPEED_1;
const unsigned char ucBaselineUpSpeed = 128 - BASE_LINE_UP_SPEED_1;
const unsigned char ucBaselineEqualUpSpeed = BASE_LINE_EQUAL_UP_SPEED_1;
const unsigned char ucBaselineEqualDownSpeed = BASE_LINE_EQUAL_DOWN_SPEED_1;
const unsigned char ucSignalNoiseRatio = SIGNAL_NOISE_RATIO_1;	
const unsigned char ucMeantimeMaxKeyNum = MEANTIME_MAX_KEY_NUM_1;

////////频率微调定义////////////////////////////////////////////////////////
#define FREQ_CHANGER_1	0X20	//扫描频率
#define FREQ_CHANGER_2 	0X00	//扫描频率
#define FREQ_CHANGER_3	0XE0	//扫描频率
const unsigned char ucFreqChangerBase = FREQ_CHANGER_2;
const unsigned char ucFreachooseArray[3] = {
    FREQ_CHANGER_1,
    FREQ_CHANGER_2,
    FREQ_CHANGER_3
};
////////低功耗定义///////////////////////////////////////////////////
////////低功耗定义///////////////////////////////////////////////////
#define SLEEP_MODE_BASE_LINE_COUNT   10   //睡眠模式下的向上更新
const unsigned char ucSleepBaseLineCount = SLEEP_MODE_BASE_LINE_COUNT; 
#define SLEEP_MODE_WAIT_NUMBER     250 //多少次无按键按下进入低功耗,处理所有按键计一次
const unsigned char ucSleepModeWaitNumber = SLEEP_MODE_WAIT_NUMBER;
#define SLEEP_UPDATA_BASE_WAIT_NUMBER  15 //次数，即每2s扫一次，那么就是 2000/128 = 15
const unsigned char ucSleepUpdataBaseNumber = SLEEP_UPDATA_BASE_WAIT_NUMBER;
#define SLEEP_KEY_ON_VALUE    	   20  //低功耗按键有效阀值
const unsigned char ucSleepKeyOnValue = SLEEP_KEY_ON_VALUE;
#define SLEEP_RATE_SET0     0B00001111      // 1/4096
#define SLEEP_RATE_SET1     0B00001111      // 1/8192
const unsigned char ucSleepRateSet0 = SLEEP_RATE_SET0;
const unsigned char ucSleepRateSet1 = SLEEP_RATE_SET1;
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
//变量定义
extern volatile bit bSleepScanEnable;//低功耗扫描标志
extern volatile bit bSleepMode;//低功耗进入标志
extern volatile bit bSleepUserFlag;//低功耗用户使能标志，只有当用户使能该标志了才能进入低功耗
extern volatile bit bIEBackupsFlag;//低功耗下的总中断标志保存位 
extern volatile bit bSleepUserWakeFlag;//低功耗用户使能标志，用户可以通过这个标志强制唤醒退出低功耗
//功能函数定义
unsigned char TSC_SleepPrcoessing(void);//低功耗下的唤醒处理
///////////低功耗定义/////////////////////////////////////

///////////功能函数定义/////////////////////////////////////
void TOUCH_INITIAL(void);  //触摸按键配置初始化          
void TSC_Start(void); //按键扫描结果处理，每次只做一个按键的一次扫描处理
void TSC_Reset(void); //复位触摸. 长按保护可使用
unsigned char TSC_DataProcessing(void);//所有按键数据处理状态: 1表示所有按键数据处理完成 0表示未处理按键数据
unsigned char TSC_GetStrongest(void);  //获取最强按键值
unsigned char TSC_GetSingle(void); //获取按键有效标志，每bit表示一个键，1为有按键按下，0为无按键按下
unsigned char TSC_GetDelta(unsigned char KeyNum); //获取变化量, >最大按键数KEY_NUMBER则获取最大值 
unsigned int TSC_GetPrevData(unsigned char KeyNum); //当前按键采集数据值
    
#endif
