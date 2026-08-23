/**
  ******************************************************************************
  * @file    main.h
  * @author  FMD-AE
  * @version V1.0.0
  * @date    2021-8-2
  * @brief   main Header File.
  ******************************************************************************
*/
  
#ifndef __MAIN_H
#define __MAIN_H
#define RX_SIZE		40
#define TICK_RATE_HZ  9090          /*!< TICK_RATE_HZ */

#include "FT32f0xx.h"

#include "board.h"  

#include "ft32f0xx_touch.h"
typedef enum {FAILED = 0, PASSED = !FAILED} TestStatus;
extern uint8_t usart_rx_buff[];
extern uint8_t Time10ms_flag;

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT FMD *****END OF FILE****/
