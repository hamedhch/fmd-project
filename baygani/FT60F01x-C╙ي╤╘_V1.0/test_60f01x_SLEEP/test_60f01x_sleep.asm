//Deviec:FT60F01X
//-----------------------Variable---------------------------------
//		DelayS@Time		EQU		75H
//		DelayS@b		EQU		77H
//		DelayS@a		EQU		76H
//		DelayS@Time		EQU		C00000H
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
		ORG		03BAH
		STR 	70H 			//03BA 	01F0

		//;test_60f01x_sleep.C: 53: unsigned char a;
		//;test_60f01x_sleep.C: 54: for(a=0;a<Time;a++)
		CLRR 	71H 			//03BB 	0171
		LDR 	70H,0 			//03BC 	0870
		SUBWR 	71H,0 			//03BD 	0C71
		BTSC 	STATUS,0 		//03BE 	1403
		RET		 					//03BF 	0004
		CLRWDT	 			//03C0 	0001
		INCR	71H,1 			//03C1 	09F1
		ORG		03C2H
		LJUMP 	3BCH 			//03C2 	3BBC

		//;test_60f01x_sleep.C: 101: POWER_INITIAL();
		LCALL 	3D0H 			//03C3 	33D0

		//;test_60f01x_sleep.C: 102: PA1 = 1;
		BSR 	5H,1 			//03C4 	1885

		//;test_60f01x_sleep.C: 103: PA0 = 1;
		BSR 	5H,0 			//03C5 	1805

		//;test_60f01x_sleep.C: 104: DelayS(4);
		LDWI 	4H 			//03C6 	2A04
		LCALL 	3EEH 			//03C7 	33EE

		//;test_60f01x_sleep.C: 105: PA1 = 0;
		BCR 	STATUS,5 		//03C8 	1283
		BCR 	5H,1 			//03C9 	1085
		ORG		03CAH

		//;test_60f01x_sleep.C: 106: PA0 = 0;
		BCR 	5H,0 			//03CA 	1005

		//;test_60f01x_sleep.C: 107: while(1)
		CLRWDT	 			//03CB 	0001

		//;test_60f01x_sleep.C: 110: __nop();
		NOP		 					//03CC 	0000
		SLEEP	 			//03CD 	0002

		//;test_60f01x_sleep.C: 112: __nop();
		NOP		 					//03CE 	0000
		LJUMP 	3CBH 			//03CF 	3BCB

		//;test_60f01x_sleep.C: 32: OSCCON = 0B01110000;
		LDWI 	70H 			//03D0 	2A70
		BSR 	STATUS,5 		//03D1 	1A83
		ORG		03D2H
		STR 	FH 			//03D2 	018F

		//;test_60f01x_sleep.C: 33: INTCON = 0;
		CLRR 	INTCON 			//03D3 	010B

		//;test_60f01x_sleep.C: 34: OPTION = 0B00001000;
		LDWI 	8H 			//03D4 	2A08
		STR 	1H 			//03D5 	0181

		//;test_60f01x_sleep.C: 36: PORTA = 0B00000000;
		BCR 	STATUS,5 		//03D6 	1283
		CLRR 	5H 			//03D7 	0105

		//;test_60f01x_sleep.C: 37: TRISA = 0B00000000;
		BSR 	STATUS,5 		//03D8 	1A83
		CLRR 	5H 			//03D9 	0105
		ORG		03DAH

		//;test_60f01x_sleep.C: 38: WPUA = 0B00000000;
		CLRR 	15H 			//03DA 	0115

		//;test_60f01x_sleep.C: 40: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//03DB 	1283
		CLRR 	1BH 			//03DC 	011B
		RET		 					//03DD 	0004
		STR 	72H 			//03DE 	01F2

		//;test_60f01x_sleep.C: 67: unsigned char a,b;
		//;test_60f01x_sleep.C: 68: for(a=0;a<Time;a++)
		CLRR 	73H 			//03DF 	0173
		LDR 	72H,0 			//03E0 	0872
		SUBWR 	73H,0 			//03E1 	0C73
		ORG		03E2H
		BTSC 	STATUS,0 		//03E2 	1403
		RET		 					//03E3 	0004

		//;test_60f01x_sleep.C: 69: {
		//;test_60f01x_sleep.C: 70: for(b=0;b<5;b++)
		CLRR 	74H 			//03E4 	0174

		//;test_60f01x_sleep.C: 71: {
		//;test_60f01x_sleep.C: 72: DelayUs(98);
		LDWI 	62H 			//03E5 	2A62
		LCALL 	3BAH 			//03E6 	33BA
		LDWI 	5H 			//03E7 	2A05
		INCR	74H,1 			//03E8 	09F4
		SUBWR 	74H,0 			//03E9 	0C74
		ORG		03EAH
		BTSS 	STATUS,0 		//03EA 	1C03
		LJUMP 	3E5H 			//03EB 	3BE5
		INCR	73H,1 			//03EC 	09F3
		LJUMP 	3E0H 			//03ED 	3BE0
		STR 	75H 			//03EE 	01F5

		//;test_60f01x_sleep.C: 84: unsigned char a,b;
		//;test_60f01x_sleep.C: 85: for(a=0;a<Time;a++)
		CLRR 	76H 			//03EF 	0176
		LDR 	75H,0 			//03F0 	0875
		SUBWR 	76H,0 			//03F1 	0C76
		ORG		03F2H
		BTSC 	STATUS,0 		//03F2 	1403
		RET		 					//03F3 	0004

		//;test_60f01x_sleep.C: 86: {
		//;test_60f01x_sleep.C: 87: for(b=0;b<10;b++)
		CLRR 	77H 			//03F4 	0177

		//;test_60f01x_sleep.C: 88: {
		//;test_60f01x_sleep.C: 89: DelayMs(100);
		LDWI 	64H 			//03F5 	2A64
		LCALL 	3DEH 			//03F6 	33DE
		LDWI 	AH 			//03F7 	2A0A
		INCR	77H,1 			//03F8 	09F7
		SUBWR 	77H,0 			//03F9 	0C77
		ORG		03FAH
		BTSS 	STATUS,0 		//03FA 	1C03
		LJUMP 	3F5H 			//03FB 	3BF5
		INCR	76H,1 			//03FC 	09F6
		LJUMP 	3F0H 			//03FD 	3BF0
		CLRR 	STATUS 			//03FE 	0103
		LJUMP 	3C3H 			//03FF 	3BC3
			END
