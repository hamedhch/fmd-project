//Deviec:FT62F21X
//-----------------------Variable---------------------------------
		_RXFLAG		EQU		75H
//		main@rdata		EQU		74H
//		WByte@input		EQU		72H
//		WByte@i		EQU		73H
//		WByte@input		EQU		C00000H
//		RByte@Output		EQU		73H
//		RByte@i		EQU		72H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	2CH 			//0009 	382C
		LJUMP 	0BH 			//000A 	380B
		CLRR 	75H 			//000B 	0175
		ORG		000CH
		CLRR 	STATUS 			//000C 	0103
		LJUMP 	61H 			//000D 	3861
		STR 	72H 			//000E 	01F2

		//;test_ft62f21x_UART.C: 140: unsigned char i=8;
		LDWI 	8H 			//000F 	2A08
		STR 	73H 			//0010 	01F3

		//;test_ft62f21x_UART.C: 141: PA4 = 1;
		BCR 	STATUS,5 		//0011 	1283
		BSR 	5H,4 			//0012 	1A05

		//;test_ft62f21x_UART.C: 142: TMR0 = 208;
		LDWI 	D0H 			//0013 	2AD0
		ORG		0014H
		STR 	1H 			//0014 	0181

		//;test_ft62f21x_UART.C: 143: T0IE = 1;
		BSR 	INTCON,5 		//0015 	1A8B

		//;test_ft62f21x_UART.C: 144: WaitTF0();
		LCALL 	8FH 			//0016 	308F

		//;test_ft62f21x_UART.C: 145: PA4=0;
		BCR 	STATUS,5 		//0017 	1283
		BCR 	5H,4 			//0018 	1205

		//;test_ft62f21x_UART.C: 146: WaitTF0();
		LCALL 	8FH 			//0019 	308F

		//;test_ft62f21x_UART.C: 148: while(i--)
		LJUMP 	25H 			//001A 	3825

		//;test_ft62f21x_UART.C: 149: {
		//;test_ft62f21x_UART.C: 150: if(input&0x01)
		BTSS 	72H,0 			//001B 	1C72
		ORG		001CH
		LJUMP 	20H 			//001C 	3820

		//;test_ft62f21x_UART.C: 151: {
		//;test_ft62f21x_UART.C: 152: PA4=1;
		BCR 	STATUS,5 		//001D 	1283
		BSR 	5H,4 			//001E 	1A05

		//;test_ft62f21x_UART.C: 153: }
		LJUMP 	22H 			//001F 	3822

		//;test_ft62f21x_UART.C: 154: else
		//;test_ft62f21x_UART.C: 155: {
		//;test_ft62f21x_UART.C: 156: PA4 = 0;
		BCR 	STATUS,5 		//0020 	1283
		BCR 	5H,4 			//0021 	1205

		//;test_ft62f21x_UART.C: 157: }
		//;test_ft62f21x_UART.C: 158: WaitTF0();
		LCALL 	8FH 			//0022 	308F

		//;test_ft62f21x_UART.C: 159: input=input>>1;
		BCR 	STATUS,0 		//0023 	1003
		ORG		0024H
		RRR	72H,1 			//0024 	06F2
		DECR 	73H,1 			//0025 	0DF3
		INCRSZ 	73H,0 		//0026 	0A73
		LJUMP 	1BH 			//0027 	381B

		//;test_ft62f21x_UART.C: 160: }
		//;test_ft62f21x_UART.C: 163: PA4=(bit)1;
		BCR 	STATUS,5 		//0028 	1283
		BSR 	5H,4 			//0029 	1A05

		//;test_ft62f21x_UART.C: 164: T0IE=0;
		BCR 	INTCON,5 		//002A 	128B
		RET		 					//002B 	0004
		ORG		002CH

		//;test_ft62f21x_UART.C: 41: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//002C 	168B
		BTSS 	INTCON,2 		//002D 	1D0B
		LJUMP 	34H 			//002E 	3834

		//;test_ft62f21x_UART.C: 42: {
		//;test_ft62f21x_UART.C: 43: TMR0 = 208;
		LDWI 	D0H 			//002F 	2AD0
		BCR 	STATUS,5 		//0030 	1283
		STR 	1H 			//0031 	0181

		//;test_ft62f21x_UART.C: 45: T0IF = 0;
		BCR 	INTCON,2 		//0032 	110B

		//;test_ft62f21x_UART.C: 46: T0IE = 0;
		BCR 	INTCON,5 		//0033 	128B
		ORG		0034H

		//;test_ft62f21x_UART.C: 47: }
		//;test_ft62f21x_UART.C: 50: if(PAIE && PAIF)
		BTSC 	INTCON,3 		//0034 	158B
		BTSS 	INTCON,0 		//0035 	1C0B
		LJUMP 	41H 			//0036 	3841

		//;test_ft62f21x_UART.C: 51: {
		//;test_ft62f21x_UART.C: 52: ReadAPin = PORTA;
		BCR 	STATUS,5 		//0037 	1283
		LDR 	5H,0 			//0038 	0805

		//;test_ft62f21x_UART.C: 53: PAIF = 0;
		BCR 	INTCON,0 		//0039 	100B

		//;test_ft62f21x_UART.C: 54: if(PA2 == 0)
		BTSC 	5H,2 			//003A 	1505
		LJUMP 	41H 			//003B 	3841
		ORG		003CH

		//;test_ft62f21x_UART.C: 55: {
		//;test_ft62f21x_UART.C: 56: PAIE = 0;
		BCR 	INTCON,3 		//003C 	118B

		//;test_ft62f21x_UART.C: 57: IOCA2 =0;
		BSR 	STATUS,5 		//003D 	1A83
		BCR 	16H,2 			//003E 	1116

		//;test_ft62f21x_UART.C: 58: RXFLAG = 1;
		CLRR 	75H 			//003F 	0175
		INCR	75H,1 			//0040 	09F5
		LDR 	71H,0 			//0041 	0871
		STR 	PCLATH 			//0042 	018A
		SWAPR 	70H,0 			//0043 	0770
		ORG		0044H
		STR 	STATUS 			//0044 	0183
		SWAPR 	7EH,1 			//0045 	07FE
		SWAPR 	7EH,0 			//0046 	077E
		RETI		 			//0047 	0009
		LDWI 	8H 			//0048 	2A08

		//;test_ft62f21x_UART.C: 175: unsigned char Output=0;
		CLRR 	73H 			//0049 	0173

		//;test_ft62f21x_UART.C: 176: unsigned char i=8;
		STR 	72H 			//004A 	01F2

		//;test_ft62f21x_UART.C: 177: T0IE=1;
		BSR 	INTCON,5 		//004B 	1A8B
		ORG		004CH

		//;test_ft62f21x_UART.C: 178: TMR0 = 208;
		LDWI 	D0H 			//004C 	2AD0
		BCR 	STATUS,5 		//004D 	1283
		STR 	1H 			//004E 	0181

		//;test_ft62f21x_UART.C: 179: WaitTF0();
		LCALL 	8FH 			//004F 	308F

		//;test_ft62f21x_UART.C: 180: T0IE=1;
		BSR 	INTCON,5 		//0050 	1A8B

		//;test_ft62f21x_UART.C: 181: TMR0 = 208;
		LDWI 	D0H 			//0051 	2AD0
		BCR 	STATUS,5 		//0052 	1283
		STR 	1H 			//0053 	0181
		ORG		0054H

		//;test_ft62f21x_UART.C: 184: while(i--)
		LJUMP 	5AH 			//0054 	385A

		//;test_ft62f21x_UART.C: 185: {
		//;test_ft62f21x_UART.C: 186: Output >>=1;
		BCR 	STATUS,0 		//0055 	1003
		RRR	73H,1 			//0056 	06F3

		//;test_ft62f21x_UART.C: 187: if(PA2)
		BCR 	STATUS,5 		//0057 	1283
		BTSC 	5H,2 			//0058 	1505

		//;test_ft62f21x_UART.C: 188: {
		//;test_ft62f21x_UART.C: 189: Output|=0x80;
		BSR 	73H,7 			//0059 	1BF3

		//;test_ft62f21x_UART.C: 182: WaitTF0();
		LCALL 	8FH 			//005A 	308F
		DECR 	72H,1 			//005B 	0DF2
		ORG		005CH
		INCRSZ 	72H,0 		//005C 	0A72
		LJUMP 	55H 			//005D 	3855

		//;test_ft62f21x_UART.C: 192: }
		//;test_ft62f21x_UART.C: 193: T0IE=0;
		BCR 	INTCON,5 		//005E 	128B

		//;test_ft62f21x_UART.C: 194: return Output;
		LDR 	73H,0 			//005F 	0873
		RET		 					//0060 	0004

		//;test_ft62f21x_UART.C: 207: POWER_INITIAL();
		LCALL 	72H 			//0061 	3072

		//;test_ft62f21x_UART.C: 209: TIMER0_INITIAL();
		LCALL 	88H 			//0062 	3088

		//;test_ft62f21x_UART.C: 210: PA2_Level_Change_INITIAL();
		LCALL 	7FH 			//0063 	307F
		ORG		0064H

		//;test_ft62f21x_UART.C: 211: GIE = 1;
		BSR 	INTCON,7 		//0064 	1B8B

		//;test_ft62f21x_UART.C: 212: T0IE = 1;
		BSR 	INTCON,5 		//0065 	1A8B

		//;test_ft62f21x_UART.C: 214: {
		//;test_ft62f21x_UART.C: 215: if(RXFLAG)
		LDR 	75H,0 			//0066 	0875
		BTSC 	STATUS,2 		//0067 	1503
		LJUMP 	66H 			//0068 	3866

		//;test_ft62f21x_UART.C: 216: {
		//;test_ft62f21x_UART.C: 217: rdata = RByte();
		LCALL 	48H 			//0069 	3048
		STR 	74H 			//006A 	01F4

		//;test_ft62f21x_UART.C: 218: WByte(rdata);
		LDR 	74H,0 			//006B 	0874
		ORG		006CH
		LCALL 	EH 			//006C 	300E

		//;test_ft62f21x_UART.C: 220: IOCA2 =1;
		BSR 	STATUS,5 		//006D 	1A83
		BSR 	16H,2 			//006E 	1916

		//;test_ft62f21x_UART.C: 221: PAIE =1;
		BSR 	INTCON,3 		//006F 	198B

		//;test_ft62f21x_UART.C: 222: RXFLAG = 0;
		CLRR 	75H 			//0070 	0175
		LJUMP 	66H 			//0071 	3866

		//;test_ft62f21x_UART.C: 70: OSCCON = 0B01110000;
		LDWI 	70H 			//0072 	2A70
		BSR 	STATUS,5 		//0073 	1A83
		ORG		0074H
		STR 	FH 			//0074 	018F

		//;test_ft62f21x_UART.C: 71: INTCON = 0;
		CLRR 	INTCON 			//0075 	010B

		//;test_ft62f21x_UART.C: 73: TRISA = 1<<2;
		LDWI 	4H 			//0076 	2A04
		STR 	5H 			//0077 	0185

		//;test_ft62f21x_UART.C: 74: PSRCA = 0;
		CLRR 	8H 			//0078 	0108

		//;test_ft62f21x_UART.C: 80: PSINKA = 0;
		CLRR 	17H 			//0079 	0117

		//;test_ft62f21x_UART.C: 81: PORTA = 0;
		BCR 	STATUS,5 		//007A 	1283
		CLRR 	5H 			//007B 	0105
		ORG		007CH

		//;test_ft62f21x_UART.C: 82: WPUA = 1<<2;
		BSR 	STATUS,5 		//007C 	1A83
		STR 	15H 			//007D 	0195
		RET		 					//007E 	0004

		//;test_ft62f21x_UART.C: 114: TRISA2 =1;
		BSR 	STATUS,5 		//007F 	1A83
		BSR 	5H,2 			//0080 	1905

		//;test_ft62f21x_UART.C: 115: ReadAPin = PORTA;
		BCR 	STATUS,5 		//0081 	1283
		LDR 	5H,0 			//0082 	0805

		//;test_ft62f21x_UART.C: 116: PAIF =0;
		BCR 	INTCON,0 		//0083 	100B
		ORG		0084H

		//;test_ft62f21x_UART.C: 117: IOCA2 =1;
		BSR 	STATUS,5 		//0084 	1A83
		BSR 	16H,2 			//0085 	1916

		//;test_ft62f21x_UART.C: 118: PAIE =1;
		BSR 	INTCON,3 		//0086 	198B
		RET		 					//0087 	0004

		//;test_ft62f21x_UART.C: 94: OPTION = 0B00000000;
		CLRR 	1H 			//0088 	0101

		//;test_ft62f21x_UART.C: 101: TMR0 = 208;
		LDWI 	D0H 			//0089 	2AD0
		BCR 	STATUS,5 		//008A 	1283
		STR 	1H 			//008B 	0181
		ORG		008CH

		//;test_ft62f21x_UART.C: 102: T0IF = 0;
		BCR 	INTCON,2 		//008C 	110B

		//;test_ft62f21x_UART.C: 103: T0ON = 1;
		BSR 	1FH,3 			//008D 	199F
		RET		 					//008E 	0004

		//;test_ft62f21x_UART.C: 128: while(T0IE);
		BTSC 	INTCON,5 		//008F 	168B
		LJUMP 	8FH 			//0090 	388F

		//;test_ft62f21x_UART.C: 129: T0IE=1;
		BSR 	INTCON,5 		//0091 	1A8B
		RET		 					//0092 	0004
			END
