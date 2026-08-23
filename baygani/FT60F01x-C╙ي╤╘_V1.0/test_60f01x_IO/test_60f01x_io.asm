//Deviec:FT60F01X
//-----------------------Variable---------------------------------
//		DelayMs@Time		EQU		72H
//		DelayMs@b		EQU		74H
//		DelayMs@a		EQU		73H
//		DelayMs@Time		EQU		C00000H
//		DelayUs@Time		EQU		70H
//		DelayUs@a		EQU		71H
//		DelayUs@Time		EQU		C00000H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	3FEH 			//0000 	3BFE
		ORG		03CBH
		STR 	70H 			//03CB 	01F0

		//;test_60f01x_io.C: 56: unsigned char a;
		//;test_60f01x_io.C: 57: for(a=0;a<Time;a++)
		CLRR 	71H 			//03CC 	0171
		LDR 	70H,0 			//03CD 	0870
		SUBWR 	71H,0 			//03CE 	0C71
		BTSC 	STATUS,0 		//03CF 	1403
		RET		 					//03D0 	0004

		//;test_60f01x_io.C: 58: {
		//;test_60f01x_io.C: 59: __nop();
		NOP		 					//03D1 	0000
		INCR	71H,1 			//03D2 	09F1
		ORG		03D3H
		LJUMP 	3CDH 			//03D3 	3BCD

		//;test_60f01x_io.C: 87: POWER_INITIAL();
		LCALL 	3DFH 			//03D4 	33DF

		//;test_60f01x_io.C: 89: {
		//;test_60f01x_io.C: 90: PA4 = 1;
		BCR 	STATUS,5 		//03D5 	1283
		BSR 	5H,4 			//03D6 	1A05

		//;test_60f01x_io.C: 91: DelayMs(10);
		LDWI 	AH 			//03D7 	2A0A
		LCALL 	3EEH 			//03D8 	33EE

		//;test_60f01x_io.C: 92: if(PA2 == 1)
		BCR 	STATUS,5 		//03D9 	1283
		BTSC 	5H,2 			//03DA 	1505
		ORG		03DBH

		//;test_60f01x_io.C: 93: {
		//;test_60f01x_io.C: 94: PA4 = 0;
		BCR 	5H,4 			//03DB 	1205

		//;test_60f01x_io.C: 95: }
		//;test_60f01x_io.C: 96: DelayMs(10);
		LDWI 	AH 			//03DC 	2A0A
		LCALL 	3EEH 			//03DD 	33EE
		LJUMP 	3D5H 			//03DE 	3BD5

		//;test_60f01x_io.C: 33: OSCCON = 0B01110000;
		LDWI 	70H 			//03DF 	2A70
		BSR 	STATUS,5 		//03E0 	1A83
		STR 	FH 			//03E1 	018F

		//;test_60f01x_io.C: 35: INTCON = 0;
		CLRR 	INTCON 			//03E2 	010B
		ORG		03E3H

		//;test_60f01x_io.C: 36: OPTION = 0B00001000;
		LDWI 	8H 			//03E3 	2A08
		STR 	1H 			//03E4 	0181

		//;test_60f01x_io.C: 38: PORTA = 0B00000000;
		BCR 	STATUS,5 		//03E5 	1283
		CLRR 	5H 			//03E6 	0105

		//;test_60f01x_io.C: 39: TRISA = 0B00000100;
		LDWI 	4H 			//03E7 	2A04
		BSR 	STATUS,5 		//03E8 	1A83
		STR 	5H 			//03E9 	0185

		//;test_60f01x_io.C: 41: WPUA = 0B00000100;
		STR 	15H 			//03EA 	0195
		ORG		03EBH

		//;test_60f01x_io.C: 43: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//03EB 	1283
		CLRR 	1BH 			//03EC 	011B
		RET		 					//03ED 	0004
		STR 	72H 			//03EE 	01F2

		//;test_60f01x_io.C: 70: unsigned char a,b;
		//;test_60f01x_io.C: 71: for(a=0;a<Time;a++)
		CLRR 	73H 			//03EF 	0173
		LDR 	72H,0 			//03F0 	0872
		SUBWR 	73H,0 			//03F1 	0C73
		BTSC 	STATUS,0 		//03F2 	1403
		ORG		03F3H
		RET		 					//03F3 	0004

		//;test_60f01x_io.C: 72: {
		//;test_60f01x_io.C: 73: for(b=0;b<5;b++)
		CLRR 	74H 			//03F4 	0174

		//;test_60f01x_io.C: 74: {
		//;test_60f01x_io.C: 75: DelayUs(98);
		LDWI 	62H 			//03F5 	2A62
		LCALL 	3CBH 			//03F6 	33CB
		LDWI 	5H 			//03F7 	2A05
		INCR	74H,1 			//03F8 	09F4
		SUBWR 	74H,0 			//03F9 	0C74
		BTSS 	STATUS,0 		//03FA 	1C03
		ORG		03FBH
		LJUMP 	3F5H 			//03FB 	3BF5
		INCR	73H,1 			//03FC 	09F3
		LJUMP 	3F0H 			//03FD 	3BF0
		CLRR 	STATUS 			//03FE 	0103
		LJUMP 	3D4H 			//03FF 	3BD4
			END
