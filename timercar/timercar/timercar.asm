//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_S		EQU		7CH
		_M		EQU		7BH
		_H		EQU		7AH
		_mode		EQU		7DH
		_Lock		EQU		79H
		_Puls_Count		EQU		77H
//		DelayMs@Time		EQU		74H
//		DelayMs@b		EQU		76H
//		DelayMs@a		EQU		75H
//		DelayMs@Time		EQU		74H
//		DelayMs@Time		EQU		74H
//		DelayUs@Time		EQU		72H
//		DelayUs@a		EQU		73H
//		DelayUs@Time		EQU		72H
//		DelayUs@Time		EQU		72H
//-----------------------Variable END---------------------------------

		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	15H 			//0009 	3815
		LJUMP 	0BH 			//000A 	380B
		LDWI 	4H 			//000B 	2A04
		STR 	7DH 			//000C 	01FD
		CLRR 	77H 			//000D 	0177
		CLRR 	78H 			//000E 	0178
		CLRR 	79H 			//000F 	0179
		CLRR 	7AH 			//0010 	017A
		CLRR 	7BH 			//0011 	017B
		CLRR 	7CH 			//0012 	017C
		CLRR 	STATUS 			//0013 	0103
		LJUMP 	3CH 			//0014 	383C

		//;timercar.C: 37: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//0015 	168B
		BTSS 	INTCON,2 		//0016 	1D0B
		LJUMP 	35H 			//0017 	3835

		//;timercar.C: 38: {
		//;timercar.C: 39: TMR0 = 239;
		LDWI 	EFH 			//0018 	2AEF
		BCR 	STATUS,5 		//0019 	1283
		STR 	1H 			//001A 	0181

		//;timercar.C: 40: T0IF = 0;
		BCR 	INTCON,2 		//001B 	110B

		//;timercar.C: 42: Puls_Count++;
		INCR	77H,1 			//001C 	09F7
		BTSC 	STATUS,2 		//001D 	1503
		INCR	78H,1 			//001E 	09F8

		//;timercar.C: 44: if(Puls_Count>=2000){
		LDWI 	7H 			//001F 	2A07
		SUBWR 	78H,0 			//0020 	0C78
		LDWI 	D0H 			//0021 	2AD0
		BTSC 	STATUS,2 		//0022 	1503
		SUBWR 	77H,0 			//0023 	0C77
		BTSS 	STATUS,0 		//0024 	1C03
		LJUMP 	2BH 			//0025 	382B

		//;timercar.C: 45: Puls_Count=0;
		CLRR 	77H 			//0026 	0177
		CLRR 	78H 			//0027 	0178

		//;timercar.C: 46: PA1 = ~PA1;
		LDWI 	2H 			//0028 	2A02
		XORWR 	5H,1 			//0029 	0485

		//;timercar.C: 47: S++;
		INCR	7CH,1 			//002A 	09FC

		//;timercar.C: 49: }
		//;timercar.C: 51: if(S>=60)S=0,M++;
		LDWI 	3CH 			//002B 	2A3C
		SUBWR 	7CH,0 			//002C 	0C7C
		BTSS 	STATUS,0 		//002D 	1C03
		LJUMP 	31H 			//002E 	3831
		CLRR 	7CH 			//002F 	017C
		INCR	7BH,1 			//0030 	09FB

		//;timercar.C: 52: if(M>=60)M=0;
		LDWI 	3CH 			//0031 	2A3C
		SUBWR 	7BH,0 			//0032 	0C7B
		BTSC 	STATUS,0 		//0033 	1403
		CLRR 	7BH 			//0034 	017B
		LDR 	71H,0 			//0035 	0871
		STR 	PCLATH 			//0036 	018A
		SWAPR 	70H,0 			//0037 	0770
		STR 	STATUS 			//0038 	0183
		SWAPR 	7EH,1 			//0039 	07FE
		SWAPR 	7EH,0 			//003A 	077E
		RETI		 			//003B 	0009

		//;timercar.C: 127: POWER_INITIAL();
		LCALL 	6EH 			//003C 	306E

		//;timercar.C: 128: TIMER0_INITIAL();
		LCALL 	7DH 			//003D 	307D

		//;timercar.C: 131: GIE = 1;
		BSR 	INTCON,7 		//003E 	1B8B

		//;timercar.C: 133: T0IE = 0;
		BCR 	INTCON,5 		//003F 	128B

		//;timercar.C: 138: {
		//;timercar.C: 143: if(PA4==0){
		BTSC 	5H,4 			//0040 	1605
		LJUMP 	57H 			//0041 	3857

		//;timercar.C: 145: T0IE=1;
		BSR 	INTCON,5 		//0042 	1A8B

		//;timercar.C: 147: if( S==15 ){
		LDWI 	FH 			//0043 	2A0F
		XORWR 	7CH,0 			//0044 	047C
		BTSS 	STATUS,2 		//0045 	1D03
		LJUMP 	4DH 			//0046 	384D

		//;timercar.C: 148: PA2=1;
		BSR 	5H,2 			//0047 	1905

		//;timercar.C: 149: DelayMs(500);
		LDWI 	F4H 			//0048 	2AF4
		LCALL 	5EH 			//0049 	305E

		//;timercar.C: 150: PA2=0;
		BCR 	STATUS,5 		//004A 	1283
		BCR 	5H,2 			//004B 	1105

		//;timercar.C: 151: S++;
		INCR	7CH,1 			//004C 	09FC

		//;timercar.C: 152: }
		//;timercar.C: 154: if( M==15){
		LDWI 	FH 			//004D 	2A0F
		XORWR 	7BH,0 			//004E 	047B
		BTSS 	STATUS,2 		//004F 	1D03
		LJUMP 	57H 			//0050 	3857

		//;timercar.C: 155: PA2=1;
		BSR 	5H,2 			//0051 	1905

		//;timercar.C: 156: DelayMs(500);
		LDWI 	F4H 			//0052 	2AF4
		LCALL 	5EH 			//0053 	305E

		//;timercar.C: 157: PA2=0;
		BCR 	STATUS,5 		//0054 	1283
		BCR 	5H,2 			//0055 	1105

		//;timercar.C: 158: M++;
		INCR	7BH,1 			//0056 	09FB

		//;timercar.C: 159: }
		//;timercar.C: 162: }
		//;timercar.C: 163: if(PA4==1 ){
		BTSS 	5H,4 			//0057 	1E05
		LJUMP 	40H 			//0058 	3840

		//;timercar.C: 165: T0IE=0;
		BCR 	INTCON,5 		//0059 	128B

		//;timercar.C: 166: S=0;
		CLRR 	7CH 			//005A 	017C

		//;timercar.C: 167: M=0;
		CLRR 	7BH 			//005B 	017B

		//;timercar.C: 169: PA1=0;
		BCR 	5H,1 			//005C 	1085
		LJUMP 	40H 			//005D 	3840
		STR 	74H 			//005E 	01F4

		//;timercar.C: 73: unsigned char a,b;
		//;timercar.C: 74: for(a=0;a<Time;a++)
		CLRR 	75H 			//005F 	0175
		LDR 	74H,0 			//0060 	0874
		SUBWR 	75H,0 			//0061 	0C75
		BTSC 	STATUS,0 		//0062 	1403
		RET		 					//0063 	0004

		//;timercar.C: 75: {
		//;timercar.C: 76: for(b=0;b<5;b++)
		CLRR 	76H 			//0064 	0176

		//;timercar.C: 77: {
		//;timercar.C: 78: DelayUs(98);
		LDWI 	62H 			//0065 	2A62
		LCALL 	86H 			//0066 	3086
		LDWI 	5H 			//0067 	2A05
		INCR	76H,1 			//0068 	09F6
		SUBWR 	76H,0 			//0069 	0C76
		BTSS 	STATUS,0 		//006A 	1C03
		LJUMP 	65H 			//006B 	3865
		INCR	75H,1 			//006C 	09F5
		LJUMP 	60H 			//006D 	3860

		//;timercar.C: 99: OSCCON = 0B01110001;
		LDWI 	71H 			//006E 	2A71
		BSR 	STATUS,5 		//006F 	1A83
		STR 	FH 			//0070 	018F

		//;timercar.C: 101: INTCON = 0;
		CLRR 	INTCON 			//0071 	010B

		//;timercar.C: 102: OPTION = 0B00001000;
		LDWI 	8H 			//0072 	2A08
		STR 	1H 			//0073 	0181

		//;timercar.C: 104: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0074 	1283
		CLRR 	5H 			//0075 	0105

		//;timercar.C: 105: TRISA = 0B00011000;
		LDWI 	18H 			//0076 	2A18
		BSR 	STATUS,5 		//0077 	1A83
		STR 	5H 			//0078 	0185

		//;timercar.C: 107: WPUA = 0B00000000;
		CLRR 	15H 			//0079 	0115

		//;timercar.C: 109: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//007A 	1283
		CLRR 	1BH 			//007B 	011B
		RET		 					//007C 	0004

		//;timercar.C: 115: OPTION = 0B00000110;
		LDWI 	6H 			//007D 	2A06
		BSR 	STATUS,5 		//007E 	1A83
		STR 	1H 			//007F 	0181

		//;timercar.C: 117: TMR0 = 239;
		LDWI 	EFH 			//0080 	2AEF
		BCR 	STATUS,5 		//0081 	1283
		STR 	1H 			//0082 	0181

		//;timercar.C: 118: T0IF = 0;
		BCR 	INTCON,2 		//0083 	110B

		//;timercar.C: 119: T0IE = 1;
		BSR 	INTCON,5 		//0084 	1A8B
		RET		 					//0085 	0004
		STR 	72H 			//0086 	01F2

		//;timercar.C: 63: unsigned char a;
		//;timercar.C: 64: for(a=0;a<Time;a++)
		CLRR 	73H 			//0087 	0173
		LDR 	72H,0 			//0088 	0872
		SUBWR 	73H,0 			//0089 	0C73
		BTSC 	STATUS,0 		//008A 	1403
		RET		 					//008B 	0004

		//;timercar.C: 65: {
		//;timercar.C: 66: __nop();
		NOP		 					//008C 	0000
		INCR	73H,1 			//008D 	09F3
		LJUMP 	88H 			//008E 	3888
			END
