/**
  *********************************************************************************
  * @file           ft32f0xx_touch.h
  * @author         FMD AE
  * @brief          ft32f0xx_touch Header File.
  * @version        V1.0.1
  * @data           2021-11-4
  *********************************************************************************
  * @attention
  * COPYRIGHT (C) 2021 Fremont Micro Devices  Corporation All rights reserved.
  *    This software is provided by the copyright holders and contributors,and the
  *software is believed to be accurate and reliable. However, Fremont Micro Devices
  *Corporation assumes no responsibility for the consequences of use of such
  *software or for any infringement of patents of other rights of third parties,
  *which may result from its use. No license is granted by implication or otherwise
  *under any patent rights of Fremont Micro Devices Corporation.
  *  ******************************************************************************
  */

#ifndef     __FT32F0XX_TOUCH_H
#define     __FT32F0XX_TOUCH_H

/* Includes ---------------------------------------------------------------------*/
#include  "ft32f0xx.h"

/* Public Constant --------------------------------------------------------------*/

/* Public typedef ---------------------------------------------------------------*/
/* Public define ----------------------------------------------------------------*/
#define KEY_NUMBER                          2          //按键数
#define SCAN_EFF_KEY_NUM                    4           //快速扫描按键数

#define MEANTIME_MAX_KEY_NUM_1              8           //最大允许同时按下的按键个数
#define BASELINEEQUALCONDITION              2           //基线快速更新条件
#define MULTIPLE_1                          80          //按键的放大倍数
#define STRONG_FILTER_1                     4           //最强键滤波次数
#define SINGLE_FILTER_1                     4           //单键滤波次数
#define BASE_LINE_DOWN_SPEED_1              50          //基线向下更新速度
#define BASE_LINE_UP_SPEED_1                50          //基线向上更新速度
#define BASE_LINE_EQUAL_UP_SPEED_1          50          //基线向上快速更新速度
#define BASE_LINE_EQUAL_DOWN_SPEED_1        50          //基线向下快速更新速度
#define SIGNAL_NOISE_RATIO_1                30          //输入信噪比

const uint8_t ucMultiple = MULTIPLE_1;
const uint8_t ucStrongFilter = STRONG_FILTER_1;
const uint8_t ucSingleFilter = SINGLE_FILTER_1;
const uint8_t ucBaselineDownSpeed = BASE_LINE_DOWN_SPEED_1;
const uint8_t ucBaselineUpSpeed = BASE_LINE_UP_SPEED_1;
const uint8_t ucBaselineEqualUpSpeed = BASE_LINE_EQUAL_UP_SPEED_1;
const uint8_t ucBaselineEqualDownSpeed = BASE_LINE_EQUAL_DOWN_SPEED_1;
const uint8_t ucSignalNoiseRatio = SIGNAL_NOISE_RATIO_1;
const uint8_t ucMeantimeMaxKeyNum = MEANTIME_MAX_KEY_NUM_1;
/************************按键有效阀值***************************/
#define   KEY0_ON                   20
#define   KEY1_ON                   20

const uint8_t ucSensitivityArray[KEY_NUMBER] =
{
    KEY0_ON, KEY1_ON
};
/************************按键对应芯片KEYIO映射定义***************************/
#define   KEY0_INDEX_MAP            10
#define   KEY1_INDEX_MAP            11
const uint8_t ucKeyEn[KEY_NUMBER] =
{
    KEY0_INDEX_MAP, KEY1_INDEX_MAP,
};
/************************按键数***************************/
const uint8_t ucKeyNumberMax = KEY_NUMBER;
/************************快速扫描按键数***************************/
const uint8_t ucKeyScanEffNumber = SCAN_EFF_KEY_NUM;

/* Public variables -------------------------------------------------------------*/

/* Public function prototypes----------------------------------------------------*/
void TSC_Start(void);
void TSC_DataProcessing(void);
uint8_t  TSC_GetStrongest(void);
uint32_t TSC_GetSingle(void);
void TSC_Reset(void);
uint8_t TSC_GetDelta(uint8_t KeyNum);
void Set_Baseline(uint8_t KeyNum, uint16_t BaselineData);
uint16_t TSC_GetPrevData(uint8_t KeyNum);
void TSC_Init(void);
#endif

/************************* (C) COPYRIGHT FMD *****END OF FILE**********************/
