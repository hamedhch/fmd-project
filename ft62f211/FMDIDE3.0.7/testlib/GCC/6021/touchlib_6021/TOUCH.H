#ifndef	_TOUCH_
#define	_TOUCH_
#include "syscfg.h"
#define  uint8_t       unsigned char
#define  uint16_t     unsigned int
#define  uint32_t     unsigned long

#define  IO_TOUCH_ATTR	   0B00000001// 	KEY 3~2~1~0        对应通道  1为开启，0为不开启	
#define  TouchCount           1
											
 
#define   LONGKEYPROTECT       			5              	  //(秒)，长按保护设置, 0 不使用
#define   ANTISHAKETIMES         			1                    //防抖次数  
#define   SCANNINGTIME			 			12                  //按键扫描频率 次/秒

//多按键设置
#define   MAXIMUMNUMBEROFKEYS1    2                    //最多返回按键数
#define   PRIMARYKEY1    	   	                1		 			  //主键1	
#define   FORBIDDENKEY1                     0x02          //禁止按键1        

 
    
//KEY ON 百分比
#define  KEY0_ON		65
#define  KEY1_ON		65
#define  KEY2_ON		65
#define  KEY3_ON		65

//KEY OFF 百分比
#define  KEY0_OFF	40
#define  KEY1_OFF	40
#define  KEY2_OFF	40
#define  KEY3_OFF	40
//----------------------------------------------------------
//触摸阈值	1
#define  KEY0_ACTIVE_SENSOR_DELTA1		52*KEY0_ON/100
#define  KEY1_ACTIVE_SENSOR_DELTA1		52*KEY1_ON/100
#define  KEY2_ACTIVE_SENSOR_DELTA1		52*KEY2_ON/100
#define  KEY3_ACTIVE_SENSOR_DELTA1		52*KEY3_ON/100


//非触摸阈值	1
#define  KEY0_INACTIVE_SENSOR_DELTA1		52*KEY0_OFF/100
#define  KEY1_INACTIVE_SENSOR_DELTA1		52*KEY1_OFF/100
#define  KEY2_INACTIVE_SENSOR_DELTA1		52*KEY2_OFF/100
#define  KEY3_INACTIVE_SENSOR_DELTA1		52*KEY3_OFF/100

//----------------------------------------------------------

const uint8_t ACTIVE_SENSOR_DELTA[4]   = 
{
KEY0_ACTIVE_SENSOR_DELTA1,		
KEY1_ACTIVE_SENSOR_DELTA1,	
KEY2_ACTIVE_SENSOR_DELTA1,	
KEY3_ACTIVE_SENSOR_DELTA1
};
//----------------------------------------------------------

const uint8_t INACTIVE_SENSOR_DELTA[4]   =
{
KEY0_INACTIVE_SENSOR_DELTA1,
KEY1_INACTIVE_SENSOR_DELTA1,
KEY2_INACTIVE_SENSOR_DELTA1,
KEY3_INACTIVE_SENSOR_DELTA1
};
//-------------------------------------------------
const uint8_t     IO_TOUCH_ATTR1   = IO_TOUCH_ATTR;
const uint8_t     TouchCount1           = TouchCount;
const uint8_t     LONGKEYPROTECT1 = LONGKEYPROTECT;
const uint8_t     ANTISHAKETIMES1   = ANTISHAKETIMES;
//--------------


const uint8_t   	 MAXIMUMNUMBEROFKEYS11 	=MAXIMUMNUMBEROFKEYS1;		//最多返回按键数
const uint8_t     PRIMARYKEY11    			  		=PRIMARYKEY1;						 //主按键


	//主键1	
const uint8_t   FORBIDDENKEY11    		  		=FORBIDDENKEY1;						//禁止按键1 
const uint8_t     SCANNINGTIME1    			  		=SCANNINGTIME;						 //主按键                                                  
 
unsigned char TouchKeyScan();

void Touch_init();


extern void DelayUs();
#endif	
