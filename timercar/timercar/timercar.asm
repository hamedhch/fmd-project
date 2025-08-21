//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_S		EQU		73H
		_M		EQU		72H
		_H		EQU		71H
		_mode		EQU		70H
		_Lock		EQU		79H
		_Lock2		EQU		78H
		_Puls_Count		EQU		43H
//		DelayMs@Time		EQU		40H
//		DelayMs@b		EQU		42H
//		DelayMs@a		EQU		41H
//		DelayMs@Time		EQU		40H
//		DelayMs@Time		EQU		40H
//		DelayUs@Time		EQU		76H
//		DelayUs@a		EQU		77H
//		DelayUs@Time		EQU		76H
//		DelayUs@Time		EQU		76H
//-----------------------Variable END---------------------------------

		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	74H 			//0006 	01F4
		LDR 	PCLATH,0 		//0007 	080A
		STR 	75H 			//0008 	01F5
		LJUMP 	70H 			//0009 	3870
		LJUMP 	0BH 			//000A 	380B
		LDWI 	1H 			//000B 	2A01
		STR 	78H 			//000C 	01F8
		STR 	79H 			//000D 	01F9
		CLRR 	43H 			//000E 	0143
		CLRR 	44H 			//000F 	0144
		CLRR 	70H 			//0010 	0170
		CLRR 	71H 			//0011 	0171
		CLRR 	72H 			//0012 	0172
		CLRR 	73H 			//0013 	0173
		CLRR 	STATUS 			//0014 	0103
		LJUMP 	16H 			//0015 	3816

		//;timercar.C: 128: POWER_INITIAL();
		LCALL 	A8H 			//0016 	30A8

		//;timercar.C: 129: TIMER0_INITIAL();
		LCALL 	B8H 			//0017 	30B8

		//;timercar.C: 132: GIE = 1;
		BSR 	INTCON,7 		//0018 	1B8B

		//;timercar.C: 134: T0IE = 0;
		BCR 	INTCON,5 		//0019 	128B

		//;timercar.C: 139: {
		//;timercar.C: 142: if(PA0==0){
		BTSC 	5H,0 			//001A 	1405
		LJUMP 	31H 			//001B 	3831

		//;timercar.C: 143: PA1=0;
		BCR 	5H,1 			//001C 	1085

		//;timercar.C: 144: DelayMs(300);
		LDWI 	2CH 			//001D 	2A2C
		LCALL 	97H 			//001E 	3097

		//;timercar.C: 145: PA1=1;
		BSR 	5H,1 			//001F 	1885

		//;timercar.C: 146: DelayMs(300);
		LDWI 	2CH 			//0020 	2A2C
		LCALL 	97H 			//0021 	3097

		//;timercar.C: 147: PA1=0;
		BCR 	5H,1 			//0022 	1085

		//;timercar.C: 148: DelayMs(300);
		LDWI 	2CH 			//0023 	2A2C
		LCALL 	97H 			//0024 	3097

		//;timercar.C: 149: PA1=1;
		BSR 	5H,1 			//0025 	1885

		//;timercar.C: 150: DelayMs(300);
		LDWI 	2CH 			//0026 	2A2C
		LCALL 	97H 			//0027 	3097

		//;timercar.C: 151: PA1=0;
		BCR 	5H,1 			//0028 	1085

		//;timercar.C: 152: DelayMs(300);
		LDWI 	2CH 			//0029 	2A2C
		LCALL 	97H 			//002A 	3097

		//;timercar.C: 153: PA1=1;
		BSR 	5H,1 			//002B 	1885

		//;timercar.C: 154: DelayMs(300);
		LDWI 	2CH 			//002C 	2A2C
		LCALL 	97H 			//002D 	3097

		//;timercar.C: 155: PA1=0;
		BCR 	5H,1 			//002E 	1085

		//;timercar.C: 158: mode=1;
		LDWI 	1H 			//002F 	2A01
		STR 	70H 			//0030 	01F0

		//;timercar.C: 159: }
		//;timercar.C: 161: if(PA4==0){
		BTSC 	5H,4 			//0031 	1605
		LJUMP 	65H 			//0032 	3865

		//;timercar.C: 163: T0IE=1;
		BSR 	INTCON,5 		//0033 	1A8B

		//;timercar.C: 165: if( S==11 && Lock==0 ){
		LDWI 	BH 			//0034 	2A0B
		XORWR 	73H,0 			//0035 	0473
		BTSS 	STATUS,2 		//0036 	1D03
		LJUMP 	3CH 			//0037 	383C
		LDR 	79H,0 			//0038 	0879
		BTSS 	STATUS,2 		//0039 	1D03
		LJUMP 	3CH 			//003A 	383C

		//;timercar.C: 166: PA2=1;
		BSR 	5H,2 			//003B 	1905

		//;timercar.C: 168: }
		//;timercar.C: 169: if( S==12 && Lock==0 ){
		LDWI 	CH 			//003C 	2A0C
		XORWR 	73H,0 			//003D 	0473
		BTSS 	STATUS,2 		//003E 	1D03
		LJUMP 	46H 			//003F 	3846
		LDR 	79H,0 			//0040 	0879
		BTSS 	STATUS,2 		//0041 	1D03
		LJUMP 	46H 			//0042 	3846

		//;timercar.C: 171: PA2=0;
		BCR 	5H,2 			//0043 	1105

		//;timercar.C: 173: Lock=1;
		LDWI 	1H 			//0044 	2A01
		STR 	79H 			//0045 	01F9

		//;timercar.C: 174: }
		//;timercar.C: 177: if( M==20 && S==10 && Lock2==0 && mode==1){
		LDWI 	14H 			//0046 	2A14
		XORWR 	72H,0 			//0047 	0472
		BTSS 	STATUS,2 		//0048 	1D03
		LJUMP 	54H 			//0049 	3854
		LDWI 	AH 			//004A 	2A0A
		XORWR 	73H,0 			//004B 	0473
		BTSS 	STATUS,2 		//004C 	1D03
		LJUMP 	54H 			//004D 	3854
		LDR 	78H,0 			//004E 	0878
		BTSS 	STATUS,2 		//004F 	1D03
		LJUMP 	54H 			//0050 	3854
		DECRSZ 	70H,0 		//0051 	0E70
		LJUMP 	54H 			//0052 	3854

		//;timercar.C: 179: PA2=1;
		BSR 	5H,2 			//0053 	1905

		//;timercar.C: 181: }
		//;timercar.C: 182: if( M==20 && S==11 && Lock2==0 && mode==1 ){
		LDWI 	14H 			//0054 	2A14
		XORWR 	72H,0 			//0055 	0472
		BTSS 	STATUS,2 		//0056 	1D03
		LJUMP 	65H 			//0057 	3865
		LDWI 	BH 			//0058 	2A0B
		XORWR 	73H,0 			//0059 	0473
		BTSS 	STATUS,2 		//005A 	1D03
		LJUMP 	65H 			//005B 	3865
		LDR 	78H,0 			//005C 	0878
		BTSS 	STATUS,2 		//005D 	1D03
		LJUMP 	65H 			//005E 	3865
		DECR 	70H,0 			//005F 	0D70
		BTSS 	STATUS,2 		//0060 	1D03
		LJUMP 	65H 			//0061 	3865

		//;timercar.C: 184: PA2=0;
		BCR 	5H,2 			//0062 	1105

		//;timercar.C: 186: Lock2=1;
		LDWI 	1H 			//0063 	2A01
		STR 	78H 			//0064 	01F8

		//;timercar.C: 187: }
		//;timercar.C: 197: }
		//;timercar.C: 198: if(PA4==1 ){
		BTSS 	5H,4 			//0065 	1E05
		LJUMP 	1AH 			//0066 	381A

		//;timercar.C: 200: T0IE=0;
		BCR 	INTCON,5 		//0067 	128B

		//;timercar.C: 201: S=0;
		CLRR 	73H 			//0068 	0173

		//;timercar.C: 202: M=0;
		CLRR 	72H 			//0069 	0172

		//;timercar.C: 204: PA2=0;
		BCR 	5H,2 			//006A 	1105

		//;timercar.C: 206: PA1=0;
		BCR 	5H,1 			//006B 	1085

		//;timercar.C: 207: Lock=0;
		CLRR 	79H 			//006C 	0179

		//;timercar.C: 208: Lock2=0;
		CLRR 	78H 			//006D 	0178

		//;timercar.C: 209: mode=0;
		CLRR 	70H 			//006E 	0170
		LJUMP 	1AH 			//006F 	381A

		//;timercar.C: 38: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//0070 	168B
		BTSS 	INTCON,2 		//0071 	1D0B
		LJUMP 	90H 			//0072 	3890

		//;timercar.C: 39: {
		//;timercar.C: 40: TMR0 = 239;
		LDWI 	EFH 			//0073 	2AEF
		BCR 	STATUS,5 		//0074 	1283
		STR 	1H 			//0075 	0181

		//;timercar.C: 41: T0IF = 0;
		BCR 	INTCON,2 		//0076 	110B

		//;timercar.C: 43: Puls_Count++;
		INCR	43H,1 			//0077 	09C3
		BTSC 	STATUS,2 		//0078 	1503
		INCR	44H,1 			//0079 	09C4

		//;timercar.C: 45: if(Puls_Count>=2000){
		LDWI 	7H 			//007A 	2A07
		SUBWR 	44H,0 			//007B 	0C44
		LDWI 	D0H 			//007C 	2AD0
		BTSC 	STATUS,2 		//007D 	1503
		SUBWR 	43H,0 			//007E 	0C43
		BTSS 	STATUS,0 		//007F 	1C03
		LJUMP 	86H 			//0080 	3886

		//;timercar.C: 46: Puls_Count=0;
		CLRR 	43H 			//0081 	0143
		CLRR 	44H 			//0082 	0144

		//;timercar.C: 47: PA1 = ~PA1;
		LDWI 	2H 			//0083 	2A02
		XORWR 	5H,1 			//0084 	0485

		//;timercar.C: 48: S++;
		INCR	73H,1 			//0085 	09F3

		//;timercar.C: 50: }
		//;timercar.C: 52: if(S>=60)S=0,M++;
		LDWI 	3CH 			//0086 	2A3C
		SUBWR 	73H,0 			//0087 	0C73
		BTSS 	STATUS,0 		//0088 	1C03
		LJUMP 	8CH 			//0089 	388C
		CLRR 	73H 			//008A 	0173
		INCR	72H,1 			//008B 	09F2

		//;timercar.C: 53: if(M>=60)M=0;
		LDWI 	3CH 			//008C 	2A3C
		SUBWR 	72H,0 			//008D 	0C72
		BTSC 	STATUS,0 		//008E 	1403
		CLRR 	72H 			//008F 	0172
		LDR 	75H,0 			//0090 	0875
		STR 	PCLATH 			//0091 	018A
		SWAPR 	74H,0 			//0092 	0774
		STR 	STATUS 			//0093 	0183
		SWAPR 	7EH,1 			//0094 	07FE
		SWAPR 	7EH,0 			//0095 	077E
		RETI		 			//0096 	0009
		STR 	40H 			//0097 	01C0

		//;timercar.C: 74: unsigned char a,b;
		//;timercar.C: 75: for(a=0;a<Time;a++)
		CLRR 	41H 			//0098 	0141
		LDR 	40H,0 			//0099 	0840
		SUBWR 	41H,0 			//009A 	0C41
		BTSC 	STATUS,0 		//009B 	1403
		RET		 					//009C 	0004

		//;timercar.C: 76: {
		//;timercar.C: 77: for(b=0;b<5;b++)
		CLRR 	42H 			//009D 	0142

		//;timercar.C: 78: {
		//;timercar.C: 79: DelayUs(98);
		LDWI 	62H 			//009E 	2A62
		LCALL 	C1H 			//009F 	30C1
		LDWI 	5H 			//00A0 	2A05
		BCR 	STATUS,5 		//00A1 	1283
		INCR	42H,1 			//00A2 	09C2
		SUBWR 	42H,0 			//00A3 	0C42
		BTSS 	STATUS,0 		//00A4 	1C03
		LJUMP 	9EH 			//00A5 	389E
		INCR	41H,1 			//00A6 	09C1
		LJUMP 	99H 			//00A7 	3899

		//;timercar.C: 100: OSCCON = 0B01110001;
		LDWI 	71H 			//00A8 	2A71
		BSR 	STATUS,5 		//00A9 	1A83
		STR 	FH 			//00AA 	018F

		//;timercar.C: 102: INTCON = 0;
		CLRR 	INTCON 			//00AB 	010B

		//;timercar.C: 103: OPTION = 0B00001000;
		LDWI 	8H 			//00AC 	2A08
		STR 	1H 			//00AD 	0181

		//;timercar.C: 105: PORTA = 0B00000000;
		BCR 	STATUS,5 		//00AE 	1283
		CLRR 	5H 			//00AF 	0105

		//;timercar.C: 106: TRISA = 0B00011001;
		LDWI 	19H 			//00B0 	2A19
		BSR 	STATUS,5 		//00B1 	1A83
		STR 	5H 			//00B2 	0185

		//;timercar.C: 108: WPUA = 0B00000001;
		LDWI 	1H 			//00B3 	2A01
		STR 	15H 			//00B4 	0195

		//;timercar.C: 110: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//00B5 	1283
		CLRR 	1BH 			//00B6 	011B
		RET		 					//00B7 	0004

		//;timercar.C: 116: OPTION = 0B00000110;
		LDWI 	6H 			//00B8 	2A06
		BSR 	STATUS,5 		//00B9 	1A83
		STR 	1H 			//00BA 	0181

		//;timercar.C: 118: TMR0 = 239;
		LDWI 	EFH 			//00BB 	2AEF
		BCR 	STATUS,5 		//00BC 	1283
		STR 	1H 			//00BD 	0181

		//;timercar.C: 119: T0IF = 0;
		BCR 	INTCON,2 		//00BE 	110B

		//;timercar.C: 120: T0IE = 1;
		BSR 	INTCON,5 		//00BF 	1A8B
		RET		 					//00C0 	0004
		STR 	76H 			//00C1 	01F6

		//;timercar.C: 64: unsigned char a;
		//;timercar.C: 65: for(a=0;a<Time;a++)
		CLRR 	77H 			//00C2 	0177
		LDR 	76H,0 			//00C3 	0876
		SUBWR 	77H,0 			//00C4 	0C77
		BTSC 	STATUS,0 		//00C5 	1403
		RET		 					//00C6 	0004

		//;timercar.C: 66: {
		//;timercar.C: 67: __nop();
		NOP		 					//00C7 	0000
		INCR	77H,1 			//00C8 	09F7
		LJUMP 	C3H 			//00C9 	38C3
			END
