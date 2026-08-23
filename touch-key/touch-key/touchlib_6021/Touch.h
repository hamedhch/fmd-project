#ifndef	_TOUCH_
#define	_TOUCH_

#include "syscfg.h"

#define  uint8_t       unsigned char
#define  uint16_t     unsigned int
#define  uint32_t     unsigned long
#define  BOOL         bit



#define   IO_TOUCH_ATTR	                     0x000F	     //定义所使用的按键Bit 0~3对应key1~key4，0不使用，1使用	
#define   TouchCount                                 4               	  //按键数
#define   LONGKEYPROTECT                       4               	  //(秒)，长按保护设置, 0 不使用
#define   SCANNINGTIME					         12                //按键扫描频率
#define   WAKEUPFREQUENCY                     32                  //唤醒频率  次/秒
//KEY ON 百分比
#define   KEY0_ON					65
#define   KEY1_ON					65
#define   KEY2_ON					65
#define   KEY3_ON					65
//KEY OFF 百分比
#define   KEY0_OFF					40
#define   KEY1_OFF					40
#define   KEY2_OFF					40
#define   KEY3_OFF					40
//----------------------------------------------------------

//触摸阈值	1
#define  KEY0_ACTIVE_SENSOR_DELTA1		116*KEY0_ON/100
#define  KEY1_ACTIVE_SENSOR_DELTA1		103*KEY1_ON/100
#define  KEY2_ACTIVE_SENSOR_DELTA1		92*KEY2_ON/100
#define  KEY3_ACTIVE_SENSOR_DELTA1		102*KEY3_ON/100
//----------------------------------------------------------

//非触摸阈值	1
#define  KEY0_INACTIVE_SENSOR_DELTA1		116*KEY0_OFF/100
#define  KEY1_INACTIVE_SENSOR_DELTA1		103*KEY1_OFF/100
#define  KEY2_INACTIVE_SENSOR_DELTA1		92*KEY2_OFF/100
#define  KEY3_INACTIVE_SENSOR_DELTA1		102*KEY3_OFF/100
//----------------------------------------------------------

const uint8_t ACTIVE_SENSOR_DELTA[4]   = 
{
KEY0_ACTIVE_SENSOR_DELTA1,	
KEY1_ACTIVE_SENSOR_DELTA1,	
KEY2_ACTIVE_SENSOR_DELTA1,	
KEY3_ACTIVE_SENSOR_DELTA1,	
};
//----------------------------------------------------------

const uint8_t INACTIVE_SENSOR_DELTA[4]  =
{
KEY0_INACTIVE_SENSOR_DELTA1,	
KEY1_INACTIVE_SENSOR_DELTA1,	
KEY2_INACTIVE_SENSOR_DELTA1,	
KEY3_INACTIVE_SENSOR_DELTA1,	
};
//----------------------------------------------------------

const uint8_t     IO_TOUCH_ATTR1   = IO_TOUCH_ATTR;
const uint8_t     LONGKEYPROTECT1 = LONGKEYPROTECT;
const uint8_t     TouchCount1           = TouchCount;
const uint8_t     SCANNINGTIME1    			  		=SCANNINGTIME;

unsigned char TouchKeyScan();
void Touch_init();
#endif	
