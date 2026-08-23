/**
  ******************************************************************************
  * @file    board.c
  * @author  FMD-AE
  * @version V1.0.0
  * @date    2021-8-2
  * @brief   board program body
  ******************************************************************************
*/

#include "board.h"

__IO uint32_t TimingDelay;

/******************************************************************************
  * @brief  Led_Init program.
  * @param  None
  * @retval None
  *****************************************************************************
*/
void Led_Init( void )
{
    GPIO_InitTypeDef	GPIO_InitStruct;
    RCC_AHBPeriphClockCmd( RCC_AHBPeriph_GPIOB, ENABLE );
    RCC_AHBPeriphClockCmd( RCC_AHBPeriph_GPIOC, ENABLE );
    RCC_AHBPeriphClockCmd( RCC_AHBPeriph_GPIOF, ENABLE );

    GPIO_InitStruct.GPIO_Pin = GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_7 | GPIO_Pin_8 | GPIO_Pin_9 | GPIO_Pin_1 | GPIO_Pin_0;
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init( GPIOB, &GPIO_InitStruct );
    GPIO_SetBits( GPIOB, GPIO_Pin_5 );
    GPIO_SetBits( GPIOB, GPIO_Pin_6 );
    GPIO_ResetBits( GPIOB, GPIO_Pin_7 );
    GPIO_SetBits( GPIOB, GPIO_Pin_8 );
    GPIO_SetBits( GPIOB, GPIO_Pin_9 );

    GPIO_InitStruct.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15;
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init( GPIOC, &GPIO_InitStruct );
    GPIO_SetBits( GPIOC, GPIO_Pin_12 );
    GPIO_SetBits( GPIOC, GPIO_Pin_13 );
    GPIO_SetBits( GPIOC, GPIO_Pin_14 );
    GPIO_SetBits( GPIOC, GPIO_Pin_15 );

    GPIO_InitStruct.GPIO_Pin = GPIO_Pin_1;
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init( GPIOF, &GPIO_InitStruct );
    GPIO_SetBits( GPIOF, GPIO_Pin_1 );

}
/******************************************************************************
  * @brief  LED_Toggle program.
  * @param  GPIOx AND GPIO_Pin
  * @retval None
  *****************************************************************************
*/
void LED_Toggle( GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin )
{
    GPIO_WriteBit( GPIOx, GPIO_Pin, ( BitAction )( ( 1 - GPIO_ReadOutputDataBit( GPIOx, GPIO_Pin ) ) ) );
}

/******************************************************************************
  * @brief  Key_Init program.
  * @param  None
  * @retval None
  *****************************************************************************
*/
void Key_Init( void )
{
    GPIO_InitTypeDef	GPIO_InitStruct;
    RCC_AHBPeriphClockCmd( RCC_AHBPeriph_GPIOC, ENABLE );

    GPIO_InitStruct.GPIO_Pin = KEY1_PIN;
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_IN;
    GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_DOWN;
    GPIO_Init( KEY_PORT, &GPIO_InitStruct );

    GPIO_InitStruct.GPIO_Pin = KEY2_PIN;
    GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_UP;
    GPIO_Init( KEY_PORT, &GPIO_InitStruct );
}
/******************************************************************************
  * @brief  Key_Scan	program
  * @param  FlashRate
  * @retval None
  *****************************************************************************
*/
void KEY_Scan( uint8_t iKeyData )
{
    switch( iKeyData )
    {
    case 0x01:
    {
        LED9_ON;
        LED10_OFF;
        LED11_OFF;
        LED12_OFF;
        LED13_OFF;
        LED14_OFF;
        LED15_OFF;
        LED16_OFF;
        LED1_ON;
        break;
    }


    case 0x02:
    {
        LED9_OFF;
        LED10_ON;
        LED11_OFF;
        LED12_OFF;
        LED13_OFF;
        LED14_OFF;
        LED15_OFF;
        LED16_OFF;
        LED2_ON;
        break;
    }


    case 0x03:
    {
        LED9_OFF;
        LED10_OFF;
        LED11_ON;
        LED12_OFF;
        LED13_OFF;
        LED14_OFF;
        LED15_OFF;
        LED16_OFF;
//			LED1_ON;
        break;
    }


    case 0x04:
    {
        LED9_OFF;
        LED10_OFF;
        LED11_OFF;
        LED12_ON;
        LED13_OFF;
        LED14_OFF;
        LED15_OFF;
        LED16_OFF;
//			LED2_ON;
        break;
    }

    case 0x05:
    {
        LED9_OFF;
        LED10_OFF;
        LED11_OFF;
        LED12_OFF;
        LED13_ON;
        LED14_OFF;
        LED15_OFF;
        LED16_OFF;
        break;
    }

    case 0x06:
    {
        LED9_OFF;
        LED10_OFF;
        LED11_OFF;
        LED12_OFF;
        LED13_OFF;
        LED14_ON;
        LED15_OFF;
        LED16_OFF;
        break;
    }

    case 0x07:
    {
        LED9_OFF;
        LED10_OFF;
        LED11_OFF;
        LED12_OFF;
        LED13_OFF;
        LED14_OFF;
        LED15_ON;
        LED16_OFF;
        break;
    }


    case 0x8:
    {
        LED9_OFF;
        LED10_OFF;
        LED11_OFF;
        LED12_OFF;
        LED13_OFF;
        LED14_OFF;
        LED15_OFF;
        LED16_ON;
        break;
    }

    default:
        LED9_OFF;
        LED10_OFF;
        LED11_OFF;
        LED12_OFF;
        LED13_OFF;
        LED14_OFF;
        LED15_OFF;
        LED16_OFF;
        LED1_OFF;
        LED2_OFF;
        break;

    }
}

/******************************************************************************
  * @brief  SysTick_Configuration program.
  * @param  None
  * @retval None
  *****************************************************************************
*/
//void SysTick_Configuration(void)
//{
//	if(SysTick_Config(SystemCoreClock/TICK_RATE_HZ))
//	{
//		while(1);
//	}
//  SysTick_CLKSourceConfig(SysTick_CLKSource_HCLK);
//  NVIC_SetPriority(SysTick_IRQn, 0x04);
//}

/******************************************************************************
  * @brief  TimingDelay_Decrement program.
  * @param  None
  * @retval None
  *****************************************************************************
*/
//void TimingDelay_Decrement(void)
//{
//	if(TimingDelay != 0x00)
//	{
//		TimingDelay--;
//	}
//}

/******************************************************************************
  * @brief  SysTick_Delay_Ms program.
  * @param  nTime
  * @retval None
  *****************************************************************************
*/
//void SysTick_Delay_Ms(__IO uint32_t nTime)
//{
//	TimingDelay = nTime/10;
//	while(TimingDelay != 0);
//}

/******************************************************************************
  * @brief  SysCLK48M program.
  * @param  nTime
  * @retval None
  *****************************************************************************
*/
void SysCLK48M( void )
{
    __IO uint32_t StartUpCounter = 0, HSIStatus = 0;

    /* Enable HSI */
    RCC->CR |= ( ( uint32_t )RCC_CR_HSION );

    /* Wait till HSI is ready and if Time out is reached exit */
    do
    {
        HSIStatus = RCC->CR & RCC_CR_HSIRDY;
        StartUpCounter++;
    }
    while( ( HSIStatus == 0 ) && ( StartUpCounter != HSI_STARTUP_TIMEOUT ) );

    if ( ( RCC->CR & RCC_CR_HSIRDY ) != RESET )
    {
        HSIStatus = ( uint32_t )0x01;
    }
    else
    {
        HSIStatus = ( uint32_t )0x00;
    }

    if ( HSIStatus == ( uint32_t )0x01 )
    {
        /* Enable Prefetch Buffer and set Flash Latency */
        FLASH->ACR = FLASH_ACR_PRFTBE | FLASH_ACR_LATENCY;

        /* HCLK = SYSCLK */
        RCC->CFGR |= ( uint32_t )RCC_CFGR_HPRE_DIV1;

        /* PCLK = HCLK */
        RCC->CFGR |= ( uint32_t )RCC_CFGR_PPRE_DIV1;

        /* PLL configuration */
        RCC->CFGR &= ( uint32_t )( ( uint32_t )~( RCC_CFGR_PLLSRC | RCC_CFGR_PLLXTPRE | RCC_CFGR_PLLMULL ) );
        RCC->CFGR |= ( uint32_t )( RCC_CFGR_PLLSRC_HSI_PREDIV | RCC_CFGR_PLLXTPRE_PREDIV1 | RCC_CFGR_PLLMULL6 );

        /* Enable PLL */
        RCC->CR |= RCC_CR_PLLON;

        /* Wait till PLL is ready */
        while( ( RCC->CR & RCC_CR_PLLRDY ) == 0 )
        {
        }

        /* Select PLL as system clock source */
        RCC->CFGR &= ( uint32_t )( ( uint32_t )~( RCC_CFGR_SW ) );
        RCC->CFGR |= ( uint32_t )RCC_CFGR_SW_PLL;

        /* Wait till PLL is used as system clock source */
        while ( ( RCC->CFGR & ( uint32_t )RCC_CFGR_SWS ) != ( uint32_t )RCC_CFGR_SWS_PLL )
        {
        }
    }
}

//===========================================================
//Funtion name:DelaymS
//parameters:none
//returned value:none
//===========================================================
//void DelayuS(uint8_t t)
//{
//	unsigned int delay = 2;
//	for(;t>0;t--)
//	{
//		for(;delay>0;delay--)
//		{
//			__NOP();
//			__NOP();
//		}
//	}
//}
//void DelaymS(uint8_t t)
//{
//	unsigned int delay = 6000;
//	for(;t>0;t--)
//	{
//		for(;delay>0;delay--)
//		{
//			__NOP();
//		}
//	}
//}
/**
  * @}
  */

/************************ (C) COPYRIGHT FMD *****END OF FILE****/
