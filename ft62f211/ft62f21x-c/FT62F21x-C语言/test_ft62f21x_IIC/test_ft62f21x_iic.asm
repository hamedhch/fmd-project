//Deviec:FT62F21X
//-----------------------Variable---------------------------------
		_IICReadData		EQU		76H
//		IIC_WRITE@address		EQU		75H
//		IIC_WRITE@data		EQU		74H
//		IIC_WRITE@address		EQU		C00000H
//		IIC_READ@address		EQU		74H
//		IIC_READ@iicdata		EQU		75H
//		IIC_READ@address		EQU		C00000H
//		IIC_Wait_Ack@ucErrTime		EQU		72H
//		IIC_Send_Byte@txd		EQU		72H
//		IIC_Send_Byte@t		EQU		73H
//		IIC_Send_Byte@txd		EQU		C00000H
//		IIC_Read_Byte@i		EQU		73H
//		IIC_Read_Byte@receive		EQU		72H
//		DelayUs@Time		EQU		70H
//		DelayUs@a		EQU		71H
//		DelayUs@Time		EQU		C00000H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	3FEH 			//0000 	3BFE
		ORG		0333H
		STR 	70H 			//0333 	01F0

		//;test_ft62f21x_IIC.C: 38: unsigned char a;
		//;test_ft62f21x_IIC.C: 39: for(a=0;a<Time;a++)
		CLRR 	71H 			//0334 	0171
		LDR 	70H,0 			//0335 	0870
		SUBWR 	71H,0 			//0336 	0C71
		BTSC 	STATUS,0 		//0337 	1403
		RET		 					//0338 	0004

		//;test_ft62f21x_IIC.C: 40: {
		//;test_ft62f21x_IIC.C: 41: __nop();
		NOP		 					//0339 	0000
		INCR	71H,1 			//033A 	09F1
		ORG		033BH
		LJUMP 	335H 			//033B 	3B35

		//;test_ft62f21x_IIC.C: 298: POWER_INITIAL();
		LCALL 	346H 			//033C 	3346

		//;test_ft62f21x_IIC.C: 300: IICReadData = IIC_READ(0x12);
		LDWI 	12H 			//033D 	2A12
		LCALL 	3C5H 			//033E 	33C5
		STR 	76H 			//033F 	01F6

		//;test_ft62f21x_IIC.C: 301: IIC_WRITE(0x13,~IICReadData);
		COMR 	76H,0 			//0340 	0F76
		STR 	74H 			//0341 	01F4
		LDWI 	13H 			//0342 	2A13
		ORG		0343H
		LCALL 	381H 			//0343 	3381

		//;test_ft62f21x_IIC.C: 303: {
		//;test_ft62f21x_IIC.C: 304: __nop();
		NOP		 					//0344 	0000
		LJUMP 	344H 			//0345 	3B44

		//;test_ft62f21x_IIC.C: 87: OSCCON = 0B01110001;
		LDWI 	71H 			//0346 	2A71
		BSR 	STATUS,5 		//0347 	1A83
		STR 	FH 			//0348 	018F

		//;test_ft62f21x_IIC.C: 88: INTCON = 0B00000000;
		CLRR 	INTCON 			//0349 	010B

		//;test_ft62f21x_IIC.C: 89: OPTION = 0B00000000;
		CLRR 	1H 			//034A 	0101
		ORG		034BH

		//;test_ft62f21x_IIC.C: 91: TRISA = 0B00001000;
		LDWI 	8H 			//034B 	2A08
		STR 	5H 			//034C 	0185

		//;test_ft62f21x_IIC.C: 92: PSRCA = 0B00000000;
		CLRR 	8H 			//034D 	0108

		//;test_ft62f21x_IIC.C: 98: PSINKA = 0B00000000;
		CLRR 	17H 			//034E 	0117

		//;test_ft62f21x_IIC.C: 99: PORTA = 0B00000000;
		BCR 	STATUS,5 		//034F 	1283
		CLRR 	5H 			//0350 	0105

		//;test_ft62f21x_IIC.C: 100: WPUA = 0B00000000;
		BSR 	STATUS,5 		//0351 	1A83
		CLRR 	15H 			//0352 	0115
		ORG		0353H
		RET		 					//0353 	0004

		//;test_ft62f21x_IIC.C: 188: PA4=0;
		BCR 	STATUS,5 		//0354 	1283
		BCR 	5H,4 			//0355 	1205

		//;test_ft62f21x_IIC.C: 189: TRISA2 =0;
		BSR 	STATUS,5 		//0356 	1A83
		BCR 	5H,2 			//0357 	1105

		//;test_ft62f21x_IIC.C: 190: PA2=1;
		BCR 	STATUS,5 		//0358 	1283
		BSR 	5H,2 			//0359 	1905

		//;test_ft62f21x_IIC.C: 191: DelayUs(5);
		LDWI 	5H 			//035A 	2A05
		ORG		035BH
		LCALL 	333H 			//035B 	3333

		//;test_ft62f21x_IIC.C: 192: PA4=1;
		BCR 	STATUS,5 		//035C 	1283
		BSR 	5H,4 			//035D 	1A05

		//;test_ft62f21x_IIC.C: 193: DelayUs(5);
		LDWI 	5H 			//035E 	2A05
		LCALL 	333H 			//035F 	3333

		//;test_ft62f21x_IIC.C: 194: PA4=0;
		BCR 	STATUS,5 		//0360 	1283
		BCR 	5H,4 			//0361 	1205
		RET		 					//0362 	0004
		ORG		0363H

		//;test_ft62f21x_IIC.C: 111: TRISA2 =0;
		BSR 	STATUS,5 		//0363 	1A83
		BCR 	5H,2 			//0364 	1105

		//;test_ft62f21x_IIC.C: 112: PA2=1;
		BCR 	STATUS,5 		//0365 	1283
		BSR 	5H,2 			//0366 	1905

		//;test_ft62f21x_IIC.C: 113: PA4=1;
		BSR 	5H,4 			//0367 	1A05

		//;test_ft62f21x_IIC.C: 114: DelayUs(10);
		LDWI 	AH 			//0368 	2A0A
		LCALL 	333H 			//0369 	3333

		//;test_ft62f21x_IIC.C: 115: PA2=0;
		BCR 	STATUS,5 		//036A 	1283
		ORG		036BH
		BCR 	5H,2 			//036B 	1105

		//;test_ft62f21x_IIC.C: 116: DelayUs(10);
		LDWI 	AH 			//036C 	2A0A
		LCALL 	333H 			//036D 	3333

		//;test_ft62f21x_IIC.C: 117: PA4=0;
		BCR 	STATUS,5 		//036E 	1283
		BCR 	5H,4 			//036F 	1205

		//;test_ft62f21x_IIC.C: 118: DelayUs(10);
		LDWI 	AH 			//0370 	2A0A
		LJUMP 	333H 			//0371 	3B33

		//;test_ft62f21x_IIC.C: 128: TRISA2 =0;
		BSR 	STATUS,5 		//0372 	1A83
		ORG		0373H
		BCR 	5H,2 			//0373 	1105

		//;test_ft62f21x_IIC.C: 129: PA4=0;
		BCR 	STATUS,5 		//0374 	1283
		BCR 	5H,4 			//0375 	1205

		//;test_ft62f21x_IIC.C: 130: PA2=0;
		BCR 	5H,2 			//0376 	1105

		//;test_ft62f21x_IIC.C: 131: DelayUs(10);
		LDWI 	AH 			//0377 	2A0A
		LCALL 	333H 			//0378 	3333

		//;test_ft62f21x_IIC.C: 132: PA4=1;
		BCR 	STATUS,5 		//0379 	1283
		BSR 	5H,4 			//037A 	1A05
		ORG		037BH

		//;test_ft62f21x_IIC.C: 133: DelayUs(10);
		LDWI 	AH 			//037B 	2A0A
		LCALL 	333H 			//037C 	3333

		//;test_ft62f21x_IIC.C: 134: PA2=1;
		BCR 	STATUS,5 		//037D 	1283
		BSR 	5H,2 			//037E 	1905

		//;test_ft62f21x_IIC.C: 135: DelayUs(10);
		LDWI 	AH 			//037F 	2A0A
		LJUMP 	333H 			//0380 	3B33
		STR 	75H 			//0381 	01F5

		//;test_ft62f21x_IIC.C: 277: IIC_WRITE_Begin:
		//;test_ft62f21x_IIC.C: 278: IIC_Start();
		LCALL 	363H 			//0382 	3363
		ORG		0383H

		//;test_ft62f21x_IIC.C: 279: IIC_Send_Byte(0xa0);
		LDWI 	A0H 			//0383 	2AA0
		LCALL 	3DFH 			//0384 	33DF

		//;test_ft62f21x_IIC.C: 280: if(IIC_Wait_Ack())goto IIC_WRITE_Begin;
		LCALL 	396H 			//0385 	3396
		XORWI 	0H 			//0386 	2600
		BTSS 	STATUS,2 		//0387 	1D03
		LJUMP 	382H 			//0388 	3B82

		//;test_ft62f21x_IIC.C: 282: IIC_Send_Byte(address);
		LDR 	75H,0 			//0389 	0875
		LCALL 	3DFH 			//038A 	33DF
		ORG		038BH

		//;test_ft62f21x_IIC.C: 283: if(IIC_Wait_Ack())goto IIC_WRITE_Begin;
		LCALL 	396H 			//038B 	3396
		XORWI 	0H 			//038C 	2600
		BTSS 	STATUS,2 		//038D 	1D03
		LJUMP 	382H 			//038E 	3B82

		//;test_ft62f21x_IIC.C: 285: IIC_Send_Byte(data);
		LDR 	74H,0 			//038F 	0874
		LCALL 	3DFH 			//0390 	33DF

		//;test_ft62f21x_IIC.C: 286: if(IIC_Wait_Ack())goto IIC_WRITE_Begin;
		LCALL 	396H 			//0391 	3396
		XORWI 	0H 			//0392 	2600
		ORG		0393H
		BTSS 	STATUS,2 		//0393 	1D03
		LJUMP 	382H 			//0394 	3B82

		//;test_ft62f21x_IIC.C: 288: IIC_Stop();
		LJUMP 	372H 			//0395 	3B72

		//;test_ft62f21x_IIC.C: 146: unsigned char ucErrTime=0;
		CLRR 	72H 			//0396 	0172

		//;test_ft62f21x_IIC.C: 147: PA2=1;
		BCR 	STATUS,5 		//0397 	1283
		BSR 	5H,2 			//0398 	1905

		//;test_ft62f21x_IIC.C: 148: TRISA2 =1;
		BSR 	STATUS,5 		//0399 	1A83
		BSR 	5H,2 			//039A 	1905
		ORG		039BH

		//;test_ft62f21x_IIC.C: 149: DelayUs(5);
		LDWI 	5H 			//039B 	2A05
		LCALL 	333H 			//039C 	3333

		//;test_ft62f21x_IIC.C: 150: PA4=1;
		BCR 	STATUS,5 		//039D 	1283
		BSR 	5H,4 			//039E 	1A05

		//;test_ft62f21x_IIC.C: 151: DelayUs(5);
		LDWI 	5H 			//039F 	2A05
		LCALL 	333H 			//03A0 	3333

		//;test_ft62f21x_IIC.C: 152: while(PA2)
		BCR 	STATUS,5 		//03A1 	1283
		BTSS 	5H,2 			//03A2 	1D05
		ORG		03A3H
		LJUMP 	3ABH 			//03A3 	3BAB
		LDWI 	FBH 			//03A4 	2AFB

		//;test_ft62f21x_IIC.C: 153: {
		//;test_ft62f21x_IIC.C: 154: ucErrTime++;
		INCR	72H,1 			//03A5 	09F2

		//;test_ft62f21x_IIC.C: 155: if(ucErrTime>250)
		SUBWR 	72H,0 			//03A6 	0C72
		BTSS 	STATUS,0 		//03A7 	1C03
		LJUMP 	3A1H 			//03A8 	3BA1

		//;test_ft62f21x_IIC.C: 156: {
		//;test_ft62f21x_IIC.C: 157: IIC_Stop();
		LCALL 	372H 			//03A9 	3372

		//;test_ft62f21x_IIC.C: 158: return 1;
		RETW 	1H 			//03AA 	2101
		ORG		03ABH

		//;test_ft62f21x_IIC.C: 159: }
		//;test_ft62f21x_IIC.C: 160: }
		//;test_ft62f21x_IIC.C: 161: PA4=0;
		BCR 	5H,4 			//03AB 	1205

		//;test_ft62f21x_IIC.C: 162: return 0;
		RETW 	0H 			//03AC 	2100

		//;test_ft62f21x_IIC.C: 231: unsigned char i,receive=0;
		CLRR 	72H 			//03AD 	0172

		//;test_ft62f21x_IIC.C: 232: TRISA2 =1;
		BSR 	STATUS,5 		//03AE 	1A83
		BSR 	5H,2 			//03AF 	1905

		//;test_ft62f21x_IIC.C: 233: for(i=0;i<8;i++ )
		CLRR 	73H 			//03B0 	0173

		//;test_ft62f21x_IIC.C: 234: {
		//;test_ft62f21x_IIC.C: 235: PA4=0;
		BCR 	STATUS,5 		//03B1 	1283
		BCR 	5H,4 			//03B2 	1205
		ORG		03B3H

		//;test_ft62f21x_IIC.C: 236: DelayUs(5);
		LDWI 	5H 			//03B3 	2A05
		LCALL 	333H 			//03B4 	3333

		//;test_ft62f21x_IIC.C: 237: PA4=1;
		BCR 	STATUS,5 		//03B5 	1283
		BSR 	5H,4 			//03B6 	1A05

		//;test_ft62f21x_IIC.C: 238: receive<<=1;
		BCR 	STATUS,0 		//03B7 	1003
		RLR 	72H,1 			//03B8 	05F2

		//;test_ft62f21x_IIC.C: 239: if(PA2)receive++;
		BTSC 	5H,2 			//03B9 	1505
		INCR	72H,1 			//03BA 	09F2
		ORG		03BBH

		//;test_ft62f21x_IIC.C: 240: DelayUs(5);
		LDWI 	5H 			//03BB 	2A05
		LCALL 	333H 			//03BC 	3333
		LDWI 	8H 			//03BD 	2A08
		INCR	73H,1 			//03BE 	09F3
		SUBWR 	73H,0 			//03BF 	0C73
		BTSS 	STATUS,0 		//03C0 	1C03
		LJUMP 	3B1H 			//03C1 	3BB1

		//;test_ft62f21x_IIC.C: 241: }
		//;test_ft62f21x_IIC.C: 242: IIC_NAck();
		LCALL 	354H 			//03C2 	3354
		ORG		03C3H

		//;test_ft62f21x_IIC.C: 244: return receive;
		LDR 	72H,0 			//03C3 	0872
		RET		 					//03C4 	0004
		STR 	74H 			//03C5 	01F4

		//;test_ft62f21x_IIC.C: 257: IIC_Start();
		LCALL 	363H 			//03C6 	3363

		//;test_ft62f21x_IIC.C: 258: IIC_Send_Byte(0xa0);
		LDWI 	A0H 			//03C7 	2AA0
		LCALL 	3DFH 			//03C8 	33DF

		//;test_ft62f21x_IIC.C: 259: if(IIC_Wait_Ack())goto IIC_READ_Begin;
		LCALL 	396H 			//03C9 	3396
		XORWI 	0H 			//03CA 	2600
		ORG		03CBH
		BTSS 	STATUS,2 		//03CB 	1D03
		LJUMP 	3C6H 			//03CC 	3BC6

		//;test_ft62f21x_IIC.C: 260: IIC_Send_Byte(address);
		LDR 	74H,0 			//03CD 	0874
		LCALL 	3DFH 			//03CE 	33DF

		//;test_ft62f21x_IIC.C: 261: if(IIC_Wait_Ack())goto IIC_READ_Begin;
		LCALL 	396H 			//03CF 	3396
		XORWI 	0H 			//03D0 	2600
		BTSS 	STATUS,2 		//03D1 	1D03
		LJUMP 	3C6H 			//03D2 	3BC6
		ORG		03D3H

		//;test_ft62f21x_IIC.C: 262: IIC_Start();
		LCALL 	363H 			//03D3 	3363

		//;test_ft62f21x_IIC.C: 263: IIC_Send_Byte(0xa1);
		LDWI 	A1H 			//03D4 	2AA1
		LCALL 	3DFH 			//03D5 	33DF

		//;test_ft62f21x_IIC.C: 264: if(IIC_Wait_Ack())goto IIC_READ_Begin;
		LCALL 	396H 			//03D6 	3396
		XORWI 	0H 			//03D7 	2600
		BTSS 	STATUS,2 		//03D8 	1D03
		LJUMP 	3C6H 			//03D9 	3BC6

		//;test_ft62f21x_IIC.C: 265: iicdata=IIC_Read_Byte();
		LCALL 	3ADH 			//03DA 	33AD
		ORG		03DBH
		STR 	75H 			//03DB 	01F5

		//;test_ft62f21x_IIC.C: 266: IIC_Stop();
		LCALL 	372H 			//03DC 	3372

		//;test_ft62f21x_IIC.C: 267: return iicdata;
		LDR 	75H,0 			//03DD 	0875
		RET		 					//03DE 	0004
		STR 	72H 			//03DF 	01F2

		//;test_ft62f21x_IIC.C: 205: unsigned char t;
		//;test_ft62f21x_IIC.C: 206: TRISA2 =0;
		BSR 	STATUS,5 		//03E0 	1A83
		BCR 	5H,2 			//03E1 	1105

		//;test_ft62f21x_IIC.C: 207: PA4=0;
		BCR 	STATUS,5 		//03E2 	1283
		ORG		03E3H
		BCR 	5H,4 			//03E3 	1205

		//;test_ft62f21x_IIC.C: 208: for(t=0;t<8;t++)
		CLRR 	73H 			//03E4 	0173

		//;test_ft62f21x_IIC.C: 209: {
		//;test_ft62f21x_IIC.C: 210: if(txd&0x80)
		BTSS 	72H,7 			//03E5 	1FF2
		LJUMP 	3EAH 			//03E6 	3BEA

		//;test_ft62f21x_IIC.C: 211: PA2=1;
		BCR 	STATUS,5 		//03E7 	1283
		BSR 	5H,2 			//03E8 	1905
		LJUMP 	3ECH 			//03E9 	3BEC

		//;test_ft62f21x_IIC.C: 212: else
		//;test_ft62f21x_IIC.C: 213: PA2=0;
		BCR 	STATUS,5 		//03EA 	1283
		ORG		03EBH
		BCR 	5H,2 			//03EB 	1105
		LDWI 	5H 			//03EC 	2A05

		//;test_ft62f21x_IIC.C: 214: txd<<=1;
		BCR 	STATUS,0 		//03ED 	1003
		RLR 	72H,1 			//03EE 	05F2

		//;test_ft62f21x_IIC.C: 215: DelayUs(5);
		LCALL 	333H 			//03EF 	3333

		//;test_ft62f21x_IIC.C: 216: PA4=1;
		BCR 	STATUS,5 		//03F0 	1283
		BSR 	5H,4 			//03F1 	1A05

		//;test_ft62f21x_IIC.C: 217: DelayUs(5);
		LDWI 	5H 			//03F2 	2A05
		ORG		03F3H
		LCALL 	333H 			//03F3 	3333

		//;test_ft62f21x_IIC.C: 218: PA4=0;
		BCR 	STATUS,5 		//03F4 	1283
		BCR 	5H,4 			//03F5 	1205

		//;test_ft62f21x_IIC.C: 219: DelayUs(5);
		LDWI 	5H 			//03F6 	2A05
		LCALL 	333H 			//03F7 	3333
		LDWI 	8H 			//03F8 	2A08
		INCR	73H,1 			//03F9 	09F3
		SUBWR 	73H,0 			//03FA 	0C73
		ORG		03FBH
		BTSC 	STATUS,0 		//03FB 	1403
		RET		 					//03FC 	0004
		LJUMP 	3E5H 			//03FD 	3BE5
		CLRR 	STATUS 			//03FE 	0103
		LJUMP 	33CH 			//03FF 	3B3C
			END
