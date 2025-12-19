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
		ORG		03BFH
		CLRWDT	 			//03BF 	0001

		//;test_ft62f21x_WDT.C: 85: WDTCON = (0X05<<1)| (1<<0);
		LDWI 	BH 			//03C0 	2A0B
		BCR 	STATUS,5 		//03C1 	1283
		STR 	18H 			//03C2 	0198

		//;test_ft62f21x_WDT.C: 89: OPTION = 0;
		BSR 	STATUS,5 		//03C3 	1A83
		CLRR 	1H 			//03C4 	0101

		//;test_ft62f21x_WDT.C: 90: PSA = 1;
		BSR 	1H,3 			//03C5 	1981
		RET		 					//03C6 	0004
		ORG		03C7H
		STR 	70H 			//03C7 	01F0

		//;test_ft62f21x_WDT.C: 53: unsigned char a;
		//;test_ft62f21x_WDT.C: 54: for(a=0;a<Time;a++)
		CLRR 	71H 			//03C8 	0171
		LDR 	70H,0 			//03C9 	0870
		SUBWR 	71H,0 			//03CA 	0C71
		BTSC 	STATUS,0 		//03CB 	1403
		RET		 					//03CC 	0004

		//;test_ft62f21x_WDT.C: 55: {
		//;test_ft62f21x_WDT.C: 56: __nop();
		NOP		 					//03CD 	0000
		INCR	71H,1 			//03CE 	09F1
		ORG		03CFH
		LJUMP 	3C9H 			//03CF 	3BC9

		//;test_ft62f21x_WDT.C: 33: OSCCON = 0B01110001;
		LDWI 	71H 			//03D0 	2A71
		BSR 	STATUS,5 		//03D1 	1A83
		STR 	FH 			//03D2 	018F

		//;test_ft62f21x_WDT.C: 37: INTCON = 0B00000000;
		CLRR 	INTCON 			//03D3 	010B

		//;test_ft62f21x_WDT.C: 39: TRISA = 0B00000000;
		CLRR 	5H 			//03D4 	0105

		//;test_ft62f21x_WDT.C: 40: PSRCA = 0B00000000;
		CLRR 	8H 			//03D5 	0108

		//;test_ft62f21x_WDT.C: 41: PSINKA = 0B00000000;
		CLRR 	17H 			//03D6 	0117
		ORG		03D7H

		//;test_ft62f21x_WDT.C: 42: PORTA = 0B00000000;
		BCR 	STATUS,5 		//03D7 	1283
		CLRR 	5H 			//03D8 	0105

		//;test_ft62f21x_WDT.C: 43: WPUA = 0B00000000;
		BSR 	STATUS,5 		//03D9 	1A83
		CLRR 	15H 			//03DA 	0115
		RET		 					//03DB 	0004
		STR 	72H 			//03DC 	01F2

		//;test_ft62f21x_WDT.C: 67: unsigned char a,b;
		//;test_ft62f21x_WDT.C: 68: for(a=0;a<Time;a++)
		CLRR 	73H 			//03DD 	0173
		LDR 	72H,0 			//03DE 	0872
		ORG		03DFH
		SUBWR 	73H,0 			//03DF 	0C73
		BTSC 	STATUS,0 		//03E0 	1403
		RET		 					//03E1 	0004

		//;test_ft62f21x_WDT.C: 69: {
		//;test_ft62f21x_WDT.C: 70: for(b=0;b<5;b++)
		CLRR 	74H 			//03E2 	0174

		//;test_ft62f21x_WDT.C: 71: {
		//;test_ft62f21x_WDT.C: 72: DelayUs(98);
		LDWI 	62H 			//03E3 	2A62
		LCALL 	3C7H 			//03E4 	33C7
		LDWI 	5H 			//03E5 	2A05
		INCR	74H,1 			//03E6 	09F4
		ORG		03E7H
		SUBWR 	74H,0 			//03E7 	0C74
		BTSS 	STATUS,0 		//03E8 	1C03
		LJUMP 	3E3H 			//03E9 	3BE3
		INCR	73H,1 			//03EA 	09F3
		LJUMP 	3DEH 			//03EB 	3BDE

		//;test_ft62f21x_WDT.C: 100: POWER_INITIAL();
		LCALL 	3D0H 			//03EC 	33D0

		//;test_ft62f21x_WDT.C: 101: WDT_INITIAL();
		LCALL 	3BFH 			//03ED 	33BF

		//;test_ft62f21x_WDT.C: 103: PA4 = 1;
		BCR 	STATUS,5 		//03EE 	1283
		ORG		03EFH
		BSR 	5H,4 			//03EF 	1A05

		//;test_ft62f21x_WDT.C: 104: DelayMs(3);
		LDWI 	3H 			//03F0 	2A03
		LCALL 	3DCH 			//03F1 	33DC

		//;test_ft62f21x_WDT.C: 105: PA4 = 0;
		BCR 	STATUS,5 		//03F2 	1283
		BCR 	5H,4 			//03F3 	1205

		//;test_ft62f21x_WDT.C: 106: DelayMs(3);
		LDWI 	3H 			//03F4 	2A03
		LCALL 	3DCH 			//03F5 	33DC

		//;test_ft62f21x_WDT.C: 109: {
		//;test_ft62f21x_WDT.C: 111: PA4 = 1;
		BCR 	STATUS,5 		//03F6 	1283
		ORG		03F7H
		BSR 	5H,4 			//03F7 	1A05

		//;test_ft62f21x_WDT.C: 112: DelayMs(1);
		LDWI 	1H 			//03F8 	2A01
		LCALL 	3DCH 			//03F9 	33DC

		//;test_ft62f21x_WDT.C: 113: PA4 = 0;
		BCR 	STATUS,5 		//03FA 	1283
		BCR 	5H,4 			//03FB 	1205

		//;test_ft62f21x_WDT.C: 114: DelayMs(1);
		LDWI 	1H 			//03FC 	2A01
		LJUMP 	3F5H 			//03FD 	3BF5
		CLRR 	STATUS 			//03FE 	0103
		ORG		03FFH
		LJUMP 	3ECH 			//03FF 	3BEC
			END
