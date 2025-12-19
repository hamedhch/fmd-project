//Deviec:FT62F21X
//-----------------------Variable---------------------------------
		_EEReadData		EQU		72H
//		EEPROMwrite@EEAddr		EQU		71H
//		EEPROMwrite@Data		EQU		70H
//		EEPROMwrite@EEAddr		EQU		C00000H
//		EEPROMread@EEAddr		EQU		70H
//		EEPROMread@ReEEPROMread		EQU		71H
//		EEPROMread@EEAddr		EQU		C00000H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	3FDH 			//0000 	3BFD
		ORG		03BAH
		STR 	70H 			//03BA 	01F0

		//;test_ft62f21x_eeprom.C: 48: unsigned char ReEEPROMread;
		//;test_ft62f21x_eeprom.C: 49: EEADR = EEAddr;
		STR 	1BH 			//03BB 	019B

		//;test_ft62f21x_eeprom.C: 50: RD=1;
		BSR 	1CH,0 			//03BC 	181C

		//;test_ft62f21x_eeprom.C: 51: __nop();
		NOP		 					//03BD 	0000

		//;test_ft62f21x_eeprom.C: 52: __nop();
		NOP		 					//03BE 	0000

		//;test_ft62f21x_eeprom.C: 53: __nop();
		NOP		 					//03BF 	0000

		//;test_ft62f21x_eeprom.C: 54: __nop();
		NOP		 					//03C0 	0000

		//;test_ft62f21x_eeprom.C: 55: ReEEPROMread =EEDAT;
		BSR 	STATUS,5 		//03C1 	1A83
		ORG		03C2H
		LDR 	1AH,0 			//03C2 	081A
		STR 	71H 			//03C3 	01F1

		//;test_ft62f21x_eeprom.C: 56: return ReEEPROMread;
		RET		 					//03C4 	0004

		//;test_ft62f21x_eeprom.C: 30: OSCCON = 0B01110000;
		LDWI 	70H 			//03C5 	2A70
		BSR 	STATUS,5 		//03C6 	1A83
		STR 	FH 			//03C7 	018F

		//;test_ft62f21x_eeprom.C: 31: INTCON = 0;
		CLRR 	INTCON 			//03C8 	010B

		//;test_ft62f21x_eeprom.C: 33: PORTA = 0B00000000;
		BCR 	STATUS,5 		//03C9 	1283
		ORG		03CAH
		CLRR 	5H 			//03CA 	0105

		//;test_ft62f21x_eeprom.C: 34: TRISA = 0B00000000;
		BSR 	STATUS,5 		//03CB 	1A83
		CLRR 	5H 			//03CC 	0105

		//;test_ft62f21x_eeprom.C: 35: WPUA = 0B00000000;
		CLRR 	15H 			//03CD 	0115

		//;test_ft62f21x_eeprom.C: 37: OPTION = 0B00001000;
		LDWI 	8H 			//03CE 	2A08
		STR 	1H 			//03CF 	0181

		//;test_ft62f21x_eeprom.C: 38: MSCON = 0B00000000;
		BCR 	STATUS,5 		//03D0 	1283
		CLRR 	1BH 			//03D1 	011B
		ORG		03D2H
		RET		 					//03D2 	0004

		//;test_ft62f21x_eeprom.C: 89: POWER_INITIAL();
		LCALL 	3C5H 			//03D3 	33C5

		//;test_ft62f21x_eeprom.C: 90: EEPROMwrite(0x55,0xaa);
		LDWI 	AAH 			//03D4 	2AAA
		STR 	70H 			//03D5 	01F0
		LDWI 	55H 			//03D6 	2A55
		LCALL 	3E5H 			//03D7 	33E5

		//;test_ft62f21x_eeprom.C: 91: EEPROMwrite(0x55,0xaa);
		LDWI 	AAH 			//03D8 	2AAA
		STR 	70H 			//03D9 	01F0
		ORG		03DAH
		LDWI 	55H 			//03DA 	2A55
		LCALL 	3E5H 			//03DB 	33E5

		//;test_ft62f21x_eeprom.C: 93: EEReadData = EEPROMread(0x12);
		LDWI 	12H 			//03DC 	2A12
		LCALL 	3BAH 			//03DD 	33BA
		STR 	72H 			//03DE 	01F2

		//;test_ft62f21x_eeprom.C: 94: EEPROMwrite(0x13,~EEReadData);
		COMR 	72H,0 			//03DF 	0F72
		STR 	70H 			//03E0 	01F0
		LDWI 	13H 			//03E1 	2A13
		ORG		03E2H
		LCALL 	3E5H 			//03E2 	33E5

		//;test_ft62f21x_eeprom.C: 97: {
		//;test_ft62f21x_eeprom.C: 99: __nop();
		NOP		 					//03E3 	0000
		LJUMP 	3E3H 			//03E4 	3BE3
		STR 	71H 			//03E5 	01F1

		//;test_ft62f21x_eeprom.C: 67: GIE = 0;
		BCR 	INTCON,7 		//03E6 	138B

		//;test_ft62f21x_eeprom.C: 68: while(GIE);
		BTSC 	INTCON,7 		//03E7 	178B
		LJUMP 	3E7H 			//03E8 	3BE7

		//;test_ft62f21x_eeprom.C: 69: EEADR = EEAddr;
		LDR 	71H,0 			//03E9 	0871
		ORG		03EAH
		BSR 	STATUS,5 		//03EA 	1A83
		STR 	1BH 			//03EB 	019B

		//;test_ft62f21x_eeprom.C: 70: EEDAT = Data;
		LDR 	70H,0 			//03EC 	0870
		STR 	1AH 			//03ED 	019A

		//;test_ft62f21x_eeprom.C: 71: EEIF = 0;
		BCR 	STATUS,5 		//03EE 	1283
		BCR 	CH,7 			//03EF 	138C

		//;test_ft62f21x_eeprom.C: 72: EECON1 |= 0x34;
		LDWI 	34H 			//03F0 	2A34
		BSR 	STATUS,5 		//03F1 	1A83
		ORG		03F2H
		IORWR 	1CH,1 			//03F2 	039C

		//;test_ft62f21x_eeprom.C: 73: WR = 1;
		BSR 	1DH,0 			//03F3 	181D

		//;test_ft62f21x_eeprom.C: 74: __nop();
		NOP		 					//03F4 	0000

		//;test_ft62f21x_eeprom.C: 75: __nop();
		NOP		 					//03F5 	0000

		//;test_ft62f21x_eeprom.C: 76: __nop();
		NOP		 					//03F6 	0000

		//;test_ft62f21x_eeprom.C: 77: __nop();
		NOP		 					//03F7 	0000

		//;test_ft62f21x_eeprom.C: 78: while(WR);
		BSR 	STATUS,5 		//03F8 	1A83
		BTSC 	1DH,0 			//03F9 	141D
		ORG		03FAH
		LJUMP 	3F8H 			//03FA 	3BF8

		//;test_ft62f21x_eeprom.C: 79: GIE = 1;
		BSR 	INTCON,7 		//03FB 	1B8B
		RET		 					//03FC 	0004
		CLRR 	72H 			//03FD 	0172
		CLRR 	STATUS 			//03FE 	0103
		LJUMP 	3D3H 			//03FF 	3BD3
			END
