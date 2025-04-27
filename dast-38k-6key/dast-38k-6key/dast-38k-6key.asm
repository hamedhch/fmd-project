//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_ir_status		EQU		78H
		_ir_timer		EQU		77H
		_Set		EQU		55H
		_repeat		EQU		4DH
		_outpin		EQU		40H
		_IRbitNum		EQU		76H
		_IRbitTime		EQU		75H
		_IRDataTimer		EQU		48H
		_bitdata		EQU		79H
		_ReceiveFinish		EQU		4CH
//		main@E		EQU		51H
//		main@rdata2		EQU		54H
//		main@rdata1		EQU		53H
//		DelayMs@Time		EQU		4EH
//		DelayMs@b		EQU		50H
//		DelayMs@a		EQU		4FH
//		DelayMs@Time		EQU		4EH
//		DelayMs@Time		EQU		4EH
//		DelayUs@Time		EQU		73H
//		DelayUs@a		EQU		74H
//		DelayUs@Time		EQU		73H
//		DelayUs@Time		EQU		73H
//-----------------------Variable END---------------------------------

		LJUMP 	0CH 			//0000 	380C
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	FSR,0 			//0007 	0804
		STR 	71H 			//0008 	01F1
		LDR 	PCLATH,0 		//0009 	080A
		STR 	72H 			//000A 	01F2
		LJUMP 	86H 			//000B 	3886
		LJUMP 	0DH 			//000C 	380D
		LDWI 	1H 			//000D 	2A01
		STR 	55H 			//000E 	01D5
		STR 	79H 			//000F 	01F9
		LDWI 	40H 			//0010 	2A40
		BCR 	STATUS,7 		//0011 	1383
		STR 	FSR 			//0012 	0184
		LDWI 	4EH 			//0013 	2A4E
		LCALL 	110H 			//0014 	3110
		LDWI 	75H 			//0015 	2A75
		STR 	FSR 			//0016 	0184
		LDWI 	79H 			//0017 	2A79
		LCALL 	110H 			//0018 	3110
		CLRR 	STATUS 			//0019 	0103
		LJUMP 	1BH 			//001A 	381B

		//;dast-38k-6key.C: 190: unsigned char rdata1,rdata2;
		//;dast-38k-6key.C: 192: POWER_INITIAL();
		LCALL 	ECH 			//001B 	30EC

		//;dast-38k-6key.C: 194: TIMER2_INITIAL();
		LCALL 	FBH 			//001C 	30FB

		//;dast-38k-6key.C: 196: GIE = 1;
		BSR 	INTCON,7 		//001D 	1B8B

		//;dast-38k-6key.C: 198: TMR2IE = 1;
		BSR 	STATUS,5 		//001E 	1A83
		BSR 	CH,1 			//001F 	188C
		LJUMP 	24H 			//0020 	3824
		LDR 	4DH,0 			//0021 	084D
		BTSS 	STATUS,2 		//0022 	1D03
		LJUMP 	28H 			//0023 	3828

		//;dast-38k-6key.C: 201: {
		//;dast-38k-6key.C: 205: if(ReceiveFinish || repeat)
		BCR 	STATUS,5 		//0024 	1283
		LDR 	4CH,0 			//0025 	084C
		BTSC 	STATUS,2 		//0026 	1503
		LJUMP 	21H 			//0027 	3821

		//;dast-38k-6key.C: 206: {
		//;dast-38k-6key.C: 207: ReceiveFinish = 0;
		CLRR 	4CH 			//0028 	014C

		//;dast-38k-6key.C: 210: rdata1 = 0xFF - IRDataTimer[0];
		COMR 	48H,0 			//0029 	0F48
		STR 	53H 			//002A 	01D3

		//;dast-38k-6key.C: 211: rdata2 = 0xFF - IRDataTimer[2];
		COMR 	4AH,0 			//002B 	0F4A
		STR 	54H 			//002C 	01D4

		//;dast-38k-6key.C: 214: if((rdata1 == IRDataTimer[1])&&(rdata2 == IRDataTimer[3]))
		LDR 	49H,0 			//002D 	0849
		XORWR 	53H,0 			//002E 	0453
		BTSS 	STATUS,2 		//002F 	1D03
		LJUMP 	83H 			//0030 	3883
		LDR 	4BH,0 			//0031 	084B
		XORWR 	54H,0 			//0032 	0454
		BTSS 	STATUS,2 		//0033 	1D03
		LJUMP 	83H 			//0034 	3883

		//;dast-38k-6key.C: 215: {
		//;dast-38k-6key.C: 219: if( rdata2==0xED && repeat==0)
		LDWI 	EDH 			//0035 	2AED
		XORWR 	54H,0 			//0036 	0454
		BTSS 	STATUS,2 		//0037 	1D03
		LJUMP 	83H 			//0038 	3883
		LDR 	4DH,0 			//0039 	084D
		BTSS 	STATUS,2 		//003A 	1D03
		LJUMP 	83H 			//003B 	3883

		//;dast-38k-6key.C: 220: {
		//;dast-38k-6key.C: 221: Set++;
		INCR	55H,1 			//003C 	09D5

		//;dast-38k-6key.C: 222: if(Set==1)
		DECRSZ 	55H,0 		//003D 	0E55
		LJUMP 	48H 			//003E 	3848

		//;dast-38k-6key.C: 223: {
		//;dast-38k-6key.C: 224: outpin[0]=0;
		CLRR 	40H 			//003F 	0140

		//;dast-38k-6key.C: 225: outpin[1]=0;
		CLRR 	41H 			//0040 	0141

		//;dast-38k-6key.C: 226: outpin[2]=0;
		CLRR 	42H 			//0041 	0142

		//;dast-38k-6key.C: 227: outpin[3]=0;
		CLRR 	43H 			//0042 	0143

		//;dast-38k-6key.C: 228: outpin[4]=0;
		CLRR 	44H 			//0043 	0144

		//;dast-38k-6key.C: 229: outpin[5]=0;
		CLRR 	45H 			//0044 	0145

		//;dast-38k-6key.C: 230: outpin[6]=0;
		CLRR 	46H 			//0045 	0146

		//;dast-38k-6key.C: 231: outpin[7]=0;
		CLRR 	47H 			//0046 	0147

		//;dast-38k-6key.C: 232: }
		LJUMP 	59H 			//0047 	3859

		//;dast-38k-6key.C: 233: else
		//;dast-38k-6key.C: 234: {
		//;dast-38k-6key.C: 235: outpin[0]=1;
		CLRR 	40H 			//0048 	0140
		INCR	40H,1 			//0049 	09C0

		//;dast-38k-6key.C: 236: outpin[1]=1;
		CLRR 	41H 			//004A 	0141
		INCR	41H,1 			//004B 	09C1

		//;dast-38k-6key.C: 237: outpin[2]=1;
		CLRR 	42H 			//004C 	0142
		INCR	42H,1 			//004D 	09C2

		//;dast-38k-6key.C: 238: outpin[3]=1;
		CLRR 	43H 			//004E 	0143
		INCR	43H,1 			//004F 	09C3

		//;dast-38k-6key.C: 239: outpin[4]=1;
		CLRR 	44H 			//0050 	0144
		INCR	44H,1 			//0051 	09C4

		//;dast-38k-6key.C: 240: outpin[5]=1;
		CLRR 	45H 			//0052 	0145
		INCR	45H,1 			//0053 	09C5

		//;dast-38k-6key.C: 241: outpin[6]=1;
		CLRR 	46H 			//0054 	0146
		INCR	46H,1 			//0055 	09C6

		//;dast-38k-6key.C: 242: outpin[7]=1;
		CLRR 	47H 			//0056 	0147
		INCR	47H,1 			//0057 	09C7

		//;dast-38k-6key.C: 243: Set=0;
		CLRR 	55H 			//0058 	0155

		//;dast-38k-6key.C: 244: }
		//;dast-38k-6key.C: 249: PA0=0;
		BCR 	5H,0 			//0059 	1005

		//;dast-38k-6key.C: 250: for (int E = 0; E < 8; E++){
		CLRR 	51H 			//005A 	0151
		CLRR 	52H 			//005B 	0152

		//;dast-38k-6key.C: 252: if(outpin[E]==0) PA1=0 ;
		BCR 	STATUS,5 		//005C 	1283
		LDR 	51H,0 			//005D 	0851
		ADDWI 	40H 			//005E 	2740
		STR 	FSR 			//005F 	0184
		BCR 	STATUS,7 		//0060 	1383
		LDR 	INDF,0 			//0061 	0800
		BTSC 	STATUS,2 		//0062 	1503
		BCR 	5H,1 			//0063 	1085

		//;dast-38k-6key.C: 253: if(outpin[E]==1) PA1=1 ;
		LDR 	51H,0 			//0064 	0851
		ADDWI 	40H 			//0065 	2740
		STR 	FSR 			//0066 	0184
		DECRSZ 	INDF,0 		//0067 	0E00
		LJUMP 	6AH 			//0068 	386A
		BSR 	5H,1 			//0069 	1885

		//;dast-38k-6key.C: 255: DelayMs(5);
		LDWI 	5H 			//006A 	2A05
		LCALL 	DBH 			//006B 	30DB

		//;dast-38k-6key.C: 256: PA5=1;
		BSR 	5H,5 			//006C 	1A85

		//;dast-38k-6key.C: 257: DelayMs(5);
		LDWI 	5H 			//006D 	2A05
		LCALL 	DBH 			//006E 	30DB

		//;dast-38k-6key.C: 258: PA5=0;
		BCR 	5H,5 			//006F 	1285
		INCR	51H,1 			//0070 	09D1
		BTSC 	STATUS,2 		//0071 	1503
		INCR	52H,1 			//0072 	09D2
		LDR 	52H,0 			//0073 	0852
		XORWI 	80H 			//0074 	2680
		STR 	7FH 			//0075 	01FF
		LDWI 	80H 			//0076 	2A80
		SUBWR 	7FH,0 			//0077 	0C7F
		BTSS 	STATUS,2 		//0078 	1D03
		LJUMP 	7CH 			//0079 	387C
		LDWI 	8H 			//007A 	2A08
		SUBWR 	51H,0 			//007B 	0C51

		//;dast-38k-6key.C: 260: }
		//;dast-38k-6key.C: 262: PA0=1;
		BCR 	STATUS,5 		//007C 	1283
		BTSS 	STATUS,0 		//007D 	1C03
		LJUMP 	5DH 			//007E 	385D
		BSR 	5H,0 			//007F 	1805

		//;dast-38k-6key.C: 263: DelayMs(20);
		LDWI 	14H 			//0080 	2A14
		LCALL 	DBH 			//0081 	30DB

		//;dast-38k-6key.C: 264: PA0=0;
		BCR 	5H,0 			//0082 	1005

		//;dast-38k-6key.C: 303: rdata2=0;
		CLRR 	54H 			//0083 	0154

		//;dast-38k-6key.C: 304: repeat=0;
		CLRR 	4DH 			//0084 	014D
		LJUMP 	24H 			//0085 	3824

		//;dast-38k-6key.C: 83: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//0086 	1A83
		BTSS 	CH,1 			//0087 	1C8C
		LJUMP 	D2H 			//0088 	38D2
		BCR 	STATUS,5 		//0089 	1283
		BTSS 	CH,1 			//008A 	1C8C
		LJUMP 	D2H 			//008B 	38D2

		//;dast-38k-6key.C: 84: {
		//;dast-38k-6key.C: 86: TMR2IF = 0;
		BCR 	CH,1 			//008C 	108C

		//;dast-38k-6key.C: 87: TMR2IE = 1;
		BSR 	STATUS,5 		//008D 	1A83
		BSR 	CH,1 			//008E 	188C

		//;dast-38k-6key.C: 95: if(ir_timer){
		LDR 	77H,0 			//008F 	0877
		BTSS 	STATUS,2 		//0090 	1D03

		//;dast-38k-6key.C: 96: IRbitTime++;
		INCR	75H,1 			//0091 	09F5

		//;dast-38k-6key.C: 101: }
		//;dast-38k-6key.C: 102: }
		//;dast-38k-6key.C: 104: if(ir_status != PA4){
		//;dast-38k-6key.C: 97: if(IRbitTime > 1600)
		LDWI 	0H 			//0092 	2A00
		BCR 	STATUS,5 		//0093 	1283
		BTSC 	5H,4 			//0094 	1605
		LDWI 	1H 			//0095 	2A01
		XORWR 	78H,0 			//0096 	0478
		BTSC 	STATUS,2 		//0097 	1503
		LJUMP 	D2H 			//0098 	38D2

		//;dast-38k-6key.C: 105: ir_status=PA4;
		LDWI 	0H 			//0099 	2A00
		BTSC 	5H,4 			//009A 	1605
		LDWI 	1H 			//009B 	2A01
		STR 	78H 			//009C 	01F8

		//;dast-38k-6key.C: 107: if(ir_status==0){
		LDR 	78H,0 			//009D 	0878
		BTSS 	STATUS,2 		//009E 	1D03
		LJUMP 	D2H 			//009F 	38D2
		LDWI 	BFH 			//00A0 	2ABF

		//;dast-38k-6key.C: 109: ir_timer = 1;
		CLRR 	77H 			//00A1 	0177
		INCR	77H,1 			//00A2 	09F7

		//;dast-38k-6key.C: 111: if(IRbitTime > 190)
		SUBWR 	75H,0 			//00A3 	0C75
		BTSS 	STATUS,0 		//00A4 	1C03
		LJUMP 	ADH 			//00A5 	38AD

		//;dast-38k-6key.C: 112: {
		//;dast-38k-6key.C: 113: IRDataTimer[0] = 0;
		CLRR 	48H 			//00A6 	0148

		//;dast-38k-6key.C: 114: IRDataTimer[1] = 0;
		CLRR 	49H 			//00A7 	0149

		//;dast-38k-6key.C: 115: IRDataTimer[2] = 0;
		CLRR 	4AH 			//00A8 	014A

		//;dast-38k-6key.C: 116: IRDataTimer[3] = 0;
		CLRR 	4BH 			//00A9 	014B

		//;dast-38k-6key.C: 117: IRbitNum = 0;
		CLRR 	76H 			//00AA 	0176

		//;dast-38k-6key.C: 118: bitdata = 0x00;
		CLRR 	79H 			//00AB 	0179

		//;dast-38k-6key.C: 119: }
		LJUMP 	C1H 			//00AC 	38C1

		//;dast-38k-6key.C: 120: else if(IRbitTime > 150)
		LDWI 	97H 			//00AD 	2A97
		SUBWR 	75H,0 			//00AE 	0C75
		BTSS 	STATUS,0 		//00AF 	1C03
		LJUMP 	B7H 			//00B0 	38B7

		//;dast-38k-6key.C: 121: {
		//;dast-38k-6key.C: 122: if(ReceiveFinish==0)repeat=1;
		LDR 	4CH,0 			//00B1 	084C
		BTSS 	STATUS,2 		//00B2 	1D03
		LJUMP 	C1H 			//00B3 	38C1
		CLRR 	4DH 			//00B4 	014D
		INCR	4DH,1 			//00B5 	09CD
		LJUMP 	C1H 			//00B6 	38C1

		//;dast-38k-6key.C: 124: else if(IRbitTime > 30)
		LDWI 	1FH 			//00B7 	2A1F
		SUBWR 	75H,0 			//00B8 	0C75
		BTSS 	STATUS,0 		//00B9 	1C03
		LJUMP 	C1H 			//00BA 	38C1

		//;dast-38k-6key.C: 125: {
		//;dast-38k-6key.C: 126: IRDataTimer[IRbitNum-1] |= bitdata;
		LDR 	76H,0 			//00BB 	0876
		ADDWI 	47H 			//00BC 	2747
		STR 	FSR 			//00BD 	0184
		LDR 	79H,0 			//00BE 	0879
		BCR 	STATUS,7 		//00BF 	1383
		IORWR 	INDF,1 		//00C0 	0380

		//;dast-38k-6key.C: 127: }
		//;dast-38k-6key.C: 129: IRbitTime = 0;
		CLRR 	75H 			//00C1 	0175

		//;dast-38k-6key.C: 130: bitdata<<=1;
		BCR 	STATUS,0 		//00C2 	1003
		RLR 	79H,1 			//00C3 	05F9

		//;dast-38k-6key.C: 131: if(bitdata == 0)
		LDR 	79H,0 			//00C4 	0879
		BTSS 	STATUS,2 		//00C5 	1D03
		LJUMP 	CAH 			//00C6 	38CA

		//;dast-38k-6key.C: 132: {
		//;dast-38k-6key.C: 133: bitdata = 0x01;
		CLRR 	79H 			//00C7 	0179
		INCR	79H,1 			//00C8 	09F9

		//;dast-38k-6key.C: 134: IRbitNum++;
		INCR	76H,1 			//00C9 	09F6

		//;dast-38k-6key.C: 135: }
		//;dast-38k-6key.C: 136: if(IRbitNum > 4)
		LDWI 	5H 			//00CA 	2A05
		SUBWR 	76H,0 			//00CB 	0C76
		BTSS 	STATUS,0 		//00CC 	1C03
		LJUMP 	D2H 			//00CD 	38D2

		//;dast-38k-6key.C: 137: {
		//;dast-38k-6key.C: 138: IRbitNum = 0;
		CLRR 	76H 			//00CE 	0176

		//;dast-38k-6key.C: 139: ir_timer = 0;
		CLRR 	77H 			//00CF 	0177

		//;dast-38k-6key.C: 140: ReceiveFinish = 1;
		CLRR 	4CH 			//00D0 	014C
		INCR	4CH,1 			//00D1 	09CC
		LDR 	72H,0 			//00D2 	0872
		STR 	PCLATH 			//00D3 	018A
		LDR 	71H,0 			//00D4 	0871
		STR 	FSR 			//00D5 	0184
		SWAPR 	70H,0 			//00D6 	0770
		STR 	STATUS 			//00D7 	0183
		SWAPR 	7EH,1 			//00D8 	07FE
		SWAPR 	7EH,0 			//00D9 	077E
		RETI		 			//00DA 	0009
		STR 	4EH 			//00DB 	01CE

		//;dast-38k-6key.C: 51: unsigned char a,b;
		//;dast-38k-6key.C: 52: for(a=0;a<Time;a++)
		CLRR 	4FH 			//00DC 	014F
		LDR 	4EH,0 			//00DD 	084E
		SUBWR 	4FH,0 			//00DE 	0C4F
		BTSC 	STATUS,0 		//00DF 	1403
		RET		 					//00E0 	0004

		//;dast-38k-6key.C: 53: {
		//;dast-38k-6key.C: 54: for(b=0;b<5;b++)
		CLRR 	50H 			//00E1 	0150

		//;dast-38k-6key.C: 55: {
		//;dast-38k-6key.C: 56: DelayUs(98);
		LDWI 	62H 			//00E2 	2A62
		LCALL 	107H 			//00E3 	3107
		LDWI 	5H 			//00E4 	2A05
		BCR 	STATUS,5 		//00E5 	1283
		INCR	50H,1 			//00E6 	09D0
		SUBWR 	50H,0 			//00E7 	0C50
		BTSS 	STATUS,0 		//00E8 	1C03
		LJUMP 	E2H 			//00E9 	38E2
		INCR	4FH,1 			//00EA 	09CF
		LJUMP 	DDH 			//00EB 	38DD

		//;dast-38k-6key.C: 158: OSCCON = 0B11110000;
		LDWI 	F0H 			//00EC 	2AF0
		BSR 	STATUS,5 		//00ED 	1A83
		STR 	FH 			//00EE 	018F

		//;dast-38k-6key.C: 160: INTCON = 0;
		CLRR 	INTCON 			//00EF 	010B

		//;dast-38k-6key.C: 161: OPTION = 0B00001000;
		LDWI 	8H 			//00F0 	2A08
		STR 	1H 			//00F1 	0181

		//;dast-38k-6key.C: 163: PORTA = 0B00000000;
		BCR 	STATUS,5 		//00F2 	1283
		CLRR 	5H 			//00F3 	0105

		//;dast-38k-6key.C: 164: TRISA = 0B00010000;
		LDWI 	10H 			//00F4 	2A10
		BSR 	STATUS,5 		//00F5 	1A83
		STR 	5H 			//00F6 	0185

		//;dast-38k-6key.C: 166: WPUA = 0B00000000;
		CLRR 	15H 			//00F7 	0115

		//;dast-38k-6key.C: 168: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//00F8 	1283
		CLRR 	1BH 			//00F9 	011B
		RET		 					//00FA 	0004

		//;dast-38k-6key.C: 174: T2CON = 0B00000001;
		LDWI 	1H 			//00FB 	2A01
		STR 	12H 			//00FC 	0192

		//;dast-38k-6key.C: 176: TMR2 = 0;
		CLRR 	11H 			//00FD 	0111

		//;dast-38k-6key.C: 177: PR2 = 63;
		LDWI 	3FH 			//00FE 	2A3F
		BSR 	STATUS,5 		//00FF 	1A83
		STR 	12H 			//0100 	0192

		//;dast-38k-6key.C: 178: TMR2IF = 0;
		BCR 	STATUS,5 		//0101 	1283
		BCR 	CH,1 			//0102 	108C

		//;dast-38k-6key.C: 180: TMR2ON = 1;
		BSR 	12H,2 			//0103 	1912

		//;dast-38k-6key.C: 181: PEIE=1;
		BSR 	INTCON,6 		//0104 	1B0B

		//;dast-38k-6key.C: 182: GIE = 1;
		BSR 	INTCON,7 		//0105 	1B8B
		RET		 					//0106 	0004
		STR 	73H 			//0107 	01F3

		//;dast-38k-6key.C: 41: unsigned char a;
		//;dast-38k-6key.C: 42: for(a=0;a<Time;a++)
		CLRR 	74H 			//0108 	0174
		LDR 	73H,0 			//0109 	0873
		SUBWR 	74H,0 			//010A 	0C74
		BTSC 	STATUS,0 		//010B 	1403
		RET		 					//010C 	0004

		//;dast-38k-6key.C: 43: {
		//;dast-38k-6key.C: 44: __nop();
		NOP		 					//010D 	0000
		INCR	74H,1 			//010E 	09F4
		LJUMP 	109H 			//010F 	3909
		CLRWDT	 			//0110 	0001
		CLRR 	INDF 			//0111 	0100
		INCR	FSR,1 			//0112 	0984
		XORWR 	FSR,0 			//0113 	0404
		BTSC 	STATUS,2 		//0114 	1503
		RETW 	0H 			//0115 	2100
		XORWR 	FSR,0 			//0116 	0404
		LJUMP 	111H 			//0117 	3911
			END
