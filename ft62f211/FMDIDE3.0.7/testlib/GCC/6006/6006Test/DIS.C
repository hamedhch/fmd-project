#ifndef	_TM1638_H
#define	_TM1638_H

#include "touch.h"
#include "Dis.h"

void  SendHead()
{
		uart_tx(0x00);
		uart_tx(0x55);
		uart_tx(0xaa);
}

void  SendHead1()
{
		uart_tx(0x00);
		uart_tx(0x55);
		uart_tx(0xaa);
		
		uart_tx(0x53); //s
		uart_tx(0x54); //t
		uart_tx(0x41); //a
		uart_tx(0x52); //r		
		uart_tx(0x54); //t
		
		uart_tx(0x53); //s
		uart_tx(0x45); //e
		uart_tx(0x4e); //n
		uart_tx(0x44); //d;
		uart_tx(0x44); //d
		uart_tx(0x41); //a
		uart_tx(0x54); //t
		uart_tx(0x41); //a

}
unsigned char DEC2ASC(unsigned char data)
{
	switch(data)
	{
		case 0: return 0x30;//0
		case 1: return 0x31;//1
		case 2: return 0x32;//2
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

void SEND_16(unsigned int data)
{
		uart_tx((data&0xFF00)>>8);
		uart_tx(data&0x00FF); 
}
void uart_delay(void)
{
     NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
    NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
    NOP();NOP();NOP();NOP();
    NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
    NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
    NOP();NOP();NOP();NOP();
     NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
    /*
	unsigned char delay = 14; //100us
	for(;delay>0;delay--) //forЃК2T NOPЃК1T
	{
		NOP();
	}*/
}
void uart_tx(unsigned char  data)
{
 
	TX =0; //start
    NOP();
    NOP();
	uart_delay();
	if(data & 0x01)  //1Ты  1
	{
        NOP();   
		TX = 1;
		uart_delay(); 	 
	}
	else //0Ты
	{
		TX = 0;
       	NOP();
		NOP();
		uart_delay();
	}
	if(data & 0x02)  //1Ты  1
	{
        NOP();   
		TX = 1;
		uart_delay(); 	 
	}
	else //0Ты
	{
		TX = 0;
       	NOP();
		NOP();
		uart_delay();
	}
	if(data & 0x04)  //1Ты  1
	{
        NOP();
		TX = 1;
		uart_delay(); 	 
	}
	else //0Ты
	{
		TX = 0;
    	NOP();
	    NOP();
		uart_delay();
	}
	if(data & 0x08)  //1Ты  1
	{
        NOP();
		TX = 1;
		uart_delay(); 	 
	}
	else //0Ты
	{
		TX = 0;
    	NOP();
		NOP();
		uart_delay();
	}
	if(data & 0x10)  //1Ты  1
	{
        NOP();
		TX = 1;
		uart_delay(); 	 
	}
	else //0Ты
	{
		TX = 0;
    	NOP();
		NOP();
		uart_delay();
	}
	if(data & 0x20)  //1Ты  1
	{
        NOP();
		TX = 1;
		uart_delay(); 	 
	}
	else //0Ты
	{
		TX = 0;
    	NOP();
		NOP();
		uart_delay();
	}
	if(data & 0x40)  //1Ты  1
	{
        NOP();
		TX = 1;
		uart_delay(); 	 
	}
	else //0Ты
	{
		TX = 0;
    	NOP();
		NOP();
		uart_delay();
	}
	if(data & 0x80)  //1Ты  1
	{
        NOP();
		TX = 1;
		uart_delay(); 	 
	}
	else //0Ты
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
 
#endif
