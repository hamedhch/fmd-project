//Deviec:FT60F01X
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
		LJUMP 	1BH 			//0009 	381B
		LJUMP 	0BH 			//000A 	380B
		CLRR 	STATUS 			//000B 	0103
		ORG		000CH
		LJUMP 	29H 			//000C 	3829

		//;test_60f01x_timer0.C: 44: OSCCON = 0B01110000;
		LDWI 	70H 			//000D 	2A70
		BSR 	STATUS,5 		//000E 	1A83
		STR 	FH 			//000F 	018F

		//;test_60f01x_timer0.C: 45: INTCON = 0;
		CLRR 	INTCON 			//0010 	010B

		//;test_60f01x_timer0.C: 46: OPTION = 0B00001000;
		LDWI 	8H 			//0011 	2A08
		STR 	1H 			//0012 	0181

		//;test_60f01x_timer0.C: 48: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0013 	1283
		ORG		0014H
		CLRR 	5H 			//0014 	0105

		//;test_60f01x_timer0.C: 49: TRISA = 0B00000000;
		BSR 	STATUS,5 		//0015 	1A83
		CLRR 	5H 			//0016 	0105

		//;test_60f01x_timer0.C: 51: WPUA = 0B00000000;
		CLRR 	15H 			//0017 	0115

		//;test_60f01x_timer0.C: 52: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//0018 	1283
		CLRR 	1BH 			//0019 	011B
		RET		 					//001A 	0004

		//;test_60f01x_timer0.C: 30: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//001B 	168B
		ORG		001CH
		BTSS 	INTCON,2 		//001C 	1D0B
		LJUMP 	22H 			//001D 	3822

		//;test_60f01x_timer0.C: 31: {
		//;test_60f01x_timer0.C: 32: T0IF = 0;
		BCR 	INTCON,2 		//001E 	110B

		//;test_60f01x_timer0.C: 33: PA4 = ~PA4;
		LDWI 	10H 			//001F 	2A10
		BCR 	STATUS,5 		//0020 	1283
		XORWR 	5H,1 			//0021 	0485
		LDR 	71H,0 			//0022 	0871
		STR 	PCLATH 			//0023 	018A
		ORG		0024H
		SWAPR 	70H,0 			//0024 	0770
		STR 	STATUS 			//0025 	0183
		SWAPR 	7EH,1 			//0026 	07FE
		SWAPR 	7EH,0 			//0027 	077E
		RETI		 			//0028 	0009

		//;test_60f01x_timer0.C: 81: POWER_INITIAL();
		LCALL 	DH 			//0029 	300D

		//;test_60f01x_timer0.C: 82: TIMER0_INITIAL();
		LCALL 	2FH 			//002A 	302F

		//;test_60f01x_timer0.C: 83: GIE = 1;
		BSR 	INTCON,7 		//002B 	1B8B
		ORG		002CH

		//;test_60f01x_timer0.C: 84: T0IE = 1;
		BSR 	INTCON,5 		//002C 	1A8B

		//;test_60f01x_timer0.C: 86: {
		//;test_60f01x_timer0.C: 87: __nop();
		NOP		 					//002D 	0000
		LJUMP 	2DH 			//002E 	382D

		//;test_60f01x_timer0.C: 65: OPTION = 0B00000111;
		LDWI 	7H 			//002F 	2A07
		BSR 	STATUS,5 		//0030 	1A83
		STR 	1H 			//0031 	0181

		//;test_60f01x_timer0.C: 71: T0IF = 0;
		BCR 	INTCON,2 		//0032 	110B
		RET		 					//0033 	0004
			END
