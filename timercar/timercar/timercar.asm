//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_S		EQU		74H
		_M		EQU		73H
		_H		EQU		72H
		_mode		EQU		71H
		_modelamp		EQU		70H
		_Lock		EQU		7AH
		_Lock2		EQU		79H
		_Puls_Count		EQU		43H
//		DelayMs@Time		EQU		40H
//		DelayMs@b		EQU		42H
//		DelayMs@a		EQU		41H
//		DelayMs@Time		EQU		40H
//		DelayMs@Time		EQU		40H
//		DelayUs@Time		EQU		77H
//		DelayUs@a		EQU		78H
//		DelayUs@Time		EQU		77H
//		DelayUs@Time		EQU		77H
//-----------------------Variable END---------------------------------

		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	75H 			//0006 	01F5
		LDR 	PCLATH,0 		//0007 	080A
		STR 	76H 			//0008 	01F6
		LJUMP 	EFH 			//0009 	38EF
		LJUMP 	0BH 			//000A 	380B
		LDWI 	1H 			//000B 	2A01
		STR 	79H 			//000C 	01F9
		STR 	7AH 			//000D 	01FA
		CLRR 	43H 			//000E 	0143
		CLRR 	44H 			//000F 	0144
		CLRR 	70H 			//0010 	0170
		CLRR 	71H 			//0011 	0171
		CLRR 	72H 			//0012 	0172
		CLRR 	73H 			//0013 	0173
		CLRR 	74H 			//0014 	0174
		CLRR 	STATUS 			//0015 	0103
		LJUMP 	17H 			//0016 	3817

		//;timercar.C: 129: POWER_INITIAL();
		LCALL 	127H 			//0017 	3127

		//;timercar.C: 130: TIMER0_INITIAL();
		LCALL 	137H 			//0018 	3137

		//;timercar.C: 133: GIE = 1;
		BSR 	INTCON,7 		//0019 	1B8B

		//;timercar.C: 135: T0IE = 0;
		BCR 	INTCON,5 		//001A 	128B

		//;timercar.C: 140: {
		//;timercar.C: 143: if(PA0==0){
		BTSC 	5H,0 			//001B 	1405
		LJUMP 	32H 			//001C 	3832

		//;timercar.C: 144: PA1=0;
		BCR 	5H,1 			//001D 	1085

		//;timercar.C: 145: DelayMs(300);
		LDWI 	2CH 			//001E 	2A2C
		LCALL 	116H 			//001F 	3116

		//;timercar.C: 146: PA1=1;
		BSR 	5H,1 			//0020 	1885

		//;timercar.C: 147: DelayMs(300);
		LDWI 	2CH 			//0021 	2A2C
		LCALL 	116H 			//0022 	3116

		//;timercar.C: 148: PA1=0;
		BCR 	5H,1 			//0023 	1085

		//;timercar.C: 149: DelayMs(300);
		LDWI 	2CH 			//0024 	2A2C
		LCALL 	116H 			//0025 	3116

		//;timercar.C: 150: PA1=1;
		BSR 	5H,1 			//0026 	1885

		//;timercar.C: 151: DelayMs(300);
		LDWI 	2CH 			//0027 	2A2C
		LCALL 	116H 			//0028 	3116

		//;timercar.C: 152: PA1=0;
		BCR 	5H,1 			//0029 	1085

		//;timercar.C: 153: DelayMs(300);
		LDWI 	2CH 			//002A 	2A2C
		LCALL 	116H 			//002B 	3116

		//;timercar.C: 154: PA1=1;
		BSR 	5H,1 			//002C 	1885

		//;timercar.C: 155: DelayMs(300);
		LDWI 	2CH 			//002D 	2A2C
		LCALL 	116H 			//002E 	3116

		//;timercar.C: 156: PA1=0;
		BCR 	5H,1 			//002F 	1085

		//;timercar.C: 159: mode=1;
		LDWI 	1H 			//0030 	2A01
		STR 	71H 			//0031 	01F1

		//;timercar.C: 160: }
		//;timercar.C: 163: if(PA4==0){
		BTSC 	5H,4 			//0032 	1605
		LJUMP 	E3H 			//0033 	38E3

		//;timercar.C: 167: if( S==5 && Lock==0 ){
		LDWI 	5H 			//0034 	2A05
		XORWR 	74H,0 			//0035 	0474
		BTSS 	STATUS,2 		//0036 	1D03
		LJUMP 	3CH 			//0037 	383C
		LDR 	7AH,0 			//0038 	087A
		BTSS 	STATUS,2 		//0039 	1D03
		LJUMP 	3CH 			//003A 	383C

		//;timercar.C: 168: PA2=1;
		BSR 	5H,2 			//003B 	1905

		//;timercar.C: 170: }
		//;timercar.C: 171: if( S==6 && Lock==0 ){
		LDWI 	6H 			//003C 	2A06
		XORWR 	74H,0 			//003D 	0474
		BTSS 	STATUS,2 		//003E 	1D03
		LJUMP 	47H 			//003F 	3847
		LDR 	7AH,0 			//0040 	087A
		BTSS 	STATUS,2 		//0041 	1D03
		LJUMP 	47H 			//0042 	3847

		//;timercar.C: 173: PA2=0;
		BCR 	5H,2 			//0043 	1105

		//;timercar.C: 174: Lock=1;
		LDWI 	1H 			//0044 	2A01
		STR 	7AH 			//0045 	01FA

		//;timercar.C: 175: mode=0;
		CLRR 	71H 			//0046 	0171

		//;timercar.C: 176: }
		//;timercar.C: 179: if( M==15 && S==10 && Lock2==0 && mode==1){
		LDWI 	FH 			//0047 	2A0F
		XORWR 	73H,0 			//0048 	0473
		BTSS 	STATUS,2 		//0049 	1D03
		LJUMP 	55H 			//004A 	3855
		LDWI 	AH 			//004B 	2A0A
		XORWR 	74H,0 			//004C 	0474
		BTSS 	STATUS,2 		//004D 	1D03
		LJUMP 	55H 			//004E 	3855
		LDR 	79H,0 			//004F 	0879
		BTSS 	STATUS,2 		//0050 	1D03
		LJUMP 	55H 			//0051 	3855
		DECRSZ 	71H,0 		//0052 	0E71
		LJUMP 	55H 			//0053 	3855

		//;timercar.C: 181: PA2=1;
		BSR 	5H,2 			//0054 	1905

		//;timercar.C: 183: }
		//;timercar.C: 184: if( M==15 && S==11 && Lock2==0 && mode==1 ){
		LDWI 	FH 			//0055 	2A0F
		XORWR 	73H,0 			//0056 	0473
		BTSS 	STATUS,2 		//0057 	1D03
		LJUMP 	66H 			//0058 	3866
		LDWI 	BH 			//0059 	2A0B
		XORWR 	74H,0 			//005A 	0474
		BTSS 	STATUS,2 		//005B 	1D03
		LJUMP 	66H 			//005C 	3866
		LDR 	79H,0 			//005D 	0879
		BTSS 	STATUS,2 		//005E 	1D03
		LJUMP 	66H 			//005F 	3866
		DECR 	71H,0 			//0060 	0D71
		BTSS 	STATUS,2 		//0061 	1D03
		LJUMP 	66H 			//0062 	3866

		//;timercar.C: 186: PA2=0;
		BCR 	5H,2 			//0063 	1105

		//;timercar.C: 188: Lock2=1;
		LDWI 	1H 			//0064 	2A01
		STR 	79H 			//0065 	01F9

		//;timercar.C: 189: }
		//;timercar.C: 192: if(PA3==0 && modelamp!=1){
		BTSC 	5H,3 			//0066 	1585
		LJUMP 	93H 			//0067 	3893
		DECR 	70H,0 			//0068 	0D70
		BTSC 	STATUS,2 		//0069 	1503
		LJUMP 	93H 			//006A 	3893

		//;timercar.C: 193: modelamp=1;
		LDWI 	1H 			//006B 	2A01
		STR 	70H 			//006C 	01F0

		//;timercar.C: 195: T0IE=0;
		BCR 	INTCON,5 		//006D 	128B

		//;timercar.C: 196: S=0;
		CLRR 	74H 			//006E 	0174

		//;timercar.C: 197: M=0;
		CLRR 	73H 			//006F 	0173

		//;timercar.C: 199: PA2=0;
		BCR 	5H,2 			//0070 	1105

		//;timercar.C: 201: PA1=1;DelayMs(50);PA1=0;DelayMs(50);PA1=1;DelayMs(50);PA1=0;DelayMs(50
		//+                          );PA1=1;DelayMs(50);PA1=0;
		BSR 	5H,1 			//0071 	1885
		LDWI 	32H 			//0072 	2A32
		LCALL 	116H 			//0073 	3116
		BCR 	5H,1 			//0074 	1085
		LDWI 	32H 			//0075 	2A32
		LCALL 	116H 			//0076 	3116
		BSR 	5H,1 			//0077 	1885
		LDWI 	32H 			//0078 	2A32
		LCALL 	116H 			//0079 	3116
		BCR 	5H,1 			//007A 	1085
		LDWI 	32H 			//007B 	2A32
		LCALL 	116H 			//007C 	3116
		BSR 	5H,1 			//007D 	1885
		LDWI 	32H 			//007E 	2A32
		LCALL 	116H 			//007F 	3116
		BCR 	5H,1 			//0080 	1085

		//;timercar.C: 202: DelayMs(600);
		LDWI 	58H 			//0081 	2A58
		LCALL 	116H 			//0082 	3116

		//;timercar.C: 203: PA1=1;DelayMs(50);PA1=0;DelayMs(50);PA1=1;DelayMs(50);PA1=0;DelayMs(50
		//+                          );PA1=1;DelayMs(50);PA1=0;
		BSR 	5H,1 			//0083 	1885
		LDWI 	32H 			//0084 	2A32
		LCALL 	116H 			//0085 	3116
		BCR 	5H,1 			//0086 	1085
		LDWI 	32H 			//0087 	2A32
		LCALL 	116H 			//0088 	3116
		BSR 	5H,1 			//0089 	1885
		LDWI 	32H 			//008A 	2A32
		LCALL 	116H 			//008B 	3116
		BCR 	5H,1 			//008C 	1085
		LDWI 	32H 			//008D 	2A32
		LCALL 	116H 			//008E 	3116
		BSR 	5H,1 			//008F 	1885
		LDWI 	32H 			//0090 	2A32
		LCALL 	116H 			//0091 	3116
		BCR 	5H,1 			//0092 	1085

		//;timercar.C: 204: }
		//;timercar.C: 206: if(PA3!=0 && modelamp==1){
		BTSS 	5H,3 			//0093 	1D85
		LJUMP 	E3H 			//0094 	38E3
		DECR 	70H,0 			//0095 	0D70
		BTSS 	STATUS,2 		//0096 	1D03
		LJUMP 	E3H 			//0097 	38E3

		//;timercar.C: 208: PA1=1;DelayMs(50);PA1=0;DelayMs(50);PA1=1;DelayMs(50);PA1=0;DelayMs(50
		//+                          );PA1=1;DelayMs(50);PA1=0;
		BSR 	5H,1 			//0098 	1885
		LDWI 	32H 			//0099 	2A32
		LCALL 	116H 			//009A 	3116
		BCR 	5H,1 			//009B 	1085
		LDWI 	32H 			//009C 	2A32
		LCALL 	116H 			//009D 	3116
		BSR 	5H,1 			//009E 	1885
		LDWI 	32H 			//009F 	2A32
		LCALL 	116H 			//00A0 	3116
		BCR 	5H,1 			//00A1 	1085
		LDWI 	32H 			//00A2 	2A32
		LCALL 	116H 			//00A3 	3116
		BSR 	5H,1 			//00A4 	1885
		LDWI 	32H 			//00A5 	2A32
		LCALL 	116H 			//00A6 	3116
		BCR 	5H,1 			//00A7 	1085

		//;timercar.C: 209: DelayMs(500);
		LDWI 	F4H 			//00A8 	2AF4
		LCALL 	116H 			//00A9 	3116

		//;timercar.C: 210: PA1=1;DelayMs(50);PA1=0;DelayMs(50);PA1=1;DelayMs(50);PA1=0;DelayMs(50
		//+                          );PA1=1;DelayMs(50);PA1=0;
		BSR 	5H,1 			//00AA 	1885
		LDWI 	32H 			//00AB 	2A32
		LCALL 	116H 			//00AC 	3116
		BCR 	5H,1 			//00AD 	1085
		LDWI 	32H 			//00AE 	2A32
		LCALL 	116H 			//00AF 	3116
		BSR 	5H,1 			//00B0 	1885
		LDWI 	32H 			//00B1 	2A32
		LCALL 	116H 			//00B2 	3116
		BCR 	5H,1 			//00B3 	1085
		LDWI 	32H 			//00B4 	2A32
		LCALL 	116H 			//00B5 	3116
		BSR 	5H,1 			//00B6 	1885
		LDWI 	32H 			//00B7 	2A32
		LCALL 	116H 			//00B8 	3116
		BCR 	5H,1 			//00B9 	1085

		//;timercar.C: 211: DelayMs(500);
		LDWI 	F4H 			//00BA 	2AF4
		LCALL 	116H 			//00BB 	3116

		//;timercar.C: 212: PA1=1;DelayMs(50);PA1=0;DelayMs(50);PA1=1;DelayMs(50);PA1=0;DelayMs(50
		//+                          );PA1=1;DelayMs(50);PA1=0;
		BSR 	5H,1 			//00BC 	1885
		LDWI 	32H 			//00BD 	2A32
		LCALL 	116H 			//00BE 	3116
		BCR 	5H,1 			//00BF 	1085
		LDWI 	32H 			//00C0 	2A32
		LCALL 	116H 			//00C1 	3116
		BSR 	5H,1 			//00C2 	1885
		LDWI 	32H 			//00C3 	2A32
		LCALL 	116H 			//00C4 	3116
		BCR 	5H,1 			//00C5 	1085
		LDWI 	32H 			//00C6 	2A32
		LCALL 	116H 			//00C7 	3116
		BSR 	5H,1 			//00C8 	1885
		LDWI 	32H 			//00C9 	2A32
		LCALL 	116H 			//00CA 	3116
		BCR 	5H,1 			//00CB 	1085

		//;timercar.C: 213: DelayMs(500);
		LDWI 	F4H 			//00CC 	2AF4
		LCALL 	116H 			//00CD 	3116

		//;timercar.C: 214: PA1=1;DelayMs(50);PA1=0;DelayMs(50);PA1=1;DelayMs(50);PA1=0;DelayMs(50
		//+                          );PA1=1;DelayMs(50);PA1=0;
		BSR 	5H,1 			//00CE 	1885
		LDWI 	32H 			//00CF 	2A32
		LCALL 	116H 			//00D0 	3116
		BCR 	5H,1 			//00D1 	1085
		LDWI 	32H 			//00D2 	2A32
		LCALL 	116H 			//00D3 	3116
		BSR 	5H,1 			//00D4 	1885
		LDWI 	32H 			//00D5 	2A32
		LCALL 	116H 			//00D6 	3116
		BCR 	5H,1 			//00D7 	1085
		LDWI 	32H 			//00D8 	2A32
		LCALL 	116H 			//00D9 	3116
		BSR 	5H,1 			//00DA 	1885
		LDWI 	32H 			//00DB 	2A32
		LCALL 	116H 			//00DC 	3116
		BCR 	5H,1 			//00DD 	1085

		//;timercar.C: 216: DelayMs(1000);
		LDWI 	E8H 			//00DE 	2AE8
		LCALL 	116H 			//00DF 	3116

		//;timercar.C: 218: T0IE=1;
		BSR 	INTCON,5 		//00E0 	1A8B

		//;timercar.C: 219: modelamp=2;
		LDWI 	2H 			//00E1 	2A02
		STR 	70H 			//00E2 	01F0

		//;timercar.C: 221: }
		//;timercar.C: 223: }
		//;timercar.C: 226: if(PA4==1 ){
		BTSS 	5H,4 			//00E3 	1E05
		LJUMP 	1BH 			//00E4 	381B

		//;timercar.C: 228: T0IE=0;
		BCR 	INTCON,5 		//00E5 	128B

		//;timercar.C: 229: S=0;
		CLRR 	74H 			//00E6 	0174

		//;timercar.C: 230: M=0;
		CLRR 	73H 			//00E7 	0173

		//;timercar.C: 232: PA2=0;
		BCR 	5H,2 			//00E8 	1105

		//;timercar.C: 234: PA1=0;
		BCR 	5H,1 			//00E9 	1085

		//;timercar.C: 235: Lock=0;
		CLRR 	7AH 			//00EA 	017A

		//;timercar.C: 236: Lock2=0;
		CLRR 	79H 			//00EB 	0179

		//;timercar.C: 237: mode=0;
		CLRR 	71H 			//00EC 	0171

		//;timercar.C: 239: modelamp=0;
		CLRR 	70H 			//00ED 	0170
		LJUMP 	1BH 			//00EE 	381B

		//;timercar.C: 39: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//00EF 	168B
		BTSS 	INTCON,2 		//00F0 	1D0B
		LJUMP 	10FH 			//00F1 	390F

		//;timercar.C: 40: {
		//;timercar.C: 41: TMR0 = 239;
		LDWI 	EFH 			//00F2 	2AEF
		BCR 	STATUS,5 		//00F3 	1283
		STR 	1H 			//00F4 	0181

		//;timercar.C: 42: T0IF = 0;
		BCR 	INTCON,2 		//00F5 	110B

		//;timercar.C: 44: Puls_Count++;
		INCR	43H,1 			//00F6 	09C3
		BTSC 	STATUS,2 		//00F7 	1503
		INCR	44H,1 			//00F8 	09C4

		//;timercar.C: 46: if(Puls_Count>=2000){
		LDWI 	7H 			//00F9 	2A07
		SUBWR 	44H,0 			//00FA 	0C44
		LDWI 	D0H 			//00FB 	2AD0
		BTSC 	STATUS,2 		//00FC 	1503
		SUBWR 	43H,0 			//00FD 	0C43
		BTSS 	STATUS,0 		//00FE 	1C03
		LJUMP 	105H 			//00FF 	3905

		//;timercar.C: 47: Puls_Count=0;
		CLRR 	43H 			//0100 	0143
		CLRR 	44H 			//0101 	0144

		//;timercar.C: 48: PA1 = ~PA1;
		LDWI 	2H 			//0102 	2A02
		XORWR 	5H,1 			//0103 	0485

		//;timercar.C: 49: S++;
		INCR	74H,1 			//0104 	09F4

		//;timercar.C: 51: }
		//;timercar.C: 53: if(S>=60)S=0,M++;
		LDWI 	3CH 			//0105 	2A3C
		SUBWR 	74H,0 			//0106 	0C74
		BTSS 	STATUS,0 		//0107 	1C03
		LJUMP 	10BH 			//0108 	390B
		CLRR 	74H 			//0109 	0174
		INCR	73H,1 			//010A 	09F3

		//;timercar.C: 54: if(M>=60)M=0;
		LDWI 	3CH 			//010B 	2A3C
		SUBWR 	73H,0 			//010C 	0C73
		BTSC 	STATUS,0 		//010D 	1403
		CLRR 	73H 			//010E 	0173
		LDR 	76H,0 			//010F 	0876
		STR 	PCLATH 			//0110 	018A
		SWAPR 	75H,0 			//0111 	0775
		STR 	STATUS 			//0112 	0183
		SWAPR 	7EH,1 			//0113 	07FE
		SWAPR 	7EH,0 			//0114 	077E
		RETI		 			//0115 	0009
		STR 	40H 			//0116 	01C0

		//;timercar.C: 75: unsigned char a,b;
		//;timercar.C: 76: for(a=0;a<Time;a++)
		CLRR 	41H 			//0117 	0141
		LDR 	40H,0 			//0118 	0840
		SUBWR 	41H,0 			//0119 	0C41
		BTSC 	STATUS,0 		//011A 	1403
		RET		 					//011B 	0004

		//;timercar.C: 77: {
		//;timercar.C: 78: for(b=0;b<5;b++)
		CLRR 	42H 			//011C 	0142

		//;timercar.C: 79: {
		//;timercar.C: 80: DelayUs(98);
		LDWI 	62H 			//011D 	2A62
		LCALL 	140H 			//011E 	3140
		LDWI 	5H 			//011F 	2A05
		BCR 	STATUS,5 		//0120 	1283
		INCR	42H,1 			//0121 	09C2
		SUBWR 	42H,0 			//0122 	0C42
		BTSS 	STATUS,0 		//0123 	1C03
		LJUMP 	11DH 			//0124 	391D
		INCR	41H,1 			//0125 	09C1
		LJUMP 	118H 			//0126 	3918

		//;timercar.C: 101: OSCCON = 0B01110001;
		LDWI 	71H 			//0127 	2A71
		BSR 	STATUS,5 		//0128 	1A83
		STR 	FH 			//0129 	018F

		//;timercar.C: 103: INTCON = 0;
		CLRR 	INTCON 			//012A 	010B

		//;timercar.C: 104: OPTION = 0B00001000;
		LDWI 	8H 			//012B 	2A08
		STR 	1H 			//012C 	0181

		//;timercar.C: 106: PORTA = 0B00000000;
		BCR 	STATUS,5 		//012D 	1283
		CLRR 	5H 			//012E 	0105

		//;timercar.C: 107: TRISA = 0B00011001;
		LDWI 	19H 			//012F 	2A19
		BSR 	STATUS,5 		//0130 	1A83
		STR 	5H 			//0131 	0185

		//;timercar.C: 109: WPUA = 0B00000001;
		LDWI 	1H 			//0132 	2A01
		STR 	15H 			//0133 	0195

		//;timercar.C: 111: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//0134 	1283
		CLRR 	1BH 			//0135 	011B
		RET		 					//0136 	0004

		//;timercar.C: 117: OPTION = 0B00000110;
		LDWI 	6H 			//0137 	2A06
		BSR 	STATUS,5 		//0138 	1A83
		STR 	1H 			//0139 	0181

		//;timercar.C: 119: TMR0 = 239;
		LDWI 	EFH 			//013A 	2AEF
		BCR 	STATUS,5 		//013B 	1283
		STR 	1H 			//013C 	0181

		//;timercar.C: 120: T0IF = 0;
		BCR 	INTCON,2 		//013D 	110B

		//;timercar.C: 121: T0IE = 1;
		BSR 	INTCON,5 		//013E 	1A8B
		RET		 					//013F 	0004
		STR 	77H 			//0140 	01F7

		//;timercar.C: 65: unsigned char a;
		//;timercar.C: 66: for(a=0;a<Time;a++)
		CLRR 	78H 			//0141 	0178
		LDR 	77H,0 			//0142 	0877
		SUBWR 	78H,0 			//0143 	0C78
		BTSC 	STATUS,0 		//0144 	1403
		RET		 					//0145 	0004

		//;timercar.C: 67: {
		//;timercar.C: 68: __nop();
		NOP		 					//0146 	0000
		INCR	78H,1 			//0147 	09F8
		LJUMP 	142H 			//0148 	3942
			END
