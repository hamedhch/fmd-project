
/**
  *********************************************************************************
  * @file    	    FT32F0xx_it.c
  * @author  	    FMD AE
  * @brief   		FT32F0xx_it program body.	
  * @version 	    V1.0.0           
  * @data		    2021-09-15
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
#include "FT32F0xx_it.h"


/* Public function ------ --------------------------------------------------------*/
/******************************************************************************
  * @brief  This function handles NMI exception.
  * @param  None
  * @note
  * @retval None
  *****************************************************************************
*/
void NMI_Handler(void)
{
}

/******************************************************************************
  * @brief  This function handles Hard Fault exception.
  * @param  None
  * @note
  * @retval None
  *****************************************************************************
*/
void HardFault_Handler(void)
{
//  while (1)
//  {
//  }
}
/******************************************************************************
  * @brief  This function handles SVCall exception.
  * @param  None
  * @note
  * @retval None
  *****************************************************************************
*/
void SVC_Handler(void)
{
}

/******************************************************************************
  * @brief  This function handles PendSVC exception.
  * @param  None
  * @note
  * @retval None
  *****************************************************************************
*/
void PendSV_Handler(void)
{
}

/******************************************************************************
  * @brief  This function handles SysTick Handler.
  * @param  None
  * @note
  * @retval None
  *****************************************************************************
*/
void SysTick_Handler(void)
{
}


/************************ (C) COPYRIGHT FMD *****END OF FILE****/
