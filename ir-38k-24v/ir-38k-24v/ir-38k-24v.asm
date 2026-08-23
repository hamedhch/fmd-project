//Deviec:FT60E01X
//-----------------------Variable---------------------------------
		_PA1		EQU		05H
		_PA2		EQU		05H
		_PA3		EQU		05H
		_PA4		EQU		05H
		_T0IF		EQU		0BH
		_T0IE		EQU		0BH
		_GIE		EQU		0BH
		_Puls_Count		EQU		74H
		_Puls_off		EQU		72H
		_Puls_IR		EQU		70H
		_Lock		EQU		43H
//		DelayMs@Time		EQU		40H
//		DelayMs@b		EQU		42H
//		DelayMs@a		EQU		41H
//		DelayMs@Time		EQU		40H
//		DelayMs@Time		EQU		40H
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
		LJUMP 	73H 			//0009 	3873
		LJUMP 	0BH 			//000A 	380B
		CLRR 	70H 			//000B 	0170
		CLRR 	71H 			//000C 	0171
		CLRR 	72H 			//000D 	0172
		CLRR 	73H 			//000E 	0173
		CLRR 	74H 			//000F 	0174
		CLRR 	75H 			//0010 	0175
		BCR 	STATUS,5 		//0011 	1283
		CLRR 	43H 			//0012 	0143
		CLRR 	44H 			//0013 	0144
		CLRR 	STATUS 			//0014 	0103
		LJUMP 	16H 			//0015 	3816

		//;ir-38k-24v.C: 149: POWER_INITIAL();
		LCALL 	A1H 			//0016 	30A1

		//;ir-38k-24v.C: 150: TIMER0_INITIAL();
		LCALL 	B8H 			//0017 	30B8

		//;ir-38k-24v.C: 154: GIE = 1;
		BSR 	INTCON,7 		//0018 	1B8B

		//;ir-38k-24v.C: 156: T0IE = 1;
		BSR 	INTCON,5 		//0019 	1A8B

		//;ir-38k-24v.C: 162: {
		//;ir-38k-24v.C: 164: if(Puls_IR>=40){
		LDWI 	0H 			//001A 	2A00
		SUBWR 	71H,0 			//001B 	0C71
		LDWI 	28H 			//001C 	2A28
		BTSC 	STATUS,2 		//001D 	1503
		SUBWR 	70H,0 			//001E 	0C70
		BTSS 	STATUS,0 		//001F 	1C03
		LJUMP 	1AH 			//0020 	381A

		//;ir-38k-24v.C: 169: if(PA3==0){
		BTSC 	5H,3 			//0021 	1585
		LJUMP 	29H 			//0022 	3829

		//;ir-38k-24v.C: 170: Puls_Count++;
		INCR	74H,1 			//0023 	09F4
		BTSC 	STATUS,2 		//0024 	1503
		INCR	75H,1 			//0025 	09F5

		//;ir-38k-24v.C: 171: Puls_off=0;
		CLRR 	72H 			//0026 	0172
		CLRR 	73H 			//0027 	0173

		//;ir-38k-24v.C: 172: }else
		LJUMP 	2EH 			//0028 	382E

		//;ir-38k-24v.C: 173: {
		//;ir-38k-24v.C: 174: Puls_off++;
		INCR	72H,1 			//0029 	09F2
		BTSC 	STATUS,2 		//002A 	1503
		INCR	73H,1 			//002B 	09F3

		//;ir-38k-24v.C: 175: Puls_Count=0;
		CLRR 	74H 			//002C 	0174
		CLRR 	75H 			//002D 	0175

		//;ir-38k-24v.C: 176: }
		//;ir-38k-24v.C: 178: DelayUs(400);
		LDWI 	90H 			//002E 	2A90
		LCALL 	AFH 			//002F 	30AF

		//;ir-38k-24v.C: 180: if(PA3!=0){
		BCR 	STATUS,5 		//0030 	1283
		BTSS 	5H,3 			//0031 	1D85
		LJUMP 	3AH 			//0032 	383A

		//;ir-38k-24v.C: 181: Puls_Count++;
		INCR	74H,1 			//0033 	09F4
		BTSC 	STATUS,2 		//0034 	1503
		INCR	75H,1 			//0035 	09F5

		//;ir-38k-24v.C: 182: Puls_off++;
		INCR	72H,1 			//0036 	09F2
		BTSC 	STATUS,2 		//0037 	1503
		INCR	73H,1 			//0038 	09F3

		//;ir-38k-24v.C: 183: }else
		LJUMP 	3EH 			//0039 	383E

		//;ir-38k-24v.C: 184: {
		//;ir-38k-24v.C: 185: Puls_off=0;
		CLRR 	72H 			//003A 	0172
		CLRR 	73H 			//003B 	0173

		//;ir-38k-24v.C: 186: Puls_Count=0;
		CLRR 	74H 			//003C 	0174
		CLRR 	75H 			//003D 	0175

		//;ir-38k-24v.C: 187: }
		//;ir-38k-24v.C: 189: DelayUs(400);
		LDWI 	90H 			//003E 	2A90
		LCALL 	AFH 			//003F 	30AF

		//;ir-38k-24v.C: 193: if(Puls_Count>30 && Lock==0){
		LDWI 	0H 			//0040 	2A00
		SUBWR 	75H,0 			//0041 	0C75
		LDWI 	1FH 			//0042 	2A1F
		BTSC 	STATUS,2 		//0043 	1503
		SUBWR 	74H,0 			//0044 	0C74
		BTSS 	STATUS,0 		//0045 	1C03
		LJUMP 	61H 			//0046 	3861
		BCR 	STATUS,5 		//0047 	1283
		LDR 	43H,0 			//0048 	0843
		IORWR 	44H,0 			//0049 	0344
		BTSS 	STATUS,2 		//004A 	1D03
		LJUMP 	61H 			//004B 	3861

		//;ir-38k-24v.C: 197: Lock=1;
		CLRR 	43H 			//004C 	0143
		INCR	43H,1 			//004D 	09C3
		CLRR 	44H 			//004E 	0144

		//;ir-38k-24v.C: 199: PA4 =0;
		BCR 	5H,4 			//004F 	1205

		//;ir-38k-24v.C: 201: PA2=1;
		BSR 	5H,2 			//0050 	1905

		//;ir-38k-24v.C: 202: DelayMs(500);
		LDWI 	F4H 			//0051 	2AF4
		LCALL 	90H 			//0052 	3090

		//;ir-38k-24v.C: 203: PA2=0;
		BCR 	5H,2 			//0053 	1105

		//;ir-38k-24v.C: 204: DelayMs(200);
		LDWI 	C8H 			//0054 	2AC8
		LCALL 	90H 			//0055 	3090

		//;ir-38k-24v.C: 205: PA2=1;
		BSR 	5H,2 			//0056 	1905

		//;ir-38k-24v.C: 206: DelayMs(500);
		LDWI 	F4H 			//0057 	2AF4
		LCALL 	90H 			//0058 	3090

		//;ir-38k-24v.C: 207: PA2=0;
		BCR 	5H,2 			//0059 	1105

		//;ir-38k-24v.C: 210: DelayMs(4000);
		LDWI 	A0H 			//005A 	2AA0
		LCALL 	90H 			//005B 	3090

		//;ir-38k-24v.C: 211: DelayMs(4000);
		LDWI 	A0H 			//005C 	2AA0
		LCALL 	90H 			//005D 	3090

		//;ir-38k-24v.C: 212: DelayMs(4000);
		LDWI 	A0H 			//005E 	2AA0
		LCALL 	90H 			//005F 	3090

		//;ir-38k-24v.C: 214: PA4 =1;
		BSR 	5H,4 			//0060 	1A05

		//;ir-38k-24v.C: 216: }
		//;ir-38k-24v.C: 217: if(Puls_off>500 )
		LDWI 	1H 			//0061 	2A01
		SUBWR 	73H,0 			//0062 	0C73
		LDWI 	F5H 			//0063 	2AF5
		BTSC 	STATUS,2 		//0064 	1503
		SUBWR 	72H,0 			//0065 	0C72
		BTSS 	STATUS,0 		//0066 	1C03
		LJUMP 	6BH 			//0067 	386B

		//;ir-38k-24v.C: 218: {
		//;ir-38k-24v.C: 219: Lock=0;
		BCR 	STATUS,5 		//0068 	1283
		CLRR 	43H 			//0069 	0143
		CLRR 	44H 			//006A 	0144

		//;ir-38k-24v.C: 220: }
		//;ir-38k-24v.C: 226: TMR0 = 239;
		LDWI 	EFH 			//006B 	2AEF
		BCR 	STATUS,5 		//006C 	1283
		STR 	1H 			//006D 	0181

		//;ir-38k-24v.C: 227: T0IF = 0;
		BCR 	INTCON,2 		//006E 	110B

		//;ir-38k-24v.C: 228: T0IE=1;
		BSR 	INTCON,5 		//006F 	1A8B

		//;ir-38k-24v.C: 229: Puls_IR=0;
		CLRR 	70H 			//0070 	0170
		CLRR 	71H 			//0071 	0171
		LJUMP 	1AH 			//0072 	381A

		//;ir-38k-24v.C: 37: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//0073 	168B
		BTSS 	INTCON,2 		//0074 	1D0B
		LJUMP 	89H 			//0075 	3889

		//;ir-38k-24v.C: 38: {
		//;ir-38k-24v.C: 39: TMR0 = 239;
		LDWI 	EFH 			//0076 	2AEF
		BCR 	STATUS,5 		//0077 	1283
		STR 	1H 			//0078 	0181

		//;ir-38k-24v.C: 40: T0IF = 0;
		BCR 	INTCON,2 		//0079 	110B

		//;ir-38k-24v.C: 42: Puls_IR++;
		INCR	70H,1 			//007A 	09F0
		BTSC 	STATUS,2 		//007B 	1503
		INCR	71H,1 			//007C 	09F1

		//;ir-38k-24v.C: 46: PA1 = ~PA1;
		LDWI 	2H 			//007D 	2A02
		XORWR 	5H,1 			//007E 	0485

		//;ir-38k-24v.C: 48: if(Puls_IR>=40){
		LDWI 	0H 			//007F 	2A00
		SUBWR 	71H,0 			//0080 	0C71
		LDWI 	28H 			//0081 	2A28
		BTSC 	STATUS,2 		//0082 	1503
		SUBWR 	70H,0 			//0083 	0C70
		BTSS 	STATUS,0 		//0084 	1C03
		LJUMP 	89H 			//0085 	3889

		//;ir-38k-24v.C: 49: TMR0 = 0;
		CLRR 	1H 			//0086 	0101

		//;ir-38k-24v.C: 50: T0IE=0;
		BCR 	INTCON,5 		//0087 	128B

		//;ir-38k-24v.C: 51: PA1 = 0;
		BCR 	5H,1 			//0088 	1085
		LDR 	77H,0 			//0089 	0877
		STR 	PCLATH 			//008A 	018A
		SWAPR 	76H,0 			//008B 	0776
		STR 	STATUS 			//008C 	0183
		SWAPR 	7EH,1 			//008D 	07FE
		SWAPR 	7EH,0 			//008E 	077E
		RETI		 			//008F 	0009
		STR 	40H 			//0090 	01C0

		//;ir-38k-24v.C: 77: unsigned char a,b;
		//;ir-38k-24v.C: 78: for(a=0;a<Time;a++)
		CLRR 	41H 			//0091 	0141
		LDR 	40H,0 			//0092 	0840
		SUBWR 	41H,0 			//0093 	0C41
		BTSC 	STATUS,0 		//0094 	1403
		RET		 					//0095 	0004

		//;ir-38k-24v.C: 79: {
		//;ir-38k-24v.C: 80: for(b=0;b<5;b++)
		CLRR 	42H 			//0096 	0142

		//;ir-38k-24v.C: 81: {
		//;ir-38k-24v.C: 82: DelayUs(98);
		LDWI 	62H 			//0097 	2A62
		LCALL 	AFH 			//0098 	30AF
		LDWI 	5H 			//0099 	2A05
		BCR 	STATUS,5 		//009A 	1283
		INCR	42H,1 			//009B 	09C2
		SUBWR 	42H,0 			//009C 	0C42
		BTSS 	STATUS,0 		//009D 	1C03
		LJUMP 	97H 			//009E 	3897
		INCR	41H,1 			//009F 	09C1
		LJUMP 	92H 			//00A0 	3892

		//;ir-38k-24v.C: 103: OSCCON = 0B01110001;
		LDWI 	71H 			//00A1 	2A71
		BSR 	STATUS,5 		//00A2 	1A83
		STR 	FH 			//00A3 	018F

		//;ir-38k-24v.C: 105: INTCON = 0;
		CLRR 	INTCON 			//00A4 	010B

		//;ir-38k-24v.C: 106: OPTION = 0B00001000;
		LDWI 	8H 			//00A5 	2A08
		STR 	1H 			//00A6 	0181

		//;ir-38k-24v.C: 108: PORTA = 0B00000000;
		BCR 	STATUS,5 		//00A7 	1283
		CLRR 	5H 			//00A8 	0105

		//;ir-38k-24v.C: 109: TRISA = 0B00001000;
		BSR 	STATUS,5 		//00A9 	1A83
		STR 	5H 			//00AA 	0185

		//;ir-38k-24v.C: 111: WPUA = 0B00000000;
		CLRR 	15H 			//00AB 	0115

		//;ir-38k-24v.C: 113: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//00AC 	1283
		CLRR 	1BH 			//00AD 	011B
		RET		 					//00AE 	0004
		STR 	78H 			//00AF 	01F8

		//;ir-38k-24v.C: 67: unsigned char a;
		//;ir-38k-24v.C: 68: for(a=0;a<Time;a++)
		CLRR 	79H 			//00B0 	0179
		LDR 	78H,0 			//00B1 	0878
		SUBWR 	79H,0 			//00B2 	0C79
		BTSC 	STATUS,0 		//00B3 	1403
		RET		 					//00B4 	0004

		//;ir-38k-24v.C: 69: {
		//;ir-38k-24v.C: 70: __nop();
		NOP		 					//00B5 	0000
		INCR	79H,1 			//00B6 	09F9
		LJUMP 	B1H 			//00B7 	38B1

		//;ir-38k-24v.C: 119: OPTION = 0B00000000;
		BSR 	STATUS,5 		//00B8 	1A83
		CLRR 	1H 			//00B9 	0101

		//;ir-38k-24v.C: 121: TMR0 = 239;
		LDWI 	EFH 			//00BA 	2AEF
		BCR 	STATUS,5 		//00BB 	1283
		STR 	1H 			//00BC 	0181

		//;ir-38k-24v.C: 122: T0IF = 0;
		BCR 	INTCON,2 		//00BD 	110B
		RET		 					//00BE 	0004
			END
