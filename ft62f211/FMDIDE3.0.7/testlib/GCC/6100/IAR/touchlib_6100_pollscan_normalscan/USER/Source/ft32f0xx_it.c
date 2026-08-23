/**
  ******************************************************************************
  * @file    FT32F0xx_it.c
  * @author  FMD-AE
  * @version V1.0.0
  * @date    2021-8-2
  * @brief   FT32F0xx_it program body
  ******************************************************************************
*/

#include "ft32f0xx_it.h"


/******************************************************************************
  * @brief  This function handles NMI exception.
  * @param  None
  * @retval None
  *****************************************************************************
*/
void NMI_Handler(void)
{
}

/******************************************************************************
  * @brief  This function handles Hard Fault exception.
  * @param  None
  * @retval None
  *****************************************************************************
*/
void HardFault_Handler(void)
{
    while (1)
    {
    }
}
/******************************************************************************
  * @brief  This function handles SVCall exception.
  * @param  None
  * @retval None
  *****************************************************************************
*/
void SVC_Handler(void)
{
}

/******************************************************************************
  * @brief  This function handles PendSVC exception.
  * @param  None
  * @retval None
  *****************************************************************************
*/
void PendSV_Handler(void)
{
}

/******************************************************************************
  * @brief  This function handles SysTick Handler.
  * @param  None
  * @retval None
  *****************************************************************************
*/
//uint32_t numT;
//void SysTick_Handler(void)
//{
//  Time10ms_flag = 1;
//  TimingDelay_Decrement();

//}



/************************ (C) COPYRIGHT FMD *****END OF FILE****/
