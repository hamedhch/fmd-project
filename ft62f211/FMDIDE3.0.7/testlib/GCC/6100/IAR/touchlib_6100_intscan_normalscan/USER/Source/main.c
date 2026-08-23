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

int main( void )
{
    Led_Init();
    TSC_Init();
    while ( 1 )
    {


        KEY_Scan( TSC_GetStrongest() );
//        DIS_74HC595DispOne(TSC_GetStrongest());
    }
}

/******************************************************************************
  * @brief  This function handles ADC1_IRQ exception.
  * @param  None
  * @retval None
  *****************************************************************************
*/
void ADC1_COMP_IRQHandler( void )
{
    if ( ( EXTI->PR & ( ( uint32_t )( 0x1 << 21 ) ) ) != ( uint32_t )RESET )
    {
        EXTI->PR = ( uint32_t )( 0x1 << 21 );
        TSC_Start();
        TSC_DataProcessing();
    }
}

/************************ (C) COPYRIGHT FMD *****END OF FILE****/


