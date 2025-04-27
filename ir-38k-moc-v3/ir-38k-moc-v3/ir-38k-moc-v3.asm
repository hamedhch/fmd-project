//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_Puls_Count		EQU		78H
		_Puls_off		EQU		4AH
		_Puls_IR		EQU		76H
		_Set		EQU		74H
		_Lock		EQU		72H
		_conter_mode		EQU		40H
		_Backup		EQU		48H
		_Counter		EQU		70H
		_Counter_On		EQU		46H
		_Counter_Off		EQU		44H
//		DelayUs@Time		EQU		4CH
//		DelayUs@a		EQU		4DH
//		DelayUs@Time		EQU		4CH
//		DelayUs@Time		EQU		4CH
//-----------------------Variable END---------------------------------

		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	7AH 			//0006 	01FA
		LDR 	PCLATH,0 		//0007 	080A
		STR 	7BH 			//0008 	01FB
		LJUMP 	8EH 			//0009 	388E
		LJUMP 	0BH 			//000A 	380B
		LDWI 	70H 			//000B 	2A70
		STR 	FSR 			//000C 	0184
		LDWI 	7AH 			//000D 	2A7A
		LCALL 	F3H 			//000E 	30F3
		LDWI 	40H 			//000F 	2A40
		BCR 	STATUS,7 		//0010 	1383
		STR 	FSR 			//0011 	0184
		LDWI 	4CH 			//0012 	2A4C
		LCALL 	F3H 			//0013 	30F3
		CLRR 	STATUS 			//0014 	0103
		LJUMP 	16H 			//0015 	3816

		//;ir-38k-moc-v3.C: 234: POWER_INITIAL();
		LCALL 	D9H 			//0016 	30D9

		//;ir-38k-moc-v3.C: 235: TIMER0_INITIAL();
		LCALL 	FBH 			//0017 	30FB

		//;ir-38k-moc-v3.C: 240: GIE = 1;
		BSR 	INTCON,7 		//0018 	1B8B

		//;ir-38k-moc-v3.C: 242: T0IE = 1;
		BSR 	INTCON,5 		//0019 	1A8B

		//;ir-38k-moc-v3.C: 247: {
		//;ir-38k-moc-v3.C: 249: if(Puls_IR>=40){
		LDWI 	0H 			//001A 	2A00
		SUBWR 	77H,0 			//001B 	0C77
		LDWI 	28H 			//001C 	2A28
		BTSC 	STATUS,2 		//001D 	1503
		SUBWR 	76H,0 			//001E 	0C76
		BTSS 	STATUS,0 		//001F 	1C03
		LJUMP 	1AH 			//0020 	381A

		//;ir-38k-moc-v3.C: 285: if(PA3==0){
		BTSC 	5H,3 			//0021 	1585
		LJUMP 	29H 			//0022 	3829

		//;ir-38k-moc-v3.C: 286: Puls_Count++;
		INCR	78H,1 			//0023 	09F8
		BTSC 	STATUS,2 		//0024 	1503
		INCR	79H,1 			//0025 	09F9

		//;ir-38k-moc-v3.C: 287: Puls_off=0;
		CLRR 	4AH 			//0026 	014A
		CLRR 	4BH 			//0027 	014B

		//;ir-38k-moc-v3.C: 288: }else
		LJUMP 	2EH 			//0028 	382E

		//;ir-38k-moc-v3.C: 289: {
		//;ir-38k-moc-v3.C: 290: Puls_off++;
		INCR	4AH,1 			//0029 	09CA
		BTSC 	STATUS,2 		//002A 	1503
		INCR	4BH,1 			//002B 	09CB

		//;ir-38k-moc-v3.C: 291: Puls_Count=0;
		CLRR 	78H 			//002C 	0178
		CLRR 	79H 			//002D 	0179

		//;ir-38k-moc-v3.C: 292: }
		//;ir-38k-moc-v3.C: 294: DelayUs(400);
		LDWI 	90H 			//002E 	2A90
		LCALL 	E9H 			//002F 	30E9

		//;ir-38k-moc-v3.C: 296: if(PA3!=0){
		BTSS 	5H,3 			//0030 	1D85
		LJUMP 	39H 			//0031 	3839

		//;ir-38k-moc-v3.C: 297: Puls_Count++;
		INCR	78H,1 			//0032 	09F8
		BTSC 	STATUS,2 		//0033 	1503
		INCR	79H,1 			//0034 	09F9

		//;ir-38k-moc-v3.C: 298: Puls_off++;
		INCR	4AH,1 			//0035 	09CA
		BTSC 	STATUS,2 		//0036 	1503
		INCR	4BH,1 			//0037 	09CB

		//;ir-38k-moc-v3.C: 299: }else
		LJUMP 	3DH 			//0038 	383D

		//;ir-38k-moc-v3.C: 300: {
		//;ir-38k-moc-v3.C: 301: Puls_off=0;
		CLRR 	4AH 			//0039 	014A
		CLRR 	4BH 			//003A 	014B

		//;ir-38k-moc-v3.C: 302: Puls_Count=0;
		CLRR 	78H 			//003B 	0178
		CLRR 	79H 			//003C 	0179

		//;ir-38k-moc-v3.C: 303: }
		//;ir-38k-moc-v3.C: 305: DelayUs(400);
		LDWI 	90H 			//003D 	2A90
		LCALL 	E9H 			//003E 	30E9

		//;ir-38k-moc-v3.C: 329: }
		//;ir-38k-moc-v3.C: 330: }
		//;ir-38k-moc-v3.C: 331: }
		//;ir-38k-moc-v3.C: 334: conter_mode++;
		//;ir-38k-moc-v3.C: 308: if(mode==0){
		INCR	40H,1 			//003F 	09C0
		BTSC 	STATUS,2 		//0040 	1503
		INCR	41H,1 			//0041 	09C1
		BTSC 	STATUS,2 		//0042 	1503
		INCR	42H,1 			//0043 	09C2
		BTSC 	STATUS,2 		//0044 	1503
		INCR	43H,1 			//0045 	09C3

		//;ir-38k-moc-v3.C: 335: if(conter_mode==1000){
		LDWI 	E8H 			//0046 	2AE8
		XORWR 	40H,0 			//0047 	0440
		LDWI 	3H 			//0048 	2A03
		BTSC 	STATUS,2 		//0049 	1503
		XORWR 	41H,0 			//004A 	0441
		IORWR 	42H,0 			//004B 	0342
		IORWR 	43H,0 			//004C 	0343
		BTSS 	STATUS,2 		//004D 	1D03
		LJUMP 	51H 			//004E 	3851

		//;ir-38k-moc-v3.C: 337: PA4=0;
		BCR 	5H,4 			//004F 	1205

		//;ir-38k-moc-v3.C: 338: PA5=1;
		BSR 	5H,5 			//0050 	1A85

		//;ir-38k-moc-v3.C: 339: }
		//;ir-38k-moc-v3.C: 340: if(conter_mode>30000){
		LDR 	43H,0 			//0051 	0843
		BTSS 	STATUS,2 		//0052 	1D03
		LJUMP 	5FH 			//0053 	385F
		LDR 	42H,0 			//0054 	0842
		BTSS 	STATUS,2 		//0055 	1D03
		LJUMP 	5FH 			//0056 	385F
		LDWI 	75H 			//0057 	2A75
		SUBWR 	41H,0 			//0058 	0C41
		BTSS 	STATUS,2 		//0059 	1D03
		LJUMP 	5DH 			//005A 	385D
		LDWI 	31H 			//005B 	2A31
		SUBWR 	40H,0 			//005C 	0C40
		BTSS 	STATUS,0 		//005D 	1C03
		LJUMP 	66H 			//005E 	3866

		//;ir-38k-moc-v3.C: 341: conter_mode=0;
		CLRR 	40H 			//005F 	0140
		CLRR 	41H 			//0060 	0141
		CLRR 	42H 			//0061 	0142
		CLRR 	43H 			//0062 	0143

		//;ir-38k-moc-v3.C: 343: Set=0;
		CLRR 	74H 			//0063 	0174
		CLRR 	75H 			//0064 	0175

		//;ir-38k-moc-v3.C: 344: PA2= 0;
		BCR 	5H,2 			//0065 	1105

		//;ir-38k-moc-v3.C: 350: if(Puls_Count>1 && Lock==0){
		LDWI 	0H 			//0066 	2A00
		SUBWR 	79H,0 			//0067 	0C79
		LDWI 	2H 			//0068 	2A02
		BTSC 	STATUS,2 		//0069 	1503
		SUBWR 	78H,0 			//006A 	0C78
		BTSS 	STATUS,0 		//006B 	1C03
		LJUMP 	7EH 			//006C 	387E
		LDR 	72H,0 			//006D 	0872
		IORWR 	73H,0 			//006E 	0373
		BTSS 	STATUS,2 		//006F 	1D03
		LJUMP 	7EH 			//0070 	387E

		//;ir-38k-moc-v3.C: 352: Lock=1;
		CLRR 	72H 			//0071 	0172
		INCR	72H,1 			//0072 	09F2
		CLRR 	73H 			//0073 	0173

		//;ir-38k-moc-v3.C: 354: Set=1;
		CLRR 	74H 			//0074 	0174
		INCR	74H,1 			//0075 	09F4
		CLRR 	75H 			//0076 	0175

		//;ir-38k-moc-v3.C: 355: PA4=1;
		BSR 	5H,4 			//0077 	1A05

		//;ir-38k-moc-v3.C: 356: PA5=0;
		BCR 	5H,5 			//0078 	1285

		//;ir-38k-moc-v3.C: 357: PA2= 1;
		BSR 	5H,2 			//0079 	1905

		//;ir-38k-moc-v3.C: 358: conter_mode=0;
		CLRR 	40H 			//007A 	0140
		CLRR 	41H 			//007B 	0141
		CLRR 	42H 			//007C 	0142
		CLRR 	43H 			//007D 	0143

		//;ir-38k-moc-v3.C: 359: }
		//;ir-38k-moc-v3.C: 360: }
		//;ir-38k-moc-v3.C: 365: if(Puls_off>500 )
		LDWI 	1H 			//007E 	2A01
		SUBWR 	4BH,0 			//007F 	0C4B
		LDWI 	F5H 			//0080 	2AF5
		BTSC 	STATUS,2 		//0081 	1503
		SUBWR 	4AH,0 			//0082 	0C4A
		BTSS 	STATUS,0 		//0083 	1C03
		LJUMP 	87H 			//0084 	3887

		//;ir-38k-moc-v3.C: 366: {
		//;ir-38k-moc-v3.C: 367: Lock=0;
		CLRR 	72H 			//0085 	0172
		CLRR 	73H 			//0086 	0173

		//;ir-38k-moc-v3.C: 368: }
		//;ir-38k-moc-v3.C: 373: TMR0 = 239;
		LDWI 	EFH 			//0087 	2AEF
		STR 	1H 			//0088 	0181

		//;ir-38k-moc-v3.C: 374: T0IF = 0;
		BCR 	INTCON,2 		//0089 	110B

		//;ir-38k-moc-v3.C: 375: T0IE=1;
		BSR 	INTCON,5 		//008A 	1A8B

		//;ir-38k-moc-v3.C: 376: Puls_IR=0;
		CLRR 	76H 			//008B 	0176
		CLRR 	77H 			//008C 	0177
		LJUMP 	1AH 			//008D 	381A

		//;ir-38k-moc-v3.C: 45: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//008E 	168B
		BTSS 	INTCON,2 		//008F 	1D0B
		LJUMP 	A4H 			//0090 	38A4

		//;ir-38k-moc-v3.C: 46: {
		//;ir-38k-moc-v3.C: 47: TMR0 = 239;
		LDWI 	EFH 			//0091 	2AEF
		BCR 	STATUS,5 		//0092 	1283
		STR 	1H 			//0093 	0181

		//;ir-38k-moc-v3.C: 48: T0IF = 0;
		BCR 	INTCON,2 		//0094 	110B

		//;ir-38k-moc-v3.C: 50: Puls_IR++;
		INCR	76H,1 			//0095 	09F6
		BTSC 	STATUS,2 		//0096 	1503
		INCR	77H,1 			//0097 	09F7

		//;ir-38k-moc-v3.C: 54: PA0 = ~PA0;
		LDWI 	1H 			//0098 	2A01
		XORWR 	5H,1 			//0099 	0485

		//;ir-38k-moc-v3.C: 56: if(Puls_IR>=40){
		LDWI 	0H 			//009A 	2A00
		SUBWR 	77H,0 			//009B 	0C77
		LDWI 	28H 			//009C 	2A28
		BTSC 	STATUS,2 		//009D 	1503
		SUBWR 	76H,0 			//009E 	0C76
		BTSS 	STATUS,0 		//009F 	1C03
		LJUMP 	A4H 			//00A0 	38A4

		//;ir-38k-moc-v3.C: 57: TMR0 = 0;
		CLRR 	1H 			//00A1 	0101

		//;ir-38k-moc-v3.C: 58: T0IE=0;
		BCR 	INTCON,5 		//00A2 	128B

		//;ir-38k-moc-v3.C: 59: PA0 = 0;
		BCR 	5H,0 			//00A3 	1005

		//;ir-38k-moc-v3.C: 60: }
		//;ir-38k-moc-v3.C: 61: }
		//;ir-38k-moc-v3.C: 111: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//00A4 	1A83
		BTSS 	CH,1 			//00A5 	1C8C
		LJUMP 	D2H 			//00A6 	38D2
		BCR 	STATUS,5 		//00A7 	1283
		BTSS 	CH,1 			//00A8 	1C8C
		LJUMP 	D2H 			//00A9 	38D2

		//;ir-38k-moc-v3.C: 112: {
		//;ir-38k-moc-v3.C: 113: TMR2IF = 0;
		BCR 	CH,1 			//00AA 	108C

		//;ir-38k-moc-v3.C: 114: TMR2IE = 1;
		BSR 	STATUS,5 		//00AB 	1A83
		BSR 	CH,1 			//00AC 	188C

		//;ir-38k-moc-v3.C: 116: Counter++;
		INCR	70H,1 			//00AD 	09F0
		BTSC 	STATUS,2 		//00AE 	1503
		INCR	71H,1 			//00AF 	09F1

		//;ir-38k-moc-v3.C: 117: if(Set==1)
		DECR 	74H,0 			//00B0 	0D74
		IORWR 	75H,0 			//00B1 	0375
		BTSS 	STATUS,2 		//00B2 	1D03
		LJUMP 	C1H 			//00B3 	38C1

		//;ir-38k-moc-v3.C: 118: {
		//;ir-38k-moc-v3.C: 119: if(Counter>=Counter_On)
		BCR 	STATUS,5 		//00B4 	1283
		LDR 	47H,0 			//00B5 	0847
		SUBWR 	71H,0 			//00B6 	0C71
		BTSS 	STATUS,2 		//00B7 	1D03
		LJUMP 	BBH 			//00B8 	38BB
		LDR 	46H,0 			//00B9 	0846
		SUBWR 	70H,0 			//00BA 	0C70
		BTSC 	STATUS,0 		//00BB 	1403

		//;ir-38k-moc-v3.C: 120: {
		//;ir-38k-moc-v3.C: 121: PA2=1;
		BSR 	5H,2 			//00BC 	1905

		//;ir-38k-moc-v3.C: 122: }
		//;ir-38k-moc-v3.C: 123: Counter_Off=Counter_On;
		LDR 	47H,0 			//00BD 	0847
		STR 	45H 			//00BE 	01C5
		LDR 	46H,0 			//00BF 	0846
		STR 	44H 			//00C0 	01C4

		//;ir-38k-moc-v3.C: 124: }
		//;ir-38k-moc-v3.C: 125: if(Set==0)
		LDR 	74H,0 			//00C1 	0874
		IORWR 	75H,0 			//00C2 	0375
		BTSS 	STATUS,2 		//00C3 	1D03
		LJUMP 	D2H 			//00C4 	38D2

		//;ir-38k-moc-v3.C: 126: {
		//;ir-38k-moc-v3.C: 127: if(Counter>=Counter_Off)
		BCR 	STATUS,5 		//00C5 	1283
		LDR 	45H,0 			//00C6 	0845
		SUBWR 	71H,0 			//00C7 	0C71
		BTSS 	STATUS,2 		//00C8 	1D03
		LJUMP 	CCH 			//00C9 	38CC
		LDR 	44H,0 			//00CA 	0844
		SUBWR 	70H,0 			//00CB 	0C70
		BTSC 	STATUS,0 		//00CC 	1403

		//;ir-38k-moc-v3.C: 128: {
		//;ir-38k-moc-v3.C: 129: PA2=1;
		BSR 	5H,2 			//00CD 	1905

		//;ir-38k-moc-v3.C: 130: }
		//;ir-38k-moc-v3.C: 131: Counter_On=Backup;
		LDR 	49H,0 			//00CE 	0849
		STR 	47H 			//00CF 	01C7
		LDR 	48H,0 			//00D0 	0848
		STR 	46H 			//00D1 	01C6
		LDR 	7BH,0 			//00D2 	087B
		STR 	PCLATH 			//00D3 	018A
		SWAPR 	7AH,0 			//00D4 	077A
		STR 	STATUS 			//00D5 	0183
		SWAPR 	7EH,1 			//00D6 	07FE
		SWAPR 	7EH,0 			//00D7 	077E
		RETI		 			//00D8 	0009

		//;ir-38k-moc-v3.C: 180: OSCCON = 0B01110001;
		LDWI 	71H 			//00D9 	2A71
		BSR 	STATUS,5 		//00DA 	1A83
		STR 	FH 			//00DB 	018F

		//;ir-38k-moc-v3.C: 182: INTCON = 0;
		CLRR 	INTCON 			//00DC 	010B

		//;ir-38k-moc-v3.C: 183: OPTION = 0B00001000;
		LDWI 	8H 			//00DD 	2A08
		STR 	1H 			//00DE 	0181

		//;ir-38k-moc-v3.C: 185: PORTA = 0B00100000;
		LDWI 	20H 			//00DF 	2A20
		BCR 	STATUS,5 		//00E0 	1283
		STR 	5H 			//00E1 	0185

		//;ir-38k-moc-v3.C: 186: TRISA = 0B00001010;
		LDWI 	AH 			//00E2 	2A0A
		BSR 	STATUS,5 		//00E3 	1A83
		STR 	5H 			//00E4 	0185

		//;ir-38k-moc-v3.C: 188: WPUA = 0B00000000;
		CLRR 	15H 			//00E5 	0115

		//;ir-38k-moc-v3.C: 190: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//00E6 	1283
		CLRR 	1BH 			//00E7 	011B
		RET		 					//00E8 	0004
		STR 	4CH 			//00E9 	01CC

		//;ir-38k-moc-v3.C: 144: unsigned char a;
		//;ir-38k-moc-v3.C: 145: for(a=0;a<Time;a++)
		CLRR 	4DH 			//00EA 	014D
		LDR 	4CH,0 			//00EB 	084C
		SUBWR 	4DH,0 			//00EC 	0C4D
		BTSC 	STATUS,0 		//00ED 	1403
		RET		 					//00EE 	0004

		//;ir-38k-moc-v3.C: 146: {
		//;ir-38k-moc-v3.C: 147: __nop();
		NOP		 					//00EF 	0000
		BCR 	STATUS,5 		//00F0 	1283
		INCR	4DH,1 			//00F1 	09CD
		LJUMP 	EBH 			//00F2 	38EB
		CLRWDT	 			//00F3 	0001
		CLRR 	INDF 			//00F4 	0100
		INCR	FSR,1 			//00F5 	0984
		XORWR 	FSR,0 			//00F6 	0404
		BTSC 	STATUS,2 		//00F7 	1503
		RETW 	0H 			//00F8 	2100
		XORWR 	FSR,0 			//00F9 	0404
		LJUMP 	F4H 			//00FA 	38F4

		//;ir-38k-moc-v3.C: 196: OPTION = 0B00000000;
		BSR 	STATUS,5 		//00FB 	1A83
		CLRR 	1H 			//00FC 	0101

		//;ir-38k-moc-v3.C: 198: TMR0 = 239;
		LDWI 	EFH 			//00FD 	2AEF
		BCR 	STATUS,5 		//00FE 	1283
		STR 	1H 			//00FF 	0181

		//;ir-38k-moc-v3.C: 199: T0IF = 0;
		BCR 	INTCON,2 		//0100 	110B
		RET		 					//0101 	0004
			END
