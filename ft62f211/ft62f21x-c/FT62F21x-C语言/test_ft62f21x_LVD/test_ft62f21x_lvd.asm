//Deviec:FT62F21X
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
		ORG		03C0H
		STR 	70H 			//03C0 	01F0

		//;test_ft62f21x_LVD.C: 29: unsigned char a;
		//;test_ft62f21x_LVD.C: 30: for(a=0;a<Time;a++)
		CLRR 	71H 			//03C1 	0171
		LDR 	70H,0 			//03C2 	0870
		SUBWR 	71H,0 			//03C3 	0C71
		BTSC 	STATUS,0 		//03C4 	1403
		RET		 					//03C5 	0004

		//;test_ft62f21x_LVD.C: 31: {
		//;test_ft62f21x_LVD.C: 32: __nop();
		NOP		 					//03C6 	0000
		INCR	71H,1 			//03C7 	09F1
		ORG		03C8H
		LJUMP 	3C2H 			//03C8 	3BC2

		//;test_ft62f21x_LVD.C: 60: OSCCON = 0B01110000;
		LDWI 	70H 			//03C9 	2A70
		BSR 	STATUS,5 		//03CA 	1A83
		STR 	FH 			//03CB 	018F

		//;test_ft62f21x_LVD.C: 61: INTCON = 0;
		CLRR 	INTCON 			//03CC 	010B

		//;test_ft62f21x_LVD.C: 62: OPTION = 0;
		CLRR 	1H 			//03CD 	0101

		//;test_ft62f21x_LVD.C: 63: TRISA = 0;
		CLRR 	5H 			//03CE 	0105

		//;test_ft62f21x_LVD.C: 64: PSRCA = 0;
		CLRR 	8H 			//03CF 	0108
		ORG		03D0H

		//;test_ft62f21x_LVD.C: 71: PSINKA = 0;
		CLRR 	17H 			//03D0 	0117

		//;test_ft62f21x_LVD.C: 72: PORTA = 0;
		BCR 	STATUS,5 		//03D1 	1283
		CLRR 	5H 			//03D2 	0105

		//;test_ft62f21x_LVD.C: 73: WPUA = 0;
		BSR 	STATUS,5 		//03D3 	1A83
		CLRR 	15H 			//03D4 	0115

		//;test_ft62f21x_LVD.C: 75: PCON = (0<<4) | (1<<3);
		LDWI 	8H 			//03D5 	2A08
		STR 	EH 			//03D6 	018E
		RET		 					//03D7 	0004
		ORG		03D8H
		STR 	72H 			//03D8 	01F2

		//;test_ft62f21x_LVD.C: 43: unsigned char a,b;
		//;test_ft62f21x_LVD.C: 44: for(a=0;a<Time;a++)
		CLRR 	73H 			//03D9 	0173
		LDR 	72H,0 			//03DA 	0872
		SUBWR 	73H,0 			//03DB 	0C73
		BTSC 	STATUS,0 		//03DC 	1403
		RET		 					//03DD 	0004

		//;test_ft62f21x_LVD.C: 45: {
		//;test_ft62f21x_LVD.C: 46: for(b=0;b<5;b++)
		CLRR 	74H 			//03DE 	0174

		//;test_ft62f21x_LVD.C: 47: {
		//;test_ft62f21x_LVD.C: 48: DelayUs(98);
		LDWI 	62H 			//03DF 	2A62
		ORG		03E0H
		LCALL 	3C0H 			//03E0 	33C0
		LDWI 	5H 			//03E1 	2A05
		INCR	74H,1 			//03E2 	09F4
		SUBWR 	74H,0 			//03E3 	0C74
		BTSS 	STATUS,0 		//03E4 	1C03
		LJUMP 	3DFH 			//03E5 	3BDF
		INCR	73H,1 			//03E6 	09F3
		LJUMP 	3DAH 			//03E7 	3BDA
		ORG		03E8H

		//;test_ft62f21x_LVD.C: 87: POWER_INITIAL();
		LCALL 	3C9H 			//03E8 	33C9

		//;test_ft62f21x_LVD.C: 90: {
		//;test_ft62f21x_LVD.C: 91: if(PCON & 0X04)
		BSR 	STATUS,5 		//03E9 	1A83
		BTSS 	EH,2 			//03EA 	1D0E
		LJUMP 	3F4H 			//03EB 	3BF4

		//;test_ft62f21x_LVD.C: 92: {
		//;test_ft62f21x_LVD.C: 93: PA4 = 1;
		BCR 	STATUS,5 		//03EC 	1283
		BSR 	5H,4 			//03ED 	1A05

		//;test_ft62f21x_LVD.C: 94: DelayMs(3);
		LDWI 	3H 			//03EE 	2A03
		LCALL 	3D8H 			//03EF 	33D8
		ORG		03F0H

		//;test_ft62f21x_LVD.C: 95: PA4 = 0;
		BCR 	STATUS,5 		//03F0 	1283
		BCR 	5H,4 			//03F1 	1205

		//;test_ft62f21x_LVD.C: 96: DelayMs(3);
		LDWI 	3H 			//03F2 	2A03
		LJUMP 	3FBH 			//03F3 	3BFB

		//;test_ft62f21x_LVD.C: 97: }
		//;test_ft62f21x_LVD.C: 98: else
		//;test_ft62f21x_LVD.C: 99: {
		//;test_ft62f21x_LVD.C: 100: PA4 = 1;
		BCR 	STATUS,5 		//03F4 	1283
		BSR 	5H,4 			//03F5 	1A05

		//;test_ft62f21x_LVD.C: 101: DelayMs(1);
		LDWI 	1H 			//03F6 	2A01
		LCALL 	3D8H 			//03F7 	33D8
		ORG		03F8H

		//;test_ft62f21x_LVD.C: 102: PA4 = 0;
		BCR 	STATUS,5 		//03F8 	1283
		BCR 	5H,4 			//03F9 	1205

		//;test_ft62f21x_LVD.C: 103: DelayMs(1);
		LDWI 	1H 			//03FA 	2A01
		LCALL 	3D8H 			//03FB 	33D8

		//;test_ft62f21x_LVD.C: 104: }
		//;test_ft62f21x_LVD.C: 105: __nop();
		NOP		 					//03FC 	0000
		LJUMP 	3E9H 			//03FD 	3BE9
		CLRR 	STATUS 			//03FE 	0103
		LJUMP 	3E8H 			//03FF 	3BE8
			END
