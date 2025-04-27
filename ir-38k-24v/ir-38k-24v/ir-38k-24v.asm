//Deviec:FT60F01X
//-----------------------Variable---------------------------------
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
		LJUMP 	6FH 			//0009 	386F
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
		LCALL 	9DH 			//0016 	309D

		//;ir-38k-24v.C: 150: TIMER0_INITIAL();
		LCALL 	B5H 			//0017 	30B5

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

		//;ir-38k-24v.C: 169: if(PA2==0){
		BTSC 	5H,2 			//0021 	1505
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
		LCALL 	ACH 			//002F 	30AC

		//;ir-38k-24v.C: 180: if(PA2!=0){
		BCR 	STATUS,5 		//0030 	1283
		BTSS 	5H,2 			//0031 	1D05
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
		LCALL 	ACH 			//003F 	30AC

		//;ir-38k-24v.C: 193: if(Puls_Count>30 && Lock==0){
		LDWI 	0H 			//0040 	2A00
		SUBWR 	75H,0 			//0041 	0C75
		LDWI 	1FH 			//0042 	2A1F
		BTSC 	STATUS,2 		//0043 	1503
		SUBWR 	74H,0 			//0044 	0C74
		BTSS 	STATUS,0 		//0045 	1C03
		LJUMP 	5DH 			//0046 	385D
		BCR 	STATUS,5 		//0047 	1283
		LDR 	43H,0 			//0048 	0843
		IORWR 	44H,0 			//0049 	0344
		BTSS 	STATUS,2 		//004A 	1D03
		LJUMP 	5DH 			//004B 	385D

		//;ir-38k-24v.C: 197: Lock=1;
		CLRR 	43H 			//004C 	0143
		INCR	43H,1 			//004D 	09C3
		CLRR 	44H 			//004E 	0144

		//;ir-38k-24v.C: 199: PA1=1;
		BSR 	5H,1 			//004F 	1885

		//;ir-38k-24v.C: 200: DelayMs(500);
		LDWI 	F4H 			//0050 	2AF4
		LCALL 	8CH 			//0051 	308C

		//;ir-38k-24v.C: 201: PA1=0;
		BCR 	5H,1 			//0052 	1085

		//;ir-38k-24v.C: 202: DelayMs(200);
		LDWI 	C8H 			//0053 	2AC8
		LCALL 	8CH 			//0054 	308C

		//;ir-38k-24v.C: 203: PA1=1;
		BSR 	5H,1 			//0055 	1885

		//;ir-38k-24v.C: 204: DelayMs(500);
		LDWI 	F4H 			//0056 	2AF4
		LCALL 	8CH 			//0057 	308C

		//;ir-38k-24v.C: 205: PA1=0;
		BCR 	5H,1 			//0058 	1085

		//;ir-38k-24v.C: 207: PA4 =1;
		BSR 	5H,4 			//0059 	1A05

		//;ir-38k-24v.C: 208: DelayMs(3000);
		LDWI 	B8H 			//005A 	2AB8
		LCALL 	8CH 			//005B 	308C

		//;ir-38k-24v.C: 209: PA4 =0;
		BCR 	5H,4 			//005C 	1205

		//;ir-38k-24v.C: 211: }
		//;ir-38k-24v.C: 212: if(Puls_off>500 )
		LDWI 	1H 			//005D 	2A01
		SUBWR 	73H,0 			//005E 	0C73
		LDWI 	F5H 			//005F 	2AF5
		BTSC 	STATUS,2 		//0060 	1503
		SUBWR 	72H,0 			//0061 	0C72
		BTSS 	STATUS,0 		//0062 	1C03
		LJUMP 	67H 			//0063 	3867

		//;ir-38k-24v.C: 213: {
		//;ir-38k-24v.C: 214: Lock=0;
		BCR 	STATUS,5 		//0064 	1283
		CLRR 	43H 			//0065 	0143
		CLRR 	44H 			//0066 	0144

		//;ir-38k-24v.C: 215: }
		//;ir-38k-24v.C: 221: TMR0 = 239;
		LDWI 	EFH 			//0067 	2AEF
		BCR 	STATUS,5 		//0068 	1283
		STR 	1H 			//0069 	0181

		//;ir-38k-24v.C: 222: T0IF = 0;
		BCR 	INTCON,2 		//006A 	110B

		//;ir-38k-24v.C: 223: T0IE=1;
		BSR 	INTCON,5 		//006B 	1A8B

		//;ir-38k-24v.C: 224: Puls_IR=0;
		CLRR 	70H 			//006C 	0170
		CLRR 	71H 			//006D 	0171
		LJUMP 	1AH 			//006E 	381A

		//;ir-38k-24v.C: 37: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//006F 	168B
		BTSS 	INTCON,2 		//0070 	1D0B
		LJUMP 	85H 			//0071 	3885

		//;ir-38k-24v.C: 38: {
		//;ir-38k-24v.C: 39: TMR0 = 239;
		LDWI 	EFH 			//0072 	2AEF
		BCR 	STATUS,5 		//0073 	1283
		STR 	1H 			//0074 	0181

		//;ir-38k-24v.C: 40: T0IF = 0;
		BCR 	INTCON,2 		//0075 	110B

		//;ir-38k-24v.C: 42: Puls_IR++;
		INCR	70H,1 			//0076 	09F0
		BTSC 	STATUS,2 		//0077 	1503
		INCR	71H,1 			//0078 	09F1

		//;ir-38k-24v.C: 46: PA0 = ~PA0;
		LDWI 	1H 			//0079 	2A01
		XORWR 	5H,1 			//007A 	0485

		//;ir-38k-24v.C: 48: if(Puls_IR>=40){
		LDWI 	0H 			//007B 	2A00
		SUBWR 	71H,0 			//007C 	0C71
		LDWI 	28H 			//007D 	2A28
		BTSC 	STATUS,2 		//007E 	1503
		SUBWR 	70H,0 			//007F 	0C70
		BTSS 	STATUS,0 		//0080 	1C03
		LJUMP 	85H 			//0081 	3885

		//;ir-38k-24v.C: 49: TMR0 = 0;
		CLRR 	1H 			//0082 	0101

		//;ir-38k-24v.C: 50: T0IE=0;
		BCR 	INTCON,5 		//0083 	128B

		//;ir-38k-24v.C: 51: PA0 = 0;
		BCR 	5H,0 			//0084 	1005
		LDR 	77H,0 			//0085 	0877
		STR 	PCLATH 			//0086 	018A
		SWAPR 	76H,0 			//0087 	0776
		STR 	STATUS 			//0088 	0183
		SWAPR 	7EH,1 			//0089 	07FE
		SWAPR 	7EH,0 			//008A 	077E
		RETI		 			//008B 	0009
		STR 	40H 			//008C 	01C0

		//;ir-38k-24v.C: 77: unsigned char a,b;
		//;ir-38k-24v.C: 78: for(a=0;a<Time;a++)
		CLRR 	41H 			//008D 	0141
		LDR 	40H,0 			//008E 	0840
		SUBWR 	41H,0 			//008F 	0C41
		BTSC 	STATUS,0 		//0090 	1403
		RET		 					//0091 	0004

		//;ir-38k-24v.C: 79: {
		//;ir-38k-24v.C: 80: for(b=0;b<5;b++)
		CLRR 	42H 			//0092 	0142

		//;ir-38k-24v.C: 81: {
		//;ir-38k-24v.C: 82: DelayUs(98);
		LDWI 	62H 			//0093 	2A62
		LCALL 	ACH 			//0094 	30AC
		LDWI 	5H 			//0095 	2A05
		BCR 	STATUS,5 		//0096 	1283
		INCR	42H,1 			//0097 	09C2
		SUBWR 	42H,0 			//0098 	0C42
		BTSS 	STATUS,0 		//0099 	1C03
		LJUMP 	93H 			//009A 	3893
		INCR	41H,1 			//009B 	09C1
		LJUMP 	8EH 			//009C 	388E

		//;ir-38k-24v.C: 103: OSCCON = 0B01110001;
		LDWI 	71H 			//009D 	2A71
		BSR 	STATUS,5 		//009E 	1A83
		STR 	FH 			//009F 	018F

		//;ir-38k-24v.C: 105: INTCON = 0;
		CLRR 	INTCON 			//00A0 	010B

		//;ir-38k-24v.C: 106: OPTION = 0B00001000;
		LDWI 	8H 			//00A1 	2A08
		STR 	1H 			//00A2 	0181

		//;ir-38k-24v.C: 108: PORTA = 0B00000000;
		BCR 	STATUS,5 		//00A3 	1283
		CLRR 	5H 			//00A4 	0105

		//;ir-38k-24v.C: 109: TRISA = 0B00000100;
		LDWI 	4H 			//00A5 	2A04
		BSR 	STATUS,5 		//00A6 	1A83
		STR 	5H 			//00A7 	0185

		//;ir-38k-24v.C: 111: WPUA = 0B00000000;
		CLRR 	15H 			//00A8 	0115

		//;ir-38k-24v.C: 113: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//00A9 	1283
		CLRR 	1BH 			//00AA 	011B
		RET		 					//00AB 	0004
		STR 	78H 			//00AC 	01F8

		//;ir-38k-24v.C: 67: unsigned char a;
		//;ir-38k-24v.C: 68: for(a=0;a<Time;a++)
		CLRR 	79H 			//00AD 	0179
		LDR 	78H,0 			//00AE 	0878
		SUBWR 	79H,0 			//00AF 	0C79
		BTSC 	STATUS,0 		//00B0 	1403
		RET		 					//00B1 	0004

		//;ir-38k-24v.C: 69: {
		//;ir-38k-24v.C: 70: __nop();
		NOP		 					//00B2 	0000
		INCR	79H,1 			//00B3 	09F9
		LJUMP 	AEH 			//00B4 	38AE

		//;ir-38k-24v.C: 119: OPTION = 0B00000000;
		BSR 	STATUS,5 		//00B5 	1A83
		CLRR 	1H 			//00B6 	0101

		//;ir-38k-24v.C: 121: TMR0 = 239;
		LDWI 	EFH 			//00B7 	2AEF
		BCR 	STATUS,5 		//00B8 	1283
		STR 	1H 			//00B9 	0181

		//;ir-38k-24v.C: 122: T0IF = 0;
		BCR 	INTCON,2 		//00BA 	110B
		RET		 					//00BB 	0004
			END
