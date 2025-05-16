//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_Puls_Count		EQU		70H
		_conter		EQU		42H
		_conter2		EQU		40H
		_S		EQU		75H
		_M		EQU		74H
		_H		EQU		73H
		_mode		EQU		7AH
		_Lock		EQU		72H
//		DelayMs@Time		EQU		44H
//		DelayMs@b		EQU		46H
//		DelayMs@a		EQU		45H
//		DelayMs@Time		EQU		44H
//		DelayMs@Time		EQU		44H
//		DelayUs@Time		EQU		78H
//		DelayUs@a		EQU		79H
//		DelayUs@Time		EQU		78H
//		DelayUs@Time		EQU		78H
//-----------------------Variable END---------------------------------

		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	76H 			//0006 	01F6
		LDR 	PCLATH,0 		//0007 	080A
		STR 	77H 			//0008 	01F7
		LJUMP 	B6H 			//0009 	38B6
		LJUMP 	0BH 			//000A 	380B
		LDWI 	4H 			//000B 	2A04
		STR 	7AH 			//000C 	01FA
		CLRR 	40H 			//000D 	0140
		CLRR 	41H 			//000E 	0141
		CLRR 	42H 			//000F 	0142
		CLRR 	43H 			//0010 	0143
		CLRR 	70H 			//0011 	0170
		CLRR 	71H 			//0012 	0171
		CLRR 	72H 			//0013 	0172
		CLRR 	73H 			//0014 	0173
		CLRR 	74H 			//0015 	0174
		CLRR 	75H 			//0016 	0175
		CLRR 	STATUS 			//0017 	0103
		LJUMP 	19H 			//0018 	3819

		//;USB-cuter.C: 137: POWER_INITIAL();
		LCALL 	EEH 			//0019 	30EE

		//;USB-cuter.C: 138: TIMER0_INITIAL();
		LCALL 	FDH 			//001A 	30FD

		//;USB-cuter.C: 141: GIE = 1;
		BSR 	INTCON,7 		//001B 	1B8B

		//;USB-cuter.C: 143: T0IE = 0;
		BCR 	INTCON,5 		//001C 	128B

		//;USB-cuter.C: 146: mode=4;
		LDWI 	4H 			//001D 	2A04
		STR 	7AH 			//001E 	01FA

		//;USB-cuter.C: 148: PA1=1,PA2=1,PA0=1;
		//;USB-cuter.C: 149: DelayMs(500);
		LCALL 	AEH 			//001F 	30AE
		LCALL 	DDH 			//0020 	30DD

		//;USB-cuter.C: 151: PA1=0,PA2=0,PA0=0;
		//;USB-cuter.C: 152: DelayMs(500);
		LCALL 	B2H 			//0021 	30B2
		LCALL 	DDH 			//0022 	30DD

		//;USB-cuter.C: 154: PA1=1,PA2=1,PA0=1;
		//;USB-cuter.C: 155: DelayMs(500);
		LCALL 	AEH 			//0023 	30AE
		LCALL 	DDH 			//0024 	30DD

		//;USB-cuter.C: 157: PA1=0,PA2=0,PA0=0;
		//;USB-cuter.C: 158: DelayMs(500);
		LCALL 	B2H 			//0025 	30B2
		LCALL 	DDH 			//0026 	30DD

		//;USB-cuter.C: 159: PA1=1,PA2=1,PA0=1;
		//;USB-cuter.C: 160: DelayMs(500);
		LCALL 	AEH 			//0027 	30AE
		LCALL 	DDH 			//0028 	30DD

		//;USB-cuter.C: 162: PA1=0,PA2=0,PA0=0;
		BCR 	5H,1 			//0029 	1085
		BCR 	5H,2 			//002A 	1105
		BCR 	5H,0 			//002B 	1005

		//;USB-cuter.C: 164: PA4=1;
		BSR 	5H,4 			//002C 	1A05

		//;USB-cuter.C: 167: {
		//;USB-cuter.C: 169: if(PA5==0 && Lock==0){
		BTSC 	5H,5 			//002D 	1685
		LJUMP 	4AH 			//002E 	384A
		LDR 	72H,0 			//002F 	0872
		BTSS 	STATUS,2 		//0030 	1D03
		LJUMP 	4AH 			//0031 	384A

		//;USB-cuter.C: 170: conter++;
		INCR	42H,1 			//0032 	09C2
		BTSC 	STATUS,2 		//0033 	1503
		INCR	43H,1 			//0034 	09C3

		//;USB-cuter.C: 171: if(conter>=1000){
		LDWI 	3H 			//0035 	2A03
		SUBWR 	43H,0 			//0036 	0C43
		LDWI 	E8H 			//0037 	2AE8
		BTSC 	STATUS,2 		//0038 	1503
		SUBWR 	42H,0 			//0039 	0C42
		BTSS 	STATUS,0 		//003A 	1C03
		LJUMP 	4AH 			//003B 	384A

		//;USB-cuter.C: 172: conter=0;
		CLRR 	42H 			//003C 	0142
		CLRR 	43H 			//003D 	0143

		//;USB-cuter.C: 174: Lock=1;
		LDWI 	1H 			//003E 	2A01
		STR 	72H 			//003F 	01F2

		//;USB-cuter.C: 175: mode++;
		INCR	7AH,1 			//0040 	09FA

		//;USB-cuter.C: 177: if(mode>=5)mode=1;
		LDWI 	5H 			//0041 	2A05
		SUBWR 	7AH,0 			//0042 	0C7A
		BTSS 	STATUS,0 		//0043 	1C03
		LJUMP 	47H 			//0044 	3847
		LDWI 	1H 			//0045 	2A01
		STR 	7AH 			//0046 	01FA

		//;USB-cuter.C: 179: S=0,M=0,H=0;
		CLRR 	75H 			//0047 	0175
		CLRR 	74H 			//0048 	0174
		CLRR 	73H 			//0049 	0173

		//;USB-cuter.C: 180: }
		//;USB-cuter.C: 181: }
		//;USB-cuter.C: 183: if(PA5==1 && Lock==1){
		BTSS 	5H,5 			//004A 	1E85
		LJUMP 	5DH 			//004B 	385D
		DECRSZ 	72H,0 		//004C 	0E72
		LJUMP 	5DH 			//004D 	385D

		//;USB-cuter.C: 184: conter2++;
		INCR	40H,1 			//004E 	09C0
		BTSC 	STATUS,2 		//004F 	1503
		INCR	41H,1 			//0050 	09C1

		//;USB-cuter.C: 185: if(conter2>=1000){
		LDWI 	3H 			//0051 	2A03
		SUBWR 	41H,0 			//0052 	0C41
		LDWI 	E8H 			//0053 	2AE8
		BTSC 	STATUS,2 		//0054 	1503
		SUBWR 	40H,0 			//0055 	0C40
		BTSS 	STATUS,0 		//0056 	1C03
		LJUMP 	5DH 			//0057 	385D

		//;USB-cuter.C: 186: conter=0;
		CLRR 	42H 			//0058 	0142
		CLRR 	43H 			//0059 	0143

		//;USB-cuter.C: 187: conter2=0;
		CLRR 	40H 			//005A 	0140
		CLRR 	41H 			//005B 	0141

		//;USB-cuter.C: 188: Lock=0;
		CLRR 	72H 			//005C 	0172

		//;USB-cuter.C: 189: }
		//;USB-cuter.C: 190: }
		//;USB-cuter.C: 194: if(mode==0 )PA1=1,PA2=1,PA0=1,PA4=0 , T0IE=0;
		LDR 	7AH,0 			//005D 	087A
		BTSS 	STATUS,2 		//005E 	1D03
		LJUMP 	65H 			//005F 	3865
		BSR 	5H,1 			//0060 	1885
		BSR 	5H,2 			//0061 	1905
		BSR 	5H,0 			//0062 	1805
		BCR 	5H,4 			//0063 	1205
		BCR 	INTCON,5 		//0064 	128B

		//;USB-cuter.C: 196: if(mode==1 )PA1=0,PA2=1,PA0=1,PA4=1 , T0IE=1;
		DECRSZ 	7AH,0 		//0065 	0E7A
		LJUMP 	6CH 			//0066 	386C
		BCR 	5H,1 			//0067 	1085
		BSR 	5H,2 			//0068 	1905
		BSR 	5H,0 			//0069 	1805
		BSR 	5H,4 			//006A 	1A05
		BSR 	INTCON,5 		//006B 	1A8B

		//;USB-cuter.C: 197: if(mode==2 )PA1=1,PA2=0,PA0=1,PA4=1 , T0IE=1;
		LDWI 	2H 			//006C 	2A02
		XORWR 	7AH,0 			//006D 	047A
		BTSS 	STATUS,2 		//006E 	1D03
		LJUMP 	75H 			//006F 	3875
		BSR 	5H,1 			//0070 	1885
		BCR 	5H,2 			//0071 	1105
		BSR 	5H,0 			//0072 	1805
		BSR 	5H,4 			//0073 	1A05
		BSR 	INTCON,5 		//0074 	1A8B

		//;USB-cuter.C: 198: if(mode==3 )PA1=1,PA2=1,PA0=0,PA4=1 , T0IE=1;
		LDWI 	3H 			//0075 	2A03
		XORWR 	7AH,0 			//0076 	047A
		BTSS 	STATUS,2 		//0077 	1D03
		LJUMP 	7EH 			//0078 	387E
		BSR 	5H,1 			//0079 	1885
		BSR 	5H,2 			//007A 	1905
		BCR 	5H,0 			//007B 	1005
		BSR 	5H,4 			//007C 	1A05
		BSR 	INTCON,5 		//007D 	1A8B

		//;USB-cuter.C: 200: if(mode==4 )PA1=0,PA2=0,PA0=0,PA4=1 , T0IE=0;
		LDWI 	4H 			//007E 	2A04
		XORWR 	7AH,0 			//007F 	047A
		BTSS 	STATUS,2 		//0080 	1D03
		LJUMP 	87H 			//0081 	3887
		BCR 	5H,1 			//0082 	1085
		BCR 	5H,2 			//0083 	1105
		BCR 	5H,0 			//0084 	1005
		BSR 	5H,4 			//0085 	1A05
		BCR 	INTCON,5 		//0086 	128B

		//;USB-cuter.C: 203: if(mode==1 && M==45 && H==0 && PA4==1) mode=0 ;
		DECRSZ 	7AH,0 		//0087 	0E7A
		LJUMP 	92H 			//0088 	3892
		LDWI 	2DH 			//0089 	2A2D
		XORWR 	74H,0 			//008A 	0474
		BTSS 	STATUS,2 		//008B 	1D03
		LJUMP 	92H 			//008C 	3892
		LDR 	73H,0 			//008D 	0873
		BTSC 	STATUS,2 		//008E 	1503
		BTSS 	5H,4 			//008F 	1E05
		LJUMP 	92H 			//0090 	3892
		CLRR 	7AH 			//0091 	017A

		//;USB-cuter.C: 205: if(mode==2 && M==30 && H==1 && PA4==1) mode=0 ;
		LDWI 	2H 			//0092 	2A02
		XORWR 	7AH,0 			//0093 	047A
		BTSS 	STATUS,2 		//0094 	1D03
		LJUMP 	9FH 			//0095 	389F
		LDWI 	1EH 			//0096 	2A1E
		XORWR 	74H,0 			//0097 	0474
		BTSS 	STATUS,2 		//0098 	1D03
		LJUMP 	9FH 			//0099 	389F
		DECRSZ 	73H,0 		//009A 	0E73
		LJUMP 	9FH 			//009B 	389F
		BTSS 	5H,4 			//009C 	1E05
		LJUMP 	9FH 			//009D 	389F
		CLRR 	7AH 			//009E 	017A

		//;USB-cuter.C: 207: if(mode==3 && M==30 && H==2 && PA4==1) mode=0 ;
		LDWI 	3H 			//009F 	2A03
		XORWR 	7AH,0 			//00A0 	047A
		BTSS 	STATUS,2 		//00A1 	1D03
		LJUMP 	2DH 			//00A2 	382D
		LDWI 	1EH 			//00A3 	2A1E
		XORWR 	74H,0 			//00A4 	0474
		BTSS 	STATUS,2 		//00A5 	1D03
		LJUMP 	2DH 			//00A6 	382D
		LDWI 	2H 			//00A7 	2A02
		XORWR 	73H,0 			//00A8 	0473
		BTSC 	STATUS,2 		//00A9 	1503
		BTSS 	5H,4 			//00AA 	1E05
		LJUMP 	2DH 			//00AB 	382D
		CLRR 	7AH 			//00AC 	017A
		LJUMP 	2DH 			//00AD 	382D
		BSR 	5H,1 			//00AE 	1885
		BSR 	5H,2 			//00AF 	1905
		BSR 	5H,0 			//00B0 	1805
		RETW 	F4H 			//00B1 	21F4
		BCR 	5H,1 			//00B2 	1085
		BCR 	5H,2 			//00B3 	1105
		BCR 	5H,0 			//00B4 	1005
		RETW 	F4H 			//00B5 	21F4

		//;USB-cuter.C: 39: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//00B6 	168B
		BTSS 	INTCON,2 		//00B7 	1D0B
		LJUMP 	D6H 			//00B8 	38D6

		//;USB-cuter.C: 40: {
		//;USB-cuter.C: 41: TMR0 = 239;
		LDWI 	EFH 			//00B9 	2AEF
		BCR 	STATUS,5 		//00BA 	1283
		STR 	1H 			//00BB 	0181

		//;USB-cuter.C: 42: T0IF = 0;
		BCR 	INTCON,2 		//00BC 	110B

		//;USB-cuter.C: 44: Puls_Count++;
		INCR	70H,1 			//00BD 	09F0
		BTSC 	STATUS,2 		//00BE 	1503
		INCR	71H,1 			//00BF 	09F1

		//;USB-cuter.C: 46: if(Puls_Count>=2000)Puls_Count=0,S++;
		LDWI 	7H 			//00C0 	2A07
		SUBWR 	71H,0 			//00C1 	0C71
		LDWI 	D0H 			//00C2 	2AD0
		BTSC 	STATUS,2 		//00C3 	1503
		SUBWR 	70H,0 			//00C4 	0C70
		BTSS 	STATUS,0 		//00C5 	1C03
		LJUMP 	CAH 			//00C6 	38CA
		CLRR 	70H 			//00C7 	0170
		CLRR 	71H 			//00C8 	0171
		INCR	75H,1 			//00C9 	09F5

		//;USB-cuter.C: 48: if(S>=60)S=0,M++;
		LDWI 	3CH 			//00CA 	2A3C
		SUBWR 	75H,0 			//00CB 	0C75
		BTSS 	STATUS,0 		//00CC 	1C03
		LJUMP 	D0H 			//00CD 	38D0
		CLRR 	75H 			//00CE 	0175
		INCR	74H,1 			//00CF 	09F4

		//;USB-cuter.C: 49: if(M>=60)M=0,H++;
		LDWI 	3CH 			//00D0 	2A3C
		SUBWR 	74H,0 			//00D1 	0C74
		BTSS 	STATUS,0 		//00D2 	1C03
		LJUMP 	D6H 			//00D3 	38D6
		CLRR 	74H 			//00D4 	0174
		INCR	73H,1 			//00D5 	09F3
		LDR 	77H,0 			//00D6 	0877
		STR 	PCLATH 			//00D7 	018A
		SWAPR 	76H,0 			//00D8 	0776
		STR 	STATUS 			//00D9 	0183
		SWAPR 	7EH,1 			//00DA 	07FE
		SWAPR 	7EH,0 			//00DB 	077E
		RETI		 			//00DC 	0009
		STR 	44H 			//00DD 	01C4

		//;USB-cuter.C: 76: unsigned char a,b;
		//;USB-cuter.C: 77: for(a=0;a<Time;a++)
		CLRR 	45H 			//00DE 	0145
		LDR 	44H,0 			//00DF 	0844
		SUBWR 	45H,0 			//00E0 	0C45
		BTSC 	STATUS,0 		//00E1 	1403
		RET		 					//00E2 	0004

		//;USB-cuter.C: 78: {
		//;USB-cuter.C: 79: for(b=0;b<5;b++)
		CLRR 	46H 			//00E3 	0146

		//;USB-cuter.C: 80: {
		//;USB-cuter.C: 81: DelayUs(98);
		LDWI 	62H 			//00E4 	2A62
		LCALL 	106H 			//00E5 	3106
		LDWI 	5H 			//00E6 	2A05
		BCR 	STATUS,5 		//00E7 	1283
		INCR	46H,1 			//00E8 	09C6
		SUBWR 	46H,0 			//00E9 	0C46
		BTSS 	STATUS,0 		//00EA 	1C03
		LJUMP 	E4H 			//00EB 	38E4
		INCR	45H,1 			//00EC 	09C5
		LJUMP 	DFH 			//00ED 	38DF

		//;USB-cuter.C: 102: OSCCON = 0B01110001;
		LDWI 	71H 			//00EE 	2A71
		BSR 	STATUS,5 		//00EF 	1A83
		STR 	FH 			//00F0 	018F

		//;USB-cuter.C: 104: INTCON = 0;
		CLRR 	INTCON 			//00F1 	010B

		//;USB-cuter.C: 105: OPTION = 0B00001000;
		LDWI 	8H 			//00F2 	2A08
		STR 	1H 			//00F3 	0181

		//;USB-cuter.C: 107: PORTA = 0B00000000;
		BCR 	STATUS,5 		//00F4 	1283
		CLRR 	5H 			//00F5 	0105

		//;USB-cuter.C: 108: TRISA = 0B00100000;
		LDWI 	20H 			//00F6 	2A20
		BSR 	STATUS,5 		//00F7 	1A83
		STR 	5H 			//00F8 	0185

		//;USB-cuter.C: 110: WPUA = 0B00100000;
		STR 	15H 			//00F9 	0195

		//;USB-cuter.C: 112: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//00FA 	1283
		CLRR 	1BH 			//00FB 	011B
		RET		 					//00FC 	0004

		//;USB-cuter.C: 118: OPTION = 0B00000110;
		LDWI 	6H 			//00FD 	2A06
		BSR 	STATUS,5 		//00FE 	1A83
		STR 	1H 			//00FF 	0181

		//;USB-cuter.C: 124: TMR0 = 239;
		LDWI 	EFH 			//0100 	2AEF
		BCR 	STATUS,5 		//0101 	1283
		STR 	1H 			//0102 	0181

		//;USB-cuter.C: 125: T0IF = 0;
		BCR 	INTCON,2 		//0103 	110B

		//;USB-cuter.C: 126: T0IE = 1;
		BSR 	INTCON,5 		//0104 	1A8B
		RET		 					//0105 	0004
		STR 	78H 			//0106 	01F8

		//;USB-cuter.C: 66: unsigned char a;
		//;USB-cuter.C: 67: for(a=0;a<Time;a++)
		CLRR 	79H 			//0107 	0179
		LDR 	78H,0 			//0108 	0878
		SUBWR 	79H,0 			//0109 	0C79
		BTSC 	STATUS,0 		//010A 	1403
		RET		 					//010B 	0004

		//;USB-cuter.C: 68: {
		//;USB-cuter.C: 69: __nop();
		NOP		 					//010C 	0000
		INCR	79H,1 			//010D 	09F9
		LJUMP 	108H 			//010E 	3908
			END
