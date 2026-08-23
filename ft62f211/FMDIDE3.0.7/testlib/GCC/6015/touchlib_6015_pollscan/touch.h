/**
  **************************************************************************************************************
  * @file    	    touch.h
  * @author  	    FMD AE
  * @brief   	    库头文件
  * @version 	    V2.0.1           
  * @data		    2022-03-25
  **************************************************************************************************************
  * @attention
  * COPYRIGHT (C) 2021 Fremont Micro Devices Corporation All rights reserved.
  *    This software is provided by the copyright holders and contributors,and the
  *software is believed to be accurate and reliable. However, Fremont Micro Devices
  *Corporation assumes no responsibility for the consequences of use of such
  *software or for any infringement of patents of other rights of third parties,
  *which may result from its use. No license is granted by implication or otherwise
  *under any patent rights of Fremont Micro Devices Corporation.
  ***************************************************************************************************************
  */  
  
/****************************************************************************************************************
  * @芯片资源
  * 1. Device: FT62F28X
  * 2. Memory: Flash 8KX14b, EEPROM 128X8b, SRAM 616X8b
  * @库使用资源说明:
  * 1. TIMER0、TIMER1
  * 2. LVD中断
  * 3. ROM & SARM (K = 1,Ks = 1不包含led.c)  
  *     库类型            		ROM *14b      	 SRAM*8b
  *  touch_soft.lpp		1,570+2*K		56+8*K
  *  touch.lpp		1,551+2*K		60+8*K
  *  touch_cs_ac.lpp		1,757+3*K		68+8*K
  *  touch_cs_uac.lpp		1,849+3*K		70+8*K
  *  touch_csf_ac.lpp		2,120+3*K		92+8*K
  *  touch_csf_uac.lpp	2,227+3*K		96+8*K
  *  touch_lp.lpp		2,166+2*K		68+8*K+2*Ks
  *  touch_cs_lp_ac.lpp	2,423+3*K		73+8*K+2*Ks
  *  touch_cs_lp_uac.lpp	2,482+3*K		76+8*K+2*Ks
  *  touch_csf_lp_ac.lpp	2,771+3*K		98+8*K+2*Ks
  *  touch_csf_lp_uac.lpp	2,864+3*K		102+8*K+2*Ks
  *
  * 4.SRAM指定地址:
  *	 指定地址 特殊变量应用定义：0x20、0x21、0x72 ~ 0x79
  * 	指定扩展区域地址 按键数据保存区：8BYTE/键 
  *	0x220~0x220+8*K							K :1~8
  *	0x220~0x25F，0x2A0~0x2A0+8*(K-8）					K : 9~16
  *	0x220~0x25F，0x2A0 ~ 0x2DF，0x320~0x320+8*(K-16)			K : 17~24
  *	0x220~0x25F，0x2A0 ~ 0x2DF，0x320 ~ 0x35F，0x3A0~0x3A0+8*(K-24) 		K : 25~28
  ***************************************************************************************************************
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
#define   KEY_NUMBER            8  //按键数
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
/////////////按键有效阀值////////////////////////////////////
#define   KEY0_ON					17
#define   KEY1_ON					16
#define   KEY2_ON					16
#define   KEY3_ON					15
#define   KEY4_ON					16
#define   KEY5_ON					15
#define   KEY6_ON					16
#define   KEY7_ON					16
const unsigned char ucActiveSensorDeltaArray[KEY_NUMBER]=
{
 KEY0_ON,  KEY1_ON,  KEY2_ON,  KEY3_ON,  KEY4_ON,  KEY5_ON,  KEY6_ON,  KEY7_ON
};
///////////按键无效阀值//////////////////////////////////////
#define   KEY0_OFF					10
#define   KEY1_OFF					10
#define   KEY2_OFF					10
#define   KEY3_OFF					9
#define   KEY4_OFF					10
#define   KEY5_OFF					9
#define   KEY6_OFF					10
#define   KEY7_OFF					10
const unsigned char ucInActiveSensorDeltaArray[KEY_NUMBER]=
{
 KEY0_OFF,  KEY1_OFF,  KEY2_OFF,  KEY3_OFF,  KEY4_OFF,  KEY5_OFF,  KEY6_OFF,  KEY7_OFF
};

//////////正常状态或CS模式下的条件判定///////////////////////////////////////////
#define RESONANCE_CHANGER_FREQ_COUNT_FILTER     1000   //CS处理时长
const unsigned int uiResonanceChangerFreqCountFilter = RESONANCE_CHANGER_FREQ_COUNT_FILTER;	
#define RESONANCE_DATA_FILTER                   10    //CS判断条件
const unsigned char ucResonanceDataFilter = RESONANCE_DATA_FILTER;
////////CS状态下多键处理定义///////////////////////////////////////////////////////////////
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
#define KEY_ON_ABNORMAL_DOWN_FILTER             15 		//按键按下值的异常下限
const unsigned char ucKeyOnAbnormalDownFilter = KEY_ON_ABNORMAL_DOWN_FILTER;
////////快速扫键///////////////////////////////////////////
#define SCAN_EFF_KEY_NUM           4 //建议不要修改
const unsigned char ucKeyScanEffNumber = SCAN_EFF_KEY_NUM;
unsigned char ucKeyScanBuffer[SCAN_EFF_KEY_NUM]; 
unsigned char ucKeyScanIndexBuffer[SCAN_EFF_KEY_NUM];

//////////采集数据处理相关定义///////////////////////////////////////////
#define MULTIPLE_1   							80    	//放大倍数
#define STRONG_FILTER_1   						4		//滤波次数
#define SINGLE_FILTER_1  						4		//滤波次数
#define BASE_LINE_DOWN_SPEED_1   				64    	//向下更新速度
#define BASE_LINE_UP_SPEED_1  					64	    //向上更新速度
#define BASE_LINE_EQUAL_UP_SPEED_1   			100		//向上快速更新
#define BASE_LINE_EQUAL_DOWN_SPEED_1   		    200		//向下快速更新
#define SIGNAL_NOISE_RATIO_1  					30  	//整体信噪比
#define MEANTIME_MAX_KEY_NUM_1  		   	 	KEY_NUMBER  
const unsigned char ucMultiple = MULTIPLE_1;
const unsigned char ucStrongFilter = STRONG_FILTER_1;
const unsigned char ucSingleFilter = SINGLE_FILTER_1;
const unsigned char ucBaselineDownSpeed = 128 + BASE_LINE_DOWN_SPEED_1;
const unsigned char ucBaselineUpSpeed = 128 - BASE_LINE_UP_SPEED_1;
const unsigned char ucBaselineEqualUpSpeed = BASE_LINE_EQUAL_UP_SPEED_1;
const unsigned char ucBaselineEqualDownSpeed = BASE_LINE_EQUAL_DOWN_SPEED_1;
const unsigned char ucSignalNoiseRatio = SIGNAL_NOISE_RATIO_1;	
const unsigned char ucMeantimeMaxKeyNum = MEANTIME_MAX_KEY_NUM_1;

////////频率微调定义///////////////////////////////////////////////////
#define FREQ_CHANGER_1_L 						0X00		//扫描频率
#define FREQ_CHANGER_2_L 						0X80		//扫描频率
#define FREQ_CHANGER_3_L 						0X00	    //扫描频率
#define FREQ_CHANGER_1_H 						0X00		//扫描频率
#define FREQ_CHANGER_2_H						0X02		//扫描频率
#define FREQ_CHANGER_3_H						0X05		//扫描频率
const unsigned char ucFreqChangerBaseL = FREQ_CHANGER_2_L;
const unsigned char ucFreqChangerBaseH = FREQ_CHANGER_2_H;
const unsigned char ucFreachooseLArray[3] = {
    FREQ_CHANGER_1_L,
    FREQ_CHANGER_2_L,
    FREQ_CHANGER_3_L
 };
 
const unsigned char ucFreachooseHArray[3] = {
    FREQ_CHANGER_1_H,
    FREQ_CHANGER_2_H,
    FREQ_CHANGER_3_H
};

/////////BANK 切换定义////////////////////////////////////////
#define 	BANKSEL4_7		MSCON1 |= 0X02;   //间接地址为 0x200~0x3FF
#define 	BANKSEL0_3		MSCON1 &= ~0X02; //间接地址为 0x000~0x1FF

////////低功耗定义///////////////////////////////////////////////////
//睡眠模式下的基线更新
#define SLEEP_MODE_BASE_LINE_COUNT   10   
const unsigned char ucSleepBaseLineCount = SLEEP_MODE_BASE_LINE_COUNT; 
//多少次无按键按下进入低功耗,处理所有按键计一次
#define SLEEP_MODE_WAIT_NUMBER     250 
const unsigned char ucSleepModeWaitNumber = SLEEP_MODE_WAIT_NUMBER;
//低功耗状态下看门狗唤醒频率
#define SLEEP_RATE_SET0     0B00001111      // 1/4096
#define SLEEP_RATE_SET1     0B00010001      // 1/8192
const unsigned char ucSleepRateSet0 = SLEEP_RATE_SET0;
const unsigned char ucSleepRateSet1 = SLEEP_RATE_SET1;
//次数，即每2s扫一次，那么就是 2000/128 = 15
#define SLEEP_UPDATA_BASE_WAIT_NUMBER  15 
const unsigned char ucSleepUpdataBaseNumber = SLEEP_UPDATA_BASE_WAIT_NUMBER;
//低功耗按键有效阀值
#define SLEEP_KEY_ON_VALUE    	 6// 8  
const unsigned char ucSleepKeyOnValue = SLEEP_KEY_ON_VALUE;
//低功耗按键数
#define SLEEP_SCAN_KEY_GROUP     4  	 
const unsigned char ucSleepGroupMax = SLEEP_SCAN_KEY_GROUP;
//按键IO
#define TouchIoMaskA 0X07
#define TouchIoMaskB 0XFE
#define TouchIoMaskC 0XFF
#define TouchIoMaskD 0XFC
//按键参数配置
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
const unsigned char ucTouchIoMaskA = TouchIoMaskA;
const unsigned char ucTouchIoMaskB = TouchIoMaskB;
const unsigned char ucTouchIoMaskC = TouchIoMaskC;
const unsigned char ucTouchIoMaskD = TouchIoMaskD;
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
//外部变量引用
extern volatile bit bSleepScanEnable;//低功耗扫描处理标置位
extern volatile bit bSleepUserFlag; //用户可以使用这个标志来控制是否要进入低功耗状态
extern volatile bit bSleepMode;//进入低功耗标志位
extern volatile bit bIEBackupsFlag;//低功耗下总中端标志的备份标志位
extern volatile bit bSleepUserWakeFlag;//用户可以通过这个标志强制退出低功耗唤醒
//低功耗功能函数定义
unsigned char TSC_SleepPrcoessing(void);//低功耗下的唤醒处理
////////低功耗定义///////////////////////////////////////////////////


///////////功能函数定义/////////////////////////////////////
void TOUCH_INITIAL(void);  //触摸按键配置初始化          
void TSC_Start(void); //按键扫描结果处理，每次只做一个按键的一次扫描处理
void TSC_Reset(void); //复位触摸. 长按保护可使用
unsigned char TSC_DataProcessing(void);//所有按键数据处理状态: 1表示所有按键数据处理完成 0表示未处理按键数据
unsigned char TSC_GetStrongest(void);  //获取最强按键值
unsigned long TSC_GetSingle(void); //获取按键有效标志，每bit表示一个键，1为有按键按下，0为无按键按下
unsigned char TSC_GetDelta(unsigned char KeyNum); //获取变化量, >最大按键数KEY_NUMBER则获取最大值 
unsigned int TSC_GetPrevData(unsigned char KeyNum); //当前按键采集数据值

#endif
