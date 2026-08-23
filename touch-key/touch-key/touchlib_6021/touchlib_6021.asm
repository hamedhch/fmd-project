//Deviec:FT62F21X
//-----------------------Variable---------------------------------
		_PA4		EQU		05H
		_PAIF		EQU		0BH
		_T0IF		EQU		0BH
		_PAIE		EQU		0BH
		_T0IE		EQU		0BH
		_GIE		EQU		0BH
		_TRISA0		EQU		85H
		_TRISA1		EQU		85H
		_TRISA2		EQU		85H
		_TRISA3		EQU		85H
		_TKEN		EQU		86H
		_TKCHGS0		EQU		86H
		_TKCHGS1		EQU		86H
		_LVDEN		EQU		8EH
		_IOCA2		EQU		96H
		_GKeyValue		EQU		69H
		_Last		EQU		68H
		_Lern		EQU		67H
		_State		EQU		66H
		_i		EQU		65H
		_Effect		EQU		64H
		_Flag		EQU		63H
		_Time		EQU		62H
		_CountTrig		EQU		61H
		_Lock		EQU		60H
		_StartTouchTime		EQU		57H
		_topTouchTime		EQU		55H
		_CountKey		EQU		53H
		_awaken		EQU		7AH
		_KeyDv		EQU		5FH
		_charcap		EQU		43H
		_EqudataC		EQU		4BH
		_EquDV		EQU		5EH
		_delta_temp		EQU		5DH
		_DebounceActive		EQU		5CH
		_Touch_Number		EQU		51H
		_UpdataTime		EQU		5BH
		_thedeathcount		EQU		4FH
		_Touch_C0		EQU		40H
		_Touch_C1		EQU		41H
		_Touch_Buff		EQU		40H
		_NowKey		EQU		7BH
		_NowKeyCount		EQU		5AH
		_DebounceActiveBuff		EQU		59H
		_KEY_FLAG		EQU		42H
		_Keypress		EQU		42H
		_PowerOnD		EQU		42H
		_Level		EQU		42H
		_keyflag		EQU		42H
		_one		EQU		42H
		_KeyOn		EQU		42H
		_KeyOff		EQU		42H
//		Touch_init@x		EQU		79H
//		TouchKeyScan@charcapBuff		EQU		6DH
//		ReadCap4@charcapBuff		EQU		76H
//		ReadCap4@Count		EQU		78H
//		DelayUs2@a		EQU		72H
//		DelayMs@a		EQU		78H
//		DelayMs@Time		EQU		76H
//		Delay_Us@a		EQU		74H
//		Delay_Us@Time		EQU		72H
//-----------------------Variable END---------------------------------

		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	2A5H 			//0009 	3AA5
		LJUMP 	0BH 			//000A 	380B
		LDWI 	43H 			//000B 	2A43
		CLRR 	7AH 			//000C 	017A
		CLRR 	7BH 			//000D 	017B
		BCR 	STATUS,7 		//000E 	1383
		STR 	FSR 			//000F 	0184
		LDWI 	6AH 			//0010 	2A6A
		LCALL 	357H 			//0011 	3357
		CLRR 	STATUS 			//0012 	0103
		LJUMP 	14H 			//0013 	3814

		//;main.c: 152: TRISA = 0B00000000;
		BSR 	STATUS,5 		//0014 	1A83
		CLRR 	5H 			//0015 	0105

		//;main.c: 153: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0016 	1283
		CLRR 	5H 			//0017 	0105

		//;main.c: 155: PA4=1;__nop();;
		BSR 	5H,4 			//0018 	1A05
		NOP		 					//0019 	0000

		//;main.c: 157: SYS_INITIAL();
		LCALL 	2EAH 			//001A 	32EA

		//;main.c: 160: TIMER0_INITIAL();
		LCALL 	36EH 			//001B 	336E

		//;main.c: 161: Touch_init();
		LCALL 	305H 			//001C 	3305

		//;main.c: 166: {
		//;main.c: 167: Delay_Us(10);
		LDWI 	AH 			//001D 	2A0A
		STR 	72H 			//001E 	01F2
		CLRR 	73H 			//001F 	0173
		LCALL 	32CH 			//0020 	332C

		//;main.c: 171: if(topTouchTime > 10000 && Lern==0 && Last!=0){
		LDWI 	27H 			//0021 	2A27
		BCR 	STATUS,5 		//0022 	1283
		SUBWR 	56H,0 			//0023 	0C56
		LDWI 	11H 			//0024 	2A11
		BTSC 	STATUS,2 		//0025 	1503
		SUBWR 	55H,0 			//0026 	0C55
		BTSS 	STATUS,0 		//0027 	1C03
		LJUMP 	4EH 			//0028 	384E
		LDR 	67H,0 			//0029 	0867
		BTSS 	STATUS,2 		//002A 	1D03
		LJUMP 	4EH 			//002B 	384E
		LDR 	68H,0 			//002C 	0868
		BTSC 	STATUS,2 		//002D 	1503
		LJUMP 	4EH 			//002E 	384E

		//;main.c: 174: PA4=0;__nop();;
		BCR 	5H,4 			//002F 	1205
		NOP		 					//0030 	0000

		//;main.c: 175: DelayMs(1);
		CLRR 	76H 			//0031 	0176
		INCR	76H,1 			//0032 	09F6
		CLRR 	77H 			//0033 	0177
		LCALL 	319H 			//0034 	3319

		//;main.c: 176: PA4=1;__nop();;
		BCR 	STATUS,5 		//0035 	1283
		BSR 	5H,4 			//0036 	1A05
		NOP		 					//0037 	0000

		//;main.c: 177: DelayMs(1);
		CLRR 	76H 			//0038 	0176
		INCR	76H,1 			//0039 	09F6
		CLRR 	77H 			//003A 	0177
		LCALL 	319H 			//003B 	3319

		//;main.c: 179: PA4=0;__nop();;
		BCR 	STATUS,5 		//003C 	1283
		BCR 	5H,4 			//003D 	1205
		NOP		 					//003E 	0000

		//;main.c: 180: DelayMs(6);
		LDWI 	6H 			//003F 	2A06
		STR 	76H 			//0040 	01F6
		CLRR 	77H 			//0041 	0177
		LCALL 	319H 			//0042 	3319

		//;main.c: 181: PA4=1;__nop();;
		BCR 	STATUS,5 		//0043 	1283
		BSR 	5H,4 			//0044 	1A05
		NOP		 					//0045 	0000

		//;main.c: 183: DelayMs(20);
		LDWI 	14H 			//0046 	2A14
		STR 	76H 			//0047 	01F6
		CLRR 	77H 			//0048 	0177
		LCALL 	319H 			//0049 	3319

		//;main.c: 185: Lern=1;
		LDWI 	1H 			//004A 	2A01
		BCR 	STATUS,5 		//004B 	1283
		STR 	67H 			//004C 	01E7

		//;main.c: 186: Last=0;
		CLRR 	68H 			//004D 	0168

		//;main.c: 188: }
		//;main.c: 196: if(StartTouchTime >= (2500/12/4))
		LDWI 	0H 			//004E 	2A00
		SUBWR 	58H,0 			//004F 	0C58
		LDWI 	34H 			//0050 	2A34
		BTSC 	STATUS,2 		//0051 	1503
		SUBWR 	57H,0 			//0052 	0C57
		BTSS 	STATUS,0 		//0053 	1C03
		LJUMP 	59H 			//0054 	3859

		//;main.c: 197: {
		//;main.c: 198: StartTouchTime = 0;
		CLRR 	57H 			//0055 	0157
		CLRR 	58H 			//0056 	0158

		//;main.c: 199: GKeyValue = TouchKeyScan();
		LCALL 	14CH 			//0057 	314C
		STR 	69H 			//0058 	01E9

		//;main.c: 201: }
		//;main.c: 203: if(GKeyValue!=0 )
		LDR 	69H,0 			//0059 	0869
		BTSC 	STATUS,2 		//005A 	1503
		LJUMP 	130H 			//005B 	3930

		//;main.c: 204: {
		//;main.c: 206: if(GKeyValue==8)
		LDWI 	8H 			//005C 	2A08
		XORWR 	69H,0 			//005D 	0469
		BTSS 	STATUS,2 		//005E 	1D03
		LJUMP 	8AH 			//005F 	388A

		//;main.c: 207: {
		//;main.c: 208: if(CountKey<5)
		LDWI 	0H 			//0060 	2A00
		SUBWR 	54H,0 			//0061 	0C54
		LDWI 	5H 			//0062 	2A05
		BTSC 	STATUS,2 		//0063 	1503
		SUBWR 	53H,0 			//0064 	0C53
		BTSC 	STATUS,0 		//0065 	1403
		LJUMP 	8AH 			//0066 	388A

		//;main.c: 209: {
		//;main.c: 211: CountKey++;
		//;main.c: 212: topTouchTime=0;
		//;main.c: 214: if(CountKey>2)
		LCALL 	144H 			//0067 	3144
		BTSC 	STATUS,2 		//0068 	1503
		SUBWR 	53H,0 			//0069 	0C53
		BTSS 	STATUS,0 		//006A 	1C03
		LJUMP 	8AH 			//006B 	388A

		//;main.c: 215: {
		//;main.c: 216: CountKey=6;
		LDWI 	6H 			//006C 	2A06
		STR 	53H 			//006D 	01D3
		CLRR 	54H 			//006E 	0154

		//;main.c: 217: PA4=0;__nop();;
		BCR 	5H,4 			//006F 	1205
		NOP		 					//0070 	0000

		//;main.c: 218: DelayMs(1);
		CLRR 	76H 			//0071 	0176
		INCR	76H,1 			//0072 	09F6
		CLRR 	77H 			//0073 	0177
		LCALL 	319H 			//0074 	3319

		//;main.c: 220: PA4=1;__nop();;
		BCR 	STATUS,5 		//0075 	1283
		BSR 	5H,4 			//0076 	1A05
		NOP		 					//0077 	0000

		//;main.c: 221: DelayMs(1);
		CLRR 	76H 			//0078 	0176
		INCR	76H,1 			//0079 	09F6
		CLRR 	77H 			//007A 	0177
		LCALL 	319H 			//007B 	3319

		//;main.c: 223: PA4=0;__nop();;
		BCR 	STATUS,5 		//007C 	1283
		BCR 	5H,4 			//007D 	1205
		NOP		 					//007E 	0000

		//;main.c: 224: DelayMs(1);
		CLRR 	76H 			//007F 	0176
		INCR	76H,1 			//0080 	09F6
		CLRR 	77H 			//0081 	0177
		LCALL 	319H 			//0082 	3319

		//;main.c: 225: PA4=1;__nop();;
		BCR 	STATUS,5 		//0083 	1283
		BSR 	5H,4 			//0084 	1A05
		NOP		 					//0085 	0000

		//;main.c: 227: DelayMs(10);
		LDWI 	AH 			//0086 	2A0A
		STR 	76H 			//0087 	01F6
		CLRR 	77H 			//0088 	0177
		LCALL 	319H 			//0089 	3319

		//;main.c: 229: }
		//;main.c: 230: }
		//;main.c: 231: }
		//;main.c: 233: if(GKeyValue==1)
		BCR 	STATUS,5 		//008A 	1283
		DECRSZ 	69H,0 		//008B 	0E69
		LJUMP 	B7H 			//008C 	38B7

		//;main.c: 234: {
		//;main.c: 235: if(CountKey<5)
		LDWI 	0H 			//008D 	2A00
		SUBWR 	54H,0 			//008E 	0C54
		LDWI 	5H 			//008F 	2A05
		BTSC 	STATUS,2 		//0090 	1503
		SUBWR 	53H,0 			//0091 	0C53
		BTSC 	STATUS,0 		//0092 	1403
		LJUMP 	B7H 			//0093 	38B7

		//;main.c: 236: {
		//;main.c: 237: CountKey++;
		//;main.c: 238: topTouchTime=0;
		//;main.c: 240: if(CountKey>2)
		LCALL 	144H 			//0094 	3144
		BTSC 	STATUS,2 		//0095 	1503
		SUBWR 	53H,0 			//0096 	0C53
		BTSS 	STATUS,0 		//0097 	1C03
		LJUMP 	B7H 			//0098 	38B7

		//;main.c: 241: {
		//;main.c: 242: CountKey=6;
		LDWI 	6H 			//0099 	2A06
		STR 	53H 			//009A 	01D3
		CLRR 	54H 			//009B 	0154

		//;main.c: 244: PA4=0;__nop();;
		BCR 	5H,4 			//009C 	1205
		NOP		 					//009D 	0000

		//;main.c: 245: DelayMs(1);
		CLRR 	76H 			//009E 	0176
		INCR	76H,1 			//009F 	09F6
		CLRR 	77H 			//00A0 	0177
		LCALL 	319H 			//00A1 	3319

		//;main.c: 247: PA4=1;__nop();;
		BCR 	STATUS,5 		//00A2 	1283
		BSR 	5H,4 			//00A3 	1A05
		NOP		 					//00A4 	0000

		//;main.c: 248: DelayMs(1);
		CLRR 	76H 			//00A5 	0176
		INCR	76H,1 			//00A6 	09F6
		CLRR 	77H 			//00A7 	0177
		LCALL 	319H 			//00A8 	3319

		//;main.c: 250: PA4=0;__nop();;
		BCR 	STATUS,5 		//00A9 	1283
		BCR 	5H,4 			//00AA 	1205
		NOP		 					//00AB 	0000

		//;main.c: 251: DelayMs(2);
		LDWI 	2H 			//00AC 	2A02
		STR 	76H 			//00AD 	01F6
		CLRR 	77H 			//00AE 	0177
		LCALL 	319H 			//00AF 	3319

		//;main.c: 252: PA4=1;__nop();;
		BCR 	STATUS,5 		//00B0 	1283
		BSR 	5H,4 			//00B1 	1A05
		NOP		 					//00B2 	0000

		//;main.c: 254: DelayMs(10);
		LDWI 	AH 			//00B3 	2A0A
		STR 	76H 			//00B4 	01F6
		CLRR 	77H 			//00B5 	0177
		LCALL 	319H 			//00B6 	3319

		//;main.c: 256: }
		//;main.c: 257: }
		//;main.c: 258: }
		//;main.c: 260: if(GKeyValue==2)
		LDWI 	2H 			//00B7 	2A02
		BCR 	STATUS,5 		//00B8 	1283
		XORWR 	69H,0 			//00B9 	0469
		BTSS 	STATUS,2 		//00BA 	1D03
		LJUMP 	E6H 			//00BB 	38E6

		//;main.c: 261: {
		//;main.c: 262: if(CountKey<5)
		LDWI 	0H 			//00BC 	2A00
		SUBWR 	54H,0 			//00BD 	0C54
		LDWI 	5H 			//00BE 	2A05
		BTSC 	STATUS,2 		//00BF 	1503
		SUBWR 	53H,0 			//00C0 	0C53
		BTSC 	STATUS,0 		//00C1 	1403
		LJUMP 	E6H 			//00C2 	38E6

		//;main.c: 263: {
		//;main.c: 264: CountKey++;
		//;main.c: 265: topTouchTime=0;
		//;main.c: 267: if(CountKey>2)
		LCALL 	144H 			//00C3 	3144
		BTSC 	STATUS,2 		//00C4 	1503
		SUBWR 	53H,0 			//00C5 	0C53
		BTSS 	STATUS,0 		//00C6 	1C03
		LJUMP 	E6H 			//00C7 	38E6

		//;main.c: 268: {
		//;main.c: 269: CountKey=6;
		LDWI 	6H 			//00C8 	2A06
		STR 	53H 			//00C9 	01D3
		CLRR 	54H 			//00CA 	0154

		//;main.c: 271: PA4=0;__nop();;
		BCR 	5H,4 			//00CB 	1205
		NOP		 					//00CC 	0000

		//;main.c: 272: DelayMs(1);
		CLRR 	76H 			//00CD 	0176
		INCR	76H,1 			//00CE 	09F6
		CLRR 	77H 			//00CF 	0177
		LCALL 	319H 			//00D0 	3319

		//;main.c: 274: PA4=1;__nop();;
		BCR 	STATUS,5 		//00D1 	1283
		BSR 	5H,4 			//00D2 	1A05
		NOP		 					//00D3 	0000

		//;main.c: 275: DelayMs(1);
		CLRR 	76H 			//00D4 	0176
		INCR	76H,1 			//00D5 	09F6
		CLRR 	77H 			//00D6 	0177
		LCALL 	319H 			//00D7 	3319

		//;main.c: 277: PA4=0;__nop();;
		BCR 	STATUS,5 		//00D8 	1283
		BCR 	5H,4 			//00D9 	1205
		NOP		 					//00DA 	0000

		//;main.c: 278: DelayMs(3);
		LDWI 	3H 			//00DB 	2A03
		STR 	76H 			//00DC 	01F6
		CLRR 	77H 			//00DD 	0177
		LCALL 	319H 			//00DE 	3319

		//;main.c: 279: PA4=1;__nop();;
		BCR 	STATUS,5 		//00DF 	1283
		BSR 	5H,4 			//00E0 	1A05
		NOP		 					//00E1 	0000

		//;main.c: 281: DelayMs(10);
		LDWI 	AH 			//00E2 	2A0A
		STR 	76H 			//00E3 	01F6
		CLRR 	77H 			//00E4 	0177
		LCALL 	319H 			//00E5 	3319

		//;main.c: 283: }
		//;main.c: 284: }
		//;main.c: 285: }
		//;main.c: 288: if(GKeyValue==4)
		LDWI 	4H 			//00E6 	2A04
		BCR 	STATUS,5 		//00E7 	1283
		XORWR 	69H,0 			//00E8 	0469
		BTSS 	STATUS,2 		//00E9 	1D03
		LJUMP 	115H 			//00EA 	3915

		//;main.c: 289: {
		//;main.c: 290: if(CountKey<5)
		LDWI 	0H 			//00EB 	2A00
		SUBWR 	54H,0 			//00EC 	0C54
		LDWI 	5H 			//00ED 	2A05
		BTSC 	STATUS,2 		//00EE 	1503
		SUBWR 	53H,0 			//00EF 	0C53
		BTSC 	STATUS,0 		//00F0 	1403
		LJUMP 	115H 			//00F1 	3915

		//;main.c: 291: {
		//;main.c: 292: CountKey++;
		//;main.c: 293: topTouchTime=0;
		//;main.c: 295: if(CountKey>2)
		LCALL 	144H 			//00F2 	3144
		BTSC 	STATUS,2 		//00F3 	1503
		SUBWR 	53H,0 			//00F4 	0C53
		BTSS 	STATUS,0 		//00F5 	1C03
		LJUMP 	115H 			//00F6 	3915

		//;main.c: 296: {
		//;main.c: 297: CountKey=6;
		LDWI 	6H 			//00F7 	2A06
		STR 	53H 			//00F8 	01D3
		CLRR 	54H 			//00F9 	0154

		//;main.c: 299: PA4=0;__nop();;
		BCR 	5H,4 			//00FA 	1205
		NOP		 					//00FB 	0000

		//;main.c: 300: DelayMs(1);
		CLRR 	76H 			//00FC 	0176
		INCR	76H,1 			//00FD 	09F6
		CLRR 	77H 			//00FE 	0177
		LCALL 	319H 			//00FF 	3319

		//;main.c: 302: PA4=1;__nop();;
		BCR 	STATUS,5 		//0100 	1283
		BSR 	5H,4 			//0101 	1A05
		NOP		 					//0102 	0000

		//;main.c: 303: DelayMs(1);
		CLRR 	76H 			//0103 	0176
		INCR	76H,1 			//0104 	09F6
		CLRR 	77H 			//0105 	0177
		LCALL 	319H 			//0106 	3319

		//;main.c: 305: PA4=0;__nop();;
		BCR 	STATUS,5 		//0107 	1283
		BCR 	5H,4 			//0108 	1205
		NOP		 					//0109 	0000

		//;main.c: 306: DelayMs(4);
		LDWI 	4H 			//010A 	2A04
		STR 	76H 			//010B 	01F6
		CLRR 	77H 			//010C 	0177
		LCALL 	319H 			//010D 	3319

		//;main.c: 307: PA4=1;__nop();;
		BCR 	STATUS,5 		//010E 	1283
		BSR 	5H,4 			//010F 	1A05
		NOP		 					//0110 	0000

		//;main.c: 309: DelayMs(10);
		LDWI 	AH 			//0111 	2A0A
		STR 	76H 			//0112 	01F6
		CLRR 	77H 			//0113 	0177
		LCALL 	319H 			//0114 	3319

		//;main.c: 314: }
		//;main.c: 315: }
		//;main.c: 316: }
		//;main.c: 324: if(Last!=GKeyValue)
		BCR 	STATUS,5 		//0115 	1283
		LDR 	68H,0 			//0116 	0868
		XORWR 	69H,0 			//0117 	0469
		BTSC 	STATUS,2 		//0118 	1503
		LJUMP 	12CH 			//0119 	392C

		//;main.c: 325: {
		//;main.c: 326: if(GKeyValue==1)
		DECRSZ 	69H,0 		//011A 	0E69
		LJUMP 	11DH 			//011B 	391D

		//;main.c: 327: {
		//;main.c: 328: __nop();
		NOP		 					//011C 	0000

		//;main.c: 330: }
		//;main.c: 331: if(GKeyValue==2)
		LDWI 	2H 			//011D 	2A02
		BCR 	STATUS,5 		//011E 	1283
		XORWR 	69H,0 			//011F 	0469
		BTSC 	STATUS,2 		//0120 	1503

		//;main.c: 332: {
		//;main.c: 333: __nop();
		NOP		 					//0121 	0000

		//;main.c: 335: }
		//;main.c: 336: if(GKeyValue==4)
		LDWI 	4H 			//0122 	2A04
		BCR 	STATUS,5 		//0123 	1283
		XORWR 	69H,0 			//0124 	0469
		BTSC 	STATUS,2 		//0125 	1503

		//;main.c: 337: {
		//;main.c: 338: __nop();
		NOP		 					//0126 	0000

		//;main.c: 340: }
		//;main.c: 341: if(GKeyValue==8)
		LDWI 	8H 			//0127 	2A08
		BCR 	STATUS,5 		//0128 	1283
		XORWR 	69H,0 			//0129 	0469
		BTSC 	STATUS,2 		//012A 	1503

		//;main.c: 342: {
		//;main.c: 343: __nop();
		NOP		 					//012B 	0000

		//;main.c: 345: }
		//;main.c: 346: }
		//;main.c: 349: Last=GKeyValue;
		BCR 	STATUS,5 		//012C 	1283
		LDR 	69H,0 			//012D 	0869
		STR 	68H 			//012E 	01E8

		//;main.c: 351: }
		LJUMP 	1DH 			//012F 	381D

		//;main.c: 352: else
		//;main.c: 353: {
		//;main.c: 355: if(CountKey>5 & CountKey<20000)
		LDWI 	0H 			//0130 	2A00
		SUBWR 	54H,0 			//0131 	0C54
		LDWI 	6H 			//0132 	2A06
		BTSC 	STATUS,2 		//0133 	1503
		SUBWR 	53H,0 			//0134 	0C53
		BTSS 	STATUS,0 		//0135 	1C03
		LJUMP 	141H 			//0136 	3941
		LDWI 	4EH 			//0137 	2A4E
		SUBWR 	54H,0 			//0138 	0C54
		LDWI 	20H 			//0139 	2A20
		BTSC 	STATUS,2 		//013A 	1503
		SUBWR 	53H,0 			//013B 	0C53
		BTSC 	STATUS,0 		//013C 	1403
		LJUMP 	141H 			//013D 	3941

		//;main.c: 356: {
		//;main.c: 357: Lern=0;
		CLRR 	67H 			//013E 	0167

		//;main.c: 358: Last=0;
		CLRR 	68H 			//013F 	0168

		//;main.c: 359: GKeyValue=0;
		CLRR 	69H 			//0140 	0169

		//;main.c: 360: }
		//;main.c: 361: CountKey=0;
		CLRR 	53H 			//0141 	0153
		CLRR 	54H 			//0142 	0154
		LJUMP 	1DH 			//0143 	381D
		INCR	53H,1 			//0144 	09D3
		BTSC 	STATUS,2 		//0145 	1503
		INCR	54H,1 			//0146 	09D4
		CLRR 	55H 			//0147 	0155
		CLRR 	56H 			//0148 	0156
		LDWI 	0H 			//0149 	2A00
		SUBWR 	54H,0 			//014A 	0C54
		RETW 	3H 			//014B 	2103
		INCR	7BH,0 			//014C 	097B
		STR 	6AH 			//014D 	01EA
		LDWI 	FH 			//014E 	2A0F
		STR 	6BH 			//014F 	01EB
		LDWI 	0H 			//0150 	2A00
		STR 	6CH 			//0151 	01EC
		LJUMP 	156H 			//0152 	3956
		RLR 	6CH,0 			//0153 	056C
		RRR	6CH,1 			//0154 	06EC
		RRR	6BH,1 			//0155 	06EB
		DECRSZ 	6AH,1 		//0156 	0EEA
		LJUMP 	153H 			//0157 	3953
		BCR 	STATUS,5 		//0158 	1283
		BTSC 	6BH,0 			//0159 	146B
		LJUMP 	162H 			//015A 	3962
		LDWI 	5H 			//015B 	2A05
		INCR	7BH,1 			//015C 	09FB
		SUBWR 	7BH,0 			//015D 	0C7B
		BTSS 	STATUS,0 		//015E 	1C03
		LJUMP 	14CH 			//015F 	394C
		CLRR 	7BH 			//0160 	017B
		LJUMP 	14CH 			//0161 	394C
		BCR 	STATUS,0 		//0162 	1003
		LCALL 	273H 			//0163 	3273
		LDR 	INDF,0 			//0164 	0800
		STR 	6DH 			//0165 	01ED
		INCR	FSR,1 			//0166 	0984
		LDR 	INDF,0 			//0167 	0800
		STR 	6EH 			//0168 	01EE
		BTSS 	7AH,0 			//0169 	1C7A
		LJUMP 	16DH 			//016A 	396D
		LCALL 	27DH 			//016B 	327D
		LJUMP 	16EH 			//016C 	396E
		LCALL 	2CBH 			//016D 	32CB
		CLRR 	5FH 			//016E 	015F
		LDR 	6EH,0 			//016F 	086E
		SUBWR 	52H,0 			//0170 	0C52
		BTSS 	STATUS,2 		//0171 	1D03
		LJUMP 	175H 			//0172 	3975
		LDR 	6DH,0 			//0173 	086D
		SUBWR 	51H,0 			//0174 	0C51
		BTSC 	STATUS,0 		//0175 	1403
		LJUMP 	18BH 			//0176 	398B
		LDR 	51H,0 			//0177 	0851
		SUBWR 	6DH,0 			//0178 	0C6D
		STR 	6AH 			//0179 	01EA
		LDR 	52H,0 			//017A 	0852
		BTSS 	STATUS,0 		//017B 	1C03
		INCR	52H,0 			//017C 	0952
		SUBWR 	6EH,0 			//017D 	0C6E
		STR 	6BH 			//017E 	01EB
		LDWI 	1H 			//017F 	2A01
		SUBWR 	6BH,0 			//0180 	0C6B
		LDWI 	0H 			//0181 	2A00
		BTSC 	STATUS,2 		//0182 	1503
		SUBWR 	6AH,0 			//0183 	0C6A
		BTSS 	STATUS,0 		//0184 	1C03
		LJUMP 	188H 			//0185 	3988
		LDWI 	FFH 			//0186 	2AFF
		LJUMP 	18AH 			//0187 	398A
		LDR 	51H,0 			//0188 	0851
		SUBWR 	6DH,0 			//0189 	0C6D
		STR 	5FH 			//018A 	01DF
		BCR 	42H,6 			//018B 	1342
		BCR 	42H,7 			//018C 	13C2
		LDR 	7BH,0 			//018D 	087B
		ADDWI 	1H 			//018E 	2701
		STR 	FSR 			//018F 	0184
		LCALL 	33CH 			//0190 	333C
		STR 	6AH 			//0191 	01EA
		LDR 	5FH,0 			//0192 	085F
		SUBWR 	6AH,0 			//0193 	0C6A
		BTSC 	STATUS,0 		//0194 	1403
		BSR 	42H,7 			//0195 	1BC2
		LDR 	7BH,0 			//0196 	087B
		ADDWI 	5H 			//0197 	2705
		STR 	FSR 			//0198 	0184
		LCALL 	33CH 			//0199 	333C
		STR 	6AH 			//019A 	01EA
		LDR 	5FH,0 			//019B 	085F
		SUBWR 	6AH,0 			//019C 	0C6A
		BTSS 	STATUS,0 		//019D 	1C03
		BSR 	42H,6 			//019E 	1B42
		LDR 	5CH,0 			//019F 	085C
		STR 	6AH 			//01A0 	01EA
		INCR	7BH,0 			//01A1 	097B
		LJUMP 	1A5H 			//01A2 	39A5
		BCR 	STATUS,0 		//01A3 	1003
		RRR	6AH,1 			//01A4 	06EA
		ADDWI 	FFH 			//01A5 	27FF
		BTSS 	STATUS,2 		//01A6 	1D03
		LJUMP 	1A3H 			//01A7 	39A3
		BTSS 	6AH,0 			//01A8 	1C6A
		LJUMP 	1B9H 			//01A9 	39B9
		BTSS 	42H,7 			//01AA 	1FC2
		LJUMP 	1CDH 			//01AB 	39CD
		LDWI 	1H 			//01AC 	2A01
		STR 	6AH 			//01AD 	01EA
		INCR	7BH,0 			//01AE 	097B
		LJUMP 	1B2H 			//01AF 	39B2
		BCR 	STATUS,0 		//01B0 	1003
		RLR 	6AH,1 			//01B1 	05EA
		ADDWI 	FFH 			//01B2 	27FF
		BTSS 	STATUS,2 		//01B3 	1D03
		LJUMP 	1B0H 			//01B4 	39B0
		LDR 	6AH,0 			//01B5 	086A
		XORWI 	FFH 			//01B6 	26FF
		ANDWR 	5CH,1 			//01B7 	02DC
		LJUMP 	1CDH 			//01B8 	39CD
		LDR 	7BH,0 			//01B9 	087B
		ADDWI 	5H 			//01BA 	2705
		STR 	FSR 			//01BB 	0184
		LCALL 	33CH 			//01BC 	333C
		SUBWR 	5FH,0 			//01BD 	0C5F
		BTSC 	STATUS,0 		//01BE 	1403
		BCR 	7AH,0 			//01BF 	107A
		BTSS 	42H,6 			//01C0 	1F42
		LJUMP 	1CDH 			//01C1 	39CD
		LDWI 	1H 			//01C2 	2A01
		STR 	6AH 			//01C3 	01EA
		INCR	7BH,0 			//01C4 	097B
		LJUMP 	1C8H 			//01C5 	39C8
		BCR 	STATUS,0 		//01C6 	1003
		RLR 	6AH,1 			//01C7 	05EA
		ADDWI 	FFH 			//01C8 	27FF
		BTSS 	STATUS,2 		//01C9 	1D03
		LJUMP 	1C6H 			//01CA 	39C6
		LDR 	6AH,0 			//01CB 	086A
		IORWR 	5CH,1 			//01CC 	03DC
		BTSC 	7AH,0 			//01CD 	147A
		LJUMP 	230H 			//01CE 	3A30
		BTSS 	42H,1 			//01CF 	1CC2
		LJUMP 	1D2H 			//01D0 	39D2
		LCALL 	34AH 			//01D1 	334A
		LDR 	5CH,0 			//01D2 	085C
		BTSS 	STATUS,2 		//01D3 	1D03
		LJUMP 	226H 			//01D4 	3A26
		BCR 	STATUS,0 		//01D5 	1003
		LCALL 	273H 			//01D6 	3273
		LCALL 	267H 			//01D7 	3267
		BTSC 	STATUS,0 		//01D8 	1403
		LJUMP 	1DEH 			//01D9 	39DE
		LCALL 	278H 			//01DA 	3278
		LDR 	INDF,0 			//01DB 	0800
		SUBWR 	51H,0 			//01DC 	0C51
		STR 	5EH 			//01DD 	01DE
		LDR 	7BH,0 			//01DE 	087B
		ADDWI 	5H 			//01DF 	2705
		STR 	FSR 			//01E0 	0184
		LCALL 	33CH 			//01E1 	333C
		STR 	6AH 			//01E2 	01EA
		BCR 	STATUS,0 		//01E3 	1003
		RRR	6AH,0 			//01E4 	066A
		SUBWR 	5EH,0 			//01E5 	0C5E
		LDR 	5AH,0 			//01E6 	085A
		BTSS 	STATUS,0 		//01E7 	1C03
		LJUMP 	1F9H 			//01E8 	39F9
		ADDWI 	4BH 			//01E9 	274B
		STR 	FSR 			//01EA 	0184
		INCR	INDF,1 			//01EB 	0980
		LDR 	5AH,0 			//01EC 	085A
		ADDWI 	4BH 			//01ED 	274B
		STR 	FSR 			//01EE 	0184
		LDWI 	6H 			//01EF 	2A06
		SUBWR 	INDF,0 		//01F0 	0C00
		BTSS 	STATUS,0 		//01F1 	1C03
		LJUMP 	1FCH 			//01F2 	39FC
		LCALL 	351H 			//01F3 	3351
		STR 	INDF 			//01F4 	0180
		INCR	FSR,1 			//01F5 	0984
		LDR 	52H,0 			//01F6 	0852
		STR 	INDF 			//01F7 	0180
		LDR 	5AH,0 			//01F8 	085A
		ADDWI 	4BH 			//01F9 	274B
		STR 	FSR 			//01FA 	0184
		CLRR 	INDF 			//01FB 	0100
		LDWI 	3H 			//01FC 	2A03
		CLRR 	4FH 			//01FD 	014F
		CLRR 	50H 			//01FE 	0150
		XORWR 	5BH,0 			//01FF 	045B
		BTSS 	STATUS,2 		//0200 	1D03
		LJUMP 	24AH 			//0201 	3A4A
		LCALL 	278H 			//0202 	3278
		LCALL 	267H 			//0203 	3267
		BTSC 	STATUS,0 		//0204 	1403
		LJUMP 	210H 			//0205 	3A10
		BCR 	STATUS,0 		//0206 	1003
		RLR 	5AH,0 			//0207 	055A
		ADDWI 	43H 			//0208 	2743
		STR 	FSR 			//0209 	0184
		LDWI 	1H 			//020A 	2A01
		ADDWR 	INDF,1 		//020B 	0B80
		INCR	FSR,1 			//020C 	0984
		BTSC 	STATUS,0 		//020D 	1403
		INCR	INDF,1 			//020E 	0980
		LJUMP 	24AH 			//020F 	3A4A
		LCALL 	278H 			//0210 	3278
		LDR 	INDF,0 			//0211 	0800
		STR 	6AH 			//0212 	01EA
		INCR	FSR,1 			//0213 	0984
		LDR 	INDF,0 			//0214 	0800
		STR 	6BH 			//0215 	01EB
		IORWR 	6AH,0 			//0216 	036A
		BTSC 	STATUS,2 		//0217 	1503
		LJUMP 	24AH 			//0218 	3A4A
		BCR 	STATUS,0 		//0219 	1003
		RLR 	5AH,0 			//021A 	055A
		ADDWI 	43H 			//021B 	2743
		STR 	FSR 			//021C 	0184
		LDWI 	1H 			//021D 	2A01
		SUBWR 	INDF,1 		//021E 	0C80
		INCRSZ 	FSR,1 		//021F 	0A84
		LDWI 	0H 			//0220 	2A00
		BTSS 	STATUS,0 		//0221 	1C03
		DECR 	INDF,1 			//0222 	0D80
		SUBWR 	INDF,1 		//0223 	0C80
		DECR 	FSR,1 			//0224 	0D84
		LJUMP 	24AH 			//0225 	3A4A
		LDWI 	0H 			//0226 	2A00
		CLRR 	5BH 			//0227 	015B
		SUBWR 	50H,0 			//0228 	0C50
		LDWI 	30H 			//0229 	2A30
		BTSC 	STATUS,2 		//022A 	1503
		SUBWR 	4FH,0 			//022B 	0C4F
		BTSS 	STATUS,0 		//022C 	1C03
		LJUMP 	24AH 			//022D 	3A4A
		LCALL 	34AH 			//022E 	334A
		LJUMP 	24AH 			//022F 	3A4A
		LDWI 	28H 			//0230 	2A28
		INCR	5DH,1 			//0231 	09DD
		SUBWR 	5DH,0 			//0232 	0C5D
		BTSS 	STATUS,0 		//0233 	1C03
		LJUMP 	240H 			//0234 	3A40
		LDWI 	2CH 			//0235 	2A2C
		SUBWR 	5DH,0 			//0236 	0C5D
		BTSS 	STATUS,0 		//0237 	1C03
		LJUMP 	23BH 			//0238 	3A3B
		CLRR 	5DH 			//0239 	015D
		BCR 	STATUS,0 		//023A 	1003
		LCALL 	273H 			//023B 	3273
		LCALL 	267H 			//023C 	3267
		BTSS 	STATUS,0 		//023D 	1C03
		LJUMP 	207H 			//023E 	3A07
		LJUMP 	210H 			//023F 	3A10
		LDR 	52H,0 			//0240 	0852
		SUBWR 	6EH,0 			//0241 	0C6E
		BTSS 	STATUS,2 		//0242 	1D03
		LJUMP 	246H 			//0243 	3A46
		LDR 	51H,0 			//0244 	0851
		SUBWR 	6DH,0 			//0245 	0C6D
		BTSC 	STATUS,0 		//0246 	1403
		LJUMP 	24AH 			//0247 	3A4A
		LDWI 	28H 			//0248 	2A28
		STR 	5DH 			//0249 	01DD
		LDWI 	4H 			//024A 	2A04
		INCR	5AH,1 			//024B 	09DA
		SUBWR 	5AH,0 			//024C 	0C5A
		BTSS 	STATUS,0 		//024D 	1C03
		LJUMP 	264H 			//024E 	3A64
		LDWI 	4H 			//024F 	2A04
		SUBWR 	5BH,0 			//0250 	0C5B
		BTSS 	STATUS,0 		//0251 	1C03
		LJUMP 	254H 			//0252 	3A54
		CLRR 	5BH 			//0253 	015B
		LDWI 	0H 			//0254 	2A00
		SUBWR 	50H,0 			//0255 	0C50
		LDWI 	31H 			//0256 	2A31
		BTSC 	STATUS,2 		//0257 	1503
		SUBWR 	4FH,0 			//0258 	0C4F
		BTSS 	STATUS,0 		//0259 	1C03
		LJUMP 	25DH 			//025A 	3A5D
		CLRR 	4FH 			//025B 	014F
		CLRR 	50H 			//025C 	0150
		INCR	5BH,1 			//025D 	09DB
		INCR	4FH,1 			//025E 	09CF
		BTSC 	STATUS,2 		//025F 	1503
		INCR	50H,1 			//0260 	09D0
		CLRR 	5AH 			//0261 	015A
		LDR 	5CH,0 			//0262 	085C
		STR 	59H 			//0263 	01D9
		INCR	7BH,1 			//0264 	09FB
		LDR 	59H,0 			//0265 	0859
		RET		 					//0266 	0004
		LDR 	INDF,0 			//0267 	0800
		STR 	6AH 			//0268 	01EA
		INCR	FSR,1 			//0269 	0984
		LDR 	INDF,0 			//026A 	0800
		STR 	6BH 			//026B 	01EB
		LDR 	52H,0 			//026C 	0852
		SUBWR 	6BH,0 			//026D 	0C6B
		BTSS 	STATUS,2 		//026E 	1D03
		RET		 					//026F 	0004
		LDR 	51H,0 			//0270 	0851
		SUBWR 	6AH,0 			//0271 	0C6A
		RET		 					//0272 	0004
		RLR 	5AH,0 			//0273 	055A
		ADDWI 	43H 			//0274 	2743
		STR 	FSR 			//0275 	0184
		BCR 	STATUS,7 		//0276 	1383
		RET		 					//0277 	0004
		BCR 	STATUS,0 		//0278 	1003
		RLR 	5AH,0 			//0279 	055A
		ADDWI 	43H 			//027A 	2743
		STR 	FSR 			//027B 	0184
		RET		 					//027C 	0004
		BSR 	STATUS,5 		//027D 	1A83
		BCR 	6H,6 			//027E 	1306
		BSR 	6H,5 			//027F 	1A86
		BSR 	6H,4 			//0280 	1A06
		LCALL 	35FH 			//0281 	335F
		LCALL 	367H 			//0282 	3367
		BSR 	6H,4 			//0283 	1A06
		LCALL 	35FH 			//0284 	335F
		BSR 	STATUS,5 		//0285 	1A83
		BCR 	6H,4 			//0286 	1206
		BSR 	6H,5 			//0287 	1A86
		BCR 	6H,6 			//0288 	1306
		LDWI 	1H 			//0289 	2A01
		STR 	73H 			//028A 	01F3
		INCR	7BH,0 			//028B 	097B
		LJUMP 	28FH 			//028C 	3A8F
		BCR 	STATUS,0 		//028D 	1003
		RLR 	73H,1 			//028E 	05F3
		ADDWI 	FFH 			//028F 	27FF
		BTSS 	STATUS,2 		//0290 	1D03
		LJUMP 	28DH 			//0291 	3A8D
		LDR 	73H,0 			//0292 	0873
		IORWR 	6H,1 			//0293 	0386
		BSR 	STATUS,5 		//0294 	1A83
		INCR	40H,1 			//0295 	09C0
		BTSC 	STATUS,2 		//0296 	1503
		INCR	41H,1 			//0297 	09C1
		BSR 	6H,6 			//0298 	1B06
		BSR 	6H,4 			//0299 	1A06
		BCR 	6H,4 			//029A 	1206
		BCR 	6H,6 			//029B 	1306
		BTSC 	EH,2 			//029C 	150E
		LJUMP 	295H 			//029D 	3A95
		LCALL 	375H 			//029E 	3375
		BCR 	STATUS,5 		//029F 	1283
		LDR 	41H,0 			//02A0 	0841
		STR 	52H 			//02A1 	01D2
		LDR 	40H,0 			//02A2 	0840
		STR 	51H 			//02A3 	01D1
		RET		 					//02A4 	0004

		//;main.c: 66: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//02A5 	168B
		BTSS 	INTCON,2 		//02A6 	1D0B
		LJUMP 	2BCH 			//02A7 	3ABC

		//;main.c: 67: {
		//;main.c: 68: T0IF = 0;
		BCR 	INTCON,2 		//02A8 	110B

		//;main.c: 69: TMR0 = 206;
		LDWI 	CEH 			//02A9 	2ACE
		BCR 	STATUS,5 		//02AA 	1283
		STR 	1H 			//02AB 	0181

		//;main.c: 71: StartTouchTime++;
		INCR	57H,1 			//02AC 	09D7
		BTSC 	STATUS,2 		//02AD 	1503
		INCR	58H,1 			//02AE 	09D8

		//;main.c: 73: if(topTouchTime < 20000 && Last!=0)topTouchTime++;
		LDWI 	4EH 			//02AF 	2A4E
		SUBWR 	56H,0 			//02B0 	0C56
		LDWI 	20H 			//02B1 	2A20
		BTSC 	STATUS,2 		//02B2 	1503
		SUBWR 	55H,0 			//02B3 	0C55
		BTSC 	STATUS,0 		//02B4 	1403
		LJUMP 	2BCH 			//02B5 	3ABC
		LDR 	68H,0 			//02B6 	0868
		BTSC 	STATUS,2 		//02B7 	1503
		LJUMP 	2BCH 			//02B8 	3ABC
		INCR	55H,1 			//02B9 	09D5
		BTSC 	STATUS,2 		//02BA 	1503
		INCR	56H,1 			//02BB 	09D6

		//;main.c: 76: }
		//;main.c: 78: if(PAIE && PAIF)
		BTSC 	INTCON,3 		//02BC 	158B
		BTSS 	INTCON,0 		//02BD 	1C0B
		LJUMP 	2C4H 			//02BE 	3AC4

		//;main.c: 79: {
		//;main.c: 81: ReadAPin = PORTA;
		BCR 	STATUS,5 		//02BF 	1283
		LDR 	5H,0 			//02C0 	0805

		//;main.c: 82: PAIF = 0;
		BCR 	INTCON,0 		//02C1 	100B

		//;main.c: 83: IOCA2 =0;
		BSR 	STATUS,5 		//02C2 	1A83
		BCR 	16H,2 			//02C3 	1116
		LDR 	71H,0 			//02C4 	0871
		STR 	PCLATH 			//02C5 	018A
		SWAPR 	70H,0 			//02C6 	0770
		STR 	STATUS 			//02C7 	0183
		SWAPR 	7EH,1 			//02C8 	07FE
		SWAPR 	7EH,0 			//02C9 	077E
		RETI		 			//02CA 	0009
		CLRR 	76H 			//02CB 	0176
		CLRR 	77H 			//02CC 	0177
		CLRR 	78H 			//02CD 	0178
		CLRWDT	 			//02CE 	0001
		LCALL 	27DH 			//02CF 	327D
		LDR 	40H,0 			//02D0 	0840
		ADDWR 	76H,1 			//02D1 	0BF6
		BTSC 	STATUS,0 		//02D2 	1403
		INCR	77H,1 			//02D3 	09F7
		LDR 	41H,0 			//02D4 	0841
		ADDWR 	77H,1 			//02D5 	0BF7
		LDWI 	4H 			//02D6 	2A04
		INCR	78H,1 			//02D7 	09F8
		SUBWR 	78H,0 			//02D8 	0C78
		BTSS 	STATUS,0 		//02D9 	1C03
		LJUMP 	2CEH 			//02DA 	3ACE
		LDR 	77H,0 			//02DB 	0877
		STR 	75H 			//02DC 	01F5
		LDR 	76H,0 			//02DD 	0876
		STR 	74H 			//02DE 	01F4
		BCR 	STATUS,0 		//02DF 	1003
		RRR	75H,1 			//02E0 	06F5
		RRR	74H,1 			//02E1 	06F4
		BCR 	STATUS,0 		//02E2 	1003
		RRR	75H,1 			//02E3 	06F5
		RRR	74H,1 			//02E4 	06F4
		LDR 	74H,0 			//02E5 	0874
		STR 	51H 			//02E6 	01D1
		LDR 	75H,0 			//02E7 	0875
		STR 	52H 			//02E8 	01D2
		RET		 					//02E9 	0004

		//;main.c: 99: OSCCON = 0B01100000;
		LDWI 	60H 			//02EA 	2A60
		BSR 	STATUS,5 		//02EB 	1A83
		STR 	FH 			//02EC 	018F

		//;main.c: 100: OPTION = 0B00000100;
		LDWI 	4H 			//02ED 	2A04
		STR 	1H 			//02EE 	0181

		//;main.c: 101: TRISA = 0B00000000;
		CLRR 	5H 			//02EF 	0105

		//;main.c: 102: PORTA = 0B00000000;
		BCR 	STATUS,5 		//02F0 	1283
		CLRR 	5H 			//02F1 	0105

		//;main.c: 103: LVDCON = 0x03;
		LDWI 	3H 			//02F2 	2A03
		BSR 	STATUS,5 		//02F3 	1A83
		STR 	DH 			//02F4 	018D

		//;main.c: 104: PCON = 0x88;
		LDWI 	88H 			//02F5 	2A88
		STR 	EH 			//02F6 	018E

		//;main.c: 105: TRISA = 0B00000000;
		CLRR 	5H 			//02F7 	0105

		//;main.c: 106: PORTA = 0B00000000;
		BCR 	STATUS,5 		//02F8 	1283
		CLRR 	5H 			//02F9 	0105

		//;main.c: 107: OSCCON = 0B01110000;
		LDWI 	70H 			//02FA 	2A70
		BSR 	STATUS,5 		//02FB 	1A83
		STR 	FH 			//02FC 	018F

		//;main.c: 108: INTCON = 0;
		CLRR 	INTCON 			//02FD 	010B

		//;main.c: 110: PORTA = 0B00000000;
		BCR 	STATUS,5 		//02FE 	1283
		CLRR 	5H 			//02FF 	0105

		//;main.c: 111: TRISA = 0B00000000;
		BSR 	STATUS,5 		//0300 	1A83
		CLRR 	5H 			//0301 	0105

		//;main.c: 112: WPUA = 0B00000000;
		CLRR 	15H 			//0302 	0115

		//;main.c: 113: PSRCA = 0B00000000;
		CLRR 	8H 			//0303 	0108
		RET		 					//0304 	0004
		BSR 	STATUS,5 		//0305 	1A83
		BSR 	5H,0 			//0306 	1805
		BSR 	5H,1 			//0307 	1885
		BSR 	5H,2 			//0308 	1905
		BSR 	5H,3 			//0309 	1985
		CLRR 	7BH 			//030A 	017B
		BCR 	STATUS,5 		//030B 	1283
		CLRR 	5AH 			//030C 	015A
		BSR 	42H,1 			//030D 	18C2
		CLRR 	79H 			//030E 	0179
		LCALL 	14CH 			//030F 	314C
		LDWI 	4H 			//0310 	2A04
		INCR	79H,1 			//0311 	09F9
		SUBWR 	79H,0 			//0312 	0C79
		BTSS 	STATUS,0 		//0313 	1C03
		LJUMP 	30FH 			//0314 	3B0F
		BCR 	42H,1 			//0315 	10C2
		CLRR 	7BH 			//0316 	017B
		CLRR 	5AH 			//0317 	015A
		RET		 					//0318 	0004

		//;main.c: 54: unsigned int a;
		//;main.c: 55: for(a=0;a<Time;a++)
		CLRR 	78H 			//0319 	0178
		CLRR 	79H 			//031A 	0179
		LDR 	77H,0 			//031B 	0877
		SUBWR 	79H,0 			//031C 	0C79
		BTSS 	STATUS,2 		//031D 	1D03
		LJUMP 	321H 			//031E 	3B21
		LDR 	76H,0 			//031F 	0876
		SUBWR 	78H,0 			//0320 	0C78
		BTSC 	STATUS,0 		//0321 	1403
		RET		 					//0322 	0004

		//;main.c: 56: {
		//;main.c: 57: Delay_Us(1000);
		LDWI 	E8H 			//0323 	2AE8
		STR 	72H 			//0324 	01F2
		LDWI 	3H 			//0325 	2A03
		STR 	73H 			//0326 	01F3
		LCALL 	32CH 			//0327 	332C
		INCR	78H,1 			//0328 	09F8
		BTSC 	STATUS,2 		//0329 	1503
		INCR	79H,1 			//032A 	09F9
		LJUMP 	31BH 			//032B 	3B1B

		//;main.c: 44: unsigned int a;
		//;main.c: 45: for(a=0;a<Time;a++)
		CLRR 	74H 			//032C 	0174
		CLRR 	75H 			//032D 	0175
		LDR 	73H,0 			//032E 	0873
		SUBWR 	75H,0 			//032F 	0C75
		BTSS 	STATUS,2 		//0330 	1D03
		LJUMP 	334H 			//0331 	3B34
		LDR 	72H,0 			//0332 	0872
		SUBWR 	74H,0 			//0333 	0C74
		BTSC 	STATUS,0 		//0334 	1403
		RET		 					//0335 	0004

		//;main.c: 46: {
		//;main.c: 47: __nop();
		NOP		 					//0336 	0000
		CLRWDT	 			//0337 	0001
		INCR	74H,1 			//0338 	09F4
		BTSC 	STATUS,2 		//0339 	1503
		INCR	75H,1 			//033A 	09F5
		LJUMP 	32EH 			//033B 	3B2E
		LDWI 	3H 			//033C 	2A03
		STR 	PCLATH 			//033D 	018A
		LDR 	FSR,0 			//033E 	0804
		INCR	FSR,1 			//033F 	0984
		ADDWR 	PCL,1 			//0340 	0B82
		RETW 	0H 			//0341 	2100
		RETW 	2EH 			//0342 	212E
		RETW 	29H 			//0343 	2129
		RETW 	24H 			//0344 	2124
		RETW 	28H 			//0345 	2128
		RETW 	4BH 			//0346 	214B
		RETW 	42H 			//0347 	2142
		RETW 	3BH 			//0348 	213B
		RETW 	42H 			//0349 	2142
		LCALL 	351H 			//034A 	3351
		BCR 	STATUS,7 		//034B 	1383
		STR 	INDF 			//034C 	0180
		INCR	FSR,1 			//034D 	0984
		LDR 	52H,0 			//034E 	0852
		STR 	INDF 			//034F 	0180
		RET		 					//0350 	0004
		BCR 	STATUS,0 		//0351 	1003
		RLR 	5AH,0 			//0352 	055A
		ADDWI 	43H 			//0353 	2743
		STR 	FSR 			//0354 	0184
		LDR 	51H,0 			//0355 	0851
		RET		 					//0356 	0004
		CLRWDT	 			//0357 	0001
		CLRR 	INDF 			//0358 	0100
		INCR	FSR,1 			//0359 	0984
		XORWR 	FSR,0 			//035A 	0404
		BTSC 	STATUS,2 		//035B 	1503
		RETW 	0H 			//035C 	2100
		XORWR 	FSR,0 			//035D 	0404
		LJUMP 	358H 			//035E 	3B58
		CLRR 	72H 			//035F 	0172
		NOP		 					//0360 	0000
		LDWI 	19H 			//0361 	2A19
		INCR	72H,1 			//0362 	09F2
		SUBWR 	72H,0 			//0363 	0C72
		BTSC 	STATUS,0 		//0364 	1403
		RET		 					//0365 	0004
		LJUMP 	360H 			//0366 	3B60
		BCR 	STATUS,5 		//0367 	1283
		CLRR 	40H 			//0368 	0140
		CLRR 	41H 			//0369 	0141
		BSR 	STATUS,5 		//036A 	1A83
		BSR 	EH,3 			//036B 	198E
		CLRR 	6H 			//036C 	0106
		RET		 					//036D 	0004

		//;main.c: 91: TMR0 = 206;
		LDWI 	CEH 			//036E 	2ACE
		BCR 	STATUS,5 		//036F 	1283
		STR 	1H 			//0370 	0181

		//;main.c: 92: T0IF = 0;
		BCR 	INTCON,2 		//0371 	110B

		//;main.c: 93: T0IE = 1;
		BSR 	INTCON,5 		//0372 	1A8B

		//;main.c: 94: GIE = 1;
		BSR 	INTCON,7 		//0373 	1B8B
		RET		 					//0374 	0004
		BSR 	STATUS,5 		//0375 	1A83
		CLRR 	6H 			//0376 	0106
		BSR 	6H,4 			//0377 	1A06
		BCR 	EH,3 			//0378 	118E
		RET		 					//0379 	0004
			END
