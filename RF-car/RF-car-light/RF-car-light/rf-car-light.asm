//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_Timer		EQU		4FH
		_conterout		EQU		7CH
		_Data		EQU		4CH
		_Time		EQU		5AH
		_DataM		EQU		49H
		_DataS		EQU		40H
		_RFData		EQU		46H
		_contlern		EQU		59H
		_Start		EQU		58H
		_Count		EQU		57H
		_Buffer		EQU		56H
		_Bit		EQU		55H
		_key		EQU		54H
		_leddarb		EQU		53H
		_ledq		EQU		52H
		_ledchange		EQU		51H
		_Frist		EQU		7BH
		_Learn		EQU		7BH
		_Finish		EQU		7BH
		_Lock		EQU		7BH
//		main@i		EQU		68H
//		EEPROMwrite@EEAddr		EQU		60H
//		EEPROMwrite@EEAddr		EQU		60H
//		EEPROMwrite@Data		EQU		5FH
//		EEPROMwrite@EEAddr		EQU		60H
//		EEPROMread@EEAddr		EQU		5FH
//		EEPROMread@ReEEPROMread		EQU		60H
//		EEPROMread@EEAddr		EQU		5FH
//		EEPROMread@EEAddr		EQU		5FH
//		DelayMs@b		EQU		65H
//		DelayMs@a		EQU		63H
//		DelayMs@Time		EQU		61H
//		DelayUs@Time		EQU		5FH
//		DelayUs@a		EQU		60H
//		DelayUs@Time		EQU		5FH
//		DelayUs@Time		EQU		5FH
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
		STR 	5CH 			//0007 	01DC
		LDR 	FSR,0 			//0008 	0804
		STR 	5DH 			//0009 	01DD
		LDR 	PCLATH,0 		//000A 	080A
		STR 	5EH 			//000B 	01DE
		LJUMP 	18H 			//000C 	3818
		LJUMP 	0EH 			//000D 	380E
		LDWI 	40H 			//000E 	2A40
		CLRR 	7BH 			//000F 	017B
		CLRR 	7CH 			//0010 	017C
		CLRR 	7DH 			//0011 	017D
		BCR 	STATUS,7 		//0012 	1383
		STR 	FSR 			//0013 	0184
		LDWI 	5BH 			//0014 	2A5B
		LCALL 	325H 			//0015 	3325
		CLRR 	STATUS 			//0016 	0103
		LJUMP 	1A0H 			//0017 	39A0

		//;RF-car-light.C: 60: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//0018 	168B
		BTSS 	INTCON,2 		//0019 	1D0B
		LJUMP 	F5H 			//001A 	38F5

		//;RF-car-light.C: 61: {
		//;RF-car-light.C: 62: TMR0 = 239;
		LDWI 	EFH 			//001B 	2AEF
		STR 	1H 			//001C 	0181

		//;RF-car-light.C: 63: T0IF = 0;
		BCR 	INTCON,2 		//001D 	110B

		//;RF-car-light.C: 65: if(PA0==0){
		BTSC 	5H,0 			//001E 	1405
		LJUMP 	24H 			//001F 	3824

		//;RF-car-light.C: 67: conterout++;
		INCR	7CH,1 			//0020 	09FC
		BTSC 	STATUS,2 		//0021 	1503
		INCR	7DH,1 			//0022 	09FD

		//;RF-car-light.C: 68: PA5=0;
		BCR 	5H,5 			//0023 	1285

		//;RF-car-light.C: 70: }
		//;RF-car-light.C: 71: if(PA0==1 && conterout>230 && conterout<360 ){
		BTSS 	5H,0 			//0024 	1C05
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

		//;RF-car-light.C: 74: conterout++;
		INCR	7CH,1 			//0034 	09FC
		BTSC 	STATUS,2 		//0035 	1503
		INCR	7DH,1 			//0036 	09FD

		//;RF-car-light.C: 76: }
		//;RF-car-light.C: 78: if(PA0==1 && conterout > 360 && conterout<850 ){
		BTSS 	5H,0 			//0037 	1C05
		LJUMP 	ACH 			//0038 	38AC
		LDWI 	1H 			//0039 	2A01
		SUBWR 	7DH,0 			//003A 	0C7D
		LDWI 	69H 			//003B 	2A69
		BTSC 	STATUS,2 		//003C 	1503
		SUBWR 	7CH,0 			//003D 	0C7C
		BTSS 	STATUS,0 		//003E 	1C03
		LJUMP 	ACH 			//003F 	38AC
		LDWI 	3H 			//0040 	2A03
		SUBWR 	7DH,0 			//0041 	0C7D
		LDWI 	52H 			//0042 	2A52
		BTSC 	STATUS,2 		//0043 	1503
		SUBWR 	7CH,0 			//0044 	0C7C
		BTSC 	STATUS,0 		//0045 	1403
		LJUMP 	ACH 			//0046 	38AC

		//;RF-car-light.C: 80: PA5=1;
		BSR 	5H,5 			//0047 	1A85

		//;RF-car-light.C: 82: if(conterout>450 && conterout<490){
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

		//;RF-car-light.C: 83: key=1;
		LDWI 	1H 			//0056 	2A01
		STR 	54H 			//0057 	01D4

		//;RF-car-light.C: 85: SEND_CODE(DataS[0][0],DataS[0][1],DataS[0][2]);
		LCALL 	19AH 			//0058 	319A
		LCALL 	2D8H 			//0059 	32D8

		//;RF-car-light.C: 86: SEND_CODE(DataS[0][0],DataS[0][1],DataS[0][2]);
		LCALL 	19AH 			//005A 	319A
		LCALL 	2D8H 			//005B 	32D8

		//;RF-car-light.C: 87: SEND_CODE(DataS[0][0],DataS[0][1],DataS[0][2]);
		LCALL 	19AH 			//005C 	319A
		LCALL 	2D8H 			//005D 	32D8

		//;RF-car-light.C: 88: SEND_CODE(DataS[0][0],DataS[0][1],DataS[0][2]);
		LCALL 	19AH 			//005E 	319A
		LCALL 	2D8H 			//005F 	32D8

		//;RF-car-light.C: 89: SEND_CODE(DataS[0][0],DataS[0][1],DataS[0][2]);
		LCALL 	19AH 			//0060 	319A
		LCALL 	2D8H 			//0061 	32D8

		//;RF-car-light.C: 92: }
		//;RF-car-light.C: 93: if(conterout>570 && conterout<610){
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

		//;RF-car-light.C: 94: key=2;
		LDWI 	2H 			//006E 	2A02
		BTSC 	STATUS,0 		//006F 	1403
		LJUMP 	7DH 			//0070 	387D
		STR 	54H 			//0071 	01D4

		//;RF-car-light.C: 96: SEND_CODE(DataS[1][0],DataS[1][1],DataS[1][2]);
		LCALL 	194H 			//0072 	3194
		LCALL 	2D8H 			//0073 	32D8

		//;RF-car-light.C: 97: SEND_CODE(DataS[1][0],DataS[1][1],DataS[1][2]);
		LCALL 	194H 			//0074 	3194
		LCALL 	2D8H 			//0075 	32D8

		//;RF-car-light.C: 98: SEND_CODE(DataS[1][0],DataS[1][1],DataS[1][2]);
		LCALL 	194H 			//0076 	3194
		LCALL 	2D8H 			//0077 	32D8

		//;RF-car-light.C: 99: SEND_CODE(DataS[1][0],DataS[1][1],DataS[1][2]);
		LCALL 	194H 			//0078 	3194
		LCALL 	2D8H 			//0079 	32D8

		//;RF-car-light.C: 100: SEND_CODE(DataS[1][0],DataS[1][1],DataS[1][2]);
		LCALL 	194H 			//007A 	3194
		LCALL 	2D8H 			//007B 	32D8

		//;RF-car-light.C: 102: }
		//;RF-car-light.C: 103: if(conterout>690 && conterout<725){
		LDWI 	2H 			//007C 	2A02
		SUBWR 	7DH,0 			//007D 	0C7D
		LDWI 	B3H 			//007E 	2AB3
		BTSC 	STATUS,2 		//007F 	1503
		SUBWR 	7CH,0 			//0080 	0C7C
		BTSS 	STATUS,0 		//0081 	1C03
		LJUMP 	93H 			//0082 	3893
		LDWI 	2H 			//0083 	2A02
		SUBWR 	7DH,0 			//0084 	0C7D
		LDWI 	D5H 			//0085 	2AD5
		BTSC 	STATUS,2 		//0086 	1503
		SUBWR 	7CH,0 			//0087 	0C7C
		BTSC 	STATUS,0 		//0088 	1403
		LJUMP 	93H 			//0089 	3893

		//;RF-car-light.C: 106: if(leddarb==0){leddarb=1;
		LDR 	53H,0 			//008A 	0853
		BTSS 	STATUS,2 		//008B 	1D03
		LJUMP 	90H 			//008C 	3890
		LDWI 	1H 			//008D 	2A01
		STR 	53H 			//008E 	01D3

		//;RF-car-light.C: 107: }
		LJUMP 	91H 			//008F 	3891

		//;RF-car-light.C: 108: else
		//;RF-car-light.C: 109: {
		//;RF-car-light.C: 110: leddarb=0;
		CLRR 	53H 			//0090 	0153

		//;RF-car-light.C: 111: }
		//;RF-car-light.C: 113: ledchange=1;
		LDWI 	1H 			//0091 	2A01
		STR 	51H 			//0092 	01D1

		//;RF-car-light.C: 115: }
		//;RF-car-light.C: 116: if(conterout>820 && conterout<850){
		LDWI 	3H 			//0093 	2A03
		SUBWR 	7DH,0 			//0094 	0C7D
		LDWI 	35H 			//0095 	2A35
		BTSC 	STATUS,2 		//0096 	1503
		SUBWR 	7CH,0 			//0097 	0C7C
		BTSS 	STATUS,0 		//0098 	1C03
		LJUMP 	AAH 			//0099 	38AA
		LDWI 	3H 			//009A 	2A03
		SUBWR 	7DH,0 			//009B 	0C7D
		LDWI 	52H 			//009C 	2A52
		BTSC 	STATUS,2 		//009D 	1503
		SUBWR 	7CH,0 			//009E 	0C7C
		BTSC 	STATUS,0 		//009F 	1403
		LJUMP 	AAH 			//00A0 	38AA

		//;RF-car-light.C: 119: if(ledq==0){ledq=1;
		LDR 	52H,0 			//00A1 	0852
		BTSS 	STATUS,2 		//00A2 	1D03
		LJUMP 	A7H 			//00A3 	38A7
		LDWI 	1H 			//00A4 	2A01
		STR 	52H 			//00A5 	01D2

		//;RF-car-light.C: 120: }
		LJUMP 	A8H 			//00A6 	38A8

		//;RF-car-light.C: 121: else
		//;RF-car-light.C: 122: {
		//;RF-car-light.C: 123: ledq=0;
		CLRR 	52H 			//00A7 	0152

		//;RF-car-light.C: 124: }
		//;RF-car-light.C: 126: ledchange=2;
		LDWI 	2H 			//00A8 	2A02
		STR 	51H 			//00A9 	01D1

		//;RF-car-light.C: 128: }
		//;RF-car-light.C: 130: conterout=0;
		CLRR 	7CH 			//00AA 	017C
		CLRR 	7DH 			//00AB 	017D

		//;RF-car-light.C: 131: }
		//;RF-car-light.C: 134: if(PA0==1 && conterout>1150 && conterout<1210 ){
		BTSS 	5H,0 			//00AC 	1C05
		LJUMP 	BFH 			//00AD 	38BF
		LDWI 	4H 			//00AE 	2A04
		SUBWR 	7DH,0 			//00AF 	0C7D
		LDWI 	7FH 			//00B0 	2A7F
		BTSC 	STATUS,2 		//00B1 	1503
		SUBWR 	7CH,0 			//00B2 	0C7C
		BTSS 	STATUS,0 		//00B3 	1C03
		LJUMP 	BFH 			//00B4 	38BF
		LDWI 	4H 			//00B5 	2A04
		SUBWR 	7DH,0 			//00B6 	0C7D
		LDWI 	BAH 			//00B7 	2ABA
		BTSC 	STATUS,2 		//00B8 	1503
		SUBWR 	7CH,0 			//00B9 	0C7C
		BTSC 	STATUS,0 		//00BA 	1403
		LJUMP 	BFH 			//00BB 	38BF

		//;RF-car-light.C: 136: conterout++;
		INCR	7CH,1 			//00BC 	09FC
		BTSC 	STATUS,2 		//00BD 	1503
		INCR	7DH,1 			//00BE 	09FD

		//;RF-car-light.C: 138: }
		//;RF-car-light.C: 140: if(PA0==1 && conterout > 1210 && conterout<2100 ){
		BTSS 	5H,0 			//00BF 	1C05
		LJUMP 	F5H 			//00C0 	38F5
		LDWI 	4H 			//00C1 	2A04
		SUBWR 	7DH,0 			//00C2 	0C7D
		LDWI 	BBH 			//00C3 	2ABB
		BTSC 	STATUS,2 		//00C4 	1503
		SUBWR 	7CH,0 			//00C5 	0C7C
		BTSS 	STATUS,0 		//00C6 	1C03
		LJUMP 	F5H 			//00C7 	38F5
		LDWI 	8H 			//00C8 	2A08
		SUBWR 	7DH,0 			//00C9 	0C7D
		LDWI 	34H 			//00CA 	2A34
		BTSC 	STATUS,2 		//00CB 	1503
		SUBWR 	7CH,0 			//00CC 	0C7C
		BTSC 	STATUS,0 		//00CD 	1403
		LJUMP 	F5H 			//00CE 	38F5

		//;RF-car-light.C: 144: if(conterout>1550 && conterout<1590){
		LDWI 	6H 			//00CF 	2A06
		SUBWR 	7DH,0 			//00D0 	0C7D
		LDWI 	FH 			//00D1 	2A0F
		BTSC 	STATUS,2 		//00D2 	1503
		SUBWR 	7CH,0 			//00D3 	0C7C
		LDWI 	6H 			//00D4 	2A06
		BTSS 	STATUS,0 		//00D5 	1C03
		LJUMP 	E0H 			//00D6 	38E0
		SUBWR 	7DH,0 			//00D7 	0C7D
		LDWI 	36H 			//00D8 	2A36
		BTSC 	STATUS,2 		//00D9 	1503
		SUBWR 	7CH,0 			//00DA 	0C7C
		BTSC 	STATUS,0 		//00DB 	1403
		LJUMP 	DFH 			//00DC 	38DF

		//;RF-car-light.C: 145: key=5;
		LDWI 	5H 			//00DD 	2A05
		STR 	54H 			//00DE 	01D4

		//;RF-car-light.C: 146: }
		//;RF-car-light.C: 147: if(conterout>1670 && conterout<1710){
		LDWI 	6H 			//00DF 	2A06
		SUBWR 	7DH,0 			//00E0 	0C7D
		LDWI 	87H 			//00E1 	2A87
		BTSC 	STATUS,2 		//00E2 	1503
		SUBWR 	7CH,0 			//00E3 	0C7C
		BTSS 	STATUS,0 		//00E4 	1C03
		LJUMP 	EFH 			//00E5 	38EF
		LDWI 	6H 			//00E6 	2A06
		SUBWR 	7DH,0 			//00E7 	0C7D
		LDWI 	AEH 			//00E8 	2AAE
		BTSC 	STATUS,2 		//00E9 	1503
		SUBWR 	7CH,0 			//00EA 	0C7C
		BTSC 	STATUS,0 		//00EB 	1403
		LJUMP 	EFH 			//00EC 	38EF

		//;RF-car-light.C: 148: key=6;
		LDWI 	6H 			//00ED 	2A06
		STR 	54H 			//00EE 	01D4

		//;RF-car-light.C: 149: }
		//;RF-car-light.C: 152: conterout=0;
		CLRR 	7CH 			//00EF 	017C
		CLRR 	7DH 			//00F0 	017D

		//;RF-car-light.C: 153: TMR2IE = 1;
		BSR 	STATUS,5 		//00F1 	1A83
		BSR 	CH,1 			//00F2 	188C

		//;RF-car-light.C: 154: T0IE=0;
		BCR 	INTCON,5 		//00F3 	128B

		//;RF-car-light.C: 155: Learn=1;
		BSR 	7BH,2 			//00F4 	197B

		//;RF-car-light.C: 158: }
		//;RF-car-light.C: 165: }
		//;RF-car-light.C: 169: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//00F5 	1A83
		BTSS 	CH,1 			//00F6 	1C8C
		LJUMP 	17FH 			//00F7 	397F
		BCR 	STATUS,5 		//00F8 	1283
		BTSS 	CH,1 			//00F9 	1C8C
		LJUMP 	17FH 			//00FA 	397F

		//;RF-car-light.C: 170: {
		//;RF-car-light.C: 172: conterout++;
		INCR	7CH,1 			//00FB 	09FC
		BTSC 	STATUS,2 		//00FC 	1503
		INCR	7DH,1 			//00FD 	09FD

		//;RF-car-light.C: 173: if(conterout>=10000){conterout=0; PA5=!PA5;contlern++;}
		LDWI 	27H 			//00FE 	2A27
		SUBWR 	7DH,0 			//00FF 	0C7D
		LDWI 	10H 			//0100 	2A10
		BTSC 	STATUS,2 		//0101 	1503
		SUBWR 	7CH,0 			//0102 	0C7C
		BTSS 	STATUS,0 		//0103 	1C03
		LJUMP 	10AH 			//0104 	390A
		CLRR 	7CH 			//0105 	017C
		CLRR 	7DH 			//0106 	017D
		LDWI 	20H 			//0107 	2A20
		XORWR 	5H,1 			//0108 	0485
		INCR	59H,1 			//0109 	09D9

		//;RF-car-light.C: 174: if(contlern>30){
		LDWI 	1FH 			//010A 	2A1F
		SUBWR 	59H,0 			//010B 	0C59
		BTSS 	STATUS,0 		//010C 	1C03
		LJUMP 	110H 			//010D 	3910

		//;RF-car-light.C: 175: key=0;
		//;RF-car-light.C: 176: Lock=0;
		//;RF-car-light.C: 177: Learn=0;
		//;RF-car-light.C: 179: TMR2IE = 0;
		//;RF-car-light.C: 180: conterout=0;
		//;RF-car-light.C: 181: PA5=1;
		//;RF-car-light.C: 183: T0IE=1;
		LCALL 	189H 			//010E 	3189

		//;RF-car-light.C: 184: contlern=0;
		CLRR 	59H 			//010F 	0159

		//;RF-car-light.C: 185: }
		//;RF-car-light.C: 188: TMR2IF = 0;
		BCR 	CH,1 			//0110 	108C
		CLRWDT	 			//0111 	0001

		//;RF-car-light.C: 190: if(PA3==0){
		BCR 	STATUS,5 		//0112 	1283
		BTSC 	5H,3 			//0113 	1585
		LJUMP 	11AH 			//0114 	391A

		//;RF-car-light.C: 191: Time++;Frist=1;Timer=0;
		INCR	5AH,1 			//0115 	09DA
		BSR 	7BH,3 			//0116 	19FB
		CLRR 	4FH 			//0117 	014F
		CLRR 	50H 			//0118 	0150

		//;RF-car-light.C: 192: }
		LJUMP 	17FH 			//0119 	397F

		//;RF-car-light.C: 193: else
		//;RF-car-light.C: 194: {
		//;RF-car-light.C: 196: Timer++;
		INCR	4FH,1 			//011A 	09CF
		BTSC 	STATUS,2 		//011B 	1503
		INCR	50H,1 			//011C 	09D0

		//;RF-car-light.C: 197: if(Timer>250){Timer=0;Finish=0;}
		LDWI 	0H 			//011D 	2A00
		SUBWR 	50H,0 			//011E 	0C50
		LDWI 	FBH 			//011F 	2AFB
		BTSC 	STATUS,2 		//0120 	1503
		SUBWR 	4FH,0 			//0121 	0C4F
		BTSS 	STATUS,0 		//0122 	1C03
		LJUMP 	127H 			//0123 	3927
		CLRR 	4FH 			//0124 	014F
		CLRR 	50H 			//0125 	0150
		BCR 	7BH,1 			//0126 	10FB

		//;RF-car-light.C: 198: if(Frist==1 & Finish==0)
		BTSS 	7BH,1 			//0127 	1CFB
		BTSS 	7BH,3 			//0128 	1DFB
		LJUMP 	17FH 			//0129 	397F

		//;RF-car-light.C: 199: {
		//;RF-car-light.C: 200: Timer=0;
		CLRR 	4FH 			//012A 	014F
		CLRR 	50H 			//012B 	0150

		//;RF-car-light.C: 201: if(Start==1)
		DECRSZ 	58H,0 		//012C 	0E58
		LJUMP 	171H 			//012D 	3971

		//;RF-car-light.C: 202: {
		//;RF-car-light.C: 203: Bit--;
		DECR 	55H,1 			//012E 	0DD5

		//;RF-car-light.C: 204: if(Time>10 & Time< 30)
		LDWI 	BH 			//012F 	2A0B
		SUBWR 	5AH,0 			//0130 	0C5A
		BTSS 	STATUS,0 		//0131 	1C03
		LJUMP 	13BH 			//0132 	393B
		LDWI 	1EH 			//0133 	2A1E
		SUBWR 	5AH,0 			//0134 	0C5A
		BTSC 	STATUS,0 		//0135 	1403
		LJUMP 	13AH 			//0136 	393A

		//;RF-car-light.C: 205: {
		//;RF-car-light.C: 206: Buffer = Buffer << 1;
		BCR 	STATUS,0 		//0137 	1003
		RLR 	56H,0 			//0138 	0556
		LJUMP 	13FH 			//0139 	393F

		//;RF-car-light.C: 207: }
		//;RF-car-light.C: 208: else
		//;RF-car-light.C: 209: {
		//;RF-car-light.C: 210: Buffer = Buffer << 1;
		BCR 	STATUS,0 		//013A 	1003
		RLR 	56H,0 			//013B 	0556
		STR 	56H 			//013C 	01D6

		//;RF-car-light.C: 211: Buffer = Buffer + 1;
		LDR 	56H,0 			//013D 	0856
		ADDWI 	1H 			//013E 	2701
		STR 	56H 			//013F 	01D6

		//;RF-car-light.C: 213: }
		//;RF-car-light.C: 214: if(Bit == 0)
		LDR 	55H,0 			//0140 	0855
		BTSS 	STATUS,2 		//0141 	1D03
		LJUMP 	171H 			//0142 	3971

		//;RF-car-light.C: 215: {
		//;RF-car-light.C: 216: Bit=8;
		LDWI 	8H 			//0143 	2A08
		STR 	55H 			//0144 	01D5

		//;RF-car-light.C: 217: Data[Count]=RFData[Count];
		LDR 	57H,0 			//0145 	0857
		ADDWI 	46H 			//0146 	2746
		STR 	FSR 			//0147 	0184
		BCR 	STATUS,7 		//0148 	1383
		LDR 	INDF,0 			//0149 	0800
		STR 	5BH 			//014A 	01DB
		LDR 	57H,0 			//014B 	0857
		ADDWI 	4CH 			//014C 	274C
		STR 	FSR 			//014D 	0184
		LDR 	5BH,0 			//014E 	085B
		STR 	INDF 			//014F 	0180

		//;RF-car-light.C: 218: RFData[Count]=Buffer;
		LDR 	57H,0 			//0150 	0857
		ADDWI 	46H 			//0151 	2746
		STR 	FSR 			//0152 	0184
		LDR 	56H,0 			//0153 	0856
		STR 	INDF 			//0154 	0180

		//;RF-car-light.C: 219: Count++;
		INCR	57H,1 			//0155 	09D7

		//;RF-car-light.C: 221: if(Count>=3)
		LDWI 	3H 			//0156 	2A03
		SUBWR 	57H,0 			//0157 	0C57
		BTSS 	STATUS,0 		//0158 	1C03
		LJUMP 	170H 			//0159 	3970

		//;RF-car-light.C: 222: {
		//;RF-car-light.C: 223: Count=0;
		CLRR 	57H 			//015A 	0157

		//;RF-car-light.C: 224: Start=0;
		CLRR 	58H 			//015B 	0158

		//;RF-car-light.C: 225: if(Data[0]==RFData[0] && Data[1]==RFData[1] &&Data[2]==RFData[2])
		LDR 	4CH,0 			//015C 	084C
		XORWR 	46H,0 			//015D 	0446
		BTSS 	STATUS,2 		//015E 	1D03
		LJUMP 	170H 			//015F 	3970
		LDR 	4DH,0 			//0160 	084D
		XORWR 	47H,0 			//0161 	0447
		BTSS 	STATUS,2 		//0162 	1D03
		LJUMP 	170H 			//0163 	3970
		LDR 	4EH,0 			//0164 	084E
		XORWR 	48H,0 			//0165 	0448
		BTSS 	STATUS,2 		//0166 	1D03
		LJUMP 	170H 			//0167 	3970

		//;RF-car-light.C: 226: {
		//;RF-car-light.C: 227: DataM[0]=RFData[0];
		LDR 	46H,0 			//0168 	0846
		STR 	49H 			//0169 	01C9

		//;RF-car-light.C: 228: DataM[1]=RFData[1];
		LDR 	47H,0 			//016A 	0847
		STR 	4AH 			//016B 	01CA

		//;RF-car-light.C: 229: DataM[2]=RFData[2];
		LDR 	48H,0 			//016C 	0848
		STR 	4BH 			//016D 	01CB

		//;RF-car-light.C: 231: Finish=1;
		BSR 	7BH,1 			//016E 	18FB

		//;RF-car-light.C: 232: Lock=1;
		BSR 	7BH,0 			//016F 	187B

		//;RF-car-light.C: 233: }
		//;RF-car-light.C: 234: }
		//;RF-car-light.C: 235: Buffer=0;
		CLRR 	56H 			//0170 	0156

		//;RF-car-light.C: 236: }
		//;RF-car-light.C: 237: }
		//;RF-car-light.C: 238: if(Time>120 & Time<250){Start=1;Bit=8;}
		LDWI 	79H 			//0171 	2A79
		SUBWR 	5AH,0 			//0172 	0C5A
		BTSS 	STATUS,0 		//0173 	1C03
		LJUMP 	17DH 			//0174 	397D
		LDWI 	FAH 			//0175 	2AFA
		SUBWR 	5AH,0 			//0176 	0C5A
		BTSC 	STATUS,0 		//0177 	1403
		LJUMP 	17DH 			//0178 	397D
		LDWI 	1H 			//0179 	2A01
		STR 	58H 			//017A 	01D8
		LDWI 	8H 			//017B 	2A08
		STR 	55H 			//017C 	01D5

		//;RF-car-light.C: 239: Frist=0;
		BCR 	7BH,3 			//017D 	11FB

		//;RF-car-light.C: 240: Time=0;
		CLRR 	5AH 			//017E 	015A
		BCR 	STATUS,5 		//017F 	1283
		LDR 	5EH,0 			//0180 	085E
		STR 	PCLATH 			//0181 	018A
		LDR 	5DH,0 			//0182 	085D
		STR 	FSR 			//0183 	0184
		SWAPR 	5CH,0 			//0184 	075C
		STR 	STATUS 			//0185 	0183
		SWAPR 	7EH,1 			//0186 	07FE
		SWAPR 	7EH,0 			//0187 	077E
		RETI		 			//0188 	0009
		CLRR 	54H 			//0189 	0154
		BCR 	7BH,0 			//018A 	107B
		BCR 	7BH,2 			//018B 	117B
		BSR 	STATUS,5 		//018C 	1A83
		BCR 	CH,1 			//018D 	108C
		CLRR 	7CH 			//018E 	017C
		CLRR 	7DH 			//018F 	017D
		BCR 	STATUS,5 		//0190 	1283
		BSR 	5H,5 			//0191 	1A85
		BSR 	INTCON,5 		//0192 	1A8B
		RET		 					//0193 	0004
		LDR 	44H,0 			//0194 	0844
		STR 	78H 			//0195 	01F8
		LDR 	45H,0 			//0196 	0845
		STR 	79H 			//0197 	01F9
		LDR 	43H,0 			//0198 	0843
		RET		 					//0199 	0004
		LDR 	41H,0 			//019A 	0841
		STR 	78H 			//019B 	01F8
		LDR 	42H,0 			//019C 	0842
		STR 	79H 			//019D 	01F9
		LDR 	40H,0 			//019E 	0840
		RET		 					//019F 	0004

		//;RF-car-light.C: 253: POWER_INITIAL();
		LCALL 	2EBH 			//01A0 	32EB

		//;RF-car-light.C: 254: TIMER2_INITIAL();
		LCALL 	2FBH 			//01A1 	32FB

		//;RF-car-light.C: 255: TIMER0_INITIAL();
		LCALL 	31CH 			//01A2 	331C

		//;RF-car-light.C: 258: PA5=1;
		BSR 	5H,5 			//01A3 	1A85

		//;RF-car-light.C: 262: char i;
		//;RF-car-light.C: 263: for(i=0;i<2;i++)
		CLRR 	68H 			//01A4 	0168
		CLRWDT	 			//01A5 	0001

		//;RF-car-light.C: 266: DataS[i][0]=EEPROMread(i*3);
		BCR 	STATUS,5 		//01A6 	1283
		LDR 	68H,0 			//01A7 	0868
		ADDWR 	68H,0 			//01A8 	0B68
		ADDWR 	68H,0 			//01A9 	0B68
		ADDWI 	40H 			//01AA 	2740
		STR 	FSR 			//01AB 	0184
		LDR 	68H,0 			//01AC 	0868
		ADDWR 	68H,0 			//01AD 	0B68
		ADDWR 	68H,0 			//01AE 	0B68
		LCALL 	32DH 			//01AF 	332D

		//;RF-car-light.C: 267: DataS[i][1]=EEPROMread((i*3)+1);
		LCALL 	247H 			//01B0 	3247
		ADDWI 	41H 			//01B1 	2741
		STR 	FSR 			//01B2 	0184
		LDR 	68H,0 			//01B3 	0868
		ADDWR 	68H,0 			//01B4 	0B68
		ADDWR 	68H,0 			//01B5 	0B68
		ADDWI 	1H 			//01B6 	2701
		LCALL 	32DH 			//01B7 	332D

		//;RF-car-light.C: 268: DataS[i][2]=EEPROMread((i*3)+2);
		LCALL 	247H 			//01B8 	3247
		ADDWI 	42H 			//01B9 	2742
		STR 	FSR 			//01BA 	0184
		LDR 	68H,0 			//01BB 	0868
		ADDWR 	68H,0 			//01BC 	0B68
		ADDWR 	68H,0 			//01BD 	0B68
		ADDWI 	2H 			//01BE 	2702
		LCALL 	32DH 			//01BF 	332D
		BCR 	STATUS,7 		//01C0 	1383
		STR 	INDF 			//01C1 	0180
		LDWI 	2H 			//01C2 	2A02
		INCR	68H,1 			//01C3 	09E8
		SUBWR 	68H,0 			//01C4 	0C68
		BTSS 	STATUS,0 		//01C5 	1C03
		LJUMP 	1A5H 			//01C6 	39A5

		//;RF-car-light.C: 269: }
		//;RF-car-light.C: 271: leddarb=EEPROMread(50);
		LDWI 	32H 			//01C7 	2A32
		LCALL 	32DH 			//01C8 	332D
		STR 	53H 			//01C9 	01D3

		//;RF-car-light.C: 272: ledq=EEPROMread(51);
		LDWI 	33H 			//01CA 	2A33
		LCALL 	32DH 			//01CB 	332D
		STR 	52H 			//01CC 	01D2

		//;RF-car-light.C: 274: if(leddarb!=0)leddarb=1;
		LDR 	53H,0 			//01CD 	0853
		BTSC 	STATUS,2 		//01CE 	1503
		LJUMP 	1D2H 			//01CF 	39D2
		LDWI 	1H 			//01D0 	2A01
		STR 	53H 			//01D1 	01D3

		//;RF-car-light.C: 275: if(ledq!=0)ledq=1;
		LDR 	52H,0 			//01D2 	0852
		BTSC 	STATUS,2 		//01D3 	1503
		LJUMP 	1D7H 			//01D4 	39D7
		LDWI 	1H 			//01D5 	2A01
		STR 	52H 			//01D6 	01D2

		//;RF-car-light.C: 277: PA1=leddarb;
		BTSS 	53H,0 			//01D7 	1C53
		LJUMP 	1DCH 			//01D8 	39DC
		BCR 	STATUS,5 		//01D9 	1283
		BSR 	5H,1 			//01DA 	1885
		LJUMP 	1DEH 			//01DB 	39DE
		BCR 	STATUS,5 		//01DC 	1283
		BCR 	5H,1 			//01DD 	1085

		//;RF-car-light.C: 278: PA2=ledq;
		BTSS 	52H,0 			//01DE 	1C52
		LJUMP 	1E3H 			//01DF 	39E3
		BCR 	STATUS,5 		//01E0 	1283
		BSR 	5H,2 			//01E1 	1905
		LJUMP 	1E5H 			//01E2 	39E5
		BCR 	STATUS,5 		//01E3 	1283
		BCR 	5H,2 			//01E4 	1105

		//;RF-car-light.C: 280: Start=0;
		CLRR 	58H 			//01E5 	0158

		//;RF-car-light.C: 282: PA4 = 0;
		BCR 	5H,4 			//01E6 	1205

		//;RF-car-light.C: 284: while(1)
		CLRWDT	 			//01E7 	0001

		//;RF-car-light.C: 289: if(ledchange==1){
		BCR 	STATUS,5 		//01E8 	1283
		DECRSZ 	51H,0 		//01E9 	0E51
		LJUMP 	1F9H 			//01EA 	39F9

		//;RF-car-light.C: 290: ledchange=0;
		CLRR 	51H 			//01EB 	0151

		//;RF-car-light.C: 291: PA1=leddarb;
		BTSS 	53H,0 			//01EC 	1C53
		LJUMP 	1F1H 			//01ED 	39F1
		BCR 	STATUS,5 		//01EE 	1283
		BSR 	5H,1 			//01EF 	1885
		LJUMP 	1F3H 			//01F0 	39F3
		BCR 	STATUS,5 		//01F1 	1283
		BCR 	5H,1 			//01F2 	1085

		//;RF-car-light.C: 292: EEPROMwrite(50,leddarb);
		LDR 	53H,0 			//01F3 	0853
		STR 	5FH 			//01F4 	01DF
		LDWI 	32H 			//01F5 	2A32
		LCALL 	2C3H 			//01F6 	32C3

		//;RF-car-light.C: 293: DelayMs(10);
		LCALL 	242H 			//01F7 	3242
		LCALL 	28BH 			//01F8 	328B

		//;RF-car-light.C: 295: }
		//;RF-car-light.C: 296: if(ledchange==2){
		LDWI 	2H 			//01F9 	2A02
		XORWR 	51H,0 			//01FA 	0451
		BTSS 	STATUS,2 		//01FB 	1D03
		LJUMP 	20BH 			//01FC 	3A0B

		//;RF-car-light.C: 297: ledchange=0;
		CLRR 	51H 			//01FD 	0151

		//;RF-car-light.C: 298: PA2=ledq;
		BTSS 	52H,0 			//01FE 	1C52
		LJUMP 	203H 			//01FF 	3A03
		BCR 	STATUS,5 		//0200 	1283
		BSR 	5H,2 			//0201 	1905
		LJUMP 	205H 			//0202 	3A05
		BCR 	STATUS,5 		//0203 	1283
		BCR 	5H,2 			//0204 	1105

		//;RF-car-light.C: 299: EEPROMwrite(51,ledq);
		LDR 	52H,0 			//0205 	0852
		STR 	5FH 			//0206 	01DF
		LDWI 	33H 			//0207 	2A33
		LCALL 	2C3H 			//0208 	32C3

		//;RF-car-light.C: 300: DelayMs(10);
		LCALL 	242H 			//0209 	3242
		LCALL 	28BH 			//020A 	328B

		//;RF-car-light.C: 302: }
		//;RF-car-light.C: 305: if(Learn==1)
		BTSC 	7BH,2 			//020B 	157B

		//;RF-car-light.C: 306: {
		//;RF-car-light.C: 309: if(Lock==1)
		BTSS 	7BH,0 			//020C 	1C7B
		LJUMP 	1E7H 			//020D 	39E7

		//;RF-car-light.C: 310: {
		//;RF-car-light.C: 313: EEPROMwrite(((key-5)*3),DataM[0]);
		LDR 	49H,0 			//020E 	0849
		STR 	5FH 			//020F 	01DF
		LDWI 	FBH 			//0210 	2AFB
		ADDWR 	54H,0 			//0211 	0B54
		STR 	67H 			//0212 	01E7
		ADDWR 	67H,0 			//0213 	0B67
		ADDWR 	67H,0 			//0214 	0B67
		LCALL 	2C3H 			//0215 	32C3

		//;RF-car-light.C: 314: DelayMs(10);
		LCALL 	242H 			//0216 	3242
		LCALL 	28BH 			//0217 	328B

		//;RF-car-light.C: 315: EEPROMwrite((((key-5)*3)+1),DataM[1]);
		LDR 	4AH,0 			//0218 	084A
		STR 	5FH 			//0219 	01DF
		LDR 	54H,0 			//021A 	0854
		ADDWR 	54H,0 			//021B 	0B54
		ADDWR 	54H,0 			//021C 	0B54
		ADDWI 	F2H 			//021D 	27F2
		LCALL 	2C3H 			//021E 	32C3

		//;RF-car-light.C: 316: DelayMs(10);
		LCALL 	242H 			//021F 	3242
		LCALL 	28BH 			//0220 	328B

		//;RF-car-light.C: 317: EEPROMwrite((((key-5)*3)+2),DataM[2]);
		LDR 	4BH,0 			//0221 	084B
		STR 	5FH 			//0222 	01DF
		LDR 	54H,0 			//0223 	0854
		ADDWR 	54H,0 			//0224 	0B54
		ADDWR 	54H,0 			//0225 	0B54
		ADDWI 	F3H 			//0226 	27F3
		LCALL 	2C3H 			//0227 	32C3

		//;RF-car-light.C: 318: DelayMs(10);
		LCALL 	242H 			//0228 	3242
		LCALL 	28BH 			//0229 	328B

		//;RF-car-light.C: 319: DataS[key-5][0]=DataM[0];
		LDR 	54H,0 			//022A 	0854
		ADDWR 	54H,0 			//022B 	0B54
		ADDWR 	54H,0 			//022C 	0B54
		ADDWI 	31H 			//022D 	2731
		STR 	FSR 			//022E 	0184
		LDR 	49H,0 			//022F 	0849
		BCR 	STATUS,7 		//0230 	1383
		STR 	INDF 			//0231 	0180

		//;RF-car-light.C: 320: DataS[key-5][1]=DataM[1];
		LDR 	54H,0 			//0232 	0854
		ADDWR 	54H,0 			//0233 	0B54
		ADDWR 	54H,0 			//0234 	0B54
		ADDWI 	32H 			//0235 	2732
		STR 	FSR 			//0236 	0184
		LDR 	4AH,0 			//0237 	084A
		STR 	INDF 			//0238 	0180

		//;RF-car-light.C: 321: DataS[key-5][2]=DataM[2];
		LDR 	54H,0 			//0239 	0854
		ADDWR 	54H,0 			//023A 	0B54
		ADDWR 	54H,0 			//023B 	0B54
		ADDWI 	33H 			//023C 	2733
		STR 	FSR 			//023D 	0184
		LDR 	4BH,0 			//023E 	084B
		STR 	INDF 			//023F 	0180

		//;RF-car-light.C: 324: key=0;
		//;RF-car-light.C: 325: Lock=0;
		//;RF-car-light.C: 326: Learn=0;
		//;RF-car-light.C: 328: TMR2IE = 0;
		//;RF-car-light.C: 329: conterout=0;
		//;RF-car-light.C: 330: PA5=1;
		//;RF-car-light.C: 332: T0IE=1;
		LCALL 	189H 			//0240 	3189
		LJUMP 	1E7H 			//0241 	39E7
		LDWI 	AH 			//0242 	2A0A
		BCR 	STATUS,5 		//0243 	1283
		STR 	61H 			//0244 	01E1
		CLRR 	62H 			//0245 	0162
		RET		 					//0246 	0004
		BCR 	STATUS,7 		//0247 	1383
		STR 	INDF 			//0248 	0180
		LDR 	68H,0 			//0249 	0868
		ADDWR 	68H,0 			//024A 	0B68
		ADDWR 	68H,0 			//024B 	0B68
		RET		 					//024C 	0004
		STR 	73H 			//024D 	01F3

		//;RF-car-light.C: 437: unsigned char Byte = 0b10000000, i = 0;
		LDWI 	80H 			//024E 	2A80
		STR 	74H 			//024F 	01F4

		//;RF-car-light.C: 438: for(i = 0; i <= 7; i++)
		CLRR 	75H 			//0250 	0175

		//;RF-car-light.C: 439: {
		//;RF-car-light.C: 440: if(Code & (Byte >> i))
		LDR 	74H,0 			//0251 	0874
		STR 	72H 			//0252 	01F2
		INCR	75H,0 			//0253 	0975
		LJUMP 	257H 			//0254 	3A57
		BCR 	STATUS,0 		//0255 	1003
		RRR	72H,1 			//0256 	06F2
		ADDWI 	FFH 			//0257 	27FF
		BTSS 	STATUS,2 		//0258 	1D03
		LJUMP 	255H 			//0259 	3A55
		LDR 	72H,0 			//025A 	0872
		ANDWR 	73H,0 			//025B 	0273

		//;RF-car-light.C: 441: {
		//;RF-car-light.C: 442: PA4 = 1;
		BCR 	STATUS,5 		//025C 	1283
		BTSC 	STATUS,2 		//025D 	1503
		LJUMP 	272H 			//025E 	3A72
		BSR 	5H,4 			//025F 	1A05

		//;RF-car-light.C: 443: DelayUs(420);
		LDWI 	A4H 			//0260 	2AA4
		LCALL 	312H 			//0261 	3312

		//;RF-car-light.C: 444: DelayUs(420);
		LDWI 	A4H 			//0262 	2AA4
		LCALL 	312H 			//0263 	3312

		//;RF-car-light.C: 445: DelayUs(420);
		LDWI 	A4H 			//0264 	2AA4
		LCALL 	312H 			//0265 	3312

		//;RF-car-light.C: 447: PA4 = 0;
		BCR 	STATUS,5 		//0266 	1283
		BCR 	5H,4 			//0267 	1205

		//;RF-car-light.C: 448: DelayUs(800);
		LDWI 	20H 			//0268 	2A20
		LCALL 	312H 			//0269 	3312

		//;RF-car-light.C: 449: DelayUs(800);
		LDWI 	20H 			//026A 	2A20
		LCALL 	312H 			//026B 	3312

		//;RF-car-light.C: 450: DelayUs(800);
		LDWI 	20H 			//026C 	2A20
		LCALL 	312H 			//026D 	3312

		//;RF-car-light.C: 451: DelayUs(800);
		LDWI 	20H 			//026E 	2A20
		LCALL 	312H 			//026F 	3312

		//;RF-car-light.C: 452: DelayUs(800);
		LDWI 	20H 			//0270 	2A20
		LJUMP 	284H 			//0271 	3A84

		//;RF-car-light.C: 454: else
		//;RF-car-light.C: 455: {
		//;RF-car-light.C: 456: PA4 = 1;
		//;RF-car-light.C: 453: }
		BSR 	5H,4 			//0272 	1A05

		//;RF-car-light.C: 457: DelayUs(800);
		LDWI 	20H 			//0273 	2A20
		LCALL 	312H 			//0274 	3312

		//;RF-car-light.C: 458: DelayUs(800);
		LDWI 	20H 			//0275 	2A20
		LCALL 	312H 			//0276 	3312

		//;RF-car-light.C: 459: DelayUs(800);
		LDWI 	20H 			//0277 	2A20
		LCALL 	312H 			//0278 	3312

		//;RF-car-light.C: 460: DelayUs(800);
		LDWI 	20H 			//0279 	2A20
		LCALL 	312H 			//027A 	3312

		//;RF-car-light.C: 461: DelayUs(800);
		LDWI 	20H 			//027B 	2A20
		LCALL 	312H 			//027C 	3312

		//;RF-car-light.C: 463: PA4 = 0;
		BCR 	STATUS,5 		//027D 	1283
		BCR 	5H,4 			//027E 	1205

		//;RF-car-light.C: 464: DelayUs(420);
		LDWI 	A4H 			//027F 	2AA4
		LCALL 	312H 			//0280 	3312

		//;RF-car-light.C: 465: DelayUs(420);
		LDWI 	A4H 			//0281 	2AA4
		LCALL 	312H 			//0282 	3312

		//;RF-car-light.C: 466: DelayUs(420);
		LDWI 	A4H 			//0283 	2AA4
		LCALL 	312H 			//0284 	3312
		LDWI 	8H 			//0285 	2A08
		INCR	75H,1 			//0286 	09F5
		SUBWR 	75H,0 			//0287 	0C75
		BTSC 	STATUS,0 		//0288 	1403
		RET		 					//0289 	0004
		LJUMP 	251H 			//028A 	3A51

		//;RF-car-light.C: 424: unsigned int a,b;
		//;RF-car-light.C: 425: for(a=0;a<Time;a++)
		CLRR 	63H 			//028B 	0163
		CLRR 	64H 			//028C 	0164
		LDR 	62H,0 			//028D 	0862
		SUBWR 	64H,0 			//028E 	0C64
		BTSS 	STATUS,2 		//028F 	1D03
		LJUMP 	293H 			//0290 	3A93
		LDR 	61H,0 			//0291 	0861
		SUBWR 	63H,0 			//0292 	0C63
		BTSC 	STATUS,0 		//0293 	1403
		RET		 					//0294 	0004

		//;RF-car-light.C: 426: {
		//;RF-car-light.C: 427: for(b=0;b<5;b++)
		CLRR 	65H 			//0295 	0165
		CLRR 	66H 			//0296 	0166

		//;RF-car-light.C: 428: {
		//;RF-car-light.C: 429: DelayUs(197);
		LDWI 	C5H 			//0297 	2AC5
		LCALL 	307H 			//0298 	3307
		INCR	65H,1 			//0299 	09E5
		BTSC 	STATUS,2 		//029A 	1503
		INCR	66H,1 			//029B 	09E6
		LDWI 	0H 			//029C 	2A00
		SUBWR 	66H,0 			//029D 	0C66
		LDWI 	5H 			//029E 	2A05
		BTSC 	STATUS,2 		//029F 	1503
		SUBWR 	65H,0 			//02A0 	0C65
		BTSS 	STATUS,0 		//02A1 	1C03
		LJUMP 	297H 			//02A2 	3A97
		INCR	63H,1 			//02A3 	09E3
		BTSC 	STATUS,2 		//02A4 	1503
		INCR	64H,1 			//02A5 	09E4
		LJUMP 	28DH 			//02A6 	3A8D

		//;RF-car-light.C: 424: unsigned int a,b;
		//;RF-car-light.C: 425: for(a=0;a<Time;a++)
		CLRR 	74H 			//02A7 	0174
		CLRR 	75H 			//02A8 	0175
		LDR 	73H,0 			//02A9 	0873
		SUBWR 	75H,0 			//02AA 	0C75
		BTSS 	STATUS,2 		//02AB 	1D03
		LJUMP 	2AFH 			//02AC 	3AAF
		LDR 	72H,0 			//02AD 	0872
		SUBWR 	74H,0 			//02AE 	0C74
		BTSC 	STATUS,0 		//02AF 	1403
		RET		 					//02B0 	0004

		//;RF-car-light.C: 426: {
		//;RF-car-light.C: 427: for(b=0;b<5;b++)
		CLRR 	76H 			//02B1 	0176
		CLRR 	77H 			//02B2 	0177

		//;RF-car-light.C: 428: {
		//;RF-car-light.C: 429: DelayUs(197);
		LDWI 	C5H 			//02B3 	2AC5
		LCALL 	312H 			//02B4 	3312
		INCR	76H,1 			//02B5 	09F6
		BTSC 	STATUS,2 		//02B6 	1503
		INCR	77H,1 			//02B7 	09F7
		LDWI 	0H 			//02B8 	2A00
		SUBWR 	77H,0 			//02B9 	0C77
		LDWI 	5H 			//02BA 	2A05
		BTSC 	STATUS,2 		//02BB 	1503
		SUBWR 	76H,0 			//02BC 	0C76
		BTSS 	STATUS,0 		//02BD 	1C03
		LJUMP 	2B3H 			//02BE 	3AB3
		INCR	74H,1 			//02BF 	09F4
		BTSC 	STATUS,2 		//02C0 	1503
		INCR	75H,1 			//02C1 	09F5
		LJUMP 	2A9H 			//02C2 	3AA9
		STR 	60H 			//02C3 	01E0

		//;RF-car-light.C: 401: GIE = 0;
		BCR 	INTCON,7 		//02C4 	138B

		//;RF-car-light.C: 402: while(GIE);
		BTSC 	INTCON,7 		//02C5 	178B
		LJUMP 	2C5H 			//02C6 	3AC5

		//;RF-car-light.C: 403: EEADR = EEAddr;
		LDR 	60H,0 			//02C7 	0860
		BSR 	STATUS,5 		//02C8 	1A83
		STR 	1BH 			//02C9 	019B

		//;RF-car-light.C: 404: EEDAT = Data;
		BCR 	STATUS,5 		//02CA 	1283
		LDR 	5FH,0 			//02CB 	085F
		BSR 	STATUS,5 		//02CC 	1A83
		STR 	1AH 			//02CD 	019A

		//;RF-car-light.C: 405: EEIF = 0;
		BCR 	STATUS,5 		//02CE 	1283
		BCR 	CH,7 			//02CF 	138C

		//;RF-car-light.C: 406: EECON1 |= 0x34;
		LDWI 	34H 			//02D0 	2A34
		BSR 	STATUS,5 		//02D1 	1A83
		IORWR 	1CH,1 			//02D2 	039C

		//;RF-car-light.C: 407: WR = 1;
		BSR 	1DH,0 			//02D3 	181D

		//;RF-car-light.C: 408: while(WR);
		BTSC 	1DH,0 			//02D4 	141D
		LJUMP 	2D4H 			//02D5 	3AD4

		//;RF-car-light.C: 409: GIE = 1;
		BSR 	INTCON,7 		//02D6 	1B8B
		RET		 					//02D7 	0004
		STR 	7AH 			//02D8 	01FA

		//;RF-car-light.C: 474: PA4=0;
		BCR 	5H,4 			//02D9 	1205

		//;RF-car-light.C: 475: DelayMs(5);
		LDWI 	5H 			//02DA 	2A05
		STR 	72H 			//02DB 	01F2
		CLRR 	73H 			//02DC 	0173
		LCALL 	2A7H 			//02DD 	32A7

		//;RF-car-light.C: 476: SEND_DATA(Code1);
		LDR 	7AH,0 			//02DE 	087A
		LCALL 	24DH 			//02DF 	324D

		//;RF-car-light.C: 477: SEND_DATA(Code2);
		LDR 	78H,0 			//02E0 	0878
		LCALL 	24DH 			//02E1 	324D

		//;RF-car-light.C: 478: SEND_DATA(Code3);
		LDR 	79H,0 			//02E2 	0879
		LCALL 	24DH 			//02E3 	324D

		//;RF-car-light.C: 480: PA4 = 1;
		BCR 	STATUS,5 		//02E4 	1283
		BSR 	5H,4 			//02E5 	1A05

		//;RF-car-light.C: 481: DelayUs(410);
		LDWI 	9AH 			//02E6 	2A9A
		LCALL 	312H 			//02E7 	3312

		//;RF-car-light.C: 483: PA4 = 0;
		BCR 	STATUS,5 		//02E8 	1283
		BCR 	5H,4 			//02E9 	1205
		RET		 					//02EA 	0004

		//;RF-car-light.C: 350: OSCCON = 0B01110000;
		LDWI 	70H 			//02EB 	2A70
		BSR 	STATUS,5 		//02EC 	1A83
		STR 	FH 			//02ED 	018F

		//;RF-car-light.C: 352: INTCON = 0;
		CLRR 	INTCON 			//02EE 	010B

		//;RF-car-light.C: 353: OPTION = 0B00001000;
		LDWI 	8H 			//02EF 	2A08
		STR 	1H 			//02F0 	0181

		//;RF-car-light.C: 355: PORTA = 0B00000000;
		BCR 	STATUS,5 		//02F1 	1283
		CLRR 	5H 			//02F2 	0105

		//;RF-car-light.C: 356: TRISA = 0B00001001;
		LDWI 	9H 			//02F3 	2A09
		BSR 	STATUS,5 		//02F4 	1A83
		STR 	5H 			//02F5 	0185

		//;RF-car-light.C: 358: WPUA = 0B00000001;
		LDWI 	1H 			//02F6 	2A01
		STR 	15H 			//02F7 	0195

		//;RF-car-light.C: 360: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//02F8 	1283
		CLRR 	1BH 			//02F9 	011B
		RET		 					//02FA 	0004

		//;RF-car-light.C: 366: T2CON = 0B00000001;
		LDWI 	1H 			//02FB 	2A01
		STR 	12H 			//02FC 	0192

		//;RF-car-light.C: 367: TMR2 = 0;
		CLRR 	11H 			//02FD 	0111

		//;RF-car-light.C: 368: PR2 = 50;
		LDWI 	32H 			//02FE 	2A32
		BSR 	STATUS,5 		//02FF 	1A83
		STR 	12H 			//0300 	0192

		//;RF-car-light.C: 369: TMR2IF = 0;
		BCR 	STATUS,5 		//0301 	1283
		BCR 	CH,1 			//0302 	108C

		//;RF-car-light.C: 371: TMR2ON = 1;
		BSR 	12H,2 			//0303 	1912

		//;RF-car-light.C: 372: PEIE=1;
		BSR 	INTCON,6 		//0304 	1B0B

		//;RF-car-light.C: 373: GIE = 1;
		BSR 	INTCON,7 		//0305 	1B8B
		RET		 					//0306 	0004
		STR 	5FH 			//0307 	01DF

		//;RF-car-light.C: 414: unsigned char a;
		//;RF-car-light.C: 415: for(a=0;a<Time;a++)
		CLRR 	60H 			//0308 	0160
		LDR 	5FH,0 			//0309 	085F
		SUBWR 	60H,0 			//030A 	0C60
		BTSC 	STATUS,0 		//030B 	1403
		RET		 					//030C 	0004

		//;RF-car-light.C: 416: {
		//;RF-car-light.C: 417: __nop();
		NOP		 					//030D 	0000
		CLRWDT	 			//030E 	0001
		BCR 	STATUS,5 		//030F 	1283
		INCR	60H,1 			//0310 	09E0
		LJUMP 	309H 			//0311 	3B09
		STR 	70H 			//0312 	01F0

		//;RF-car-light.C: 414: unsigned char a;
		//;RF-car-light.C: 415: for(a=0;a<Time;a++)
		CLRR 	71H 			//0313 	0171
		LDR 	70H,0 			//0314 	0870
		SUBWR 	71H,0 			//0315 	0C71
		BTSC 	STATUS,0 		//0316 	1403
		RET		 					//0317 	0004

		//;RF-car-light.C: 416: {
		//;RF-car-light.C: 417: __nop();
		NOP		 					//0318 	0000
		CLRWDT	 			//0319 	0001
		INCR	71H,1 			//031A 	09F1
		LJUMP 	314H 			//031B 	3B14

		//;RF-car-light.C: 378: OPTION = 0B00000110;
		LDWI 	6H 			//031C 	2A06
		BSR 	STATUS,5 		//031D 	1A83
		STR 	1H 			//031E 	0181

		//;RF-car-light.C: 384: TMR0 = 239;
		LDWI 	EFH 			//031F 	2AEF
		BCR 	STATUS,5 		//0320 	1283
		STR 	1H 			//0321 	0181

		//;RF-car-light.C: 385: T0IF = 0;
		BCR 	INTCON,2 		//0322 	110B

		//;RF-car-light.C: 386: T0IE = 1;
		BSR 	INTCON,5 		//0323 	1A8B
		RET		 					//0324 	0004
		CLRWDT	 			//0325 	0001
		CLRR 	INDF 			//0326 	0100
		INCR	FSR,1 			//0327 	0984
		XORWR 	FSR,0 			//0328 	0404
		BTSC 	STATUS,2 		//0329 	1503
		RETW 	0H 			//032A 	2100
		XORWR 	FSR,0 			//032B 	0404
		LJUMP 	326H 			//032C 	3B26
		STR 	5FH 			//032D 	01DF

		//;RF-car-light.C: 391: unsigned char ReEEPROMread;
		//;RF-car-light.C: 393: EEADR = EEAddr;
		BSR 	STATUS,5 		//032E 	1A83
		STR 	1BH 			//032F 	019B

		//;RF-car-light.C: 394: RD = 1;
		BSR 	1CH,0 			//0330 	181C

		//;RF-car-light.C: 395: ReEEPROMread = EEDAT;
		LDR 	1AH,0 			//0331 	081A
		BCR 	STATUS,5 		//0332 	1283
		STR 	60H 			//0333 	01E0

		//;RF-car-light.C: 396: return ReEEPROMread;
		RET		 					//0334 	0004
			END
