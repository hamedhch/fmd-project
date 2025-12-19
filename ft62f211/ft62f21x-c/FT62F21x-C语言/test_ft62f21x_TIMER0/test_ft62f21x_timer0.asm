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
		LJUMP 	0DH 			//0009 	380D
		LJUMP 	0BH 			//000A 	380B
		CLRR 	STATUS 			//000B 	0103
		ORG		000CH
		LJUMP 	32H 			//000C 	3832

		//;test_ft62f21x_Timer0.C: 29: if(INTCON & 0x04)
		BTSS 	INTCON,2 		//000D 	1D0B
		LJUMP 	14H 			//000E 	3814

		//;test_ft62f21x_Timer0.C: 30: {
		//;test_ft62f21x_Timer0.C: 31: PA4 = ~PA4;
		LDWI 	10H 			//000F 	2A10
		BCR 	STATUS,5 		//0010 	1283
		XORWR 	5H,1 			//0011 	0485

		//;test_ft62f21x_Timer0.C: 32: INTCON &= ~(1<<2);
		BCR 	INTCON,2 		//0012 	110B

		//;test_ft62f21x_Timer0.C: 33: TMR0 =0;
		CLRR 	1H 			//0013 	0101
		ORG		0014H
		LDR 	71H,0 			//0014 	0871
		STR 	PCLATH 			//0015 	018A
		SWAPR 	70H,0 			//0016 	0770
		STR 	STATUS 			//0017 	0183
		SWAPR 	7EH,1 			//0018 	07FE
		SWAPR 	7EH,0 			//0019 	077E
		RETI		 			//001A 	0009

		//;test_ft62f21x_Timer0.C: 64: OSCCON = 0B01110000;
		LDWI 	70H 			//001B 	2A70
		ORG		001CH
		BSR 	STATUS,5 		//001C 	1A83
		STR 	FH 			//001D 	018F

		//;test_ft62f21x_Timer0.C: 65: INTCON = 0;
		CLRR 	INTCON 			//001E 	010B

		//;test_ft62f21x_Timer0.C: 66: OPTION = 0;
		CLRR 	1H 			//001F 	0101

		//;test_ft62f21x_Timer0.C: 68: TRISA = 0;
		CLRR 	5H 			//0020 	0105

		//;test_ft62f21x_Timer0.C: 69: PSRCA = 0;
		CLRR 	8H 			//0021 	0108

		//;test_ft62f21x_Timer0.C: 75: PSINKA = 0;
		CLRR 	17H 			//0022 	0117

		//;test_ft62f21x_Timer0.C: 76: PORTA = 0;
		BCR 	STATUS,5 		//0023 	1283
		ORG		0024H
		CLRR 	5H 			//0024 	0105

		//;test_ft62f21x_Timer0.C: 77: WPUA = 0;
		BSR 	STATUS,5 		//0025 	1A83
		CLRR 	15H 			//0026 	0115
		RET		 					//0027 	0004

		//;test_ft62f21x_Timer0.C: 44: T0ON = 0;
		BCR 	STATUS,5 		//0028 	1283
		BCR 	1FH,3 			//0029 	119F

		//;test_ft62f21x_Timer0.C: 45: TMR0 = 0;
		CLRR 	1H 			//002A 	0101

		//;test_ft62f21x_Timer0.C: 46: T0CON0 = 0B00000000;
		CLRR 	1FH 			//002B 	011F
		ORG		002CH

		//;test_ft62f21x_Timer0.C: 47: OPTION = 0B00000111;
		LDWI 	7H 			//002C 	2A07
		BSR 	STATUS,5 		//002D 	1A83
		STR 	1H 			//002E 	0181

		//;test_ft62f21x_Timer0.C: 54: T0ON = 1;
		BCR 	STATUS,5 		//002F 	1283
		BSR 	1FH,3 			//0030 	199F
		RET		 					//0031 	0004

		//;test_ft62f21x_Timer0.C: 87: POWER_INITIAL();
		LCALL 	1BH 			//0032 	301B

		//;test_ft62f21x_Timer0.C: 88: TIMER0_INITIAL();
		LCALL 	28H 			//0033 	3028
		ORG		0034H

		//;test_ft62f21x_Timer0.C: 90: GIE = 1;
		BSR 	INTCON,7 		//0034 	1B8B

		//;test_ft62f21x_Timer0.C: 91: T0IE = 1;
		BSR 	INTCON,5 		//0035 	1A8B

		//;test_ft62f21x_Timer0.C: 94: {
		//;test_ft62f21x_Timer0.C: 95: __nop();
		NOP		 					//0036 	0000
		LJUMP 	36H 			//0037 	3836
			END
