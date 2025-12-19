//Deviec:FT62F21X
//-----------------------Variable---------------------------------
		_SPIReadData		EQU		76H
//		SPI_Write@addr		EQU		73H
//		SPI_Write@dat		EQU		75H
//		SPI_Read@spidata		EQU		75H
//		SPI_Read@addr		EQU		73H
//		SPI_ReadStatus@status		EQU		72H
//		SPI_RW@data		EQU		71H
//		SPI_RW@i		EQU		70H
//		SPI_RW@data		EQU		C00000H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	3FEH 			//0000 	3BFE
		ORG		0388H

		//;test_ft62f21x_SPI.C: 55: PA1=1;
		BSR 	5H,1 			//0388 	1885

		//;test_ft62f21x_SPI.C: 56: PA2=0;
		BCR 	5H,2 			//0389 	1105

		//;test_ft62f21x_SPI.C: 57: PA3=0;
		BCR 	5H,3 			//038A 	1185
		RET		 					//038B 	0004

		//;test_ft62f21x_SPI.C: 103: PA1=0;
		BCR 	5H,1 			//038C 	1085

		//;test_ft62f21x_SPI.C: 104: SPI_RW(0X04);
		LDWI 	4H 			//038D 	2A04
		LCALL 	3E1H 			//038E 	33E1

		//;test_ft62f21x_SPI.C: 105: PA1=1;
		BSR 	5H,1 			//038F 	1885
		ORG		0390H
		RET		 					//0390 	0004

		//;test_ft62f21x_SPI.C: 93: PA1=0;
		BCR 	5H,1 			//0391 	1085

		//;test_ft62f21x_SPI.C: 94: SPI_RW(0X06);
		LDWI 	6H 			//0392 	2A06
		LCALL 	3E1H 			//0393 	33E1

		//;test_ft62f21x_SPI.C: 95: PA1=1;
		BSR 	5H,1 			//0394 	1885
		RET		 					//0395 	0004

		//;test_ft62f21x_SPI.C: 116: PA1=0;
		BCR 	5H,1 			//0396 	1085

		//;test_ft62f21x_SPI.C: 117: SPI_RW(0X05);
		LDWI 	5H 			//0397 	2A05
		ORG		0398H
		LCALL 	3E1H 			//0398 	33E1

		//;test_ft62f21x_SPI.C: 118: status=SPI_RW(0X00);
		LDWI 	0H 			//0399 	2A00
		LCALL 	3E1H 			//039A 	33E1
		STR 	72H 			//039B 	01F2

		//;test_ft62f21x_SPI.C: 119: PA1=1;
		BSR 	5H,1 			//039C 	1885

		//;test_ft62f21x_SPI.C: 120: return status;
		RET		 					//039D 	0004

		//;test_ft62f21x_SPI.C: 37: OSCCON = 0B01110000;
		LDWI 	70H 			//039E 	2A70
		BSR 	STATUS,5 		//039F 	1A83
		ORG		03A0H
		STR 	FH 			//03A0 	018F

		//;test_ft62f21x_SPI.C: 38: INTCON = 0;
		CLRR 	INTCON 			//03A1 	010B

		//;test_ft62f21x_SPI.C: 40: PORTA = 0B00000000;
		BCR 	STATUS,5 		//03A2 	1283
		CLRR 	5H 			//03A3 	0105

		//;test_ft62f21x_SPI.C: 41: TRISA = 0B00010000;
		LDWI 	10H 			//03A4 	2A10
		BSR 	STATUS,5 		//03A5 	1A83
		STR 	5H 			//03A6 	0185

		//;test_ft62f21x_SPI.C: 42: WPUA = 0B00010000;
		STR 	15H 			//03A7 	0195
		ORG		03A8H

		//;test_ft62f21x_SPI.C: 44: OPTION = 0B00001000;
		LDWI 	8H 			//03A8 	2A08
		STR 	1H 			//03A9 	0181

		//;test_ft62f21x_SPI.C: 45: MSCON = 0B00000000;
		BCR 	STATUS,5 		//03AA 	1283
		CLRR 	1BH 			//03AB 	011B
		RET		 					//03AC 	0004

		//;test_ft62f21x_SPI.C: 178: POWER_INITIAL();
		LCALL 	39EH 			//03AD 	339E

		//;test_ft62f21x_SPI.C: 179: init_25c64_io();
		LCALL 	388H 			//03AE 	3388

		//;test_ft62f21x_SPI.C: 180: SPIReadData=SPI_Read(0x0012);
		LDWI 	12H 			//03AF 	2A12
		ORG		03B0H
		STR 	73H 			//03B0 	01F3
		CLRR 	74H 			//03B1 	0174
		LCALL 	3BCH 			//03B2 	33BC
		STR 	76H 			//03B3 	01F6

		//;test_ft62f21x_SPI.C: 181: SPI_Write(0x0013,~SPIReadData);
		LDWI 	13H 			//03B4 	2A13
		STR 	73H 			//03B5 	01F3
		CLRR 	74H 			//03B6 	0174
		COMR 	76H,0 			//03B7 	0F76
		ORG		03B8H
		STR 	75H 			//03B8 	01F5
		LCALL 	3CCH 			//03B9 	33CC

		//;test_ft62f21x_SPI.C: 184: {
		//;test_ft62f21x_SPI.C: 185: __nop();
		NOP		 					//03BA 	0000
		LJUMP 	3BAH 			//03BB 	3BBA

		//;test_ft62f21x_SPI.C: 142: unsigned char spidata;
		//;test_ft62f21x_SPI.C: 143: while(SPI_ReadStatus()&0x01);
		LCALL 	396H 			//03BC 	3396
		ANDWI 	1H 			//03BD 	2401
		BTSS 	STATUS,2 		//03BE 	1D03
		LJUMP 	3BCH 			//03BF 	3BBC
		ORG		03C0H

		//;test_ft62f21x_SPI.C: 144: PA1=0;
		BCR 	5H,1 			//03C0 	1085

		//;test_ft62f21x_SPI.C: 145: SPI_RW(0X03);
		LDWI 	3H 			//03C1 	2A03
		LCALL 	3E1H 			//03C2 	33E1

		//;test_ft62f21x_SPI.C: 146: SPI_RW((unsigned char)((addr)>>8));
		LDR 	74H,0 			//03C3 	0874
		LCALL 	3E1H 			//03C4 	33E1

		//;test_ft62f21x_SPI.C: 147: SPI_RW((unsigned char)addr);
		LDR 	73H,0 			//03C5 	0873
		LCALL 	3E1H 			//03C6 	33E1

		//;test_ft62f21x_SPI.C: 148: spidata=SPI_RW(0X00);
		LDWI 	0H 			//03C7 	2A00
		ORG		03C8H
		LCALL 	3E1H 			//03C8 	33E1
		STR 	75H 			//03C9 	01F5

		//;test_ft62f21x_SPI.C: 149: PA1=1;
		BSR 	5H,1 			//03CA 	1885

		//;test_ft62f21x_SPI.C: 150: return spidata;
		RET		 					//03CB 	0004

		//;test_ft62f21x_SPI.C: 159: while(SPI_ReadStatus()&0x01);
		LCALL 	396H 			//03CC 	3396
		ANDWI 	1H 			//03CD 	2401
		BTSS 	STATUS,2 		//03CE 	1D03
		LJUMP 	3CCH 			//03CF 	3BCC
		ORG		03D0H

		//;test_ft62f21x_SPI.C: 160: WriteEnable();
		LCALL 	391H 			//03D0 	3391

		//;test_ft62f21x_SPI.C: 161: PA1=0;
		BCR 	5H,1 			//03D1 	1085

		//;test_ft62f21x_SPI.C: 162: SPI_RW(0X02);
		LDWI 	2H 			//03D2 	2A02
		LCALL 	3E1H 			//03D3 	33E1

		//;test_ft62f21x_SPI.C: 163: SPI_RW((unsigned char)((addr)>>8));
		LDR 	74H,0 			//03D4 	0874
		LCALL 	3E1H 			//03D5 	33E1

		//;test_ft62f21x_SPI.C: 164: SPI_RW((unsigned char)addr);
		LDR 	73H,0 			//03D6 	0873
		LCALL 	3E1H 			//03D7 	33E1
		ORG		03D8H

		//;test_ft62f21x_SPI.C: 166: SPI_RW(dat); PA1=1;
		LDR 	75H,0 			//03D8 	0875
		LCALL 	3E1H 			//03D9 	33E1
		BSR 	5H,1 			//03DA 	1885

		//;test_ft62f21x_SPI.C: 167: WriteDisable();
		LCALL 	38CH 			//03DB 	338C

		//;test_ft62f21x_SPI.C: 168: while(SPI_ReadStatus()&0x01);
		LCALL 	396H 			//03DC 	3396
		ANDWI 	1H 			//03DD 	2401
		BTSC 	STATUS,2 		//03DE 	1503
		RET		 					//03DF 	0004
		ORG		03E0H
		LJUMP 	3DCH 			//03E0 	3BDC
		STR 	71H 			//03E1 	01F1

		//;test_ft62f21x_SPI.C: 67: unsigned char i;
		//;test_ft62f21x_SPI.C: 68: for(i=0;i<8;i++)
		CLRR 	70H 			//03E2 	0170

		//;test_ft62f21x_SPI.C: 69: {
		//;test_ft62f21x_SPI.C: 70: if(data&0x80)
		BTSS 	71H,7 			//03E3 	1FF1
		LJUMP 	3E7H 			//03E4 	3BE7

		//;test_ft62f21x_SPI.C: 71: PA3=1;
		BSR 	5H,3 			//03E5 	1985
		LJUMP 	3E8H 			//03E6 	3BE8

		//;test_ft62f21x_SPI.C: 72: else
		//;test_ft62f21x_SPI.C: 73: PA3=0;
		BCR 	5H,3 			//03E7 	1185
		ORG		03E8H

		//;test_ft62f21x_SPI.C: 74: __nop();
		NOP		 					//03E8 	0000

		//;test_ft62f21x_SPI.C: 75: data<<=1;
		BCR 	STATUS,0 		//03E9 	1003
		RLR 	71H,1 			//03EA 	05F1

		//;test_ft62f21x_SPI.C: 76: PA2=1;
		BCR 	STATUS,5 		//03EB 	1283
		BSR 	5H,2 			//03EC 	1905

		//;test_ft62f21x_SPI.C: 77: __nop();
		NOP		 					//03ED 	0000

		//;test_ft62f21x_SPI.C: 78: if(PA4)
		BCR 	STATUS,5 		//03EE 	1283
		BTSS 	5H,4 			//03EF 	1E05
		ORG		03F0H
		LJUMP 	3F3H 			//03F0 	3BF3

		//;test_ft62f21x_SPI.C: 79: data|=0x01;
		BSR 	71H,0 			//03F1 	1871
		LJUMP 	3F4H 			//03F2 	3BF4

		//;test_ft62f21x_SPI.C: 80: else
		//;test_ft62f21x_SPI.C: 81: data&=0xFE;
		BCR 	71H,0 			//03F3 	1071

		//;test_ft62f21x_SPI.C: 82: __nop();
		NOP		 					//03F4 	0000

		//;test_ft62f21x_SPI.C: 83: PA2=0;
		BCR 	STATUS,5 		//03F5 	1283
		BCR 	5H,2 			//03F6 	1105
		LDWI 	8H 			//03F7 	2A08
		ORG		03F8H
		INCR	70H,1 			//03F8 	09F0
		SUBWR 	70H,0 			//03F9 	0C70
		BTSS 	STATUS,0 		//03FA 	1C03
		LJUMP 	3E3H 			//03FB 	3BE3

		//;test_ft62f21x_SPI.C: 84: }
		//;test_ft62f21x_SPI.C: 85: return data;
		LDR 	71H,0 			//03FC 	0871
		RET		 					//03FD 	0004
		CLRR 	STATUS 			//03FE 	0103
		LJUMP 	3ADH 			//03FF 	3BAD
			END
