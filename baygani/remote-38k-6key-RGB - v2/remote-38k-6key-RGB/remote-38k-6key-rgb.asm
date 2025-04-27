//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_R		EQU		58H
		_G		EQU		56H
		_B		EQU		54H
		_ir_status		EQU		79H
		_ir_timer		EQU		53H
		_Counter		EQU		52H
		_Set		EQU		5CH
		_mode		EQU		51H
		_re		EQU		50H
		_repeat		EQU		4FH
		_Counter_On_set		EQU		5BH
		_Counter_On		EQU		7AH
		_h		EQU		4EH
		_RGB		EQU		4DH
		_timer		EQU		4CH
		_one		EQU		4BH
		_modetime		EQU		4AH
		_countz		EQU		49H
		_Rq		EQU		48H
		_Gq		EQU		47H
		_Bq		EQU		46H
		_IRbitNum		EQU		45H
		_IRbitTime		EQU		78H
		_IRDataTimer		EQU		40H
		_bitdata		EQU		5AH
		_ReceiveFinish		EQU		44H
//		main@a		EQU		60H
//		main@rdata2		EQU		62H
//		main@rdata1		EQU		61H
//		___lbmod@dividend		EQU		75H
//		___lbmod@rem		EQU		77H
//		___lbmod@counter		EQU		76H
//		___lbmod@dividend		EQU		75H
//		___lbmod@divisor		EQU		73H
//		___lbmod@dividend		EQU		75H
//		DelayS@Time		EQU		5DH
//		DelayS@b		EQU		5FH
//		DelayS@a		EQU		5EH
//		DelayS@Time		EQU		5DH
//		DelayS@Time		EQU		5DH
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
		LJUMP 	261H 			//000B 	3A61
		LJUMP 	0DH 			//000C 	380D
		LDWI 	14H 			//000D 	2A14
		STR 	54H 			//000E 	01D4
		CLRR 	55H 			//000F 	0155
		STR 	56H 			//0010 	01D6
		CLRR 	57H 			//0011 	0157
		STR 	58H 			//0012 	01D8
		LDWI 	1H 			//0013 	2A01
		CLRR 	59H 			//0014 	0159
		STR 	5AH 			//0015 	01DA
		LDWI 	28H 			//0016 	2A28
		STR 	5BH 			//0017 	01DB
		LDWI 	1H 			//0018 	2A01
		STR 	5CH 			//0019 	01DC
		LDWI 	28H 			//001A 	2A28
		STR 	7AH 			//001B 	01FA
		LDWI 	40H 			//001C 	2A40
		BCR 	STATUS,7 		//001D 	1383
		STR 	FSR 			//001E 	0184
		LDWI 	54H 			//001F 	2A54
		LCALL 	38AH 			//0020 	338A
		CLRR 	78H 			//0021 	0178
		CLRR 	79H 			//0022 	0179
		CLRR 	STATUS 			//0023 	0103
		LJUMP 	25H 			//0024 	3825

		//;remote-38k-6key-RGB.C: 344: unsigned char rdata1,rdata2;
		//;remote-38k-6key-RGB.C: 346: POWER_INITIAL();
		LCALL 	355H 			//0025 	3355

		//;remote-38k-6key-RGB.C: 349: TIMER2_INITIAL();
		LCALL 	375H 			//0026 	3375

		//;remote-38k-6key-RGB.C: 351: GIE = 1;
		BSR 	INTCON,7 		//0027 	1B8B

		//;remote-38k-6key-RGB.C: 353: PAIE =1;
		BSR 	INTCON,3 		//0028 	198B

		//;remote-38k-6key-RGB.C: 354: TMR2IE = 1;
		BSR 	STATUS,5 		//0029 	1A83
		BSR 	CH,1 			//002A 	188C

		//;remote-38k-6key-RGB.C: 357: {
		//;remote-38k-6key-RGB.C: 359: if(h==timer && h!=0){
		BCR 	STATUS,5 		//002B 	1283
		LDR 	4EH,0 			//002C 	084E
		XORWR 	4CH,0 			//002D 	044C
		BTSS 	STATUS,2 		//002E 	1D03
		LJUMP 	36H 			//002F 	3836
		LDR 	4EH,0 			//0030 	084E
		BTSC 	STATUS,2 		//0031 	1503
		LJUMP 	36H 			//0032 	3836

		//;remote-38k-6key-RGB.C: 361: m=0;
		CLRR 	5CH 			//0033 	015C

		//;remote-38k-6key-RGB.C: 362: h=0;
		CLRR 	4EH 			//0034 	014E

		//;remote-38k-6key-RGB.C: 363: timer=0;
		CLRR 	4CH 			//0035 	014C

		//;remote-38k-6key-RGB.C: 364: }
		//;remote-38k-6key-RGB.C: 368: if(mode==2 || mode==1 ){
		LDWI 	2H 			//0036 	2A02
		XORWR 	51H,0 			//0037 	0451
		BTSC 	STATUS,2 		//0038 	1503
		LJUMP 	3CH 			//0039 	383C
		DECRSZ 	51H,0 		//003A 	0E51
		LJUMP 	96H 			//003B 	3896

		//;remote-38k-6key-RGB.C: 369: if(Counter%modetime==0){
		LDR 	4AH,0 			//003C 	084A
		STR 	73H 			//003D 	01F3
		LDR 	52H,0 			//003E 	0852
		LCALL 	328H 			//003F 	3328
		XORWI 	0H 			//0040 	2600
		BTSS 	STATUS,2 		//0041 	1D03
		LJUMP 	96H 			//0042 	3896

		//;remote-38k-6key-RGB.C: 371: if(RGB==0 ){
		LDR 	4DH,0 			//0043 	084D
		BTSS 	STATUS,2 		//0044 	1D03
		LJUMP 	4DH 			//0045 	384D

		//;remote-38k-6key-RGB.C: 372: G=G-1;
		LDWI 	FFH 			//0046 	2AFF

		//;remote-38k-6key-RGB.C: 373: if(G<=0)RGB=1;
		LCALL 	206H 			//0047 	3206
		BCR 	STATUS,5 		//0048 	1283
		BTSC 	STATUS,0 		//0049 	1403
		LJUMP 	4EH 			//004A 	384E
		CLRR 	4DH 			//004B 	014D
		INCR	4DH,1 			//004C 	09CD

		//;remote-38k-6key-RGB.C: 374: }
		//;remote-38k-6key-RGB.C: 375: if(RGB==1 ){
		BCR 	STATUS,5 		//004D 	1283
		DECRSZ 	4DH,0 		//004E 	0E4D
		LJUMP 	57H 			//004F 	3857

		//;remote-38k-6key-RGB.C: 376: B=B+1;
		INCR	54H,1 			//0050 	09D4
		BTSC 	STATUS,2 		//0051 	1503
		INCR	55H,1 			//0052 	09D5

		//;remote-38k-6key-RGB.C: 377: if(B>=160)RGB=2;
		LCALL 	247H 			//0053 	3247
		BTSS 	STATUS,0 		//0054 	1C03
		LJUMP 	59H 			//0055 	3859
		STR 	4DH 			//0056 	01CD

		//;remote-38k-6key-RGB.C: 378: }
		//;remote-38k-6key-RGB.C: 379: if(RGB==2 ){
		LDWI 	2H 			//0057 	2A02
		BCR 	STATUS,5 		//0058 	1283
		XORWR 	4DH,0 			//0059 	044D
		BTSS 	STATUS,2 		//005A 	1D03
		LJUMP 	61H 			//005B 	3861

		//;remote-38k-6key-RGB.C: 380: R=R-1;
		LDWI 	FFH 			//005C 	2AFF

		//;remote-38k-6key-RGB.C: 381: if(R<=0)RGB=3;
		LCALL 	22CH 			//005D 	322C
		BTSC 	STATUS,0 		//005E 	1403
		LJUMP 	63H 			//005F 	3863
		STR 	4DH 			//0060 	01CD

		//;remote-38k-6key-RGB.C: 382: }
		//;remote-38k-6key-RGB.C: 383: if(RGB==3 ){
		LDWI 	3H 			//0061 	2A03
		BCR 	STATUS,5 		//0062 	1283
		XORWR 	4DH,0 			//0063 	044D
		BTSS 	STATUS,2 		//0064 	1D03
		LJUMP 	6FH 			//0065 	386F

		//;remote-38k-6key-RGB.C: 384: G=G+1;
		INCR	56H,1 			//0066 	09D6
		BTSC 	STATUS,2 		//0067 	1503
		INCR	57H,1 			//0068 	09D7

		//;remote-38k-6key-RGB.C: 385: if(G>=160)RGB=4;
		LCALL 	213H 			//0069 	3213
		LDWI 	4H 			//006A 	2A04
		BCR 	STATUS,5 		//006B 	1283
		BTSS 	STATUS,0 		//006C 	1C03
		LJUMP 	71H 			//006D 	3871
		STR 	4DH 			//006E 	01CD

		//;remote-38k-6key-RGB.C: 386: }
		//;remote-38k-6key-RGB.C: 387: if(RGB==4 ){
		LDWI 	4H 			//006F 	2A04
		BCR 	STATUS,5 		//0070 	1283
		XORWR 	4DH,0 			//0071 	044D
		BTSS 	STATUS,2 		//0072 	1D03
		LJUMP 	79H 			//0073 	3879

		//;remote-38k-6key-RGB.C: 388: B=B-1;
		LDWI 	FFH 			//0074 	2AFF

		//;remote-38k-6key-RGB.C: 389: if(B<=0)RGB=5;
		LCALL 	21DH 			//0075 	321D
		BTSC 	STATUS,0 		//0076 	1403
		LJUMP 	7BH 			//0077 	387B
		STR 	4DH 			//0078 	01CD

		//;remote-38k-6key-RGB.C: 390: }
		//;remote-38k-6key-RGB.C: 391: if(RGB==5 ){
		LDWI 	5H 			//0079 	2A05
		BCR 	STATUS,5 		//007A 	1283
		XORWR 	4DH,0 			//007B 	044D
		BTSS 	STATUS,2 		//007C 	1D03
		LJUMP 	85H 			//007D 	3885

		//;remote-38k-6key-RGB.C: 392: G=G-1;
		LDWI 	FFH 			//007E 	2AFF

		//;remote-38k-6key-RGB.C: 393: if(G<=0)RGB=6;
		LCALL 	206H 			//007F 	3206
		LDWI 	6H 			//0080 	2A06
		BCR 	STATUS,5 		//0081 	1283
		BTSC 	STATUS,0 		//0082 	1403
		LJUMP 	87H 			//0083 	3887
		STR 	4DH 			//0084 	01CD

		//;remote-38k-6key-RGB.C: 394: }
		//;remote-38k-6key-RGB.C: 395: if(RGB==6 ){
		LDWI 	6H 			//0085 	2A06
		BCR 	STATUS,5 		//0086 	1283
		XORWR 	4DH,0 			//0087 	044D
		BTSS 	STATUS,2 		//0088 	1D03
		LJUMP 	96H 			//0089 	3896

		//;remote-38k-6key-RGB.C: 396: G=G+1;
		INCR	56H,1 			//008A 	09D6
		BTSC 	STATUS,2 		//008B 	1503
		INCR	57H,1 			//008C 	09D7

		//;remote-38k-6key-RGB.C: 397: R=R+1;
		INCR	58H,1 			//008D 	09D8
		BTSC 	STATUS,2 		//008E 	1503
		INCR	59H,1 			//008F 	09D9

		//;remote-38k-6key-RGB.C: 398: if(G>=160 && R>=160 )RGB=0;
		LCALL 	213H 			//0090 	3213
		BTSS 	STATUS,0 		//0091 	1C03
		LJUMP 	96H 			//0092 	3896
		LCALL 	23BH 			//0093 	323B
		BTSC 	STATUS,0 		//0094 	1403
		CLRR 	4DH 			//0095 	014D

		//;remote-38k-6key-RGB.C: 406: if((CountINT==50||CountINT==0)&&re==0)re=1,RGB++;
		LDWI 	3H 			//0096 	2A03
		BCR 	STATUS,5 		//0097 	1283
		XORWR 	51H,0 			//0098 	0451
		BTSS 	STATUS,2 		//0099 	1D03
		LJUMP 	C1H 			//009A 	38C1
		LDR 	50H,0 			//009B 	0850
		BTSS 	STATUS,2 		//009C 	1D03
		LJUMP 	A1H 			//009D 	38A1
		CLRR 	50H 			//009E 	0150
		INCR	50H,1 			//009F 	09D0
		INCR	4DH,1 			//00A0 	09CD

		//;remote-38k-6key-RGB.C: 408: if(RGB==0) R=160 , G=160, B=0 ;
		LDR 	4DH,0 			//00A1 	084D
		BTSS 	STATUS,2 		//00A2 	1D03
		LJUMP 	A7H 			//00A3 	38A7
		LDWI 	A0H 			//00A4 	2AA0
		STR 	58H 			//00A5 	01D8
		LCALL 	25BH 			//00A6 	325B

		//;remote-38k-6key-RGB.C: 409: if(RGB==1) R=160 , G=0 , B=160 ;
		DECRSZ 	4DH,0 		//00A7 	0E4D
		LJUMP 	B1H 			//00A8 	38B1
		LDWI 	A0H 			//00A9 	2AA0
		STR 	58H 			//00AA 	01D8
		LDWI 	A0H 			//00AB 	2AA0
		CLRR 	59H 			//00AC 	0159
		CLRR 	56H 			//00AD 	0156
		CLRR 	57H 			//00AE 	0157
		STR 	54H 			//00AF 	01D4
		CLRR 	55H 			//00B0 	0155

		//;remote-38k-6key-RGB.C: 410: if(RGB==2) R=0 , G=160, B=160 ;
		LDWI 	2H 			//00B1 	2A02
		XORWR 	4DH,0 			//00B2 	044D
		BTSS 	STATUS,2 		//00B3 	1D03
		LJUMP 	BDH 			//00B4 	38BD
		LDWI 	A0H 			//00B5 	2AA0
		CLRR 	58H 			//00B6 	0158
		CLRR 	59H 			//00B7 	0159
		STR 	56H 			//00B8 	01D6
		LDWI 	A0H 			//00B9 	2AA0
		CLRR 	57H 			//00BA 	0157
		STR 	54H 			//00BB 	01D4
		CLRR 	55H 			//00BC 	0155

		//;remote-38k-6key-RGB.C: 411: if(RGB>=3) RGB=0;
		LDWI 	3H 			//00BD 	2A03
		SUBWR 	4DH,0 			//00BE 	0C4D
		BTSC 	STATUS,0 		//00BF 	1403
		CLRR 	4DH 			//00C0 	014D

		//;remote-38k-6key-RGB.C: 412: }
		//;remote-38k-6key-RGB.C: 414: if(mode==4&&Set==1){
		LDWI 	4H 			//00C1 	2A04
		XORWR 	51H,0 			//00C2 	0451
		BTSS 	STATUS,2 		//00C3 	1D03
		LJUMP 	D0H 			//00C4 	38D0

		//;remote-38k-6key-RGB.C: 416: if(s%2==0&&re==0)re=1,RGB++;
		DECRSZ 	5CH,0 		//00C5 	0E5C
		LJUMP 	D0H 			//00C6 	38D0
		LDR 	50H,0 			//00C7 	0850
		BTSS 	STATUS,2 		//00C8 	1D03
		LJUMP 	CDH 			//00C9 	38CD
		CLRR 	50H 			//00CA 	0150
		INCR	50H,1 			//00CB 	09D0
		INCR	4DH,1 			//00CC 	09CD
		BSR 	5H,4 			//00CD 	1A05
		BSR 	5H,5 			//00CE 	1A85
		BSR 	5H,0 			//00CF 	1805

		//;remote-38k-6key-RGB.C: 425: }
		//;remote-38k-6key-RGB.C: 428: }
		//;remote-38k-6key-RGB.C: 430: if(mode==5&&Set==1){
		LDWI 	5H 			//00D0 	2A05
		XORWR 	51H,0 			//00D1 	0451
		BTSS 	STATUS,2 		//00D2 	1D03
		LJUMP 	DEH 			//00D3 	38DE

		//;remote-38k-6key-RGB.C: 432: if(s%2==0&&re==0)re=1;
		DECRSZ 	5CH,0 		//00D4 	0E5C
		LJUMP 	DEH 			//00D5 	38DE
		LDR 	50H,0 			//00D6 	0850
		BTSS 	STATUS,2 		//00D7 	1D03
		LJUMP 	DBH 			//00D8 	38DB
		CLRR 	50H 			//00D9 	0150
		INCR	50H,1 			//00DA 	09D0

		//;remote-38k-6key-RGB.C: 434: if(CountINT%10==0)PA4=1,PA5=1,PA0=1;
		BSR 	5H,4 			//00DB 	1A05
		BSR 	5H,5 			//00DC 	1A85
		BSR 	5H,0 			//00DD 	1805

		//;remote-38k-6key-RGB.C: 438: }
		//;remote-38k-6key-RGB.C: 441: }
		//;remote-38k-6key-RGB.C: 445: if(ReceiveFinish || repeat)
		LDR 	44H,0 			//00DE 	0844
		BTSC 	STATUS,2 		//00DF 	1503
		LDR 	4FH,0 			//00E0 	084F
		BTSC 	STATUS,2 		//00E1 	1503
		LJUMP 	2BH 			//00E2 	382B

		//;remote-38k-6key-RGB.C: 446: {
		//;remote-38k-6key-RGB.C: 447: ReceiveFinish = 0;
		CLRR 	44H 			//00E3 	0144

		//;remote-38k-6key-RGB.C: 450: rdata1 = 0xFF - IRDataTimer[0];
		COMR 	40H,0 			//00E4 	0F40
		STR 	61H 			//00E5 	01E1

		//;remote-38k-6key-RGB.C: 451: rdata2 = 0xFF - IRDataTimer[2];
		COMR 	42H,0 			//00E6 	0F42
		STR 	62H 			//00E7 	01E2

		//;remote-38k-6key-RGB.C: 452: if((rdata1 == IRDataTimer[1])&&(rdata2 == IRDataTimer[3]))
		LDR 	41H,0 			//00E8 	0841
		XORWR 	61H,0 			//00E9 	0461
		BTSS 	STATUS,2 		//00EA 	1D03
		LJUMP 	201H 			//00EB 	3A01
		LDR 	43H,0 			//00EC 	0843
		XORWR 	62H,0 			//00ED 	0462
		BTSS 	STATUS,2 		//00EE 	1D03
		LJUMP 	201H 			//00EF 	3A01

		//;remote-38k-6key-RGB.C: 453: {
		//;remote-38k-6key-RGB.C: 456: if( rdata2==0xED && repeat==0)
		LDWI 	EDH 			//00F0 	2AED
		XORWR 	62H,0 			//00F1 	0462
		BTSS 	STATUS,2 		//00F2 	1D03
		LJUMP 	FCH 			//00F3 	38FC
		LDR 	4FH,0 			//00F4 	084F
		BTSS 	STATUS,2 		//00F5 	1D03
		LJUMP 	FCH 			//00F6 	38FC

		//;remote-38k-6key-RGB.C: 457: {
		//;remote-38k-6key-RGB.C: 458: Set++;
		INCR	5CH,1 			//00F7 	09DC

		//;remote-38k-6key-RGB.C: 459: if(Set==1)
		DECRSZ 	5CH,0 		//00F8 	0E5C
		LJUMP 	FBH 			//00F9 	38FB
		LJUMP 	FCH 			//00FA 	38FC

		//;remote-38k-6key-RGB.C: 466: else
		//;remote-38k-6key-RGB.C: 467: {
		//;remote-38k-6key-RGB.C: 471: Set=0;
		CLRR 	5CH 			//00FB 	015C

		//;remote-38k-6key-RGB.C: 473: }
		//;remote-38k-6key-RGB.C: 474: }
		//;remote-38k-6key-RGB.C: 479: if(rdata1==0x7F && rdata2==0xE1 )
		LDWI 	7FH 			//00FC 	2A7F
		XORWR 	61H,0 			//00FD 	0461
		BTSS 	STATUS,2 		//00FE 	1D03
		LJUMP 	165H 			//00FF 	3965
		LDWI 	E1H 			//0100 	2AE1
		XORWR 	62H,0 			//0101 	0462
		BTSS 	STATUS,2 		//0102 	1D03
		LJUMP 	165H 			//0103 	3965

		//;remote-38k-6key-RGB.C: 480: {
		//;remote-38k-6key-RGB.C: 481: mode=0;
		CLRR 	51H 			//0104 	0151

		//;remote-38k-6key-RGB.C: 482: if(one==0)one=1,RGB=0 , R=160 , G= 160 , B=0;
		LDR 	4BH,0 			//0105 	084B
		BTSS 	STATUS,2 		//0106 	1D03
		LJUMP 	10FH 			//0107 	390F
		LDWI 	A0H 			//0108 	2AA0
		CLRR 	4BH 			//0109 	014B
		INCR	4BH,1 			//010A 	09CB
		CLRR 	4DH 			//010B 	014D
		STR 	58H 			//010C 	01D8
		LDWI 	A0H 			//010D 	2AA0
		LCALL 	25BH 			//010E 	325B

		//;remote-38k-6key-RGB.C: 484: if(RGB==0 ){
		LDR 	4DH,0 			//010F 	084D
		BTSS 	STATUS,2 		//0110 	1D03
		LJUMP 	119H 			//0111 	3919

		//;remote-38k-6key-RGB.C: 485: G=G-10;
		LDWI 	F6H 			//0112 	2AF6

		//;remote-38k-6key-RGB.C: 486: if(G<=0)RGB=1;
		LCALL 	206H 			//0113 	3206
		BCR 	STATUS,5 		//0114 	1283
		BTSC 	STATUS,0 		//0115 	1403
		LJUMP 	11AH 			//0116 	391A
		CLRR 	4DH 			//0117 	014D
		INCR	4DH,1 			//0118 	09CD

		//;remote-38k-6key-RGB.C: 487: }
		//;remote-38k-6key-RGB.C: 488: if(RGB==1 ){
		BCR 	STATUS,5 		//0119 	1283
		DECRSZ 	4DH,0 		//011A 	0E4D
		LJUMP 	124H 			//011B 	3924

		//;remote-38k-6key-RGB.C: 489: B=B+10;
		LDWI 	AH 			//011C 	2A0A
		ADDWR 	54H,1 			//011D 	0BD4
		BTSC 	STATUS,0 		//011E 	1403
		INCR	55H,1 			//011F 	09D5

		//;remote-38k-6key-RGB.C: 490: if(B>=160)RGB=2;
		LCALL 	247H 			//0120 	3247
		BTSS 	STATUS,0 		//0121 	1C03
		LJUMP 	126H 			//0122 	3926
		STR 	4DH 			//0123 	01CD

		//;remote-38k-6key-RGB.C: 491: }
		//;remote-38k-6key-RGB.C: 492: if(RGB==2 ){
		LDWI 	2H 			//0124 	2A02
		BCR 	STATUS,5 		//0125 	1283
		XORWR 	4DH,0 			//0126 	044D
		BTSS 	STATUS,2 		//0127 	1D03
		LJUMP 	12EH 			//0128 	392E

		//;remote-38k-6key-RGB.C: 493: R=R-10;
		LDWI 	F6H 			//0129 	2AF6

		//;remote-38k-6key-RGB.C: 494: if(R<=0)RGB=3;
		LCALL 	22CH 			//012A 	322C
		BTSC 	STATUS,0 		//012B 	1403
		LJUMP 	130H 			//012C 	3930
		STR 	4DH 			//012D 	01CD

		//;remote-38k-6key-RGB.C: 495: }
		//;remote-38k-6key-RGB.C: 496: if(RGB==3 ){
		LDWI 	3H 			//012E 	2A03
		BCR 	STATUS,5 		//012F 	1283
		XORWR 	4DH,0 			//0130 	044D
		BTSS 	STATUS,2 		//0131 	1D03
		LJUMP 	13DH 			//0132 	393D

		//;remote-38k-6key-RGB.C: 497: G=G+10;
		LDWI 	AH 			//0133 	2A0A
		ADDWR 	56H,1 			//0134 	0BD6
		BTSC 	STATUS,0 		//0135 	1403
		INCR	57H,1 			//0136 	09D7

		//;remote-38k-6key-RGB.C: 498: if(G>=160)RGB=4;
		LCALL 	213H 			//0137 	3213
		LDWI 	4H 			//0138 	2A04
		BCR 	STATUS,5 		//0139 	1283
		BTSS 	STATUS,0 		//013A 	1C03
		LJUMP 	13FH 			//013B 	393F
		STR 	4DH 			//013C 	01CD

		//;remote-38k-6key-RGB.C: 499: }
		//;remote-38k-6key-RGB.C: 500: if(RGB==4 ){
		LDWI 	4H 			//013D 	2A04
		BCR 	STATUS,5 		//013E 	1283
		XORWR 	4DH,0 			//013F 	044D
		BTSS 	STATUS,2 		//0140 	1D03
		LJUMP 	147H 			//0141 	3947

		//;remote-38k-6key-RGB.C: 501: B=B-10;
		LDWI 	F6H 			//0142 	2AF6

		//;remote-38k-6key-RGB.C: 502: if(B<=0)RGB=5;
		LCALL 	21DH 			//0143 	321D
		BTSC 	STATUS,0 		//0144 	1403
		LJUMP 	149H 			//0145 	3949
		STR 	4DH 			//0146 	01CD

		//;remote-38k-6key-RGB.C: 503: }
		//;remote-38k-6key-RGB.C: 504: if(RGB==5 ){
		LDWI 	5H 			//0147 	2A05
		BCR 	STATUS,5 		//0148 	1283
		XORWR 	4DH,0 			//0149 	044D
		BTSS 	STATUS,2 		//014A 	1D03
		LJUMP 	153H 			//014B 	3953

		//;remote-38k-6key-RGB.C: 505: G=G-10;
		LDWI 	F6H 			//014C 	2AF6

		//;remote-38k-6key-RGB.C: 506: if(G<=0)RGB=6;
		LCALL 	206H 			//014D 	3206
		LDWI 	6H 			//014E 	2A06
		BCR 	STATUS,5 		//014F 	1283
		BTSC 	STATUS,0 		//0150 	1403
		LJUMP 	155H 			//0151 	3955
		STR 	4DH 			//0152 	01CD

		//;remote-38k-6key-RGB.C: 507: }
		//;remote-38k-6key-RGB.C: 508: if(RGB==6 ){
		LDWI 	6H 			//0153 	2A06
		BCR 	STATUS,5 		//0154 	1283
		XORWR 	4DH,0 			//0155 	044D
		BTSS 	STATUS,2 		//0156 	1D03
		LJUMP 	165H 			//0157 	3965

		//;remote-38k-6key-RGB.C: 509: G=G+10;
		LDWI 	AH 			//0158 	2A0A
		ADDWR 	56H,1 			//0159 	0BD6
		BTSC 	STATUS,0 		//015A 	1403
		INCR	57H,1 			//015B 	09D7

		//;remote-38k-6key-RGB.C: 510: R=R+10;
		ADDWR 	58H,1 			//015C 	0BD8
		BTSC 	STATUS,0 		//015D 	1403
		INCR	59H,1 			//015E 	09D9

		//;remote-38k-6key-RGB.C: 511: if(G>=160 && R>=160 )RGB=0;
		LCALL 	213H 			//015F 	3213
		BTSS 	STATUS,0 		//0160 	1C03
		LJUMP 	165H 			//0161 	3965
		LCALL 	23BH 			//0162 	323B
		BTSC 	STATUS,0 		//0163 	1403
		CLRR 	4DH 			//0164 	014D

		//;remote-38k-6key-RGB.C: 512: }
		//;remote-38k-6key-RGB.C: 513: }
		//;remote-38k-6key-RGB.C: 518: if( rdata2==0xF9 && Set==1 && repeat==0 )
		LDWI 	F9H 			//0165 	2AF9
		BCR 	STATUS,5 		//0166 	1283
		XORWR 	62H,0 			//0167 	0462
		BTSS 	STATUS,2 		//0168 	1D03
		LJUMP 	186H 			//0169 	3986
		DECRSZ 	5CH,0 		//016A 	0E5C
		LJUMP 	186H 			//016B 	3986
		LDR 	4FH,0 			//016C 	084F
		BTSS 	STATUS,2 		//016D 	1D03
		LJUMP 	186H 			//016E 	3986

		//;remote-38k-6key-RGB.C: 519: {
		//;remote-38k-6key-RGB.C: 520: if(Counter_On_set>40){
		LDWI 	29H 			//016F 	2A29
		SUBWR 	5BH,0 			//0170 	0C5B
		BTSS 	STATUS,0 		//0171 	1C03
		LJUMP 	186H 			//0172 	3986

		//;remote-38k-6key-RGB.C: 521: Counter_On_set=Counter_On_set-15;
		LDWI 	F1H 			//0173 	2AF1
		ADDWR 	5BH,1 			//0174 	0BDB

		//;remote-38k-6key-RGB.C: 523: if(Counter_On_set<=40 ){
		LDWI 	29H 			//0175 	2A29
		SUBWR 	5BH,0 			//0176 	0C5B
		BTSC 	STATUS,0 		//0177 	1403
		LJUMP 	186H 			//0178 	3986

		//;remote-38k-6key-RGB.C: 524: Counter_On_set=0;
		CLRR 	5BH 			//0179 	015B

		//;remote-38k-6key-RGB.C: 525: PAIE=0;
		BCR 	INTCON,3 		//017A 	118B

		//;remote-38k-6key-RGB.C: 526: TMR2IE=0;
		BSR 	STATUS,5 		//017B 	1A83
		BCR 	CH,1 			//017C 	108C

		//;remote-38k-6key-RGB.C: 527: PA4=0,PA5=0,PA0=0;
		BCR 	STATUS,5 		//017D 	1283
		BCR 	5H,4 			//017E 	1205
		BCR 	5H,5 			//017F 	1285
		BCR 	5H,0 			//0180 	1005

		//;remote-38k-6key-RGB.C: 528: DelayMs(100);
		LDWI 	64H 			//0181 	2A64
		LCALL 	365H 			//0182 	3365

		//;remote-38k-6key-RGB.C: 529: PAIE=1;
		BSR 	INTCON,3 		//0183 	198B

		//;remote-38k-6key-RGB.C: 530: TMR2IE=1;
		BSR 	STATUS,5 		//0184 	1A83
		BSR 	CH,1 			//0185 	188C

		//;remote-38k-6key-RGB.C: 531: }
		//;remote-38k-6key-RGB.C: 532: }
		//;remote-38k-6key-RGB.C: 533: }
		//;remote-38k-6key-RGB.C: 535: if( rdata2==0xFB && Set==1 && repeat==0 )
		LDWI 	FBH 			//0186 	2AFB
		BCR 	STATUS,5 		//0187 	1283
		XORWR 	62H,0 			//0188 	0462
		BTSS 	STATUS,2 		//0189 	1D03
		LJUMP 	1A0H 			//018A 	39A0
		DECRSZ 	5CH,0 		//018B 	0E5C
		LJUMP 	1A0H 			//018C 	39A0
		LDR 	4FH,0 			//018D 	084F
		BTSS 	STATUS,2 		//018E 	1D03
		LJUMP 	1A0H 			//018F 	39A0

		//;remote-38k-6key-RGB.C: 536: {
		//;remote-38k-6key-RGB.C: 537: if(Counter_On_set<130){
		LDWI 	82H 			//0190 	2A82
		SUBWR 	5BH,0 			//0191 	0C5B
		BTSC 	STATUS,0 		//0192 	1403
		LJUMP 	1A0H 			//0193 	39A0

		//;remote-38k-6key-RGB.C: 539: Counter_On_set=Counter_On_set+15;
		LDWI 	FH 			//0194 	2A0F
		ADDWR 	5BH,1 			//0195 	0BDB

		//;remote-38k-6key-RGB.C: 541: if(Counter_On_set>=130 ){
		LDWI 	82H 			//0196 	2A82
		SUBWR 	5BH,0 			//0197 	0C5B
		BTSS 	STATUS,0 		//0198 	1C03
		LJUMP 	1A0H 			//0199 	39A0

		//;remote-38k-6key-RGB.C: 542: PAIE=0;
		//;remote-38k-6key-RGB.C: 543: TMR2IE=0;
		//;remote-38k-6key-RGB.C: 544: PA4=1,PA5=1,PA0=1;
		LCALL 	253H 			//019A 	3253

		//;remote-38k-6key-RGB.C: 545: DelayMs(100);
		LDWI 	64H 			//019B 	2A64
		LCALL 	365H 			//019C 	3365

		//;remote-38k-6key-RGB.C: 546: PAIE=1;
		BSR 	INTCON,3 		//019D 	198B

		//;remote-38k-6key-RGB.C: 547: TMR2IE=1;
		BSR 	STATUS,5 		//019E 	1A83
		BSR 	CH,1 			//019F 	188C

		//;remote-38k-6key-RGB.C: 548: }
		//;remote-38k-6key-RGB.C: 549: }
		//;remote-38k-6key-RGB.C: 550: }
		//;remote-38k-6key-RGB.C: 552: if(rdata1==0x7F && rdata2==0xF7 && repeat==0 && Set==1)
		LDWI 	7FH 			//01A0 	2A7F
		BCR 	STATUS,5 		//01A1 	1283
		XORWR 	61H,0 			//01A2 	0461
		BTSS 	STATUS,2 		//01A3 	1D03
		LJUMP 	1D4H 			//01A4 	39D4
		LDWI 	F7H 			//01A5 	2AF7
		XORWR 	62H,0 			//01A6 	0462
		BTSS 	STATUS,2 		//01A7 	1D03
		LJUMP 	1D4H 			//01A8 	39D4
		LDR 	4FH,0 			//01A9 	084F
		BTSS 	STATUS,2 		//01AA 	1D03
		LJUMP 	1D4H 			//01AB 	39D4
		DECRSZ 	5CH,0 		//01AC 	0E5C
		LJUMP 	1D4H 			//01AD 	39D4

		//;remote-38k-6key-RGB.C: 553: {
		//;remote-38k-6key-RGB.C: 554: PAIE=0;
		BCR 	INTCON,3 		//01AE 	118B

		//;remote-38k-6key-RGB.C: 555: TMR2IE=0;
		BSR 	STATUS,5 		//01AF 	1A83
		BCR 	CH,1 			//01B0 	108C
		LDWI 	8H 			//01B1 	2A08

		//;remote-38k-6key-RGB.C: 559: m=0;
		BCR 	STATUS,5 		//01B2 	1283
		INCR	4CH,1 			//01B3 	09CC
		INCR	4CH,1 			//01B4 	09CC

		//;remote-38k-6key-RGB.C: 560: h=0;
		CLRR 	4EH 			//01B5 	014E

		//;remote-38k-6key-RGB.C: 561: if(timer>=8){
		SUBWR 	4CH,0 			//01B6 	0C4C
		BTSS 	STATUS,0 		//01B7 	1C03
		LJUMP 	1C0H 			//01B8 	39C0

		//;remote-38k-6key-RGB.C: 562: timer=0;
		CLRR 	4CH 			//01B9 	014C

		//;remote-38k-6key-RGB.C: 563: PA4=1,PA5=1,PA0=1;
		BSR 	5H,4 			//01BA 	1A05
		BSR 	5H,5 			//01BB 	1A85
		BSR 	5H,0 			//01BC 	1805

		//;remote-38k-6key-RGB.C: 564: DelayS(2);
		LDWI 	2H 			//01BD 	2A02
		LCALL 	344H 			//01BE 	3344

		//;remote-38k-6key-RGB.C: 566: }else{
		LJUMP 	1D1H 			//01BF 	39D1

		//;remote-38k-6key-RGB.C: 567: unsigned char a;
		//;remote-38k-6key-RGB.C: 568: for(a=0;a<(timer/2);a++)
		CLRR 	60H 			//01C0 	0160
		BCR 	STATUS,0 		//01C1 	1003
		RRR	4CH,0 			//01C2 	064C
		SUBWR 	60H,0 			//01C3 	0C60
		BTSC 	STATUS,0 		//01C4 	1403
		LJUMP 	1D1H 			//01C5 	39D1

		//;remote-38k-6key-RGB.C: 569: {
		//;remote-38k-6key-RGB.C: 570: PAIE=0;
		//;remote-38k-6key-RGB.C: 571: TMR2IE=0;
		//;remote-38k-6key-RGB.C: 573: PA4=1,PA5=1,PA0=1;
		LCALL 	253H 			//01C6 	3253

		//;remote-38k-6key-RGB.C: 574: DelayMs(200);
		LDWI 	C8H 			//01C7 	2AC8
		LCALL 	365H 			//01C8 	3365

		//;remote-38k-6key-RGB.C: 576: PAIE=1;
		BSR 	INTCON,3 		//01C9 	198B

		//;remote-38k-6key-RGB.C: 577: TMR2IE=1;
		BSR 	STATUS,5 		//01CA 	1A83
		BSR 	CH,1 			//01CB 	188C

		//;remote-38k-6key-RGB.C: 579: DelayMs(150);
		LDWI 	96H 			//01CC 	2A96
		LCALL 	365H 			//01CD 	3365
		BCR 	STATUS,5 		//01CE 	1283
		INCR	60H,1 			//01CF 	09E0
		LJUMP 	1C1H 			//01D0 	39C1

		//;remote-38k-6key-RGB.C: 580: }
		//;remote-38k-6key-RGB.C: 581: }
		//;remote-38k-6key-RGB.C: 587: PAIE=1;
		BSR 	INTCON,3 		//01D1 	198B

		//;remote-38k-6key-RGB.C: 588: TMR2IE=1;
		BSR 	STATUS,5 		//01D2 	1A83
		BSR 	CH,1 			//01D3 	188C

		//;remote-38k-6key-RGB.C: 589: }
		//;remote-38k-6key-RGB.C: 591: if(rdata1==0x7F && rdata2==0xFD && repeat==0 && Set==1)
		LDWI 	7FH 			//01D4 	2A7F
		BCR 	STATUS,5 		//01D5 	1283
		XORWR 	61H,0 			//01D6 	0461
		BTSS 	STATUS,2 		//01D7 	1D03
		LJUMP 	201H 			//01D8 	3A01
		LDWI 	FDH 			//01D9 	2AFD
		XORWR 	62H,0 			//01DA 	0462
		BTSS 	STATUS,2 		//01DB 	1D03
		LJUMP 	201H 			//01DC 	3A01
		LDR 	4FH,0 			//01DD 	084F
		BTSS 	STATUS,2 		//01DE 	1D03
		LJUMP 	201H 			//01DF 	3A01
		DECRSZ 	5CH,0 		//01E0 	0E5C
		LJUMP 	201H 			//01E1 	3A01

		//;remote-38k-6key-RGB.C: 592: {
		//;remote-38k-6key-RGB.C: 593: R=160 , G=160, B=0;
		LDWI 	A0H 			//01E2 	2AA0
		STR 	58H 			//01E3 	01D8
		LCALL 	25BH 			//01E4 	325B

		//;remote-38k-6key-RGB.C: 595: one=0;
		CLRR 	4BH 			//01E5 	014B

		//;remote-38k-6key-RGB.C: 597: PAIE=0;
		//;remote-38k-6key-RGB.C: 598: TMR2IE=0;
		//;remote-38k-6key-RGB.C: 599: PA4=1,PA5=1,PA0=1;
		LCALL 	253H 			//01E6 	3253

		//;remote-38k-6key-RGB.C: 600: DelayMs(100);
		LDWI 	64H 			//01E7 	2A64
		LCALL 	365H 			//01E8 	3365

		//;remote-38k-6key-RGB.C: 601: PA4=0,PA5=0,PA0=0;
		BCR 	STATUS,5 		//01E9 	1283
		BCR 	5H,4 			//01EA 	1205
		BCR 	5H,5 			//01EB 	1285
		BCR 	5H,0 			//01EC 	1005
		LDWI 	6H 			//01ED 	2A06

		//;remote-38k-6key-RGB.C: 602: mode++;
		INCR	51H,1 			//01EE 	09D1

		//;remote-38k-6key-RGB.C: 603: if(mode>5)mode=1;
		SUBWR 	51H,0 			//01EF 	0C51
		BTSS 	STATUS,0 		//01F0 	1C03
		LJUMP 	1F4H 			//01F1 	39F4
		CLRR 	51H 			//01F2 	0151
		INCR	51H,1 			//01F3 	09D1

		//;remote-38k-6key-RGB.C: 604: if(mode==1)modetime=10;
		DECRSZ 	51H,0 		//01F4 	0E51
		LJUMP 	1F8H 			//01F5 	39F8
		LDWI 	AH 			//01F6 	2A0A
		STR 	4AH 			//01F7 	01CA

		//;remote-38k-6key-RGB.C: 605: if(mode==2)modetime=140;
		LDWI 	2H 			//01F8 	2A02
		XORWR 	51H,0 			//01F9 	0451
		BTSS 	STATUS,2 		//01FA 	1D03
		LJUMP 	1FEH 			//01FB 	39FE
		LDWI 	8CH 			//01FC 	2A8C
		STR 	4AH 			//01FD 	01CA

		//;remote-38k-6key-RGB.C: 606: PAIE=1;
		BSR 	INTCON,3 		//01FE 	198B

		//;remote-38k-6key-RGB.C: 607: TMR2IE=1;
		BSR 	STATUS,5 		//01FF 	1A83
		BSR 	CH,1 			//0200 	188C

		//;remote-38k-6key-RGB.C: 608: }
		//;remote-38k-6key-RGB.C: 611: }
		//;remote-38k-6key-RGB.C: 613: rdata1=0;
		BCR 	STATUS,5 		//0201 	1283
		CLRR 	61H 			//0202 	0161

		//;remote-38k-6key-RGB.C: 614: rdata2=0;
		CLRR 	62H 			//0203 	0162

		//;remote-38k-6key-RGB.C: 615: repeat=0;
		CLRR 	4FH 			//0204 	014F
		LJUMP 	2BH 			//0205 	382B
		ADDWR 	56H,1 			//0206 	0BD6
		BTSS 	STATUS,0 		//0207 	1C03
		DECR 	57H,1 			//0208 	0DD7
		LDR 	57H,0 			//0209 	0857
		XORWI 	80H 			//020A 	2680
		STR 	7FH 			//020B 	01FF
		LDWI 	80H 			//020C 	2A80
		SUBWR 	7FH,0 			//020D 	0C7F
		BTSS 	STATUS,2 		//020E 	1D03
		RET		 					//020F 	0004
		LDWI 	1H 			//0210 	2A01
		SUBWR 	56H,0 			//0211 	0C56
		RET		 					//0212 	0004
		LDR 	57H,0 			//0213 	0857
		XORWI 	80H 			//0214 	2680
		STR 	7FH 			//0215 	01FF
		LDWI 	80H 			//0216 	2A80
		SUBWR 	7FH,0 			//0217 	0C7F
		BTSS 	STATUS,2 		//0218 	1D03
		RET		 					//0219 	0004
		LDWI 	A0H 			//021A 	2AA0
		SUBWR 	56H,0 			//021B 	0C56
		RET		 					//021C 	0004
		ADDWR 	54H,1 			//021D 	0BD4
		BTSS 	STATUS,0 		//021E 	1C03
		DECR 	55H,1 			//021F 	0DD5
		LDR 	55H,0 			//0220 	0855
		XORWI 	80H 			//0221 	2680
		STR 	7FH 			//0222 	01FF
		LDWI 	80H 			//0223 	2A80
		SUBWR 	7FH,0 			//0224 	0C7F
		BTSS 	STATUS,2 		//0225 	1D03
		LJUMP 	229H 			//0226 	3A29
		LDWI 	1H 			//0227 	2A01
		SUBWR 	54H,0 			//0228 	0C54
		LDWI 	5H 			//0229 	2A05
		BCR 	STATUS,5 		//022A 	1283
		RET		 					//022B 	0004
		ADDWR 	58H,1 			//022C 	0BD8
		BTSS 	STATUS,0 		//022D 	1C03
		DECR 	59H,1 			//022E 	0DD9
		LDR 	59H,0 			//022F 	0859
		XORWI 	80H 			//0230 	2680
		STR 	7FH 			//0231 	01FF
		LDWI 	80H 			//0232 	2A80
		SUBWR 	7FH,0 			//0233 	0C7F
		BTSS 	STATUS,2 		//0234 	1D03
		LJUMP 	238H 			//0235 	3A38
		LDWI 	1H 			//0236 	2A01
		SUBWR 	58H,0 			//0237 	0C58
		LDWI 	3H 			//0238 	2A03
		BCR 	STATUS,5 		//0239 	1283
		RET		 					//023A 	0004
		BCR 	STATUS,5 		//023B 	1283
		LDR 	59H,0 			//023C 	0859
		XORWI 	80H 			//023D 	2680
		STR 	7FH 			//023E 	01FF
		LDWI 	80H 			//023F 	2A80
		SUBWR 	7FH,0 			//0240 	0C7F
		BTSS 	STATUS,2 		//0241 	1D03
		LJUMP 	245H 			//0242 	3A45
		LDWI 	A0H 			//0243 	2AA0
		SUBWR 	58H,0 			//0244 	0C58
		BCR 	STATUS,5 		//0245 	1283
		RET		 					//0246 	0004
		LDR 	55H,0 			//0247 	0855
		XORWI 	80H 			//0248 	2680
		STR 	7FH 			//0249 	01FF
		LDWI 	80H 			//024A 	2A80
		SUBWR 	7FH,0 			//024B 	0C7F
		BTSS 	STATUS,2 		//024C 	1D03
		LJUMP 	250H 			//024D 	3A50
		LDWI 	A0H 			//024E 	2AA0
		SUBWR 	54H,0 			//024F 	0C54
		LDWI 	2H 			//0250 	2A02
		BCR 	STATUS,5 		//0251 	1283
		RET		 					//0252 	0004
		BCR 	INTCON,3 		//0253 	118B
		BSR 	STATUS,5 		//0254 	1A83
		BCR 	CH,1 			//0255 	108C
		BCR 	STATUS,5 		//0256 	1283
		BSR 	5H,4 			//0257 	1A05
		BSR 	5H,5 			//0258 	1A85
		BSR 	5H,0 			//0259 	1805
		RET		 					//025A 	0004
		CLRR 	59H 			//025B 	0159
		STR 	56H 			//025C 	01D6
		CLRR 	57H 			//025D 	0157
		CLRR 	54H 			//025E 	0154
		CLRR 	55H 			//025F 	0155
		RET		 					//0260 	0004

		//;remote-38k-6key-RGB.C: 147: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//0261 	1A83
		BTSS 	CH,1 			//0262 	1C8C
		LJUMP 	31FH 			//0263 	3B1F
		BCR 	STATUS,5 		//0264 	1283
		BTSS 	CH,1 			//0265 	1C8C
		LJUMP 	31FH 			//0266 	3B1F

		//;remote-38k-6key-RGB.C: 148: {
		//;remote-38k-6key-RGB.C: 150: TMR2IF = 0;
		BCR 	CH,1 			//0267 	108C

		//;remote-38k-6key-RGB.C: 151: TMR2IE = 1;
		BSR 	STATUS,5 		//0268 	1A83
		BSR 	CH,1 			//0269 	188C

		//;remote-38k-6key-RGB.C: 158: if(PA1==0){
		BCR 	STATUS,5 		//026A 	1283
		BTSC 	5H,1 			//026B 	1485
		LJUMP 	271H 			//026C 	3A71

		//;remote-38k-6key-RGB.C: 159: PA2=~PA2;
		LDWI 	4H 			//026D 	2A04
		XORWR 	5H,1 			//026E 	0485

		//;remote-38k-6key-RGB.C: 160: countz++;
		INCR	49H,1 			//026F 	09C9

		//;remote-38k-6key-RGB.C: 162: }else{
		LJUMP 	273H 			//0270 	3A73

		//;remote-38k-6key-RGB.C: 163: countz=0;
		CLRR 	49H 			//0271 	0149

		//;remote-38k-6key-RGB.C: 164: PA2=0;
		BCR 	5H,2 			//0272 	1105

		//;remote-38k-6key-RGB.C: 165: }
		//;remote-38k-6key-RGB.C: 171: if(countz==2){
		LDWI 	2H 			//0273 	2A02
		XORWR 	49H,0 			//0274 	0449
		BTSS 	STATUS,2 		//0275 	1D03
		LJUMP 	296H 			//0276 	3A96

		//;remote-38k-6key-RGB.C: 173: if(Counter>150){
		LDWI 	97H 			//0277 	2A97
		SUBWR 	52H,0 			//0278 	0C52
		BTSS 	STATUS,0 		//0279 	1C03
		LJUMP 	27FH 			//027A 	3A7F

		//;remote-38k-6key-RGB.C: 175: Counter=0;
		CLRR 	52H 			//027B 	0152

		//;remote-38k-6key-RGB.C: 177: PA4=0;
		BCR 	5H,4 			//027C 	1205

		//;remote-38k-6key-RGB.C: 178: PA5=0;
		BCR 	5H,5 			//027D 	1285

		//;remote-38k-6key-RGB.C: 179: PA0=0;
		BCR 	5H,0 			//027E 	1005

		//;remote-38k-6key-RGB.C: 180: }
		//;remote-38k-6key-RGB.C: 181: Rq=0;
		CLRR 	48H 			//027F 	0148

		//;remote-38k-6key-RGB.C: 182: Gq=0;
		CLRR 	47H 			//0280 	0147

		//;remote-38k-6key-RGB.C: 183: Bq=0;
		CLRR 	46H 			//0281 	0146

		//;remote-38k-6key-RGB.C: 185: if(Set==1){
		DECRSZ 	5CH,0 		//0282 	0E5C
		LJUMP 	28DH 			//0283 	3A8D

		//;remote-38k-6key-RGB.C: 186: if(Counter_On>Counter_On_set){
		LDR 	7AH,0 			//0284 	087A
		SUBWR 	5BH,0 			//0285 	0C5B
		BTSC 	STATUS,0 		//0286 	1403
		LJUMP 	28BH 			//0287 	3A8B

		//;remote-38k-6key-RGB.C: 187: Counter_On=Counter_On-1;
		LDWI 	FFH 			//0288 	2AFF
		ADDWR 	7AH,1 			//0289 	0BFA

		//;remote-38k-6key-RGB.C: 188: }else{
		LJUMP 	28DH 			//028A 	3A8D

		//;remote-38k-6key-RGB.C: 189: Counter_On=Counter_On_set;
		LDR 	5BH,0 			//028B 	085B
		STR 	7AH 			//028C 	01FA

		//;remote-38k-6key-RGB.C: 190: }
		//;remote-38k-6key-RGB.C: 191: }
		//;remote-38k-6key-RGB.C: 193: if(Set==0 && Counter_On<=160)
		LDR 	5CH,0 			//028D 	085C
		BTSS 	STATUS,2 		//028E 	1D03
		LJUMP 	296H 			//028F 	3A96
		LDWI 	A1H 			//0290 	2AA1
		SUBWR 	7AH,0 			//0291 	0C7A
		BTSC 	STATUS,0 		//0292 	1403
		LJUMP 	296H 			//0293 	3A96

		//;remote-38k-6key-RGB.C: 194: {
		//;remote-38k-6key-RGB.C: 195: Counter_On=Counter_On+2;
		INCR	7AH,1 			//0294 	09FA
		INCR	7AH,1 			//0295 	09FA

		//;remote-38k-6key-RGB.C: 196: }
		//;remote-38k-6key-RGB.C: 198: }
		//;remote-38k-6key-RGB.C: 203: Counter++;
		INCR	52H,1 			//0296 	09D2

		//;remote-38k-6key-RGB.C: 205: if(Counter>=Counter_On)
		LDR 	7AH,0 			//0297 	087A
		SUBWR 	52H,0 			//0298 	0C52
		BTSS 	STATUS,0 		//0299 	1C03
		LJUMP 	2DCH 			//029A 	3ADC

		//;remote-38k-6key-RGB.C: 206: {
		//;remote-38k-6key-RGB.C: 208: if(Rq==1)PA4=0,Rq=2;
		DECRSZ 	48H,0 		//029B 	0E48
		LJUMP 	2A0H 			//029C 	3AA0
		BCR 	5H,4 			//029D 	1205
		LDWI 	2H 			//029E 	2A02
		STR 	48H 			//029F 	01C8

		//;remote-38k-6key-RGB.C: 209: if(Gq==1)PA5=0,Gq=2;
		DECRSZ 	47H,0 		//02A0 	0E47
		LJUMP 	2A5H 			//02A1 	3AA5
		BCR 	5H,5 			//02A2 	1285
		LDWI 	2H 			//02A3 	2A02
		STR 	47H 			//02A4 	01C7

		//;remote-38k-6key-RGB.C: 210: if(Bq==1)PA0=0,Bq=2;
		DECRSZ 	46H,0 		//02A5 	0E46
		LJUMP 	2AAH 			//02A6 	3AAA
		BCR 	5H,0 			//02A7 	1005
		LDWI 	2H 			//02A8 	2A02
		STR 	46H 			//02A9 	01C6

		//;remote-38k-6key-RGB.C: 215: if(Counter>=R && Rq==0){
		LDR 	59H,0 			//02AA 	0859
		XORWI 	80H 			//02AB 	2680
		SUBWI 	80H 			//02AC 	2880
		BTSS 	STATUS,2 		//02AD 	1D03
		LJUMP 	2B1H 			//02AE 	3AB1
		LDR 	58H,0 			//02AF 	0858
		SUBWR 	52H,0 			//02B0 	0C52
		BCR 	STATUS,5 		//02B1 	1283
		BTSS 	STATUS,0 		//02B2 	1C03
		LJUMP 	2BBH 			//02B3 	3ABB
		LDR 	48H,0 			//02B4 	0848
		BTSS 	STATUS,2 		//02B5 	1D03
		LJUMP 	2BAH 			//02B6 	3ABA

		//;remote-38k-6key-RGB.C: 216: Rq=1;
		CLRR 	48H 			//02B7 	0148
		INCR	48H,1 			//02B8 	09C8

		//;remote-38k-6key-RGB.C: 217: PA4=1;
		BSR 	5H,4 			//02B9 	1A05

		//;remote-38k-6key-RGB.C: 218: }
		//;remote-38k-6key-RGB.C: 220: if(Counter>=G && Gq==0){
		BCR 	STATUS,5 		//02BA 	1283
		LDR 	57H,0 			//02BB 	0857
		XORWI 	80H 			//02BC 	2680
		SUBWI 	80H 			//02BD 	2880
		BTSS 	STATUS,2 		//02BE 	1D03
		LJUMP 	2C2H 			//02BF 	3AC2
		LDR 	56H,0 			//02C0 	0856
		SUBWR 	52H,0 			//02C1 	0C52
		BCR 	STATUS,5 		//02C2 	1283
		BTSS 	STATUS,0 		//02C3 	1C03
		LJUMP 	2CCH 			//02C4 	3ACC
		LDR 	47H,0 			//02C5 	0847
		BTSS 	STATUS,2 		//02C6 	1D03
		LJUMP 	2CBH 			//02C7 	3ACB

		//;remote-38k-6key-RGB.C: 221: Gq=1;
		CLRR 	47H 			//02C8 	0147
		INCR	47H,1 			//02C9 	09C7

		//;remote-38k-6key-RGB.C: 222: PA5=1;
		BSR 	5H,5 			//02CA 	1A85

		//;remote-38k-6key-RGB.C: 223: }
		//;remote-38k-6key-RGB.C: 225: if(Counter>=B && Bq==0){
		BCR 	STATUS,5 		//02CB 	1283
		LDR 	55H,0 			//02CC 	0855
		XORWI 	80H 			//02CD 	2680
		SUBWI 	80H 			//02CE 	2880
		BTSS 	STATUS,2 		//02CF 	1D03
		LJUMP 	2D3H 			//02D0 	3AD3
		LDR 	54H,0 			//02D1 	0854
		SUBWR 	52H,0 			//02D2 	0C52
		BCR 	STATUS,5 		//02D3 	1283
		BTSS 	STATUS,0 		//02D4 	1C03
		LJUMP 	2DDH 			//02D5 	3ADD
		LDR 	46H,0 			//02D6 	0846
		BTSS 	STATUS,2 		//02D7 	1D03
		LJUMP 	2DCH 			//02D8 	3ADC

		//;remote-38k-6key-RGB.C: 226: Bq=1;
		CLRR 	46H 			//02D9 	0146
		INCR	46H,1 			//02DA 	09C6

		//;remote-38k-6key-RGB.C: 227: PA0=1;
		BSR 	5H,0 			//02DB 	1805

		//;remote-38k-6key-RGB.C: 228: }
		//;remote-38k-6key-RGB.C: 231: }
		//;remote-38k-6key-RGB.C: 239: if(ir_timer){
		BCR 	STATUS,5 		//02DC 	1283
		LDR 	53H,0 			//02DD 	0853
		BTSS 	STATUS,2 		//02DE 	1D03

		//;remote-38k-6key-RGB.C: 240: IRbitTime++;
		INCR	78H,1 			//02DF 	09F8

		//;remote-38k-6key-RGB.C: 245: }
		//;remote-38k-6key-RGB.C: 246: }
		//;remote-38k-6key-RGB.C: 248: if(ir_status != PA3){
		//;remote-38k-6key-RGB.C: 241: if(IRbitTime > 1600)
		LDWI 	0H 			//02E0 	2A00
		BTSC 	5H,3 			//02E1 	1585
		LDWI 	1H 			//02E2 	2A01
		XORWR 	79H,0 			//02E3 	0479
		BTSC 	STATUS,2 		//02E4 	1503
		LJUMP 	31FH 			//02E5 	3B1F

		//;remote-38k-6key-RGB.C: 249: ir_status=PA3;
		LDWI 	0H 			//02E6 	2A00
		BTSC 	5H,3 			//02E7 	1585
		LDWI 	1H 			//02E8 	2A01
		STR 	79H 			//02E9 	01F9

		//;remote-38k-6key-RGB.C: 251: if(ir_status==0){
		LDR 	79H,0 			//02EA 	0879
		BTSS 	STATUS,2 		//02EB 	1D03
		LJUMP 	31FH 			//02EC 	3B1F
		LDWI 	BFH 			//02ED 	2ABF

		//;remote-38k-6key-RGB.C: 253: ir_timer = 1;
		CLRR 	53H 			//02EE 	0153
		INCR	53H,1 			//02EF 	09D3

		//;remote-38k-6key-RGB.C: 255: if(IRbitTime > 190)
		SUBWR 	78H,0 			//02F0 	0C78
		BTSS 	STATUS,0 		//02F1 	1C03
		LJUMP 	2FAH 			//02F2 	3AFA

		//;remote-38k-6key-RGB.C: 256: {
		//;remote-38k-6key-RGB.C: 257: IRDataTimer[0] = 0;
		CLRR 	40H 			//02F3 	0140

		//;remote-38k-6key-RGB.C: 258: IRDataTimer[1] = 0;
		CLRR 	41H 			//02F4 	0141

		//;remote-38k-6key-RGB.C: 259: IRDataTimer[2] = 0;
		CLRR 	42H 			//02F5 	0142

		//;remote-38k-6key-RGB.C: 260: IRDataTimer[3] = 0;
		CLRR 	43H 			//02F6 	0143

		//;remote-38k-6key-RGB.C: 261: IRbitNum = 0;
		CLRR 	45H 			//02F7 	0145

		//;remote-38k-6key-RGB.C: 262: bitdata = 0x00;
		CLRR 	5AH 			//02F8 	015A

		//;remote-38k-6key-RGB.C: 263: }
		LJUMP 	30EH 			//02F9 	3B0E

		//;remote-38k-6key-RGB.C: 264: else if(IRbitTime > 150)
		LDWI 	97H 			//02FA 	2A97
		SUBWR 	78H,0 			//02FB 	0C78
		BTSS 	STATUS,0 		//02FC 	1C03
		LJUMP 	304H 			//02FD 	3B04

		//;remote-38k-6key-RGB.C: 265: {
		//;remote-38k-6key-RGB.C: 266: if(ReceiveFinish==0)repeat=1;
		LDR 	44H,0 			//02FE 	0844
		BTSS 	STATUS,2 		//02FF 	1D03
		LJUMP 	30EH 			//0300 	3B0E
		CLRR 	4FH 			//0301 	014F
		INCR	4FH,1 			//0302 	09CF
		LJUMP 	30EH 			//0303 	3B0E

		//;remote-38k-6key-RGB.C: 268: else if(IRbitTime > 30)
		LDWI 	1FH 			//0304 	2A1F
		SUBWR 	78H,0 			//0305 	0C78
		BTSS 	STATUS,0 		//0306 	1C03
		LJUMP 	30EH 			//0307 	3B0E

		//;remote-38k-6key-RGB.C: 269: {
		//;remote-38k-6key-RGB.C: 270: IRDataTimer[IRbitNum-1] |= bitdata;
		LDR 	45H,0 			//0308 	0845
		ADDWI 	3FH 			//0309 	273F
		STR 	FSR 			//030A 	0184
		LDR 	5AH,0 			//030B 	085A
		BCR 	STATUS,7 		//030C 	1383
		IORWR 	INDF,1 		//030D 	0380

		//;remote-38k-6key-RGB.C: 271: }
		//;remote-38k-6key-RGB.C: 273: IRbitTime = 0;
		CLRR 	78H 			//030E 	0178

		//;remote-38k-6key-RGB.C: 274: bitdata<<=1;
		BCR 	STATUS,0 		//030F 	1003
		RLR 	5AH,1 			//0310 	05DA

		//;remote-38k-6key-RGB.C: 275: if(bitdata == 0)
		LDR 	5AH,0 			//0311 	085A
		BTSS 	STATUS,2 		//0312 	1D03
		LJUMP 	317H 			//0313 	3B17

		//;remote-38k-6key-RGB.C: 276: {
		//;remote-38k-6key-RGB.C: 277: bitdata = 0x01;
		CLRR 	5AH 			//0314 	015A
		INCR	5AH,1 			//0315 	09DA

		//;remote-38k-6key-RGB.C: 278: IRbitNum++;
		INCR	45H,1 			//0316 	09C5

		//;remote-38k-6key-RGB.C: 279: }
		//;remote-38k-6key-RGB.C: 280: if(IRbitNum > 4)
		LDWI 	5H 			//0317 	2A05
		SUBWR 	45H,0 			//0318 	0C45
		BTSS 	STATUS,0 		//0319 	1C03
		LJUMP 	31FH 			//031A 	3B1F

		//;remote-38k-6key-RGB.C: 281: {
		//;remote-38k-6key-RGB.C: 282: IRbitNum = 0;
		CLRR 	45H 			//031B 	0145

		//;remote-38k-6key-RGB.C: 283: ir_timer = 0;
		CLRR 	53H 			//031C 	0153

		//;remote-38k-6key-RGB.C: 284: ReceiveFinish = 1;
		CLRR 	44H 			//031D 	0144
		INCR	44H,1 			//031E 	09C4
		LDR 	72H,0 			//031F 	0872
		STR 	PCLATH 			//0320 	018A
		LDR 	71H,0 			//0321 	0871
		STR 	FSR 			//0322 	0184
		SWAPR 	70H,0 			//0323 	0770
		STR 	STATUS 			//0324 	0183
		SWAPR 	7EH,1 			//0325 	07FE
		SWAPR 	7EH,0 			//0326 	077E
		RETI		 			//0327 	0009
		STR 	75H 			//0328 	01F5
		LDWI 	8H 			//0329 	2A08
		STR 	76H 			//032A 	01F6
		CLRR 	77H 			//032B 	0177
		LDR 	75H,0 			//032C 	0875
		STR 	74H 			//032D 	01F4
		LDWI 	7H 			//032E 	2A07
		BCR 	STATUS,0 		//032F 	1003
		RRR	74H,1 			//0330 	06F4
		ADDWI 	FFH 			//0331 	27FF
		BCR 	STATUS,0 		//0332 	1003
		BTSS 	STATUS,2 		//0333 	1D03
		LJUMP 	330H 			//0334 	3B30
		RLR 	77H,0 			//0335 	0577
		IORWR 	74H,0 			//0336 	0374
		STR 	77H 			//0337 	01F7
		BCR 	STATUS,0 		//0338 	1003
		RLR 	75H,1 			//0339 	05F5
		LDR 	73H,0 			//033A 	0873
		SUBWR 	77H,0 			//033B 	0C77
		BTSS 	STATUS,0 		//033C 	1C03
		LJUMP 	340H 			//033D 	3B40
		LDR 	73H,0 			//033E 	0873
		SUBWR 	77H,1 			//033F 	0CF7
		DECRSZ 	76H,1 		//0340 	0EF6
		LJUMP 	32CH 			//0341 	3B2C
		LDR 	77H,0 			//0342 	0877
		RET		 					//0343 	0004
		STR 	5DH 			//0344 	01DD

		//;remote-38k-6key-RGB.C: 64: unsigned char a,b;
		//;remote-38k-6key-RGB.C: 65: for(a=0;a<Time;a++)
		CLRR 	5EH 			//0345 	015E
		LDR 	5DH,0 			//0346 	085D
		SUBWR 	5EH,0 			//0347 	0C5E
		BTSC 	STATUS,0 		//0348 	1403
		RET		 					//0349 	0004

		//;remote-38k-6key-RGB.C: 66: {
		//;remote-38k-6key-RGB.C: 67: for(b=0;b<10;b++)
		CLRR 	5FH 			//034A 	015F

		//;remote-38k-6key-RGB.C: 68: {
		//;remote-38k-6key-RGB.C: 69: DelayMs(100);
		LDWI 	64H 			//034B 	2A64
		LCALL 	365H 			//034C 	3365
		LDWI 	AH 			//034D 	2A0A
		BCR 	STATUS,5 		//034E 	1283
		INCR	5FH,1 			//034F 	09DF
		SUBWR 	5FH,0 			//0350 	0C5F
		BTSS 	STATUS,0 		//0351 	1C03
		LJUMP 	34BH 			//0352 	3B4B
		INCR	5EH,1 			//0353 	09DE
		LJUMP 	346H 			//0354 	3B46

		//;remote-38k-6key-RGB.C: 302: OSCCON = 0B11110000;
		LDWI 	F0H 			//0355 	2AF0
		BSR 	STATUS,5 		//0356 	1A83
		STR 	FH 			//0357 	018F

		//;remote-38k-6key-RGB.C: 304: INTCON = 0;
		CLRR 	INTCON 			//0358 	010B

		//;remote-38k-6key-RGB.C: 305: OPTION = 0B00001000;
		LDWI 	8H 			//0359 	2A08
		STR 	1H 			//035A 	0181

		//;remote-38k-6key-RGB.C: 307: PORTA = 0B00000000;
		BCR 	STATUS,5 		//035B 	1283
		CLRR 	5H 			//035C 	0105

		//;remote-38k-6key-RGB.C: 308: TRISA = 0B00001010;
		LDWI 	AH 			//035D 	2A0A
		BSR 	STATUS,5 		//035E 	1A83
		STR 	5H 			//035F 	0185

		//;remote-38k-6key-RGB.C: 310: WPUA = 0B00000010;
		LDWI 	2H 			//0360 	2A02
		STR 	15H 			//0361 	0195

		//;remote-38k-6key-RGB.C: 312: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//0362 	1283
		CLRR 	1BH 			//0363 	011B
		RET		 					//0364 	0004
		STR 	75H 			//0365 	01F5

		//;remote-38k-6key-RGB.C: 51: unsigned char a,b;
		//;remote-38k-6key-RGB.C: 52: for(a=0;a<Time;a++)
		CLRR 	76H 			//0366 	0176
		LDR 	75H,0 			//0367 	0875
		SUBWR 	76H,0 			//0368 	0C76
		BTSC 	STATUS,0 		//0369 	1403
		RET		 					//036A 	0004

		//;remote-38k-6key-RGB.C: 53: {
		//;remote-38k-6key-RGB.C: 54: for(b=0;b<5;b++)
		CLRR 	77H 			//036B 	0177

		//;remote-38k-6key-RGB.C: 55: {
		//;remote-38k-6key-RGB.C: 56: DelayUs(98);
		LDWI 	62H 			//036C 	2A62
		LCALL 	381H 			//036D 	3381
		LDWI 	5H 			//036E 	2A05
		INCR	77H,1 			//036F 	09F7
		SUBWR 	77H,0 			//0370 	0C77
		BTSS 	STATUS,0 		//0371 	1C03
		LJUMP 	36CH 			//0372 	3B6C
		INCR	76H,1 			//0373 	09F6
		LJUMP 	367H 			//0374 	3B67

		//;remote-38k-6key-RGB.C: 328: T2CON = 0B00000001;
		LDWI 	1H 			//0375 	2A01
		STR 	12H 			//0376 	0192

		//;remote-38k-6key-RGB.C: 330: TMR2 = 0;
		CLRR 	11H 			//0377 	0111

		//;remote-38k-6key-RGB.C: 331: PR2 = 63;
		LDWI 	3FH 			//0378 	2A3F
		BSR 	STATUS,5 		//0379 	1A83
		STR 	12H 			//037A 	0192

		//;remote-38k-6key-RGB.C: 332: TMR2IF = 0;
		BCR 	STATUS,5 		//037B 	1283
		BCR 	CH,1 			//037C 	108C

		//;remote-38k-6key-RGB.C: 334: TMR2ON = 1;
		BSR 	12H,2 			//037D 	1912

		//;remote-38k-6key-RGB.C: 335: PEIE=1;
		BSR 	INTCON,6 		//037E 	1B0B

		//;remote-38k-6key-RGB.C: 336: GIE = 1;
		BSR 	INTCON,7 		//037F 	1B8B
		RET		 					//0380 	0004
		STR 	73H 			//0381 	01F3

		//;remote-38k-6key-RGB.C: 41: unsigned char a;
		//;remote-38k-6key-RGB.C: 42: for(a=0;a<Time;a++)
		CLRR 	74H 			//0382 	0174
		LDR 	73H,0 			//0383 	0873
		SUBWR 	74H,0 			//0384 	0C74
		BTSC 	STATUS,0 		//0385 	1403
		RET		 					//0386 	0004

		//;remote-38k-6key-RGB.C: 43: {
		//;remote-38k-6key-RGB.C: 44: __nop();
		NOP		 					//0387 	0000
		INCR	74H,1 			//0388 	09F4
		LJUMP 	383H 			//0389 	3B83
		CLRWDT	 			//038A 	0001
		CLRR 	INDF 			//038B 	0100
		INCR	FSR,1 			//038C 	0984
		XORWR 	FSR,0 			//038D 	0404
		BTSC 	STATUS,2 		//038E 	1503
		RETW 	0H 			//038F 	2100
		XORWR 	FSR,0 			//0390 	0404
		LJUMP 	38BH 			//0391 	3B8B
			END
