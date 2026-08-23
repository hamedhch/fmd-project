
/**
  *********************************************************************************
  * @file    	    FT32F0xx_it.h
  * @author  	    FMD AE
  * @brief   		FT32F0xx_it Header File. 	
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

#ifndef __FT32F0XX_it_H
#define __FT32F0XX_it_H

#ifdef __cplusplus
extern "C" {
#endif 


/* Public function prototypes-----------------------------------------------------*/
void NMI_Handler(void);
void HardFault_Handler(void);
void SVC_Handler(void);
void PendSV_Handler(void);
void SysTick_Handler(void);

#ifdef __cplusplus
}
#endif

#endif 

/************************* (C) COPYRIGHT FMD *****END OF FILE**********************/
