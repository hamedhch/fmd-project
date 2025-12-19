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
		ORG		03CCH
		STR 	70H 			//03CC 	01F0

		//;test_ft62f21x_IO.C: 32: unsigned char a;
		//;test_ft62f21x_IO.C: 33: for(a=0;a<Time;a++)
		CLRR 	71H 			//03CD 	0171
		LDR 	70H,0 			//03CE 	0870
		SUBWR 	71H,0 			//03CF 	0C71
		BTSC 	STATUS,0 		//03D0 	1403
		RET		 					//03D1 	0004

		//;test_ft62f21x_IO.C: 34: {
		//;test_ft62f21x_IO.C: 35: __nop();
		NOP		 					//03D2 	0000
		INCR	71H,1 			//03D3 	09F1
		ORG		03D4H
		LJUMP 	3CEH 			//03D4 	3BCE

		//;test_ft62f21x_IO.C: 81: POWER_INITIAL();
		LCALL 	3E0H 			//03D5 	33E0

		//;test_ft62f21x_IO.C: 84: {
		//;test_ft62f21x_IO.C: 85: PA4 = 1;
		BCR 	STATUS,5 		//03D6 	1283
		BSR 	5H,4 			//03D7 	1A05

		//;test_ft62f21x_IO.C: 86: DelayMs(10);
		LDWI 	AH 			//03D8 	2A0A
		LCALL 	3EEH 			//03D9 	33EE

		//;test_ft62f21x_IO.C: 87: if(PA2 == 1)
		BCR 	STATUS,5 		//03DA 	1283
		BTSC 	5H,2 			//03DB 	1505
		ORG		03DCH

		//;test_ft62f21x_IO.C: 88: {
		//;test_ft62f21x_IO.C: 89: PA4 = 0;
		BCR 	5H,4 			//03DC 	1205

		//;test_ft62f21x_IO.C: 90: }
		//;test_ft62f21x_IO.C: 91: DelayMs(10);
		LDWI 	AH 			//03DD 	2A0A
		LCALL 	3EEH 			//03DE 	33EE
		LJUMP 	3D6H 			//03DF 	3BD6

		//;test_ft62f21x_IO.C: 63: OSCCON = 0B01110001;
		LDWI 	71H 			//03E0 	2A71
		BSR 	STATUS,5 		//03E1 	1A83
		STR 	FH 			//03E2 	018F

		//;test_ft62f21x_IO.C: 64: INTCON = 0;
		CLRR 	INTCON 			//03E3 	010B
		ORG		03E4H

		//;test_ft62f21x_IO.C: 66: OPTION = 0;
		CLRR 	1H 			//03E4 	0101

		//;test_ft62f21x_IO.C: 67: TRISA = 1<<2;
		LDWI 	4H 			//03E5 	2A04
		STR 	5H 			//03E6 	0185

		//;test_ft62f21x_IO.C: 68: PSRCA = 0;
		CLRR 	8H 			//03E7 	0108

		//;test_ft62f21x_IO.C: 69: PSINKA = 0;
		CLRR 	17H 			//03E8 	0117

		//;test_ft62f21x_IO.C: 70: PORTA = 0;
		BCR 	STATUS,5 		//03E9 	1283
		CLRR 	5H 			//03EA 	0105

		//;test_ft62f21x_IO.C: 71: WPUA = 1<<2;
		BSR 	STATUS,5 		//03EB 	1A83
		ORG		03ECH
		STR 	15H 			//03EC 	0195
		RET		 					//03ED 	0004
		STR 	72H 			//03EE 	01F2

		//;test_ft62f21x_IO.C: 46: unsigned char a,b;
		//;test_ft62f21x_IO.C: 47: for(a=0;a<Time;a++)
		CLRR 	73H 			//03EF 	0173
		LDR 	72H,0 			//03F0 	0872
		SUBWR 	73H,0 			//03F1 	0C73
		BTSC 	STATUS,0 		//03F2 	1403
		RET		 					//03F3 	0004
		ORG		03F4H

		//;test_ft62f21x_IO.C: 48: {
		//;test_ft62f21x_IO.C: 49: for(b=0;b<5;b++)
		CLRR 	74H 			//03F4 	0174

		//;test_ft62f21x_IO.C: 50: {
		//;test_ft62f21x_IO.C: 51: DelayUs(98);
		LDWI 	62H 			//03F5 	2A62
		LCALL 	3CCH 			//03F6 	33CC
		LDWI 	5H 			//03F7 	2A05
		INCR	74H,1 			//03F8 	09F4
		SUBWR 	74H,0 			//03F9 	0C74
		BTSS 	STATUS,0 		//03FA 	1C03
		LJUMP 	3F5H 			//03FB 	3BF5
		ORG		03FCH
		INCR	73H,1 			//03FC 	09F3
		LJUMP 	3F0H 			//03FD 	3BF0
		CLRR 	STATUS 			//03FE 	0103
		LJUMP 	3D5H 			//03FF 	3BD5
			END
