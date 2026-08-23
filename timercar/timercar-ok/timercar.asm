//Deviec:FT60E01X
//-----------------------Variable---------------------------------
		_PA0		EQU		05H
		_PA1		EQU		05H
		_PA2		EQU		05H
		_PA3		EQU		05H
		_PA4		EQU		05H
		_PA5		EQU		05H
		_T0IF		EQU		0BH
		_T0IE		EQU		0BH
		_GIE		EQU		0BH
		_S		EQU		74H
		_M		EQU		73H
		_H		EQU		44H
		_mode		EQU		72H
		_Lock		EQU		7AH
		_Lock2		EQU		79H
		_Door_Lock		EQU		43H
		_Ghofl_Lock		EQU		71H
		_Lamp_Lock		EQU		70H
		_ACC_Lock		EQU		42H
		_Puls_Count		EQU		40H
//		DelayMs@Time		EQU		45H
//		DelayMs@b		EQU		47H
//		DelayMs@a		EQU		46H
//		DelayMs@Time		EQU		45H
//		DelayMs@Time		EQU		45H
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
		LJUMP 	A9H 			//0009 	38A9
		LJUMP 	0BH 			//000A 	380B
		LDWI 	1H 			//000B 	2A01
		STR 	79H 			//000C 	01F9
		STR 	7AH 			//000D 	01FA
		CLRR 	40H 			//000E 	0140
		CLRR 	41H 			//000F 	0141
		CLRR 	42H 			//0010 	0142
		CLRR 	43H 			//0011 	0143
		CLRR 	44H 			//0012 	0144
		CLRR 	70H 			//0013 	0170
		CLRR 	71H 			//0014 	0171
		CLRR 	72H 			//0015 	0172
		CLRR 	73H 			//0016 	0173
		CLRR 	74H 			//0017 	0174
		CLRR 	STATUS 			//0018 	0103
		LJUMP 	1AH 			//0019 	381A

		//;timercar.C: 130: POWER_INITIAL();
		LCALL 	E1H 			//001A 	30E1

		//;timercar.C: 131: TIMER0_INITIAL();
		LCALL 	F0H 			//001B 	30F0

		//;timercar.C: 134: GIE = 1;
		BSR 	INTCON,7 		//001C 	1B8B

		//;timercar.C: 136: T0IE = 0;
		BCR 	INTCON,5 		//001D 	128B

		//;timercar.C: 141: {
		//;timercar.C: 143: if(PA5==0 ){
		BTSC 	5H,5 			//001E 	1685
		LJUMP 	31H 			//001F 	3831

		//;timercar.C: 164: if(mode==3 || mode==5 || mode==4){
		LDWI 	3H 			//0020 	2A03
		XORWR 	72H,0 			//0021 	0472
		BTSC 	STATUS,2 		//0022 	1503
		LJUMP 	2CH 			//0023 	382C
		LDWI 	5H 			//0024 	2A05
		XORWR 	72H,0 			//0025 	0472
		LDWI 	4H 			//0026 	2A04
		BTSC 	STATUS,2 		//0027 	1503
		LJUMP 	2DH 			//0028 	382D
		XORWR 	72H,0 			//0029 	0472
		BTSS 	STATUS,2 		//002A 	1D03
		LJUMP 	2FH 			//002B 	382F

		//;timercar.C: 165: mode=4;
		LDWI 	4H 			//002C 	2A04
		STR 	72H 			//002D 	01F2

		//;timercar.C: 166: T0IE=1;
		BSR 	INTCON,5 		//002E 	1A8B

		//;timercar.C: 167: }
		//;timercar.C: 168: Door_Lock=1;
		LDWI 	1H 			//002F 	2A01
		STR 	43H 			//0030 	01C3

		//;timercar.C: 169: }
		//;timercar.C: 171: if(PA3==0 && mode==0)mode=1;
		BTSC 	5H,3 			//0031 	1585
		LJUMP 	38H 			//0032 	3838
		LDR 	72H,0 			//0033 	0872
		BTSS 	STATUS,2 		//0034 	1D03
		LJUMP 	38H 			//0035 	3838
		LDWI 	1H 			//0036 	2A01
		STR 	72H 			//0037 	01F2

		//;timercar.C: 173: if(PA3==1 && Lamp_Lock==0 && mode==1 ){
		BTSS 	5H,3 			//0038 	1D85
		LJUMP 	44H 			//0039 	3844
		LDR 	70H,0 			//003A 	0870
		BTSS 	STATUS,2 		//003B 	1D03
		LJUMP 	44H 			//003C 	3844
		DECR 	72H,0 			//003D 	0D72
		BTSS 	STATUS,2 		//003E 	1D03
		LJUMP 	44H 			//003F 	3844

		//;timercar.C: 192: Lamp_Lock=1;
		LDWI 	1H 			//0040 	2A01
		STR 	70H 			//0041 	01F0

		//;timercar.C: 193: mode=2;
		LDWI 	2H 			//0042 	2A02
		STR 	72H 			//0043 	01F2

		//;timercar.C: 194: }
		//;timercar.C: 196: if(PA0==0 ){
		BTSC 	5H,0 			//0044 	1405
		LJUMP 	50H 			//0045 	3850

		//;timercar.C: 217: if(mode==4 ){
		LDWI 	4H 			//0046 	2A04
		XORWR 	72H,0 			//0047 	0472
		BTSS 	STATUS,2 		//0048 	1D03
		LJUMP 	4EH 			//0049 	384E

		//;timercar.C: 218: mode=5;
		LDWI 	5H 			//004A 	2A05
		STR 	72H 			//004B 	01F2

		//;timercar.C: 219: T0IE=0;
		BCR 	INTCON,5 		//004C 	128B

		//;timercar.C: 220: PA1=0;
		BCR 	5H,1 			//004D 	1085

		//;timercar.C: 221: }
		//;timercar.C: 223: Ghofl_Lock=1;
		LDWI 	1H 			//004E 	2A01
		STR 	71H 			//004F 	01F1

		//;timercar.C: 224: }
		//;timercar.C: 228: if(PA4==0){
		BTSC 	5H,4 			//0050 	1605
		LJUMP 	9AH 			//0051 	389A

		//;timercar.C: 231: if(ACC_Lock==0){
		LDR 	42H,0 			//0052 	0842
		BTSS 	STATUS,2 		//0053 	1D03
		LJUMP 	59H 			//0054 	3859

		//;timercar.C: 232: PA1=1;
		BSR 	5H,1 			//0055 	1885

		//;timercar.C: 233: DelayMs(250);
		LDWI 	FAH 			//0056 	2AFA
		LCALL 	D0H 			//0057 	30D0

		//;timercar.C: 235: PA1=0;
		BCR 	5H,1 			//0058 	1085

		//;timercar.C: 236: }
		//;timercar.C: 238: ACC_Lock=1;
		LDWI 	1H 			//0059 	2A01
		STR 	42H 			//005A 	01C2

		//;timercar.C: 241: if(mode==2){
		LDWI 	2H 			//005B 	2A02
		XORWR 	72H,0 			//005C 	0472
		BTSS 	STATUS,2 		//005D 	1D03
		LJUMP 	62H 			//005E 	3862

		//;timercar.C: 242: mode=3;
		LDWI 	3H 			//005F 	2A03
		STR 	72H 			//0060 	01F2

		//;timercar.C: 243: T0IE=1;
		BSR 	INTCON,5 		//0061 	1A8B

		//;timercar.C: 244: }
		//;timercar.C: 248: if( S==7 && Lock==0 && Ghofl_Lock==0){
		LDWI 	7H 			//0062 	2A07
		XORWR 	74H,0 			//0063 	0474
		BTSS 	STATUS,2 		//0064 	1D03
		LJUMP 	7BH 			//0065 	387B
		LDR 	7AH,0 			//0066 	087A
		BTSS 	STATUS,2 		//0067 	1D03
		LJUMP 	7BH 			//0068 	387B
		LDR 	71H,0 			//0069 	0871
		BTSS 	STATUS,2 		//006A 	1D03
		LJUMP 	7BH 			//006B 	387B

		//;timercar.C: 249: PA2=1;
		BSR 	5H,2 			//006C 	1905

		//;timercar.C: 250: DelayMs(250);
		LDWI 	FAH 			//006D 	2AFA
		LCALL 	D0H 			//006E 	30D0

		//;timercar.C: 251: DelayMs(250);
		LDWI 	FAH 			//006F 	2AFA
		LCALL 	D0H 			//0070 	30D0

		//;timercar.C: 252: DelayMs(250);
		LDWI 	FAH 			//0071 	2AFA
		LCALL 	D0H 			//0072 	30D0

		//;timercar.C: 253: DelayMs(250);
		LDWI 	FAH 			//0073 	2AFA
		LCALL 	D0H 			//0074 	30D0

		//;timercar.C: 254: PA2=0;
		BCR 	5H,2 			//0075 	1105

		//;timercar.C: 255: Lock=1;
		LDWI 	1H 			//0076 	2A01
		STR 	7AH 			//0077 	01FA

		//;timercar.C: 256: S++;
		INCR	74H,1 			//0078 	09F4

		//;timercar.C: 258: T0IE=0;
		BCR 	INTCON,5 		//0079 	128B

		//;timercar.C: 259: PA1=0;
		BCR 	5H,1 			//007A 	1085

		//;timercar.C: 260: }
		//;timercar.C: 264: if( M==15 && S==10 && Lock2==0 && mode==4){
		LDWI 	FH 			//007B 	2A0F
		XORWR 	73H,0 			//007C 	0473
		BTSS 	STATUS,2 		//007D 	1D03
		LJUMP 	9AH 			//007E 	389A
		LDWI 	AH 			//007F 	2A0A
		XORWR 	74H,0 			//0080 	0474
		BTSS 	STATUS,2 		//0081 	1D03
		LJUMP 	9AH 			//0082 	389A
		LDR 	79H,0 			//0083 	0879
		BTSS 	STATUS,2 		//0084 	1D03
		LJUMP 	9AH 			//0085 	389A
		LDWI 	4H 			//0086 	2A04
		XORWR 	72H,0 			//0087 	0472
		BTSS 	STATUS,2 		//0088 	1D03
		LJUMP 	9AH 			//0089 	389A

		//;timercar.C: 266: PA2=1;
		BSR 	5H,2 			//008A 	1905

		//;timercar.C: 267: DelayMs(250);
		LDWI 	FAH 			//008B 	2AFA
		LCALL 	D0H 			//008C 	30D0

		//;timercar.C: 268: DelayMs(250);
		LDWI 	FAH 			//008D 	2AFA
		LCALL 	D0H 			//008E 	30D0

		//;timercar.C: 269: DelayMs(250);
		LDWI 	FAH 			//008F 	2AFA
		LCALL 	D0H 			//0090 	30D0

		//;timercar.C: 270: DelayMs(250);
		LDWI 	FAH 			//0091 	2AFA
		LCALL 	D0H 			//0092 	30D0

		//;timercar.C: 271: PA2=0;
		BCR 	5H,2 			//0093 	1105

		//;timercar.C: 272: Lock2=1;
		LDWI 	1H 			//0094 	2A01
		STR 	79H 			//0095 	01F9

		//;timercar.C: 273: S=0;
		CLRR 	74H 			//0096 	0174

		//;timercar.C: 274: M=0;
		CLRR 	73H 			//0097 	0173

		//;timercar.C: 276: T0IE=0;
		BCR 	INTCON,5 		//0098 	128B

		//;timercar.C: 277: PA1=0;
		BCR 	5H,1 			//0099 	1085

		//;timercar.C: 278: }
		//;timercar.C: 280: }
		//;timercar.C: 285: if(PA4==1 ){
		BTSS 	5H,4 			//009A 	1E05
		LJUMP 	1EH 			//009B 	381E

		//;timercar.C: 287: T0IE=0;
		BCR 	INTCON,5 		//009C 	128B

		//;timercar.C: 288: S=0;
		CLRR 	74H 			//009D 	0174

		//;timercar.C: 289: M=0;
		CLRR 	73H 			//009E 	0173

		//;timercar.C: 291: PA2=0;
		BCR 	5H,2 			//009F 	1105

		//;timercar.C: 293: PA1=0;
		BCR 	5H,1 			//00A0 	1085

		//;timercar.C: 294: Lock=0;
		CLRR 	7AH 			//00A1 	017A

		//;timercar.C: 295: Lock2=0;
		CLRR 	79H 			//00A2 	0179

		//;timercar.C: 297: Door_Lock=0;
		CLRR 	43H 			//00A3 	0143

		//;timercar.C: 298: Ghofl_Lock=0;
		CLRR 	71H 			//00A4 	0171

		//;timercar.C: 299: Lamp_Lock=0;
		CLRR 	70H 			//00A5 	0170

		//;timercar.C: 300: ACC_Lock=0;
		CLRR 	42H 			//00A6 	0142

		//;timercar.C: 302: mode=0;
		CLRR 	72H 			//00A7 	0172
		LJUMP 	1EH 			//00A8 	381E

		//;timercar.C: 40: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//00A9 	168B
		BTSS 	INTCON,2 		//00AA 	1D0B
		LJUMP 	C9H 			//00AB 	38C9

		//;timercar.C: 41: {
		//;timercar.C: 42: TMR0 = 239;
		LDWI 	EFH 			//00AC 	2AEF
		BCR 	STATUS,5 		//00AD 	1283
		STR 	1H 			//00AE 	0181

		//;timercar.C: 43: T0IF = 0;
		BCR 	INTCON,2 		//00AF 	110B

		//;timercar.C: 45: Puls_Count++;
		INCR	40H,1 			//00B0 	09C0
		BTSC 	STATUS,2 		//00B1 	1503
		INCR	41H,1 			//00B2 	09C1

		//;timercar.C: 47: if(Puls_Count>=2000){
		LDWI 	7H 			//00B3 	2A07
		SUBWR 	41H,0 			//00B4 	0C41
		LDWI 	D0H 			//00B5 	2AD0
		BTSC 	STATUS,2 		//00B6 	1503
		SUBWR 	40H,0 			//00B7 	0C40
		BTSS 	STATUS,0 		//00B8 	1C03
		LJUMP 	BFH 			//00B9 	38BF

		//;timercar.C: 48: Puls_Count=0;
		CLRR 	40H 			//00BA 	0140
		CLRR 	41H 			//00BB 	0141

		//;timercar.C: 49: PA1 = ~PA1;
		LDWI 	2H 			//00BC 	2A02
		XORWR 	5H,1 			//00BD 	0485

		//;timercar.C: 50: S++;
		INCR	74H,1 			//00BE 	09F4

		//;timercar.C: 52: }
		//;timercar.C: 54: if(S>=60)S=0,M++;
		LDWI 	3CH 			//00BF 	2A3C
		SUBWR 	74H,0 			//00C0 	0C74
		BTSS 	STATUS,0 		//00C1 	1C03
		LJUMP 	C5H 			//00C2 	38C5
		CLRR 	74H 			//00C3 	0174
		INCR	73H,1 			//00C4 	09F3

		//;timercar.C: 55: if(M>=60)M=0;
		LDWI 	3CH 			//00C5 	2A3C
		SUBWR 	73H,0 			//00C6 	0C73
		BTSC 	STATUS,0 		//00C7 	1403
		CLRR 	73H 			//00C8 	0173
		LDR 	76H,0 			//00C9 	0876
		STR 	PCLATH 			//00CA 	018A
		SWAPR 	75H,0 			//00CB 	0775
		STR 	STATUS 			//00CC 	0183
		SWAPR 	7EH,1 			//00CD 	07FE
		SWAPR 	7EH,0 			//00CE 	077E
		RETI		 			//00CF 	0009
		STR 	45H 			//00D0 	01C5

		//;timercar.C: 76: unsigned char a,b;
		//;timercar.C: 77: for(a=0;a<Time;a++)
		CLRR 	46H 			//00D1 	0146
		LDR 	45H,0 			//00D2 	0845
		SUBWR 	46H,0 			//00D3 	0C46
		BTSC 	STATUS,0 		//00D4 	1403
		RET		 					//00D5 	0004

		//;timercar.C: 78: {
		//;timercar.C: 79: for(b=0;b<5;b++)
		CLRR 	47H 			//00D6 	0147

		//;timercar.C: 80: {
		//;timercar.C: 81: DelayUs(98);
		LDWI 	62H 			//00D7 	2A62
		LCALL 	F9H 			//00D8 	30F9
		LDWI 	5H 			//00D9 	2A05
		BCR 	STATUS,5 		//00DA 	1283
		INCR	47H,1 			//00DB 	09C7
		SUBWR 	47H,0 			//00DC 	0C47
		BTSS 	STATUS,0 		//00DD 	1C03
		LJUMP 	D7H 			//00DE 	38D7
		INCR	46H,1 			//00DF 	09C6
		LJUMP 	D2H 			//00E0 	38D2

		//;timercar.C: 102: OSCCON = 0B01110001;
		LDWI 	71H 			//00E1 	2A71
		BSR 	STATUS,5 		//00E2 	1A83
		STR 	FH 			//00E3 	018F

		//;timercar.C: 104: INTCON = 0;
		CLRR 	INTCON 			//00E4 	010B

		//;timercar.C: 105: OPTION = 0B00001000;
		LDWI 	8H 			//00E5 	2A08
		STR 	1H 			//00E6 	0181

		//;timercar.C: 107: PORTA = 0B00111001;
		LDWI 	39H 			//00E7 	2A39
		BCR 	STATUS,5 		//00E8 	1283
		STR 	5H 			//00E9 	0185

		//;timercar.C: 108: TRISA = 0B00111001;
		BSR 	STATUS,5 		//00EA 	1A83
		STR 	5H 			//00EB 	0185

		//;timercar.C: 110: WPUA = 0B00111001;
		STR 	15H 			//00EC 	0195

		//;timercar.C: 112: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//00ED 	1283
		CLRR 	1BH 			//00EE 	011B
		RET		 					//00EF 	0004

		//;timercar.C: 118: OPTION = 0B00000110;
		LDWI 	6H 			//00F0 	2A06
		BSR 	STATUS,5 		//00F1 	1A83
		STR 	1H 			//00F2 	0181

		//;timercar.C: 120: TMR0 = 239;
		LDWI 	EFH 			//00F3 	2AEF
		BCR 	STATUS,5 		//00F4 	1283
		STR 	1H 			//00F5 	0181

		//;timercar.C: 121: T0IF = 0;
		BCR 	INTCON,2 		//00F6 	110B

		//;timercar.C: 122: T0IE = 1;
		BSR 	INTCON,5 		//00F7 	1A8B
		RET		 					//00F8 	0004
		STR 	77H 			//00F9 	01F7

		//;timercar.C: 66: unsigned char a;
		//;timercar.C: 67: for(a=0;a<Time;a++)
		CLRR 	78H 			//00FA 	0178
		LDR 	77H,0 			//00FB 	0877
		SUBWR 	78H,0 			//00FC 	0C78
		BTSC 	STATUS,0 		//00FD 	1403
		RET		 					//00FE 	0004

		//;timercar.C: 68: {
		//;timercar.C: 69: __nop();
		NOP		 					//00FF 	0000
		INCR	78H,1 			//0100 	09F8
		LJUMP 	FBH 			//0101 	38FB
			END
