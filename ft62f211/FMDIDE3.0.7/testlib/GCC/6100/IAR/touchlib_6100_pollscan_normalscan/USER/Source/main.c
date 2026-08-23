/**
  ******************************************************************************
  * @file    main.c
  * @author  FMD-AE
  * @version V1.0.0
  * @date    2021-8-2
  * @brief   Main program body
  ******************************************************************************
*/

#include "main.h"

void SystemClock_Config( void );
/******************************************************************************
  * @brief  Main program.
  * @param  None
  * @retval None
  *****************************************************************************
*/

int main(void)
{
	Led_Init();
	TSC_Init();
	while (1)
	{	
		TSC_Start();
		TSC_DataProcessing();	
		KEY_Scan(TSC_GetStrongest());
	}		
}

/************************ (C) COPYRIGHT FMD *****END OF FILE****/


