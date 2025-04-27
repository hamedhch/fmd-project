//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_R		EQU		5AH
		_G		EQU		58H
		_B		EQU		56H
		_ir_status		EQU		79H
		_ir_timer		EQU		55H
		_Counter		EQU		54H
		_Set		EQU		5EH
		_mode		EQU		53H
		_re		EQU		52H
		_repeat		EQU		51H
		_Counter_On_set		EQU		5DH
		_Counter_On		EQU		7AH
		_s		EQU		50H
		_m		EQU		4FH
		_h		EQU		4EH
		_CountINT		EQU		4DH
		_RGB		EQU		4CH
		_timer		EQU		4BH
		_one		EQU		4AH
		_modetime		EQU		49H
		_Rq		EQU		48H
		_Gq		EQU		47H
		_Bq		EQU		46H
		_IRbitNum		EQU		45H
		_IRbitTime		EQU		78H
		_IRDataTimer		EQU		40H
		_bitdata		EQU		5CH
		_ReceiveFinish		EQU		44H
//		main@a		EQU		62H
//		main@rdata2		EQU		64H
//		main@rdata1		EQU		63H
//		___lbmod@dividend		EQU		75H
//		___lbmod@rem		EQU		77H
//		___lbmod@counter		EQU		76H
//		___lbmod@dividend		EQU		75H
//		___lbmod@divisor		EQU		73H
//		___lbmod@dividend		EQU		75H
//		DelayS@Time		EQU		5FH
//		DelayS@b		EQU		61H
//		DelayS@a		EQU		60H
//		DelayS@Time		EQU		5FH
//		DelayS@Time		EQU		5FH
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
		LJUMP 	2B9H 			//000B 	3AB9
		LJUMP 	0DH 			//000C 	380D
		LDWI 	14H 			//000D 	2A14
		STR 	56H 			//000E 	01D6
		CLRR 	57H 			//000F 	0157
		STR 	58H 			//0010 	01D8
		CLRR 	59H 			//0011 	0159
		STR 	5AH 			//0012 	01DA
		LDWI 	1H 			//0013 	2A01
		CLRR 	5BH 			//0014 	015B
		STR 	5CH 			//0015 	01DC
		LDWI 	28H 			//0016 	2A28
		STR 	5DH 			//0017 	01DD
		LDWI 	1H 			//0018 	2A01
		STR 	5EH 			//0019 	01DE
		LDWI 	28H 			//001A 	2A28
		STR 	7AH 			//001B 	01FA
		LDWI 	40H 			//001C 	2A40
		BCR 	STATUS,7 		//001D 	1383
		STR 	FSR 			//001E 	0184
		LDWI 	56H 			//001F 	2A56
		LCALL 	3F2H 			//0020 	33F2
		CLRR 	78H 			//0021 	0178
		CLRR 	79H 			//0022 	0179
		CLRR 	STATUS 			//0023 	0103
		LJUMP 	25H 			//0024 	3825

		//;remote-38k-6key-RGB.C: 354: unsigned char rdata1,rdata2;
		//;remote-38k-6key-RGB.C: 356: POWER_INITIAL();
		LCALL 	3AAH 			//0025 	33AA

		//;remote-38k-6key-RGB.C: 360: INT_INITIAL();
		LCALL 	3FAH 			//0026 	33FA

		//;remote-38k-6key-RGB.C: 362: TIMER2_INITIAL();
		LCALL 	3DCH 			//0027 	33DC

		//;remote-38k-6key-RGB.C: 364: GIE = 1;
		BSR 	INTCON,7 		//0028 	1B8B

		//;remote-38k-6key-RGB.C: 366: INTE =1;
		BSR 	INTCON,4 		//0029 	1A0B

		//;remote-38k-6key-RGB.C: 367: TMR2IE = 1;
		BSR 	STATUS,5 		//002A 	1A83
		BSR 	CH,1 			//002B 	188C

		//;remote-38k-6key-RGB.C: 370: {
		//;remote-38k-6key-RGB.C: 372: if(h==timer && h!=0){
		BCR 	STATUS,5 		//002C 	1283
		LDR 	4EH,0 			//002D 	084E
		XORWR 	4BH,0 			//002E 	044B
		BTSS 	STATUS,2 		//002F 	1D03
		LJUMP 	38H 			//0030 	3838
		LDR 	4EH,0 			//0031 	084E
		BTSC 	STATUS,2 		//0032 	1503
		LJUMP 	38H 			//0033 	3838

		//;remote-38k-6key-RGB.C: 373: Set=0;
		CLRR 	5EH 			//0034 	015E

		//;remote-38k-6key-RGB.C: 374: m=0;
		CLRR 	4FH 			//0035 	014F

		//;remote-38k-6key-RGB.C: 375: h=0;
		CLRR 	4EH 			//0036 	014E

		//;remote-38k-6key-RGB.C: 376: timer=0;
		CLRR 	4BH 			//0037 	014B

		//;remote-38k-6key-RGB.C: 377: }
		//;remote-38k-6key-RGB.C: 381: if(mode==2 || mode==1 ){
		LDWI 	2H 			//0038 	2A02
		XORWR 	53H,0 			//0039 	0453
		BTSC 	STATUS,2 		//003A 	1503
		LJUMP 	3EH 			//003B 	383E
		DECRSZ 	53H,0 		//003C 	0E53
		LJUMP 	98H 			//003D 	3898

		//;remote-38k-6key-RGB.C: 382: if(Counter%modetime==0){
		LDR 	49H,0 			//003E 	0849
		STR 	73H 			//003F 	01F3
		LDR 	54H,0 			//0040 	0854
		LCALL 	38EH 			//0041 	338E
		XORWI 	0H 			//0042 	2600
		BTSS 	STATUS,2 		//0043 	1D03
		LJUMP 	98H 			//0044 	3898

		//;remote-38k-6key-RGB.C: 384: if(RGB==0 ){
		LDR 	4CH,0 			//0045 	084C
		BTSS 	STATUS,2 		//0046 	1D03
		LJUMP 	4FH 			//0047 	384F

		//;remote-38k-6key-RGB.C: 385: G=G-1;
		LDWI 	FFH 			//0048 	2AFF

		//;remote-38k-6key-RGB.C: 386: if(G<=0)RGB=1;
		LCALL 	243H 			//0049 	3243
		BCR 	STATUS,5 		//004A 	1283
		BTSC 	STATUS,0 		//004B 	1403
		LJUMP 	50H 			//004C 	3850
		CLRR 	4CH 			//004D 	014C
		INCR	4CH,1 			//004E 	09CC

		//;remote-38k-6key-RGB.C: 387: }
		//;remote-38k-6key-RGB.C: 388: if(RGB==1 ){
		BCR 	STATUS,5 		//004F 	1283
		DECRSZ 	4CH,0 		//0050 	0E4C
		LJUMP 	59H 			//0051 	3859

		//;remote-38k-6key-RGB.C: 389: B=B+1;
		INCR	56H,1 			//0052 	09D6
		BTSC 	STATUS,2 		//0053 	1503
		INCR	57H,1 			//0054 	09D7

		//;remote-38k-6key-RGB.C: 390: if(B>=160)RGB=2;
		LCALL 	278H 			//0055 	3278
		BTSS 	STATUS,0 		//0056 	1C03
		LJUMP 	5BH 			//0057 	385B
		STR 	4CH 			//0058 	01CC

		//;remote-38k-6key-RGB.C: 391: }
		//;remote-38k-6key-RGB.C: 392: if(RGB==2 ){
		LDWI 	2H 			//0059 	2A02
		BCR 	STATUS,5 		//005A 	1283
		XORWR 	4CH,0 			//005B 	044C
		BTSS 	STATUS,2 		//005C 	1D03
		LJUMP 	63H 			//005D 	3863

		//;remote-38k-6key-RGB.C: 393: R=R-1;
		LDWI 	FFH 			//005E 	2AFF

		//;remote-38k-6key-RGB.C: 394: if(R<=0)RGB=3;
		LCALL 	269H 			//005F 	3269
		BTSC 	STATUS,0 		//0060 	1403
		LJUMP 	65H 			//0061 	3865
		STR 	4CH 			//0062 	01CC

		//;remote-38k-6key-RGB.C: 395: }
		//;remote-38k-6key-RGB.C: 396: if(RGB==3 ){
		LDWI 	3H 			//0063 	2A03
		BCR 	STATUS,5 		//0064 	1283
		XORWR 	4CH,0 			//0065 	044C
		BTSS 	STATUS,2 		//0066 	1D03
		LJUMP 	71H 			//0067 	3871

		//;remote-38k-6key-RGB.C: 397: G=G+1;
		INCR	58H,1 			//0068 	09D8
		BTSC 	STATUS,2 		//0069 	1503
		INCR	59H,1 			//006A 	09D9

		//;remote-38k-6key-RGB.C: 398: if(G>=160)RGB=4;
		LCALL 	250H 			//006B 	3250
		LDWI 	4H 			//006C 	2A04
		BCR 	STATUS,5 		//006D 	1283
		BTSS 	STATUS,0 		//006E 	1C03
		LJUMP 	73H 			//006F 	3873
		STR 	4CH 			//0070 	01CC

		//;remote-38k-6key-RGB.C: 399: }
		//;remote-38k-6key-RGB.C: 400: if(RGB==4 ){
		LDWI 	4H 			//0071 	2A04
		BCR 	STATUS,5 		//0072 	1283
		XORWR 	4CH,0 			//0073 	044C
		BTSS 	STATUS,2 		//0074 	1D03
		LJUMP 	7BH 			//0075 	387B

		//;remote-38k-6key-RGB.C: 401: B=B-1;
		LDWI 	FFH 			//0076 	2AFF

		//;remote-38k-6key-RGB.C: 402: if(B<=0)RGB=5;
		LCALL 	25AH 			//0077 	325A
		BTSC 	STATUS,0 		//0078 	1403
		LJUMP 	7DH 			//0079 	387D
		STR 	4CH 			//007A 	01CC

		//;remote-38k-6key-RGB.C: 403: }
		//;remote-38k-6key-RGB.C: 404: if(RGB==5 ){
		LDWI 	5H 			//007B 	2A05
		BCR 	STATUS,5 		//007C 	1283
		XORWR 	4CH,0 			//007D 	044C
		BTSS 	STATUS,2 		//007E 	1D03
		LJUMP 	87H 			//007F 	3887

		//;remote-38k-6key-RGB.C: 405: G=G-1;
		LDWI 	FFH 			//0080 	2AFF

		//;remote-38k-6key-RGB.C: 406: if(G<=0)RGB=6;
		LCALL 	243H 			//0081 	3243
		LDWI 	6H 			//0082 	2A06
		BCR 	STATUS,5 		//0083 	1283
		BTSC 	STATUS,0 		//0084 	1403
		LJUMP 	89H 			//0085 	3889
		STR 	4CH 			//0086 	01CC

		//;remote-38k-6key-RGB.C: 407: }
		//;remote-38k-6key-RGB.C: 408: if(RGB==6 ){
		LDWI 	6H 			//0087 	2A06
		BCR 	STATUS,5 		//0088 	1283
		XORWR 	4CH,0 			//0089 	044C
		BTSS 	STATUS,2 		//008A 	1D03
		LJUMP 	98H 			//008B 	3898

		//;remote-38k-6key-RGB.C: 409: G=G+1;
		INCR	58H,1 			//008C 	09D8
		BTSC 	STATUS,2 		//008D 	1503
		INCR	59H,1 			//008E 	09D9

		//;remote-38k-6key-RGB.C: 410: R=R+1;
		INCR	5AH,1 			//008F 	09DA
		BTSC 	STATUS,2 		//0090 	1503
		INCR	5BH,1 			//0091 	09DB

		//;remote-38k-6key-RGB.C: 411: if(G>=160 && R>=160 )RGB=0;
		LCALL 	250H 			//0092 	3250
		BTSS 	STATUS,0 		//0093 	1C03
		LJUMP 	98H 			//0094 	3898
		LCALL 	284H 			//0095 	3284
		BTSC 	STATUS,0 		//0096 	1403
		CLRR 	4CH 			//0097 	014C

		//;remote-38k-6key-RGB.C: 412: }
		//;remote-38k-6key-RGB.C: 413: }
		//;remote-38k-6key-RGB.C: 415: }
		//;remote-38k-6key-RGB.C: 418: if(mode==3){
		LDWI 	3H 			//0098 	2A03
		BCR 	STATUS,5 		//0099 	1283
		XORWR 	53H,0 			//009A 	0453
		BTSS 	STATUS,2 		//009B 	1D03
		LJUMP 	BAH 			//009C 	38BA

		//;remote-38k-6key-RGB.C: 419: if((CountINT==50||CountINT==0)&&re==0)re=1,RGB++;
		LDWI 	32H 			//009D 	2A32
		XORWR 	4DH,0 			//009E 	044D
		BTSS 	STATUS,2 		//009F 	1D03
		LDR 	4DH,0 			//00A0 	084D
		BTSS 	STATUS,2 		//00A1 	1D03
		LJUMP 	A9H 			//00A2 	38A9
		LDR 	52H,0 			//00A3 	0852
		BTSS 	STATUS,2 		//00A4 	1D03
		LJUMP 	A9H 			//00A5 	38A9
		CLRR 	52H 			//00A6 	0152
		INCR	52H,1 			//00A7 	09D2
		INCR	4CH,1 			//00A8 	09CC

		//;remote-38k-6key-RGB.C: 421: if(RGB==0) R=160 , G=160, B=0 ;
		LDR 	4CH,0 			//00A9 	084C
		BTSS 	STATUS,2 		//00AA 	1D03
		LJUMP 	AEH 			//00AB 	38AE
		LDWI 	A0H 			//00AC 	2AA0
		LCALL 	2A2H 			//00AD 	32A2

		//;remote-38k-6key-RGB.C: 422: if(RGB==1) R=160 , G=0 , B=160 ;
		DECRSZ 	4CH,0 		//00AE 	0E4C
		LJUMP 	B1H 			//00AF 	38B1
		LCALL 	2B1H 			//00B0 	32B1

		//;remote-38k-6key-RGB.C: 423: if(RGB==2) R=0 , G=160, B=160 ;
		LDWI 	2H 			//00B1 	2A02
		XORWR 	4CH,0 			//00B2 	044C
		BTSS 	STATUS,2 		//00B3 	1D03
		LJUMP 	B6H 			//00B4 	38B6
		LCALL 	2A9H 			//00B5 	32A9

		//;remote-38k-6key-RGB.C: 424: if(RGB>=3) RGB=0;
		LDWI 	3H 			//00B6 	2A03
		SUBWR 	4CH,0 			//00B7 	0C4C
		BTSC 	STATUS,0 		//00B8 	1403
		CLRR 	4CH 			//00B9 	014C

		//;remote-38k-6key-RGB.C: 425: }
		//;remote-38k-6key-RGB.C: 427: if(mode==4&&Set==1){
		LDWI 	4H 			//00BA 	2A04
		XORWR 	53H,0 			//00BB 	0453
		BTSS 	STATUS,2 		//00BC 	1D03
		LJUMP 	F0H 			//00BD 	38F0
		DECRSZ 	5EH,0 		//00BE 	0E5E
		LJUMP 	F0H 			//00BF 	38F0

		//;remote-38k-6key-RGB.C: 429: if(s%2==0&&re==0)re=1,RGB++;
		BTSC 	50H,0 			//00C0 	1450
		LJUMP 	C8H 			//00C1 	38C8
		LDR 	52H,0 			//00C2 	0852
		BTSS 	STATUS,2 		//00C3 	1D03
		LJUMP 	C8H 			//00C4 	38C8
		CLRR 	52H 			//00C5 	0152
		INCR	52H,1 			//00C6 	09D2
		INCR	4CH,1 			//00C7 	09CC

		//;remote-38k-6key-RGB.C: 430: if(s%2==0){
		BTSC 	50H,0 			//00C8 	1450
		LJUMP 	DEH 			//00C9 	38DE

		//;remote-38k-6key-RGB.C: 431: if(CountINT%10==0)PA4=1,PA5=1,PA0=1;
		LDWI 	AH 			//00CA 	2A0A
		STR 	73H 			//00CB 	01F3
		LDR 	4DH,0 			//00CC 	084D
		LCALL 	38EH 			//00CD 	338E
		XORWI 	0H 			//00CE 	2600
		BTSS 	STATUS,2 		//00CF 	1D03
		LJUMP 	D4H 			//00D0 	38D4
		BSR 	5H,4 			//00D1 	1A05
		BSR 	5H,5 			//00D2 	1A85
		BSR 	5H,0 			//00D3 	1805

		//;remote-38k-6key-RGB.C: 432: if(CountINT%10==5)R=160 , G=160 , B=160 ,PA4=0,PA5=0,PA0=0;
		LDWI 	AH 			//00D4 	2A0A
		STR 	73H 			//00D5 	01F3
		LDR 	4DH,0 			//00D6 	084D
		LCALL 	38EH 			//00D7 	338E
		XORWI 	5H 			//00D8 	2605
		BTSS 	STATUS,2 		//00D9 	1D03
		LJUMP 	F0H 			//00DA 	38F0
		LDWI 	A0H 			//00DB 	2AA0
		LCALL 	298H 			//00DC 	3298
		LJUMP 	F0H 			//00DD 	38F0

		//;remote-38k-6key-RGB.C: 434: if(RGB==1) R=160 , G=160, B=0 ;
		DECRSZ 	4CH,0 		//00DE 	0E4C
		LJUMP 	E2H 			//00DF 	38E2
		LDWI 	A0H 			//00E0 	2AA0
		LCALL 	2A2H 			//00E1 	32A2

		//;remote-38k-6key-RGB.C: 435: if(RGB==2) R=160 , G=0 , B=160 ;
		LDWI 	2H 			//00E2 	2A02
		XORWR 	4CH,0 			//00E3 	044C
		BTSS 	STATUS,2 		//00E4 	1D03
		LJUMP 	E7H 			//00E5 	38E7
		LCALL 	2B1H 			//00E6 	32B1

		//;remote-38k-6key-RGB.C: 436: if(RGB==3) R=0 , G=160, B=160 ;
		LDWI 	3H 			//00E7 	2A03
		XORWR 	4CH,0 			//00E8 	044C
		BTSS 	STATUS,2 		//00E9 	1D03
		LJUMP 	ECH 			//00EA 	38EC
		LCALL 	2A9H 			//00EB 	32A9

		//;remote-38k-6key-RGB.C: 437: if(RGB>=3) RGB=0;
		LDWI 	3H 			//00EC 	2A03
		SUBWR 	4CH,0 			//00ED 	0C4C
		BTSC 	STATUS,0 		//00EE 	1403
		CLRR 	4CH 			//00EF 	014C

		//;remote-38k-6key-RGB.C: 438: }
		//;remote-38k-6key-RGB.C: 441: }
		//;remote-38k-6key-RGB.C: 443: if(mode==5&&Set==1){
		LDWI 	5H 			//00F0 	2A05
		XORWR 	53H,0 			//00F1 	0453
		BTSS 	STATUS,2 		//00F2 	1D03
		LJUMP 	119H 			//00F3 	3919
		DECRSZ 	5EH,0 		//00F4 	0E5E
		LJUMP 	119H 			//00F5 	3919

		//;remote-38k-6key-RGB.C: 445: if(s%2==0&&re==0)re=1;
		BTSC 	50H,0 			//00F6 	1450
		LJUMP 	FDH 			//00F7 	38FD
		LDR 	52H,0 			//00F8 	0852
		BTSS 	STATUS,2 		//00F9 	1D03
		LJUMP 	FDH 			//00FA 	38FD
		CLRR 	52H 			//00FB 	0152
		INCR	52H,1 			//00FC 	09D2

		//;remote-38k-6key-RGB.C: 446: if(s%2==0){
		BTSC 	50H,0 			//00FD 	1450
		LJUMP 	113H 			//00FE 	3913

		//;remote-38k-6key-RGB.C: 447: if(CountINT%10==0)PA4=1,PA5=1,PA0=1;
		LDWI 	AH 			//00FF 	2A0A
		STR 	73H 			//0100 	01F3
		LDR 	4DH,0 			//0101 	084D
		LCALL 	38EH 			//0102 	338E
		XORWI 	0H 			//0103 	2600
		BTSS 	STATUS,2 		//0104 	1D03
		LJUMP 	109H 			//0105 	3909
		BSR 	5H,4 			//0106 	1A05
		BSR 	5H,5 			//0107 	1A85
		BSR 	5H,0 			//0108 	1805

		//;remote-38k-6key-RGB.C: 448: if(CountINT%10==5)R=160 , G=160 , B=160 ,PA4=0,PA5=0,PA0=0;
		LDWI 	AH 			//0109 	2A0A
		STR 	73H 			//010A 	01F3
		LDR 	4DH,0 			//010B 	084D
		LCALL 	38EH 			//010C 	338E
		XORWI 	5H 			//010D 	2605
		BTSS 	STATUS,2 		//010E 	1D03
		LJUMP 	119H 			//010F 	3919
		LDWI 	A0H 			//0110 	2AA0
		LCALL 	298H 			//0111 	3298
		LJUMP 	119H 			//0112 	3919

		//;remote-38k-6key-RGB.C: 450: R=0 , G=0, B=0;
		CLRR 	5AH 			//0113 	015A
		CLRR 	5BH 			//0114 	015B
		CLRR 	58H 			//0115 	0158
		CLRR 	59H 			//0116 	0159
		CLRR 	56H 			//0117 	0156
		CLRR 	57H 			//0118 	0157

		//;remote-38k-6key-RGB.C: 451: }
		//;remote-38k-6key-RGB.C: 454: }
		//;remote-38k-6key-RGB.C: 458: if(ReceiveFinish || repeat)
		LDR 	44H,0 			//0119 	0844
		BTSC 	STATUS,2 		//011A 	1503
		LDR 	51H,0 			//011B 	0851
		BTSC 	STATUS,2 		//011C 	1503
		LJUMP 	2CH 			//011D 	382C

		//;remote-38k-6key-RGB.C: 459: {
		//;remote-38k-6key-RGB.C: 460: ReceiveFinish = 0;
		CLRR 	44H 			//011E 	0144

		//;remote-38k-6key-RGB.C: 463: rdata1 = 0xFF - IRDataTimer[0];
		COMR 	40H,0 			//011F 	0F40
		STR 	63H 			//0120 	01E3

		//;remote-38k-6key-RGB.C: 464: rdata2 = 0xFF - IRDataTimer[2];
		COMR 	42H,0 			//0121 	0F42
		STR 	64H 			//0122 	01E4

		//;remote-38k-6key-RGB.C: 465: if((rdata1 == IRDataTimer[1])&&(rdata2 == IRDataTimer[3]))
		LDR 	41H,0 			//0123 	0841
		XORWR 	63H,0 			//0124 	0463
		BTSS 	STATUS,2 		//0125 	1D03
		LJUMP 	240H 			//0126 	3A40
		LDR 	43H,0 			//0127 	0843
		XORWR 	64H,0 			//0128 	0464
		BTSS 	STATUS,2 		//0129 	1D03
		LJUMP 	240H 			//012A 	3A40

		//;remote-38k-6key-RGB.C: 466: {
		//;remote-38k-6key-RGB.C: 469: if( rdata2==0xED && repeat==0)
		LDWI 	EDH 			//012B 	2AED
		XORWR 	64H,0 			//012C 	0464
		BTSS 	STATUS,2 		//012D 	1D03
		LJUMP 	137H 			//012E 	3937
		LDR 	51H,0 			//012F 	0851
		BTSS 	STATUS,2 		//0130 	1D03
		LJUMP 	137H 			//0131 	3937

		//;remote-38k-6key-RGB.C: 470: {
		//;remote-38k-6key-RGB.C: 471: Set++;
		INCR	5EH,1 			//0132 	09DE

		//;remote-38k-6key-RGB.C: 472: if(Set==1)
		DECRSZ 	5EH,0 		//0133 	0E5E
		LJUMP 	136H 			//0134 	3936
		LJUMP 	137H 			//0135 	3937

		//;remote-38k-6key-RGB.C: 479: else
		//;remote-38k-6key-RGB.C: 480: {
		//;remote-38k-6key-RGB.C: 484: Set=0;
		CLRR 	5EH 			//0136 	015E

		//;remote-38k-6key-RGB.C: 486: }
		//;remote-38k-6key-RGB.C: 487: }
		//;remote-38k-6key-RGB.C: 492: if(rdata1==0x7F && rdata2==0xE1 )
		LDWI 	7FH 			//0137 	2A7F
		XORWR 	63H,0 			//0138 	0463
		BTSS 	STATUS,2 		//0139 	1D03
		LJUMP 	1A4H 			//013A 	39A4
		LDWI 	E1H 			//013B 	2AE1
		XORWR 	64H,0 			//013C 	0464
		BTSS 	STATUS,2 		//013D 	1D03
		LJUMP 	1A4H 			//013E 	39A4

		//;remote-38k-6key-RGB.C: 493: {
		//;remote-38k-6key-RGB.C: 494: mode=0;
		CLRR 	53H 			//013F 	0153

		//;remote-38k-6key-RGB.C: 495: if(one==0)one=1,RGB=0 , R=160 , G= 160 , B=0;
		LDR 	4AH,0 			//0140 	084A
		BTSS 	STATUS,2 		//0141 	1D03
		LJUMP 	14EH 			//0142 	394E
		LDWI 	A0H 			//0143 	2AA0
		CLRR 	4AH 			//0144 	014A
		INCR	4AH,1 			//0145 	09CA
		CLRR 	4CH 			//0146 	014C
		STR 	5AH 			//0147 	01DA
		LDWI 	A0H 			//0148 	2AA0
		CLRR 	5BH 			//0149 	015B
		STR 	58H 			//014A 	01D8
		CLRR 	59H 			//014B 	0159
		CLRR 	56H 			//014C 	0156
		CLRR 	57H 			//014D 	0157

		//;remote-38k-6key-RGB.C: 497: if(RGB==0 ){
		LDR 	4CH,0 			//014E 	084C
		BTSS 	STATUS,2 		//014F 	1D03
		LJUMP 	158H 			//0150 	3958

		//;remote-38k-6key-RGB.C: 498: G=G-10;
		LDWI 	F6H 			//0151 	2AF6

		//;remote-38k-6key-RGB.C: 499: if(G<=0)RGB=1;
		LCALL 	243H 			//0152 	3243
		BCR 	STATUS,5 		//0153 	1283
		BTSC 	STATUS,0 		//0154 	1403
		LJUMP 	159H 			//0155 	3959
		CLRR 	4CH 			//0156 	014C
		INCR	4CH,1 			//0157 	09CC

		//;remote-38k-6key-RGB.C: 500: }
		//;remote-38k-6key-RGB.C: 501: if(RGB==1 ){
		BCR 	STATUS,5 		//0158 	1283
		DECRSZ 	4CH,0 		//0159 	0E4C
		LJUMP 	163H 			//015A 	3963

		//;remote-38k-6key-RGB.C: 502: B=B+10;
		LDWI 	AH 			//015B 	2A0A
		ADDWR 	56H,1 			//015C 	0BD6
		BTSC 	STATUS,0 		//015D 	1403
		INCR	57H,1 			//015E 	09D7

		//;remote-38k-6key-RGB.C: 503: if(B>=160)RGB=2;
		LCALL 	278H 			//015F 	3278
		BTSS 	STATUS,0 		//0160 	1C03
		LJUMP 	165H 			//0161 	3965
		STR 	4CH 			//0162 	01CC

		//;remote-38k-6key-RGB.C: 504: }
		//;remote-38k-6key-RGB.C: 505: if(RGB==2 ){
		LDWI 	2H 			//0163 	2A02
		BCR 	STATUS,5 		//0164 	1283
		XORWR 	4CH,0 			//0165 	044C
		BTSS 	STATUS,2 		//0166 	1D03
		LJUMP 	16DH 			//0167 	396D

		//;remote-38k-6key-RGB.C: 506: R=R-10;
		LDWI 	F6H 			//0168 	2AF6

		//;remote-38k-6key-RGB.C: 507: if(R<=0)RGB=3;
		LCALL 	269H 			//0169 	3269
		BTSC 	STATUS,0 		//016A 	1403
		LJUMP 	16FH 			//016B 	396F
		STR 	4CH 			//016C 	01CC

		//;remote-38k-6key-RGB.C: 508: }
		//;remote-38k-6key-RGB.C: 509: if(RGB==3 ){
		LDWI 	3H 			//016D 	2A03
		BCR 	STATUS,5 		//016E 	1283
		XORWR 	4CH,0 			//016F 	044C
		BTSS 	STATUS,2 		//0170 	1D03
		LJUMP 	17CH 			//0171 	397C

		//;remote-38k-6key-RGB.C: 510: G=G+10;
		LDWI 	AH 			//0172 	2A0A
		ADDWR 	58H,1 			//0173 	0BD8
		BTSC 	STATUS,0 		//0174 	1403
		INCR	59H,1 			//0175 	09D9

		//;remote-38k-6key-RGB.C: 511: if(G>=160)RGB=4;
		LCALL 	250H 			//0176 	3250
		LDWI 	4H 			//0177 	2A04
		BCR 	STATUS,5 		//0178 	1283
		BTSS 	STATUS,0 		//0179 	1C03
		LJUMP 	17EH 			//017A 	397E
		STR 	4CH 			//017B 	01CC

		//;remote-38k-6key-RGB.C: 512: }
		//;remote-38k-6key-RGB.C: 513: if(RGB==4 ){
		LDWI 	4H 			//017C 	2A04
		BCR 	STATUS,5 		//017D 	1283
		XORWR 	4CH,0 			//017E 	044C
		BTSS 	STATUS,2 		//017F 	1D03
		LJUMP 	186H 			//0180 	3986

		//;remote-38k-6key-RGB.C: 514: B=B-10;
		LDWI 	F6H 			//0181 	2AF6

		//;remote-38k-6key-RGB.C: 515: if(B<=0)RGB=5;
		LCALL 	25AH 			//0182 	325A
		BTSC 	STATUS,0 		//0183 	1403
		LJUMP 	188H 			//0184 	3988
		STR 	4CH 			//0185 	01CC

		//;remote-38k-6key-RGB.C: 516: }
		//;remote-38k-6key-RGB.C: 517: if(RGB==5 ){
		LDWI 	5H 			//0186 	2A05
		BCR 	STATUS,5 		//0187 	1283
		XORWR 	4CH,0 			//0188 	044C
		BTSS 	STATUS,2 		//0189 	1D03
		LJUMP 	192H 			//018A 	3992

		//;remote-38k-6key-RGB.C: 518: G=G-10;
		LDWI 	F6H 			//018B 	2AF6

		//;remote-38k-6key-RGB.C: 519: if(G<=0)RGB=6;
		LCALL 	243H 			//018C 	3243
		LDWI 	6H 			//018D 	2A06
		BCR 	STATUS,5 		//018E 	1283
		BTSC 	STATUS,0 		//018F 	1403
		LJUMP 	194H 			//0190 	3994
		STR 	4CH 			//0191 	01CC

		//;remote-38k-6key-RGB.C: 520: }
		//;remote-38k-6key-RGB.C: 521: if(RGB==6 ){
		LDWI 	6H 			//0192 	2A06
		BCR 	STATUS,5 		//0193 	1283
		XORWR 	4CH,0 			//0194 	044C
		BTSS 	STATUS,2 		//0195 	1D03
		LJUMP 	1A4H 			//0196 	39A4

		//;remote-38k-6key-RGB.C: 522: G=G+10;
		LDWI 	AH 			//0197 	2A0A
		ADDWR 	58H,1 			//0198 	0BD8
		BTSC 	STATUS,0 		//0199 	1403
		INCR	59H,1 			//019A 	09D9

		//;remote-38k-6key-RGB.C: 523: R=R+10;
		ADDWR 	5AH,1 			//019B 	0BDA
		BTSC 	STATUS,0 		//019C 	1403
		INCR	5BH,1 			//019D 	09DB

		//;remote-38k-6key-RGB.C: 524: if(G>=160 && R>=160 )RGB=0;
		LCALL 	250H 			//019E 	3250
		BTSS 	STATUS,0 		//019F 	1C03
		LJUMP 	1A4H 			//01A0 	39A4
		LCALL 	284H 			//01A1 	3284
		BTSC 	STATUS,0 		//01A2 	1403
		CLRR 	4CH 			//01A3 	014C

		//;remote-38k-6key-RGB.C: 525: }
		//;remote-38k-6key-RGB.C: 526: }
		//;remote-38k-6key-RGB.C: 531: if( rdata2==0xF9 && Set==1 && repeat==0 )
		LDWI 	F9H 			//01A4 	2AF9
		BCR 	STATUS,5 		//01A5 	1283
		XORWR 	64H,0 			//01A6 	0464
		BTSS 	STATUS,2 		//01A7 	1D03
		LJUMP 	1C5H 			//01A8 	39C5
		DECRSZ 	5EH,0 		//01A9 	0E5E
		LJUMP 	1C5H 			//01AA 	39C5
		LDR 	51H,0 			//01AB 	0851
		BTSS 	STATUS,2 		//01AC 	1D03
		LJUMP 	1C5H 			//01AD 	39C5

		//;remote-38k-6key-RGB.C: 532: {
		//;remote-38k-6key-RGB.C: 533: if(Counter_On_set>40){
		LDWI 	29H 			//01AE 	2A29
		SUBWR 	5DH,0 			//01AF 	0C5D
		BTSS 	STATUS,0 		//01B0 	1C03
		LJUMP 	1C5H 			//01B1 	39C5

		//;remote-38k-6key-RGB.C: 534: Counter_On_set=Counter_On_set-15;
		LDWI 	F1H 			//01B2 	2AF1
		ADDWR 	5DH,1 			//01B3 	0BDD

		//;remote-38k-6key-RGB.C: 536: if(Counter_On_set<=40 ){
		LDWI 	29H 			//01B4 	2A29
		SUBWR 	5DH,0 			//01B5 	0C5D
		BTSC 	STATUS,0 		//01B6 	1403
		LJUMP 	1C5H 			//01B7 	39C5

		//;remote-38k-6key-RGB.C: 537: Counter_On_set=0;
		CLRR 	5DH 			//01B8 	015D

		//;remote-38k-6key-RGB.C: 538: INTE=0;
		BCR 	INTCON,4 		//01B9 	120B

		//;remote-38k-6key-RGB.C: 539: TMR2IE=0;
		BSR 	STATUS,5 		//01BA 	1A83
		BCR 	CH,1 			//01BB 	108C

		//;remote-38k-6key-RGB.C: 540: PA4=0,PA5=0,PA0=0;
		BCR 	STATUS,5 		//01BC 	1283
		BCR 	5H,4 			//01BD 	1205
		BCR 	5H,5 			//01BE 	1285
		BCR 	5H,0 			//01BF 	1005

		//;remote-38k-6key-RGB.C: 541: DelayMs(100);
		LDWI 	64H 			//01C0 	2A64
		LCALL 	3CCH 			//01C1 	33CC

		//;remote-38k-6key-RGB.C: 542: INTE=1;
		BSR 	INTCON,4 		//01C2 	1A0B

		//;remote-38k-6key-RGB.C: 543: TMR2IE=1;
		BSR 	STATUS,5 		//01C3 	1A83
		BSR 	CH,1 			//01C4 	188C

		//;remote-38k-6key-RGB.C: 544: }
		//;remote-38k-6key-RGB.C: 545: }
		//;remote-38k-6key-RGB.C: 546: }
		//;remote-38k-6key-RGB.C: 548: if( rdata2==0xFB && Set==1 && repeat==0 )
		LDWI 	FBH 			//01C5 	2AFB
		BCR 	STATUS,5 		//01C6 	1283
		XORWR 	64H,0 			//01C7 	0464
		BTSS 	STATUS,2 		//01C8 	1D03
		LJUMP 	1DFH 			//01C9 	39DF
		DECRSZ 	5EH,0 		//01CA 	0E5E
		LJUMP 	1DFH 			//01CB 	39DF
		LDR 	51H,0 			//01CC 	0851
		BTSS 	STATUS,2 		//01CD 	1D03
		LJUMP 	1DFH 			//01CE 	39DF

		//;remote-38k-6key-RGB.C: 549: {
		//;remote-38k-6key-RGB.C: 550: if(Counter_On_set<130){
		LDWI 	82H 			//01CF 	2A82
		SUBWR 	5DH,0 			//01D0 	0C5D
		BTSC 	STATUS,0 		//01D1 	1403
		LJUMP 	1DFH 			//01D2 	39DF

		//;remote-38k-6key-RGB.C: 552: Counter_On_set=Counter_On_set+15;
		LDWI 	FH 			//01D3 	2A0F
		ADDWR 	5DH,1 			//01D4 	0BDD

		//;remote-38k-6key-RGB.C: 554: if(Counter_On_set>=130 ){
		LDWI 	82H 			//01D5 	2A82
		SUBWR 	5DH,0 			//01D6 	0C5D
		BTSS 	STATUS,0 		//01D7 	1C03
		LJUMP 	1DFH 			//01D8 	39DF

		//;remote-38k-6key-RGB.C: 555: INTE=0;
		//;remote-38k-6key-RGB.C: 556: TMR2IE=0;
		//;remote-38k-6key-RGB.C: 557: PA4=1,PA5=1,PA0=1;
		LCALL 	290H 			//01D9 	3290

		//;remote-38k-6key-RGB.C: 558: DelayMs(100);
		LDWI 	64H 			//01DA 	2A64
		LCALL 	3CCH 			//01DB 	33CC

		//;remote-38k-6key-RGB.C: 559: INTE=1;
		BSR 	INTCON,4 		//01DC 	1A0B

		//;remote-38k-6key-RGB.C: 560: TMR2IE=1;
		BSR 	STATUS,5 		//01DD 	1A83
		BSR 	CH,1 			//01DE 	188C

		//;remote-38k-6key-RGB.C: 561: }
		//;remote-38k-6key-RGB.C: 562: }
		//;remote-38k-6key-RGB.C: 563: }
		//;remote-38k-6key-RGB.C: 567: if(rdata1==0x7F && rdata2==0xF7 && repeat==0 && Set==1)
		LDWI 	7FH 			//01DF 	2A7F
		BCR 	STATUS,5 		//01E0 	1283
		XORWR 	63H,0 			//01E1 	0463
		BTSS 	STATUS,2 		//01E2 	1D03
		LJUMP 	214H 			//01E3 	3A14
		LDWI 	F7H 			//01E4 	2AF7
		XORWR 	64H,0 			//01E5 	0464
		BTSS 	STATUS,2 		//01E6 	1D03
		LJUMP 	214H 			//01E7 	3A14
		LDR 	51H,0 			//01E8 	0851
		BTSS 	STATUS,2 		//01E9 	1D03
		LJUMP 	214H 			//01EA 	3A14
		DECRSZ 	5EH,0 		//01EB 	0E5E
		LJUMP 	214H 			//01EC 	3A14

		//;remote-38k-6key-RGB.C: 568: {
		//;remote-38k-6key-RGB.C: 569: INTE=0;
		BCR 	INTCON,4 		//01ED 	120B

		//;remote-38k-6key-RGB.C: 570: TMR2IE=0;
		BSR 	STATUS,5 		//01EE 	1A83
		BCR 	CH,1 			//01EF 	108C
		LDWI 	8H 			//01F0 	2A08

		//;remote-38k-6key-RGB.C: 573: timer=timer+2;
		BCR 	STATUS,5 		//01F1 	1283
		INCR	4BH,1 			//01F2 	09CB
		INCR	4BH,1 			//01F3 	09CB

		//;remote-38k-6key-RGB.C: 574: m=0;
		CLRR 	4FH 			//01F4 	014F

		//;remote-38k-6key-RGB.C: 575: h=0;
		CLRR 	4EH 			//01F5 	014E

		//;remote-38k-6key-RGB.C: 576: if(timer>=8){
		SUBWR 	4BH,0 			//01F6 	0C4B
		BTSS 	STATUS,0 		//01F7 	1C03
		LJUMP 	200H 			//01F8 	3A00

		//;remote-38k-6key-RGB.C: 577: timer=0;
		CLRR 	4BH 			//01F9 	014B

		//;remote-38k-6key-RGB.C: 578: PA4=1,PA5=1,PA0=1;
		BSR 	5H,4 			//01FA 	1A05
		BSR 	5H,5 			//01FB 	1A85
		BSR 	5H,0 			//01FC 	1805

		//;remote-38k-6key-RGB.C: 579: DelayS(2);
		LDWI 	2H 			//01FD 	2A02
		LCALL 	3BBH 			//01FE 	33BB

		//;remote-38k-6key-RGB.C: 581: }else{
		LJUMP 	211H 			//01FF 	3A11

		//;remote-38k-6key-RGB.C: 582: unsigned char a;
		//;remote-38k-6key-RGB.C: 583: for(a=0;a<(timer/2);a++)
		CLRR 	62H 			//0200 	0162
		BCR 	STATUS,0 		//0201 	1003
		RRR	4BH,0 			//0202 	064B
		SUBWR 	62H,0 			//0203 	0C62
		BTSC 	STATUS,0 		//0204 	1403
		LJUMP 	211H 			//0205 	3A11

		//;remote-38k-6key-RGB.C: 584: {
		//;remote-38k-6key-RGB.C: 585: INTE=0;
		//;remote-38k-6key-RGB.C: 586: TMR2IE=0;
		//;remote-38k-6key-RGB.C: 588: PA4=1,PA5=1,PA0=1;
		LCALL 	290H 			//0206 	3290

		//;remote-38k-6key-RGB.C: 589: DelayMs(200);
		LDWI 	C8H 			//0207 	2AC8
		LCALL 	3CCH 			//0208 	33CC

		//;remote-38k-6key-RGB.C: 591: INTE=1;
		BSR 	INTCON,4 		//0209 	1A0B

		//;remote-38k-6key-RGB.C: 592: TMR2IE=1;
		BSR 	STATUS,5 		//020A 	1A83
		BSR 	CH,1 			//020B 	188C

		//;remote-38k-6key-RGB.C: 594: DelayMs(150);
		LDWI 	96H 			//020C 	2A96
		LCALL 	3CCH 			//020D 	33CC
		BCR 	STATUS,5 		//020E 	1283
		INCR	62H,1 			//020F 	09E2
		LJUMP 	201H 			//0210 	3A01

		//;remote-38k-6key-RGB.C: 595: }
		//;remote-38k-6key-RGB.C: 596: }
		//;remote-38k-6key-RGB.C: 602: INTE=1;
		BSR 	INTCON,4 		//0211 	1A0B

		//;remote-38k-6key-RGB.C: 603: TMR2IE=1;
		BSR 	STATUS,5 		//0212 	1A83
		BSR 	CH,1 			//0213 	188C

		//;remote-38k-6key-RGB.C: 604: }
		//;remote-38k-6key-RGB.C: 608: if(rdata1==0x7F && rdata2==0xFD && repeat==0 && Set==1)
		LDWI 	7FH 			//0214 	2A7F
		BCR 	STATUS,5 		//0215 	1283
		XORWR 	63H,0 			//0216 	0463
		BTSS 	STATUS,2 		//0217 	1D03
		LJUMP 	240H 			//0218 	3A40
		LDWI 	FDH 			//0219 	2AFD
		XORWR 	64H,0 			//021A 	0464
		BTSS 	STATUS,2 		//021B 	1D03
		LJUMP 	240H 			//021C 	3A40
		LDR 	51H,0 			//021D 	0851
		BTSS 	STATUS,2 		//021E 	1D03
		LJUMP 	240H 			//021F 	3A40
		DECRSZ 	5EH,0 		//0220 	0E5E
		LJUMP 	240H 			//0221 	3A40

		//;remote-38k-6key-RGB.C: 609: {
		//;remote-38k-6key-RGB.C: 610: R=160 , G=160, B=0;
		LDWI 	A0H 			//0222 	2AA0
		LCALL 	2A2H 			//0223 	32A2

		//;remote-38k-6key-RGB.C: 612: one=0;
		CLRR 	4AH 			//0224 	014A

		//;remote-38k-6key-RGB.C: 614: INTE=0;
		//;remote-38k-6key-RGB.C: 615: TMR2IE=0;
		//;remote-38k-6key-RGB.C: 616: PA4=1,PA5=1,PA0=1;
		LCALL 	290H 			//0225 	3290

		//;remote-38k-6key-RGB.C: 617: DelayMs(100);
		LDWI 	64H 			//0226 	2A64
		LCALL 	3CCH 			//0227 	33CC

		//;remote-38k-6key-RGB.C: 618: PA4=0,PA5=0,PA0=0;
		BCR 	STATUS,5 		//0228 	1283
		BCR 	5H,4 			//0229 	1205
		BCR 	5H,5 			//022A 	1285
		BCR 	5H,0 			//022B 	1005
		LDWI 	6H 			//022C 	2A06

		//;remote-38k-6key-RGB.C: 619: mode++;
		INCR	53H,1 			//022D 	09D3

		//;remote-38k-6key-RGB.C: 620: if(mode>5)mode=1;
		SUBWR 	53H,0 			//022E 	0C53
		BTSS 	STATUS,0 		//022F 	1C03
		LJUMP 	233H 			//0230 	3A33
		CLRR 	53H 			//0231 	0153
		INCR	53H,1 			//0232 	09D3

		//;remote-38k-6key-RGB.C: 621: if(mode==1)modetime=10;
		DECRSZ 	53H,0 		//0233 	0E53
		LJUMP 	237H 			//0234 	3A37
		LDWI 	AH 			//0235 	2A0A
		STR 	49H 			//0236 	01C9

		//;remote-38k-6key-RGB.C: 622: if(mode==2)modetime=140;
		LDWI 	2H 			//0237 	2A02
		XORWR 	53H,0 			//0238 	0453
		BTSS 	STATUS,2 		//0239 	1D03
		LJUMP 	23DH 			//023A 	3A3D
		LDWI 	8CH 			//023B 	2A8C
		STR 	49H 			//023C 	01C9

		//;remote-38k-6key-RGB.C: 623: INTE=1;
		BSR 	INTCON,4 		//023D 	1A0B

		//;remote-38k-6key-RGB.C: 624: TMR2IE=1;
		BSR 	STATUS,5 		//023E 	1A83
		BSR 	CH,1 			//023F 	188C

		//;remote-38k-6key-RGB.C: 632: repeat=0;
		BCR 	STATUS,5 		//0240 	1283
		CLRR 	51H 			//0241 	0151
		LJUMP 	2CH 			//0242 	382C
		ADDWR 	58H,1 			//0243 	0BD8
		BTSS 	STATUS,0 		//0244 	1C03
		DECR 	59H,1 			//0245 	0DD9
		LDR 	59H,0 			//0246 	0859
		XORWI 	80H 			//0247 	2680
		STR 	7FH 			//0248 	01FF
		LDWI 	80H 			//0249 	2A80
		SUBWR 	7FH,0 			//024A 	0C7F
		BTSS 	STATUS,2 		//024B 	1D03
		RET		 					//024C 	0004
		LDWI 	1H 			//024D 	2A01
		SUBWR 	58H,0 			//024E 	0C58
		RET		 					//024F 	0004
		LDR 	59H,0 			//0250 	0859
		XORWI 	80H 			//0251 	2680
		STR 	7FH 			//0252 	01FF
		LDWI 	80H 			//0253 	2A80
		SUBWR 	7FH,0 			//0254 	0C7F
		BTSS 	STATUS,2 		//0255 	1D03
		RET		 					//0256 	0004
		LDWI 	A0H 			//0257 	2AA0
		SUBWR 	58H,0 			//0258 	0C58
		RET		 					//0259 	0004
		ADDWR 	56H,1 			//025A 	0BD6
		BTSS 	STATUS,0 		//025B 	1C03
		DECR 	57H,1 			//025C 	0DD7
		LDR 	57H,0 			//025D 	0857
		XORWI 	80H 			//025E 	2680
		STR 	7FH 			//025F 	01FF
		LDWI 	80H 			//0260 	2A80
		SUBWR 	7FH,0 			//0261 	0C7F
		BTSS 	STATUS,2 		//0262 	1D03
		LJUMP 	266H 			//0263 	3A66
		LDWI 	1H 			//0264 	2A01
		SUBWR 	56H,0 			//0265 	0C56
		LDWI 	5H 			//0266 	2A05
		BCR 	STATUS,5 		//0267 	1283
		RET		 					//0268 	0004
		ADDWR 	5AH,1 			//0269 	0BDA
		BTSS 	STATUS,0 		//026A 	1C03
		DECR 	5BH,1 			//026B 	0DDB
		LDR 	5BH,0 			//026C 	085B
		XORWI 	80H 			//026D 	2680
		STR 	7FH 			//026E 	01FF
		LDWI 	80H 			//026F 	2A80
		SUBWR 	7FH,0 			//0270 	0C7F
		BTSS 	STATUS,2 		//0271 	1D03
		LJUMP 	275H 			//0272 	3A75
		LDWI 	1H 			//0273 	2A01
		SUBWR 	5AH,0 			//0274 	0C5A
		LDWI 	3H 			//0275 	2A03
		BCR 	STATUS,5 		//0276 	1283
		RET		 					//0277 	0004
		LDR 	57H,0 			//0278 	0857
		XORWI 	80H 			//0279 	2680
		STR 	7FH 			//027A 	01FF
		LDWI 	80H 			//027B 	2A80
		SUBWR 	7FH,0 			//027C 	0C7F
		BTSS 	STATUS,2 		//027D 	1D03
		LJUMP 	281H 			//027E 	3A81
		LDWI 	A0H 			//027F 	2AA0
		SUBWR 	56H,0 			//0280 	0C56
		LDWI 	2H 			//0281 	2A02
		BCR 	STATUS,5 		//0282 	1283
		RET		 					//0283 	0004
		BCR 	STATUS,5 		//0284 	1283
		LDR 	5BH,0 			//0285 	085B
		XORWI 	80H 			//0286 	2680
		STR 	7FH 			//0287 	01FF
		LDWI 	80H 			//0288 	2A80
		SUBWR 	7FH,0 			//0289 	0C7F
		BTSS 	STATUS,2 		//028A 	1D03
		LJUMP 	28EH 			//028B 	3A8E
		LDWI 	A0H 			//028C 	2AA0
		SUBWR 	5AH,0 			//028D 	0C5A
		BCR 	STATUS,5 		//028E 	1283
		RET		 					//028F 	0004
		BCR 	INTCON,4 		//0290 	120B
		BSR 	STATUS,5 		//0291 	1A83
		BCR 	CH,1 			//0292 	108C
		BCR 	STATUS,5 		//0293 	1283
		BSR 	5H,4 			//0294 	1A05
		BSR 	5H,5 			//0295 	1A85
		BSR 	5H,0 			//0296 	1805
		RET		 					//0297 	0004
		STR 	5AH 			//0298 	01DA
		CLRR 	5BH 			//0299 	015B
		STR 	58H 			//029A 	01D8
		CLRR 	59H 			//029B 	0159
		STR 	56H 			//029C 	01D6
		CLRR 	57H 			//029D 	0157
		BCR 	5H,4 			//029E 	1205
		BCR 	5H,5 			//029F 	1285
		BCR 	5H,0 			//02A0 	1005
		RET		 					//02A1 	0004
		STR 	5AH 			//02A2 	01DA
		CLRR 	5BH 			//02A3 	015B
		STR 	58H 			//02A4 	01D8
		CLRR 	59H 			//02A5 	0159
		CLRR 	56H 			//02A6 	0156
		CLRR 	57H 			//02A7 	0157
		RET		 					//02A8 	0004
		LDWI 	A0H 			//02A9 	2AA0
		CLRR 	5AH 			//02AA 	015A
		CLRR 	5BH 			//02AB 	015B
		STR 	58H 			//02AC 	01D8
		CLRR 	59H 			//02AD 	0159
		STR 	56H 			//02AE 	01D6
		CLRR 	57H 			//02AF 	0157
		RET		 					//02B0 	0004
		LDWI 	A0H 			//02B1 	2AA0
		STR 	5AH 			//02B2 	01DA
		CLRR 	5BH 			//02B3 	015B
		CLRR 	58H 			//02B4 	0158
		CLRR 	59H 			//02B5 	0159
		STR 	56H 			//02B6 	01D6
		CLRR 	57H 			//02B7 	0157
		RET		 					//02B8 	0004

		//;remote-38k-6key-RGB.C: 77: if(INTE && INTF)
		BTSC 	INTCON,4 		//02B9 	160B
		BTSS 	INTCON,1 		//02BA 	1C8B
		LJUMP 	2F2H 			//02BB 	3AF2

		//;remote-38k-6key-RGB.C: 78: {
		//;remote-38k-6key-RGB.C: 79: INTF = 0;
		BCR 	INTCON,1 		//02BC 	108B

		//;remote-38k-6key-RGB.C: 80: TRISA2 = 1;
		BSR 	STATUS,5 		//02BD 	1A83
		BSR 	5H,2 			//02BE 	1905

		//;remote-38k-6key-RGB.C: 81: INTEDG = 1;
		BSR 	1H,6 			//02BF 	1B01

		//;remote-38k-6key-RGB.C: 83: PA1=~PA1;
		LDWI 	2H 			//02C0 	2A02
		BCR 	STATUS,5 		//02C1 	1283
		XORWR 	5H,1 			//02C2 	0485

		//;remote-38k-6key-RGB.C: 85: Rq=0;
		CLRR 	48H 			//02C3 	0148

		//;remote-38k-6key-RGB.C: 86: Gq=0;
		CLRR 	47H 			//02C4 	0147

		//;remote-38k-6key-RGB.C: 87: Bq=0;
		CLRR 	46H 			//02C5 	0146

		//;remote-38k-6key-RGB.C: 89: Counter=0;
		CLRR 	54H 			//02C6 	0154

		//;remote-38k-6key-RGB.C: 92: if(Set==1){
		DECRSZ 	5EH,0 		//02C7 	0E5E
		LJUMP 	2D2H 			//02C8 	3AD2

		//;remote-38k-6key-RGB.C: 93: if(Counter_On>Counter_On_set){
		LDR 	7AH,0 			//02C9 	087A
		SUBWR 	5DH,0 			//02CA 	0C5D
		BTSC 	STATUS,0 		//02CB 	1403
		LJUMP 	2D0H 			//02CC 	3AD0

		//;remote-38k-6key-RGB.C: 94: Counter_On=Counter_On-1;
		LDWI 	FFH 			//02CD 	2AFF
		ADDWR 	7AH,1 			//02CE 	0BFA

		//;remote-38k-6key-RGB.C: 95: }else{
		LJUMP 	2D2H 			//02CF 	3AD2

		//;remote-38k-6key-RGB.C: 96: Counter_On=Counter_On_set;
		LDR 	5DH,0 			//02D0 	085D
		STR 	7AH 			//02D1 	01FA

		//;remote-38k-6key-RGB.C: 97: }
		//;remote-38k-6key-RGB.C: 98: }
		//;remote-38k-6key-RGB.C: 100: if(Set==0 && Counter_On<=160)
		LDR 	5EH,0 			//02D2 	085E
		BTSS 	STATUS,2 		//02D3 	1D03
		LJUMP 	2DBH 			//02D4 	3ADB
		LDWI 	A1H 			//02D5 	2AA1
		SUBWR 	7AH,0 			//02D6 	0C7A
		BTSC 	STATUS,0 		//02D7 	1403
		LJUMP 	2DBH 			//02D8 	3ADB

		//;remote-38k-6key-RGB.C: 101: {
		//;remote-38k-6key-RGB.C: 102: Counter_On=Counter_On+2;
		INCR	7AH,1 			//02D9 	09FA
		INCR	7AH,1 			//02DA 	09FA
		LDWI 	64H 			//02DB 	2A64

		//;remote-38k-6key-RGB.C: 103: }
		//;remote-38k-6key-RGB.C: 113: CountINT++;
		INCR	4DH,1 			//02DC 	09CD

		//;remote-38k-6key-RGB.C: 114: if(CountINT>=100){
		SUBWR 	4DH,0 			//02DD 	0C4D
		BTSS 	STATUS,0 		//02DE 	1C03
		LJUMP 	2F2H 			//02DF 	3AF2
		LDWI 	3CH 			//02E0 	2A3C

		//;remote-38k-6key-RGB.C: 115: CountINT=0;
		CLRR 	4DH 			//02E1 	014D

		//;remote-38k-6key-RGB.C: 116: s++;
		INCR	50H,1 			//02E2 	09D0

		//;remote-38k-6key-RGB.C: 117: re=0;
		CLRR 	52H 			//02E3 	0152

		//;remote-38k-6key-RGB.C: 118: if(s>=60){
		SUBWR 	50H,0 			//02E4 	0C50
		BTSS 	STATUS,0 		//02E5 	1C03
		LJUMP 	2ECH 			//02E6 	3AEC

		//;remote-38k-6key-RGB.C: 119: s=0;
		CLRR 	50H 			//02E7 	0150

		//;remote-38k-6key-RGB.C: 120: if(timer>0)m++;
		LDR 	4BH,0 			//02E8 	084B
		BTSC 	STATUS,2 		//02E9 	1503
		LJUMP 	2ECH 			//02EA 	3AEC
		INCR	4FH,1 			//02EB 	09CF

		//;remote-38k-6key-RGB.C: 121: }
		//;remote-38k-6key-RGB.C: 123: if(m>=60)m=0,h++;
		LDWI 	3CH 			//02EC 	2A3C
		SUBWR 	4FH,0 			//02ED 	0C4F
		BTSS 	STATUS,0 		//02EE 	1C03
		LJUMP 	2F2H 			//02EF 	3AF2
		CLRR 	4FH 			//02F0 	014F
		INCR	4EH,1 			//02F1 	09CE

		//;remote-38k-6key-RGB.C: 124: }
		//;remote-38k-6key-RGB.C: 129: }
		//;remote-38k-6key-RGB.C: 205: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//02F2 	1A83
		BTSS 	CH,1 			//02F3 	1C8C
		LJUMP 	385H 			//02F4 	3B85
		BCR 	STATUS,5 		//02F5 	1283
		BTSS 	CH,1 			//02F6 	1C8C
		LJUMP 	385H 			//02F7 	3B85

		//;remote-38k-6key-RGB.C: 206: {
		//;remote-38k-6key-RGB.C: 208: TMR2IF = 0;
		BCR 	CH,1 			//02F8 	108C

		//;remote-38k-6key-RGB.C: 209: TMR2IE = 1;
		BSR 	STATUS,5 		//02F9 	1A83
		BSR 	CH,1 			//02FA 	188C

		//;remote-38k-6key-RGB.C: 217: Counter++;
		BCR 	STATUS,5 		//02FB 	1283
		INCR	54H,1 			//02FC 	09D4

		//;remote-38k-6key-RGB.C: 219: if(Counter>=Counter_On)
		LDR 	7AH,0 			//02FD 	087A
		SUBWR 	54H,0 			//02FE 	0C54
		BTSS 	STATUS,0 		//02FF 	1C03
		LJUMP 	342H 			//0300 	3B42

		//;remote-38k-6key-RGB.C: 220: {
		//;remote-38k-6key-RGB.C: 222: if(Rq==1)PA4=0,Rq=2;
		DECRSZ 	48H,0 		//0301 	0E48
		LJUMP 	306H 			//0302 	3B06
		BCR 	5H,4 			//0303 	1205
		LDWI 	2H 			//0304 	2A02
		STR 	48H 			//0305 	01C8

		//;remote-38k-6key-RGB.C: 223: if(Gq==1)PA5=0,Gq=2;
		DECRSZ 	47H,0 		//0306 	0E47
		LJUMP 	30BH 			//0307 	3B0B
		BCR 	5H,5 			//0308 	1285
		LDWI 	2H 			//0309 	2A02
		STR 	47H 			//030A 	01C7

		//;remote-38k-6key-RGB.C: 224: if(Bq==1)PA0=0,Bq=2;
		DECRSZ 	46H,0 		//030B 	0E46
		LJUMP 	310H 			//030C 	3B10
		BCR 	5H,0 			//030D 	1005
		LDWI 	2H 			//030E 	2A02
		STR 	46H 			//030F 	01C6

		//;remote-38k-6key-RGB.C: 229: if(Counter>=R && Rq==0){
		LDR 	5BH,0 			//0310 	085B
		XORWI 	80H 			//0311 	2680
		SUBWI 	80H 			//0312 	2880
		BTSS 	STATUS,2 		//0313 	1D03
		LJUMP 	317H 			//0314 	3B17
		LDR 	5AH,0 			//0315 	085A
		SUBWR 	54H,0 			//0316 	0C54
		BCR 	STATUS,5 		//0317 	1283
		BTSS 	STATUS,0 		//0318 	1C03
		LJUMP 	321H 			//0319 	3B21
		LDR 	48H,0 			//031A 	0848
		BTSS 	STATUS,2 		//031B 	1D03
		LJUMP 	320H 			//031C 	3B20

		//;remote-38k-6key-RGB.C: 230: Rq=1;
		CLRR 	48H 			//031D 	0148
		INCR	48H,1 			//031E 	09C8

		//;remote-38k-6key-RGB.C: 231: PA4=1;
		BSR 	5H,4 			//031F 	1A05

		//;remote-38k-6key-RGB.C: 232: }
		//;remote-38k-6key-RGB.C: 234: if(Counter>=G && Gq==0){
		BCR 	STATUS,5 		//0320 	1283
		LDR 	59H,0 			//0321 	0859
		XORWI 	80H 			//0322 	2680
		SUBWI 	80H 			//0323 	2880
		BTSS 	STATUS,2 		//0324 	1D03
		LJUMP 	328H 			//0325 	3B28
		LDR 	58H,0 			//0326 	0858
		SUBWR 	54H,0 			//0327 	0C54
		BCR 	STATUS,5 		//0328 	1283
		BTSS 	STATUS,0 		//0329 	1C03
		LJUMP 	332H 			//032A 	3B32
		LDR 	47H,0 			//032B 	0847
		BTSS 	STATUS,2 		//032C 	1D03
		LJUMP 	331H 			//032D 	3B31

		//;remote-38k-6key-RGB.C: 235: Gq=1;
		CLRR 	47H 			//032E 	0147
		INCR	47H,1 			//032F 	09C7

		//;remote-38k-6key-RGB.C: 236: PA5=1;
		BSR 	5H,5 			//0330 	1A85

		//;remote-38k-6key-RGB.C: 237: }
		//;remote-38k-6key-RGB.C: 239: if(Counter>=B && Bq==0){
		BCR 	STATUS,5 		//0331 	1283
		LDR 	57H,0 			//0332 	0857
		XORWI 	80H 			//0333 	2680
		SUBWI 	80H 			//0334 	2880
		BTSS 	STATUS,2 		//0335 	1D03
		LJUMP 	339H 			//0336 	3B39
		LDR 	56H,0 			//0337 	0856
		SUBWR 	54H,0 			//0338 	0C54
		BCR 	STATUS,5 		//0339 	1283
		BTSS 	STATUS,0 		//033A 	1C03
		LJUMP 	343H 			//033B 	3B43
		LDR 	46H,0 			//033C 	0846
		BTSS 	STATUS,2 		//033D 	1D03
		LJUMP 	342H 			//033E 	3B42

		//;remote-38k-6key-RGB.C: 240: Bq=1;
		CLRR 	46H 			//033F 	0146
		INCR	46H,1 			//0340 	09C6

		//;remote-38k-6key-RGB.C: 241: PA0=1;
		BSR 	5H,0 			//0341 	1805

		//;remote-38k-6key-RGB.C: 242: }
		//;remote-38k-6key-RGB.C: 245: }
		//;remote-38k-6key-RGB.C: 249: if(ir_timer){
		BCR 	STATUS,5 		//0342 	1283
		LDR 	55H,0 			//0343 	0855
		BTSS 	STATUS,2 		//0344 	1D03

		//;remote-38k-6key-RGB.C: 250: IRbitTime++;
		INCR	78H,1 			//0345 	09F8

		//;remote-38k-6key-RGB.C: 255: }
		//;remote-38k-6key-RGB.C: 256: }
		//;remote-38k-6key-RGB.C: 258: if(ir_status != PA3){
		//;remote-38k-6key-RGB.C: 251: if(IRbitTime > 1600)
		LDWI 	0H 			//0346 	2A00
		BTSC 	5H,3 			//0347 	1585
		LDWI 	1H 			//0348 	2A01
		XORWR 	79H,0 			//0349 	0479
		BTSC 	STATUS,2 		//034A 	1503
		LJUMP 	385H 			//034B 	3B85

		//;remote-38k-6key-RGB.C: 259: ir_status=PA3;
		LDWI 	0H 			//034C 	2A00
		BTSC 	5H,3 			//034D 	1585
		LDWI 	1H 			//034E 	2A01
		STR 	79H 			//034F 	01F9

		//;remote-38k-6key-RGB.C: 261: if(ir_status==0){
		LDR 	79H,0 			//0350 	0879
		BTSS 	STATUS,2 		//0351 	1D03
		LJUMP 	385H 			//0352 	3B85
		LDWI 	BFH 			//0353 	2ABF

		//;remote-38k-6key-RGB.C: 263: ir_timer = 1;
		CLRR 	55H 			//0354 	0155
		INCR	55H,1 			//0355 	09D5

		//;remote-38k-6key-RGB.C: 265: if(IRbitTime > 190)
		SUBWR 	78H,0 			//0356 	0C78
		BTSS 	STATUS,0 		//0357 	1C03
		LJUMP 	360H 			//0358 	3B60

		//;remote-38k-6key-RGB.C: 266: {
		//;remote-38k-6key-RGB.C: 267: IRDataTimer[0] = 0;
		CLRR 	40H 			//0359 	0140

		//;remote-38k-6key-RGB.C: 268: IRDataTimer[1] = 0;
		CLRR 	41H 			//035A 	0141

		//;remote-38k-6key-RGB.C: 269: IRDataTimer[2] = 0;
		CLRR 	42H 			//035B 	0142

		//;remote-38k-6key-RGB.C: 270: IRDataTimer[3] = 0;
		CLRR 	43H 			//035C 	0143

		//;remote-38k-6key-RGB.C: 271: IRbitNum = 0;
		CLRR 	45H 			//035D 	0145

		//;remote-38k-6key-RGB.C: 272: bitdata = 0x00;
		CLRR 	5CH 			//035E 	015C

		//;remote-38k-6key-RGB.C: 273: }
		LJUMP 	374H 			//035F 	3B74

		//;remote-38k-6key-RGB.C: 274: else if(IRbitTime > 150)
		LDWI 	97H 			//0360 	2A97
		SUBWR 	78H,0 			//0361 	0C78
		BTSS 	STATUS,0 		//0362 	1C03
		LJUMP 	36AH 			//0363 	3B6A

		//;remote-38k-6key-RGB.C: 275: {
		//;remote-38k-6key-RGB.C: 276: if(ReceiveFinish==0)repeat=1;
		LDR 	44H,0 			//0364 	0844
		BTSS 	STATUS,2 		//0365 	1D03
		LJUMP 	374H 			//0366 	3B74
		CLRR 	51H 			//0367 	0151
		INCR	51H,1 			//0368 	09D1
		LJUMP 	374H 			//0369 	3B74

		//;remote-38k-6key-RGB.C: 278: else if(IRbitTime > 30)
		LDWI 	1FH 			//036A 	2A1F
		SUBWR 	78H,0 			//036B 	0C78
		BTSS 	STATUS,0 		//036C 	1C03
		LJUMP 	374H 			//036D 	3B74

		//;remote-38k-6key-RGB.C: 279: {
		//;remote-38k-6key-RGB.C: 280: IRDataTimer[IRbitNum-1] |= bitdata;
		LDR 	45H,0 			//036E 	0845
		ADDWI 	3FH 			//036F 	273F
		STR 	FSR 			//0370 	0184
		LDR 	5CH,0 			//0371 	085C
		BCR 	STATUS,7 		//0372 	1383
		IORWR 	INDF,1 		//0373 	0380

		//;remote-38k-6key-RGB.C: 281: }
		//;remote-38k-6key-RGB.C: 283: IRbitTime = 0;
		CLRR 	78H 			//0374 	0178

		//;remote-38k-6key-RGB.C: 284: bitdata<<=1;
		BCR 	STATUS,0 		//0375 	1003
		RLR 	5CH,1 			//0376 	05DC

		//;remote-38k-6key-RGB.C: 285: if(bitdata == 0)
		LDR 	5CH,0 			//0377 	085C
		BTSS 	STATUS,2 		//0378 	1D03
		LJUMP 	37DH 			//0379 	3B7D

		//;remote-38k-6key-RGB.C: 286: {
		//;remote-38k-6key-RGB.C: 287: bitdata = 0x01;
		CLRR 	5CH 			//037A 	015C
		INCR	5CH,1 			//037B 	09DC

		//;remote-38k-6key-RGB.C: 288: IRbitNum++;
		INCR	45H,1 			//037C 	09C5

		//;remote-38k-6key-RGB.C: 289: }
		//;remote-38k-6key-RGB.C: 290: if(IRbitNum > 4)
		LDWI 	5H 			//037D 	2A05
		SUBWR 	45H,0 			//037E 	0C45
		BTSS 	STATUS,0 		//037F 	1C03
		LJUMP 	385H 			//0380 	3B85

		//;remote-38k-6key-RGB.C: 291: {
		//;remote-38k-6key-RGB.C: 292: IRbitNum = 0;
		CLRR 	45H 			//0381 	0145

		//;remote-38k-6key-RGB.C: 293: ir_timer = 0;
		CLRR 	55H 			//0382 	0155

		//;remote-38k-6key-RGB.C: 294: ReceiveFinish = 1;
		CLRR 	44H 			//0383 	0144
		INCR	44H,1 			//0384 	09C4
		LDR 	72H,0 			//0385 	0872
		STR 	PCLATH 			//0386 	018A
		LDR 	71H,0 			//0387 	0871
		STR 	FSR 			//0388 	0184
		SWAPR 	70H,0 			//0389 	0770
		STR 	STATUS 			//038A 	0183
		SWAPR 	7EH,1 			//038B 	07FE
		SWAPR 	7EH,0 			//038C 	077E
		RETI		 			//038D 	0009
		STR 	75H 			//038E 	01F5
		LDWI 	8H 			//038F 	2A08
		STR 	76H 			//0390 	01F6
		CLRR 	77H 			//0391 	0177
		LDR 	75H,0 			//0392 	0875
		STR 	74H 			//0393 	01F4
		LDWI 	7H 			//0394 	2A07
		BCR 	STATUS,0 		//0395 	1003
		RRR	74H,1 			//0396 	06F4
		ADDWI 	FFH 			//0397 	27FF
		BCR 	STATUS,0 		//0398 	1003
		BTSS 	STATUS,2 		//0399 	1D03
		LJUMP 	396H 			//039A 	3B96
		RLR 	77H,0 			//039B 	0577
		IORWR 	74H,0 			//039C 	0374
		STR 	77H 			//039D 	01F7
		BCR 	STATUS,0 		//039E 	1003
		RLR 	75H,1 			//039F 	05F5
		LDR 	73H,0 			//03A0 	0873
		SUBWR 	77H,0 			//03A1 	0C77
		BTSS 	STATUS,0 		//03A2 	1C03
		LJUMP 	3A6H 			//03A3 	3BA6
		LDR 	73H,0 			//03A4 	0873
		SUBWR 	77H,1 			//03A5 	0CF7
		DECRSZ 	76H,1 		//03A6 	0EF6
		LJUMP 	392H 			//03A7 	3B92
		LDR 	77H,0 			//03A8 	0877
		RET		 					//03A9 	0004

		//;remote-38k-6key-RGB.C: 312: OSCCON = 0B11110000;
		LDWI 	F0H 			//03AA 	2AF0
		BSR 	STATUS,5 		//03AB 	1A83
		STR 	FH 			//03AC 	018F

		//;remote-38k-6key-RGB.C: 314: INTCON = 0;
		CLRR 	INTCON 			//03AD 	010B

		//;remote-38k-6key-RGB.C: 315: OPTION = 0B00001000;
		LDWI 	8H 			//03AE 	2A08
		STR 	1H 			//03AF 	0181

		//;remote-38k-6key-RGB.C: 317: PORTA = 0B00000001;
		LDWI 	1H 			//03B0 	2A01
		BCR 	STATUS,5 		//03B1 	1283
		STR 	5H 			//03B2 	0185

		//;remote-38k-6key-RGB.C: 318: TRISA = 0B00001100;
		LDWI 	CH 			//03B3 	2A0C
		BSR 	STATUS,5 		//03B4 	1A83
		STR 	5H 			//03B5 	0185

		//;remote-38k-6key-RGB.C: 320: WPUA = 0B00000100;
		LDWI 	4H 			//03B6 	2A04
		STR 	15H 			//03B7 	0195

		//;remote-38k-6key-RGB.C: 322: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//03B8 	1283
		CLRR 	1BH 			//03B9 	011B
		RET		 					//03BA 	0004
		STR 	5FH 			//03BB 	01DF

		//;remote-38k-6key-RGB.C: 64: unsigned char a,b;
		//;remote-38k-6key-RGB.C: 65: for(a=0;a<Time;a++)
		CLRR 	60H 			//03BC 	0160
		LDR 	5FH,0 			//03BD 	085F
		SUBWR 	60H,0 			//03BE 	0C60
		BTSC 	STATUS,0 		//03BF 	1403
		RET		 					//03C0 	0004

		//;remote-38k-6key-RGB.C: 66: {
		//;remote-38k-6key-RGB.C: 67: for(b=0;b<10;b++)
		CLRR 	61H 			//03C1 	0161

		//;remote-38k-6key-RGB.C: 68: {
		//;remote-38k-6key-RGB.C: 69: DelayMs(100);
		LDWI 	64H 			//03C2 	2A64
		LCALL 	3CCH 			//03C3 	33CC
		LDWI 	AH 			//03C4 	2A0A
		BCR 	STATUS,5 		//03C5 	1283
		INCR	61H,1 			//03C6 	09E1
		SUBWR 	61H,0 			//03C7 	0C61
		BTSS 	STATUS,0 		//03C8 	1C03
		LJUMP 	3C2H 			//03C9 	3BC2
		INCR	60H,1 			//03CA 	09E0
		LJUMP 	3BDH 			//03CB 	3BBD
		STR 	75H 			//03CC 	01F5

		//;remote-38k-6key-RGB.C: 51: unsigned char a,b;
		//;remote-38k-6key-RGB.C: 52: for(a=0;a<Time;a++)
		CLRR 	76H 			//03CD 	0176
		LDR 	75H,0 			//03CE 	0875
		SUBWR 	76H,0 			//03CF 	0C76
		BTSC 	STATUS,0 		//03D0 	1403
		RET		 					//03D1 	0004

		//;remote-38k-6key-RGB.C: 53: {
		//;remote-38k-6key-RGB.C: 54: for(b=0;b<5;b++)
		CLRR 	77H 			//03D2 	0177

		//;remote-38k-6key-RGB.C: 55: {
		//;remote-38k-6key-RGB.C: 56: DelayUs(98);
		LDWI 	62H 			//03D3 	2A62
		LCALL 	3E9H 			//03D4 	33E9
		LDWI 	5H 			//03D5 	2A05
		INCR	77H,1 			//03D6 	09F7
		SUBWR 	77H,0 			//03D7 	0C77
		BTSS 	STATUS,0 		//03D8 	1C03
		LJUMP 	3D3H 			//03D9 	3BD3
		INCR	76H,1 			//03DA 	09F6
		LJUMP 	3CEH 			//03DB 	3BCE

		//;remote-38k-6key-RGB.C: 338: T2CON = 0B00000001;
		LDWI 	1H 			//03DC 	2A01
		BCR 	STATUS,5 		//03DD 	1283
		STR 	12H 			//03DE 	0192

		//;remote-38k-6key-RGB.C: 340: TMR2 = 0;
		CLRR 	11H 			//03DF 	0111

		//;remote-38k-6key-RGB.C: 341: PR2 = 63;
		LDWI 	3FH 			//03E0 	2A3F
		BSR 	STATUS,5 		//03E1 	1A83
		STR 	12H 			//03E2 	0192

		//;remote-38k-6key-RGB.C: 342: TMR2IF = 0;
		BCR 	STATUS,5 		//03E3 	1283
		BCR 	CH,1 			//03E4 	108C

		//;remote-38k-6key-RGB.C: 344: TMR2ON = 1;
		BSR 	12H,2 			//03E5 	1912

		//;remote-38k-6key-RGB.C: 345: PEIE=1;
		BSR 	INTCON,6 		//03E6 	1B0B

		//;remote-38k-6key-RGB.C: 346: GIE = 1;
		BSR 	INTCON,7 		//03E7 	1B8B
		RET		 					//03E8 	0004
		STR 	73H 			//03E9 	01F3

		//;remote-38k-6key-RGB.C: 41: unsigned char a;
		//;remote-38k-6key-RGB.C: 42: for(a=0;a<Time;a++)
		CLRR 	74H 			//03EA 	0174
		LDR 	73H,0 			//03EB 	0873
		SUBWR 	74H,0 			//03EC 	0C74
		BTSC 	STATUS,0 		//03ED 	1403
		RET		 					//03EE 	0004

		//;remote-38k-6key-RGB.C: 43: {
		//;remote-38k-6key-RGB.C: 44: __nop();
		NOP		 					//03EF 	0000
		INCR	74H,1 			//03F0 	09F4
		LJUMP 	3EBH 			//03F1 	3BEB
		CLRWDT	 			//03F2 	0001
		CLRR 	INDF 			//03F3 	0100
		INCR	FSR,1 			//03F4 	0984
		XORWR 	FSR,0 			//03F5 	0404
		BTSC 	STATUS,2 		//03F6 	1503
		RETW 	0H 			//03F7 	2100
		XORWR 	FSR,0 			//03F8 	0404
		LJUMP 	3F3H 			//03F9 	3BF3

		//;remote-38k-6key-RGB.C: 327: TRISA2 = 1;
		BSR 	STATUS,5 		//03FA 	1A83
		BSR 	5H,2 			//03FB 	1905

		//;remote-38k-6key-RGB.C: 328: INTEDG = 1;
		BSR 	1H,6 			//03FC 	1B01

		//;remote-38k-6key-RGB.C: 329: INTF =0;
		BCR 	INTCON,1 		//03FD 	108B

		//;remote-38k-6key-RGB.C: 330: INTE =1;
		BSR 	INTCON,4 		//03FE 	1A0B
		RET		 					//03FF 	0004
			END
