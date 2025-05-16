//Deviec:FT60E02X
//-----------------------Variable---------------------------------
		_PA0		EQU		05H
		_PA1		EQU		05H
		_PA2		EQU		05H
		_PA4		EQU		05H
		_PA6		EQU		05H
		_PA7		EQU		05H
		_PC1		EQU		07H
		_PC2		EQU		07H
		_PC3		EQU		07H
		_PC4		EQU		07H
		_PC5		EQU		07H
		_PC6		EQU		07H
		_PC7		EQU		07H
		_PAIF		EQU		0BH
		_PAIE		EQU		0BH
		_GIE		EQU		0BH
		_EEIF		EQU		0CH
		_IOCA0		EQU		96H
		_IOCA1		EQU		96H
		_IOCA2		EQU		96H
		_IOCA4		EQU		96H
		_IOCA6		EQU		96H
		_IOCA7		EQU		96H
		_RD		EQU		9CH
		_WR		EQU		9DH
		_Set		EQU		26H
		_Learn		EQU		2DH
		_CodeKey		EQU		25H
		_CodeLearn		EQU		20H
		_CountKey		EQU		23H
//		SEND_CODE@Code1		EQU		29H
//		SEND_CODE@Code1		EQU		29H
//		SEND_CODE@Code2		EQU		27H
//		SEND_CODE@Code3		EQU		28H
//		SEND_CODE@Code1		EQU		29H
//		SEND_DATA@Code		EQU		77H
//		SEND_DATA@Bit		EQU		79H
//		SEND_DATA@Byte		EQU		78H
//		SEND_DATA@Code		EQU		77H
//		SEND_DATA@Code		EQU		77H
//		GEN_CODE@i		EQU		2BH
//		EEPROMwrite@EEAddr		EQU		73H
//		EEPROMwrite@EEAddr		EQU		73H
//		EEPROMwrite@Data		EQU		72H
//		EEPROMwrite@EEAddr		EQU		73H
//		DelayMs@b		EQU		7AH
//		DelayMs@a		EQU		78H
//		DelayMs@Time		EQU		76H
//		DelayUs@a		EQU		74H
//		DelayUs@Time		EQU		72H
//		EEPROMread@EEAddr		EQU		72H
//		EEPROMread@ReEEPROMread		EQU		73H
//		EEPROMread@EEAddr		EQU		72H
//		EEPROMread@EEAddr		EQU		72H
//-----------------------Variable END---------------------------------

		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	22BH 			//0009 	3A2B
		LJUMP 	0BH 			//000A 	380B
		BCR 	STATUS,5 		//000B 	1283
		CLRR 	20H 			//000C 	0120
		CLRR 	21H 			//000D 	0121
		CLRR 	22H 			//000E 	0122
		CLRR 	23H 			//000F 	0123
		CLRR 	24H 			//0010 	0124
		CLRR 	25H 			//0011 	0125
		CLRR 	26H 			//0012 	0126
		CLRR 	STATUS 			//0013 	0103
		LJUMP 	D7H 			//0014 	38D7

		//;Remute-RF-TX-FMD.C: 239: unsigned char i=0;
		BCR 	STATUS,5 		//0015 	1283
		CLRR 	2BH 			//0016 	012B

		//;Remute-RF-TX-FMD.C: 241: {
		//;Remute-RF-TX-FMD.C: 242: i++;
		INCR	2BH,1 			//0017 	09AB

		//;Remute-RF-TX-FMD.C: 243: if(PA6==0)
		BTSC 	5H,6 			//0018 	1705
		LJUMP 	17H 			//0019 	3817

		//;Remute-RF-TX-FMD.C: 244: {
		//;Remute-RF-TX-FMD.C: 245: if(CountKey<510){CountKey++;}
		LDWI 	1H 			//001A 	2A01
		SUBWR 	24H,0 			//001B 	0C24
		LDWI 	FEH 			//001C 	2AFE
		BTSC 	STATUS,2 		//001D 	1503
		SUBWR 	23H,0 			//001E 	0C23
		BTSC 	STATUS,0 		//001F 	1403
		LJUMP 	24H 			//0020 	3824
		INCR	23H,1 			//0021 	09A3
		BTSC 	STATUS,2 		//0022 	1503
		INCR	24H,1 			//0023 	09A4
		LDWI 	1H 			//0024 	2A01

		//;Remute-RF-TX-FMD.C: 246: if(PA6==0 & CountKey>500 & CountKey<510)
		CLRR 	28H 			//0025 	0128
		SUBWR 	24H,0 			//0026 	0C24
		LDWI 	F5H 			//0027 	2AF5
		BTSC 	STATUS,2 		//0028 	1503
		SUBWR 	23H,0 			//0029 	0C23
		BTSS 	STATUS,0 		//002A 	1C03
		LJUMP 	35H 			//002B 	3835
		LDWI 	1H 			//002C 	2A01
		SUBWR 	24H,0 			//002D 	0C24
		LDWI 	FEH 			//002E 	2AFE
		BTSC 	STATUS,2 		//002F 	1503
		SUBWR 	23H,0 			//0030 	0C23
		BTSC 	STATUS,0 		//0031 	1403
		LJUMP 	35H 			//0032 	3835
		CLRR 	28H 			//0033 	0128
		INCR	28H,1 			//0034 	09A8
		BTSC 	5H,6 			//0035 	1705
		LJUMP 	39H 			//0036 	3839
		LDWI 	1H 			//0037 	2A01
		LJUMP 	3AH 			//0038 	383A
		LDWI 	0H 			//0039 	2A00
		STR 	27H 			//003A 	01A7
		ANDWR 	28H,0 			//003B 	0228
		BTSC 	STATUS,2 		//003C 	1503
		LJUMP 	17H 			//003D 	3817

		//;Remute-RF-TX-FMD.C: 247: {
		//;Remute-RF-TX-FMD.C: 248: CodeLearn[0]=i;
		LDR 	2BH,0 			//003E 	082B
		STR 	20H 			//003F 	01A0

		//;Remute-RF-TX-FMD.C: 250: CountKey=520;
		LDWI 	8H 			//0040 	2A08
		STR 	23H 			//0041 	01A3
		LDWI 	2H 			//0042 	2A02
		STR 	24H 			//0043 	01A4

		//;Remute-RF-TX-FMD.C: 252: }
		//;Remute-RF-TX-FMD.C: 253: }
		//;Remute-RF-TX-FMD.C: 254: }
		//;Remute-RF-TX-FMD.C: 255: PC7=1;
		//;Remute-RF-TX-FMD.C: 251: break;
		//;Remute-RF-TX-FMD.C: 256: DelayMs(200);
		LCALL 	CDH 			//0044 	30CD
		LCALL 	1BCH 			//0045 	31BC

		//;Remute-RF-TX-FMD.C: 257: PC7=0;
		BCR 	STATUS,5 		//0046 	1283
		BCR 	7H,7 			//0047 	1387

		//;Remute-RF-TX-FMD.C: 258: CountKey=0;
		CLRR 	23H 			//0048 	0123
		CLRR 	24H 			//0049 	0124

		//;Remute-RF-TX-FMD.C: 260: {
		//;Remute-RF-TX-FMD.C: 261: i--;
		DECR 	2BH,1 			//004A 	0DAB

		//;Remute-RF-TX-FMD.C: 262: if(PA6==0)
		BTSC 	5H,6 			//004B 	1705
		LJUMP 	4AH 			//004C 	384A

		//;Remute-RF-TX-FMD.C: 263: {
		//;Remute-RF-TX-FMD.C: 264: if(CountKey<710){CountKey++;}
		LDWI 	2H 			//004D 	2A02
		SUBWR 	24H,0 			//004E 	0C24
		LDWI 	C6H 			//004F 	2AC6
		BTSC 	STATUS,2 		//0050 	1503
		SUBWR 	23H,0 			//0051 	0C23
		BTSC 	STATUS,0 		//0052 	1403
		LJUMP 	57H 			//0053 	3857
		INCR	23H,1 			//0054 	09A3
		BTSC 	STATUS,2 		//0055 	1503
		INCR	24H,1 			//0056 	09A4
		LDWI 	2H 			//0057 	2A02

		//;Remute-RF-TX-FMD.C: 265: if(PA6==0 & CountKey>700 & CountKey<710)
		CLRR 	29H 			//0058 	0129
		SUBWR 	24H,0 			//0059 	0C24
		LDWI 	BDH 			//005A 	2ABD
		BTSC 	STATUS,2 		//005B 	1503
		SUBWR 	23H,0 			//005C 	0C23
		BTSS 	STATUS,0 		//005D 	1C03
		LJUMP 	68H 			//005E 	3868
		LDWI 	2H 			//005F 	2A02
		SUBWR 	24H,0 			//0060 	0C24
		LDWI 	C6H 			//0061 	2AC6
		BTSC 	STATUS,2 		//0062 	1503
		SUBWR 	23H,0 			//0063 	0C23
		BTSC 	STATUS,0 		//0064 	1403
		LJUMP 	68H 			//0065 	3868
		CLRR 	29H 			//0066 	0129
		INCR	29H,1 			//0067 	09A9
		BTSC 	5H,6 			//0068 	1705
		LJUMP 	6CH 			//0069 	386C
		LDWI 	1H 			//006A 	2A01
		LJUMP 	6DH 			//006B 	386D
		LDWI 	0H 			//006C 	2A00
		STR 	27H 			//006D 	01A7
		ANDWR 	29H,0 			//006E 	0229
		BTSC 	STATUS,2 		//006F 	1503
		LJUMP 	4AH 			//0070 	384A

		//;Remute-RF-TX-FMD.C: 266: {
		//;Remute-RF-TX-FMD.C: 267: CodeLearn[1]=i;
		LDR 	2BH,0 			//0071 	082B
		STR 	21H 			//0072 	01A1

		//;Remute-RF-TX-FMD.C: 269: CountKey=720;
		LDWI 	D0H 			//0073 	2AD0
		STR 	23H 			//0074 	01A3
		LDWI 	2H 			//0075 	2A02
		STR 	24H 			//0076 	01A4

		//;Remute-RF-TX-FMD.C: 271: }
		//;Remute-RF-TX-FMD.C: 272: }
		//;Remute-RF-TX-FMD.C: 273: }
		//;Remute-RF-TX-FMD.C: 274: PC6=1;
		//;Remute-RF-TX-FMD.C: 270: break;
		//;Remute-RF-TX-FMD.C: 275: DelayMs(200);
		LCALL 	D2H 			//0077 	30D2
		LCALL 	1BCH 			//0078 	31BC

		//;Remute-RF-TX-FMD.C: 276: PC6=0;
		BCR 	STATUS,5 		//0079 	1283
		BCR 	7H,6 			//007A 	1307

		//;Remute-RF-TX-FMD.C: 277: CountKey=0;
		CLRR 	23H 			//007B 	0123
		CLRR 	24H 			//007C 	0124

		//;Remute-RF-TX-FMD.C: 279: {
		//;Remute-RF-TX-FMD.C: 280: i++;
		INCR	2BH,1 			//007D 	09AB

		//;Remute-RF-TX-FMD.C: 281: if(PA6==0)
		BTSC 	5H,6 			//007E 	1705
		LJUMP 	7DH 			//007F 	387D

		//;Remute-RF-TX-FMD.C: 282: {
		//;Remute-RF-TX-FMD.C: 283: if(CountKey<360){CountKey++;}
		LDWI 	1H 			//0080 	2A01
		SUBWR 	24H,0 			//0081 	0C24
		LDWI 	68H 			//0082 	2A68
		BTSC 	STATUS,2 		//0083 	1503
		SUBWR 	23H,0 			//0084 	0C23
		BTSC 	STATUS,0 		//0085 	1403
		LJUMP 	8AH 			//0086 	388A
		INCR	23H,1 			//0087 	09A3
		BTSC 	STATUS,2 		//0088 	1503
		INCR	24H,1 			//0089 	09A4
		LDWI 	1H 			//008A 	2A01

		//;Remute-RF-TX-FMD.C: 284: if(PA6==0 & CountKey>350 & CountKey<360)
		CLRR 	2AH 			//008B 	012A
		SUBWR 	24H,0 			//008C 	0C24
		LDWI 	5FH 			//008D 	2A5F
		BTSC 	STATUS,2 		//008E 	1503
		SUBWR 	23H,0 			//008F 	0C23
		BTSS 	STATUS,0 		//0090 	1C03
		LJUMP 	9BH 			//0091 	389B
		LDWI 	1H 			//0092 	2A01
		SUBWR 	24H,0 			//0093 	0C24
		LDWI 	68H 			//0094 	2A68
		BTSC 	STATUS,2 		//0095 	1503
		SUBWR 	23H,0 			//0096 	0C23
		BTSC 	STATUS,0 		//0097 	1403
		LJUMP 	9BH 			//0098 	389B
		CLRR 	2AH 			//0099 	012A
		INCR	2AH,1 			//009A 	09AA
		BTSC 	5H,6 			//009B 	1705
		LJUMP 	9FH 			//009C 	389F
		LDWI 	1H 			//009D 	2A01
		LJUMP 	A0H 			//009E 	38A0
		LDWI 	0H 			//009F 	2A00
		STR 	27H 			//00A0 	01A7
		ANDWR 	2AH,0 			//00A1 	022A
		BTSC 	STATUS,2 		//00A2 	1503
		LJUMP 	7DH 			//00A3 	387D

		//;Remute-RF-TX-FMD.C: 285: {
		//;Remute-RF-TX-FMD.C: 286: CodeLearn[2]=i;
		LDR 	2BH,0 			//00A4 	082B
		STR 	22H 			//00A5 	01A2

		//;Remute-RF-TX-FMD.C: 288: CountKey=370;
		LDWI 	72H 			//00A6 	2A72
		STR 	23H 			//00A7 	01A3
		LDWI 	1H 			//00A8 	2A01
		STR 	24H 			//00A9 	01A4

		//;Remute-RF-TX-FMD.C: 290: }
		//;Remute-RF-TX-FMD.C: 291: }
		//;Remute-RF-TX-FMD.C: 292: }
		//;Remute-RF-TX-FMD.C: 293: CountKey=0;
		//;Remute-RF-TX-FMD.C: 289: break;
		CLRR 	23H 			//00AA 	0123
		CLRR 	24H 			//00AB 	0124

		//;Remute-RF-TX-FMD.C: 294: Learn=1;
		CLRR 	2DH 			//00AC 	012D
		INCR	2DH,1 			//00AD 	09AD

		//;Remute-RF-TX-FMD.C: 295: EEPROMwrite(0X10,CodeLearn[0]);
		LDR 	20H,0 			//00AE 	0820
		STR 	72H 			//00AF 	01F2
		LDWI 	10H 			//00B0 	2A10
		LCALL 	208H 			//00B1 	3208

		//;Remute-RF-TX-FMD.C: 296: EEPROMwrite(0X11,CodeLearn[1]);
		BCR 	STATUS,5 		//00B2 	1283
		LDR 	21H,0 			//00B3 	0821
		STR 	72H 			//00B4 	01F2
		LDWI 	11H 			//00B5 	2A11
		LCALL 	208H 			//00B6 	3208

		//;Remute-RF-TX-FMD.C: 297: EEPROMwrite(0X12,CodeLearn[2]);
		BCR 	STATUS,5 		//00B7 	1283
		LDR 	22H,0 			//00B8 	0822
		STR 	72H 			//00B9 	01F2
		LDWI 	12H 			//00BA 	2A12
		LCALL 	208H 			//00BB 	3208

		//;Remute-RF-TX-FMD.C: 298: EEPROMwrite(0X13,Learn);
		BCR 	STATUS,5 		//00BC 	1283
		LDR 	2DH,0 			//00BD 	082D
		STR 	72H 			//00BE 	01F2
		LDWI 	13H 			//00BF 	2A13
		LCALL 	208H 			//00C0 	3208

		//;Remute-RF-TX-FMD.C: 299: PC5=1;
		//;Remute-RF-TX-FMD.C: 300: DelayMs(200);
		LCALL 	C7H 			//00C1 	30C7
		LCALL 	1BCH 			//00C2 	31BC

		//;Remute-RF-TX-FMD.C: 301: PC5=0;
		BCR 	STATUS,5 		//00C3 	1283
		BCR 	7H,5 			//00C4 	1287

		//;Remute-RF-TX-FMD.C: 302: Learn=0;
		CLRR 	2DH 			//00C5 	012D
		RET		 					//00C6 	0004
		BCR 	STATUS,5 		//00C7 	1283
		BSR 	7H,5 			//00C8 	1A87
		LDWI 	C8H 			//00C9 	2AC8
		STR 	76H 			//00CA 	01F6
		CLRR 	77H 			//00CB 	0177
		RET		 					//00CC 	0004
		BSR 	7H,7 			//00CD 	1B87
		LDWI 	C8H 			//00CE 	2AC8
		STR 	76H 			//00CF 	01F6
		CLRR 	77H 			//00D0 	0177
		RET		 					//00D1 	0004
		BSR 	7H,6 			//00D2 	1B07
		LDWI 	C8H 			//00D3 	2AC8
		STR 	76H 			//00D4 	01F6
		CLRR 	77H 			//00D5 	0177
		RET		 					//00D6 	0004

		//;Remute-RF-TX-FMD.C: 69: POWER_INIT();
		LCALL 	1F2H 			//00D7 	31F2

		//;Remute-RF-TX-FMD.C: 70: INT_INIT();
		LCALL 	238H 			//00D8 	3238

		//;Remute-RF-TX-FMD.C: 71: Learn=EEPROMread(0X13);
		LDWI 	13H 			//00D9 	2A13
		LCALL 	244H 			//00DA 	3244
		BCR 	STATUS,5 		//00DB 	1283
		STR 	2DH 			//00DC 	01AD

		//;Remute-RF-TX-FMD.C: 72: if(Learn==1)
		DECRSZ 	2DH,0 		//00DD 	0E2D
		LJUMP 	F2H 			//00DE 	38F2

		//;Remute-RF-TX-FMD.C: 73: {
		//;Remute-RF-TX-FMD.C: 74: CodeLearn[0]=EEPROMread(0X10);
		LDWI 	10H 			//00DF 	2A10
		LCALL 	244H 			//00E0 	3244
		BCR 	STATUS,5 		//00E1 	1283
		STR 	20H 			//00E2 	01A0
		CLRWDT	 			//00E3 	0001

		//;Remute-RF-TX-FMD.C: 76: CodeLearn[1]=EEPROMread(0X11);
		LDWI 	11H 			//00E4 	2A11
		LCALL 	244H 			//00E5 	3244
		BCR 	STATUS,5 		//00E6 	1283
		STR 	21H 			//00E7 	01A1
		CLRWDT	 			//00E8 	0001

		//;Remute-RF-TX-FMD.C: 78: CodeLearn[2]=EEPROMread(0X12);
		LDWI 	12H 			//00E9 	2A12
		LCALL 	244H 			//00EA 	3244
		BCR 	STATUS,5 		//00EB 	1283
		STR 	22H 			//00EC 	01A2
		CLRWDT	 			//00ED 	0001

		//;Remute-RF-TX-FMD.C: 80: Learn=1;
		BCR 	STATUS,5 		//00EE 	1283
		CLRR 	2DH 			//00EF 	012D
		INCR	2DH,1 			//00F0 	09AD

		//;Remute-RF-TX-FMD.C: 81: }
		LJUMP 	F9H 			//00F1 	38F9

		//;Remute-RF-TX-FMD.C: 82: else
		//;Remute-RF-TX-FMD.C: 83: {
		//;Remute-RF-TX-FMD.C: 84: CodeLearn[0]=0X59;
		LDWI 	59H 			//00F2 	2A59
		STR 	20H 			//00F3 	01A0

		//;Remute-RF-TX-FMD.C: 85: CodeLearn[1]=0X95;
		LDWI 	95H 			//00F4 	2A95
		STR 	21H 			//00F5 	01A1

		//;Remute-RF-TX-FMD.C: 86: CodeLearn[2]=0X40;
		LDWI 	40H 			//00F6 	2A40
		STR 	22H 			//00F7 	01A2

		//;Remute-RF-TX-FMD.C: 87: Learn=0;
		CLRR 	2DH 			//00F8 	012D

		//;Remute-RF-TX-FMD.C: 88: }
		//;Remute-RF-TX-FMD.C: 89: Learn=0;
		CLRR 	2DH 			//00F9 	012D

		//;Remute-RF-TX-FMD.C: 91: {
		//;Remute-RF-TX-FMD.C: 92: if(PA1==0){CodeKey=1;PC7=1;}
		BCR 	STATUS,5 		//00FA 	1283
		BTSC 	5H,1 			//00FB 	1485
		LJUMP 	100H 			//00FC 	3900
		CLRR 	25H 			//00FD 	0125
		INCR	25H,1 			//00FE 	09A5
		BSR 	7H,7 			//00FF 	1B87

		//;Remute-RF-TX-FMD.C: 93: if(PA7==0){CodeKey=2;PC6=1;}
		BTSC 	5H,7 			//0100 	1785
		LJUMP 	105H 			//0101 	3905
		LDWI 	2H 			//0102 	2A02
		STR 	25H 			//0103 	01A5
		BSR 	7H,6 			//0104 	1B07

		//;Remute-RF-TX-FMD.C: 94: if(PA6==0){CodeKey=4;PC5=1;}
		BTSC 	5H,6 			//0105 	1705
		LJUMP 	10AH 			//0106 	390A
		LDWI 	4H 			//0107 	2A04
		STR 	25H 			//0108 	01A5
		BSR 	7H,5 			//0109 	1A87

		//;Remute-RF-TX-FMD.C: 95: if(PA0==0){CodeKey=8;PC1=1;}
		BTSC 	5H,0 			//010A 	1405
		LJUMP 	10FH 			//010B 	390F
		LDWI 	8H 			//010C 	2A08
		STR 	25H 			//010D 	01A5
		BSR 	7H,1 			//010E 	1887

		//;Remute-RF-TX-FMD.C: 96: if(PA2==0){CodeKey=10;PC2=1;}
		BTSC 	5H,2 			//010F 	1505
		LJUMP 	114H 			//0110 	3914
		LDWI 	AH 			//0111 	2A0A
		STR 	25H 			//0112 	01A5
		BSR 	7H,2 			//0113 	1907

		//;Remute-RF-TX-FMD.C: 97: if(PA4==0){CodeKey=14;PC3=1;}
		BTSC 	5H,4 			//0114 	1605
		LJUMP 	119H 			//0115 	3919
		LDWI 	EH 			//0116 	2A0E
		STR 	25H 			//0117 	01A5
		BSR 	7H,3 			//0118 	1987

		//;Remute-RF-TX-FMD.C: 98: if(PA7==0 && PA2==0 & Learn==0)
		BTSC 	5H,7 			//0119 	1785
		LJUMP 	16FH 			//011A 	396F
		BTSC 	5H,2 			//011B 	1505
		LJUMP 	11FH 			//011C 	391F
		LDWI 	1H 			//011D 	2A01
		LJUMP 	120H 			//011E 	3920
		LDWI 	0H 			//011F 	2A00
		STR 	2CH 			//0120 	01AC
		LDR 	2DH,0 			//0121 	082D
		BTSS 	STATUS,2 		//0122 	1D03
		LJUMP 	126H 			//0123 	3926
		LDWI 	1H 			//0124 	2A01
		LJUMP 	127H 			//0125 	3927
		LDWI 	0H 			//0126 	2A00
		ANDWR 	2CH,0 			//0127 	022C
		BTSC 	STATUS,2 		//0128 	1503
		LJUMP 	16FH 			//0129 	396F
		LDWI 	1FH 			//012A 	2A1F

		//;Remute-RF-TX-FMD.C: 99: {
		//;Remute-RF-TX-FMD.C: 100: Set++;
		INCR	26H,1 			//012B 	09A6

		//;Remute-RF-TX-FMD.C: 101: if(Set>30)
		SUBWR 	26H,0 			//012C 	0C26
		BTSS 	STATUS,0 		//012D 	1C03
		LJUMP 	16FH 			//012E 	396F

		//;Remute-RF-TX-FMD.C: 102: {
		//;Remute-RF-TX-FMD.C: 103: Set=0;
		CLRR 	26H 			//012F 	0126

		//;Remute-RF-TX-FMD.C: 104: PORTC=0X00;
		CLRR 	7H 			//0130 	0107

		//;Remute-RF-TX-FMD.C: 105: PC7=1;DelayMs(200);PC7=0;DelayMs(100);
		LCALL 	CDH 			//0131 	30CD
		LCALL 	1BCH 			//0132 	31BC
		BCR 	STATUS,5 		//0133 	1283
		BCR 	7H,7 			//0134 	1387
		LDWI 	64H 			//0135 	2A64
		STR 	76H 			//0136 	01F6
		CLRR 	77H 			//0137 	0177
		LCALL 	1BCH 			//0138 	31BC

		//;Remute-RF-TX-FMD.C: 106: PC6=1;DelayMs(200);PC6=0;DelayMs(100);
		BCR 	STATUS,5 		//0139 	1283
		LCALL 	D2H 			//013A 	30D2
		LCALL 	1BCH 			//013B 	31BC
		BCR 	STATUS,5 		//013C 	1283
		BCR 	7H,6 			//013D 	1307
		LDWI 	64H 			//013E 	2A64
		STR 	76H 			//013F 	01F6
		CLRR 	77H 			//0140 	0177
		LCALL 	1BCH 			//0141 	31BC

		//;Remute-RF-TX-FMD.C: 107: PC5=1;DelayMs(200);PC5=0;DelayMs(100);
		LCALL 	C7H 			//0142 	30C7
		LCALL 	1BCH 			//0143 	31BC
		BCR 	STATUS,5 		//0144 	1283
		BCR 	7H,5 			//0145 	1287
		LDWI 	64H 			//0146 	2A64
		STR 	76H 			//0147 	01F6
		CLRR 	77H 			//0148 	0177
		LCALL 	1BCH 			//0149 	31BC

		//;Remute-RF-TX-FMD.C: 108: PC1=1;DelayMs(200);PC1=0;DelayMs(100);
		BCR 	STATUS,5 		//014A 	1283
		BSR 	7H,1 			//014B 	1887
		LDWI 	C8H 			//014C 	2AC8
		STR 	76H 			//014D 	01F6
		CLRR 	77H 			//014E 	0177
		LCALL 	1BCH 			//014F 	31BC
		BCR 	STATUS,5 		//0150 	1283
		BCR 	7H,1 			//0151 	1087
		LDWI 	64H 			//0152 	2A64
		STR 	76H 			//0153 	01F6
		CLRR 	77H 			//0154 	0177
		LCALL 	1BCH 			//0155 	31BC

		//;Remute-RF-TX-FMD.C: 109: PC2=1;DelayMs(200);PC2=0;DelayMs(100);
		BCR 	STATUS,5 		//0156 	1283
		BSR 	7H,2 			//0157 	1907
		LDWI 	C8H 			//0158 	2AC8
		STR 	76H 			//0159 	01F6
		CLRR 	77H 			//015A 	0177
		LCALL 	1BCH 			//015B 	31BC
		BCR 	STATUS,5 		//015C 	1283
		BCR 	7H,2 			//015D 	1107
		LDWI 	64H 			//015E 	2A64
		STR 	76H 			//015F 	01F6
		CLRR 	77H 			//0160 	0177
		LCALL 	1BCH 			//0161 	31BC

		//;Remute-RF-TX-FMD.C: 110: PC3=1;DelayMs(200);PC3=0;DelayMs(100);
		BCR 	STATUS,5 		//0162 	1283
		BSR 	7H,3 			//0163 	1987
		LDWI 	C8H 			//0164 	2AC8
		STR 	76H 			//0165 	01F6
		CLRR 	77H 			//0166 	0177
		LCALL 	1BCH 			//0167 	31BC
		BCR 	STATUS,5 		//0168 	1283
		BCR 	7H,3 			//0169 	1187
		LDWI 	64H 			//016A 	2A64
		STR 	76H 			//016B 	01F6
		CLRR 	77H 			//016C 	0177
		LCALL 	1BCH 			//016D 	31BC

		//;Remute-RF-TX-FMD.C: 111: GEN_CODE();
		LCALL 	15H 			//016E 	3015

		//;Remute-RF-TX-FMD.C: 112: }
		//;Remute-RF-TX-FMD.C: 113: }
		//;Remute-RF-TX-FMD.C: 114: CodeLearn[2]=CodeLearn[2]>>4;
		SWAPR 	22H,0 			//016F 	0722
		ANDWI 	FH 			//0170 	240F
		STR 	22H 			//0171 	01A2

		//;Remute-RF-TX-FMD.C: 115: CodeLearn[2]=CodeLearn[2]<<4 | CodeKey;
		SWAPR 	22H,0 			//0172 	0722
		ANDWI 	F0H 			//0173 	24F0
		IORWR 	25H,0 			//0174 	0325
		STR 	22H 			//0175 	01A2

		//;Remute-RF-TX-FMD.C: 116: SEND_CODE(CodeLearn[0],CodeLearn[1],CodeLearn[2]);
		LDR 	21H,0 			//0176 	0821
		STR 	27H 			//0177 	01A7
		LDR 	22H,0 			//0178 	0822
		STR 	28H 			//0179 	01A8
		LDR 	20H,0 			//017A 	0820
		LCALL 	1DAH 			//017B 	31DA

		//;Remute-RF-TX-FMD.C: 117: if(PA1==1 && PA7==1 && PA6==1 && PA0==1 && PA2==1 && PA4==1)
		BCR 	STATUS,5 		//017C 	1283
		BTSC 	5H,1 			//017D 	1485
		BTSS 	5H,7 			//017E 	1F85
		LJUMP 	FAH 			//017F 	38FA
		BTSC 	5H,6 			//0180 	1705
		BTSS 	5H,0 			//0181 	1C05
		LJUMP 	FAH 			//0182 	38FA
		BTSC 	5H,2 			//0183 	1505
		BTSS 	5H,4 			//0184 	1E05
		LJUMP 	FAH 			//0185 	38FA

		//;Remute-RF-TX-FMD.C: 118: {
		//;Remute-RF-TX-FMD.C: 119: PORTC=0X00;
		CLRR 	7H 			//0186 	0107
		SLEEP	 			//0187 	0002
		LJUMP 	FAH 			//0188 	38FA
		STR 	77H 			//0189 	01F7

		//;Remute-RF-TX-FMD.C: 203: unsigned char Byte = 0b10000000, Bit = 0;
		LDWI 	80H 			//018A 	2A80
		STR 	78H 			//018B 	01F8

		//;Remute-RF-TX-FMD.C: 204: for(Bit = 0; Bit <= 7; Bit++)
		CLRR 	79H 			//018C 	0179

		//;Remute-RF-TX-FMD.C: 205: {
		//;Remute-RF-TX-FMD.C: 206: if(Code & (Byte >> Bit))
		LDR 	78H,0 			//018D 	0878
		STR 	76H 			//018E 	01F6
		INCR	79H,0 			//018F 	0979
		LJUMP 	193H 			//0190 	3993
		BCR 	STATUS,0 		//0191 	1003
		RRR	76H,1 			//0192 	06F6
		ADDWI 	FFH 			//0193 	27FF
		BTSS 	STATUS,2 		//0194 	1D03
		LJUMP 	191H 			//0195 	3991
		LDR 	76H,0 			//0196 	0876
		ANDWR 	77H,0 			//0197 	0277

		//;Remute-RF-TX-FMD.C: 207: {
		//;Remute-RF-TX-FMD.C: 208: PC4 = 1;
		BCR 	STATUS,5 		//0198 	1283
		BTSC 	STATUS,2 		//0199 	1503
		LJUMP 	1A7H 			//019A 	39A7
		BSR 	7H,4 			//019B 	1A07

		//;Remute-RF-TX-FMD.C: 209: DelayUs(600);
		LDWI 	58H 			//019C 	2A58
		STR 	72H 			//019D 	01F2
		LDWI 	2H 			//019E 	2A02
		STR 	73H 			//019F 	01F3
		LCALL 	21BH 			//01A0 	321B

		//;Remute-RF-TX-FMD.C: 211: PC4 = 0;
		BCR 	STATUS,5 		//01A1 	1283
		BCR 	7H,4 			//01A2 	1207

		//;Remute-RF-TX-FMD.C: 212: DelayUs(310);
		LDWI 	36H 			//01A3 	2A36
		STR 	72H 			//01A4 	01F2
		LDWI 	1H 			//01A5 	2A01
		LJUMP 	1AFH 			//01A6 	39AF

		//;Remute-RF-TX-FMD.C: 214: else
		//;Remute-RF-TX-FMD.C: 215: {
		//;Remute-RF-TX-FMD.C: 216: PC4 = 1;
		//;Remute-RF-TX-FMD.C: 213: }
		BSR 	7H,4 			//01A7 	1A07

		//;Remute-RF-TX-FMD.C: 217: DelayUs(310);
		LCALL 	1B7H 			//01A8 	31B7
		LCALL 	21BH 			//01A9 	321B

		//;Remute-RF-TX-FMD.C: 219: PC4 = 0;
		BCR 	STATUS,5 		//01AA 	1283
		BCR 	7H,4 			//01AB 	1207

		//;Remute-RF-TX-FMD.C: 220: DelayUs(600);
		LDWI 	58H 			//01AC 	2A58
		STR 	72H 			//01AD 	01F2
		LDWI 	2H 			//01AE 	2A02
		STR 	73H 			//01AF 	01F3
		LCALL 	21BH 			//01B0 	321B
		LDWI 	8H 			//01B1 	2A08
		INCR	79H,1 			//01B2 	09F9
		SUBWR 	79H,0 			//01B3 	0C79
		BTSC 	STATUS,0 		//01B4 	1403
		RET		 					//01B5 	0004
		LJUMP 	18DH 			//01B6 	398D
		LDWI 	36H 			//01B7 	2A36
		STR 	72H 			//01B8 	01F2
		LDWI 	1H 			//01B9 	2A01
		STR 	73H 			//01BA 	01F3
		RET		 					//01BB 	0004

		//;Remute-RF-TX-FMD.C: 192: unsigned int a,b;
		//;Remute-RF-TX-FMD.C: 193: for(a=0;a<Time;a++)
		CLRR 	78H 			//01BC 	0178
		CLRR 	79H 			//01BD 	0179
		LDR 	77H,0 			//01BE 	0877
		SUBWR 	79H,0 			//01BF 	0C79
		BTSS 	STATUS,2 		//01C0 	1D03
		LJUMP 	1C4H 			//01C1 	39C4
		LDR 	76H,0 			//01C2 	0876
		SUBWR 	78H,0 			//01C3 	0C78
		BTSC 	STATUS,0 		//01C4 	1403
		RET		 					//01C5 	0004

		//;Remute-RF-TX-FMD.C: 194: {
		//;Remute-RF-TX-FMD.C: 195: for(b=0;b<5;b++)
		CLRR 	7AH 			//01C6 	017A
		CLRR 	7BH 			//01C7 	017B

		//;Remute-RF-TX-FMD.C: 196: {
		//;Remute-RF-TX-FMD.C: 197: DelayUs(197);
		LDWI 	C5H 			//01C8 	2AC5
		STR 	72H 			//01C9 	01F2
		CLRR 	73H 			//01CA 	0173
		LCALL 	21BH 			//01CB 	321B
		INCR	7AH,1 			//01CC 	09FA
		BTSC 	STATUS,2 		//01CD 	1503
		INCR	7BH,1 			//01CE 	09FB
		LDWI 	0H 			//01CF 	2A00
		SUBWR 	7BH,0 			//01D0 	0C7B
		LDWI 	5H 			//01D1 	2A05
		BTSC 	STATUS,2 		//01D2 	1503
		SUBWR 	7AH,0 			//01D3 	0C7A
		BTSS 	STATUS,0 		//01D4 	1C03
		LJUMP 	1C8H 			//01D5 	39C8
		INCR	78H,1 			//01D6 	09F8
		BTSC 	STATUS,2 		//01D7 	1503
		INCR	79H,1 			//01D8 	09F9
		LJUMP 	1BEH 			//01D9 	39BE
		STR 	29H 			//01DA 	01A9

		//;Remute-RF-TX-FMD.C: 228: PC4=0;
		BCR 	7H,4 			//01DB 	1207

		//;Remute-RF-TX-FMD.C: 229: DelayMs(5);
		LDWI 	5H 			//01DC 	2A05
		STR 	76H 			//01DD 	01F6
		CLRR 	77H 			//01DE 	0177
		LCALL 	1BCH 			//01DF 	31BC

		//;Remute-RF-TX-FMD.C: 230: SEND_DATA(Code1);
		BCR 	STATUS,5 		//01E0 	1283
		LDR 	29H,0 			//01E1 	0829
		LCALL 	189H 			//01E2 	3189

		//;Remute-RF-TX-FMD.C: 231: SEND_DATA(Code2);
		BCR 	STATUS,5 		//01E3 	1283
		LDR 	27H,0 			//01E4 	0827
		LCALL 	189H 			//01E5 	3189

		//;Remute-RF-TX-FMD.C: 232: SEND_DATA(Code3);
		BCR 	STATUS,5 		//01E6 	1283
		LDR 	28H,0 			//01E7 	0828
		LCALL 	189H 			//01E8 	3189

		//;Remute-RF-TX-FMD.C: 233: if(CodeKey!=1){PC4 = 1;DelayUs(310);}
		BCR 	STATUS,5 		//01E9 	1283
		DECR 	25H,0 			//01EA 	0D25
		BTSC 	STATUS,2 		//01EB 	1503
		LJUMP 	1F0H 			//01EC 	39F0
		BSR 	7H,4 			//01ED 	1A07
		LCALL 	1B7H 			//01EE 	31B7
		LJUMP 	21BH 			//01EF 	3A1B

		//;Remute-RF-TX-FMD.C: 234: else{PC4 = 0;DelayUs(310);}
		BCR 	7H,4 			//01F0 	1207
		LJUMP 	1EEH 			//01F1 	39EE

		//;Remute-RF-TX-FMD.C: 127: OSCCON = 0B01110001;
		LDWI 	71H 			//01F2 	2A71
		BSR 	STATUS,5 		//01F3 	1A83
		STR 	FH 			//01F4 	018F

		//;Remute-RF-TX-FMD.C: 128: INTCON = 0;
		CLRR 	INTCON 			//01F5 	010B

		//;Remute-RF-TX-FMD.C: 130: PORTA = 0B00000000;
		BCR 	STATUS,5 		//01F6 	1283
		CLRR 	5H 			//01F7 	0105

		//;Remute-RF-TX-FMD.C: 131: TRISA = 0B11111111;
		LDWI 	FFH 			//01F8 	2AFF
		BSR 	STATUS,5 		//01F9 	1A83
		STR 	5H 			//01FA 	0185

		//;Remute-RF-TX-FMD.C: 132: WPUA = 0B11111111;
		STR 	15H 			//01FB 	0195

		//;Remute-RF-TX-FMD.C: 134: PORTC = 0B00000000;
		BCR 	STATUS,5 		//01FC 	1283
		CLRR 	7H 			//01FD 	0107

		//;Remute-RF-TX-FMD.C: 135: TRISC = 0B00000001;
		LDWI 	1H 			//01FE 	2A01
		BSR 	STATUS,5 		//01FF 	1A83
		STR 	7H 			//0200 	0187

		//;Remute-RF-TX-FMD.C: 137: OPTION = 0B00001000;
		LDWI 	8H 			//0201 	2A08
		STR 	1H 			//0202 	0181

		//;Remute-RF-TX-FMD.C: 138: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//0203 	1283
		CLRR 	1BH 			//0204 	011B

		//;Remute-RF-TX-FMD.C: 140: CMCON0 = 0B00000111;
		LDWI 	7H 			//0205 	2A07
		STR 	19H 			//0206 	0199
		RET		 					//0207 	0004
		STR 	73H 			//0208 	01F3

		//;Remute-RF-TX-FMD.C: 169: GIE = 0;
		BCR 	INTCON,7 		//0209 	138B

		//;Remute-RF-TX-FMD.C: 170: while(GIE);
		BTSC 	INTCON,7 		//020A 	178B
		LJUMP 	20AH 			//020B 	3A0A

		//;Remute-RF-TX-FMD.C: 171: EEADR = EEAddr;
		LDR 	73H,0 			//020C 	0873
		BSR 	STATUS,5 		//020D 	1A83
		STR 	1BH 			//020E 	019B

		//;Remute-RF-TX-FMD.C: 172: EEDAT = Data;
		LDR 	72H,0 			//020F 	0872
		STR 	1AH 			//0210 	019A

		//;Remute-RF-TX-FMD.C: 173: EEIF = 0;
		BCR 	STATUS,5 		//0211 	1283
		BCR 	CH,7 			//0212 	138C

		//;Remute-RF-TX-FMD.C: 174: EECON1 = 0x34;
		LDWI 	34H 			//0213 	2A34
		BSR 	STATUS,5 		//0214 	1A83
		STR 	1CH 			//0215 	019C

		//;Remute-RF-TX-FMD.C: 175: WR = 1;
		BSR 	1DH,0 			//0216 	181D

		//;Remute-RF-TX-FMD.C: 176: while(WR);
		BTSC 	1DH,0 			//0217 	141D
		LJUMP 	217H 			//0218 	3A17

		//;Remute-RF-TX-FMD.C: 177: GIE = 1;
		BSR 	INTCON,7 		//0219 	1B8B
		RET		 					//021A 	0004

		//;Remute-RF-TX-FMD.C: 182: unsigned int a;
		//;Remute-RF-TX-FMD.C: 183: for(a=0;a<Time;a++)
		CLRR 	74H 			//021B 	0174
		CLRR 	75H 			//021C 	0175
		LDR 	73H,0 			//021D 	0873
		SUBWR 	75H,0 			//021E 	0C75
		BTSS 	STATUS,2 		//021F 	1D03
		LJUMP 	223H 			//0220 	3A23
		LDR 	72H,0 			//0221 	0872
		SUBWR 	74H,0 			//0222 	0C74
		BTSC 	STATUS,0 		//0223 	1403
		RET		 					//0224 	0004

		//;Remute-RF-TX-FMD.C: 184: {
		//;Remute-RF-TX-FMD.C: 185: __nop();
		NOP		 					//0225 	0000
		CLRWDT	 			//0226 	0001
		INCR	74H,1 			//0227 	09F4
		BTSC 	STATUS,2 		//0228 	1503
		INCR	75H,1 			//0229 	09F5
		LJUMP 	21DH 			//022A 	3A1D

		//;Remute-RF-TX-FMD.C: 60: if(PAIE && PAIF)
		BTSC 	INTCON,3 		//022B 	158B
		BTSS 	INTCON,0 		//022C 	1C0B
		LJUMP 	231H 			//022D 	3A31

		//;Remute-RF-TX-FMD.C: 61: {
		//;Remute-RF-TX-FMD.C: 62: ReadAPin = PORTA;
		BCR 	STATUS,5 		//022E 	1283
		LDR 	5H,0 			//022F 	0805

		//;Remute-RF-TX-FMD.C: 63: PAIF = 0;
		BCR 	INTCON,0 		//0230 	100B
		LDR 	71H,0 			//0231 	0871
		STR 	PCLATH 			//0232 	018A
		SWAPR 	70H,0 			//0233 	0770
		STR 	STATUS 			//0234 	0183
		SWAPR 	7EH,1 			//0235 	07FE
		SWAPR 	7EH,0 			//0236 	077E
		RETI		 			//0237 	0009

		//;Remute-RF-TX-FMD.C: 145: ReadAPin = PORTA;
		LDR 	5H,0 			//0238 	0805

		//;Remute-RF-TX-FMD.C: 146: PAIF =0;
		BCR 	INTCON,0 		//0239 	100B

		//;Remute-RF-TX-FMD.C: 147: IOCA0 =1;
		BSR 	STATUS,5 		//023A 	1A83
		BSR 	16H,0 			//023B 	1816

		//;Remute-RF-TX-FMD.C: 148: IOCA1 =1;
		BSR 	16H,1 			//023C 	1896

		//;Remute-RF-TX-FMD.C: 149: IOCA2 =1;
		BSR 	16H,2 			//023D 	1916

		//;Remute-RF-TX-FMD.C: 150: IOCA4 =1;
		BSR 	16H,4 			//023E 	1A16

		//;Remute-RF-TX-FMD.C: 151: IOCA6 =1;
		BSR 	16H,6 			//023F 	1B16

		//;Remute-RF-TX-FMD.C: 152: IOCA7 =1;
		BSR 	16H,7 			//0240 	1B96

		//;Remute-RF-TX-FMD.C: 153: PAIE =1;
		BSR 	INTCON,3 		//0241 	198B

		//;Remute-RF-TX-FMD.C: 154: GIE = 1;
		BSR 	INTCON,7 		//0242 	1B8B
		RET		 					//0243 	0004
		STR 	72H 			//0244 	01F2

		//;Remute-RF-TX-FMD.C: 159: unsigned char ReEEPROMread;
		//;Remute-RF-TX-FMD.C: 161: EEADR = EEAddr;
		BSR 	STATUS,5 		//0245 	1A83
		STR 	1BH 			//0246 	019B

		//;Remute-RF-TX-FMD.C: 162: RD = 1;
		BSR 	1CH,0 			//0247 	181C

		//;Remute-RF-TX-FMD.C: 163: ReEEPROMread = EEDAT;
		LDR 	1AH,0 			//0248 	081A
		STR 	73H 			//0249 	01F3

		//;Remute-RF-TX-FMD.C: 164: return ReEEPROMread;
		RET		 					//024A 	0004
			END
