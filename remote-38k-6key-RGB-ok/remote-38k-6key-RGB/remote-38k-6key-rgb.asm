//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_R		EQU		48H
		_G		EQU		46H
		_B		EQU		44H
		_ir_status		EQU		7AH
		_ir_timer		EQU		59H
		_Counter		EQU		58H
		_Set		EQU		61H
		_mode		EQU		57H
		_re		EQU		56H
		_repeat		EQU		55H
		_Counter_On_set		EQU		54H
		_Counter_On		EQU		79H
		_s		EQU		53H
		_m		EQU		52H
		_h		EQU		51H
		_CountINT		EQU		50H
		_RGB		EQU		4FH
		_timer		EQU		4EH
		_one		EQU		4DH
		_modetime		EQU		4CH
		_IRbitNum		EQU		4BH
		_IRbitTime		EQU		78H
		_IRDataTimer		EQU		40H
		_bitdata		EQU		60H
		_ReceiveFinish		EQU		4AH
//		main@a		EQU		5DH
//		main@rdata2		EQU		5FH
//		main@rdata1		EQU		5EH
//		___lbmod@dividend		EQU		75H
//		___lbmod@rem		EQU		77H
//		___lbmod@counter		EQU		76H
//		___lbmod@dividend		EQU		75H
//		___lbmod@divisor		EQU		73H
//		___lbmod@dividend		EQU		75H
//		DelayS@Time		EQU		5AH
//		DelayS@b		EQU		5CH
//		DelayS@a		EQU		5BH
//		DelayS@Time		EQU		5AH
//		DelayS@Time		EQU		5AH
//		DelayMs@Time		EQU		75H
//		DelayMs@b		EQU		77H
//		DelayMs@a		EQU		76H
//		DelayMs@Time		EQU		75H
//		DelayMs@Time		EQU		75H
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
		LJUMP 	283H 			//000B 	3A83
		LJUMP 	0DH 			//000C 	380D
		LDWI 	1H 			//000D 	2A01
		STR 	60H 			//000E 	01E0
		STR 	61H 			//000F 	01E1
		LDWI 	40H 			//0010 	2A40
		BCR 	STATUS,7 		//0011 	1383
		STR 	FSR 			//0012 	0184
		LDWI 	5AH 			//0013 	2A5A
		LCALL 	3B2H 			//0014 	33B2
		CLRR 	78H 			//0015 	0178
		CLRR 	79H 			//0016 	0179
		CLRR 	7AH 			//0017 	017A
		CLRR 	STATUS 			//0018 	0103
		LJUMP 	1AH 			//0019 	381A

		//;remote-38k-6key-RGB.C: 291: unsigned char rdata1,rdata2;
		//;remote-38k-6key-RGB.C: 293: POWER_INITIAL();
		LCALL 	384H 			//001A 	3384

		//;remote-38k-6key-RGB.C: 295: PA1_Level_Change_INITIAL();
		LCALL 	3A0H 			//001B 	33A0

		//;remote-38k-6key-RGB.C: 296: TIMER2_INITIAL();
		LCALL 	393H 			//001C 	3393

		//;remote-38k-6key-RGB.C: 298: GIE = 1;
		BSR 	INTCON,7 		//001D 	1B8B

		//;remote-38k-6key-RGB.C: 300: PAIE =1;
		BSR 	INTCON,3 		//001E 	198B

		//;remote-38k-6key-RGB.C: 301: TMR2IE = 1;
		BSR 	STATUS,5 		//001F 	1A83
		BSR 	CH,1 			//0020 	188C

		//;remote-38k-6key-RGB.C: 304: {
		//;remote-38k-6key-RGB.C: 306: if(h==timer && h!=0){
		BCR 	STATUS,5 		//0021 	1283
		LDR 	51H,0 			//0022 	0851
		XORWR 	4EH,0 			//0023 	044E
		BTSS 	STATUS,2 		//0024 	1D03
		LJUMP 	2DH 			//0025 	382D
		LDR 	51H,0 			//0026 	0851
		BTSC 	STATUS,2 		//0027 	1503
		LJUMP 	2DH 			//0028 	382D

		//;remote-38k-6key-RGB.C: 307: Set=0;
		CLRR 	61H 			//0029 	0161

		//;remote-38k-6key-RGB.C: 308: m=0;
		CLRR 	52H 			//002A 	0152

		//;remote-38k-6key-RGB.C: 309: h=0;
		CLRR 	51H 			//002B 	0151

		//;remote-38k-6key-RGB.C: 310: timer=0;
		CLRR 	4EH 			//002C 	014E

		//;remote-38k-6key-RGB.C: 311: }
		//;remote-38k-6key-RGB.C: 315: if(mode==2 || mode==1 ){
		LDWI 	2H 			//002D 	2A02
		XORWR 	57H,0 			//002E 	0457
		BTSC 	STATUS,2 		//002F 	1503
		LJUMP 	33H 			//0030 	3833
		DECRSZ 	57H,0 		//0031 	0E57
		LJUMP 	A9H 			//0032 	38A9

		//;remote-38k-6key-RGB.C: 316: if(Counter%modetime==0){
		LDR 	4CH,0 			//0033 	084C
		STR 	73H 			//0034 	01F3
		LDR 	58H,0 			//0035 	0858
		LCALL 	347H 			//0036 	3347
		XORWI 	0H 			//0037 	2600
		BTSS 	STATUS,2 		//0038 	1D03
		LJUMP 	A9H 			//0039 	38A9

		//;remote-38k-6key-RGB.C: 318: if(RGB==0 ){
		LDR 	4FH,0 			//003A 	084F
		BTSS 	STATUS,2 		//003B 	1D03
		LJUMP 	43H 			//003C 	3843

		//;remote-38k-6key-RGB.C: 319: G=G-1;
		//;remote-38k-6key-RGB.C: 320: if(G<=0)RGB=1;
		LCALL 	231H 			//003D 	3231
		BCR 	STATUS,5 		//003E 	1283
		BTSC 	STATUS,0 		//003F 	1403
		LJUMP 	44H 			//0040 	3844
		CLRR 	4FH 			//0041 	014F
		INCR	4FH,1 			//0042 	09CF

		//;remote-38k-6key-RGB.C: 321: }
		//;remote-38k-6key-RGB.C: 322: if(RGB==1 ){
		BCR 	STATUS,5 		//0043 	1283
		DECRSZ 	4FH,0 		//0044 	0E4F
		LJUMP 	53H 			//0045 	3853

		//;remote-38k-6key-RGB.C: 323: B=B+1;
		INCR	44H,1 			//0046 	09C4
		BTSC 	STATUS,2 		//0047 	1503
		INCR	45H,1 			//0048 	09C5

		//;remote-38k-6key-RGB.C: 324: if(B>=180)RGB=2;
		LCALL 	277H 			//0049 	3277
		BTSS 	STATUS,2 		//004A 	1D03
		LJUMP 	4EH 			//004B 	384E
		LDWI 	B4H 			//004C 	2AB4
		SUBWR 	44H,0 			//004D 	0C44
		LDWI 	2H 			//004E 	2A02
		BCR 	STATUS,5 		//004F 	1283
		BTSS 	STATUS,0 		//0050 	1C03
		LJUMP 	55H 			//0051 	3855
		STR 	4FH 			//0052 	01CF

		//;remote-38k-6key-RGB.C: 325: }
		//;remote-38k-6key-RGB.C: 326: if(RGB==2 ){
		LDWI 	2H 			//0053 	2A02
		BCR 	STATUS,5 		//0054 	1283
		XORWR 	4FH,0 			//0055 	044F
		BTSS 	STATUS,2 		//0056 	1D03
		LJUMP 	66H 			//0057 	3866

		//;remote-38k-6key-RGB.C: 327: R=R-1;
		LDWI 	FFH 			//0058 	2AFF
		ADDWR 	48H,1 			//0059 	0BC8
		BTSS 	STATUS,0 		//005A 	1C03
		DECR 	49H,1 			//005B 	0DC9

		//;remote-38k-6key-RGB.C: 328: if(R<=0)RGB=3;
		LCALL 	271H 			//005C 	3271
		BTSS 	STATUS,2 		//005D 	1D03
		LJUMP 	61H 			//005E 	3861
		LDWI 	1H 			//005F 	2A01
		SUBWR 	48H,0 			//0060 	0C48
		LDWI 	3H 			//0061 	2A03
		BCR 	STATUS,5 		//0062 	1283
		BTSC 	STATUS,0 		//0063 	1403
		LJUMP 	68H 			//0064 	3868
		STR 	4FH 			//0065 	01CF

		//;remote-38k-6key-RGB.C: 329: }
		//;remote-38k-6key-RGB.C: 330: if(RGB==3 ){
		LDWI 	3H 			//0066 	2A03
		BCR 	STATUS,5 		//0067 	1283
		XORWR 	4FH,0 			//0068 	044F
		BTSS 	STATUS,2 		//0069 	1D03
		LJUMP 	74H 			//006A 	3874

		//;remote-38k-6key-RGB.C: 331: G=G+1;
		INCR	46H,1 			//006B 	09C6
		BTSC 	STATUS,2 		//006C 	1503
		INCR	47H,1 			//006D 	09C7

		//;remote-38k-6key-RGB.C: 332: if(G>=180)RGB=4;
		LCALL 	24DH 			//006E 	324D
		LDWI 	4H 			//006F 	2A04
		BCR 	STATUS,5 		//0070 	1283
		BTSS 	STATUS,0 		//0071 	1C03
		LJUMP 	76H 			//0072 	3876
		STR 	4FH 			//0073 	01CF

		//;remote-38k-6key-RGB.C: 333: }
		//;remote-38k-6key-RGB.C: 334: if(RGB==4 ){
		LDWI 	4H 			//0074 	2A04
		BCR 	STATUS,5 		//0075 	1283
		XORWR 	4FH,0 			//0076 	044F
		BTSS 	STATUS,2 		//0077 	1D03
		LJUMP 	87H 			//0078 	3887

		//;remote-38k-6key-RGB.C: 335: B=B-1;
		LDWI 	FFH 			//0079 	2AFF
		ADDWR 	44H,1 			//007A 	0BC4
		BTSS 	STATUS,0 		//007B 	1C03
		DECR 	45H,1 			//007C 	0DC5

		//;remote-38k-6key-RGB.C: 336: if(B<=0)RGB=5;
		LCALL 	277H 			//007D 	3277
		BTSS 	STATUS,2 		//007E 	1D03
		LJUMP 	82H 			//007F 	3882
		LDWI 	1H 			//0080 	2A01
		SUBWR 	44H,0 			//0081 	0C44
		LDWI 	5H 			//0082 	2A05
		BCR 	STATUS,5 		//0083 	1283
		BTSC 	STATUS,0 		//0084 	1403
		LJUMP 	89H 			//0085 	3889
		STR 	4FH 			//0086 	01CF

		//;remote-38k-6key-RGB.C: 337: }
		//;remote-38k-6key-RGB.C: 338: if(RGB==5 ){
		LDWI 	5H 			//0087 	2A05
		BCR 	STATUS,5 		//0088 	1283
		XORWR 	4FH,0 			//0089 	044F
		BTSS 	STATUS,2 		//008A 	1D03
		LJUMP 	92H 			//008B 	3892

		//;remote-38k-6key-RGB.C: 339: G=G-1;
		//;remote-38k-6key-RGB.C: 340: if(G<=0)RGB=6;
		LCALL 	231H 			//008C 	3231
		LDWI 	6H 			//008D 	2A06
		BCR 	STATUS,5 		//008E 	1283
		BTSC 	STATUS,0 		//008F 	1403
		LJUMP 	94H 			//0090 	3894
		STR 	4FH 			//0091 	01CF

		//;remote-38k-6key-RGB.C: 341: }
		//;remote-38k-6key-RGB.C: 342: if(RGB==6 ){
		LDWI 	6H 			//0092 	2A06
		BCR 	STATUS,5 		//0093 	1283
		XORWR 	4FH,0 			//0094 	044F
		BTSS 	STATUS,2 		//0095 	1D03
		LJUMP 	A9H 			//0096 	38A9

		//;remote-38k-6key-RGB.C: 343: G=G+1;
		INCR	46H,1 			//0097 	09C6
		BTSC 	STATUS,2 		//0098 	1503
		INCR	47H,1 			//0099 	09C7

		//;remote-38k-6key-RGB.C: 344: R=R+1;
		INCR	48H,1 			//009A 	09C8
		BTSC 	STATUS,2 		//009B 	1503
		INCR	49H,1 			//009C 	09C9

		//;remote-38k-6key-RGB.C: 345: if(G>=180 && R>=180 )RGB=0;
		LCALL 	24DH 			//009D 	324D
		BTSS 	STATUS,0 		//009E 	1C03
		LJUMP 	A9H 			//009F 	38A9
		BCR 	STATUS,5 		//00A0 	1283
		LCALL 	271H 			//00A1 	3271
		BTSS 	STATUS,2 		//00A2 	1D03
		LJUMP 	A6H 			//00A3 	38A6
		LDWI 	B4H 			//00A4 	2AB4
		SUBWR 	48H,0 			//00A5 	0C48
		BCR 	STATUS,5 		//00A6 	1283
		BTSC 	STATUS,0 		//00A7 	1403
		CLRR 	4FH 			//00A8 	014F

		//;remote-38k-6key-RGB.C: 346: }
		//;remote-38k-6key-RGB.C: 347: }
		//;remote-38k-6key-RGB.C: 349: }
		//;remote-38k-6key-RGB.C: 352: if(mode==3){
		LDWI 	3H 			//00A9 	2A03
		BCR 	STATUS,5 		//00AA 	1283
		XORWR 	57H,0 			//00AB 	0457
		BTSS 	STATUS,2 		//00AC 	1D03
		LJUMP 	CCH 			//00AD 	38CC

		//;remote-38k-6key-RGB.C: 353: if((CountINT==75||CountINT==0)&&re==0)re=1,RGB++;
		LDWI 	4BH 			//00AE 	2A4B
		XORWR 	50H,0 			//00AF 	0450
		BTSS 	STATUS,2 		//00B0 	1D03
		LDR 	50H,0 			//00B1 	0850
		BTSS 	STATUS,2 		//00B2 	1D03
		LJUMP 	BAH 			//00B3 	38BA
		LDR 	56H,0 			//00B4 	0856
		BTSS 	STATUS,2 		//00B5 	1D03
		LJUMP 	BAH 			//00B6 	38BA
		CLRR 	56H 			//00B7 	0156
		INCR	56H,1 			//00B8 	09D6
		INCR	4FH,1 			//00B9 	09CF

		//;remote-38k-6key-RGB.C: 355: if(RGB==0) R=180 , G=180, B=0 ;
		LDR 	4FH,0 			//00BA 	084F
		BTSS 	STATUS,2 		//00BB 	1D03
		LJUMP 	C0H 			//00BC 	38C0
		LDWI 	B4H 			//00BD 	2AB4
		STR 	48H 			//00BE 	01C8
		LCALL 	247H 			//00BF 	3247

		//;remote-38k-6key-RGB.C: 356: if(RGB==1) R=180 , G=0 , B=180 ;
		DECRSZ 	4FH,0 		//00C0 	0E4F
		LJUMP 	C3H 			//00C1 	38C3
		LCALL 	261H 			//00C2 	3261

		//;remote-38k-6key-RGB.C: 357: if(RGB==2) R=0 , G=180, B=180 ;
		LDWI 	2H 			//00C3 	2A02
		XORWR 	4FH,0 			//00C4 	044F
		BTSS 	STATUS,2 		//00C5 	1D03
		LJUMP 	C8H 			//00C6 	38C8
		LCALL 	269H 			//00C7 	3269

		//;remote-38k-6key-RGB.C: 358: if(RGB>=3) RGB=0;
		LDWI 	3H 			//00C8 	2A03
		SUBWR 	4FH,0 			//00C9 	0C4F
		BTSC 	STATUS,0 		//00CA 	1403
		CLRR 	4FH 			//00CB 	014F

		//;remote-38k-6key-RGB.C: 359: }
		//;remote-38k-6key-RGB.C: 361: if(mode==4&&Set==1){
		LDWI 	4H 			//00CC 	2A04
		XORWR 	57H,0 			//00CD 	0457
		BTSS 	STATUS,2 		//00CE 	1D03
		LJUMP 	107H 			//00CF 	3907
		DECRSZ 	61H,0 		//00D0 	0E61
		LJUMP 	107H 			//00D1 	3907

		//;remote-38k-6key-RGB.C: 363: if(s%2==0&&re==0)re=1,RGB++;
		BTSC 	53H,0 			//00D2 	1453
		LJUMP 	DAH 			//00D3 	38DA
		LDR 	56H,0 			//00D4 	0856
		BTSS 	STATUS,2 		//00D5 	1D03
		LJUMP 	DAH 			//00D6 	38DA
		CLRR 	56H 			//00D7 	0156
		INCR	56H,1 			//00D8 	09D6
		INCR	4FH,1 			//00D9 	09CF

		//;remote-38k-6key-RGB.C: 364: if(s%2==0){
		BTSC 	53H,0 			//00DA 	1453
		LJUMP 	F0H 			//00DB 	38F0

		//;remote-38k-6key-RGB.C: 365: if(CountINT%15==0)PA4=1,PA5=1,PA0=1;
		LDWI 	FH 			//00DC 	2A0F
		STR 	73H 			//00DD 	01F3
		LDR 	50H,0 			//00DE 	0850
		LCALL 	347H 			//00DF 	3347
		XORWI 	0H 			//00E0 	2600
		BTSS 	STATUS,2 		//00E1 	1D03
		LJUMP 	E6H 			//00E2 	38E6
		BSR 	5H,4 			//00E3 	1A05
		BSR 	5H,5 			//00E4 	1A85
		BSR 	5H,0 			//00E5 	1805

		//;remote-38k-6key-RGB.C: 366: if(CountINT%15==8)R=180 , G=180 , B=180 ,PA4=0,PA5=0,PA0=0;
		LDWI 	FH 			//00E6 	2A0F
		STR 	73H 			//00E7 	01F3
		LDR 	50H,0 			//00E8 	0850
		LCALL 	347H 			//00E9 	3347
		XORWI 	8H 			//00EA 	2608
		BTSS 	STATUS,2 		//00EB 	1D03
		LJUMP 	107H 			//00EC 	3907
		LDWI 	B4H 			//00ED 	2AB4
		LCALL 	257H 			//00EE 	3257
		LJUMP 	107H 			//00EF 	3907

		//;remote-38k-6key-RGB.C: 368: if(RGB==1) PA4=1,PA5=0,PA0=0 ;
		DECRSZ 	4FH,0 		//00F0 	0E4F
		LJUMP 	F5H 			//00F1 	38F5
		BSR 	5H,4 			//00F2 	1A05
		BCR 	5H,5 			//00F3 	1285
		BCR 	5H,0 			//00F4 	1005

		//;remote-38k-6key-RGB.C: 369: if(RGB==2) PA4=0,PA5=1,PA0=0;
		LDWI 	2H 			//00F5 	2A02
		XORWR 	4FH,0 			//00F6 	044F
		BTSS 	STATUS,2 		//00F7 	1D03
		LJUMP 	FCH 			//00F8 	38FC
		BCR 	5H,4 			//00F9 	1205
		BSR 	5H,5 			//00FA 	1A85
		BCR 	5H,0 			//00FB 	1005

		//;remote-38k-6key-RGB.C: 370: if(RGB==3) PA4=0,PA5=0,PA0=1;
		LDWI 	3H 			//00FC 	2A03
		XORWR 	4FH,0 			//00FD 	044F
		BTSS 	STATUS,2 		//00FE 	1D03
		LJUMP 	103H 			//00FF 	3903
		BCR 	5H,4 			//0100 	1205
		BCR 	5H,5 			//0101 	1285
		BSR 	5H,0 			//0102 	1805

		//;remote-38k-6key-RGB.C: 371: if(RGB>=3) RGB=0;
		LDWI 	3H 			//0103 	2A03
		SUBWR 	4FH,0 			//0104 	0C4F
		BTSC 	STATUS,0 		//0105 	1403
		CLRR 	4FH 			//0106 	014F

		//;remote-38k-6key-RGB.C: 372: }
		//;remote-38k-6key-RGB.C: 375: }
		//;remote-38k-6key-RGB.C: 377: if(mode==5&&Set==1){
		LDWI 	5H 			//0107 	2A05
		XORWR 	57H,0 			//0108 	0457
		BTSS 	STATUS,2 		//0109 	1D03
		LJUMP 	12DH 			//010A 	392D
		DECRSZ 	61H,0 		//010B 	0E61
		LJUMP 	12DH 			//010C 	392D

		//;remote-38k-6key-RGB.C: 379: if(s%2==0&&re==0)re=1;
		BTSC 	53H,0 			//010D 	1453
		LJUMP 	114H 			//010E 	3914
		LDR 	56H,0 			//010F 	0856
		BTSS 	STATUS,2 		//0110 	1D03
		LJUMP 	114H 			//0111 	3914
		CLRR 	56H 			//0112 	0156
		INCR	56H,1 			//0113 	09D6

		//;remote-38k-6key-RGB.C: 380: if(s%2==0){
		BTSC 	53H,0 			//0114 	1453
		LJUMP 	12AH 			//0115 	392A

		//;remote-38k-6key-RGB.C: 381: if(CountINT%15==0)PA4=1,PA5=1,PA0=1;
		LDWI 	FH 			//0116 	2A0F
		STR 	73H 			//0117 	01F3
		LDR 	50H,0 			//0118 	0850
		LCALL 	347H 			//0119 	3347
		XORWI 	0H 			//011A 	2600
		BTSS 	STATUS,2 		//011B 	1D03
		LJUMP 	120H 			//011C 	3920
		BSR 	5H,4 			//011D 	1A05
		BSR 	5H,5 			//011E 	1A85
		BSR 	5H,0 			//011F 	1805

		//;remote-38k-6key-RGB.C: 382: if(CountINT%15==8)R=180 , G=180 , B=180 ,PA4=0,PA5=0,PA0=0;
		LDWI 	FH 			//0120 	2A0F
		STR 	73H 			//0121 	01F3
		LDR 	50H,0 			//0122 	0850
		LCALL 	347H 			//0123 	3347
		XORWI 	8H 			//0124 	2608
		BTSS 	STATUS,2 		//0125 	1D03
		LJUMP 	12DH 			//0126 	392D
		LDWI 	B4H 			//0127 	2AB4
		LCALL 	257H 			//0128 	3257
		LJUMP 	12DH 			//0129 	392D

		//;remote-38k-6key-RGB.C: 384: PA4=1,PA5=1,PA0=1;
		BSR 	5H,4 			//012A 	1A05
		BSR 	5H,5 			//012B 	1A85
		BSR 	5H,0 			//012C 	1805

		//;remote-38k-6key-RGB.C: 385: }
		//;remote-38k-6key-RGB.C: 388: }
		//;remote-38k-6key-RGB.C: 389: if(mode>=4&&Set==0)PA4=0,PA5=0,PA0=0;
		LDWI 	4H 			//012D 	2A04
		SUBWR 	57H,0 			//012E 	0C57
		BTSS 	STATUS,0 		//012F 	1C03
		LJUMP 	137H 			//0130 	3937
		LDR 	61H,0 			//0131 	0861
		BTSS 	STATUS,2 		//0132 	1D03
		LJUMP 	137H 			//0133 	3937
		BCR 	5H,4 			//0134 	1205
		BCR 	5H,5 			//0135 	1285
		BCR 	5H,0 			//0136 	1005

		//;remote-38k-6key-RGB.C: 393: if(ReceiveFinish || repeat)
		LDR 	4AH,0 			//0137 	084A
		BTSC 	STATUS,2 		//0138 	1503
		LDR 	55H,0 			//0139 	0855
		BTSC 	STATUS,2 		//013A 	1503
		LJUMP 	21H 			//013B 	3821

		//;remote-38k-6key-RGB.C: 394: {
		//;remote-38k-6key-RGB.C: 395: ReceiveFinish = 0;
		CLRR 	4AH 			//013C 	014A

		//;remote-38k-6key-RGB.C: 398: rdata1 = 0xFF - IRDataTimer[0];
		COMR 	40H,0 			//013D 	0F40
		STR 	5EH 			//013E 	01DE

		//;remote-38k-6key-RGB.C: 399: rdata2 = 0xFF - IRDataTimer[2];
		COMR 	42H,0 			//013F 	0F42
		STR 	5FH 			//0140 	01DF

		//;remote-38k-6key-RGB.C: 400: if((rdata1 == IRDataTimer[1])&&(rdata2 == IRDataTimer[3]))
		LDR 	41H,0 			//0141 	0841
		XORWR 	5EH,0 			//0142 	045E
		BTSS 	STATUS,2 		//0143 	1D03
		LJUMP 	22EH 			//0144 	3A2E
		LDR 	43H,0 			//0145 	0843
		XORWR 	5FH,0 			//0146 	045F
		BTSS 	STATUS,2 		//0147 	1D03
		LJUMP 	22EH 			//0148 	3A2E

		//;remote-38k-6key-RGB.C: 401: {
		//;remote-38k-6key-RGB.C: 404: if( rdata2==0xED && repeat==0)
		LDWI 	EDH 			//0149 	2AED
		XORWR 	5FH,0 			//014A 	045F
		BTSS 	STATUS,2 		//014B 	1D03
		LJUMP 	155H 			//014C 	3955
		LDR 	55H,0 			//014D 	0855
		BTSS 	STATUS,2 		//014E 	1D03
		LJUMP 	155H 			//014F 	3955

		//;remote-38k-6key-RGB.C: 405: {
		//;remote-38k-6key-RGB.C: 406: Set++;
		INCR	61H,1 			//0150 	09E1

		//;remote-38k-6key-RGB.C: 407: if(Set==1)
		DECRSZ 	61H,0 		//0151 	0E61
		LJUMP 	154H 			//0152 	3954
		LJUMP 	155H 			//0153 	3955

		//;remote-38k-6key-RGB.C: 414: else
		//;remote-38k-6key-RGB.C: 415: {
		//;remote-38k-6key-RGB.C: 419: Set=0;
		CLRR 	61H 			//0154 	0161

		//;remote-38k-6key-RGB.C: 421: }
		//;remote-38k-6key-RGB.C: 422: }
		//;remote-38k-6key-RGB.C: 427: if(rdata1==0x7F && rdata2==0xE1 )
		LDWI 	7FH 			//0155 	2A7F
		XORWR 	5EH,0 			//0156 	045E
		BTSS 	STATUS,2 		//0157 	1D03
		LJUMP 	19AH 			//0158 	399A
		LDWI 	E1H 			//0159 	2AE1
		XORWR 	5FH,0 			//015A 	045F
		BTSS 	STATUS,2 		//015B 	1D03
		LJUMP 	19AH 			//015C 	399A

		//;remote-38k-6key-RGB.C: 428: {
		//;remote-38k-6key-RGB.C: 429: mode=0;
		CLRR 	57H 			//015D 	0157

		//;remote-38k-6key-RGB.C: 430: if(one==0)one=1,RGB=0 , R=180 , G= 180 , B=0;
		LDR 	4DH,0 			//015E 	084D
		BTSS 	STATUS,2 		//015F 	1D03
		LJUMP 	168H 			//0160 	3968
		LDWI 	B4H 			//0161 	2AB4
		CLRR 	4DH 			//0162 	014D
		INCR	4DH,1 			//0163 	09CD
		CLRR 	4FH 			//0164 	014F
		STR 	48H 			//0165 	01C8
		LDWI 	B4H 			//0166 	2AB4
		LCALL 	247H 			//0167 	3247

		//;remote-38k-6key-RGB.C: 432: if(RGB==0) R=180 , G=180, B=0 ;
		LDR 	4FH,0 			//0168 	084F
		BTSS 	STATUS,2 		//0169 	1D03
		LJUMP 	16EH 			//016A 	396E
		LDWI 	B4H 			//016B 	2AB4
		STR 	48H 			//016C 	01C8
		LCALL 	247H 			//016D 	3247

		//;remote-38k-6key-RGB.C: 433: if(RGB==1) R=180 , G=0, B=0 ;
		DECRSZ 	4FH,0 		//016E 	0E4F
		LJUMP 	173H 			//016F 	3973
		LDWI 	B4H 			//0170 	2AB4
		STR 	48H 			//0171 	01C8
		LCALL 	27DH 			//0172 	327D

		//;remote-38k-6key-RGB.C: 434: if(RGB==2) R=180 , G=0 , B=180 ;
		LDWI 	2H 			//0173 	2A02
		XORWR 	4FH,0 			//0174 	044F
		BTSS 	STATUS,2 		//0175 	1D03
		LJUMP 	178H 			//0176 	3978
		LCALL 	261H 			//0177 	3261

		//;remote-38k-6key-RGB.C: 435: if(RGB==3) R=0 , G=0, B=180 ;
		LDWI 	3H 			//0178 	2A03
		XORWR 	4FH,0 			//0179 	044F
		BTSS 	STATUS,2 		//017A 	1D03
		LJUMP 	183H 			//017B 	3983
		LDWI 	B4H 			//017C 	2AB4
		CLRR 	48H 			//017D 	0148
		CLRR 	49H 			//017E 	0149
		CLRR 	46H 			//017F 	0146
		CLRR 	47H 			//0180 	0147
		STR 	44H 			//0181 	01C4
		CLRR 	45H 			//0182 	0145

		//;remote-38k-6key-RGB.C: 436: if(RGB==4) R=0 , G=180, B=180 ;
		LDWI 	4H 			//0183 	2A04
		XORWR 	4FH,0 			//0184 	044F
		BTSS 	STATUS,2 		//0185 	1D03
		LJUMP 	188H 			//0186 	3988
		LCALL 	269H 			//0187 	3269

		//;remote-38k-6key-RGB.C: 437: if(RGB==5) R=0 , G=180, B=0 ;
		LDWI 	5H 			//0188 	2A05
		XORWR 	4FH,0 			//0189 	044F
		BTSS 	STATUS,2 		//018A 	1D03
		LJUMP 	18FH 			//018B 	398F
		LDWI 	B4H 			//018C 	2AB4
		CLRR 	48H 			//018D 	0148
		LCALL 	247H 			//018E 	3247

		//;remote-38k-6key-RGB.C: 438: if(RGB==6) R=0 , G=0, B=0 ;
		LDWI 	6H 			//018F 	2A06
		XORWR 	4FH,0 			//0190 	044F
		BTSS 	STATUS,2 		//0191 	1D03
		LJUMP 	195H 			//0192 	3995
		CLRR 	48H 			//0193 	0148
		LCALL 	27DH 			//0194 	327D

		//;remote-38k-6key-RGB.C: 440: if(RGB>=6) RGB=0;
		LDWI 	6H 			//0195 	2A06
		SUBWR 	4FH,0 			//0196 	0C4F
		BTSC 	STATUS,0 		//0197 	1403
		CLRR 	4FH 			//0198 	014F

		//;remote-38k-6key-RGB.C: 442: RGB++;
		INCR	4FH,1 			//0199 	09CF

		//;remote-38k-6key-RGB.C: 473: }
		//;remote-38k-6key-RGB.C: 478: if( rdata2==0xF9 && Set==1)
		LDWI 	F9H 			//019A 	2AF9
		XORWR 	5FH,0 			//019B 	045F
		BTSS 	STATUS,2 		//019C 	1D03
		LJUMP 	1B5H 			//019D 	39B5
		DECRSZ 	61H,0 		//019E 	0E61
		LJUMP 	1B5H 			//019F 	39B5

		//;remote-38k-6key-RGB.C: 479: {
		//;remote-38k-6key-RGB.C: 480: if(Counter_On_set>0){
		LDR 	54H,0 			//01A0 	0854
		BTSC 	STATUS,2 		//01A1 	1503
		LJUMP 	1B5H 			//01A2 	39B5

		//;remote-38k-6key-RGB.C: 481: Counter_On_set=Counter_On_set-6;
		LDWI 	FAH 			//01A3 	2AFA
		ADDWR 	54H,1 			//01A4 	0BD4

		//;remote-38k-6key-RGB.C: 483: if(Counter_On_set<=0 ){
		LDR 	54H,0 			//01A5 	0854
		BTSS 	STATUS,2 		//01A6 	1D03
		LJUMP 	1B5H 			//01A7 	39B5

		//;remote-38k-6key-RGB.C: 484: Counter_On_set=0;
		CLRR 	54H 			//01A8 	0154

		//;remote-38k-6key-RGB.C: 485: PAIE=0;
		BCR 	INTCON,3 		//01A9 	118B

		//;remote-38k-6key-RGB.C: 486: TMR2IE=0;
		BSR 	STATUS,5 		//01AA 	1A83
		BCR 	CH,1 			//01AB 	108C

		//;remote-38k-6key-RGB.C: 487: PA4=0,PA5=0,PA0=0;
		BCR 	STATUS,5 		//01AC 	1283
		BCR 	5H,4 			//01AD 	1205
		BCR 	5H,5 			//01AE 	1285
		BCR 	5H,0 			//01AF 	1005

		//;remote-38k-6key-RGB.C: 488: DelayMs(100);
		LDWI 	64H 			//01B0 	2A64
		LCALL 	374H 			//01B1 	3374

		//;remote-38k-6key-RGB.C: 489: PAIE=1;
		BSR 	INTCON,3 		//01B2 	198B

		//;remote-38k-6key-RGB.C: 490: TMR2IE=1;
		BSR 	STATUS,5 		//01B3 	1A83
		BSR 	CH,1 			//01B4 	188C

		//;remote-38k-6key-RGB.C: 491: }
		//;remote-38k-6key-RGB.C: 492: }
		//;remote-38k-6key-RGB.C: 493: }
		//;remote-38k-6key-RGB.C: 495: if( rdata2==0xFB && Set==1)
		LDWI 	FBH 			//01B5 	2AFB
		BCR 	STATUS,5 		//01B6 	1283
		XORWR 	5FH,0 			//01B7 	045F
		BTSS 	STATUS,2 		//01B8 	1D03
		LJUMP 	1CCH 			//01B9 	39CC
		DECRSZ 	61H,0 		//01BA 	0E61
		LJUMP 	1CCH 			//01BB 	39CC

		//;remote-38k-6key-RGB.C: 496: {
		//;remote-38k-6key-RGB.C: 497: if(Counter_On_set<150){
		LDWI 	96H 			//01BC 	2A96
		SUBWR 	54H,0 			//01BD 	0C54
		BTSC 	STATUS,0 		//01BE 	1403
		LJUMP 	1CCH 			//01BF 	39CC

		//;remote-38k-6key-RGB.C: 499: Counter_On_set=Counter_On_set+6;
		LDWI 	6H 			//01C0 	2A06
		ADDWR 	54H,1 			//01C1 	0BD4

		//;remote-38k-6key-RGB.C: 501: if(Counter_On_set>=150 ){
		LDWI 	96H 			//01C2 	2A96
		SUBWR 	54H,0 			//01C3 	0C54
		BTSS 	STATUS,0 		//01C4 	1C03
		LJUMP 	1CCH 			//01C5 	39CC

		//;remote-38k-6key-RGB.C: 502: PAIE=0;
		//;remote-38k-6key-RGB.C: 503: TMR2IE=0;
		//;remote-38k-6key-RGB.C: 504: PA4=1,PA5=1,PA0=1;
		LCALL 	23FH 			//01C6 	323F

		//;remote-38k-6key-RGB.C: 505: DelayMs(100);
		LDWI 	64H 			//01C7 	2A64
		LCALL 	374H 			//01C8 	3374

		//;remote-38k-6key-RGB.C: 506: PAIE=1;
		BSR 	INTCON,3 		//01C9 	198B

		//;remote-38k-6key-RGB.C: 507: TMR2IE=1;
		BSR 	STATUS,5 		//01CA 	1A83
		BSR 	CH,1 			//01CB 	188C

		//;remote-38k-6key-RGB.C: 508: }
		//;remote-38k-6key-RGB.C: 509: }
		//;remote-38k-6key-RGB.C: 510: }
		//;remote-38k-6key-RGB.C: 512: if(rdata1==0x7F && rdata2==0xF7 && repeat==0 && Set==1)
		LDWI 	7FH 			//01CC 	2A7F
		BCR 	STATUS,5 		//01CD 	1283
		XORWR 	5EH,0 			//01CE 	045E
		BTSS 	STATUS,2 		//01CF 	1D03
		LJUMP 	201H 			//01D0 	3A01
		LDWI 	F7H 			//01D1 	2AF7
		XORWR 	5FH,0 			//01D2 	045F
		BTSS 	STATUS,2 		//01D3 	1D03
		LJUMP 	201H 			//01D4 	3A01
		LDR 	55H,0 			//01D5 	0855
		BTSS 	STATUS,2 		//01D6 	1D03
		LJUMP 	201H 			//01D7 	3A01
		DECRSZ 	61H,0 		//01D8 	0E61
		LJUMP 	201H 			//01D9 	3A01

		//;remote-38k-6key-RGB.C: 513: {
		//;remote-38k-6key-RGB.C: 514: PAIE=0;
		BCR 	INTCON,3 		//01DA 	118B

		//;remote-38k-6key-RGB.C: 515: TMR2IE=0;
		BSR 	STATUS,5 		//01DB 	1A83
		BCR 	CH,1 			//01DC 	108C
		LDWI 	8H 			//01DD 	2A08

		//;remote-38k-6key-RGB.C: 518: timer=timer+2;
		BCR 	STATUS,5 		//01DE 	1283
		INCR	4EH,1 			//01DF 	09CE
		INCR	4EH,1 			//01E0 	09CE

		//;remote-38k-6key-RGB.C: 519: m=0;
		CLRR 	52H 			//01E1 	0152

		//;remote-38k-6key-RGB.C: 520: h=0;
		CLRR 	51H 			//01E2 	0151

		//;remote-38k-6key-RGB.C: 521: if(timer>=8){
		SUBWR 	4EH,0 			//01E3 	0C4E
		BTSS 	STATUS,0 		//01E4 	1C03
		LJUMP 	1EDH 			//01E5 	39ED

		//;remote-38k-6key-RGB.C: 522: timer=0;
		CLRR 	4EH 			//01E6 	014E

		//;remote-38k-6key-RGB.C: 523: PA4=1,PA5=1,PA0=1;
		BSR 	5H,4 			//01E7 	1A05
		BSR 	5H,5 			//01E8 	1A85
		BSR 	5H,0 			//01E9 	1805

		//;remote-38k-6key-RGB.C: 524: DelayS(2);
		LDWI 	2H 			//01EA 	2A02
		LCALL 	363H 			//01EB 	3363

		//;remote-38k-6key-RGB.C: 526: }else{
		LJUMP 	1FEH 			//01EC 	39FE

		//;remote-38k-6key-RGB.C: 527: unsigned char a;
		//;remote-38k-6key-RGB.C: 528: for(a=0;a<(timer/2);a++)
		CLRR 	5DH 			//01ED 	015D
		BCR 	STATUS,0 		//01EE 	1003
		RRR	4EH,0 			//01EF 	064E
		SUBWR 	5DH,0 			//01F0 	0C5D
		BTSC 	STATUS,0 		//01F1 	1403
		LJUMP 	1FEH 			//01F2 	39FE

		//;remote-38k-6key-RGB.C: 529: {
		//;remote-38k-6key-RGB.C: 530: PAIE=0;
		//;remote-38k-6key-RGB.C: 531: TMR2IE=0;
		//;remote-38k-6key-RGB.C: 533: PA4=1,PA5=1,PA0=1;
		LCALL 	23FH 			//01F3 	323F

		//;remote-38k-6key-RGB.C: 534: DelayMs(200);
		LDWI 	C8H 			//01F4 	2AC8
		LCALL 	374H 			//01F5 	3374

		//;remote-38k-6key-RGB.C: 536: PAIE=1;
		BSR 	INTCON,3 		//01F6 	198B

		//;remote-38k-6key-RGB.C: 537: TMR2IE=1;
		BSR 	STATUS,5 		//01F7 	1A83
		BSR 	CH,1 			//01F8 	188C

		//;remote-38k-6key-RGB.C: 539: DelayMs(150);
		LDWI 	96H 			//01F9 	2A96
		LCALL 	374H 			//01FA 	3374
		BCR 	STATUS,5 		//01FB 	1283
		INCR	5DH,1 			//01FC 	09DD
		LJUMP 	1EEH 			//01FD 	39EE

		//;remote-38k-6key-RGB.C: 540: }
		//;remote-38k-6key-RGB.C: 541: }
		//;remote-38k-6key-RGB.C: 547: PAIE=1;
		BSR 	INTCON,3 		//01FE 	198B

		//;remote-38k-6key-RGB.C: 548: TMR2IE=1;
		BSR 	STATUS,5 		//01FF 	1A83
		BSR 	CH,1 			//0200 	188C

		//;remote-38k-6key-RGB.C: 549: }
		//;remote-38k-6key-RGB.C: 551: if(rdata1==0x7F && rdata2==0xFD && repeat==0 && Set==1)
		LDWI 	7FH 			//0201 	2A7F
		BCR 	STATUS,5 		//0202 	1283
		XORWR 	5EH,0 			//0203 	045E
		BTSS 	STATUS,2 		//0204 	1D03
		LJUMP 	22EH 			//0205 	3A2E
		LDWI 	FDH 			//0206 	2AFD
		XORWR 	5FH,0 			//0207 	045F
		BTSS 	STATUS,2 		//0208 	1D03
		LJUMP 	22EH 			//0209 	3A2E
		LDR 	55H,0 			//020A 	0855
		BTSS 	STATUS,2 		//020B 	1D03
		LJUMP 	22EH 			//020C 	3A2E
		DECRSZ 	61H,0 		//020D 	0E61
		LJUMP 	22EH 			//020E 	3A2E

		//;remote-38k-6key-RGB.C: 552: {
		//;remote-38k-6key-RGB.C: 553: R=180 , G=180, B=0;
		LDWI 	B4H 			//020F 	2AB4
		STR 	48H 			//0210 	01C8
		LCALL 	247H 			//0211 	3247

		//;remote-38k-6key-RGB.C: 555: one=0;
		CLRR 	4DH 			//0212 	014D

		//;remote-38k-6key-RGB.C: 557: PAIE=0;
		//;remote-38k-6key-RGB.C: 558: TMR2IE=0;
		//;remote-38k-6key-RGB.C: 559: PA4=1,PA5=1,PA0=1;
		LCALL 	23FH 			//0213 	323F

		//;remote-38k-6key-RGB.C: 560: DelayMs(100);
		LDWI 	64H 			//0214 	2A64
		LCALL 	374H 			//0215 	3374

		//;remote-38k-6key-RGB.C: 561: PA4=0,PA5=0,PA0=0;
		BCR 	STATUS,5 		//0216 	1283
		BCR 	5H,4 			//0217 	1205
		BCR 	5H,5 			//0218 	1285
		BCR 	5H,0 			//0219 	1005
		LDWI 	6H 			//021A 	2A06

		//;remote-38k-6key-RGB.C: 562: mode++;
		INCR	57H,1 			//021B 	09D7

		//;remote-38k-6key-RGB.C: 563: if(mode>5)mode=1;
		SUBWR 	57H,0 			//021C 	0C57
		BTSS 	STATUS,0 		//021D 	1C03
		LJUMP 	221H 			//021E 	3A21
		CLRR 	57H 			//021F 	0157
		INCR	57H,1 			//0220 	09D7

		//;remote-38k-6key-RGB.C: 564: if(mode==1)modetime=10;
		DECRSZ 	57H,0 		//0221 	0E57
		LJUMP 	225H 			//0222 	3A25
		LDWI 	AH 			//0223 	2A0A
		STR 	4CH 			//0224 	01CC

		//;remote-38k-6key-RGB.C: 565: if(mode==2)modetime=140;
		LDWI 	2H 			//0225 	2A02
		XORWR 	57H,0 			//0226 	0457
		BTSS 	STATUS,2 		//0227 	1D03
		LJUMP 	22BH 			//0228 	3A2B
		LDWI 	8CH 			//0229 	2A8C
		STR 	4CH 			//022A 	01CC

		//;remote-38k-6key-RGB.C: 566: PAIE=1;
		BSR 	INTCON,3 		//022B 	198B

		//;remote-38k-6key-RGB.C: 567: TMR2IE=1;
		BSR 	STATUS,5 		//022C 	1A83
		BSR 	CH,1 			//022D 	188C

		//;remote-38k-6key-RGB.C: 575: repeat=0;
		BCR 	STATUS,5 		//022E 	1283
		CLRR 	55H 			//022F 	0155
		LJUMP 	21H 			//0230 	3821
		LDWI 	FFH 			//0231 	2AFF
		ADDWR 	46H,1 			//0232 	0BC6
		BTSS 	STATUS,0 		//0233 	1C03
		DECR 	47H,1 			//0234 	0DC7
		LDR 	47H,0 			//0235 	0847
		XORWI 	80H 			//0236 	2680
		STR 	7FH 			//0237 	01FF
		LDWI 	80H 			//0238 	2A80
		SUBWR 	7FH,0 			//0239 	0C7F
		BTSS 	STATUS,2 		//023A 	1D03
		RET		 					//023B 	0004
		LDWI 	1H 			//023C 	2A01
		SUBWR 	46H,0 			//023D 	0C46
		RET		 					//023E 	0004
		BCR 	INTCON,3 		//023F 	118B
		BSR 	STATUS,5 		//0240 	1A83
		BCR 	CH,1 			//0241 	108C
		BCR 	STATUS,5 		//0242 	1283
		BSR 	5H,4 			//0243 	1A05
		BSR 	5H,5 			//0244 	1A85
		BSR 	5H,0 			//0245 	1805
		RET		 					//0246 	0004
		CLRR 	49H 			//0247 	0149
		STR 	46H 			//0248 	01C6
		CLRR 	47H 			//0249 	0147
		CLRR 	44H 			//024A 	0144
		CLRR 	45H 			//024B 	0145
		RET		 					//024C 	0004
		LDR 	47H,0 			//024D 	0847
		XORWI 	80H 			//024E 	2680
		STR 	7FH 			//024F 	01FF
		LDWI 	80H 			//0250 	2A80
		SUBWR 	7FH,0 			//0251 	0C7F
		BTSS 	STATUS,2 		//0252 	1D03
		RET		 					//0253 	0004
		LDWI 	B4H 			//0254 	2AB4
		SUBWR 	46H,0 			//0255 	0C46
		RET		 					//0256 	0004
		STR 	48H 			//0257 	01C8
		CLRR 	49H 			//0258 	0149
		STR 	46H 			//0259 	01C6
		CLRR 	47H 			//025A 	0147
		STR 	44H 			//025B 	01C4
		CLRR 	45H 			//025C 	0145
		BCR 	5H,4 			//025D 	1205
		BCR 	5H,5 			//025E 	1285
		BCR 	5H,0 			//025F 	1005
		RET		 					//0260 	0004
		LDWI 	B4H 			//0261 	2AB4
		STR 	48H 			//0262 	01C8
		CLRR 	49H 			//0263 	0149
		CLRR 	46H 			//0264 	0146
		CLRR 	47H 			//0265 	0147
		STR 	44H 			//0266 	01C4
		CLRR 	45H 			//0267 	0145
		RET		 					//0268 	0004
		LDWI 	B4H 			//0269 	2AB4
		CLRR 	48H 			//026A 	0148
		CLRR 	49H 			//026B 	0149
		STR 	46H 			//026C 	01C6
		CLRR 	47H 			//026D 	0147
		STR 	44H 			//026E 	01C4
		CLRR 	45H 			//026F 	0145
		RET		 					//0270 	0004
		LDR 	49H,0 			//0271 	0849
		XORWI 	80H 			//0272 	2680
		STR 	7FH 			//0273 	01FF
		LDWI 	80H 			//0274 	2A80
		SUBWR 	7FH,0 			//0275 	0C7F
		RET		 					//0276 	0004
		LDR 	45H,0 			//0277 	0845
		XORWI 	80H 			//0278 	2680
		STR 	7FH 			//0279 	01FF
		LDWI 	80H 			//027A 	2A80
		SUBWR 	7FH,0 			//027B 	0C7F
		RET		 					//027C 	0004
		CLRR 	49H 			//027D 	0149
		CLRR 	46H 			//027E 	0146
		CLRR 	47H 			//027F 	0147
		CLRR 	44H 			//0280 	0144
		CLRR 	45H 			//0281 	0145
		RET		 					//0282 	0004

		//;remote-38k-6key-RGB.C: 78: if(PAIE && PAIF)
		BTSC 	INTCON,3 		//0283 	158B
		BTSS 	INTCON,0 		//0284 	1C0B
		LJUMP 	2C2H 			//0285 	3AC2

		//;remote-38k-6key-RGB.C: 79: {
		//;remote-38k-6key-RGB.C: 81: PA2=~PA2;
		LDWI 	4H 			//0286 	2A04
		BCR 	STATUS,5 		//0287 	1283
		XORWR 	5H,1 			//0288 	0485

		//;remote-38k-6key-RGB.C: 83: if(Counter>150){
		LDWI 	97H 			//0289 	2A97
		SUBWR 	58H,0 			//028A 	0C58
		BTSS 	STATUS,0 		//028B 	1C03
		LJUMP 	295H 			//028C 	3A95
		LDWI 	4H 			//028D 	2A04

		//;remote-38k-6key-RGB.C: 85: Counter=0;
		CLRR 	58H 			//028E 	0158

		//;remote-38k-6key-RGB.C: 87: if(mode<4){
		SUBWR 	57H,0 			//028F 	0C57
		BTSC 	STATUS,0 		//0290 	1403
		LJUMP 	295H 			//0291 	3A95

		//;remote-38k-6key-RGB.C: 88: PA4=0;
		BCR 	5H,4 			//0292 	1205

		//;remote-38k-6key-RGB.C: 89: PA5=0;
		BCR 	5H,5 			//0293 	1285

		//;remote-38k-6key-RGB.C: 90: PA0=0;
		BCR 	5H,0 			//0294 	1005

		//;remote-38k-6key-RGB.C: 91: }
		//;remote-38k-6key-RGB.C: 93: }
		//;remote-38k-6key-RGB.C: 97: if(Set==1){
		DECRSZ 	61H,0 		//0295 	0E61
		LJUMP 	2A0H 			//0296 	3AA0

		//;remote-38k-6key-RGB.C: 98: if(Counter_On>Counter_On_set){
		LDR 	79H,0 			//0297 	0879
		SUBWR 	54H,0 			//0298 	0C54
		BTSC 	STATUS,0 		//0299 	1403
		LJUMP 	29EH 			//029A 	3A9E

		//;remote-38k-6key-RGB.C: 99: Counter_On=Counter_On-1;
		LDWI 	FFH 			//029B 	2AFF
		ADDWR 	79H,1 			//029C 	0BF9

		//;remote-38k-6key-RGB.C: 100: }else{
		LJUMP 	2A0H 			//029D 	3AA0

		//;remote-38k-6key-RGB.C: 101: Counter_On=Counter_On_set;
		LDR 	54H,0 			//029E 	0854
		STR 	79H 			//029F 	01F9

		//;remote-38k-6key-RGB.C: 102: }
		//;remote-38k-6key-RGB.C: 103: }
		//;remote-38k-6key-RGB.C: 105: if(Set==0 && Counter_On<=180)
		LDR 	61H,0 			//02A0 	0861
		BTSS 	STATUS,2 		//02A1 	1D03
		LJUMP 	2A9H 			//02A2 	3AA9
		LDWI 	B5H 			//02A3 	2AB5
		SUBWR 	79H,0 			//02A4 	0C79
		BTSC 	STATUS,0 		//02A5 	1403
		LJUMP 	2A9H 			//02A6 	3AA9

		//;remote-38k-6key-RGB.C: 106: {
		//;remote-38k-6key-RGB.C: 107: Counter_On=Counter_On+2;
		INCR	79H,1 			//02A7 	09F9
		INCR	79H,1 			//02A8 	09F9

		//;remote-38k-6key-RGB.C: 108: }
		//;remote-38k-6key-RGB.C: 116: ReadAPin = PORTA;
		LDR 	5H,0 			//02A9 	0805

		//;remote-38k-6key-RGB.C: 117: PAIF = 0;
		BCR 	INTCON,0 		//02AA 	100B
		LDWI 	96H 			//02AB 	2A96

		//;remote-38k-6key-RGB.C: 122: CountINT++;
		INCR	50H,1 			//02AC 	09D0

		//;remote-38k-6key-RGB.C: 123: if(CountINT>=150){
		SUBWR 	50H,0 			//02AD 	0C50
		BTSS 	STATUS,0 		//02AE 	1C03
		LJUMP 	2C2H 			//02AF 	3AC2
		LDWI 	3CH 			//02B0 	2A3C

		//;remote-38k-6key-RGB.C: 125: CountINT=0;
		CLRR 	50H 			//02B1 	0150

		//;remote-38k-6key-RGB.C: 127: s++;
		INCR	53H,1 			//02B2 	09D3

		//;remote-38k-6key-RGB.C: 128: re=0;
		CLRR 	56H 			//02B3 	0156

		//;remote-38k-6key-RGB.C: 129: if(s>=60){
		SUBWR 	53H,0 			//02B4 	0C53
		BTSS 	STATUS,0 		//02B5 	1C03
		LJUMP 	2BCH 			//02B6 	3ABC

		//;remote-38k-6key-RGB.C: 130: s=0;
		CLRR 	53H 			//02B7 	0153

		//;remote-38k-6key-RGB.C: 131: if(timer>0)m++;
		LDR 	4EH,0 			//02B8 	084E
		BTSC 	STATUS,2 		//02B9 	1503
		LJUMP 	2BCH 			//02BA 	3ABC
		INCR	52H,1 			//02BB 	09D2

		//;remote-38k-6key-RGB.C: 132: }
		//;remote-38k-6key-RGB.C: 134: if(m>=60)m=0,h++;
		LDWI 	3CH 			//02BC 	2A3C
		SUBWR 	52H,0 			//02BD 	0C52
		BTSS 	STATUS,0 		//02BE 	1C03
		LJUMP 	2C2H 			//02BF 	3AC2
		CLRR 	52H 			//02C0 	0152
		INCR	51H,1 			//02C1 	09D1

		//;remote-38k-6key-RGB.C: 135: }
		//;remote-38k-6key-RGB.C: 140: }
		//;remote-38k-6key-RGB.C: 150: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//02C2 	1A83
		BTSS 	CH,1 			//02C3 	1C8C
		LJUMP 	33EH 			//02C4 	3B3E
		BCR 	STATUS,5 		//02C5 	1283
		BTSS 	CH,1 			//02C6 	1C8C
		LJUMP 	33EH 			//02C7 	3B3E

		//;remote-38k-6key-RGB.C: 151: {
		//;remote-38k-6key-RGB.C: 153: TMR2IF = 0;
		BCR 	CH,1 			//02C8 	108C

		//;remote-38k-6key-RGB.C: 154: TMR2IE = 1;
		BSR 	STATUS,5 		//02C9 	1A83
		BSR 	CH,1 			//02CA 	188C

		//;remote-38k-6key-RGB.C: 158: Counter++;
		BCR 	STATUS,5 		//02CB 	1283
		INCR	58H,1 			//02CC 	09D8

		//;remote-38k-6key-RGB.C: 160: if(Counter>=Counter_On && mode<4)
		LDR 	79H,0 			//02CD 	0879
		SUBWR 	58H,0 			//02CE 	0C58
		BTSS 	STATUS,0 		//02CF 	1C03
		LJUMP 	2FBH 			//02D0 	3AFB
		LDWI 	4H 			//02D1 	2A04
		SUBWR 	57H,0 			//02D2 	0C57
		BTSC 	STATUS,0 		//02D3 	1403
		LJUMP 	2FBH 			//02D4 	3AFB

		//;remote-38k-6key-RGB.C: 161: {
		//;remote-38k-6key-RGB.C: 162: if(Counter>=R){
		LDR 	49H,0 			//02D5 	0849
		XORWI 	80H 			//02D6 	2680
		SUBWI 	80H 			//02D7 	2880
		BTSS 	STATUS,2 		//02D8 	1D03
		LJUMP 	2DCH 			//02D9 	3ADC
		LDR 	48H,0 			//02DA 	0848
		SUBWR 	58H,0 			//02DB 	0C58

		//;remote-38k-6key-RGB.C: 163: PA4=1;
		BCR 	STATUS,5 		//02DC 	1283
		BTSS 	STATUS,0 		//02DD 	1C03
		LJUMP 	2E2H 			//02DE 	3AE2
		BSR 	5H,4 			//02DF 	1A05

		//;remote-38k-6key-RGB.C: 164: PA4=1;
		BSR 	5H,4 			//02E0 	1A05

		//;remote-38k-6key-RGB.C: 165: }
		//;remote-38k-6key-RGB.C: 167: if(Counter>=G){
		BCR 	STATUS,5 		//02E1 	1283
		LDR 	47H,0 			//02E2 	0847
		XORWI 	80H 			//02E3 	2680
		SUBWI 	80H 			//02E4 	2880
		BTSS 	STATUS,2 		//02E5 	1D03
		LJUMP 	2E9H 			//02E6 	3AE9
		LDR 	46H,0 			//02E7 	0846
		SUBWR 	58H,0 			//02E8 	0C58

		//;remote-38k-6key-RGB.C: 168: PA5=1;
		BCR 	STATUS,5 		//02E9 	1283
		BTSS 	STATUS,0 		//02EA 	1C03
		LJUMP 	2EFH 			//02EB 	3AEF
		BSR 	5H,5 			//02EC 	1A85

		//;remote-38k-6key-RGB.C: 169: PA5=1;
		BSR 	5H,5 			//02ED 	1A85

		//;remote-38k-6key-RGB.C: 170: }
		//;remote-38k-6key-RGB.C: 172: if(Counter>=B){
		BCR 	STATUS,5 		//02EE 	1283
		LDR 	45H,0 			//02EF 	0845
		XORWI 	80H 			//02F0 	2680
		SUBWI 	80H 			//02F1 	2880
		BTSS 	STATUS,2 		//02F2 	1D03
		LJUMP 	2F6H 			//02F3 	3AF6
		LDR 	44H,0 			//02F4 	0844
		SUBWR 	58H,0 			//02F5 	0C58

		//;remote-38k-6key-RGB.C: 173: PA0=1;
		BCR 	STATUS,5 		//02F6 	1283
		BTSS 	STATUS,0 		//02F7 	1C03
		LJUMP 	2FCH 			//02F8 	3AFC
		BSR 	5H,0 			//02F9 	1805

		//;remote-38k-6key-RGB.C: 174: PA0=1;
		BSR 	5H,0 			//02FA 	1805

		//;remote-38k-6key-RGB.C: 175: }
		//;remote-38k-6key-RGB.C: 178: }
		//;remote-38k-6key-RGB.C: 186: if(ir_timer){
		BCR 	STATUS,5 		//02FB 	1283
		LDR 	59H,0 			//02FC 	0859
		BTSS 	STATUS,2 		//02FD 	1D03

		//;remote-38k-6key-RGB.C: 187: IRbitTime++;
		INCR	78H,1 			//02FE 	09F8

		//;remote-38k-6key-RGB.C: 192: }
		//;remote-38k-6key-RGB.C: 193: }
		//;remote-38k-6key-RGB.C: 195: if(ir_status != PA3){
		//;remote-38k-6key-RGB.C: 188: if(IRbitTime > 1600)
		LDWI 	0H 			//02FF 	2A00
		BTSC 	5H,3 			//0300 	1585
		LDWI 	1H 			//0301 	2A01
		XORWR 	7AH,0 			//0302 	047A
		BTSC 	STATUS,2 		//0303 	1503
		LJUMP 	33EH 			//0304 	3B3E

		//;remote-38k-6key-RGB.C: 196: ir_status=PA3;
		LDWI 	0H 			//0305 	2A00
		BTSC 	5H,3 			//0306 	1585
		LDWI 	1H 			//0307 	2A01
		STR 	7AH 			//0308 	01FA

		//;remote-38k-6key-RGB.C: 198: if(ir_status==0){
		LDR 	7AH,0 			//0309 	087A
		BTSS 	STATUS,2 		//030A 	1D03
		LJUMP 	33EH 			//030B 	3B3E
		LDWI 	BFH 			//030C 	2ABF

		//;remote-38k-6key-RGB.C: 200: ir_timer = 1;
		CLRR 	59H 			//030D 	0159
		INCR	59H,1 			//030E 	09D9

		//;remote-38k-6key-RGB.C: 202: if(IRbitTime > 190)
		SUBWR 	78H,0 			//030F 	0C78
		BTSS 	STATUS,0 		//0310 	1C03
		LJUMP 	319H 			//0311 	3B19

		//;remote-38k-6key-RGB.C: 203: {
		//;remote-38k-6key-RGB.C: 204: IRDataTimer[0] = 0;
		CLRR 	40H 			//0312 	0140

		//;remote-38k-6key-RGB.C: 205: IRDataTimer[1] = 0;
		CLRR 	41H 			//0313 	0141

		//;remote-38k-6key-RGB.C: 206: IRDataTimer[2] = 0;
		CLRR 	42H 			//0314 	0142

		//;remote-38k-6key-RGB.C: 207: IRDataTimer[3] = 0;
		CLRR 	43H 			//0315 	0143

		//;remote-38k-6key-RGB.C: 208: IRbitNum = 0;
		CLRR 	4BH 			//0316 	014B

		//;remote-38k-6key-RGB.C: 209: bitdata = 0x00;
		CLRR 	60H 			//0317 	0160

		//;remote-38k-6key-RGB.C: 210: }
		LJUMP 	32DH 			//0318 	3B2D

		//;remote-38k-6key-RGB.C: 211: else if(IRbitTime > 150)
		LDWI 	97H 			//0319 	2A97
		SUBWR 	78H,0 			//031A 	0C78
		BTSS 	STATUS,0 		//031B 	1C03
		LJUMP 	323H 			//031C 	3B23

		//;remote-38k-6key-RGB.C: 212: {
		//;remote-38k-6key-RGB.C: 213: if(ReceiveFinish==0)repeat=1;
		LDR 	4AH,0 			//031D 	084A
		BTSS 	STATUS,2 		//031E 	1D03
		LJUMP 	32DH 			//031F 	3B2D
		CLRR 	55H 			//0320 	0155
		INCR	55H,1 			//0321 	09D5
		LJUMP 	32DH 			//0322 	3B2D

		//;remote-38k-6key-RGB.C: 215: else if(IRbitTime > 30)
		LDWI 	1FH 			//0323 	2A1F
		SUBWR 	78H,0 			//0324 	0C78
		BTSS 	STATUS,0 		//0325 	1C03
		LJUMP 	32DH 			//0326 	3B2D

		//;remote-38k-6key-RGB.C: 216: {
		//;remote-38k-6key-RGB.C: 217: IRDataTimer[IRbitNum-1] |= bitdata;
		LDR 	4BH,0 			//0327 	084B
		ADDWI 	3FH 			//0328 	273F
		STR 	FSR 			//0329 	0184
		LDR 	60H,0 			//032A 	0860
		BCR 	STATUS,7 		//032B 	1383
		IORWR 	INDF,1 		//032C 	0380

		//;remote-38k-6key-RGB.C: 218: }
		//;remote-38k-6key-RGB.C: 220: IRbitTime = 0;
		CLRR 	78H 			//032D 	0178

		//;remote-38k-6key-RGB.C: 221: bitdata<<=1;
		BCR 	STATUS,0 		//032E 	1003
		RLR 	60H,1 			//032F 	05E0

		//;remote-38k-6key-RGB.C: 222: if(bitdata == 0)
		LDR 	60H,0 			//0330 	0860
		BTSS 	STATUS,2 		//0331 	1D03
		LJUMP 	336H 			//0332 	3B36

		//;remote-38k-6key-RGB.C: 223: {
		//;remote-38k-6key-RGB.C: 224: bitdata = 0x01;
		CLRR 	60H 			//0333 	0160
		INCR	60H,1 			//0334 	09E0

		//;remote-38k-6key-RGB.C: 225: IRbitNum++;
		INCR	4BH,1 			//0335 	09CB

		//;remote-38k-6key-RGB.C: 226: }
		//;remote-38k-6key-RGB.C: 227: if(IRbitNum > 4)
		LDWI 	5H 			//0336 	2A05
		SUBWR 	4BH,0 			//0337 	0C4B
		BTSS 	STATUS,0 		//0338 	1C03
		LJUMP 	33EH 			//0339 	3B3E

		//;remote-38k-6key-RGB.C: 228: {
		//;remote-38k-6key-RGB.C: 229: IRbitNum = 0;
		CLRR 	4BH 			//033A 	014B

		//;remote-38k-6key-RGB.C: 230: ir_timer = 0;
		CLRR 	59H 			//033B 	0159

		//;remote-38k-6key-RGB.C: 231: ReceiveFinish = 1;
		CLRR 	4AH 			//033C 	014A
		INCR	4AH,1 			//033D 	09CA
		LDR 	72H,0 			//033E 	0872
		STR 	PCLATH 			//033F 	018A
		LDR 	71H,0 			//0340 	0871
		STR 	FSR 			//0341 	0184
		SWAPR 	70H,0 			//0342 	0770
		STR 	STATUS 			//0343 	0183
		SWAPR 	7EH,1 			//0344 	07FE
		SWAPR 	7EH,0 			//0345 	077E
		RETI		 			//0346 	0009
		STR 	75H 			//0347 	01F5
		LDWI 	8H 			//0348 	2A08
		STR 	76H 			//0349 	01F6
		CLRR 	77H 			//034A 	0177
		LDR 	75H,0 			//034B 	0875
		STR 	74H 			//034C 	01F4
		LDWI 	7H 			//034D 	2A07
		BCR 	STATUS,0 		//034E 	1003
		RRR	74H,1 			//034F 	06F4
		ADDWI 	FFH 			//0350 	27FF
		BCR 	STATUS,0 		//0351 	1003
		BTSS 	STATUS,2 		//0352 	1D03
		LJUMP 	34FH 			//0353 	3B4F
		RLR 	77H,0 			//0354 	0577
		IORWR 	74H,0 			//0355 	0374
		STR 	77H 			//0356 	01F7
		BCR 	STATUS,0 		//0357 	1003
		RLR 	75H,1 			//0358 	05F5
		LDR 	73H,0 			//0359 	0873
		SUBWR 	77H,0 			//035A 	0C77
		BTSS 	STATUS,0 		//035B 	1C03
		LJUMP 	35FH 			//035C 	3B5F
		LDR 	73H,0 			//035D 	0873
		SUBWR 	77H,1 			//035E 	0CF7
		DECRSZ 	76H,1 		//035F 	0EF6
		LJUMP 	34BH 			//0360 	3B4B
		LDR 	77H,0 			//0361 	0877
		RET		 					//0362 	0004
		STR 	5AH 			//0363 	01DA

		//;remote-38k-6key-RGB.C: 64: unsigned char a,b;
		//;remote-38k-6key-RGB.C: 65: for(a=0;a<Time;a++)
		CLRR 	5BH 			//0364 	015B
		LDR 	5AH,0 			//0365 	085A
		SUBWR 	5BH,0 			//0366 	0C5B
		BTSC 	STATUS,0 		//0367 	1403
		RET		 					//0368 	0004

		//;remote-38k-6key-RGB.C: 66: {
		//;remote-38k-6key-RGB.C: 67: for(b=0;b<10;b++)
		CLRR 	5CH 			//0369 	015C

		//;remote-38k-6key-RGB.C: 68: {
		//;remote-38k-6key-RGB.C: 69: DelayMs(100);
		LDWI 	64H 			//036A 	2A64
		LCALL 	374H 			//036B 	3374
		LDWI 	AH 			//036C 	2A0A
		BCR 	STATUS,5 		//036D 	1283
		INCR	5CH,1 			//036E 	09DC
		SUBWR 	5CH,0 			//036F 	0C5C
		BTSS 	STATUS,0 		//0370 	1C03
		LJUMP 	36AH 			//0371 	3B6A
		INCR	5BH,1 			//0372 	09DB
		LJUMP 	365H 			//0373 	3B65
		STR 	75H 			//0374 	01F5

		//;remote-38k-6key-RGB.C: 51: unsigned char a,b;
		//;remote-38k-6key-RGB.C: 52: for(a=0;a<Time;a++)
		CLRR 	76H 			//0375 	0176
		LDR 	75H,0 			//0376 	0875
		SUBWR 	76H,0 			//0377 	0C76
		BTSC 	STATUS,0 		//0378 	1403
		RET		 					//0379 	0004

		//;remote-38k-6key-RGB.C: 53: {
		//;remote-38k-6key-RGB.C: 54: for(b=0;b<5;b++)
		CLRR 	77H 			//037A 	0177

		//;remote-38k-6key-RGB.C: 55: {
		//;remote-38k-6key-RGB.C: 56: DelayUs(98);
		LDWI 	62H 			//037B 	2A62
		LCALL 	3A9H 			//037C 	33A9
		LDWI 	5H 			//037D 	2A05
		INCR	77H,1 			//037E 	09F7
		SUBWR 	77H,0 			//037F 	0C77
		BTSS 	STATUS,0 		//0380 	1C03
		LJUMP 	37BH 			//0381 	3B7B
		INCR	76H,1 			//0382 	09F6
		LJUMP 	376H 			//0383 	3B76

		//;remote-38k-6key-RGB.C: 249: OSCCON = 0B11110000;
		LDWI 	F0H 			//0384 	2AF0
		BSR 	STATUS,5 		//0385 	1A83
		STR 	FH 			//0386 	018F

		//;remote-38k-6key-RGB.C: 251: INTCON = 0;
		CLRR 	INTCON 			//0387 	010B

		//;remote-38k-6key-RGB.C: 252: OPTION = 0B00001000;
		LDWI 	8H 			//0388 	2A08
		STR 	1H 			//0389 	0181

		//;remote-38k-6key-RGB.C: 254: PORTA = 0B00000000;
		BCR 	STATUS,5 		//038A 	1283
		CLRR 	5H 			//038B 	0105

		//;remote-38k-6key-RGB.C: 255: TRISA = 0B00001010;
		LDWI 	AH 			//038C 	2A0A
		BSR 	STATUS,5 		//038D 	1A83
		STR 	5H 			//038E 	0185

		//;remote-38k-6key-RGB.C: 257: WPUA = 0B00000000;
		CLRR 	15H 			//038F 	0115

		//;remote-38k-6key-RGB.C: 259: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//0390 	1283
		CLRR 	1BH 			//0391 	011B
		RET		 					//0392 	0004

		//;remote-38k-6key-RGB.C: 275: T2CON = 0B00000001;
		LDWI 	1H 			//0393 	2A01
		BCR 	STATUS,5 		//0394 	1283
		STR 	12H 			//0395 	0192

		//;remote-38k-6key-RGB.C: 277: TMR2 = 0;
		CLRR 	11H 			//0396 	0111

		//;remote-38k-6key-RGB.C: 278: PR2 = 63;
		LDWI 	3FH 			//0397 	2A3F
		BSR 	STATUS,5 		//0398 	1A83
		STR 	12H 			//0399 	0192

		//;remote-38k-6key-RGB.C: 279: TMR2IF = 0;
		BCR 	STATUS,5 		//039A 	1283
		BCR 	CH,1 			//039B 	108C

		//;remote-38k-6key-RGB.C: 281: TMR2ON = 1;
		BSR 	12H,2 			//039C 	1912

		//;remote-38k-6key-RGB.C: 282: PEIE=1;
		BSR 	INTCON,6 		//039D 	1B0B

		//;remote-38k-6key-RGB.C: 283: GIE = 1;
		BSR 	INTCON,7 		//039E 	1B8B
		RET		 					//039F 	0004

		//;remote-38k-6key-RGB.C: 265: TRISA1 =1;
		BSR 	STATUS,5 		//03A0 	1A83
		BSR 	5H,1 			//03A1 	1885

		//;remote-38k-6key-RGB.C: 266: ReadAPin = PORTA;
		BCR 	STATUS,5 		//03A2 	1283
		LDR 	5H,0 			//03A3 	0805

		//;remote-38k-6key-RGB.C: 267: PAIF =0;
		BCR 	INTCON,0 		//03A4 	100B

		//;remote-38k-6key-RGB.C: 268: IOCA1 =1;
		BSR 	STATUS,5 		//03A5 	1A83
		BSR 	16H,1 			//03A6 	1896

		//;remote-38k-6key-RGB.C: 269: INTEDG=0;
		BCR 	1H,6 			//03A7 	1301
		RET		 					//03A8 	0004
		STR 	73H 			//03A9 	01F3

		//;remote-38k-6key-RGB.C: 41: unsigned char a;
		//;remote-38k-6key-RGB.C: 42: for(a=0;a<Time;a++)
		CLRR 	74H 			//03AA 	0174
		LDR 	73H,0 			//03AB 	0873
		SUBWR 	74H,0 			//03AC 	0C74
		BTSC 	STATUS,0 		//03AD 	1403
		RET		 					//03AE 	0004

		//;remote-38k-6key-RGB.C: 43: {
		//;remote-38k-6key-RGB.C: 44: __nop();
		NOP		 					//03AF 	0000
		INCR	74H,1 			//03B0 	09F4
		LJUMP 	3ABH 			//03B1 	3BAB
		CLRWDT	 			//03B2 	0001
		CLRR 	INDF 			//03B3 	0100
		INCR	FSR,1 			//03B4 	0984
		XORWR 	FSR,0 			//03B5 	0404
		BTSC 	STATUS,2 		//03B6 	1503
		RETW 	0H 			//03B7 	2100
		XORWR 	FSR,0 			//03B8 	0404
		LJUMP 	3B3H 			//03B9 	3BB3
			END
