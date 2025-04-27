//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_Puls_Count		EQU		46H
		_Puls_off		EQU		44H
		_Puls_IR		EQU		78H
		_Set		EQU		76H
		_Lock		EQU		42H
		_Backup		EQU		40H
		_Counter		EQU		74H
		_Counter_On		EQU		72H
		_Counter_Off		EQU		70H
//		DelayUs@Time		EQU		48H
//		DelayUs@a		EQU		49H
//		DelayUs@Time		EQU		48H
//		DelayUs@Time		EQU		48H
//-----------------------Variable END---------------------------------

		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	7AH 			//0006 	01FA
		LDR 	PCLATH,0 		//0007 	080A
		STR 	7BH 			//0008 	01FB
		LJUMP 	16H 			//0009 	3816
		LJUMP 	0BH 			//000A 	380B
		LDWI 	70H 			//000B 	2A70
		STR 	FSR 			//000C 	0184
		LDWI 	7AH 			//000D 	2A7A
		LCALL 	101H 			//000E 	3101
		LDWI 	40H 			//000F 	2A40
		BCR 	STATUS,7 		//0010 	1383
		STR 	FSR 			//0011 	0184
		LDWI 	48H 			//0012 	2A48
		LCALL 	101H 			//0013 	3101
		CLRR 	STATUS 			//0014 	0103
		LJUMP 	90H 			//0015 	3890

		//;ir-38k-moc-v2-tm0.C: 42: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//0016 	168B
		BTSS 	INTCON,2 		//0017 	1D0B
		LJUMP 	2CH 			//0018 	382C

		//;ir-38k-moc-v2-tm0.C: 43: {
		//;ir-38k-moc-v2-tm0.C: 44: TMR0 = 239;
		LDWI 	EFH 			//0019 	2AEF
		BCR 	STATUS,5 		//001A 	1283
		STR 	1H 			//001B 	0181

		//;ir-38k-moc-v2-tm0.C: 45: T0IF = 0;
		BCR 	INTCON,2 		//001C 	110B

		//;ir-38k-moc-v2-tm0.C: 47: Puls_IR++;
		INCR	78H,1 			//001D 	09F8
		BTSC 	STATUS,2 		//001E 	1503
		INCR	79H,1 			//001F 	09F9

		//;ir-38k-moc-v2-tm0.C: 51: PA0 = ~PA0;
		LDWI 	1H 			//0020 	2A01
		XORWR 	5H,1 			//0021 	0485

		//;ir-38k-moc-v2-tm0.C: 53: if(Puls_IR>=40){
		LDWI 	0H 			//0022 	2A00
		SUBWR 	79H,0 			//0023 	0C79
		LDWI 	28H 			//0024 	2A28
		BTSC 	STATUS,2 		//0025 	1503
		SUBWR 	78H,0 			//0026 	0C78
		BTSS 	STATUS,0 		//0027 	1C03
		LJUMP 	2CH 			//0028 	382C

		//;ir-38k-moc-v2-tm0.C: 54: TMR0 = 0;
		CLRR 	1H 			//0029 	0101

		//;ir-38k-moc-v2-tm0.C: 55: T0IE=0;
		BCR 	INTCON,5 		//002A 	128B

		//;ir-38k-moc-v2-tm0.C: 56: PA0 = 0;
		BCR 	5H,0 			//002B 	1005

		//;ir-38k-moc-v2-tm0.C: 57: }
		//;ir-38k-moc-v2-tm0.C: 58: }
		//;ir-38k-moc-v2-tm0.C: 61: if(PAIE && PAIF)
		BTSC 	INTCON,3 		//002C 	158B
		BTSS 	INTCON,0 		//002D 	1C0B
		LJUMP 	5AH 			//002E 	385A

		//;ir-38k-moc-v2-tm0.C: 62: {
		//;ir-38k-moc-v2-tm0.C: 63: ReadAPin = PORTA;
		BCR 	STATUS,5 		//002F 	1283
		LDR 	5H,0 			//0030 	0805

		//;ir-38k-moc-v2-tm0.C: 64: PAIF = 0;
		BCR 	INTCON,0 		//0031 	100B

		//;ir-38k-moc-v2-tm0.C: 66: Backup=Counter;
		LDR 	75H,0 			//0032 	0875
		STR 	41H 			//0033 	01C1
		LDR 	74H,0 			//0034 	0874
		STR 	40H 			//0035 	01C0

		//;ir-38k-moc-v2-tm0.C: 68: Counter=0;
		CLRR 	74H 			//0036 	0174
		CLRR 	75H 			//0037 	0175

		//;ir-38k-moc-v2-tm0.C: 84: if(Set==1){
		DECR 	76H,0 			//0038 	0D76
		IORWR 	77H,0 			//0039 	0377
		BTSS 	STATUS,2 		//003A 	1D03
		LJUMP 	4AH 			//003B 	384A

		//;ir-38k-moc-v2-tm0.C: 86: if(Counter_On>0){
		LDR 	72H,0 			//003C 	0872
		IORWR 	73H,0 			//003D 	0373
		BTSC 	STATUS,2 		//003E 	1503
		LJUMP 	47H 			//003F 	3847

		//;ir-38k-moc-v2-tm0.C: 87: Counter_On=Counter_On-1;
		LDWI 	FFH 			//0040 	2AFF
		ADDWR 	72H,1 			//0041 	0BF2
		BTSC 	STATUS,0 		//0042 	1403
		INCR	73H,1 			//0043 	09F3
		ADDWR 	73H,1 			//0044 	0BF3

		//;ir-38k-moc-v2-tm0.C: 88: PA2= 0;
		BCR 	5H,2 			//0045 	1105

		//;ir-38k-moc-v2-tm0.C: 89: }else{
		LJUMP 	4AH 			//0046 	384A

		//;ir-38k-moc-v2-tm0.C: 90: Counter_On=0;
		CLRR 	72H 			//0047 	0172
		CLRR 	73H 			//0048 	0173

		//;ir-38k-moc-v2-tm0.C: 91: PA2= 1;
		BSR 	5H,2 			//0049 	1905

		//;ir-38k-moc-v2-tm0.C: 92: }
		//;ir-38k-moc-v2-tm0.C: 95: }
		//;ir-38k-moc-v2-tm0.C: 97: if(Set==0)
		LDR 	76H,0 			//004A 	0876
		IORWR 	77H,0 			//004B 	0377
		BTSS 	STATUS,2 		//004C 	1D03
		LJUMP 	5AH 			//004D 	385A

		//;ir-38k-moc-v2-tm0.C: 98: {
		//;ir-38k-moc-v2-tm0.C: 99: PA2=0;
		BCR 	5H,2 			//004E 	1105

		//;ir-38k-moc-v2-tm0.C: 100: if(Counter_Off<=160)
		LDWI 	0H 			//004F 	2A00
		SUBWR 	71H,0 			//0050 	0C71
		LDWI 	A1H 			//0051 	2AA1
		BTSC 	STATUS,2 		//0052 	1503
		SUBWR 	70H,0 			//0053 	0C70
		BTSC 	STATUS,0 		//0054 	1403
		LJUMP 	5AH 			//0055 	385A

		//;ir-38k-moc-v2-tm0.C: 101: {
		//;ir-38k-moc-v2-tm0.C: 102: Counter_Off=Counter_Off+2;
		LDWI 	2H 			//0056 	2A02
		ADDWR 	70H,1 			//0057 	0BF0
		BTSC 	STATUS,0 		//0058 	1403
		INCR	71H,1 			//0059 	09F1

		//;ir-38k-moc-v2-tm0.C: 103: }
		//;ir-38k-moc-v2-tm0.C: 104: }
		//;ir-38k-moc-v2-tm0.C: 108: }
		//;ir-38k-moc-v2-tm0.C: 111: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//005A 	1A83
		BTSS 	CH,1 			//005B 	1C8C
		LJUMP 	89H 			//005C 	3889
		BCR 	STATUS,5 		//005D 	1283
		BTSS 	CH,1 			//005E 	1C8C
		LJUMP 	89H 			//005F 	3889

		//;ir-38k-moc-v2-tm0.C: 112: {
		//;ir-38k-moc-v2-tm0.C: 113: TMR2IF = 0;
		BCR 	CH,1 			//0060 	108C

		//;ir-38k-moc-v2-tm0.C: 114: TMR2IE = 1;
		BSR 	STATUS,5 		//0061 	1A83
		BSR 	CH,1 			//0062 	188C

		//;ir-38k-moc-v2-tm0.C: 116: Counter++;
		INCR	74H,1 			//0063 	09F4
		BTSC 	STATUS,2 		//0064 	1503
		INCR	75H,1 			//0065 	09F5

		//;ir-38k-moc-v2-tm0.C: 117: if(Set==1)
		DECR 	76H,0 			//0066 	0D76
		IORWR 	77H,0 			//0067 	0377
		BTSS 	STATUS,2 		//0068 	1D03
		LJUMP 	77H 			//0069 	3877

		//;ir-38k-moc-v2-tm0.C: 118: {
		//;ir-38k-moc-v2-tm0.C: 119: if(Counter>=Counter_On)
		LDR 	73H,0 			//006A 	0873
		SUBWR 	75H,0 			//006B 	0C75
		BTSS 	STATUS,2 		//006C 	1D03
		LJUMP 	70H 			//006D 	3870
		LDR 	72H,0 			//006E 	0872
		SUBWR 	74H,0 			//006F 	0C74

		//;ir-38k-moc-v2-tm0.C: 120: {
		//;ir-38k-moc-v2-tm0.C: 121: PA2=1;
		BCR 	STATUS,5 		//0070 	1283
		BTSC 	STATUS,0 		//0071 	1403
		BSR 	5H,2 			//0072 	1905

		//;ir-38k-moc-v2-tm0.C: 122: }
		//;ir-38k-moc-v2-tm0.C: 123: Counter_Off=Counter_On;
		LDR 	73H,0 			//0073 	0873
		STR 	71H 			//0074 	01F1
		LDR 	72H,0 			//0075 	0872
		STR 	70H 			//0076 	01F0

		//;ir-38k-moc-v2-tm0.C: 124: }
		//;ir-38k-moc-v2-tm0.C: 125: if(Set==0)
		LDR 	76H,0 			//0077 	0876
		IORWR 	77H,0 			//0078 	0377
		BTSS 	STATUS,2 		//0079 	1D03
		LJUMP 	89H 			//007A 	3889

		//;ir-38k-moc-v2-tm0.C: 126: {
		//;ir-38k-moc-v2-tm0.C: 127: if(Counter>=Counter_Off)
		LDR 	71H,0 			//007B 	0871
		SUBWR 	75H,0 			//007C 	0C75
		BTSS 	STATUS,2 		//007D 	1D03
		LJUMP 	81H 			//007E 	3881
		LDR 	70H,0 			//007F 	0870
		SUBWR 	74H,0 			//0080 	0C74

		//;ir-38k-moc-v2-tm0.C: 128: {
		//;ir-38k-moc-v2-tm0.C: 129: PA2=1;
		BCR 	STATUS,5 		//0081 	1283
		BTSC 	STATUS,0 		//0082 	1403
		BSR 	5H,2 			//0083 	1905

		//;ir-38k-moc-v2-tm0.C: 130: }
		//;ir-38k-moc-v2-tm0.C: 131: Counter_On=Backup;
		BCR 	STATUS,5 		//0084 	1283
		LDR 	41H,0 			//0085 	0841
		STR 	73H 			//0086 	01F3
		LDR 	40H,0 			//0087 	0840
		STR 	72H 			//0088 	01F2
		LDR 	7BH,0 			//0089 	087B
		STR 	PCLATH 			//008A 	018A
		SWAPR 	7AH,0 			//008B 	077A
		STR 	STATUS 			//008C 	0183
		SWAPR 	7EH,1 			//008D 	07FE
		SWAPR 	7EH,0 			//008E 	077E
		RETI		 			//008F 	0009

		//;ir-38k-moc-v2-tm0.C: 234: POWER_INITIAL();
		LCALL 	E7H 			//0090 	30E7

		//;ir-38k-moc-v2-tm0.C: 235: TIMER0_INITIAL();
		LCALL 	109H 			//0091 	3109

		//;ir-38k-moc-v2-tm0.C: 239: GIE = 1;
		BSR 	INTCON,7 		//0092 	1B8B

		//;ir-38k-moc-v2-tm0.C: 241: T0IE = 1;
		BSR 	INTCON,5 		//0093 	1A8B

		//;ir-38k-moc-v2-tm0.C: 246: {
		//;ir-38k-moc-v2-tm0.C: 248: if(Puls_IR>=40){
		LDWI 	0H 			//0094 	2A00
		SUBWR 	79H,0 			//0095 	0C79
		LDWI 	28H 			//0096 	2A28
		BTSC 	STATUS,2 		//0097 	1503
		SUBWR 	78H,0 			//0098 	0C78
		BTSS 	STATUS,0 		//0099 	1C03
		LJUMP 	94H 			//009A 	3894

		//;ir-38k-moc-v2-tm0.C: 286: if(PA3==0){
		BTSC 	5H,3 			//009B 	1585
		LJUMP 	A3H 			//009C 	38A3

		//;ir-38k-moc-v2-tm0.C: 287: Puls_Count++;
		INCR	46H,1 			//009D 	09C6
		BTSC 	STATUS,2 		//009E 	1503
		INCR	47H,1 			//009F 	09C7

		//;ir-38k-moc-v2-tm0.C: 288: Puls_off=0;
		CLRR 	44H 			//00A0 	0144
		CLRR 	45H 			//00A1 	0145

		//;ir-38k-moc-v2-tm0.C: 289: }else
		LJUMP 	A8H 			//00A2 	38A8

		//;ir-38k-moc-v2-tm0.C: 290: {
		//;ir-38k-moc-v2-tm0.C: 291: Puls_off++;
		INCR	44H,1 			//00A3 	09C4
		BTSC 	STATUS,2 		//00A4 	1503
		INCR	45H,1 			//00A5 	09C5

		//;ir-38k-moc-v2-tm0.C: 292: Puls_Count=0;
		CLRR 	46H 			//00A6 	0146
		CLRR 	47H 			//00A7 	0147

		//;ir-38k-moc-v2-tm0.C: 293: }
		//;ir-38k-moc-v2-tm0.C: 295: DelayUs(400);
		LDWI 	90H 			//00A8 	2A90
		LCALL 	F7H 			//00A9 	30F7

		//;ir-38k-moc-v2-tm0.C: 297: if(PA3!=0){
		BTSS 	5H,3 			//00AA 	1D85
		LJUMP 	B3H 			//00AB 	38B3

		//;ir-38k-moc-v2-tm0.C: 298: Puls_Count++;
		INCR	46H,1 			//00AC 	09C6
		BTSC 	STATUS,2 		//00AD 	1503
		INCR	47H,1 			//00AE 	09C7

		//;ir-38k-moc-v2-tm0.C: 299: Puls_off++;
		INCR	44H,1 			//00AF 	09C4
		BTSC 	STATUS,2 		//00B0 	1503
		INCR	45H,1 			//00B1 	09C5

		//;ir-38k-moc-v2-tm0.C: 300: }else
		LJUMP 	B7H 			//00B2 	38B7

		//;ir-38k-moc-v2-tm0.C: 301: {
		//;ir-38k-moc-v2-tm0.C: 302: Puls_off=0;
		CLRR 	44H 			//00B3 	0144
		CLRR 	45H 			//00B4 	0145

		//;ir-38k-moc-v2-tm0.C: 303: Puls_Count=0;
		CLRR 	46H 			//00B5 	0146
		CLRR 	47H 			//00B6 	0147

		//;ir-38k-moc-v2-tm0.C: 304: }
		//;ir-38k-moc-v2-tm0.C: 306: DelayUs(400);
		LDWI 	90H 			//00B7 	2A90
		LCALL 	F7H 			//00B8 	30F7

		//;ir-38k-moc-v2-tm0.C: 310: if(Puls_Count>30 && Lock==0){
		LDWI 	0H 			//00B9 	2A00
		SUBWR 	47H,0 			//00BA 	0C47
		LDWI 	1FH 			//00BB 	2A1F
		BTSC 	STATUS,2 		//00BC 	1503
		SUBWR 	46H,0 			//00BD 	0C46
		BTSS 	STATUS,0 		//00BE 	1C03
		LJUMP 	D7H 			//00BF 	38D7
		LDR 	42H,0 			//00C0 	0842
		IORWR 	43H,0 			//00C1 	0343
		BTSS 	STATUS,2 		//00C2 	1D03
		LJUMP 	D7H 			//00C3 	38D7

		//;ir-38k-moc-v2-tm0.C: 314: Lock=1;
		CLRR 	42H 			//00C4 	0142
		INCR	42H,1 			//00C5 	09C2
		CLRR 	43H 			//00C6 	0143

		//;ir-38k-moc-v2-tm0.C: 316: Set++;
		INCR	76H,1 			//00C7 	09F6
		BTSC 	STATUS,2 		//00C8 	1503
		INCR	77H,1 			//00C9 	09F7

		//;ir-38k-moc-v2-tm0.C: 317: if(Set==1)
		DECR 	76H,0 			//00CA 	0D76
		IORWR 	77H,0 			//00CB 	0377
		BTSS 	STATUS,2 		//00CC 	1D03
		LJUMP 	D2H 			//00CD 	38D2

		//;ir-38k-moc-v2-tm0.C: 318: {
		//;ir-38k-moc-v2-tm0.C: 319: PA4=1;
		BSR 	5H,4 			//00CE 	1A05

		//;ir-38k-moc-v2-tm0.C: 320: PA5=0;
		BCR 	5H,5 			//00CF 	1285

		//;ir-38k-moc-v2-tm0.C: 322: PA2= 1;
		BSR 	5H,2 			//00D0 	1905

		//;ir-38k-moc-v2-tm0.C: 323: }
		LJUMP 	D7H 			//00D1 	38D7

		//;ir-38k-moc-v2-tm0.C: 324: else
		//;ir-38k-moc-v2-tm0.C: 325: {
		//;ir-38k-moc-v2-tm0.C: 326: PA4=0;
		BCR 	5H,4 			//00D2 	1205

		//;ir-38k-moc-v2-tm0.C: 327: PA5=1;
		BSR 	5H,5 			//00D3 	1A85

		//;ir-38k-moc-v2-tm0.C: 329: Set=0;
		CLRR 	76H 			//00D4 	0176
		CLRR 	77H 			//00D5 	0177

		//;ir-38k-moc-v2-tm0.C: 330: PA2= 0;
		BCR 	5H,2 			//00D6 	1105

		//;ir-38k-moc-v2-tm0.C: 331: }
		//;ir-38k-moc-v2-tm0.C: 334: }
		//;ir-38k-moc-v2-tm0.C: 335: if(Puls_off>500 )
		LDWI 	1H 			//00D7 	2A01
		SUBWR 	45H,0 			//00D8 	0C45
		LDWI 	F5H 			//00D9 	2AF5
		BTSC 	STATUS,2 		//00DA 	1503
		SUBWR 	44H,0 			//00DB 	0C44
		BTSS 	STATUS,0 		//00DC 	1C03
		LJUMP 	E0H 			//00DD 	38E0

		//;ir-38k-moc-v2-tm0.C: 336: {
		//;ir-38k-moc-v2-tm0.C: 337: Lock=0;
		CLRR 	42H 			//00DE 	0142
		CLRR 	43H 			//00DF 	0143

		//;ir-38k-moc-v2-tm0.C: 338: }
		//;ir-38k-moc-v2-tm0.C: 344: TMR0 = 239;
		LDWI 	EFH 			//00E0 	2AEF
		STR 	1H 			//00E1 	0181

		//;ir-38k-moc-v2-tm0.C: 345: T0IF = 0;
		BCR 	INTCON,2 		//00E2 	110B

		//;ir-38k-moc-v2-tm0.C: 346: T0IE=1;
		BSR 	INTCON,5 		//00E3 	1A8B

		//;ir-38k-moc-v2-tm0.C: 347: Puls_IR=0;
		CLRR 	78H 			//00E4 	0178
		CLRR 	79H 			//00E5 	0179
		LJUMP 	94H 			//00E6 	3894

		//;ir-38k-moc-v2-tm0.C: 180: OSCCON = 0B01110001;
		LDWI 	71H 			//00E7 	2A71
		BSR 	STATUS,5 		//00E8 	1A83
		STR 	FH 			//00E9 	018F

		//;ir-38k-moc-v2-tm0.C: 182: INTCON = 0;
		CLRR 	INTCON 			//00EA 	010B

		//;ir-38k-moc-v2-tm0.C: 183: OPTION = 0B00001000;
		LDWI 	8H 			//00EB 	2A08
		STR 	1H 			//00EC 	0181

		//;ir-38k-moc-v2-tm0.C: 185: PORTA = 0B00100000;
		LDWI 	20H 			//00ED 	2A20
		BCR 	STATUS,5 		//00EE 	1283
		STR 	5H 			//00EF 	0185

		//;ir-38k-moc-v2-tm0.C: 186: TRISA = 0B00001010;
		LDWI 	AH 			//00F0 	2A0A
		BSR 	STATUS,5 		//00F1 	1A83
		STR 	5H 			//00F2 	0185

		//;ir-38k-moc-v2-tm0.C: 188: WPUA = 0B00000000;
		CLRR 	15H 			//00F3 	0115

		//;ir-38k-moc-v2-tm0.C: 190: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//00F4 	1283
		CLRR 	1BH 			//00F5 	011B
		RET		 					//00F6 	0004
		STR 	48H 			//00F7 	01C8

		//;ir-38k-moc-v2-tm0.C: 144: unsigned char a;
		//;ir-38k-moc-v2-tm0.C: 145: for(a=0;a<Time;a++)
		CLRR 	49H 			//00F8 	0149
		LDR 	48H,0 			//00F9 	0848
		SUBWR 	49H,0 			//00FA 	0C49
		BTSC 	STATUS,0 		//00FB 	1403
		RET		 					//00FC 	0004

		//;ir-38k-moc-v2-tm0.C: 146: {
		//;ir-38k-moc-v2-tm0.C: 147: __nop();
		NOP		 					//00FD 	0000
		BCR 	STATUS,5 		//00FE 	1283
		INCR	49H,1 			//00FF 	09C9
		LJUMP 	F9H 			//0100 	38F9
		CLRWDT	 			//0101 	0001
		CLRR 	INDF 			//0102 	0100
		INCR	FSR,1 			//0103 	0984
		XORWR 	FSR,0 			//0104 	0404
		BTSC 	STATUS,2 		//0105 	1503
		RETW 	0H 			//0106 	2100
		XORWR 	FSR,0 			//0107 	0404
		LJUMP 	102H 			//0108 	3902

		//;ir-38k-moc-v2-tm0.C: 196: OPTION = 0B00000000;
		BSR 	STATUS,5 		//0109 	1A83
		CLRR 	1H 			//010A 	0101

		//;ir-38k-moc-v2-tm0.C: 198: TMR0 = 239;
		LDWI 	EFH 			//010B 	2AEF
		BCR 	STATUS,5 		//010C 	1283
		STR 	1H 			//010D 	0181

		//;ir-38k-moc-v2-tm0.C: 199: T0IF = 0;
		BCR 	INTCON,2 		//010E 	110B
		RET		 					//010F 	0004
			END
