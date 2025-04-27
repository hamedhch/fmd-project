//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_AAA		EQU		48H
		_Edata1A		EQU		52H
		_Edata2A		EQU		51H
		_Edata1B		EQU		50H
		_Edata2B		EQU		4FH
		_Edata1C		EQU		4EH
		_Edata2C		EQU		4DH
		_powerconter		EQU		5DH
		_conterlern		EQU		46H
		_lern		EQU		44H
		_ir_status		EQU		73H
		_ir_timer		EQU		4CH
		_repeat		EQU		4BH
		_IRbitNum		EQU		72H
		_IRbitTime		EQU		70H
		_IRDataTimer		EQU		40H
		_bitdata		EQU		78H
		_ReceiveFinish		EQU		4AH
//		main@rdata2		EQU		5CH
//		main@rdata1		EQU		5BH
//		EEPROMwrite@EEAddr		EQU		53H
//		EEPROMwrite@Data		EQU		55H
//		EEPROMread@ReEEPROMread		EQU		55H
//		EEPROMread@EEAddr		EQU		53H
//		DelayS@Time		EQU		58H
//		DelayS@b		EQU		5AH
//		DelayS@a		EQU		59H
//		DelayS@Time		EQU		58H
//		DelayS@Time		EQU		58H
//		DelayMs@Time		EQU		55H
//		DelayMs@b		EQU		57H
//		DelayMs@a		EQU		56H
//		DelayMs@Time		EQU		55H
//		DelayMs@Time		EQU		55H
//		DelayUs@Time		EQU		53H
//		DelayUs@a		EQU		54H
//		DelayUs@Time		EQU		53H
//		DelayUs@Time		EQU		53H
//-----------------------Variable END---------------------------------

		LJUMP 	0FH 			//0000 	380F
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	74H 			//0006 	01F4
		LDR 	FSR,0 			//0007 	0804
		STR 	75H 			//0008 	01F5
		LDR 	PCLATH,0 		//0009 	080A
		STR 	76H 			//000A 	01F6
		BCR 	STATUS,5 		//000B 	1283
		LDR 	7FH,0 			//000C 	087F
		STR 	77H 			//000D 	01F7
		LJUMP 	14AH 			//000E 	394A
		LJUMP 	10H 			//000F 	3810
		LDWI 	1H 			//0010 	2A01
		STR 	78H 			//0011 	01F8
		LDWI 	40H 			//0012 	2A40
		BCR 	STATUS,7 		//0013 	1383
		STR 	FSR 			//0014 	0184
		LDWI 	53H 			//0015 	2A53
		LCALL 	246H 			//0016 	3246
		LDWI 	70H 			//0017 	2A70
		STR 	FSR 			//0018 	0184
		LDWI 	74H 			//0019 	2A74
		LCALL 	246H 			//001A 	3246
		CLRR 	STATUS 			//001B 	0103
		LJUMP 	1DH 			//001C 	381D

		//;remote-38k-lrn.C: 244: unsigned char rdata1,rdata2;
		//;remote-38k-lrn.C: 246: POWER_INITIAL();
		LCALL 	214H 			//001D 	3214

		//;remote-38k-lrn.C: 249: TIMER0_INITIAL();
		LCALL 	24EH 			//001E 	324E

		//;remote-38k-lrn.C: 250: TIMER2_INITIAL();
		LCALL 	230H 			//001F 	3230

		//;remote-38k-lrn.C: 252: GIE = 1;
		BSR 	INTCON,7 		//0020 	1B8B

		//;remote-38k-lrn.C: 254: PAIE =1;
		BSR 	INTCON,3 		//0021 	198B

		//;remote-38k-lrn.C: 257: TMR2IE = 1;
		BSR 	STATUS,5 		//0022 	1A83
		BSR 	CH,1 			//0023 	188C

		//;remote-38k-lrn.C: 260: PA4=1;
		BCR 	STATUS,5 		//0024 	1283
		BSR 	5H,4 			//0025 	1A05

		//;remote-38k-lrn.C: 261: PA5=1;
		BSR 	5H,5 			//0026 	1A85

		//;remote-38k-lrn.C: 262: PA0=1;
		BSR 	5H,0 			//0027 	1805

		//;remote-38k-lrn.C: 265: powerconter = EEPROMread(0x11);
		LDWI 	11H 			//0028 	2A11
		STR 	53H 			//0029 	01D3
		CLRR 	54H 			//002A 	0154
		LCALL 	223H 			//002B 	3223
		LDR 	54H,0 			//002C 	0854
		STR 	5EH 			//002D 	01DE
		LDR 	53H,0 			//002E 	0853
		STR 	5DH 			//002F 	01DD

		//;remote-38k-lrn.C: 268: if(powerconter <=0 || powerconter >=10 ) powerconter =0, EEPROMw
		//+                          rite(0x11,0);
		IORWR 	5EH,0 			//0030 	035E
		BTSC 	STATUS,2 		//0031 	1503
		LJUMP 	3AH 			//0032 	383A
		LDWI 	0H 			//0033 	2A00
		SUBWR 	5EH,0 			//0034 	0C5E
		LDWI 	AH 			//0035 	2A0A
		BTSC 	STATUS,2 		//0036 	1503
		SUBWR 	5DH,0 			//0037 	0C5D
		BTSS 	STATUS,0 		//0038 	1C03
		LJUMP 	3DH 			//0039 	383D
		LDWI 	11H 			//003A 	2A11
		LCALL 	132H 			//003B 	3132
		LCALL 	1DFH 			//003C 	31DF

		//;remote-38k-lrn.C: 271: powerconter++;
		BCR 	STATUS,5 		//003D 	1283
		INCR	5DH,1 			//003E 	09DD
		BTSC 	STATUS,2 		//003F 	1503
		INCR	5EH,1 			//0040 	09DE

		//;remote-38k-lrn.C: 272: EEPROMwrite(0x11,powerconter);
		LDWI 	11H 			//0041 	2A11
		STR 	53H 			//0042 	01D3
		CLRR 	54H 			//0043 	0154
		LDR 	5EH,0 			//0044 	085E
		STR 	56H 			//0045 	01D6
		LDR 	5DH,0 			//0046 	085D
		STR 	55H 			//0047 	01D5
		LCALL 	1DFH 			//0048 	31DF

		//;remote-38k-lrn.C: 274: if(powerconter >=4 ){
		LDWI 	0H 			//0049 	2A00
		BCR 	STATUS,5 		//004A 	1283
		SUBWR 	5EH,0 			//004B 	0C5E
		LDWI 	4H 			//004C 	2A04
		BTSC 	STATUS,2 		//004D 	1503
		SUBWR 	5DH,0 			//004E 	0C5D
		BTSS 	STATUS,0 		//004F 	1C03
		LJUMP 	6AH 			//0050 	386A

		//;remote-38k-lrn.C: 276: DelayMs(500);
		LDWI 	F4H 			//0051 	2AF4
		LCALL 	204H 			//0052 	3204

		//;remote-38k-lrn.C: 277: PA0=0 , PA5=0 , PA4=0;
		//;remote-38k-lrn.C: 278: DelayMs(400);
		LCALL 	146H 			//0053 	3146
		LCALL 	204H 			//0054 	3204

		//;remote-38k-lrn.C: 279: PA0=1 , PA5=1 , PA4=1;
		BSR 	5H,0 			//0055 	1805
		BSR 	5H,5 			//0056 	1A85
		BSR 	5H,4 			//0057 	1A05

		//;remote-38k-lrn.C: 280: DelayMs(500);
		LDWI 	F4H 			//0058 	2AF4
		LCALL 	204H 			//0059 	3204

		//;remote-38k-lrn.C: 281: PA0=0 , PA5=0 , PA4=0;
		//;remote-38k-lrn.C: 282: DelayMs(400);
		LCALL 	146H 			//005A 	3146
		LCALL 	204H 			//005B 	3204

		//;remote-38k-lrn.C: 283: PA0=1 , PA5=1 , PA4=1;
		BSR 	5H,0 			//005C 	1805
		BSR 	5H,5 			//005D 	1A85
		BSR 	5H,4 			//005E 	1A05

		//;remote-38k-lrn.C: 285: lern=1;
		CLRR 	44H 			//005F 	0144
		INCR	44H,1 			//0060 	09C4
		CLRR 	45H 			//0061 	0145

		//;remote-38k-lrn.C: 286: T0IE = 1;
		BSR 	INTCON,5 		//0062 	1A8B
		LDWI 	11H 			//0063 	2A11

		//;remote-38k-lrn.C: 287: AAA=0;
		CLRR 	48H 			//0064 	0148
		CLRR 	49H 			//0065 	0149

		//;remote-38k-lrn.C: 288: conterlern=0;
		CLRR 	46H 			//0066 	0146
		CLRR 	47H 			//0067 	0147

		//;remote-38k-lrn.C: 290: powerconter =0;
		//;remote-38k-lrn.C: 291: EEPROMwrite(0x11,0);
		LCALL 	132H 			//0068 	3132
		LCALL 	1DFH 			//0069 	31DF

		//;remote-38k-lrn.C: 293: }
		//;remote-38k-lrn.C: 296: DelayS(2);
		LDWI 	2H 			//006A 	2A02
		LCALL 	1F3H 			//006B 	31F3
		LDWI 	11H 			//006C 	2A11

		//;remote-38k-lrn.C: 298: powerconter =0;
		//;remote-38k-lrn.C: 299: EEPROMwrite(0x11,0);
		LCALL 	132H 			//006D 	3132
		LCALL 	1DFH 			//006E 	31DF

		//;remote-38k-lrn.C: 304: Edata1A = EEPROMread(0x21);
		LDWI 	21H 			//006F 	2A21
		BCR 	STATUS,5 		//0070 	1283
		STR 	53H 			//0071 	01D3
		CLRR 	54H 			//0072 	0154
		LCALL 	223H 			//0073 	3223
		LDR 	53H,0 			//0074 	0853
		STR 	52H 			//0075 	01D2

		//;remote-38k-lrn.C: 305: Edata2A = EEPROMread(0x22);
		LDWI 	22H 			//0076 	2A22
		STR 	53H 			//0077 	01D3
		CLRR 	54H 			//0078 	0154
		LCALL 	223H 			//0079 	3223
		LDR 	53H,0 			//007A 	0853
		STR 	51H 			//007B 	01D1

		//;remote-38k-lrn.C: 307: Edata1B = EEPROMread(0x23);
		LDWI 	23H 			//007C 	2A23
		STR 	53H 			//007D 	01D3
		CLRR 	54H 			//007E 	0154
		LCALL 	223H 			//007F 	3223
		LDR 	53H,0 			//0080 	0853
		STR 	50H 			//0081 	01D0

		//;remote-38k-lrn.C: 308: Edata2B = EEPROMread(0x24);
		LDWI 	24H 			//0082 	2A24
		STR 	53H 			//0083 	01D3
		CLRR 	54H 			//0084 	0154
		LCALL 	223H 			//0085 	3223
		LDR 	53H,0 			//0086 	0853
		STR 	4FH 			//0087 	01CF

		//;remote-38k-lrn.C: 310: Edata1C = EEPROMread(0x25);
		LDWI 	25H 			//0088 	2A25
		STR 	53H 			//0089 	01D3
		CLRR 	54H 			//008A 	0154
		LCALL 	223H 			//008B 	3223
		LDR 	53H,0 			//008C 	0853
		STR 	4EH 			//008D 	01CE

		//;remote-38k-lrn.C: 311: Edata2C = EEPROMread(0x26);
		LDWI 	26H 			//008E 	2A26
		STR 	53H 			//008F 	01D3
		CLRR 	54H 			//0090 	0154
		LCALL 	223H 			//0091 	3223
		LDR 	53H,0 			//0092 	0853
		STR 	4DH 			//0093 	01CD

		//;remote-38k-lrn.C: 316: {
		//;remote-38k-lrn.C: 319: if(AAA > 500){
		LDR 	49H,0 			//0094 	0849
		XORWI 	80H 			//0095 	2680
		STR 	7FH 			//0096 	01FF
		LDWI 	81H 			//0097 	2A81
		SUBWR 	7FH,0 			//0098 	0C7F
		BTSS 	STATUS,2 		//0099 	1D03
		LJUMP 	9DH 			//009A 	389D
		LDWI 	F5H 			//009B 	2AF5
		SUBWR 	48H,0 			//009C 	0C48
		BTSS 	STATUS,0 		//009D 	1C03
		LJUMP 	A5H 			//009E 	38A5

		//;remote-38k-lrn.C: 320: T0IE = 0;
		BCR 	INTCON,5 		//009F 	128B

		//;remote-38k-lrn.C: 321: lern = 0;
		BCR 	STATUS,5 		//00A0 	1283
		CLRR 	44H 			//00A1 	0144
		CLRR 	45H 			//00A2 	0145

		//;remote-38k-lrn.C: 322: AAA = 0;
		CLRR 	48H 			//00A3 	0148
		CLRR 	49H 			//00A4 	0149

		//;remote-38k-lrn.C: 323: }
		//;remote-38k-lrn.C: 326: if(ReceiveFinish || repeat)
		BCR 	STATUS,5 		//00A5 	1283
		LDR 	4AH,0 			//00A6 	084A
		BTSC 	STATUS,2 		//00A7 	1503
		LDR 	4BH,0 			//00A8 	084B
		BTSC 	STATUS,2 		//00A9 	1503
		LJUMP 	94H 			//00AA 	3894

		//;remote-38k-lrn.C: 327: {
		//;remote-38k-lrn.C: 328: ReceiveFinish = 0;
		CLRR 	4AH 			//00AB 	014A

		//;remote-38k-lrn.C: 331: rdata1 = 0xFF - IRDataTimer[0];
		COMR 	40H,0 			//00AC 	0F40
		STR 	5BH 			//00AD 	01DB

		//;remote-38k-lrn.C: 332: rdata2 = 0xFF - IRDataTimer[2];
		COMR 	42H,0 			//00AE 	0F42
		STR 	5CH 			//00AF 	01DC

		//;remote-38k-lrn.C: 333: if((rdata1 == IRDataTimer[1])&&(rdata2 == IRDataTimer[3]))
		LDR 	41H,0 			//00B0 	0841
		XORWR 	5BH,0 			//00B1 	045B
		BTSS 	STATUS,2 		//00B2 	1D03
		LJUMP 	130H 			//00B3 	3930
		LDR 	43H,0 			//00B4 	0843
		XORWR 	5CH,0 			//00B5 	045C
		BTSS 	STATUS,2 		//00B6 	1D03
		LJUMP 	130H 			//00B7 	3930

		//;remote-38k-lrn.C: 334: {
		//;remote-38k-lrn.C: 338: if( rdata1==Edata1A && rdata2==Edata2A && lern==0 && repeat==0 )
		LDR 	5BH,0 			//00B8 	085B
		XORWR 	52H,0 			//00B9 	0452
		BTSS 	STATUS,2 		//00BA 	1D03
		LJUMP 	C9H 			//00BB 	38C9
		LDR 	5CH,0 			//00BC 	085C
		XORWR 	51H,0 			//00BD 	0451
		BTSS 	STATUS,2 		//00BE 	1D03
		LJUMP 	C9H 			//00BF 	38C9
		LDR 	44H,0 			//00C0 	0844
		IORWR 	45H,0 			//00C1 	0345
		BTSS 	STATUS,2 		//00C2 	1D03
		LJUMP 	C9H 			//00C3 	38C9
		LDR 	4BH,0 			//00C4 	084B
		BTSS 	STATUS,2 		//00C5 	1D03
		LJUMP 	C9H 			//00C6 	38C9

		//;remote-38k-lrn.C: 339: {
		//;remote-38k-lrn.C: 340: PA0=~PA0;
		LDWI 	1H 			//00C7 	2A01
		XORWR 	5H,1 			//00C8 	0485

		//;remote-38k-lrn.C: 341: }
		//;remote-38k-lrn.C: 342: if( rdata1==Edata1B && rdata2==Edata2B && lern==0 && repeat==0 )
		LDR 	5BH,0 			//00C9 	085B
		XORWR 	50H,0 			//00CA 	0450
		BTSS 	STATUS,2 		//00CB 	1D03
		LJUMP 	DAH 			//00CC 	38DA
		LDR 	5CH,0 			//00CD 	085C
		XORWR 	4FH,0 			//00CE 	044F
		BTSS 	STATUS,2 		//00CF 	1D03
		LJUMP 	DAH 			//00D0 	38DA
		LDR 	44H,0 			//00D1 	0844
		IORWR 	45H,0 			//00D2 	0345
		BTSS 	STATUS,2 		//00D3 	1D03
		LJUMP 	DAH 			//00D4 	38DA
		LDR 	4BH,0 			//00D5 	084B
		BTSS 	STATUS,2 		//00D6 	1D03
		LJUMP 	DAH 			//00D7 	38DA

		//;remote-38k-lrn.C: 343: {
		//;remote-38k-lrn.C: 344: PA5=~PA5;
		LDWI 	20H 			//00D8 	2A20
		XORWR 	5H,1 			//00D9 	0485

		//;remote-38k-lrn.C: 345: }
		//;remote-38k-lrn.C: 346: if( rdata1==Edata1C && rdata2==Edata2C && lern==0 && repeat==0 )
		LDR 	5BH,0 			//00DA 	085B
		XORWR 	4EH,0 			//00DB 	044E
		BTSS 	STATUS,2 		//00DC 	1D03
		LJUMP 	EBH 			//00DD 	38EB
		LDR 	5CH,0 			//00DE 	085C
		XORWR 	4DH,0 			//00DF 	044D
		BTSS 	STATUS,2 		//00E0 	1D03
		LJUMP 	EBH 			//00E1 	38EB
		LDR 	44H,0 			//00E2 	0844
		IORWR 	45H,0 			//00E3 	0345
		BTSS 	STATUS,2 		//00E4 	1D03
		LJUMP 	EBH 			//00E5 	38EB
		LDR 	4BH,0 			//00E6 	084B
		BTSS 	STATUS,2 		//00E7 	1D03
		LJUMP 	EBH 			//00E8 	38EB

		//;remote-38k-lrn.C: 347: {
		//;remote-38k-lrn.C: 348: PA4=~PA4;
		LDWI 	10H 			//00E9 	2A10
		XORWR 	5H,1 			//00EA 	0485

		//;remote-38k-lrn.C: 349: }
		//;remote-38k-lrn.C: 353: if(lern==1){
		DECR 	44H,0 			//00EB 	0D44
		IORWR 	45H,0 			//00EC 	0345
		BTSS 	STATUS,2 		//00ED 	1D03
		LJUMP 	130H 			//00EE 	3930

		//;remote-38k-lrn.C: 355: if(conterlern==0){
		LDR 	46H,0 			//00EF 	0846
		IORWR 	47H,0 			//00F0 	0347
		BTSS 	STATUS,2 		//00F1 	1D03
		LJUMP 	102H 			//00F2 	3902

		//;remote-38k-lrn.C: 356: EEPROMwrite(0x21,rdata1);
		LDWI 	21H 			//00F3 	2A21
		LCALL 	140H 			//00F4 	3140
		LCALL 	1DFH 			//00F5 	31DF

		//;remote-38k-lrn.C: 357: EEPROMwrite(0x22,rdata2);
		LDWI 	22H 			//00F6 	2A22
		LCALL 	139H 			//00F7 	3139
		LCALL 	1DFH 			//00F8 	31DF

		//;remote-38k-lrn.C: 359: Edata1A=rdata1;
		BCR 	STATUS,5 		//00F9 	1283
		LDR 	5BH,0 			//00FA 	085B
		STR 	52H 			//00FB 	01D2

		//;remote-38k-lrn.C: 360: Edata2A=rdata2;
		LDR 	5CH,0 			//00FC 	085C
		STR 	51H 			//00FD 	01D1

		//;remote-38k-lrn.C: 362: PA0=0 ;
		BCR 	5H,0 			//00FE 	1005

		//;remote-38k-lrn.C: 363: DelayMs(400);
		LDWI 	90H 			//00FF 	2A90
		LCALL 	204H 			//0100 	3204

		//;remote-38k-lrn.C: 364: PA0=1 ;
		BSR 	5H,0 			//0101 	1805

		//;remote-38k-lrn.C: 366: }
		//;remote-38k-lrn.C: 368: if(conterlern==1){
		DECR 	46H,0 			//0102 	0D46
		IORWR 	47H,0 			//0103 	0347
		BTSS 	STATUS,2 		//0104 	1D03
		LJUMP 	115H 			//0105 	3915

		//;remote-38k-lrn.C: 369: EEPROMwrite(0x23,rdata1);
		LDWI 	23H 			//0106 	2A23
		LCALL 	140H 			//0107 	3140
		LCALL 	1DFH 			//0108 	31DF

		//;remote-38k-lrn.C: 370: EEPROMwrite(0x24,rdata2);
		LDWI 	24H 			//0109 	2A24
		LCALL 	139H 			//010A 	3139
		LCALL 	1DFH 			//010B 	31DF

		//;remote-38k-lrn.C: 372: Edata1B=rdata1;
		BCR 	STATUS,5 		//010C 	1283
		LDR 	5BH,0 			//010D 	085B
		STR 	50H 			//010E 	01D0

		//;remote-38k-lrn.C: 373: Edata2B=rdata2;
		LDR 	5CH,0 			//010F 	085C
		STR 	4FH 			//0110 	01CF

		//;remote-38k-lrn.C: 375: PA5=0 ;
		BCR 	5H,5 			//0111 	1285

		//;remote-38k-lrn.C: 376: DelayMs(400);
		LDWI 	90H 			//0112 	2A90
		LCALL 	204H 			//0113 	3204

		//;remote-38k-lrn.C: 377: PA5=1 ;
		BSR 	5H,5 			//0114 	1A85

		//;remote-38k-lrn.C: 378: }
		//;remote-38k-lrn.C: 380: if(conterlern==2){
		LDWI 	2H 			//0115 	2A02
		XORWR 	46H,0 			//0116 	0446
		IORWR 	47H,0 			//0117 	0347
		BTSS 	STATUS,2 		//0118 	1D03
		LJUMP 	12BH 			//0119 	392B

		//;remote-38k-lrn.C: 381: EEPROMwrite(0x25,rdata1);
		LDWI 	25H 			//011A 	2A25
		LCALL 	140H 			//011B 	3140
		LCALL 	1DFH 			//011C 	31DF

		//;remote-38k-lrn.C: 382: EEPROMwrite(0x26,rdata2);
		LDWI 	26H 			//011D 	2A26
		LCALL 	139H 			//011E 	3139
		LCALL 	1DFH 			//011F 	31DF

		//;remote-38k-lrn.C: 384: Edata1C=rdata1;
		BCR 	STATUS,5 		//0120 	1283
		LDR 	5BH,0 			//0121 	085B
		STR 	4EH 			//0122 	01CE

		//;remote-38k-lrn.C: 385: Edata2C=rdata2;
		LDR 	5CH,0 			//0123 	085C
		STR 	4DH 			//0124 	01CD

		//;remote-38k-lrn.C: 387: PA4=0 ;
		BCR 	5H,4 			//0125 	1205

		//;remote-38k-lrn.C: 388: DelayMs(400);
		LDWI 	90H 			//0126 	2A90
		LCALL 	204H 			//0127 	3204

		//;remote-38k-lrn.C: 389: PA4=1 ;
		BSR 	5H,4 			//0128 	1A05

		//;remote-38k-lrn.C: 391: lern=0;
		CLRR 	44H 			//0129 	0144
		CLRR 	45H 			//012A 	0145

		//;remote-38k-lrn.C: 392: }
		//;remote-38k-lrn.C: 395: conterlern++;
		INCR	46H,1 			//012B 	09C6
		BTSC 	STATUS,2 		//012C 	1503
		INCR	47H,1 			//012D 	09C7

		//;remote-38k-lrn.C: 397: AAA = 0;
		CLRR 	48H 			//012E 	0148
		CLRR 	49H 			//012F 	0149

		//;remote-38k-lrn.C: 406: repeat=0;
		CLRR 	4BH 			//0130 	014B
		LJUMP 	94H 			//0131 	3894
		CLRR 	5DH 			//0132 	015D
		CLRR 	5EH 			//0133 	015E
		STR 	53H 			//0134 	01D3
		CLRR 	54H 			//0135 	0154
		CLRR 	55H 			//0136 	0155
		CLRR 	56H 			//0137 	0156
		RET		 					//0138 	0004
		BCR 	STATUS,5 		//0139 	1283
		STR 	53H 			//013A 	01D3
		CLRR 	54H 			//013B 	0154
		LDR 	5CH,0 			//013C 	085C
		STR 	55H 			//013D 	01D5
		CLRR 	56H 			//013E 	0156
		RET		 					//013F 	0004
		STR 	53H 			//0140 	01D3
		CLRR 	54H 			//0141 	0154
		LDR 	5BH,0 			//0142 	085B
		STR 	55H 			//0143 	01D5
		CLRR 	56H 			//0144 	0156
		RET		 					//0145 	0004
		BCR 	5H,0 			//0146 	1005
		BCR 	5H,5 			//0147 	1285
		BCR 	5H,4 			//0148 	1205
		RETW 	90H 			//0149 	2190

		//;remote-38k-lrn.C: 87: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//014A 	168B
		BTSS 	INTCON,2 		//014B 	1D0B
		LJUMP 	161H 			//014C 	3961

		//;remote-38k-lrn.C: 88: {
		//;remote-38k-lrn.C: 89: TMR0 = 1;
		LDWI 	1H 			//014D 	2A01
		STR 	1H 			//014E 	0181

		//;remote-38k-lrn.C: 90: T0IF = 0;
		BCR 	INTCON,2 		//014F 	110B

		//;remote-38k-lrn.C: 92: AAA++;
		INCR	48H,1 			//0150 	09C8
		BTSC 	STATUS,2 		//0151 	1503
		INCR	49H,1 			//0152 	09C9

		//;remote-38k-lrn.C: 93: if(AAA>1000){
		LDR 	49H,0 			//0153 	0849
		XORWI 	80H 			//0154 	2680
		STR 	7FH 			//0155 	01FF
		LDWI 	83H 			//0156 	2A83
		SUBWR 	7FH,0 			//0157 	0C7F
		BTSS 	STATUS,2 		//0158 	1D03
		LJUMP 	15CH 			//0159 	395C
		LDWI 	E9H 			//015A 	2AE9
		SUBWR 	48H,0 			//015B 	0C48
		BTSS 	STATUS,0 		//015C 	1C03
		LJUMP 	161H 			//015D 	3961

		//;remote-38k-lrn.C: 94: AAA=0;
		BCR 	STATUS,5 		//015E 	1283
		CLRR 	48H 			//015F 	0148
		CLRR 	49H 			//0160 	0149

		//;remote-38k-lrn.C: 96: }
		//;remote-38k-lrn.C: 97: }
		//;remote-38k-lrn.C: 100: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//0161 	1A83
		BTSS 	CH,1 			//0162 	1C8C
		LJUMP 	1CDH 			//0163 	39CD
		BCR 	STATUS,5 		//0164 	1283
		BTSS 	CH,1 			//0165 	1C8C
		LJUMP 	1CDH 			//0166 	39CD

		//;remote-38k-lrn.C: 101: {
		//;remote-38k-lrn.C: 103: TMR2IF = 0;
		BCR 	CH,1 			//0167 	108C

		//;remote-38k-lrn.C: 104: TMR2IE = 1;
		BSR 	STATUS,5 		//0168 	1A83
		BSR 	CH,1 			//0169 	188C

		//;remote-38k-lrn.C: 107: if(ir_timer){
		BCR 	STATUS,5 		//016A 	1283
		LDR 	4CH,0 			//016B 	084C
		BTSC 	STATUS,2 		//016C 	1503
		LJUMP 	180H 			//016D 	3980

		//;remote-38k-lrn.C: 108: IRbitTime++;
		INCR	70H,1 			//016E 	09F0
		BTSC 	STATUS,2 		//016F 	1503
		INCR	71H,1 			//0170 	09F1

		//;remote-38k-lrn.C: 109: if(IRbitTime > 1600)
		LDR 	71H,0 			//0171 	0871
		XORWI 	80H 			//0172 	2680
		STR 	7FH 			//0173 	01FF
		LDWI 	86H 			//0174 	2A86
		SUBWR 	7FH,0 			//0175 	0C7F
		BTSS 	STATUS,2 		//0176 	1D03
		LJUMP 	17AH 			//0177 	397A
		LDWI 	41H 			//0178 	2A41
		SUBWR 	70H,0 			//0179 	0C70
		BTSS 	STATUS,0 		//017A 	1C03
		LJUMP 	180H 			//017B 	3980

		//;remote-38k-lrn.C: 110: {
		//;remote-38k-lrn.C: 111: ir_timer = 0;
		BCR 	STATUS,5 		//017C 	1283
		CLRR 	4CH 			//017D 	014C

		//;remote-38k-lrn.C: 112: IRbitTime = 0;
		CLRR 	70H 			//017E 	0170
		CLRR 	71H 			//017F 	0171

		//;remote-38k-lrn.C: 113: }
		//;remote-38k-lrn.C: 114: }
		//;remote-38k-lrn.C: 116: if(ir_status != PA3){
		LDWI 	0H 			//0180 	2A00
		BCR 	STATUS,5 		//0181 	1283
		BTSC 	5H,3 			//0182 	1585
		LDWI 	1H 			//0183 	2A01
		XORWR 	73H,0 			//0184 	0473
		BTSC 	STATUS,2 		//0185 	1503
		LJUMP 	1CDH 			//0186 	39CD

		//;remote-38k-lrn.C: 117: ir_status=PA3;
		LDWI 	0H 			//0187 	2A00
		BTSC 	5H,3 			//0188 	1585
		LDWI 	1H 			//0189 	2A01
		STR 	73H 			//018A 	01F3

		//;remote-38k-lrn.C: 119: if(ir_status==0){
		LDR 	73H,0 			//018B 	0873
		BTSS 	STATUS,2 		//018C 	1D03
		LJUMP 	1CDH 			//018D 	39CD

		//;remote-38k-lrn.C: 121: ir_timer = 1;
		CLRR 	4CH 			//018E 	014C
		INCR	4CH,1 			//018F 	09CC

		//;remote-38k-lrn.C: 123: if(IRbitTime > 190)
		LCALL 	1D9H 			//0190 	31D9
		BTSS 	STATUS,2 		//0191 	1D03
		LJUMP 	195H 			//0192 	3995
		LDWI 	BFH 			//0193 	2ABF
		SUBWR 	70H,0 			//0194 	0C70
		BTSS 	STATUS,0 		//0195 	1C03
		LJUMP 	19FH 			//0196 	399F

		//;remote-38k-lrn.C: 124: {
		//;remote-38k-lrn.C: 125: IRDataTimer[0] = 0;
		BCR 	STATUS,5 		//0197 	1283
		CLRR 	40H 			//0198 	0140

		//;remote-38k-lrn.C: 126: IRDataTimer[1] = 0;
		CLRR 	41H 			//0199 	0141

		//;remote-38k-lrn.C: 127: IRDataTimer[2] = 0;
		CLRR 	42H 			//019A 	0142

		//;remote-38k-lrn.C: 128: IRDataTimer[3] = 0;
		CLRR 	43H 			//019B 	0143

		//;remote-38k-lrn.C: 129: IRbitNum = 0;
		CLRR 	72H 			//019C 	0172

		//;remote-38k-lrn.C: 130: bitdata = 0x00;
		CLRR 	78H 			//019D 	0178

		//;remote-38k-lrn.C: 131: }
		LJUMP 	1BAH 			//019E 	39BA

		//;remote-38k-lrn.C: 132: else if(IRbitTime > 150)
		LCALL 	1D9H 			//019F 	31D9
		BTSS 	STATUS,2 		//01A0 	1D03
		LJUMP 	1A4H 			//01A1 	39A4
		LDWI 	97H 			//01A2 	2A97
		SUBWR 	70H,0 			//01A3 	0C70
		BTSS 	STATUS,0 		//01A4 	1C03
		LJUMP 	1ADH 			//01A5 	39AD

		//;remote-38k-lrn.C: 133: {
		//;remote-38k-lrn.C: 134: if(ReceiveFinish==0)repeat=1;
		BCR 	STATUS,5 		//01A6 	1283
		LDR 	4AH,0 			//01A7 	084A
		BTSS 	STATUS,2 		//01A8 	1D03
		LJUMP 	1BAH 			//01A9 	39BA
		CLRR 	4BH 			//01AA 	014B
		INCR	4BH,1 			//01AB 	09CB
		LJUMP 	1BAH 			//01AC 	39BA

		//;remote-38k-lrn.C: 136: else if(IRbitTime > 30)
		LCALL 	1D9H 			//01AD 	31D9
		BTSS 	STATUS,2 		//01AE 	1D03
		LJUMP 	1B2H 			//01AF 	39B2
		LDWI 	1FH 			//01B0 	2A1F
		SUBWR 	70H,0 			//01B1 	0C70
		BTSS 	STATUS,0 		//01B2 	1C03
		LJUMP 	1BAH 			//01B3 	39BA

		//;remote-38k-lrn.C: 137: {
		//;remote-38k-lrn.C: 138: IRDataTimer[IRbitNum-1] |= bitdata;
		LDR 	72H,0 			//01B4 	0872
		ADDWI 	3FH 			//01B5 	273F
		STR 	FSR 			//01B6 	0184
		LDR 	78H,0 			//01B7 	0878
		BCR 	STATUS,7 		//01B8 	1383
		IORWR 	INDF,1 		//01B9 	0380

		//;remote-38k-lrn.C: 139: }
		//;remote-38k-lrn.C: 141: IRbitTime = 0;
		CLRR 	70H 			//01BA 	0170
		CLRR 	71H 			//01BB 	0171

		//;remote-38k-lrn.C: 142: bitdata<<=1;
		BCR 	STATUS,0 		//01BC 	1003
		RLR 	78H,1 			//01BD 	05F8

		//;remote-38k-lrn.C: 143: if(bitdata == 0)
		LDR 	78H,0 			//01BE 	0878
		BTSS 	STATUS,2 		//01BF 	1D03
		LJUMP 	1C4H 			//01C0 	39C4

		//;remote-38k-lrn.C: 144: {
		//;remote-38k-lrn.C: 145: bitdata = 0x01;
		CLRR 	78H 			//01C1 	0178
		INCR	78H,1 			//01C2 	09F8

		//;remote-38k-lrn.C: 146: IRbitNum++;
		INCR	72H,1 			//01C3 	09F2

		//;remote-38k-lrn.C: 147: }
		//;remote-38k-lrn.C: 148: if(IRbitNum > 4)
		LDWI 	5H 			//01C4 	2A05
		SUBWR 	72H,0 			//01C5 	0C72
		BTSS 	STATUS,0 		//01C6 	1C03
		LJUMP 	1CDH 			//01C7 	39CD

		//;remote-38k-lrn.C: 149: {
		//;remote-38k-lrn.C: 150: IRbitNum = 0;
		CLRR 	72H 			//01C8 	0172

		//;remote-38k-lrn.C: 151: ir_timer = 0;
		BCR 	STATUS,5 		//01C9 	1283
		CLRR 	4CH 			//01CA 	014C

		//;remote-38k-lrn.C: 152: ReceiveFinish = 1;
		CLRR 	4AH 			//01CB 	014A
		INCR	4AH,1 			//01CC 	09CA
		LDR 	77H,0 			//01CD 	0877
		BCR 	STATUS,5 		//01CE 	1283
		STR 	7FH 			//01CF 	01FF
		LDR 	76H,0 			//01D0 	0876
		STR 	PCLATH 			//01D1 	018A
		LDR 	75H,0 			//01D2 	0875
		STR 	FSR 			//01D3 	0184
		SWAPR 	74H,0 			//01D4 	0774
		STR 	STATUS 			//01D5 	0183
		SWAPR 	7EH,1 			//01D6 	07FE
		SWAPR 	7EH,0 			//01D7 	077E
		RETI		 			//01D8 	0009
		LDR 	71H,0 			//01D9 	0871
		XORWI 	80H 			//01DA 	2680
		STR 	7FH 			//01DB 	01FF
		LDWI 	80H 			//01DC 	2A80
		SUBWR 	7FH,0 			//01DD 	0C7F
		RET		 					//01DE 	0004

		//;remote-38k-lrn.C: 198: GIE = 0;
		BCR 	INTCON,7 		//01DF 	138B

		//;remote-38k-lrn.C: 199: while(GIE);
		BTSC 	INTCON,7 		//01E0 	178B
		LJUMP 	1E0H 			//01E1 	39E0

		//;remote-38k-lrn.C: 200: EEADR = EEAddr;
		LDR 	53H,0 			//01E2 	0853
		BSR 	STATUS,5 		//01E3 	1A83
		STR 	1BH 			//01E4 	019B

		//;remote-38k-lrn.C: 201: EEDAT = Data;
		BCR 	STATUS,5 		//01E5 	1283
		LDR 	55H,0 			//01E6 	0855
		BSR 	STATUS,5 		//01E7 	1A83
		STR 	1AH 			//01E8 	019A

		//;remote-38k-lrn.C: 202: EEIF = 0;
		BCR 	STATUS,5 		//01E9 	1283
		BCR 	CH,7 			//01EA 	138C

		//;remote-38k-lrn.C: 203: EECON1|= 0x34;
		LDWI 	34H 			//01EB 	2A34
		BSR 	STATUS,5 		//01EC 	1A83
		IORWR 	1CH,1 			//01ED 	039C

		//;remote-38k-lrn.C: 204: WR = 1;
		BSR 	1DH,0 			//01EE 	181D

		//;remote-38k-lrn.C: 205: while(WR);
		BTSC 	1DH,0 			//01EF 	141D
		LJUMP 	1EFH 			//01F0 	39EF

		//;remote-38k-lrn.C: 206: GIE = 1;
		BSR 	INTCON,7 		//01F1 	1B8B
		RET		 					//01F2 	0004
		BCR 	STATUS,5 		//01F3 	1283
		STR 	58H 			//01F4 	01D8

		//;remote-38k-lrn.C: 69: unsigned char a,b;
		//;remote-38k-lrn.C: 70: for(a=0;a<Time;a++)
		CLRR 	59H 			//01F5 	0159
		LDR 	58H,0 			//01F6 	0858
		SUBWR 	59H,0 			//01F7 	0C59
		BTSC 	STATUS,0 		//01F8 	1403
		RET		 					//01F9 	0004

		//;remote-38k-lrn.C: 71: {
		//;remote-38k-lrn.C: 72: for(b=0;b<10;b++)
		CLRR 	5AH 			//01FA 	015A

		//;remote-38k-lrn.C: 73: {
		//;remote-38k-lrn.C: 74: DelayMs(100);
		LDWI 	64H 			//01FB 	2A64
		LCALL 	204H 			//01FC 	3204
		LDWI 	AH 			//01FD 	2A0A
		INCR	5AH,1 			//01FE 	09DA
		SUBWR 	5AH,0 			//01FF 	0C5A
		BTSS 	STATUS,0 		//0200 	1C03
		LJUMP 	1FBH 			//0201 	39FB
		INCR	59H,1 			//0202 	09D9
		LJUMP 	1F6H 			//0203 	39F6
		STR 	55H 			//0204 	01D5

		//;remote-38k-lrn.C: 56: unsigned char a,b;
		//;remote-38k-lrn.C: 57: for(a=0;a<Time;a++)
		CLRR 	56H 			//0205 	0156
		LDR 	55H,0 			//0206 	0855
		SUBWR 	56H,0 			//0207 	0C56
		BTSC 	STATUS,0 		//0208 	1403
		RET		 					//0209 	0004

		//;remote-38k-lrn.C: 58: {
		//;remote-38k-lrn.C: 59: for(b=0;b<5;b++)
		CLRR 	57H 			//020A 	0157

		//;remote-38k-lrn.C: 60: {
		//;remote-38k-lrn.C: 61: DelayUs(98);
		LDWI 	62H 			//020B 	2A62
		LCALL 	23CH 			//020C 	323C
		LDWI 	5H 			//020D 	2A05
		INCR	57H,1 			//020E 	09D7
		SUBWR 	57H,0 			//020F 	0C57
		BTSS 	STATUS,0 		//0210 	1C03
		LJUMP 	20BH 			//0211 	3A0B
		INCR	56H,1 			//0212 	09D6
		LJUMP 	206H 			//0213 	3A06

		//;remote-38k-lrn.C: 170: OSCCON = 0B11110000;
		LDWI 	F0H 			//0214 	2AF0
		BSR 	STATUS,5 		//0215 	1A83
		STR 	FH 			//0216 	018F

		//;remote-38k-lrn.C: 172: INTCON = 0;
		CLRR 	INTCON 			//0217 	010B

		//;remote-38k-lrn.C: 173: OPTION = 0B00001000;
		LDWI 	8H 			//0218 	2A08
		STR 	1H 			//0219 	0181

		//;remote-38k-lrn.C: 175: PORTA = 0B00000000;
		BCR 	STATUS,5 		//021A 	1283
		CLRR 	5H 			//021B 	0105

		//;remote-38k-lrn.C: 176: TRISA = 0B00001010;
		LDWI 	AH 			//021C 	2A0A
		BSR 	STATUS,5 		//021D 	1A83
		STR 	5H 			//021E 	0185

		//;remote-38k-lrn.C: 178: WPUA = 0B00000000;
		CLRR 	15H 			//021F 	0115

		//;remote-38k-lrn.C: 180: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//0220 	1283
		CLRR 	1BH 			//0221 	011B
		RET		 					//0222 	0004

		//;remote-38k-lrn.C: 188: unsigned int ReEEPROMread;
		//;remote-38k-lrn.C: 189: EEADR = EEAddr;
		LDR 	53H,0 			//0223 	0853
		BSR 	STATUS,5 		//0224 	1A83
		STR 	1BH 			//0225 	019B

		//;remote-38k-lrn.C: 190: RD = 1;
		BSR 	1CH,0 			//0226 	181C

		//;remote-38k-lrn.C: 191: ReEEPROMread = EEDAT;
		LDR 	1AH,0 			//0227 	081A
		BCR 	STATUS,5 		//0228 	1283
		STR 	55H 			//0229 	01D5
		CLRR 	56H 			//022A 	0156

		//;remote-38k-lrn.C: 192: return ReEEPROMread;
		LDR 	56H,0 			//022B 	0856
		STR 	54H 			//022C 	01D4
		LDR 	55H,0 			//022D 	0855
		STR 	53H 			//022E 	01D3
		RET		 					//022F 	0004

		//;remote-38k-lrn.C: 228: T2CON = 0B00000001;
		LDWI 	1H 			//0230 	2A01
		STR 	12H 			//0231 	0192

		//;remote-38k-lrn.C: 230: TMR2 = 0;
		CLRR 	11H 			//0232 	0111

		//;remote-38k-lrn.C: 231: PR2 = 63;
		LDWI 	3FH 			//0233 	2A3F
		BSR 	STATUS,5 		//0234 	1A83
		STR 	12H 			//0235 	0192

		//;remote-38k-lrn.C: 232: TMR2IF = 0;
		BCR 	STATUS,5 		//0236 	1283
		BCR 	CH,1 			//0237 	108C

		//;remote-38k-lrn.C: 234: TMR2ON = 1;
		BSR 	12H,2 			//0238 	1912

		//;remote-38k-lrn.C: 235: PEIE=1;
		BSR 	INTCON,6 		//0239 	1B0B

		//;remote-38k-lrn.C: 236: GIE = 1;
		BSR 	INTCON,7 		//023A 	1B8B
		RET		 					//023B 	0004
		STR 	53H 			//023C 	01D3

		//;remote-38k-lrn.C: 46: unsigned char a;
		//;remote-38k-lrn.C: 47: for(a=0;a<Time;a++)
		CLRR 	54H 			//023D 	0154
		LDR 	53H,0 			//023E 	0853
		SUBWR 	54H,0 			//023F 	0C54
		BTSC 	STATUS,0 		//0240 	1403
		RET		 					//0241 	0004

		//;remote-38k-lrn.C: 48: {
		//;remote-38k-lrn.C: 49: __nop();
		NOP		 					//0242 	0000
		BCR 	STATUS,5 		//0243 	1283
		INCR	54H,1 			//0244 	09D4
		LJUMP 	23EH 			//0245 	3A3E
		CLRWDT	 			//0246 	0001
		CLRR 	INDF 			//0247 	0100
		INCR	FSR,1 			//0248 	0984
		XORWR 	FSR,0 			//0249 	0404
		BTSC 	STATUS,2 		//024A 	1503
		RETW 	0H 			//024B 	2100
		XORWR 	FSR,0 			//024C 	0404
		LJUMP 	247H 			//024D 	3A47

		//;remote-38k-lrn.C: 215: OPTION = 0B00000111;
		LDWI 	7H 			//024E 	2A07
		BSR 	STATUS,5 		//024F 	1A83
		STR 	1H 			//0250 	0181

		//;remote-38k-lrn.C: 221: TMR0 = 1;
		LDWI 	1H 			//0251 	2A01
		BCR 	STATUS,5 		//0252 	1283
		STR 	1H 			//0253 	0181

		//;remote-38k-lrn.C: 222: T0IF = 0;
		BCR 	INTCON,2 		//0254 	110B
		RET		 					//0255 	0004
			END
