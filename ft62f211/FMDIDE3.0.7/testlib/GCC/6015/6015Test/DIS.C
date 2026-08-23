#ifndef	_DIS_H
#define	_DIS_H


#include "Dis.h"
#include "touch.h"


unsigned char DEC2ASC(unsigned char data)
{
	switch(data)
	{
		case 0: return 0x30;//0
		case 1: return 0x31;//1
		case 2: return 0x32;//2niha°¬Ýï,
		case 3: return 0x33;//3
		case 4: return 0x34;//4
		case 5: return 0x35;//5
		case 6: return 0x36;//6
		case 7: return 0x37;//7
		case 8: return 0x38;//8
		case 9: return 0x39;//9
		case 10:return 0x41;//A
		case 11:return 0x42;//B
		case 12:return 0x43;//C
		case 13:return 0x44;//D
		case 14:return 0x45;//E
		case 15:return 0x46;//F	
	}
	return 0x78;
}
void  SendHead()
{
		uart_tx(0x00);
		uart_tx(0x55);
		uart_tx(0xaa);
}
void SEND_16(unsigned int data)
{
	uart_tx((data&0xFF00)>>8);
	uart_tx(data&0x00FF); 
}
void SEND_16asc(unsigned int b)
{
	uart_tx(DEC2ASC(b/10000));
	uart_tx(DEC2ASC((b%10000)/1000));
	uart_tx(DEC2ASC((b%1000)/100));
	uart_tx(DEC2ASC((b%100)/10));
	uart_tx(DEC2ASC(b%10));
	uart_tx(0x2C);// :/r
}
//ÐÂÔö¼Ó´®¿Ú³ÌÐò
//void uart_delay(void)
//{
//	unsigned int delay = 64; //100us
//	for(;delay>0;delay--) //for£º2T NOP£º1T
//	{
//		NOP();
//	}
//	
//}
void uart_delay(void)
{
   ///*     16M/2T  ²¨ÌØÂÊ 38400
    NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
    NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
    NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
    NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
    NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
	NOP();NOP();NOP();NOP();
    //*/
   // DelayUs(50);     16M/4T  ²¨ÌØÂÊ 9600
}
void uart_tx(unsigned char  data)
{

	TX =0; //start
    NOP();
    NOP();
	uart_delay();
	if(data & 0x01)  //1Âë  1
	{
        NOP();   
		TX = 1;
		uart_delay(); 	 
	}
	else //0Âë
	{
		TX = 0;
       	NOP();
		NOP();
		uart_delay();
	}
	if(data & 0x02)  //1Âë  1
	{
        NOP();   
		TX = 1;
		uart_delay(); 	 
	}
	else //0Âë
	{
		TX = 0;
       	NOP();
		NOP();
		uart_delay();
	}
	if(data & 0x04)  //1Âë  1
	{
        NOP();
		TX = 1;
		uart_delay(); 	 
	}
	else //0Âë
	{
		TX = 0;
    	NOP();
	    NOP();
		uart_delay();
	}
	if(data & 0x08)  //1Âë  1
	{
        NOP();
		TX = 1;
		uart_delay(); 	 
	}
	else //0Âë
	{
		TX = 0;
    	NOP();
		NOP();
		uart_delay();
	}
	if(data & 0x10)  //1Âë  1
	{
        NOP();
		TX = 1;
		uart_delay(); 	 
	}
	else //0Âë
	{
		TX = 0;
    	NOP();
		NOP();
		uart_delay();
	}
	if(data & 0x20)  //1Âë  1
	{
        NOP();
		TX = 1;
		uart_delay(); 	 
	}
	else //0Âë
	{
		TX = 0;
    	NOP();
		NOP();
		uart_delay();
	}
	if(data & 0x40)  //1Âë  1
	{
        NOP();
		TX = 1;
		uart_delay(); 	 
	}
	else //0Âë
	{
		TX = 0;
    	NOP();
		NOP();
		uart_delay();
	}
	if(data & 0x80)  //1Âë  1
	{
        NOP();
		TX = 1;
		uart_delay(); 	 
	}
	else //0Âë
	{
		TX = 0;
    	NOP();
		NOP();
		uart_delay();
	}
	TX = 1; //stop
    NOP();
	NOP();
	uart_delay ();

}
unsigned int SendDataBuff[28];
void SendDataToPC()
{
		unsigned char i,j;
        unsigned int SendCS;
		
        unsigned int addr;
        for(i=0;i<28;i++)
        {
				addr = i*10;
                SendDataBuff[i]  = Read_SpecialRam(addr);
		}
        //---------1----------------------------------------
        SendCS = 0;
        for(i=0;i<16;i++)
        {
             SendCS = SendCS + SendDataBuff[i];
		}
        SendCS = SendCS+1;
        SendHead();     
        uart_tx(1);
        uart_tx(254);
		for(i=0;i<16;i++)
		{
			SEND_16(SendDataBuff[i]);
		}
        SEND_16(SendCS);
        //-------------1------------------------------------
        //-------------2------------------------------------
        SendCS = 0;
		for(i=16;i<28;i++)
        {
             SendCS = SendCS + SendDataBuff[i];
		}

        SendCS = SendCS+2;
        SendHead();     
        uart_tx(2);
        uart_tx(253);
		for(i=16;i<28;i++)
		{
			SEND_16(SendDataBuff[i]);
		}
        for(i=0;i<4;i++)
		{
			SEND_16(0);
		}
        SEND_16(SendCS);
        //----------------2-----------------------------------
        //-------------------3-6-------------------------------
        for(j=3;j<7;j++)
        {
				SendHead();
				uart_tx(j); 
				uart_tx(255-j);
				for(i = 0;i<16;i++)
				{
					SEND_16(0); 
				}
				uart_tx(0); 
				uart_tx(j);   
        }
	   //------------3-6--------------------------------------- 

}
 
#endif
