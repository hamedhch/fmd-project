//Deviec:FT62F21X
//-----------------------Variable---------------------------------
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	23H 			//0009 	3823
		LJUMP 	0BH 			//000A 	380B
		CLRR 	STATUS 			//000B 	0103
		ORG		000CH
		LJUMP 	41H 			//000C 	3841

		//;test_ft62f21x_Timer2.C: 67: T2CON0 = 0B00000001;
		LDWI 	1H 			//000D 	2A01
		BCR 	STATUS,5 		//000E 	1283
		STR 	12H 			//000F 	0192

		//;test_ft62f21x_Timer2.C: 69: T2CON1 = 0B00001000;
		LDWI 	8H 			//0010 	2A08
		BSR 	STATUS,5 		//0011 	1A83
		STR 	1EH 			//0012 	019E

		//;test_ft62f21x_Timer2.C: 70: TMR2H = 0;
		BCR 	STATUS,5 		//0013 	1283
		ORG		0014H
		CLRR 	13H 			//0014 	0113

		//;test_ft62f21x_Timer2.C: 71: TMR2L = 0;
		CLRR 	11H 			//0015 	0111

		//;test_ft62f21x_Timer2.C: 72: PR2H =0;
		BSR 	STATUS,5 		//0016 	1A83
		CLRR 	12H 			//0017 	0112

		//;test_ft62f21x_Timer2.C: 73: PR2L = 200;
		LDWI 	C8H 			//0018 	2AC8
		STR 	11H 			//0019 	0191

		//;test_ft62f21x_Timer2.C: 75: TMR2IF = 0;
		BCR 	STATUS,5 		//001A 	1283
		BCR 	CH,1 			//001B 	108C
		ORG		001CH

		//;test_ft62f21x_Timer2.C: 76: TMR2IE = 1;
		BSR 	STATUS,5 		//001C 	1A83
		BSR 	CH,1 			//001D 	188C

		//;test_ft62f21x_Timer2.C: 77: TMR2ON = 1;
		BCR 	STATUS,5 		//001E 	1283
		BSR 	12H,2 			//001F 	1912

		//;test_ft62f21x_Timer2.C: 78: PEIE=1;
		BSR 	INTCON,6 		//0020 	1B0B

		//;test_ft62f21x_Timer2.C: 79: GIE = 1;
		BSR 	INTCON,7 		//0021 	1B8B
		RET		 					//0022 	0004

		//;test_ft62f21x_Timer2.C: 32: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//0023 	1A83
		ORG		0024H
		BTSS 	CH,1 			//0024 	1C8C
		LJUMP 	2CH 			//0025 	382C
		BCR 	STATUS,5 		//0026 	1283
		BTSS 	CH,1 			//0027 	1C8C
		LJUMP 	2CH 			//0028 	382C

		//;test_ft62f21x_Timer2.C: 33: {
		//;test_ft62f21x_Timer2.C: 34: PA4 = ~PA4;
		LDWI 	10H 			//0029 	2A10
		XORWR 	5H,1 			//002A 	0485

		//;test_ft62f21x_Timer2.C: 35: TMR2IF = 0;
		BCR 	CH,1 			//002B 	108C
		ORG		002CH
		LDR 	71H,0 			//002C 	0871
		STR 	PCLATH 			//002D 	018A
		SWAPR 	70H,0 			//002E 	0770
		STR 	STATUS 			//002F 	0183
		SWAPR 	7EH,1 			//0030 	07FE
		SWAPR 	7EH,0 			//0031 	077E
		RETI		 			//0032 	0009

		//;test_ft62f21x_Timer2.C: 47: OSCCON = 0B01110000;
		LDWI 	70H 			//0033 	2A70
		ORG		0034H
		BSR 	STATUS,5 		//0034 	1A83
		STR 	FH 			//0035 	018F

		//;test_ft62f21x_Timer2.C: 52: INTCON = 0;
		CLRR 	INTCON 			//0036 	010B

		//;test_ft62f21x_Timer2.C: 53: OPTION = 0;
		CLRR 	1H 			//0037 	0101

		//;test_ft62f21x_Timer2.C: 54: TRISA = 1<<2;
		LDWI 	4H 			//0038 	2A04
		STR 	5H 			//0039 	0185

		//;test_ft62f21x_Timer2.C: 55: PSRCA = 0;
		CLRR 	8H 			//003A 	0108

		//;test_ft62f21x_Timer2.C: 56: PSINKA = 0;
		CLRR 	17H 			//003B 	0117
		ORG		003CH

		//;test_ft62f21x_Timer2.C: 57: PORTA = 0;
		BCR 	STATUS,5 		//003C 	1283
		CLRR 	5H 			//003D 	0105

		//;test_ft62f21x_Timer2.C: 58: WPUA = 1<<2;
		BSR 	STATUS,5 		//003E 	1A83
		STR 	15H 			//003F 	0195
		RET		 					//0040 	0004

		//;test_ft62f21x_Timer2.C: 89: POWER_INITIAL();
		LCALL 	33H 			//0041 	3033

		//;test_ft62f21x_Timer2.C: 91: TIMER2_INITIAL();
		LCALL 	DH 			//0042 	300D
		LJUMP 	46H 			//0043 	3846
		ORG		0044H

		//;test_ft62f21x_Timer2.C: 96: {
		//;test_ft62f21x_Timer2.C: 97: TMR2IE = 1;
		BSR 	STATUS,5 		//0044 	1A83
		BSR 	CH,1 			//0045 	188C

		//;test_ft62f21x_Timer2.C: 98: }
		//;test_ft62f21x_Timer2.C: 94: {
		//;test_ft62f21x_Timer2.C: 95: if(PA2 == 1)
		BCR 	STATUS,5 		//0046 	1283
		BTSC 	5H,2 			//0047 	1505
		LJUMP 	44H 			//0048 	3844

		//;test_ft62f21x_Timer2.C: 99: else
		//;test_ft62f21x_Timer2.C: 100: {
		//;test_ft62f21x_Timer2.C: 101: TMR2IE = 0;
		BSR 	STATUS,5 		//0049 	1A83
		BCR 	CH,1 			//004A 	108C

		//;test_ft62f21x_Timer2.C: 102: PA4 = 1;
		BCR 	STATUS,5 		//004B 	1283
		ORG		004CH
		BSR 	5H,4 			//004C 	1A05
		LJUMP 	46H 			//004D 	3846
			END
