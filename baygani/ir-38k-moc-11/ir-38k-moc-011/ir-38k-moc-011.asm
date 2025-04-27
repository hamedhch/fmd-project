//Deviec:FT60F01X
//-----------------------Variable---------------------------------
//-----------------------Variable END---------------------------------

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
		LJUMP 	3FH 			//000C 	383F

		//;ir-38k-moc-011.C: 43: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//000D 	1A83
		BTSS 	CH,1 			//000E 	1C8C
		LJUMP 	19H 			//000F 	3819
		BCR 	STATUS,5 		//0010 	1283
		BTSS 	CH,1 			//0011 	1C8C
		LJUMP 	19H 			//0012 	3819

		//;ir-38k-moc-011.C: 44: {
		//;ir-38k-moc-011.C: 45: TMR2IF = 0;
		BCR 	CH,1 			//0013 	108C

		//;ir-38k-moc-011.C: 46: TMR2IE = 1;
		BSR 	STATUS,5 		//0014 	1A83
		BSR 	CH,1 			//0015 	188C

		//;ir-38k-moc-011.C: 48: PA4=~PA4;
		LDWI 	10H 			//0016 	2A10
		BCR 	STATUS,5 		//0017 	1283
		XORWR 	5H,1 			//0018 	0485
		LDR 	71H,0 			//0019 	0871
		STR 	PCLATH 			//001A 	018A
		SWAPR 	70H,0 			//001B 	0770
		STR 	STATUS 			//001C 	0183
		SWAPR 	7EH,1 			//001D 	07FE
		SWAPR 	7EH,0 			//001E 	077E
		RETI		 			//001F 	0009

		//;ir-38k-moc-011.C: 75: OSCCON = 0B01110000;
		LDWI 	70H 			//0020 	2A70
		BSR 	STATUS,5 		//0021 	1A83
		STR 	FH 			//0022 	018F

		//;ir-38k-moc-011.C: 77: INTCON = 0;
		CLRR 	INTCON 			//0023 	010B

		//;ir-38k-moc-011.C: 78: OPTION = 0B00001000;
		LDWI 	8H 			//0024 	2A08
		STR 	1H 			//0025 	0181

		//;ir-38k-moc-011.C: 80: PORTA = 0B00100000;
		LDWI 	20H 			//0026 	2A20
		BCR 	STATUS,5 		//0027 	1283
		STR 	5H 			//0028 	0185

		//;ir-38k-moc-011.C: 81: TRISA = 0B00001010;
		LDWI 	AH 			//0029 	2A0A
		BSR 	STATUS,5 		//002A 	1A83
		STR 	5H 			//002B 	0185

		//;ir-38k-moc-011.C: 83: WPUA = 0B00000000;
		CLRR 	15H 			//002C 	0115

		//;ir-38k-moc-011.C: 85: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//002D 	1283
		CLRR 	1BH 			//002E 	011B
		RET		 					//002F 	0004

		//;ir-38k-moc-011.C: 98: T2CON = 0B00000001;
		LDWI 	1H 			//0030 	2A01
		STR 	12H 			//0031 	0192

		//;ir-38k-moc-011.C: 103: TMR2 = 0;
		CLRR 	11H 			//0032 	0111

		//;ir-38k-moc-011.C: 104: PR2 = 63;
		LDWI 	3FH 			//0033 	2A3F
		BSR 	STATUS,5 		//0034 	1A83
		STR 	12H 			//0035 	0192

		//;ir-38k-moc-011.C: 105: TMR2IF = 0;
		BCR 	STATUS,5 		//0036 	1283
		BCR 	CH,1 			//0037 	108C

		//;ir-38k-moc-011.C: 106: TMR2IE = 1;
		BSR 	STATUS,5 		//0038 	1A83
		BSR 	CH,1 			//0039 	188C

		//;ir-38k-moc-011.C: 107: TMR2ON = 1;
		BCR 	STATUS,5 		//003A 	1283
		BSR 	12H,2 			//003B 	1912

		//;ir-38k-moc-011.C: 108: PEIE=1;
		BSR 	INTCON,6 		//003C 	1B0B

		//;ir-38k-moc-011.C: 109: GIE = 1;
		BSR 	INTCON,7 		//003D 	1B8B
		RET		 					//003E 	0004

		//;ir-38k-moc-011.C: 119: POWER_INITIAL();
		LCALL 	20H 			//003F 	3020

		//;ir-38k-moc-011.C: 120: TIMER2_INITIAL();
		LCALL 	30H 			//0040 	3030

		//;ir-38k-moc-011.C: 122: while(1)
		//;ir-38k-moc-011.C: 123: {
		LJUMP 	41H 			//0041 	3841
			END
