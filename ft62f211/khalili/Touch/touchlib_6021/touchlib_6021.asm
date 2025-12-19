//Deviec:FT62F21X
//-----------------------Variable---------------------------------
		_GKeyValue		EQU		5EH
		_Last		EQU		5DH
		_State		EQU		5CH
		_i		EQU		5BH
		_Effect		EQU		5AH
		_Mute		EQU		59H
		_Flag		EQU		58H
		_Time		EQU		57H
		_Trig		EQU		56H
		_CountTrig		EQU		55H
		_Lock		EQU		64H
		_StartTouchTime		EQU		4BH
		_CountKey		EQU		49H
		_awaken		EQU		7AH
		_KeyDv		EQU		54H
		_charcap		EQU		47H
		_EqudataC		EQU		53H
		_EquDV		EQU		52H
		_delta_temp		EQU		51H
		_DebounceActive		EQU		50H
		_Touch_Number		EQU		45H
		_UpdataTime		EQU		4FH
		_thedeathcount		EQU		43H
		_NowKey		EQU		7BH
		_NowKeyCount		EQU		4EH
		_DebounceActiveBuff		EQU		4DH
//		Touch_init@x		EQU		79H
//		TouchKeyScan@charcapBuff		EQU		62H
//		ReadCap4@charcapBuff		EQU		76H
//		ReadCap4@Count		EQU		78H
//		DelayUs2@a		EQU		72H
//		EEPROMwrite@EEAddr		EQU		73H
//		EEPROMwrite@EEAddr		EQU		73H
//		EEPROMwrite@Data		EQU		72H
//		EEPROMwrite@EEAddr		EQU		73H
//		EEPROMread@EEAddr		EQU		72H
//		EEPROMread@ReEEPROMread		EQU		73H
//		EEPROMread@EEAddr		EQU		72H
//		EEPROMread@EEAddr		EQU		72H
//		DelayMs@a		EQU		78H
//		DelayMs@Time		EQU		76H
//		Delay_Us@a		EQU		74H
//		Delay_Us@Time		EQU		72H
//-----------------------Variable END---------------------------------

		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	305H 			//0009 	3B05
		LJUMP 	0BH 			//000A 	380B
		LDWI 	1H 			//000B 	2A01
		STR 	64H 			//000C 	01E4
		LDWI 	43H 			//000D 	2A43
		BCR 	STATUS,7 		//000E 	1383
		STR 	FSR 			//000F 	0184
		LDWI 	5FH 			//0010 	2A5F
		LCALL 	35EH 			//0011 	335E
		CLRR 	7BH 			//0012 	017B
		CLRR 	7AH 			//0013 	017A
		CLRR 	STATUS 			//0014 	0103
		LJUMP 	16H 			//0015 	3816

		//;main.c: 201: TRISA = 0B00000000;
		BSR 	STATUS,5 		//0016 	1A83
		CLRR 	5H 			//0017 	0105

		//;main.c: 202: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0018 	1283
		CLRR 	5H 			//0019 	0105

		//;main.c: 203: SYS_INITIAL();
		LCALL 	2BBH 			//001A 	32BB

		//;main.c: 204: DelayMs(200);
		LDWI 	C8H 			//001B 	2AC8
		STR 	76H 			//001C 	01F6
		CLRR 	77H 			//001D 	0177
		LCALL 	2F2H 			//001E 	32F2

		//;main.c: 206: Effect=EEPROMread(0X10);
		LDWI 	10H 			//001F 	2A10
		LCALL 	351H 			//0020 	3351
		BCR 	STATUS,5 		//0021 	1283
		STR 	5AH 			//0022 	01DA

		//;main.c: 207: TRISA = 0B00000000;
		BSR 	STATUS,5 		//0023 	1A83
		CLRR 	5H 			//0024 	0105

		//;main.c: 208: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0025 	1283
		CLRR 	5H 			//0026 	0105

		//;main.c: 209: if(Effect>100 & Effect< 110){Effect=120; while(1);}
		LDWI 	65H 			//0027 	2A65
		SUBWR 	5AH,0 			//0028 	0C5A
		BTSS 	STATUS,0 		//0029 	1C03
		LJUMP 	32H 			//002A 	3832
		LDWI 	6EH 			//002B 	2A6E
		SUBWR 	5AH,0 			//002C 	0C5A
		BTSC 	STATUS,0 		//002D 	1403
		LJUMP 	32H 			//002E 	3832
		LDWI 	78H 			//002F 	2A78
		STR 	5AH 			//0030 	01DA
		LJUMP 	31H 			//0031 	3831

		//;main.c: 210: else{Effect++;EEPROMwrite(0x10,Effect);};
		INCR	5AH,1 			//0032 	09DA
		LDR 	5AH,0 			//0033 	085A
		STR 	72H 			//0034 	01F2
		LDWI 	10H 			//0035 	2A10
		LCALL 	2D9H 			//0036 	32D9

		//;main.c: 211: if(Effect>250){Effect=0;}
		LDWI 	FBH 			//0037 	2AFB
		BCR 	STATUS,5 		//0038 	1283
		SUBWR 	5AH,0 			//0039 	0C5A
		BTSC 	STATUS,0 		//003A 	1403
		CLRR 	5AH 			//003B 	015A

		//;main.c: 212: TRISA = 0B00000000;
		BSR 	STATUS,5 		//003C 	1A83
		CLRR 	5H 			//003D 	0105

		//;main.c: 213: PORTA = 0B00000000;
		BCR 	STATUS,5 		//003E 	1283
		CLRR 	5H 			//003F 	0105

		//;main.c: 215: Mute=EEPROMread(0X20);
		LDWI 	20H 			//0040 	2A20
		LCALL 	351H 			//0041 	3351
		BCR 	STATUS,5 		//0042 	1283
		STR 	59H 			//0043 	01D9

		//;main.c: 216: if(Mute>2){Mute=1;}
		LDWI 	3H 			//0044 	2A03
		SUBWR 	59H,0 			//0045 	0C59
		BTSS 	STATUS,0 		//0046 	1C03
		LJUMP 	4AH 			//0047 	384A
		LDWI 	1H 			//0048 	2A01
		STR 	59H 			//0049 	01D9

		//;main.c: 217: TRISA = 0B00000000;
		BSR 	STATUS,5 		//004A 	1A83
		CLRR 	5H 			//004B 	0105

		//;main.c: 218: PORTA = 0B00000000;
		BCR 	STATUS,5 		//004C 	1283
		CLRR 	5H 			//004D 	0105

		//;main.c: 220: for(i=0;i<4;i++)
		CLRR 	5BH 			//004E 	015B
		LDWI 	4H 			//004F 	2A04
		SUBWR 	5BH,0 			//0050 	0C5B
		BTSC 	STATUS,0 		//0051 	1403
		LJUMP 	74H 			//0052 	3874

		//;main.c: 221: {
		//;main.c: 222: PA1=!1;__nop();;
		BCR 	5H,1 			//0053 	1085
		NOP		 					//0054 	0000

		//;main.c: 223: PA0=!0;__nop();;
		BCR 	STATUS,5 		//0055 	1283
		BSR 	5H,0 			//0056 	1805
		NOP		 					//0057 	0000

		//;main.c: 224: if(Mute==1){PA4=1;__nop();;}
		BCR 	STATUS,5 		//0058 	1283
		DECRSZ 	59H,0 		//0059 	0E59
		LJUMP 	5DH 			//005A 	385D
		BSR 	5H,4 			//005B 	1A05
		NOP		 					//005C 	0000

		//;main.c: 225: DelayMs(20);
		LDWI 	14H 			//005D 	2A14
		STR 	76H 			//005E 	01F6
		CLRR 	77H 			//005F 	0177
		LCALL 	2F2H 			//0060 	32F2

		//;main.c: 226: PA1=!0;__nop();;
		BCR 	STATUS,5 		//0061 	1283
		BSR 	5H,1 			//0062 	1885
		NOP		 					//0063 	0000

		//;main.c: 227: PA0=!1;__nop();;
		BCR 	STATUS,5 		//0064 	1283
		BCR 	5H,0 			//0065 	1005
		NOP		 					//0066 	0000

		//;main.c: 228: PA4=0;__nop();;
		BCR 	STATUS,5 		//0067 	1283
		BCR 	5H,4 			//0068 	1205
		NOP		 					//0069 	0000

		//;main.c: 229: DelayMs(20);
		LDWI 	14H 			//006A 	2A14
		STR 	76H 			//006B 	01F6
		CLRR 	77H 			//006C 	0177
		LCALL 	2F2H 			//006D 	32F2
		BCR 	STATUS,5 		//006E 	1283
		INCR	5BH,1 			//006F 	09DB
		LDWI 	4H 			//0070 	2A04
		SUBWR 	5BH,0 			//0071 	0C5B
		BTSS 	STATUS,0 		//0072 	1C03
		LJUMP 	53H 			//0073 	3853

		//;main.c: 230: }
		//;main.c: 231: PA1=!1;__nop();;
		BCR 	5H,1 			//0074 	1085
		NOP		 					//0075 	0000

		//;main.c: 232: PA0=!0;__nop();;
		BCR 	STATUS,5 		//0076 	1283
		BSR 	5H,0 			//0077 	1805
		NOP		 					//0078 	0000

		//;main.c: 233: TIMER0_INITIAL();
		LCALL 	375H 			//0079 	3375

		//;main.c: 234: Touch_init();
		LCALL 	316H 			//007A 	3316

		//;main.c: 235: State=0;
		CLRR 	5CH 			//007B 	015C

		//;main.c: 237: {
		//;main.c: 238: Delay_Us(10);
		LDWI 	AH 			//007C 	2A0A
		STR 	72H 			//007D 	01F2
		CLRR 	73H 			//007E 	0173
		LCALL 	326H 			//007F 	3326

		//;main.c: 239: if(StartTouchTime >= (2500/30/1))
		LDWI 	0H 			//0080 	2A00
		BCR 	STATUS,5 		//0081 	1283
		SUBWR 	4CH,0 			//0082 	0C4C
		LDWI 	53H 			//0083 	2A53
		BTSC 	STATUS,2 		//0084 	1503
		SUBWR 	4BH,0 			//0085 	0C4B
		BTSS 	STATUS,0 		//0086 	1C03
		LJUMP 	8CH 			//0087 	388C

		//;main.c: 240: {
		//;main.c: 241: StartTouchTime = 0;
		CLRR 	4BH 			//0088 	014B
		CLRR 	4CH 			//0089 	014C

		//;main.c: 242: GKeyValue = TouchKeyScan();
		LCALL 	150H 			//008A 	3150
		STR 	5EH 			//008B 	01DE

		//;main.c: 243: }
		//;main.c: 244: if(GKeyValue!=0)
		LDR 	5EH,0 			//008C 	085E
		BTSC 	STATUS,2 		//008D 	1503
		LJUMP 	112H 			//008E 	3912

		//;main.c: 245: {
		//;main.c: 246: if(GKeyValue==8)
		LDWI 	8H 			//008F 	2A08
		XORWR 	5EH,0 			//0090 	045E
		BTSS 	STATUS,2 		//0091 	1D03
		LJUMP 	105H 			//0092 	3905

		//;main.c: 247: {
		//;main.c: 248: if(CountKey<50005)
		LDWI 	C3H 			//0093 	2AC3
		SUBWR 	4AH,0 			//0094 	0C4A
		LDWI 	55H 			//0095 	2A55
		BTSC 	STATUS,2 		//0096 	1503
		SUBWR 	49H,0 			//0097 	0C49
		BTSC 	STATUS,0 		//0098 	1403
		LJUMP 	105H 			//0099 	3905

		//;main.c: 249: {
		//;main.c: 250: CountKey++;
		INCR	49H,1 			//009A 	09C9
		BTSC 	STATUS,2 		//009B 	1503
		INCR	4AH,1 			//009C 	09CA

		//;main.c: 251: if(CountKey>50000)
		LDWI 	C3H 			//009D 	2AC3
		SUBWR 	4AH,0 			//009E 	0C4A
		LDWI 	51H 			//009F 	2A51
		BTSC 	STATUS,2 		//00A0 	1503
		SUBWR 	49H,0 			//00A1 	0C49
		BTSS 	STATUS,0 		//00A2 	1C03
		LJUMP 	105H 			//00A3 	3905

		//;main.c: 252: {
		//;main.c: 253: CountKey=50010;
		LDWI 	5AH 			//00A4 	2A5A
		STR 	49H 			//00A5 	01C9
		LDWI 	C3H 			//00A6 	2AC3
		STR 	4AH 			//00A7 	01CA

		//;main.c: 254: if(Mute==0)
		LDR 	59H,0 			//00A8 	0859
		BTSS 	STATUS,2 		//00A9 	1D03
		LJUMP 	D7H 			//00AA 	38D7

		//;main.c: 255: {
		//;main.c: 256: Mute=1;
		LDWI 	1H 			//00AB 	2A01
		STR 	59H 			//00AC 	01D9

		//;main.c: 257: for(i=0;i<2;i++)
		CLRR 	5BH 			//00AD 	015B
		LDWI 	2H 			//00AE 	2A02
		SUBWR 	5BH,0 			//00AF 	0C5B
		BTSC 	STATUS,0 		//00B0 	1403
		LJUMP 	C8H 			//00B1 	38C8

		//;main.c: 258: {
		//;main.c: 259: PA1=!0;__nop();;
		BSR 	5H,1 			//00B2 	1885
		NOP		 					//00B3 	0000

		//;main.c: 260: PA0=!1;__nop();;
		BCR 	STATUS,5 		//00B4 	1283
		BCR 	5H,0 			//00B5 	1005
		NOP		 					//00B6 	0000

		//;main.c: 261: DelayMs(100);
		LDWI 	64H 			//00B7 	2A64
		STR 	76H 			//00B8 	01F6
		CLRR 	77H 			//00B9 	0177
		LCALL 	2F2H 			//00BA 	32F2

		//;main.c: 262: PA1=!1;__nop();;
		BCR 	STATUS,5 		//00BB 	1283
		BCR 	5H,1 			//00BC 	1085
		NOP		 					//00BD 	0000

		//;main.c: 263: PA0=!0;__nop();;
		BCR 	STATUS,5 		//00BE 	1283
		BSR 	5H,0 			//00BF 	1805
		NOP		 					//00C0 	0000

		//;main.c: 264: DelayMs(100);
		LDWI 	64H 			//00C1 	2A64
		STR 	76H 			//00C2 	01F6
		CLRR 	77H 			//00C3 	0177
		LCALL 	2F2H 			//00C4 	32F2
		LCALL 	14BH 			//00C5 	314B
		BTSS 	STATUS,0 		//00C6 	1C03
		LJUMP 	B2H 			//00C7 	38B2

		//;main.c: 265: }
		//;main.c: 266: EEPROMwrite(0X20,Mute);
		LDR 	59H,0 			//00C8 	0859
		STR 	72H 			//00C9 	01F2
		LDWI 	20H 			//00CA 	2A20
		LCALL 	2D9H 			//00CB 	32D9

		//;main.c: 267: PA4=1;__nop();;
		BCR 	STATUS,5 		//00CC 	1283
		BSR 	5H,4 			//00CD 	1A05
		NOP		 					//00CE 	0000

		//;main.c: 268: DelayMs(100);
		LDWI 	64H 			//00CF 	2A64
		STR 	76H 			//00D0 	01F6
		CLRR 	77H 			//00D1 	0177
		LCALL 	2F2H 			//00D2 	32F2

		//;main.c: 269: PA4=0;__nop();;
		BCR 	STATUS,5 		//00D3 	1283
		BCR 	5H,4 			//00D4 	1205
		NOP		 					//00D5 	0000

		//;main.c: 270: }
		LJUMP 	F9H 			//00D6 	38F9

		//;main.c: 271: else if(Mute==1)
		DECRSZ 	59H,0 		//00D7 	0E59
		LJUMP 	F9H 			//00D8 	38F9

		//;main.c: 272: {
		//;main.c: 273: Mute=0;
		CLRR 	59H 			//00D9 	0159

		//;main.c: 274: for(i=0;i<2;i++)
		CLRR 	5BH 			//00DA 	015B
		LDWI 	2H 			//00DB 	2A02
		SUBWR 	5BH,0 			//00DC 	0C5B
		BTSC 	STATUS,0 		//00DD 	1403
		LJUMP 	F5H 			//00DE 	38F5

		//;main.c: 275: {
		//;main.c: 276: PA1=!0;__nop();;
		BSR 	5H,1 			//00DF 	1885
		NOP		 					//00E0 	0000

		//;main.c: 277: PA0=!1;__nop();;
		BCR 	STATUS,5 		//00E1 	1283
		BCR 	5H,0 			//00E2 	1005
		NOP		 					//00E3 	0000

		//;main.c: 278: DelayMs(100);
		LDWI 	64H 			//00E4 	2A64
		STR 	76H 			//00E5 	01F6
		CLRR 	77H 			//00E6 	0177
		LCALL 	2F2H 			//00E7 	32F2

		//;main.c: 279: PA1=!1;__nop();;
		BCR 	STATUS,5 		//00E8 	1283
		BCR 	5H,1 			//00E9 	1085
		NOP		 					//00EA 	0000

		//;main.c: 280: PA0=!0;__nop();;
		BCR 	STATUS,5 		//00EB 	1283
		BSR 	5H,0 			//00EC 	1805
		NOP		 					//00ED 	0000

		//;main.c: 281: DelayMs(100);
		LDWI 	64H 			//00EE 	2A64
		STR 	76H 			//00EF 	01F6
		CLRR 	77H 			//00F0 	0177
		LCALL 	2F2H 			//00F1 	32F2
		LCALL 	14BH 			//00F2 	314B
		BTSS 	STATUS,0 		//00F3 	1C03
		LJUMP 	DFH 			//00F4 	38DF

		//;main.c: 282: }
		//;main.c: 283: EEPROMwrite(0X20,Mute);
		LDR 	59H,0 			//00F5 	0859
		STR 	72H 			//00F6 	01F2
		LDWI 	20H 			//00F7 	2A20
		LCALL 	2D9H 			//00F8 	32D9

		//;main.c: 284: }
		//;main.c: 285: PA1=!0;__nop();;
		BCR 	STATUS,5 		//00F9 	1283
		BSR 	5H,1 			//00FA 	1885
		NOP		 					//00FB 	0000

		//;main.c: 286: PA0=!1;__nop();;
		BCR 	STATUS,5 		//00FC 	1283
		BCR 	5H,0 			//00FD 	1005
		NOP		 					//00FE 	0000

		//;main.c: 287: PA2=1;__nop();;
		BCR 	STATUS,5 		//00FF 	1283
		BSR 	5H,2 			//0100 	1905
		NOP		 					//0101 	0000

		//;main.c: 288: State=1;
		LDWI 	1H 			//0102 	2A01
		BCR 	STATUS,5 		//0103 	1283
		STR 	5CH 			//0104 	01DC

		//;main.c: 289: }
		//;main.c: 290: }
		//;main.c: 291: }
		//;main.c: 292: if(Last!=GKeyValue)
		LDR 	5DH,0 			//0105 	085D
		XORWR 	5EH,0 			//0106 	045E
		BTSC 	STATUS,2 		//0107 	1503
		LJUMP 	10EH 			//0108 	390E

		//;main.c: 293: {
		//;main.c: 294: if(GKeyValue==8)
		LDWI 	8H 			//0109 	2A08
		XORWR 	5EH,0 			//010A 	045E
		BTSS 	STATUS,2 		//010B 	1D03
		LJUMP 	10EH 			//010C 	390E

		//;main.c: 295: {
		//;main.c: 296: __nop();
		NOP		 					//010D 	0000

		//;main.c: 324: }
		//;main.c: 325: }
		//;main.c: 326: Last=GKeyValue;
		BCR 	STATUS,5 		//010E 	1283
		LDR 	5EH,0 			//010F 	085E
		STR 	5DH 			//0110 	01DD

		//;main.c: 328: }
		LJUMP 	7CH 			//0111 	387C

		//;main.c: 329: else
		//;main.c: 330: {
		//;main.c: 331: Last=0;
		CLRR 	5DH 			//0112 	015D

		//;main.c: 332: if(CountKey>10 & CountKey<20000)
		LDWI 	0H 			//0113 	2A00
		SUBWR 	4AH,0 			//0114 	0C4A
		LDWI 	BH 			//0115 	2A0B
		BTSC 	STATUS,2 		//0116 	1503
		SUBWR 	49H,0 			//0117 	0C49
		BTSS 	STATUS,0 		//0118 	1C03
		LJUMP 	147H 			//0119 	3947
		LDWI 	4EH 			//011A 	2A4E
		SUBWR 	4AH,0 			//011B 	0C4A
		LDWI 	20H 			//011C 	2A20
		BTSC 	STATUS,2 		//011D 	1503
		SUBWR 	49H,0 			//011E 	0C49
		BTSC 	STATUS,0 		//011F 	1403
		LJUMP 	147H 			//0120 	3947

		//;main.c: 333: {
		//;main.c: 335: if(State==1)
		DECRSZ 	5CH,0 		//0121 	0E5C
		LJUMP 	12EH 			//0122 	392E

		//;main.c: 336: {
		//;main.c: 337: PA1=!1;__nop();;
		BCR 	5H,1 			//0123 	1085
		NOP		 					//0124 	0000

		//;main.c: 338: PA0=!0;__nop();;
		BCR 	STATUS,5 		//0125 	1283
		BSR 	5H,0 			//0126 	1805
		NOP		 					//0127 	0000

		//;main.c: 339: PA2=0;__nop();;
		BCR 	STATUS,5 		//0128 	1283
		BCR 	5H,2 			//0129 	1105
		NOP		 					//012A 	0000

		//;main.c: 340: State=0;
		BCR 	STATUS,5 		//012B 	1283
		CLRR 	5CH 			//012C 	015C

		//;main.c: 344: }
		LJUMP 	13CH 			//012D 	393C

		//;main.c: 345: else if(State==0)
		LDR 	5CH,0 			//012E 	085C
		BTSS 	STATUS,2 		//012F 	1D03
		LJUMP 	13CH 			//0130 	393C

		//;main.c: 346: {
		//;main.c: 347: PA1=!0;__nop();;
		BSR 	5H,1 			//0131 	1885
		NOP		 					//0132 	0000

		//;main.c: 348: PA0=!1;__nop();;
		BCR 	STATUS,5 		//0133 	1283
		BCR 	5H,0 			//0134 	1005
		NOP		 					//0135 	0000

		//;main.c: 349: PA2=1;__nop();;
		BCR 	STATUS,5 		//0136 	1283
		BSR 	5H,2 			//0137 	1905
		NOP		 					//0138 	0000

		//;main.c: 350: State=1;
		LDWI 	1H 			//0139 	2A01
		BCR 	STATUS,5 		//013A 	1283
		STR 	5CH 			//013B 	01DC

		//;main.c: 354: }
		//;main.c: 355: if(Mute==1)
		DECRSZ 	59H,0 		//013C 	0E59
		LJUMP 	147H 			//013D 	3947

		//;main.c: 356: {
		//;main.c: 357: PA4=1;__nop();;
		BSR 	5H,4 			//013E 	1A05
		NOP		 					//013F 	0000

		//;main.c: 358: DelayMs(50);
		LDWI 	32H 			//0140 	2A32
		STR 	76H 			//0141 	01F6
		CLRR 	77H 			//0142 	0177
		LCALL 	2F2H 			//0143 	32F2

		//;main.c: 359: PA4=0;__nop();;
		BCR 	STATUS,5 		//0144 	1283
		BCR 	5H,4 			//0145 	1205
		NOP		 					//0146 	0000

		//;main.c: 360: }
		//;main.c: 361: }
		//;main.c: 362: CountKey=0;
		BCR 	STATUS,5 		//0147 	1283
		CLRR 	49H 			//0148 	0149
		CLRR 	4AH 			//0149 	014A
		LJUMP 	7CH 			//014A 	387C
		BCR 	STATUS,5 		//014B 	1283
		INCR	5BH,1 			//014C 	09DB
		LDWI 	2H 			//014D 	2A02
		SUBWR 	5BH,0 			//014E 	0C5B
		RET		 					//014F 	0004
		INCR	7BH,0 			//0150 	097B
		STR 	5FH 			//0151 	01DF
		LDWI 	8H 			//0152 	2A08
		STR 	60H 			//0153 	01E0
		LDWI 	0H 			//0154 	2A00
		STR 	61H 			//0155 	01E1
		LJUMP 	15AH 			//0156 	395A
		RLR 	61H,0 			//0157 	0561
		RRR	61H,1 			//0158 	06E1
		RRR	60H,1 			//0159 	06E0
		DECRSZ 	5FH,1 		//015A 	0EDF
		LJUMP 	157H 			//015B 	3957
		BCR 	STATUS,5 		//015C 	1283
		BTSC 	60H,0 			//015D 	1460
		LJUMP 	166H 			//015E 	3966
		LDWI 	5H 			//015F 	2A05
		INCR	7BH,1 			//0160 	09FB
		SUBWR 	7BH,0 			//0161 	0C7B
		BTSS 	STATUS,0 		//0162 	1C03
		LJUMP 	150H 			//0163 	3950
		CLRR 	7BH 			//0164 	017B
		LJUMP 	150H 			//0165 	3950
		BCR 	STATUS,0 		//0166 	1003
		LCALL 	26AH 			//0167 	326A
		LDR 	INDF,0 			//0168 	0800
		STR 	62H 			//0169 	01E2
		INCR	FSR,1 			//016A 	0984
		LDR 	INDF,0 			//016B 	0800
		STR 	63H 			//016C 	01E3
		BTSS 	7AH,0 			//016D 	1C7A
		LJUMP 	171H 			//016E 	3971
		LCALL 	274H 			//016F 	3274
		LJUMP 	172H 			//0170 	3972
		LCALL 	29CH 			//0171 	329C
		CLRR 	54H 			//0172 	0154
		LDR 	63H,0 			//0173 	0863
		SUBWR 	46H,0 			//0174 	0C46
		BTSS 	STATUS,2 		//0175 	1D03
		LJUMP 	179H 			//0176 	3979
		LDR 	62H,0 			//0177 	0862
		SUBWR 	45H,0 			//0178 	0C45
		BTSC 	STATUS,0 		//0179 	1403
		LJUMP 	18FH 			//017A 	398F
		LDR 	45H,0 			//017B 	0845
		SUBWR 	62H,0 			//017C 	0C62
		STR 	5FH 			//017D 	01DF
		LDR 	46H,0 			//017E 	0846
		BTSS 	STATUS,0 		//017F 	1C03
		INCR	46H,0 			//0180 	0946
		SUBWR 	63H,0 			//0181 	0C63
		STR 	60H 			//0182 	01E0
		LDWI 	1H 			//0183 	2A01
		SUBWR 	60H,0 			//0184 	0C60
		LDWI 	0H 			//0185 	2A00
		BTSC 	STATUS,2 		//0186 	1503
		SUBWR 	5FH,0 			//0187 	0C5F
		BTSS 	STATUS,0 		//0188 	1C03
		LJUMP 	18CH 			//0189 	398C
		LDWI 	FFH 			//018A 	2AFF
		LJUMP 	18EH 			//018B 	398E
		LDR 	45H,0 			//018C 	0845
		SUBWR 	62H,0 			//018D 	0C62
		STR 	54H 			//018E 	01D4
		BCR 	42H,6 			//018F 	1342
		BCR 	42H,7 			//0190 	13C2
		LDR 	7BH,0 			//0191 	087B
		ADDWI 	1H 			//0192 	2701
		STR 	FSR 			//0193 	0184
		LCALL 	336H 			//0194 	3336
		STR 	5FH 			//0195 	01DF
		LDR 	54H,0 			//0196 	0854
		SUBWR 	5FH,0 			//0197 	0C5F
		BTSC 	STATUS,0 		//0198 	1403
		BSR 	42H,7 			//0199 	1BC2
		LDR 	7BH,0 			//019A 	087B
		ADDWI 	5H 			//019B 	2705
		STR 	FSR 			//019C 	0184
		LCALL 	336H 			//019D 	3336
		STR 	5FH 			//019E 	01DF
		LDR 	54H,0 			//019F 	0854
		SUBWR 	5FH,0 			//01A0 	0C5F
		BTSS 	STATUS,0 		//01A1 	1C03
		BSR 	42H,6 			//01A2 	1B42
		LDR 	50H,0 			//01A3 	0850
		STR 	5FH 			//01A4 	01DF
		INCR	7BH,0 			//01A5 	097B
		LJUMP 	1A9H 			//01A6 	39A9
		BCR 	STATUS,0 		//01A7 	1003
		RRR	5FH,1 			//01A8 	06DF
		ADDWI 	FFH 			//01A9 	27FF
		BTSS 	STATUS,2 		//01AA 	1D03
		LJUMP 	1A7H 			//01AB 	39A7
		BTSS 	5FH,0 			//01AC 	1C5F
		LJUMP 	1BDH 			//01AD 	39BD
		BTSS 	42H,7 			//01AE 	1FC2
		LJUMP 	1D1H 			//01AF 	39D1
		LDWI 	1H 			//01B0 	2A01
		STR 	5FH 			//01B1 	01DF
		INCR	7BH,0 			//01B2 	097B
		LJUMP 	1B6H 			//01B3 	39B6
		BCR 	STATUS,0 		//01B4 	1003
		RLR 	5FH,1 			//01B5 	05DF
		ADDWI 	FFH 			//01B6 	27FF
		BTSS 	STATUS,2 		//01B7 	1D03
		LJUMP 	1B4H 			//01B8 	39B4
		LDR 	5FH,0 			//01B9 	085F
		XORWI 	FFH 			//01BA 	26FF
		ANDWR 	50H,1 			//01BB 	02D0
		LJUMP 	1D1H 			//01BC 	39D1
		LDR 	7BH,0 			//01BD 	087B
		ADDWI 	5H 			//01BE 	2705
		STR 	FSR 			//01BF 	0184
		LCALL 	336H 			//01C0 	3336
		SUBWR 	54H,0 			//01C1 	0C54
		BTSC 	STATUS,0 		//01C2 	1403
		BCR 	7AH,0 			//01C3 	107A
		BTSS 	42H,6 			//01C4 	1F42
		LJUMP 	1D1H 			//01C5 	39D1
		LDWI 	1H 			//01C6 	2A01
		STR 	5FH 			//01C7 	01DF
		INCR	7BH,0 			//01C8 	097B
		LJUMP 	1CCH 			//01C9 	39CC
		BCR 	STATUS,0 		//01CA 	1003
		RLR 	5FH,1 			//01CB 	05DF
		ADDWI 	FFH 			//01CC 	27FF
		BTSS 	STATUS,2 		//01CD 	1D03
		LJUMP 	1CAH 			//01CE 	39CA
		LDR 	5FH,0 			//01CF 	085F
		IORWR 	50H,1 			//01D0 	03D0
		BTSC 	7AH,0 			//01D1 	147A
		LJUMP 	22CH 			//01D2 	3A2C
		BTSS 	42H,1 			//01D3 	1CC2
		LJUMP 	1D6H 			//01D4 	39D6
		LCALL 	344H 			//01D5 	3344
		LDR 	50H,0 			//01D6 	0850
		BTSS 	STATUS,2 		//01D7 	1D03
		LJUMP 	22AH 			//01D8 	3A2A
		BCR 	STATUS,0 		//01D9 	1003
		LCALL 	26AH 			//01DA 	326A
		LCALL 	25EH 			//01DB 	325E
		BTSC 	STATUS,0 		//01DC 	1403
		LJUMP 	1E2H 			//01DD 	39E2
		LCALL 	26FH 			//01DE 	326F
		LDR 	INDF,0 			//01DF 	0800
		SUBWR 	45H,0 			//01E0 	0C45
		STR 	52H 			//01E1 	01D2
		LDR 	7BH,0 			//01E2 	087B
		ADDWI 	5H 			//01E3 	2705
		STR 	FSR 			//01E4 	0184
		LCALL 	336H 			//01E5 	3336
		STR 	5FH 			//01E6 	01DF
		BCR 	STATUS,0 		//01E7 	1003
		RRR	5FH,0 			//01E8 	065F
		SUBWR 	52H,0 			//01E9 	0C52
		LDR 	4EH,0 			//01EA 	084E
		BTSS 	STATUS,0 		//01EB 	1C03
		LJUMP 	1FDH 			//01EC 	39FD
		ADDWI 	53H 			//01ED 	2753
		STR 	FSR 			//01EE 	0184
		INCR	INDF,1 			//01EF 	0980
		LDR 	4EH,0 			//01F0 	084E
		ADDWI 	53H 			//01F1 	2753
		STR 	FSR 			//01F2 	0184
		LDWI 	FH 			//01F3 	2A0F
		SUBWR 	INDF,0 		//01F4 	0C00
		BTSS 	STATUS,0 		//01F5 	1C03
		LJUMP 	200H 			//01F6 	3A00
		LCALL 	34BH 			//01F7 	334B
		STR 	INDF 			//01F8 	0180
		INCR	FSR,1 			//01F9 	0984
		LDR 	46H,0 			//01FA 	0846
		STR 	INDF 			//01FB 	0180
		LDR 	4EH,0 			//01FC 	084E
		ADDWI 	53H 			//01FD 	2753
		STR 	FSR 			//01FE 	0184
		CLRR 	INDF 			//01FF 	0100
		LDWI 	7H 			//0200 	2A07
		CLRR 	43H 			//0201 	0143
		CLRR 	44H 			//0202 	0144
		XORWR 	4FH,0 			//0203 	044F
		BTSS 	STATUS,2 		//0204 	1D03
		LJUMP 	246H 			//0205 	3A46
		LCALL 	26FH 			//0206 	326F
		LCALL 	25EH 			//0207 	325E
		BTSC 	STATUS,0 		//0208 	1403
		LJUMP 	214H 			//0209 	3A14
		BCR 	STATUS,0 		//020A 	1003
		RLR 	4EH,0 			//020B 	054E
		ADDWI 	47H 			//020C 	2747
		STR 	FSR 			//020D 	0184
		LDWI 	1H 			//020E 	2A01
		ADDWR 	INDF,1 		//020F 	0B80
		INCR	FSR,1 			//0210 	0984
		BTSC 	STATUS,0 		//0211 	1403
		INCR	INDF,1 			//0212 	0980
		LJUMP 	246H 			//0213 	3A46
		LCALL 	26FH 			//0214 	326F
		LDR 	INDF,0 			//0215 	0800
		STR 	5FH 			//0216 	01DF
		INCR	FSR,1 			//0217 	0984
		LDR 	INDF,0 			//0218 	0800
		STR 	60H 			//0219 	01E0
		IORWR 	5FH,0 			//021A 	035F
		BTSC 	STATUS,2 		//021B 	1503
		LJUMP 	246H 			//021C 	3A46
		BCR 	STATUS,0 		//021D 	1003
		RLR 	4EH,0 			//021E 	054E
		ADDWI 	47H 			//021F 	2747
		STR 	FSR 			//0220 	0184
		LDWI 	1H 			//0221 	2A01
		SUBWR 	INDF,1 		//0222 	0C80
		INCRSZ 	FSR,1 		//0223 	0A84
		LDWI 	0H 			//0224 	2A00
		BTSS 	STATUS,0 		//0225 	1C03
		DECR 	INDF,1 			//0226 	0D80
		SUBWR 	INDF,1 		//0227 	0C80
		DECR 	FSR,1 			//0228 	0D84
		LJUMP 	246H 			//0229 	3A46
		CLRR 	4FH 			//022A 	014F
		LJUMP 	246H 			//022B 	3A46
		LDWI 	28H 			//022C 	2A28
		INCR	51H,1 			//022D 	09D1
		SUBWR 	51H,0 			//022E 	0C51
		BTSS 	STATUS,0 		//022F 	1C03
		LJUMP 	23CH 			//0230 	3A3C
		LDWI 	29H 			//0231 	2A29
		SUBWR 	51H,0 			//0232 	0C51
		BTSS 	STATUS,0 		//0233 	1C03
		LJUMP 	237H 			//0234 	3A37
		CLRR 	51H 			//0235 	0151
		BCR 	STATUS,0 		//0236 	1003
		LCALL 	26AH 			//0237 	326A
		LCALL 	25EH 			//0238 	325E
		BTSS 	STATUS,0 		//0239 	1C03
		LJUMP 	20BH 			//023A 	3A0B
		LJUMP 	214H 			//023B 	3A14
		LDR 	46H,0 			//023C 	0846
		SUBWR 	63H,0 			//023D 	0C63
		BTSS 	STATUS,2 		//023E 	1D03
		LJUMP 	242H 			//023F 	3A42
		LDR 	45H,0 			//0240 	0845
		SUBWR 	62H,0 			//0241 	0C62
		BTSC 	STATUS,0 		//0242 	1403
		LJUMP 	246H 			//0243 	3A46
		LDWI 	28H 			//0244 	2A28
		STR 	51H 			//0245 	01D1
		INCR	4EH,1 			//0246 	09CE
		BTSC 	STATUS,2 		//0247 	1503
		LJUMP 	25BH 			//0248 	3A5B
		LDWI 	8H 			//0249 	2A08
		SUBWR 	4FH,0 			//024A 	0C4F
		BTSS 	STATUS,0 		//024B 	1C03
		LJUMP 	24EH 			//024C 	3A4E
		CLRR 	4FH 			//024D 	014F
		LDR 	43H,0 			//024E 	0843
		IORWR 	44H,0 			//024F 	0344
		BTSC 	STATUS,2 		//0250 	1503
		LJUMP 	254H 			//0251 	3A54
		CLRR 	43H 			//0252 	0143
		CLRR 	44H 			//0253 	0144
		INCR	4FH,1 			//0254 	09CF
		INCR	43H,1 			//0255 	09C3
		BTSC 	STATUS,2 		//0256 	1503
		INCR	44H,1 			//0257 	09C4
		CLRR 	4EH 			//0258 	014E
		LDR 	50H,0 			//0259 	0850
		STR 	4DH 			//025A 	01CD
		INCR	7BH,1 			//025B 	09FB
		LDR 	4DH,0 			//025C 	084D
		RET		 					//025D 	0004
		LDR 	INDF,0 			//025E 	0800
		STR 	5FH 			//025F 	01DF
		INCR	FSR,1 			//0260 	0984
		LDR 	INDF,0 			//0261 	0800
		STR 	60H 			//0262 	01E0
		LDR 	46H,0 			//0263 	0846
		SUBWR 	60H,0 			//0264 	0C60
		BTSS 	STATUS,2 		//0265 	1D03
		RET		 					//0266 	0004
		LDR 	45H,0 			//0267 	0845
		SUBWR 	5FH,0 			//0268 	0C5F
		RET		 					//0269 	0004
		RLR 	4EH,0 			//026A 	054E
		ADDWI 	47H 			//026B 	2747
		STR 	FSR 			//026C 	0184
		BCR 	STATUS,7 		//026D 	1383
		RET		 					//026E 	0004
		BCR 	STATUS,0 		//026F 	1003
		RLR 	4EH,0 			//0270 	054E
		ADDWI 	47H 			//0271 	2747
		STR 	FSR 			//0272 	0184
		RET		 					//0273 	0004
		BSR 	STATUS,5 		//0274 	1A83
		BCR 	6H,6 			//0275 	1306
		BSR 	6H,5 			//0276 	1A86
		BSR 	6H,4 			//0277 	1A06
		LCALL 	366H 			//0278 	3366
		LCALL 	36EH 			//0279 	336E
		BSR 	6H,4 			//027A 	1A06
		LCALL 	366H 			//027B 	3366
		BSR 	STATUS,5 		//027C 	1A83
		BCR 	6H,4 			//027D 	1206
		BSR 	6H,5 			//027E 	1A86
		BCR 	6H,6 			//027F 	1306
		LDWI 	1H 			//0280 	2A01
		STR 	73H 			//0281 	01F3
		INCR	7BH,0 			//0282 	097B
		LJUMP 	286H 			//0283 	3A86
		BCR 	STATUS,0 		//0284 	1003
		RLR 	73H,1 			//0285 	05F3
		ADDWI 	FFH 			//0286 	27FF
		BTSS 	STATUS,2 		//0287 	1D03
		LJUMP 	284H 			//0288 	3A84
		LDR 	73H,0 			//0289 	0873
		IORWR 	6H,1 			//028A 	0386
		BSR 	STATUS,5 		//028B 	1A83
		INCR	40H,1 			//028C 	09C0
		BTSC 	STATUS,2 		//028D 	1503
		INCR	41H,1 			//028E 	09C1
		BSR 	6H,6 			//028F 	1B06
		BSR 	6H,4 			//0290 	1A06
		BCR 	6H,4 			//0291 	1206
		BCR 	6H,6 			//0292 	1306
		BTSC 	EH,2 			//0293 	150E
		LJUMP 	28CH 			//0294 	3A8C
		LCALL 	37CH 			//0295 	337C
		BCR 	STATUS,5 		//0296 	1283
		LDR 	41H,0 			//0297 	0841
		STR 	46H 			//0298 	01C6
		LDR 	40H,0 			//0299 	0840
		STR 	45H 			//029A 	01C5
		RET		 					//029B 	0004
		CLRR 	76H 			//029C 	0176
		CLRR 	77H 			//029D 	0177
		CLRR 	78H 			//029E 	0178
		CLRWDT	 			//029F 	0001
		LCALL 	274H 			//02A0 	3274
		LDR 	40H,0 			//02A1 	0840
		ADDWR 	76H,1 			//02A2 	0BF6
		BTSC 	STATUS,0 		//02A3 	1403
		INCR	77H,1 			//02A4 	09F7
		LDR 	41H,0 			//02A5 	0841
		ADDWR 	77H,1 			//02A6 	0BF7
		LDWI 	4H 			//02A7 	2A04
		INCR	78H,1 			//02A8 	09F8
		SUBWR 	78H,0 			//02A9 	0C78
		BTSS 	STATUS,0 		//02AA 	1C03
		LJUMP 	29FH 			//02AB 	3A9F
		LDR 	77H,0 			//02AC 	0877
		STR 	75H 			//02AD 	01F5
		LDR 	76H,0 			//02AE 	0876
		STR 	74H 			//02AF 	01F4
		BCR 	STATUS,0 		//02B0 	1003
		RRR	75H,1 			//02B1 	06F5
		RRR	74H,1 			//02B2 	06F4
		BCR 	STATUS,0 		//02B3 	1003
		RRR	75H,1 			//02B4 	06F5
		RRR	74H,1 			//02B5 	06F4
		LDR 	74H,0 			//02B6 	0874
		STR 	45H 			//02B7 	01C5
		LDR 	75H,0 			//02B8 	0875
		STR 	46H 			//02B9 	01C6
		RET		 					//02BA 	0004

		//;main.c: 148: OSCCON = 0B01100000;
		LDWI 	60H 			//02BB 	2A60
		BSR 	STATUS,5 		//02BC 	1A83
		STR 	FH 			//02BD 	018F

		//;main.c: 149: OPTION = 0B00000100;
		LDWI 	4H 			//02BE 	2A04
		STR 	1H 			//02BF 	0181

		//;main.c: 150: TRISA = 0B00000000;
		CLRR 	5H 			//02C0 	0105

		//;main.c: 151: PORTA = 0B00000000;
		BCR 	STATUS,5 		//02C1 	1283
		CLRR 	5H 			//02C2 	0105

		//;main.c: 152: LVDCON = 0x03;
		LDWI 	3H 			//02C3 	2A03
		BSR 	STATUS,5 		//02C4 	1A83
		STR 	DH 			//02C5 	018D

		//;main.c: 153: PCON = 0x88;
		LDWI 	88H 			//02C6 	2A88
		STR 	EH 			//02C7 	018E

		//;main.c: 154: TRISA = 0B00000000;
		CLRR 	5H 			//02C8 	0105

		//;main.c: 155: PORTA = 0B00000000;
		BCR 	STATUS,5 		//02C9 	1283
		CLRR 	5H 			//02CA 	0105

		//;main.c: 156: OSCCON = 0B01110000;
		LDWI 	70H 			//02CB 	2A70
		BSR 	STATUS,5 		//02CC 	1A83
		STR 	FH 			//02CD 	018F

		//;main.c: 157: INTCON = 0;
		CLRR 	INTCON 			//02CE 	010B

		//;main.c: 158: TRISA = 0B00000000;
		CLRR 	5H 			//02CF 	0105

		//;main.c: 159: PORTA = 0B00000000;
		BCR 	STATUS,5 		//02D0 	1283
		CLRR 	5H 			//02D1 	0105

		//;main.c: 160: WPUA = 0B00000000;
		BSR 	STATUS,5 		//02D2 	1A83
		CLRR 	15H 			//02D3 	0115

		//;main.c: 161: PSRCA = 0B00000000;
		CLRR 	8H 			//02D4 	0108

		//;main.c: 162: TRISA = 0B00000000;
		CLRR 	5H 			//02D5 	0105

		//;main.c: 163: PORTA = 0B00000000;
		BCR 	STATUS,5 		//02D6 	1283
		CLRR 	5H 			//02D7 	0105
		RET		 					//02D8 	0004
		STR 	73H 			//02D9 	01F3

		//;main.c: 182: GIE = 0;
		BCR 	INTCON,7 		//02DA 	138B

		//;main.c: 183: while(GIE);
		BTSC 	INTCON,7 		//02DB 	178B
		LJUMP 	2DBH 			//02DC 	3ADB

		//;main.c: 184: EEADR = EEAddr;
		LDR 	73H,0 			//02DD 	0873
		BSR 	STATUS,5 		//02DE 	1A83
		STR 	1BH 			//02DF 	019B

		//;main.c: 185: EEDAT = Data;
		LDR 	72H,0 			//02E0 	0872
		STR 	1AH 			//02E1 	019A

		//;main.c: 186: EEIF = 0;
		BCR 	STATUS,5 		//02E2 	1283
		BCR 	CH,7 			//02E3 	138C

		//;main.c: 187: EECON1 |= 0x34;
		LDWI 	34H 			//02E4 	2A34
		BSR 	STATUS,5 		//02E5 	1A83
		IORWR 	1CH,1 			//02E6 	039C

		//;main.c: 188: WR = 1;
		BSR 	1DH,0 			//02E7 	181D

		//;main.c: 189: __nop();
		NOP		 					//02E8 	0000

		//;main.c: 190: __nop();
		NOP		 					//02E9 	0000

		//;main.c: 191: __nop();
		NOP		 					//02EA 	0000

		//;main.c: 192: __nop();
		NOP		 					//02EB 	0000
		CLRWDT	 			//02EC 	0001

		//;main.c: 194: while(WR);
		BSR 	STATUS,5 		//02ED 	1A83
		BTSC 	1DH,0 			//02EE 	141D
		LJUMP 	2EDH 			//02EF 	3AED

		//;main.c: 196: GIE = 1;
		BSR 	INTCON,7 		//02F0 	1B8B
		RET		 					//02F1 	0004

		//;main.c: 131: unsigned int a;
		//;main.c: 132: for(a=0;a<Time;a++)
		CLRR 	78H 			//02F2 	0178
		CLRR 	79H 			//02F3 	0179
		LDR 	77H,0 			//02F4 	0877
		SUBWR 	79H,0 			//02F5 	0C79
		BTSS 	STATUS,2 		//02F6 	1D03
		LJUMP 	2FAH 			//02F7 	3AFA
		LDR 	76H,0 			//02F8 	0876
		SUBWR 	78H,0 			//02F9 	0C78
		BTSC 	STATUS,0 		//02FA 	1403
		RET		 					//02FB 	0004

		//;main.c: 133: {
		//;main.c: 134: Delay_Us(1000);
		LDWI 	E8H 			//02FC 	2AE8
		STR 	72H 			//02FD 	01F2
		LDWI 	3H 			//02FE 	2A03
		STR 	73H 			//02FF 	01F3
		LCALL 	326H 			//0300 	3326
		INCR	78H,1 			//0301 	09F8
		BTSC 	STATUS,2 		//0302 	1503
		INCR	79H,1 			//0303 	09F9
		LJUMP 	2F4H 			//0304 	3AF4

		//;main.c: 20: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//0305 	168B
		BTSS 	INTCON,2 		//0306 	1D0B
		LJUMP 	30FH 			//0307 	3B0F

		//;main.c: 21: {
		//;main.c: 22: T0IF = 0;
		BCR 	INTCON,2 		//0308 	110B

		//;main.c: 23: TMR0 = 206;
		LDWI 	CEH 			//0309 	2ACE
		BCR 	STATUS,5 		//030A 	1283
		STR 	1H 			//030B 	0181

		//;main.c: 24: StartTouchTime++;
		INCR	4BH,1 			//030C 	09CB
		BTSC 	STATUS,2 		//030D 	1503
		INCR	4CH,1 			//030E 	09CC
		LDR 	71H,0 			//030F 	0871
		STR 	PCLATH 			//0310 	018A
		SWAPR 	70H,0 			//0311 	0770
		STR 	STATUS 			//0312 	0183
		SWAPR 	7EH,1 			//0313 	07FE
		SWAPR 	7EH,0 			//0314 	077E
		RETI		 			//0315 	0009
		BSR 	STATUS,5 		//0316 	1A83
		BSR 	5H,3 			//0317 	1985
		CLRR 	7BH 			//0318 	017B
		BCR 	STATUS,5 		//0319 	1283
		CLRR 	4EH 			//031A 	014E
		BSR 	42H,1 			//031B 	18C2
		CLRR 	79H 			//031C 	0179
		LCALL 	150H 			//031D 	3150
		INCR	79H,1 			//031E 	09F9
		LDR 	79H,0 			//031F 	0879
		BTSC 	STATUS,2 		//0320 	1503
		LJUMP 	31DH 			//0321 	3B1D
		BCR 	42H,1 			//0322 	10C2
		CLRR 	7BH 			//0323 	017B
		CLRR 	4EH 			//0324 	014E
		RET		 					//0325 	0004

		//;main.c: 121: unsigned int a;
		//;main.c: 122: for(a=0;a<Time;a++)
		CLRR 	74H 			//0326 	0174
		CLRR 	75H 			//0327 	0175
		LDR 	73H,0 			//0328 	0873
		SUBWR 	75H,0 			//0329 	0C75
		BTSS 	STATUS,2 		//032A 	1D03
		LJUMP 	32EH 			//032B 	3B2E
		LDR 	72H,0 			//032C 	0872
		SUBWR 	74H,0 			//032D 	0C74
		BTSC 	STATUS,0 		//032E 	1403
		RET		 					//032F 	0004

		//;main.c: 123: {
		//;main.c: 124: __nop();
		NOP		 					//0330 	0000
		CLRWDT	 			//0331 	0001
		INCR	74H,1 			//0332 	09F4
		BTSC 	STATUS,2 		//0333 	1503
		INCR	75H,1 			//0334 	09F5
		LJUMP 	328H 			//0335 	3B28
		LDWI 	3H 			//0336 	2A03
		STR 	PCLATH 			//0337 	018A
		LDR 	FSR,0 			//0338 	0804
		INCR	FSR,1 			//0339 	0984
		ADDWR 	PCL,1 			//033A 	0B82
		RETW 	0H 			//033B 	2100
		RETW 	0H 			//033C 	2100
		RETW 	0H 			//033D 	2100
		RETW 	0H 			//033E 	2100
		RETW 	1BH 			//033F 	211B
		RETW 	0H 			//0340 	2100
		RETW 	0H 			//0341 	2100
		RETW 	0H 			//0342 	2100
		RETW 	2CH 			//0343 	212C
		LCALL 	34BH 			//0344 	334B
		BCR 	STATUS,7 		//0345 	1383
		STR 	INDF 			//0346 	0180
		INCR	FSR,1 			//0347 	0984
		LDR 	46H,0 			//0348 	0846
		STR 	INDF 			//0349 	0180
		RET		 					//034A 	0004
		BCR 	STATUS,0 		//034B 	1003
		RLR 	4EH,0 			//034C 	054E
		ADDWI 	47H 			//034D 	2747
		STR 	FSR 			//034E 	0184
		LDR 	45H,0 			//034F 	0845
		RET		 					//0350 	0004
		STR 	72H 			//0351 	01F2

		//;main.c: 168: unsigned char ReEEPROMread;
		//;main.c: 169: EEADR = EEAddr;
		BSR 	STATUS,5 		//0352 	1A83
		STR 	1BH 			//0353 	019B

		//;main.c: 170: RD=1;
		BSR 	1CH,0 			//0354 	181C

		//;main.c: 171: __nop();
		NOP		 					//0355 	0000

		//;main.c: 172: __nop();
		NOP		 					//0356 	0000

		//;main.c: 173: __nop();
		NOP		 					//0357 	0000

		//;main.c: 174: __nop();
		NOP		 					//0358 	0000
		CLRWDT	 			//0359 	0001

		//;main.c: 176: ReEEPROMread =EEDAT;
		BSR 	STATUS,5 		//035A 	1A83
		LDR 	1AH,0 			//035B 	081A
		STR 	73H 			//035C 	01F3

		//;main.c: 177: return ReEEPROMread;
		RET		 					//035D 	0004
		CLRWDT	 			//035E 	0001
		CLRR 	INDF 			//035F 	0100
		INCR	FSR,1 			//0360 	0984
		XORWR 	FSR,0 			//0361 	0404
		BTSC 	STATUS,2 		//0362 	1503
		RETW 	0H 			//0363 	2100
		XORWR 	FSR,0 			//0364 	0404
		LJUMP 	35FH 			//0365 	3B5F
		CLRR 	72H 			//0366 	0172
		NOP		 					//0367 	0000
		LDWI 	19H 			//0368 	2A19
		INCR	72H,1 			//0369 	09F2
		SUBWR 	72H,0 			//036A 	0C72
		BTSC 	STATUS,0 		//036B 	1403
		RET		 					//036C 	0004
		LJUMP 	367H 			//036D 	3B67
		BCR 	STATUS,5 		//036E 	1283
		CLRR 	40H 			//036F 	0140
		CLRR 	41H 			//0370 	0141
		BSR 	STATUS,5 		//0371 	1A83
		BSR 	EH,3 			//0372 	198E
		CLRR 	6H 			//0373 	0106
		RET		 					//0374 	0004

		//;main.c: 140: TMR0 = 206;
		LDWI 	CEH 			//0375 	2ACE
		BCR 	STATUS,5 		//0376 	1283
		STR 	1H 			//0377 	0181

		//;main.c: 141: T0IF = 0;
		BCR 	INTCON,2 		//0378 	110B

		//;main.c: 142: T0IE = 1;
		BSR 	INTCON,5 		//0379 	1A8B

		//;main.c: 143: GIE = 1;
		BSR 	INTCON,7 		//037A 	1B8B
		RET		 					//037B 	0004
		ORG		037CH
		BSR 	STATUS,5 		//037C 	1A83
		CLRR 	6H 			//037D 	0106
		BSR 	6H,4 			//037E 	1A06
		BCR 	EH,3 			//037F 	118E
		RET		 					//0380 	0004
			END
