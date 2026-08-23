
/**
  *********************************************************************************
  * @file           main.c
  * @author         FMD AE
  * @brief          Main program body
  * @version        V1.0.0
  * @data           2021-09-15
  *********************************************************************************
  * @attention
  * COPYRIGHT (C) 2021 Fremont Micro Devices (SZ) Corporation All rights reserved.
  *    This software is provided by the copyright holders and contributors,and the
  *software is believed to be accurate and reliable. However, Fremont Micro Devices
  *(SZ) Corporation assumes no responsibility for the consequences of use of such
  *software or for any infringement of patents of other rights of third parties,
  *which may result from its use. No license is granted by implication or otherwise
  *under any patent rights of Fremont Micro Devices (SZ) Corporation.
  *  ******************************************************************************
  */

/* Includes ----------------------------------------------------------------------*/
#include "main.h"

/* Private Constant ---------------------------------------------------------------*/

/* Private typedef ---------------------------------------------------------------*/

/* Private define ----------------------------------------------------------------*/

/* Private variables -------------------------------------------------------------*/
/* Public variables --------------------------------------------------------------*/


/* Private function prototypes ---------------------------------------------------*/
static void LED_Init(void);
static void KEY_Scan(uint8_t iKeyData);

/**********************************************************************************
  * @brief  main program.
  * @param  None
  * @note
  * @retval None
  *********************************************************************************
*/
int main(void)
{
    uint8_t i, g_cKeyData;
    LED_Init();
    TSC_Init();
    while (1)
    {
        TSC_Start();                                              //在主循环中频繁调用，检测各个按键的数据
        TSC_DataProcessing();                                     //在主循环中频繁调用，处理检测到的数据
        g_cKeyData = TSC_GetStrongest();                          //获取最强按键值
        KEY_Scan(g_cKeyData);
    }
}

/* Public function ------ --------------------------------------------------------*/



/* Private function ------ -------------------------------------------------------*/

/**********************************************************************************
  * @brief  LED_Init program.
  * @param  None
  * @note
  * @retval None
  *********************************************************************************
*/
void LED_Init(void)
{
    GPIO_InitTypeDef    GPIO_InitStruct;
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOB, ENABLE);

    GPIO_InitStruct.GPIO_Pin = GPIO_Pin_2 | GPIO_Pin_0;
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStruct);
}
/**********************************************************************************
  * @brief  KEY_Scan program.
  * @param  iKeyData
  * @note
  * @retval None
  *********************************************************************************
*/
void KEY_Scan(uint8_t iKeyData)
{
    switch (iKeyData)
    {
    case 0x01:
    {
        GPIO_ResetBits(GPIOB, GPIO_Pin_0);
        GPIO_ResetBits(GPIOB, GPIO_Pin_2);
        break;
    }


    case 0x02:
    {
        GPIO_SetBits(GPIOB, GPIO_Pin_2);
        GPIO_SetBits(GPIOB, GPIO_Pin_0);
        break;
    }

    default:
        GPIO_SetBits(GPIOB, GPIO_Pin_0);
        GPIO_ResetBits(GPIOB, GPIO_Pin_2);
        break;

    }
}


/************************ (C) COPYRIGHT FMD *****END OF FILE****/
