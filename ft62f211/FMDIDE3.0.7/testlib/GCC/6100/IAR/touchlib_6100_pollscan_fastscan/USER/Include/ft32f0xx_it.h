/**
  ******************************************************************************
  * @file    FT32F0xx_it.h
  * @author  FMD-AE
  * @version V1.0.0
  * @date    2021-8-2
  * @brief   FT32F0xx_it Header File.
  ******************************************************************************
*/

#ifndef __FT32F0XX_it_H
#define __FT32F0XX_it_H

#ifdef __cplusplus
 extern "C" {
#endif 

#include "FT32f0xx.h"

void NMI_Handler(void);
void HardFault_Handler(void);
void SVC_Handler(void);
void PendSV_Handler(void);
void SysTick_Handler(void);

#ifdef __cplusplus
}
#endif

#endif 

/************************ (C) COPYRIGHT FMD *****END OF FILE****/
