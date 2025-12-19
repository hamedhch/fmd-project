//Deviec:FT62F21X
//-----------------------Variable---------------------------------
		_IRbitNum		EQU		78H
		_IRbitTime		EQU		77H
		_IRDataTimer		EQU		70H
		_bitdata		EQU		7CH
		_ReceiveFinish		EQU		76H
		_rdata1		EQU		75H
		_rdata2		EQU		74H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0CH 			//0000 	380C
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	79H 			//0006 	01F9
		LDR 	FSR,0 			//0007 	0804
		STR 	7AH 			//0008 	01FA
		LDR 	PCLATH,0 		//0009 	080A
		STR 	7BH 			//000A 	01FB
		LJUMP 	1AH 			//000B 	381A
		ORG		000CH
		LJUMP 	0DH 			//000C 	380D
		LDWI 	1H 			//000D 	2A01
		STR 	7CH 			//000E 	01FC
		CLRR 	70H 			//000F 	0170
		CLRR 	71H 			//0010 	0171
		CLRR 	72H 			//0011 	0172
		CLRR 	73H 			//0012 	0173
		CLRR 	74H 			//0013 	0174
		ORG		0014H
		CLRR 	75H 			//0014 	0175
		CLRR 	76H 			//0015 	0176
		CLRR 	77H 			//0016 	0177
		CLRR 	78H 			//0017 	0178
		CLRR 	STATUS 			//0018 	0103
		LJUMP 	5FH 			//0019 	385F

		//;test_ft62f21x_IR_Receive.C: 47: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//001A 	168B
		BTSS 	INTCON,2 		//001B 	1D0B
		ORG		001CH
		LJUMP 	28H 			//001C 	3828

		//;test_ft62f21x_IR_Receive.C: 48: {
		//;test_ft62f21x_IR_Receive.C: 49: TMR0 = 140;
		LDWI 	8CH 			//001D 	2A8C
		BCR 	STATUS,5 		//001E 	1283
		STR 	1H 			//001F 	0181

		//;test_ft62f21x_IR_Receive.C: 51: T0IF = 0;
		BCR 	INTCON,2 		//0020 	110B
		LDWI 	33H 			//0021 	2A33

		//;test_ft62f21x_IR_Receive.C: 52: IRbitTime++;
		INCR	77H,1 			//0022 	09F7

		//;test_ft62f21x_IR_Receive.C: 53: if(IRbitTime > 50)
		SUBWR 	77H,0 			//0023 	0C77
		ORG		0024H
		BTSS 	STATUS,0 		//0024 	1C03
		LJUMP 	28H 			//0025 	3828

		//;test_ft62f21x_IR_Receive.C: 54: {
		//;test_ft62f21x_IR_Receive.C: 55: T0IE = 0;
		BCR 	INTCON,5 		//0026 	128B

		//;test_ft62f21x_IR_Receive.C: 56: IRbitTime = 0;
		CLRR 	77H 			//0027 	0177

		//;test_ft62f21x_IR_Receive.C: 57: }
		//;test_ft62f21x_IR_Receive.C: 58: }
		//;test_ft62f21x_IR_Receive.C: 61: if(PAIE && PAIF)
		BTSC 	INTCON,3 		//0028 	158B
		BTSS 	INTCON,0 		//0029 	1C0B
		LJUMP 	56H 			//002A 	3856

		//;test_ft62f21x_IR_Receive.C: 62: {
		//;test_ft62f21x_IR_Receive.C: 63: ReadAPin = PORTA;
		BCR 	STATUS,5 		//002B 	1283
		ORG		002CH
		LDR 	5H,0 			//002C 	0805

		//;test_ft62f21x_IR_Receive.C: 64: PAIF = 0;
		BCR 	INTCON,0 		//002D 	100B

		//;test_ft62f21x_IR_Receive.C: 65: if(PA2 == 0)
		BTSC 	5H,2 			//002E 	1505
		LJUMP 	56H 			//002F 	3856

		//;test_ft62f21x_IR_Receive.C: 66: {
		//;test_ft62f21x_IR_Receive.C: 67: T0IE = 1;
		BSR 	INTCON,5 		//0030 	1A8B

		//;test_ft62f21x_IR_Receive.C: 68: if(IRbitTime > 21)
		LDWI 	16H 			//0031 	2A16
		SUBWR 	77H,0 			//0032 	0C77
		BTSS 	STATUS,0 		//0033 	1C03
		ORG		0034H
		LJUMP 	3CH 			//0034 	383C

		//;test_ft62f21x_IR_Receive.C: 69: {
		//;test_ft62f21x_IR_Receive.C: 70: IRDataTimer[0] = 0;
		CLRR 	70H 			//0035 	0170

		//;test_ft62f21x_IR_Receive.C: 71: IRDataTimer[1] = 0;
		CLRR 	71H 			//0036 	0171

		//;test_ft62f21x_IR_Receive.C: 72: IRDataTimer[2] = 0;
		CLRR 	72H 			//0037 	0172

		//;test_ft62f21x_IR_Receive.C: 73: IRDataTimer[3] = 0;
		CLRR 	73H 			//0038 	0173

		//;test_ft62f21x_IR_Receive.C: 74: IRbitNum = 0;
		CLRR 	78H 			//0039 	0178

		//;test_ft62f21x_IR_Receive.C: 75: bitdata = 0x00;
		CLRR 	7CH 			//003A 	017C

		//;test_ft62f21x_IR_Receive.C: 76: }
		LJUMP 	45H 			//003B 	3845
		ORG		003CH

		//;test_ft62f21x_IR_Receive.C: 77: else if(IRbitTime > 3)
		LDWI 	4H 			//003C 	2A04
		SUBWR 	77H,0 			//003D 	0C77
		BTSS 	STATUS,0 		//003E 	1C03
		LJUMP 	45H 			//003F 	3845

		//;test_ft62f21x_IR_Receive.C: 78: {
		//;test_ft62f21x_IR_Receive.C: 79: IRDataTimer[IRbitNum-1] |= bitdata;
		LDR 	78H,0 			//0040 	0878
		ADDWI 	6FH 			//0041 	276F
		STR 	FSR 			//0042 	0184
		LDR 	7CH,0 			//0043 	087C
		ORG		0044H
		IORWR 	INDF,1 		//0044 	0380

		//;test_ft62f21x_IR_Receive.C: 80: }
		//;test_ft62f21x_IR_Receive.C: 81: IRbitTime = 0;
		CLRR 	77H 			//0045 	0177

		//;test_ft62f21x_IR_Receive.C: 82: bitdata<<=1;
		BCR 	STATUS,0 		//0046 	1003
		RLR 	7CH,1 			//0047 	05FC

		//;test_ft62f21x_IR_Receive.C: 83: if(bitdata == 0)
		LDR 	7CH,0 			//0048 	087C
		BTSS 	STATUS,2 		//0049 	1D03
		LJUMP 	4EH 			//004A 	384E

		//;test_ft62f21x_IR_Receive.C: 84: {
		//;test_ft62f21x_IR_Receive.C: 85: bitdata = 0x01;
		CLRR 	7CH 			//004B 	017C
		ORG		004CH
		INCR	7CH,1 			//004C 	09FC

		//;test_ft62f21x_IR_Receive.C: 86: IRbitNum++;
		INCR	78H,1 			//004D 	09F8

		//;test_ft62f21x_IR_Receive.C: 87: }
		//;test_ft62f21x_IR_Receive.C: 88: if(IRbitNum > 4)
		LDWI 	5H 			//004E 	2A05
		SUBWR 	78H,0 			//004F 	0C78
		BTSS 	STATUS,0 		//0050 	1C03
		LJUMP 	56H 			//0051 	3856

		//;test_ft62f21x_IR_Receive.C: 89: {
		//;test_ft62f21x_IR_Receive.C: 90: IRbitNum = 0;
		CLRR 	78H 			//0052 	0178

		//;test_ft62f21x_IR_Receive.C: 91: T0IE = 0;
		BCR 	INTCON,5 		//0053 	128B
		ORG		0054H

		//;test_ft62f21x_IR_Receive.C: 92: ReceiveFinish = 1;
		CLRR 	76H 			//0054 	0176
		INCR	76H,1 			//0055 	09F6
		LDR 	7BH,0 			//0056 	087B
		STR 	PCLATH 			//0057 	018A
		LDR 	7AH,0 			//0058 	087A
		STR 	FSR 			//0059 	0184
		SWAPR 	79H,0 			//005A 	0779
		STR 	STATUS 			//005B 	0183
		ORG		005CH
		SWAPR 	7EH,1 			//005C 	07FE
		SWAPR 	7EH,0 			//005D 	077E
		RETI		 			//005E 	0009

		//;test_ft62f21x_IR_Receive.C: 160: POWER_INITIAL();
		LCALL 	77H 			//005F 	3077

		//;test_ft62f21x_IR_Receive.C: 161: TIMER0_INITIAL();
		LCALL 	8FH 			//0060 	308F

		//;test_ft62f21x_IR_Receive.C: 162: PA2_Level_Change_INITIAL();
		LCALL 	86H 			//0061 	3086

		//;test_ft62f21x_IR_Receive.C: 163: GIE = 1;
		BSR 	INTCON,7 		//0062 	1B8B

		//;test_ft62f21x_IR_Receive.C: 165: {
		//;test_ft62f21x_IR_Receive.C: 166: if(ReceiveFinish)
		LDR 	76H,0 			//0063 	0876
		ORG		0064H
		BTSC 	STATUS,2 		//0064 	1503
		LJUMP 	63H 			//0065 	3863

		//;test_ft62f21x_IR_Receive.C: 167: {
		//;test_ft62f21x_IR_Receive.C: 168: ReceiveFinish = 0;
		CLRR 	76H 			//0066 	0176

		//;test_ft62f21x_IR_Receive.C: 169: rdata1 = 0xFF - IRDataTimer[0];
		COMR 	70H,0 			//0067 	0F70
		STR 	75H 			//0068 	01F5

		//;test_ft62f21x_IR_Receive.C: 170: rdata2 = 0xFF - IRDataTimer[2];
		COMR 	72H,0 			//0069 	0F72
		STR 	74H 			//006A 	01F4

		//;test_ft62f21x_IR_Receive.C: 171: if((rdata1 == IRDataTimer[1])&&(rdata2 == IRDataTimer[
		//+                          3]))
		LDR 	71H,0 			//006B 	0871
		ORG		006CH
		XORWR 	75H,0 			//006C 	0475
		BTSS 	STATUS,2 		//006D 	1D03
		LJUMP 	63H 			//006E 	3863
		LDR 	73H,0 			//006F 	0873
		XORWR 	74H,0 			//0070 	0474
		BTSS 	STATUS,2 		//0071 	1D03
		LJUMP 	63H 			//0072 	3863

		//;test_ft62f21x_IR_Receive.C: 172: {
		//;test_ft62f21x_IR_Receive.C: 173: PA4 = ~PA4;
		LDWI 	10H 			//0073 	2A10
		ORG		0074H
		BCR 	STATUS,5 		//0074 	1283
		XORWR 	5H,1 			//0075 	0485
		LJUMP 	63H 			//0076 	3863

		//;test_ft62f21x_IR_Receive.C: 106: OSCCON = 0B01110000;
		LDWI 	70H 			//0077 	2A70
		BSR 	STATUS,5 		//0078 	1A83
		STR 	FH 			//0079 	018F

		//;test_ft62f21x_IR_Receive.C: 108: INTCON = 0;
		CLRR 	INTCON 			//007A 	010B

		//;test_ft62f21x_IR_Receive.C: 110: PORTA = 0B00000000;
		BCR 	STATUS,5 		//007B 	1283
		ORG		007CH
		CLRR 	5H 			//007C 	0105

		//;test_ft62f21x_IR_Receive.C: 111: TRISA = 0B00000100;
		LDWI 	4H 			//007D 	2A04
		BSR 	STATUS,5 		//007E 	1A83
		STR 	5H 			//007F 	0185

		//;test_ft62f21x_IR_Receive.C: 112: WPUA = 0B00000100;
		STR 	15H 			//0080 	0195

		//;test_ft62f21x_IR_Receive.C: 114: OPTION = 0B00001000;
		LDWI 	8H 			//0081 	2A08
		STR 	1H 			//0082 	0181

		//;test_ft62f21x_IR_Receive.C: 116: MSCON = 0B00000000;
		BCR 	STATUS,5 		//0083 	1283
		ORG		0084H
		CLRR 	1BH 			//0084 	011B
		RET		 					//0085 	0004

		//;test_ft62f21x_IR_Receive.C: 144: TRISA2 =1;
		BSR 	STATUS,5 		//0086 	1A83
		BSR 	5H,2 			//0087 	1905

		//;test_ft62f21x_IR_Receive.C: 145: ReadAPin = PORTA;
		BCR 	STATUS,5 		//0088 	1283
		LDR 	5H,0 			//0089 	0805

		//;test_ft62f21x_IR_Receive.C: 146: PAIF =0;
		BCR 	INTCON,0 		//008A 	100B

		//;test_ft62f21x_IR_Receive.C: 147: IOCA2 =1;
		BSR 	STATUS,5 		//008B 	1A83
		ORG		008CH
		BSR 	16H,2 			//008C 	1916

		//;test_ft62f21x_IR_Receive.C: 148: PAIE =1;
		BSR 	INTCON,3 		//008D 	198B
		RET		 					//008E 	0004

		//;test_ft62f21x_IR_Receive.C: 126: OPTION = 0B00000011;
		LDWI 	3H 			//008F 	2A03
		BSR 	STATUS,5 		//0090 	1A83
		STR 	1H 			//0091 	0181

		//;test_ft62f21x_IR_Receive.C: 133: TMR0 = 140;
		LDWI 	8CH 			//0092 	2A8C
		BCR 	STATUS,5 		//0093 	1283
		ORG		0094H
		STR 	1H 			//0094 	0181

		//;test_ft62f21x_IR_Receive.C: 134: T0IF = 0;
		BCR 	INTCON,2 		//0095 	110B
		RET		 					//0096 	0004
			END
