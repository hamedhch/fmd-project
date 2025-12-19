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
		LJUMP 	38H 			//0009 	3838
		LJUMP 	0BH 			//000A 	380B
		CLRR 	STATUS 			//000B 	0103
		ORG		000CH
		LJUMP 	46H 			//000C 	3846

		//;test_62f21x_PWM.C: 60: T2CON0=0B00000001;
		LDWI 	1H 			//000D 	2A01
		STR 	12H 			//000E 	0192

		//;test_62f21x_PWM.C: 66: T2CON1=0B00000000;
		BSR 	STATUS,5 		//000F 	1A83
		CLRR 	1EH 			//0010 	011E

		//;test_62f21x_PWM.C: 76: TMR2H=0;
		BCR 	STATUS,5 		//0011 	1283
		CLRR 	13H 			//0012 	0113

		//;test_62f21x_PWM.C: 77: TMR2L=0;
		CLRR 	11H 			//0013 	0111
		ORG		0014H

		//;test_62f21x_PWM.C: 79: PR2H=0;
		BSR 	STATUS,5 		//0014 	1A83
		CLRR 	12H 			//0015 	0112

		//;test_62f21x_PWM.C: 80: PR2L=99;
		LDWI 	63H 			//0016 	2A63
		STR 	11H 			//0017 	0191

		//;test_62f21x_PWM.C: 82: P1ADTH=0;
		BCR 	STATUS,5 		//0018 	1283
		CLRR 	14H 			//0019 	0114

		//;test_62f21x_PWM.C: 83: P1ADTL=50;
		LDWI 	32H 			//001A 	2A32
		STR 	EH 			//001B 	018E
		ORG		001CH

		//;test_62f21x_PWM.C: 85: P1OE=0B00000001;
		LDWI 	1H 			//001C 	2A01
		BSR 	STATUS,5 		//001D 	1A83
		STR 	10H 			//001E 	0190

		//;test_62f21x_PWM.C: 96: P1POL=0B00000000;
		CLRR 	19H 			//001F 	0119

		//;test_62f21x_PWM.C: 103: P1CON=0B00000000;
		BCR 	STATUS,5 		//0020 	1283
		CLRR 	16H 			//0021 	0116

		//;test_62f21x_PWM.C: 110: TMR2IF=0;
		BCR 	CH,1 			//0022 	108C

		//;test_62f21x_PWM.C: 111: TMR2IE=1;
		BSR 	STATUS,5 		//0023 	1A83
		ORG		0024H
		BSR 	CH,1 			//0024 	188C

		//;test_62f21x_PWM.C: 112: TMR2ON=1;
		BCR 	STATUS,5 		//0025 	1283
		BSR 	12H,2 			//0026 	1912

		//;test_62f21x_PWM.C: 113: PEIE=1;
		BSR 	INTCON,6 		//0027 	1B0B

		//;test_62f21x_PWM.C: 114: GIE=1;
		BSR 	INTCON,7 		//0028 	1B8B
		RET		 					//0029 	0004

		//;test_62f21x_PWM.C: 40: OSCCON = 0B01110000;
		LDWI 	70H 			//002A 	2A70
		BSR 	STATUS,5 		//002B 	1A83
		ORG		002CH
		STR 	FH 			//002C 	018F

		//;test_62f21x_PWM.C: 41: INTCON = 0;
		CLRR 	INTCON 			//002D 	010B

		//;test_62f21x_PWM.C: 43: PORTA = 0B00000000;
		BCR 	STATUS,5 		//002E 	1283
		CLRR 	5H 			//002F 	0105

		//;test_62f21x_PWM.C: 44: TRISA = 0B00000000;
		BSR 	STATUS,5 		//0030 	1A83
		CLRR 	5H 			//0031 	0105

		//;test_62f21x_PWM.C: 45: WPUA = 0B00000000;
		CLRR 	15H 			//0032 	0115

		//;test_62f21x_PWM.C: 47: OPTION = 0B00001000;
		LDWI 	8H 			//0033 	2A08
		ORG		0034H
		STR 	1H 			//0034 	0181

		//;test_62f21x_PWM.C: 48: MSCON = 0B00000000;
		BCR 	STATUS,5 		//0035 	1283
		CLRR 	1BH 			//0036 	011B
		RET		 					//0037 	0004

		//;test_62f21x_PWM.C: 27: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//0038 	1A83
		BTSS 	CH,1 			//0039 	1C8C
		LJUMP 	3FH 			//003A 	383F
		BCR 	STATUS,5 		//003B 	1283
		ORG		003CH
		BTSS 	CH,1 			//003C 	1C8C
		LJUMP 	3FH 			//003D 	383F

		//;test_62f21x_PWM.C: 28: {
		//;test_62f21x_PWM.C: 29: TMR2IF = 0;
		BCR 	CH,1 			//003E 	108C
		LDR 	71H,0 			//003F 	0871
		STR 	PCLATH 			//0040 	018A
		SWAPR 	70H,0 			//0041 	0770
		STR 	STATUS 			//0042 	0183
		SWAPR 	7EH,1 			//0043 	07FE
		ORG		0044H
		SWAPR 	7EH,0 			//0044 	077E
		RETI		 			//0045 	0009

		//;test_62f21x_PWM.C: 124: POWER_INITIAL();
		LCALL 	2AH 			//0046 	302A

		//;test_62f21x_PWM.C: 125: PWM1_INITIAL();
		LCALL 	DH 			//0047 	300D

		//;test_62f21x_PWM.C: 127: {
		//;test_62f21x_PWM.C: 128: __nop();
		NOP		 					//0048 	0000
		LJUMP 	48H 			//0049 	3848
			END
