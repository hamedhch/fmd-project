//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_Timer		EQU		55H
		_conterout		EQU		7CH
		_Data		EQU		52H
		_Time		EQU		5DH
		_DataM		EQU		4FH
		_DataS		EQU		40H
		_RFData		EQU		4CH
		_contlern		EQU		5CH
		_Start		EQU		5BH
		_Count		EQU		5AH
		_Buffer		EQU		59H
		_Bit		EQU		58H
		_key		EQU		57H
		_Frist		EQU		7BH
		_Learn		EQU		7BH
		_Finish		EQU		7BH
		_Lock		EQU		7BH
//		main@i		EQU		6BH
//		EEPROMwrite@EEAddr		EQU		63H
//		EEPROMwrite@EEAddr		EQU		63H
//		EEPROMwrite@Data		EQU		62H
//		EEPROMwrite@EEAddr		EQU		63H
//		EEPROMread@EEAddr		EQU		62H
//		EEPROMread@ReEEPROMread		EQU		63H
//		EEPROMread@EEAddr		EQU		62H
//		EEPROMread@EEAddr		EQU		62H
//		DelayMs@b		EQU		68H
//		DelayMs@a		EQU		66H
//		DelayMs@Time		EQU		64H
//		DelayUs@Time		EQU		62H
//		DelayUs@a		EQU		63H
//		DelayUs@Time		EQU		62H
//		DelayUs@Time		EQU		62H
//		SEND_CODE@Code1		EQU		7AH
//		SEND_CODE@Code1		EQU		7AH
//		SEND_CODE@Code2		EQU		78H
//		SEND_CODE@Code3		EQU		79H
//		SEND_CODE@Code1		EQU		7AH
//		i1DelayMs@b		EQU		76H
//		i1DelayMs@a		EQU		74H
//		i1DelayMs@Time		EQU		72H
//		SEND_DATA@Code		EQU		73H
//		SEND_DATA@i		EQU		75H
//		SEND_DATA@Byte		EQU		74H
//		SEND_DATA@Code		EQU		73H
//		SEND_DATA@Code		EQU		73H
//		i1DelayUs@Time		EQU		70H
//		i1DelayUs@a		EQU		71H
//		i1DelayUs@Time		EQU		70H
//		i1DelayUs@Time		EQU		70H
//-----------------------Variable END---------------------------------

		LJUMP 	0DH 			//0000 	380D
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		BCR 	STATUS,5 		//0006 	1283
		STR 	5FH 			//0007 	01DF
		LDR 	FSR,0 			//0008 	0804
		STR 	60H 			//0009 	01E0
		LDR 	PCLATH,0 		//000A 	080A
		STR 	61H 			//000B 	01E1
		LJUMP 	18H 			//000C 	3818
		LJUMP 	0EH 			//000D 	380E
		LDWI 	40H 			//000E 	2A40
		CLRR 	7BH 			//000F 	017B
		CLRR 	7CH 			//0010 	017C
		CLRR 	7DH 			//0011 	017D
		BCR 	STATUS,7 		//0012 	1383
		STR 	FSR 			//0013 	0184
		LDWI 	5EH 			//0014 	2A5E
		LCALL 	312H 			//0015 	3312
		CLRR 	STATUS 			//0016 	0103
		LJUMP 	1CEH 			//0017 	39CE

		//;RF-car.C: 58: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//0018 	168B
		BTSS 	INTCON,2 		//0019 	1D0B
		LJUMP 	117H 			//001A 	3917

		//;RF-car.C: 59: {
		//;RF-car.C: 60: TMR0 = 239;
		LDWI 	EFH 			//001B 	2AEF
		STR 	1H 			//001C 	0181

		//;RF-car.C: 61: T0IF = 0;
		BCR 	INTCON,2 		//001D 	110B

		//;RF-car.C: 63: if(PA5==0){
		BTSC 	5H,5 			//001E 	1685
		LJUMP 	24H 			//001F 	3824

		//;RF-car.C: 65: conterout++;
		INCR	7CH,1 			//0020 	09FC
		BTSC 	STATUS,2 		//0021 	1503
		INCR	7DH,1 			//0022 	09FD

		//;RF-car.C: 66: PA1=0;
		BCR 	5H,1 			//0023 	1085

		//;RF-car.C: 68: }
		//;RF-car.C: 69: if(PA5==1 && conterout>230 && conterout<360 ){
		BTSS 	5H,5 			//0024 	1E85
		LJUMP 	37H 			//0025 	3837
		LDWI 	0H 			//0026 	2A00
		SUBWR 	7DH,0 			//0027 	0C7D
		LDWI 	E7H 			//0028 	2AE7
		BTSC 	STATUS,2 		//0029 	1503
		SUBWR 	7CH,0 			//002A 	0C7C
		BTSS 	STATUS,0 		//002B 	1C03
		LJUMP 	37H 			//002C 	3837
		LDWI 	1H 			//002D 	2A01
		SUBWR 	7DH,0 			//002E 	0C7D
		LDWI 	68H 			//002F 	2A68
		BTSC 	STATUS,2 		//0030 	1503
		SUBWR 	7CH,0 			//0031 	0C7C
		BTSC 	STATUS,0 		//0032 	1403
		LJUMP 	37H 			//0033 	3837

		//;RF-car.C: 72: conterout++;
		INCR	7CH,1 			//0034 	09FC
		BTSC 	STATUS,2 		//0035 	1503
		INCR	7DH,1 			//0036 	09FD

		//;RF-car.C: 74: }
		//;RF-car.C: 76: if(PA5==1 && conterout > 360 && conterout<850 ){
		BTSS 	5H,5 			//0037 	1E85
		LJUMP 	B2H 			//0038 	38B2
		LDWI 	1H 			//0039 	2A01
		SUBWR 	7DH,0 			//003A 	0C7D
		LDWI 	69H 			//003B 	2A69
		BTSC 	STATUS,2 		//003C 	1503
		SUBWR 	7CH,0 			//003D 	0C7C
		BTSS 	STATUS,0 		//003E 	1C03
		LJUMP 	B2H 			//003F 	38B2
		LDWI 	3H 			//0040 	2A03
		SUBWR 	7DH,0 			//0041 	0C7D
		LDWI 	52H 			//0042 	2A52
		BTSC 	STATUS,2 		//0043 	1503
		SUBWR 	7CH,0 			//0044 	0C7C
		BTSC 	STATUS,0 		//0045 	1403
		LJUMP 	B2H 			//0046 	38B2

		//;RF-car.C: 78: PA1=1;
		BSR 	5H,1 			//0047 	1885

		//;RF-car.C: 80: if(conterout>450 && conterout<490){
		LDWI 	1H 			//0048 	2A01
		SUBWR 	7DH,0 			//0049 	0C7D
		LDWI 	C3H 			//004A 	2AC3
		BTSC 	STATUS,2 		//004B 	1503
		SUBWR 	7CH,0 			//004C 	0C7C
		BTSS 	STATUS,0 		//004D 	1C03
		LJUMP 	62H 			//004E 	3862
		LDWI 	1H 			//004F 	2A01
		SUBWR 	7DH,0 			//0050 	0C7D
		LDWI 	EAH 			//0051 	2AEA
		BTSC 	STATUS,2 		//0052 	1503
		SUBWR 	7CH,0 			//0053 	0C7C
		BTSC 	STATUS,0 		//0054 	1403
		LJUMP 	62H 			//0055 	3862

		//;RF-car.C: 81: key=1;
		LDWI 	1H 			//0056 	2A01
		STR 	57H 			//0057 	01D7

		//;RF-car.C: 83: SEND_CODE(DataS[0][0],DataS[0][1],DataS[0][2]);
		LCALL 	1C8H 			//0058 	31C8
		LCALL 	2C6H 			//0059 	32C6

		//;RF-car.C: 84: SEND_CODE(DataS[0][0],DataS[0][1],DataS[0][2]);
		LCALL 	1C8H 			//005A 	31C8
		LCALL 	2C6H 			//005B 	32C6

		//;RF-car.C: 85: SEND_CODE(DataS[0][0],DataS[0][1],DataS[0][2]);
		LCALL 	1C8H 			//005C 	31C8
		LCALL 	2C6H 			//005D 	32C6

		//;RF-car.C: 86: SEND_CODE(DataS[0][0],DataS[0][1],DataS[0][2]);
		LCALL 	1C8H 			//005E 	31C8
		LCALL 	2C6H 			//005F 	32C6

		//;RF-car.C: 87: SEND_CODE(DataS[0][0],DataS[0][1],DataS[0][2]);
		LCALL 	1C8H 			//0060 	31C8
		LCALL 	2C6H 			//0061 	32C6

		//;RF-car.C: 90: }
		//;RF-car.C: 91: if(conterout>570 && conterout<610){
		LDWI 	2H 			//0062 	2A02
		SUBWR 	7DH,0 			//0063 	0C7D
		LDWI 	3BH 			//0064 	2A3B
		BTSC 	STATUS,2 		//0065 	1503
		SUBWR 	7CH,0 			//0066 	0C7C
		LDWI 	2H 			//0067 	2A02
		BTSS 	STATUS,0 		//0068 	1C03
		LJUMP 	7DH 			//0069 	387D
		SUBWR 	7DH,0 			//006A 	0C7D
		LDWI 	62H 			//006B 	2A62
		BTSC 	STATUS,2 		//006C 	1503
		SUBWR 	7CH,0 			//006D 	0C7C

		//;RF-car.C: 92: key=2;
		LDWI 	2H 			//006E 	2A02
		BTSC 	STATUS,0 		//006F 	1403
		LJUMP 	7DH 			//0070 	387D
		STR 	57H 			//0071 	01D7

		//;RF-car.C: 94: SEND_CODE(DataS[1][0],DataS[1][1],DataS[1][2]);
		LCALL 	1BCH 			//0072 	31BC
		LCALL 	2C6H 			//0073 	32C6

		//;RF-car.C: 95: SEND_CODE(DataS[1][0],DataS[1][1],DataS[1][2]);
		LCALL 	1BCH 			//0074 	31BC
		LCALL 	2C6H 			//0075 	32C6

		//;RF-car.C: 96: SEND_CODE(DataS[1][0],DataS[1][1],DataS[1][2]);
		LCALL 	1BCH 			//0076 	31BC
		LCALL 	2C6H 			//0077 	32C6

		//;RF-car.C: 97: SEND_CODE(DataS[1][0],DataS[1][1],DataS[1][2]);
		LCALL 	1BCH 			//0078 	31BC
		LCALL 	2C6H 			//0079 	32C6

		//;RF-car.C: 98: SEND_CODE(DataS[1][0],DataS[1][1],DataS[1][2]);
		LCALL 	1BCH 			//007A 	31BC
		LCALL 	2C6H 			//007B 	32C6

		//;RF-car.C: 100: }
		//;RF-car.C: 101: if(conterout>690 && conterout<725){
		LDWI 	2H 			//007C 	2A02
		SUBWR 	7DH,0 			//007D 	0C7D
		LDWI 	B3H 			//007E 	2AB3
		BTSC 	STATUS,2 		//007F 	1503
		SUBWR 	7CH,0 			//0080 	0C7C
		BTSS 	STATUS,0 		//0081 	1C03
		LJUMP 	96H 			//0082 	3896
		LDWI 	2H 			//0083 	2A02
		SUBWR 	7DH,0 			//0084 	0C7D
		LDWI 	D5H 			//0085 	2AD5
		BTSC 	STATUS,2 		//0086 	1503
		SUBWR 	7CH,0 			//0087 	0C7C

		//;RF-car.C: 102: key=3;
		LDWI 	3H 			//0088 	2A03
		BTSC 	STATUS,0 		//0089 	1403
		LJUMP 	97H 			//008A 	3897
		STR 	57H 			//008B 	01D7

		//;RF-car.C: 104: SEND_CODE(DataS[2][0],DataS[2][1],DataS[2][2]);
		LCALL 	1B6H 			//008C 	31B6
		LCALL 	2C6H 			//008D 	32C6

		//;RF-car.C: 105: SEND_CODE(DataS[2][0],DataS[2][1],DataS[2][2]);
		LCALL 	1B6H 			//008E 	31B6
		LCALL 	2C6H 			//008F 	32C6

		//;RF-car.C: 106: SEND_CODE(DataS[2][0],DataS[2][1],DataS[2][2]);
		LCALL 	1B6H 			//0090 	31B6
		LCALL 	2C6H 			//0091 	32C6

		//;RF-car.C: 107: SEND_CODE(DataS[2][0],DataS[2][1],DataS[2][2]);
		LCALL 	1B6H 			//0092 	31B6
		LCALL 	2C6H 			//0093 	32C6

		//;RF-car.C: 108: SEND_CODE(DataS[2][0],DataS[2][1],DataS[2][2]);
		LCALL 	1B6H 			//0094 	31B6
		LCALL 	2C6H 			//0095 	32C6

		//;RF-car.C: 110: }
		//;RF-car.C: 111: if(conterout>820 && conterout<850){
		LDWI 	3H 			//0096 	2A03
		SUBWR 	7DH,0 			//0097 	0C7D
		LDWI 	35H 			//0098 	2A35
		BTSC 	STATUS,2 		//0099 	1503
		SUBWR 	7CH,0 			//009A 	0C7C
		BTSS 	STATUS,0 		//009B 	1C03
		LJUMP 	B0H 			//009C 	38B0
		LDWI 	3H 			//009D 	2A03
		SUBWR 	7DH,0 			//009E 	0C7D
		LDWI 	52H 			//009F 	2A52
		BTSC 	STATUS,2 		//00A0 	1503
		SUBWR 	7CH,0 			//00A1 	0C7C
		BTSC 	STATUS,0 		//00A2 	1403
		LJUMP 	B0H 			//00A3 	38B0

		//;RF-car.C: 112: key=4;
		LDWI 	4H 			//00A4 	2A04
		STR 	57H 			//00A5 	01D7

		//;RF-car.C: 114: SEND_CODE(DataS[3][0],DataS[3][1],DataS[3][2]);
		LCALL 	1C2H 			//00A6 	31C2
		LCALL 	2C6H 			//00A7 	32C6

		//;RF-car.C: 115: SEND_CODE(DataS[3][0],DataS[3][1],DataS[3][2]);
		LCALL 	1C2H 			//00A8 	31C2
		LCALL 	2C6H 			//00A9 	32C6

		//;RF-car.C: 116: SEND_CODE(DataS[3][0],DataS[3][1],DataS[3][2]);
		LCALL 	1C2H 			//00AA 	31C2
		LCALL 	2C6H 			//00AB 	32C6

		//;RF-car.C: 117: SEND_CODE(DataS[3][0],DataS[3][1],DataS[3][2]);
		LCALL 	1C2H 			//00AC 	31C2
		LCALL 	2C6H 			//00AD 	32C6

		//;RF-car.C: 118: SEND_CODE(DataS[3][0],DataS[3][1],DataS[3][2]);
		LCALL 	1C2H 			//00AE 	31C2
		LCALL 	2C6H 			//00AF 	32C6

		//;RF-car.C: 120: }
		//;RF-car.C: 122: conterout=0;
		CLRR 	7CH 			//00B0 	017C
		CLRR 	7DH 			//00B1 	017D

		//;RF-car.C: 123: }
		//;RF-car.C: 126: if(PA5==1 && conterout>1150 && conterout<1210 ){
		BTSS 	5H,5 			//00B2 	1E85
		LJUMP 	C5H 			//00B3 	38C5
		LDWI 	4H 			//00B4 	2A04
		SUBWR 	7DH,0 			//00B5 	0C7D
		LDWI 	7FH 			//00B6 	2A7F
		BTSC 	STATUS,2 		//00B7 	1503
		SUBWR 	7CH,0 			//00B8 	0C7C
		BTSS 	STATUS,0 		//00B9 	1C03
		LJUMP 	C5H 			//00BA 	38C5
		LDWI 	4H 			//00BB 	2A04
		SUBWR 	7DH,0 			//00BC 	0C7D
		LDWI 	BAH 			//00BD 	2ABA
		BTSC 	STATUS,2 		//00BE 	1503
		SUBWR 	7CH,0 			//00BF 	0C7C
		BTSC 	STATUS,0 		//00C0 	1403
		LJUMP 	C5H 			//00C1 	38C5

		//;RF-car.C: 128: conterout++;
		INCR	7CH,1 			//00C2 	09FC
		BTSC 	STATUS,2 		//00C3 	1503
		INCR	7DH,1 			//00C4 	09FD

		//;RF-car.C: 130: }
		//;RF-car.C: 132: if(PA5==1 && conterout > 1210 && conterout<2100 ){
		BTSS 	5H,5 			//00C5 	1E85
		LJUMP 	117H 			//00C6 	3917
		LDWI 	4H 			//00C7 	2A04
		SUBWR 	7DH,0 			//00C8 	0C7D
		LDWI 	BBH 			//00C9 	2ABB
		BTSC 	STATUS,2 		//00CA 	1503
		SUBWR 	7CH,0 			//00CB 	0C7C
		BTSS 	STATUS,0 		//00CC 	1C03
		LJUMP 	117H 			//00CD 	3917
		LDWI 	8H 			//00CE 	2A08
		SUBWR 	7DH,0 			//00CF 	0C7D
		LDWI 	34H 			//00D0 	2A34
		BTSC 	STATUS,2 		//00D1 	1503
		SUBWR 	7CH,0 			//00D2 	0C7C
		BTSC 	STATUS,0 		//00D3 	1403
		LJUMP 	117H 			//00D4 	3917

		//;RF-car.C: 136: if(conterout>1550 && conterout<1590){
		LDWI 	6H 			//00D5 	2A06
		SUBWR 	7DH,0 			//00D6 	0C7D
		LDWI 	FH 			//00D7 	2A0F
		BTSC 	STATUS,2 		//00D8 	1503
		SUBWR 	7CH,0 			//00D9 	0C7C
		LDWI 	6H 			//00DA 	2A06
		BTSS 	STATUS,0 		//00DB 	1C03
		LJUMP 	E6H 			//00DC 	38E6
		SUBWR 	7DH,0 			//00DD 	0C7D
		LDWI 	36H 			//00DE 	2A36
		BTSC 	STATUS,2 		//00DF 	1503
		SUBWR 	7CH,0 			//00E0 	0C7C
		BTSC 	STATUS,0 		//00E1 	1403
		LJUMP 	E5H 			//00E2 	38E5

		//;RF-car.C: 137: key=5;
		LDWI 	5H 			//00E3 	2A05
		STR 	57H 			//00E4 	01D7

		//;RF-car.C: 138: }
		//;RF-car.C: 139: if(conterout>1670 && conterout<1710){
		LDWI 	6H 			//00E5 	2A06
		SUBWR 	7DH,0 			//00E6 	0C7D
		LDWI 	87H 			//00E7 	2A87
		BTSC 	STATUS,2 		//00E8 	1503
		SUBWR 	7CH,0 			//00E9 	0C7C
		LDWI 	6H 			//00EA 	2A06
		BTSS 	STATUS,0 		//00EB 	1C03
		LJUMP 	F4H 			//00EC 	38F4
		SUBWR 	7DH,0 			//00ED 	0C7D
		LDWI 	AEH 			//00EE 	2AAE
		BTSC 	STATUS,2 		//00EF 	1503
		SUBWR 	7CH,0 			//00F0 	0C7C

		//;RF-car.C: 140: key=6;
		LDWI 	6H 			//00F1 	2A06
		BTSS 	STATUS,0 		//00F2 	1C03
		STR 	57H 			//00F3 	01D7

		//;RF-car.C: 141: }
		//;RF-car.C: 142: if(conterout>1780 && conterout<1830){
		SUBWR 	7DH,0 			//00F4 	0C7D
		LDWI 	F5H 			//00F5 	2AF5
		BTSC 	STATUS,2 		//00F6 	1503
		SUBWR 	7CH,0 			//00F7 	0C7C
		LDWI 	7H 			//00F8 	2A07
		BTSS 	STATUS,0 		//00F9 	1C03
		LJUMP 	102H 			//00FA 	3902
		SUBWR 	7DH,0 			//00FB 	0C7D
		LDWI 	26H 			//00FC 	2A26
		BTSC 	STATUS,2 		//00FD 	1503
		SUBWR 	7CH,0 			//00FE 	0C7C

		//;RF-car.C: 143: key=7;
		LDWI 	7H 			//00FF 	2A07
		BTSS 	STATUS,0 		//0100 	1C03
		STR 	57H 			//0101 	01D7

		//;RF-car.C: 144: }
		//;RF-car.C: 145: if(conterout>1900 && conterout<1950){
		SUBWR 	7DH,0 			//0102 	0C7D
		LDWI 	6DH 			//0103 	2A6D
		BTSC 	STATUS,2 		//0104 	1503
		SUBWR 	7CH,0 			//0105 	0C7C
		BTSS 	STATUS,0 		//0106 	1C03
		LJUMP 	111H 			//0107 	3911
		LDWI 	7H 			//0108 	2A07
		SUBWR 	7DH,0 			//0109 	0C7D
		LDWI 	9EH 			//010A 	2A9E
		BTSC 	STATUS,2 		//010B 	1503
		SUBWR 	7CH,0 			//010C 	0C7C
		BTSC 	STATUS,0 		//010D 	1403
		LJUMP 	111H 			//010E 	3911

		//;RF-car.C: 146: key=8;
		LDWI 	8H 			//010F 	2A08
		STR 	57H 			//0110 	01D7

		//;RF-car.C: 147: }
		//;RF-car.C: 149: conterout=0;
		CLRR 	7CH 			//0111 	017C
		CLRR 	7DH 			//0112 	017D

		//;RF-car.C: 150: TMR2IE = 1;
		BSR 	STATUS,5 		//0113 	1A83
		BSR 	CH,1 			//0114 	188C

		//;RF-car.C: 151: T0IE=0;
		BCR 	INTCON,5 		//0115 	128B

		//;RF-car.C: 152: Learn=1;
		BSR 	7BH,2 			//0116 	197B

		//;RF-car.C: 155: }
		//;RF-car.C: 162: }
		//;RF-car.C: 166: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//0117 	1A83
		BTSS 	CH,1 			//0118 	1C8C
		LJUMP 	1A1H 			//0119 	39A1
		BCR 	STATUS,5 		//011A 	1283
		BTSS 	CH,1 			//011B 	1C8C
		LJUMP 	1A1H 			//011C 	39A1

		//;RF-car.C: 167: {
		//;RF-car.C: 169: conterout++;
		INCR	7CH,1 			//011D 	09FC
		BTSC 	STATUS,2 		//011E 	1503
		INCR	7DH,1 			//011F 	09FD

		//;RF-car.C: 170: if(conterout>=10000){conterout=0; PA1=!PA1;contlern++;}
		LDWI 	27H 			//0120 	2A27
		SUBWR 	7DH,0 			//0121 	0C7D
		LDWI 	10H 			//0122 	2A10
		BTSC 	STATUS,2 		//0123 	1503
		SUBWR 	7CH,0 			//0124 	0C7C
		BTSS 	STATUS,0 		//0125 	1C03
		LJUMP 	12CH 			//0126 	392C
		CLRR 	7CH 			//0127 	017C
		CLRR 	7DH 			//0128 	017D
		LDWI 	2H 			//0129 	2A02
		XORWR 	5H,1 			//012A 	0485
		INCR	5CH,1 			//012B 	09DC

		//;RF-car.C: 171: if(contlern>30){
		LDWI 	1FH 			//012C 	2A1F
		SUBWR 	5CH,0 			//012D 	0C5C
		BTSS 	STATUS,0 		//012E 	1C03
		LJUMP 	132H 			//012F 	3932

		//;RF-car.C: 172: key=0;
		//;RF-car.C: 173: Lock=0;
		//;RF-car.C: 174: Learn=0;
		//;RF-car.C: 176: TMR2IE = 0;
		//;RF-car.C: 177: conterout=0;
		//;RF-car.C: 178: PA1=1;
		//;RF-car.C: 180: T0IE=1;
		LCALL 	1ABH 			//0130 	31AB

		//;RF-car.C: 181: contlern=0;
		CLRR 	5CH 			//0131 	015C

		//;RF-car.C: 182: }
		//;RF-car.C: 185: TMR2IF = 0;
		BCR 	CH,1 			//0132 	108C
		CLRWDT	 			//0133 	0001

		//;RF-car.C: 187: if(PA2==0){
		BCR 	STATUS,5 		//0134 	1283
		BTSC 	5H,2 			//0135 	1505
		LJUMP 	13CH 			//0136 	393C

		//;RF-car.C: 188: Time++;Frist=1;Timer=0;
		INCR	5DH,1 			//0137 	09DD
		BSR 	7BH,3 			//0138 	19FB
		CLRR 	55H 			//0139 	0155
		CLRR 	56H 			//013A 	0156

		//;RF-car.C: 189: }
		LJUMP 	1A1H 			//013B 	39A1

		//;RF-car.C: 190: else
		//;RF-car.C: 191: {
		//;RF-car.C: 193: Timer++;
		INCR	55H,1 			//013C 	09D5
		BTSC 	STATUS,2 		//013D 	1503
		INCR	56H,1 			//013E 	09D6

		//;RF-car.C: 194: if(Timer>250){Timer=0;Finish=0;}
		LDWI 	0H 			//013F 	2A00
		SUBWR 	56H,0 			//0140 	0C56
		LDWI 	FBH 			//0141 	2AFB
		BTSC 	STATUS,2 		//0142 	1503
		SUBWR 	55H,0 			//0143 	0C55
		BTSS 	STATUS,0 		//0144 	1C03
		LJUMP 	149H 			//0145 	3949
		CLRR 	55H 			//0146 	0155
		CLRR 	56H 			//0147 	0156
		BCR 	7BH,1 			//0148 	10FB

		//;RF-car.C: 195: if(Frist==1 & Finish==0)
		BTSS 	7BH,1 			//0149 	1CFB
		BTSS 	7BH,3 			//014A 	1DFB
		LJUMP 	1A1H 			//014B 	39A1

		//;RF-car.C: 196: {
		//;RF-car.C: 197: Timer=0;
		CLRR 	55H 			//014C 	0155
		CLRR 	56H 			//014D 	0156

		//;RF-car.C: 198: if(Start==1)
		DECRSZ 	5BH,0 		//014E 	0E5B
		LJUMP 	193H 			//014F 	3993

		//;RF-car.C: 199: {
		//;RF-car.C: 200: Bit--;
		DECR 	58H,1 			//0150 	0DD8

		//;RF-car.C: 201: if(Time>10 & Time< 30)
		LDWI 	BH 			//0151 	2A0B
		SUBWR 	5DH,0 			//0152 	0C5D
		BTSS 	STATUS,0 		//0153 	1C03
		LJUMP 	15DH 			//0154 	395D
		LDWI 	1EH 			//0155 	2A1E
		SUBWR 	5DH,0 			//0156 	0C5D
		BTSC 	STATUS,0 		//0157 	1403
		LJUMP 	15CH 			//0158 	395C

		//;RF-car.C: 202: {
		//;RF-car.C: 203: Buffer = Buffer << 1;
		BCR 	STATUS,0 		//0159 	1003
		RLR 	59H,0 			//015A 	0559
		LJUMP 	161H 			//015B 	3961

		//;RF-car.C: 204: }
		//;RF-car.C: 205: else
		//;RF-car.C: 206: {
		//;RF-car.C: 207: Buffer = Buffer << 1;
		BCR 	STATUS,0 		//015C 	1003
		RLR 	59H,0 			//015D 	0559
		STR 	59H 			//015E 	01D9

		//;RF-car.C: 208: Buffer = Buffer + 1;
		LDR 	59H,0 			//015F 	0859
		ADDWI 	1H 			//0160 	2701
		STR 	59H 			//0161 	01D9

		//;RF-car.C: 210: }
		//;RF-car.C: 211: if(Bit == 0)
		LDR 	58H,0 			//0162 	0858
		BTSS 	STATUS,2 		//0163 	1D03
		LJUMP 	193H 			//0164 	3993

		//;RF-car.C: 212: {
		//;RF-car.C: 213: Bit=8;
		LDWI 	8H 			//0165 	2A08
		STR 	58H 			//0166 	01D8

		//;RF-car.C: 214: Data[Count]=RFData[Count];
		LDR 	5AH,0 			//0167 	085A
		ADDWI 	4CH 			//0168 	274C
		STR 	FSR 			//0169 	0184
		BCR 	STATUS,7 		//016A 	1383
		LDR 	INDF,0 			//016B 	0800
		STR 	5EH 			//016C 	01DE
		LDR 	5AH,0 			//016D 	085A
		ADDWI 	52H 			//016E 	2752
		STR 	FSR 			//016F 	0184
		LDR 	5EH,0 			//0170 	085E
		STR 	INDF 			//0171 	0180

		//;RF-car.C: 215: RFData[Count]=Buffer;
		LDR 	5AH,0 			//0172 	085A
		ADDWI 	4CH 			//0173 	274C
		STR 	FSR 			//0174 	0184
		LDR 	59H,0 			//0175 	0859
		STR 	INDF 			//0176 	0180

		//;RF-car.C: 216: Count++;
		INCR	5AH,1 			//0177 	09DA

		//;RF-car.C: 218: if(Count>=3)
		LDWI 	3H 			//0178 	2A03
		SUBWR 	5AH,0 			//0179 	0C5A
		BTSS 	STATUS,0 		//017A 	1C03
		LJUMP 	192H 			//017B 	3992

		//;RF-car.C: 219: {
		//;RF-car.C: 220: Count=0;
		CLRR 	5AH 			//017C 	015A

		//;RF-car.C: 221: Start=0;
		CLRR 	5BH 			//017D 	015B

		//;RF-car.C: 222: if(Data[0]==RFData[0] && Data[1]==RFData[1] &&Data[2]==RFData[2])
		LDR 	52H,0 			//017E 	0852
		XORWR 	4CH,0 			//017F 	044C
		BTSS 	STATUS,2 		//0180 	1D03
		LJUMP 	192H 			//0181 	3992
		LDR 	53H,0 			//0182 	0853
		XORWR 	4DH,0 			//0183 	044D
		BTSS 	STATUS,2 		//0184 	1D03
		LJUMP 	192H 			//0185 	3992
		LDR 	54H,0 			//0186 	0854
		XORWR 	4EH,0 			//0187 	044E
		BTSS 	STATUS,2 		//0188 	1D03
		LJUMP 	192H 			//0189 	3992

		//;RF-car.C: 223: {
		//;RF-car.C: 224: DataM[0]=RFData[0];
		LDR 	4CH,0 			//018A 	084C
		STR 	4FH 			//018B 	01CF

		//;RF-car.C: 225: DataM[1]=RFData[1];
		LDR 	4DH,0 			//018C 	084D
		STR 	50H 			//018D 	01D0

		//;RF-car.C: 226: DataM[2]=RFData[2];
		LDR 	4EH,0 			//018E 	084E
		STR 	51H 			//018F 	01D1

		//;RF-car.C: 228: Finish=1;
		BSR 	7BH,1 			//0190 	18FB

		//;RF-car.C: 229: Lock=1;
		BSR 	7BH,0 			//0191 	187B

		//;RF-car.C: 230: }
		//;RF-car.C: 231: }
		//;RF-car.C: 232: Buffer=0;
		CLRR 	59H 			//0192 	0159

		//;RF-car.C: 233: }
		//;RF-car.C: 234: }
		//;RF-car.C: 235: if(Time>120 & Time<250){Start=1;Bit=8;}
		LDWI 	79H 			//0193 	2A79
		SUBWR 	5DH,0 			//0194 	0C5D
		BTSS 	STATUS,0 		//0195 	1C03
		LJUMP 	19FH 			//0196 	399F
		LDWI 	FAH 			//0197 	2AFA
		SUBWR 	5DH,0 			//0198 	0C5D
		BTSC 	STATUS,0 		//0199 	1403
		LJUMP 	19FH 			//019A 	399F
		LDWI 	1H 			//019B 	2A01
		STR 	5BH 			//019C 	01DB
		LDWI 	8H 			//019D 	2A08
		STR 	58H 			//019E 	01D8

		//;RF-car.C: 236: Frist=0;
		BCR 	7BH,3 			//019F 	11FB

		//;RF-car.C: 237: Time=0;
		CLRR 	5DH 			//01A0 	015D
		BCR 	STATUS,5 		//01A1 	1283
		LDR 	61H,0 			//01A2 	0861
		STR 	PCLATH 			//01A3 	018A
		LDR 	60H,0 			//01A4 	0860
		STR 	FSR 			//01A5 	0184
		SWAPR 	5FH,0 			//01A6 	075F
		STR 	STATUS 			//01A7 	0183
		SWAPR 	7EH,1 			//01A8 	07FE
		SWAPR 	7EH,0 			//01A9 	077E
		RETI		 			//01AA 	0009
		CLRR 	57H 			//01AB 	0157
		BCR 	7BH,0 			//01AC 	107B
		BCR 	7BH,2 			//01AD 	117B
		BSR 	STATUS,5 		//01AE 	1A83
		BCR 	CH,1 			//01AF 	108C
		CLRR 	7CH 			//01B0 	017C
		CLRR 	7DH 			//01B1 	017D
		BCR 	STATUS,5 		//01B2 	1283
		BSR 	5H,1 			//01B3 	1885
		BSR 	INTCON,5 		//01B4 	1A8B
		RET		 					//01B5 	0004
		LDR 	47H,0 			//01B6 	0847
		STR 	78H 			//01B7 	01F8
		LDR 	48H,0 			//01B8 	0848
		STR 	79H 			//01B9 	01F9
		LDR 	46H,0 			//01BA 	0846
		RET		 					//01BB 	0004
		LDR 	44H,0 			//01BC 	0844
		STR 	78H 			//01BD 	01F8
		LDR 	45H,0 			//01BE 	0845
		STR 	79H 			//01BF 	01F9
		LDR 	43H,0 			//01C0 	0843
		RET		 					//01C1 	0004
		LDR 	4AH,0 			//01C2 	084A
		STR 	78H 			//01C3 	01F8
		LDR 	4BH,0 			//01C4 	084B
		STR 	79H 			//01C5 	01F9
		LDR 	49H,0 			//01C6 	0849
		RET		 					//01C7 	0004
		LDR 	41H,0 			//01C8 	0841
		STR 	78H 			//01C9 	01F8
		LDR 	42H,0 			//01CA 	0842
		STR 	79H 			//01CB 	01F9
		LDR 	40H,0 			//01CC 	0840
		RET		 					//01CD 	0004

		//;RF-car.C: 250: POWER_INITIAL();
		LCALL 	2D9H 			//01CE 	32D9

		//;RF-car.C: 251: TIMER2_INITIAL();
		LCALL 	2E8H 			//01CF 	32E8

		//;RF-car.C: 252: TIMER0_INITIAL();
		LCALL 	309H 			//01D0 	3309

		//;RF-car.C: 255: PA1=1;
		BSR 	5H,1 			//01D1 	1885

		//;RF-car.C: 259: char i;
		//;RF-car.C: 260: for(i=0;i<4;i++)
		CLRR 	6BH 			//01D2 	016B
		CLRWDT	 			//01D3 	0001

		//;RF-car.C: 263: DataS[i][0]=EEPROMread(i*3);
		BCR 	STATUS,5 		//01D4 	1283
		LDR 	6BH,0 			//01D5 	086B
		ADDWR 	6BH,0 			//01D6 	0B6B
		ADDWR 	6BH,0 			//01D7 	0B6B
		ADDWI 	40H 			//01D8 	2740
		STR 	FSR 			//01D9 	0184
		LDR 	6BH,0 			//01DA 	086B
		ADDWR 	6BH,0 			//01DB 	0B6B
		ADDWR 	6BH,0 			//01DC 	0B6B
		LCALL 	31AH 			//01DD 	331A

		//;RF-car.C: 264: DataS[i][1]=EEPROMread((i*3)+1);
		LCALL 	230H 			//01DE 	3230
		ADDWI 	41H 			//01DF 	2741
		STR 	FSR 			//01E0 	0184
		LDR 	6BH,0 			//01E1 	086B
		ADDWR 	6BH,0 			//01E2 	0B6B
		ADDWR 	6BH,0 			//01E3 	0B6B
		ADDWI 	1H 			//01E4 	2701
		LCALL 	31AH 			//01E5 	331A

		//;RF-car.C: 265: DataS[i][2]=EEPROMread((i*3)+2);
		LCALL 	230H 			//01E6 	3230
		ADDWI 	42H 			//01E7 	2742
		STR 	FSR 			//01E8 	0184
		LDR 	6BH,0 			//01E9 	086B
		ADDWR 	6BH,0 			//01EA 	0B6B
		ADDWR 	6BH,0 			//01EB 	0B6B
		ADDWI 	2H 			//01EC 	2702
		LCALL 	31AH 			//01ED 	331A
		BCR 	STATUS,7 		//01EE 	1383
		STR 	INDF 			//01EF 	0180
		LDWI 	4H 			//01F0 	2A04
		INCR	6BH,1 			//01F1 	09EB
		SUBWR 	6BH,0 			//01F2 	0C6B
		BTSS 	STATUS,0 		//01F3 	1C03
		LJUMP 	1D3H 			//01F4 	39D3

		//;RF-car.C: 266: }
		//;RF-car.C: 269: Start=0;
		CLRR 	5BH 			//01F5 	015B

		//;RF-car.C: 271: PA4 = 0;
		BCR 	5H,4 			//01F6 	1205

		//;RF-car.C: 273: while(1)
		CLRWDT	 			//01F7 	0001

		//;RF-car.C: 280: if(Learn==1)
		BTSC 	7BH,2 			//01F8 	157B

		//;RF-car.C: 281: {
		//;RF-car.C: 284: if(Lock==1)
		BTSS 	7BH,0 			//01F9 	1C7B
		LJUMP 	1F7H 			//01FA 	39F7

		//;RF-car.C: 285: {
		//;RF-car.C: 288: EEPROMwrite(((key-5)*3),DataM[0]);
		BCR 	STATUS,5 		//01FB 	1283
		LDR 	4FH,0 			//01FC 	084F
		STR 	62H 			//01FD 	01E2
		LDWI 	FBH 			//01FE 	2AFB
		ADDWR 	57H,0 			//01FF 	0B57
		STR 	6AH 			//0200 	01EA
		ADDWR 	6AH,0 			//0201 	0B6A
		ADDWR 	6AH,0 			//0202 	0B6A
		LCALL 	2B1H 			//0203 	32B1

		//;RF-car.C: 289: DelayMs(10);
		LCALL 	236H 			//0204 	3236
		LCALL 	279H 			//0205 	3279

		//;RF-car.C: 290: EEPROMwrite((((key-5)*3)+1),DataM[1]);
		LDR 	50H,0 			//0206 	0850
		STR 	62H 			//0207 	01E2
		LDR 	57H,0 			//0208 	0857
		ADDWR 	57H,0 			//0209 	0B57
		ADDWR 	57H,0 			//020A 	0B57
		ADDWI 	F2H 			//020B 	27F2
		LCALL 	2B1H 			//020C 	32B1

		//;RF-car.C: 291: DelayMs(10);
		LCALL 	236H 			//020D 	3236
		LCALL 	279H 			//020E 	3279

		//;RF-car.C: 292: EEPROMwrite((((key-5)*3)+2),DataM[2]);
		LDR 	51H,0 			//020F 	0851
		STR 	62H 			//0210 	01E2
		LDR 	57H,0 			//0211 	0857
		ADDWR 	57H,0 			//0212 	0B57
		ADDWR 	57H,0 			//0213 	0B57
		ADDWI 	F3H 			//0214 	27F3
		LCALL 	2B1H 			//0215 	32B1

		//;RF-car.C: 293: DelayMs(10);
		LCALL 	236H 			//0216 	3236
		LCALL 	279H 			//0217 	3279

		//;RF-car.C: 294: DataS[key-5][0]=DataM[0];
		LDR 	57H,0 			//0218 	0857
		ADDWR 	57H,0 			//0219 	0B57
		ADDWR 	57H,0 			//021A 	0B57
		ADDWI 	31H 			//021B 	2731
		STR 	FSR 			//021C 	0184
		LDR 	4FH,0 			//021D 	084F
		BCR 	STATUS,7 		//021E 	1383
		STR 	INDF 			//021F 	0180

		//;RF-car.C: 295: DataS[key-5][1]=DataM[1];
		LDR 	57H,0 			//0220 	0857
		ADDWR 	57H,0 			//0221 	0B57
		ADDWR 	57H,0 			//0222 	0B57
		ADDWI 	32H 			//0223 	2732
		STR 	FSR 			//0224 	0184
		LDR 	50H,0 			//0225 	0850
		STR 	INDF 			//0226 	0180

		//;RF-car.C: 296: DataS[key-5][2]=DataM[2];
		LDR 	57H,0 			//0227 	0857
		ADDWR 	57H,0 			//0228 	0B57
		ADDWR 	57H,0 			//0229 	0B57
		ADDWI 	33H 			//022A 	2733
		STR 	FSR 			//022B 	0184
		LDR 	51H,0 			//022C 	0851
		STR 	INDF 			//022D 	0180

		//;RF-car.C: 299: key=0;
		//;RF-car.C: 300: Lock=0;
		//;RF-car.C: 301: Learn=0;
		//;RF-car.C: 303: TMR2IE = 0;
		//;RF-car.C: 304: conterout=0;
		//;RF-car.C: 305: PA1=1;
		//;RF-car.C: 307: T0IE=1;
		LCALL 	1ABH 			//022E 	31AB
		LJUMP 	1F7H 			//022F 	39F7
		BCR 	STATUS,7 		//0230 	1383
		STR 	INDF 			//0231 	0180
		LDR 	6BH,0 			//0232 	086B
		ADDWR 	6BH,0 			//0233 	0B6B
		ADDWR 	6BH,0 			//0234 	0B6B
		RET		 					//0235 	0004
		LDWI 	AH 			//0236 	2A0A
		BCR 	STATUS,5 		//0237 	1283
		STR 	64H 			//0238 	01E4
		CLRR 	65H 			//0239 	0165
		RET		 					//023A 	0004
		STR 	73H 			//023B 	01F3

		//;RF-car.C: 412: unsigned char Byte = 0b10000000, i = 0;
		LDWI 	80H 			//023C 	2A80
		STR 	74H 			//023D 	01F4

		//;RF-car.C: 413: for(i = 0; i <= 7; i++)
		CLRR 	75H 			//023E 	0175

		//;RF-car.C: 414: {
		//;RF-car.C: 415: if(Code & (Byte >> i))
		LDR 	74H,0 			//023F 	0874
		STR 	72H 			//0240 	01F2
		INCR	75H,0 			//0241 	0975
		LJUMP 	245H 			//0242 	3A45
		BCR 	STATUS,0 		//0243 	1003
		RRR	72H,1 			//0244 	06F2
		ADDWI 	FFH 			//0245 	27FF
		BTSS 	STATUS,2 		//0246 	1D03
		LJUMP 	243H 			//0247 	3A43
		LDR 	72H,0 			//0248 	0872
		ANDWR 	73H,0 			//0249 	0273

		//;RF-car.C: 416: {
		//;RF-car.C: 417: PA4 = 1;
		BCR 	STATUS,5 		//024A 	1283
		BTSC 	STATUS,2 		//024B 	1503
		LJUMP 	260H 			//024C 	3A60
		BSR 	5H,4 			//024D 	1A05

		//;RF-car.C: 418: DelayUs(420);
		LDWI 	A4H 			//024E 	2AA4
		LCALL 	2FFH 			//024F 	32FF

		//;RF-car.C: 419: DelayUs(420);
		LDWI 	A4H 			//0250 	2AA4
		LCALL 	2FFH 			//0251 	32FF

		//;RF-car.C: 420: DelayUs(420);
		LDWI 	A4H 			//0252 	2AA4
		LCALL 	2FFH 			//0253 	32FF

		//;RF-car.C: 422: PA4 = 0;
		BCR 	STATUS,5 		//0254 	1283
		BCR 	5H,4 			//0255 	1205

		//;RF-car.C: 423: DelayUs(800);
		LDWI 	20H 			//0256 	2A20
		LCALL 	2FFH 			//0257 	32FF

		//;RF-car.C: 424: DelayUs(800);
		LDWI 	20H 			//0258 	2A20
		LCALL 	2FFH 			//0259 	32FF

		//;RF-car.C: 425: DelayUs(800);
		LDWI 	20H 			//025A 	2A20
		LCALL 	2FFH 			//025B 	32FF

		//;RF-car.C: 426: DelayUs(800);
		LDWI 	20H 			//025C 	2A20
		LCALL 	2FFH 			//025D 	32FF

		//;RF-car.C: 427: DelayUs(800);
		LDWI 	20H 			//025E 	2A20
		LJUMP 	272H 			//025F 	3A72

		//;RF-car.C: 429: else
		//;RF-car.C: 430: {
		//;RF-car.C: 431: PA4 = 1;
		//;RF-car.C: 428: }
		BSR 	5H,4 			//0260 	1A05

		//;RF-car.C: 432: DelayUs(800);
		LDWI 	20H 			//0261 	2A20
		LCALL 	2FFH 			//0262 	32FF

		//;RF-car.C: 433: DelayUs(800);
		LDWI 	20H 			//0263 	2A20
		LCALL 	2FFH 			//0264 	32FF

		//;RF-car.C: 434: DelayUs(800);
		LDWI 	20H 			//0265 	2A20
		LCALL 	2FFH 			//0266 	32FF

		//;RF-car.C: 435: DelayUs(800);
		LDWI 	20H 			//0267 	2A20
		LCALL 	2FFH 			//0268 	32FF

		//;RF-car.C: 436: DelayUs(800);
		LDWI 	20H 			//0269 	2A20
		LCALL 	2FFH 			//026A 	32FF

		//;RF-car.C: 438: PA4 = 0;
		BCR 	STATUS,5 		//026B 	1283
		BCR 	5H,4 			//026C 	1205

		//;RF-car.C: 439: DelayUs(420);
		LDWI 	A4H 			//026D 	2AA4
		LCALL 	2FFH 			//026E 	32FF

		//;RF-car.C: 440: DelayUs(420);
		LDWI 	A4H 			//026F 	2AA4
		LCALL 	2FFH 			//0270 	32FF

		//;RF-car.C: 441: DelayUs(420);
		LDWI 	A4H 			//0271 	2AA4
		LCALL 	2FFH 			//0272 	32FF
		LDWI 	8H 			//0273 	2A08
		INCR	75H,1 			//0274 	09F5
		SUBWR 	75H,0 			//0275 	0C75
		BTSC 	STATUS,0 		//0276 	1403
		RET		 					//0277 	0004
		LJUMP 	23FH 			//0278 	3A3F

		//;RF-car.C: 399: unsigned int a,b;
		//;RF-car.C: 400: for(a=0;a<Time;a++)
		CLRR 	66H 			//0279 	0166
		CLRR 	67H 			//027A 	0167
		LDR 	65H,0 			//027B 	0865
		SUBWR 	67H,0 			//027C 	0C67
		BTSS 	STATUS,2 		//027D 	1D03
		LJUMP 	281H 			//027E 	3A81
		LDR 	64H,0 			//027F 	0864
		SUBWR 	66H,0 			//0280 	0C66
		BTSC 	STATUS,0 		//0281 	1403
		RET		 					//0282 	0004

		//;RF-car.C: 401: {
		//;RF-car.C: 402: for(b=0;b<5;b++)
		CLRR 	68H 			//0283 	0168
		CLRR 	69H 			//0284 	0169

		//;RF-car.C: 403: {
		//;RF-car.C: 404: DelayUs(197);
		LDWI 	C5H 			//0285 	2AC5
		LCALL 	2F4H 			//0286 	32F4
		INCR	68H,1 			//0287 	09E8
		BTSC 	STATUS,2 		//0288 	1503
		INCR	69H,1 			//0289 	09E9
		LDWI 	0H 			//028A 	2A00
		SUBWR 	69H,0 			//028B 	0C69
		LDWI 	5H 			//028C 	2A05
		BTSC 	STATUS,2 		//028D 	1503
		SUBWR 	68H,0 			//028E 	0C68
		BTSS 	STATUS,0 		//028F 	1C03
		LJUMP 	285H 			//0290 	3A85
		INCR	66H,1 			//0291 	09E6
		BTSC 	STATUS,2 		//0292 	1503
		INCR	67H,1 			//0293 	09E7
		LJUMP 	27BH 			//0294 	3A7B

		//;RF-car.C: 399: unsigned int a,b;
		//;RF-car.C: 400: for(a=0;a<Time;a++)
		CLRR 	74H 			//0295 	0174
		CLRR 	75H 			//0296 	0175
		LDR 	73H,0 			//0297 	0873
		SUBWR 	75H,0 			//0298 	0C75
		BTSS 	STATUS,2 		//0299 	1D03
		LJUMP 	29DH 			//029A 	3A9D
		LDR 	72H,0 			//029B 	0872
		SUBWR 	74H,0 			//029C 	0C74
		BTSC 	STATUS,0 		//029D 	1403
		RET		 					//029E 	0004

		//;RF-car.C: 401: {
		//;RF-car.C: 402: for(b=0;b<5;b++)
		CLRR 	76H 			//029F 	0176
		CLRR 	77H 			//02A0 	0177

		//;RF-car.C: 403: {
		//;RF-car.C: 404: DelayUs(197);
		LDWI 	C5H 			//02A1 	2AC5
		LCALL 	2FFH 			//02A2 	32FF
		INCR	76H,1 			//02A3 	09F6
		BTSC 	STATUS,2 		//02A4 	1503
		INCR	77H,1 			//02A5 	09F7
		LDWI 	0H 			//02A6 	2A00
		SUBWR 	77H,0 			//02A7 	0C77
		LDWI 	5H 			//02A8 	2A05
		BTSC 	STATUS,2 		//02A9 	1503
		SUBWR 	76H,0 			//02AA 	0C76
		BTSS 	STATUS,0 		//02AB 	1C03
		LJUMP 	2A1H 			//02AC 	3AA1
		INCR	74H,1 			//02AD 	09F4
		BTSC 	STATUS,2 		//02AE 	1503
		INCR	75H,1 			//02AF 	09F5
		LJUMP 	297H 			//02B0 	3A97
		STR 	63H 			//02B1 	01E3

		//;RF-car.C: 376: GIE = 0;
		BCR 	INTCON,7 		//02B2 	138B

		//;RF-car.C: 377: while(GIE);
		BTSC 	INTCON,7 		//02B3 	178B
		LJUMP 	2B3H 			//02B4 	3AB3

		//;RF-car.C: 378: EEADR = EEAddr;
		LDR 	63H,0 			//02B5 	0863
		BSR 	STATUS,5 		//02B6 	1A83
		STR 	1BH 			//02B7 	019B

		//;RF-car.C: 379: EEDAT = Data;
		BCR 	STATUS,5 		//02B8 	1283
		LDR 	62H,0 			//02B9 	0862
		BSR 	STATUS,5 		//02BA 	1A83
		STR 	1AH 			//02BB 	019A

		//;RF-car.C: 380: EEIF = 0;
		BCR 	STATUS,5 		//02BC 	1283
		BCR 	CH,7 			//02BD 	138C

		//;RF-car.C: 381: EECON1 |= 0x34;
		LDWI 	34H 			//02BE 	2A34
		BSR 	STATUS,5 		//02BF 	1A83
		IORWR 	1CH,1 			//02C0 	039C

		//;RF-car.C: 382: WR = 1;
		BSR 	1DH,0 			//02C1 	181D

		//;RF-car.C: 383: while(WR);
		BTSC 	1DH,0 			//02C2 	141D
		LJUMP 	2C2H 			//02C3 	3AC2

		//;RF-car.C: 384: GIE = 1;
		BSR 	INTCON,7 		//02C4 	1B8B
		RET		 					//02C5 	0004
		STR 	7AH 			//02C6 	01FA

		//;RF-car.C: 449: PA4=0;
		BCR 	5H,4 			//02C7 	1205

		//;RF-car.C: 450: DelayMs(5);
		LDWI 	5H 			//02C8 	2A05
		STR 	72H 			//02C9 	01F2
		CLRR 	73H 			//02CA 	0173
		LCALL 	295H 			//02CB 	3295

		//;RF-car.C: 451: SEND_DATA(Code1);
		LDR 	7AH,0 			//02CC 	087A
		LCALL 	23BH 			//02CD 	323B

		//;RF-car.C: 452: SEND_DATA(Code2);
		LDR 	78H,0 			//02CE 	0878
		LCALL 	23BH 			//02CF 	323B

		//;RF-car.C: 453: SEND_DATA(Code3);
		LDR 	79H,0 			//02D0 	0879
		LCALL 	23BH 			//02D1 	323B

		//;RF-car.C: 455: PA4 = 1;
		BCR 	STATUS,5 		//02D2 	1283
		BSR 	5H,4 			//02D3 	1A05

		//;RF-car.C: 456: DelayUs(410);
		LDWI 	9AH 			//02D4 	2A9A
		LCALL 	2FFH 			//02D5 	32FF

		//;RF-car.C: 458: PA4 = 0;
		BCR 	STATUS,5 		//02D6 	1283
		BCR 	5H,4 			//02D7 	1205
		RET		 					//02D8 	0004

		//;RF-car.C: 325: OSCCON = 0B01110000;
		LDWI 	70H 			//02D9 	2A70
		BSR 	STATUS,5 		//02DA 	1A83
		STR 	FH 			//02DB 	018F

		//;RF-car.C: 327: INTCON = 0;
		CLRR 	INTCON 			//02DC 	010B

		//;RF-car.C: 328: OPTION = 0B00001000;
		LDWI 	8H 			//02DD 	2A08
		STR 	1H 			//02DE 	0181

		//;RF-car.C: 330: PORTA = 0B00000000;
		BCR 	STATUS,5 		//02DF 	1283
		CLRR 	5H 			//02E0 	0105

		//;RF-car.C: 331: TRISA = 0B00100100;
		LDWI 	24H 			//02E1 	2A24
		BSR 	STATUS,5 		//02E2 	1A83
		STR 	5H 			//02E3 	0185

		//;RF-car.C: 333: WPUA = 0B00100100;
		STR 	15H 			//02E4 	0195

		//;RF-car.C: 335: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//02E5 	1283
		CLRR 	1BH 			//02E6 	011B
		RET		 					//02E7 	0004

		//;RF-car.C: 341: T2CON = 0B00000001;
		LDWI 	1H 			//02E8 	2A01
		STR 	12H 			//02E9 	0192

		//;RF-car.C: 342: TMR2 = 0;
		CLRR 	11H 			//02EA 	0111

		//;RF-car.C: 343: PR2 = 50;
		LDWI 	32H 			//02EB 	2A32
		BSR 	STATUS,5 		//02EC 	1A83
		STR 	12H 			//02ED 	0192

		//;RF-car.C: 344: TMR2IF = 0;
		BCR 	STATUS,5 		//02EE 	1283
		BCR 	CH,1 			//02EF 	108C

		//;RF-car.C: 346: TMR2ON = 1;
		BSR 	12H,2 			//02F0 	1912

		//;RF-car.C: 347: PEIE=1;
		BSR 	INTCON,6 		//02F1 	1B0B

		//;RF-car.C: 348: GIE = 1;
		BSR 	INTCON,7 		//02F2 	1B8B
		RET		 					//02F3 	0004
		STR 	62H 			//02F4 	01E2

		//;RF-car.C: 389: unsigned char a;
		//;RF-car.C: 390: for(a=0;a<Time;a++)
		CLRR 	63H 			//02F5 	0163
		LDR 	62H,0 			//02F6 	0862
		SUBWR 	63H,0 			//02F7 	0C63
		BTSC 	STATUS,0 		//02F8 	1403
		RET		 					//02F9 	0004

		//;RF-car.C: 391: {
		//;RF-car.C: 392: __nop();
		NOP		 					//02FA 	0000
		CLRWDT	 			//02FB 	0001
		BCR 	STATUS,5 		//02FC 	1283
		INCR	63H,1 			//02FD 	09E3
		LJUMP 	2F6H 			//02FE 	3AF6
		STR 	70H 			//02FF 	01F0

		//;RF-car.C: 389: unsigned char a;
		//;RF-car.C: 390: for(a=0;a<Time;a++)
		CLRR 	71H 			//0300 	0171
		LDR 	70H,0 			//0301 	0870
		SUBWR 	71H,0 			//0302 	0C71
		BTSC 	STATUS,0 		//0303 	1403
		RET		 					//0304 	0004

		//;RF-car.C: 391: {
		//;RF-car.C: 392: __nop();
		NOP		 					//0305 	0000
		CLRWDT	 			//0306 	0001
		INCR	71H,1 			//0307 	09F1
		LJUMP 	301H 			//0308 	3B01

		//;RF-car.C: 353: OPTION = 0B00000110;
		LDWI 	6H 			//0309 	2A06
		BSR 	STATUS,5 		//030A 	1A83
		STR 	1H 			//030B 	0181

		//;RF-car.C: 359: TMR0 = 239;
		LDWI 	EFH 			//030C 	2AEF
		BCR 	STATUS,5 		//030D 	1283
		STR 	1H 			//030E 	0181

		//;RF-car.C: 360: T0IF = 0;
		BCR 	INTCON,2 		//030F 	110B

		//;RF-car.C: 361: T0IE = 1;
		BSR 	INTCON,5 		//0310 	1A8B
		RET		 					//0311 	0004
		CLRWDT	 			//0312 	0001
		CLRR 	INDF 			//0313 	0100
		INCR	FSR,1 			//0314 	0984
		XORWR 	FSR,0 			//0315 	0404
		BTSC 	STATUS,2 		//0316 	1503
		RETW 	0H 			//0317 	2100
		XORWR 	FSR,0 			//0318 	0404
		LJUMP 	313H 			//0319 	3B13
		STR 	62H 			//031A 	01E2

		//;RF-car.C: 366: unsigned char ReEEPROMread;
		//;RF-car.C: 368: EEADR = EEAddr;
		BSR 	STATUS,5 		//031B 	1A83
		STR 	1BH 			//031C 	019B

		//;RF-car.C: 369: RD = 1;
		BSR 	1CH,0 			//031D 	181C

		//;RF-car.C: 370: ReEEPROMread = EEDAT;
		LDR 	1AH,0 			//031E 	081A
		BCR 	STATUS,5 		//031F 	1283
		STR 	63H 			//0320 	01E3

		//;RF-car.C: 371: return ReEEPROMread;
		RET		 					//0321 	0004
			END
