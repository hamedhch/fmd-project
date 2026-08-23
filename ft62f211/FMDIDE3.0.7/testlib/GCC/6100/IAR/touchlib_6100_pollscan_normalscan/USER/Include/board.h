/**
  ******************************************************************************
  * @file    board.h
  * @author  FMD-AE
  * @version V1.0.0
  * @date    2021-8-2
  * @brief   board Header File.
  ******************************************************************************
*/
  
#ifndef __BOARD_H
#define __BOARD_H

#include "FT32f0xx.h"


#define	LED_PORT		GPIOB

#define	LED1_PIN		GPIO_Pin_0
#define	LED2_PIN		GPIO_Pin_1
#define	LED3_PIN		GPIO_Pin_2
#define	LED4_PIN		GPIO_Pin_3
#define	KEY_PORT		GPIOC
#define	KEY1_PIN		GPIO_Pin_13
#define	KEY2_PIN		GPIO_Pin_11

#define LED1_ON   	GPIO_ResetBits(LED_PORT,LED1_PIN)
#define LED1_OFF   	GPIO_SetBits(LED_PORT,LED1_PIN)
#define LED2_ON   	GPIO_ResetBits(LED_PORT,LED2_PIN)
#define LED2_OFF   	GPIO_SetBits(LED_PORT,LED2_PIN)
#define LED3_ON   	GPIO_SetBits(LED_PORT,LED3_PIN)
#define LED3_OFF   	GPIO_ResetBits(LED_PORT,LED3_PIN)
#define LED4_ON   	GPIO_SetBits(LED_PORT,LED4_PIN)
#define LED4_OFF   	GPIO_ResetBits(LED_PORT,LED4_PIN)

#define KEY1_PRES GPIO_ReadInputDataBit(KEY_PORT,KEY1_PIN)
#define KEY2_PRES GPIO_ReadInputDataBit(KEY_PORT,KEY2_PIN)



//#define		LED9_OFF	 		GPIO_SetBits(GPIOB,GPIO_Pin_6)
//#define		LED10_OFF			GPIO_SetBits(GPIOB,GPIO_Pin_7);
//#define		LED11_OFF			GPIO_SetBits(GPIOB,GPIO_Pin_8);
//#define		LED12_OFF			GPIO_SetBits(GPIOB,GPIO_Pin_9);			
//#define		LED13_OFF			GPIO_SetBits(GPIOC,GPIO_Pin_13);
//#define		LED14_OFF			GPIO_SetBits(GPIOC,GPIO_Pin_14);
//#define		LED15_OFF			GPIO_SetBits(GPIOC,GPIO_Pin_15);
//#define		LED16_OFF			GPIO_SetBits(GPIOF,GPIO_Pin_1);

//#define		LED9_ON	 		  GPIO_RsetBits(GPIOB,GPIO_Pin_6)
//#define		LED10_ON		  GPIO_RsetBits(GPIOB,GPIO_Pin_7);
//#define		LED11_ON			GPIO_RsetBits(GPIOB,GPIO_Pin_8);
//#define		LED12_ON			GPIO_RsetBits(GPIOB,GPIO_Pin_9);			
//#define		LED13_ON			GPIO_RsetBits(GPIOC,GPIO_Pin_13);
//#define		LED14_ON			GPIO_RsetBits(GPIOC,GPIO_Pin_14);
//#define		LED15_ON			GPIO_RsetBits(GPIOC,GPIO_Pin_15);
//#define		LED16_ON			GPIO_RsetBits(GPIOF,GPIO_Pin_1);


#define 	LED16_OFF 		GPIO_SetBits(GPIOB,GPIO_Pin_6);	
#define 	LED16_ON 		GPIO_ResetBits(GPIOB,GPIO_Pin_6);	
#define 	LED15_OFF 		GPIO_SetBits(GPIOB,GPIO_Pin_7);	
#define 	LED15_ON 		GPIO_ResetBits(GPIOB,GPIO_Pin_7);
#define 	LED14_OFF 		GPIO_SetBits(GPIOB,GPIO_Pin_8);	
#define 	LED14_ON 		GPIO_ResetBits(GPIOB,GPIO_Pin_8);	
#define 	LED13_OFF 		GPIO_SetBits(GPIOB,GPIO_Pin_9);	
#define 	LED13_ON 		GPIO_ResetBits(GPIOB,GPIO_Pin_9);
#define 	LED12_OFF 		GPIO_SetBits(GPIOC,GPIO_Pin_14);	
#define 	LED12_ON 		GPIO_ResetBits(GPIOC,GPIO_Pin_14);	
#define 	LED11_OFF 		GPIO_SetBits(GPIOC,GPIO_Pin_13);;	
#define 	LED11_ON 		GPIO_ResetBits(GPIOC,GPIO_Pin_13);
#define 	LED10_OFF 		GPIO_SetBits(GPIOF,GPIO_Pin_1);	
#define 	LED10_ON 		GPIO_ResetBits(GPIOF,GPIO_Pin_1);	
#define 	LED9_OFF 		GPIO_SetBits(GPIOC,GPIO_Pin_15);	
#define 	LED9_ON 		GPIO_ResetBits(GPIOC,GPIO_Pin_15);			


typedef enum
{
	KEY_None = 0,
  KEY1_Data = 0X00000001,
  KEY2_Data = 0X00000002,
	KEY3_Data = 0X00000004,
	KEY4_Data = 0X00000008,
	KEY5_Data = 0X00000010,
}KEY_DATA;

void Led_Init(void);
void Key_Init(void);
void SysTick_Configuration(void);
void TimingDelay_Decrement(void);
void SysTick_Delay_Ms(__IO uint32_t nTime);
void SysCLK48M(void);
void LED_Toggle(GPIO_TypeDef* GPIOx,uint16_t GPIO_Pin);
void KEY_Scan(uint8_t iKeyData);
//void DelayuS(uint8_t t);
//void DelaymS(uint8_t t);
#endif /* __MAIN_H */

/************************ (C) COPYRIGHT FMD *****END OF FILE****/
