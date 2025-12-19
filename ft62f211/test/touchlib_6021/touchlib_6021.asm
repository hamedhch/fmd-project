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
		LJUMP 	251H 			//0009 	3A51
		LJUMP 	0BH 			//000A 	380B
		LDWI 	1H 			//000B 	2A01
		STR 	64H 			//000C 	01E4
		LDWI 	43H 			//000D 	2A43
		BCR 	STATUS,7 		//000E 	1383
		STR 	FSR 			//000F 	0184
		LDWI 	5FH 			//0010 	2A5F
		LCALL 	2AAH 			//0011 	32AA
		CLRR 	7BH 			//0012 	017B
		CLRR 	7AH 			//0013 	017A
		CLRR 	STATUS 			//0014 	0103
		LJUMP 	13AH 			//0015 	393A
		INCR	7BH,0 			//0016 	097B
		STR 	5FH 			//0017 	01DF
		LDWI 	4H 			//0018 	2A04
		STR 	60H 			//0019 	01E0
		LDWI 	0H 			//001A 	2A00
		STR 	61H 			//001B 	01E1
		LJUMP 	20H 			//001C 	3820
		RLR 	61H,0 			//001D 	0561
		RRR	61H,1 			//001E 	06E1
		RRR	60H,1 			//001F 	06E0
		DECRSZ 	5FH,1 		//0020 	0EDF
		LJUMP 	1DH 			//0021 	381D
		BCR 	STATUS,5 		//0022 	1283
		BTSC 	60H,0 			//0023 	1460
		LJUMP 	2CH 			//0024 	382C
		LDWI 	5H 			//0025 	2A05
		INCR	7BH,1 			//0026 	09FB
		SUBWR 	7BH,0 			//0027 	0C7B
		BTSS 	STATUS,0 		//0028 	1C03
		LJUMP 	16H 			//0029 	3816
		CLRR 	7BH 			//002A 	017B
		LJUMP 	16H 			//002B 	3816
		BCR 	STATUS,0 		//002C 	1003
		LCALL 	130H 			//002D 	3130
		LDR 	INDF,0 			//002E 	0800
		STR 	62H 			//002F 	01E2
		INCR	FSR,1 			//0030 	0984
		LDR 	INDF,0 			//0031 	0800
		STR 	63H 			//0032 	01E3
		BTSS 	7AH,0 			//0033 	1C7A
		LJUMP 	37H 			//0034 	3837
		LCALL 	1C0H 			//0035 	31C0
		LJUMP 	38H 			//0036 	3838
		LCALL 	1E8H 			//0037 	31E8
		CLRR 	54H 			//0038 	0154
		LDR 	63H,0 			//0039 	0863
		SUBWR 	46H,0 			//003A 	0C46
		BTSS 	STATUS,2 		//003B 	1D03
		LJUMP 	3FH 			//003C 	383F
		LDR 	62H,0 			//003D 	0862
		SUBWR 	45H,0 			//003E 	0C45
		BTSC 	STATUS,0 		//003F 	1403
		LJUMP 	55H 			//0040 	3855
		LDR 	45H,0 			//0041 	0845
		SUBWR 	62H,0 			//0042 	0C62
		STR 	5FH 			//0043 	01DF
		LDR 	46H,0 			//0044 	0846
		BTSS 	STATUS,0 		//0045 	1C03
		INCR	46H,0 			//0046 	0946
		SUBWR 	63H,0 			//0047 	0C63
		STR 	60H 			//0048 	01E0
		LDWI 	1H 			//0049 	2A01
		SUBWR 	60H,0 			//004A 	0C60
		LDWI 	0H 			//004B 	2A00
		BTSC 	STATUS,2 		//004C 	1503
		SUBWR 	5FH,0 			//004D 	0C5F
		BTSS 	STATUS,0 		//004E 	1C03
		LJUMP 	52H 			//004F 	3852
		LDWI 	FFH 			//0050 	2AFF
		LJUMP 	54H 			//0051 	3854
		LDR 	45H,0 			//0052 	0845
		SUBWR 	62H,0 			//0053 	0C62
		STR 	54H 			//0054 	01D4
		BCR 	42H,6 			//0055 	1342
		BCR 	42H,7 			//0056 	13C2
		LDR 	7BH,0 			//0057 	087B
		ADDWI 	1H 			//0058 	2701
		STR 	FSR 			//0059 	0184
		LCALL 	282H 			//005A 	3282
		STR 	5FH 			//005B 	01DF
		LDR 	54H,0 			//005C 	0854
		SUBWR 	5FH,0 			//005D 	0C5F
		BTSC 	STATUS,0 		//005E 	1403
		BSR 	42H,7 			//005F 	1BC2
		LDR 	7BH,0 			//0060 	087B
		ADDWI 	5H 			//0061 	2705
		STR 	FSR 			//0062 	0184
		LCALL 	282H 			//0063 	3282
		STR 	5FH 			//0064 	01DF
		LDR 	54H,0 			//0065 	0854
		SUBWR 	5FH,0 			//0066 	0C5F
		BTSS 	STATUS,0 		//0067 	1C03
		BSR 	42H,6 			//0068 	1B42
		LDR 	50H,0 			//0069 	0850
		STR 	5FH 			//006A 	01DF
		INCR	7BH,0 			//006B 	097B
		LJUMP 	6FH 			//006C 	386F
		BCR 	STATUS,0 		//006D 	1003
		RRR	5FH,1 			//006E 	06DF
		ADDWI 	FFH 			//006F 	27FF
		BTSS 	STATUS,2 		//0070 	1D03
		LJUMP 	6DH 			//0071 	386D
		BTSS 	5FH,0 			//0072 	1C5F
		LJUMP 	83H 			//0073 	3883
		BTSS 	42H,7 			//0074 	1FC2
		LJUMP 	97H 			//0075 	3897
		LDWI 	1H 			//0076 	2A01
		STR 	5FH 			//0077 	01DF
		INCR	7BH,0 			//0078 	097B
		LJUMP 	7CH 			//0079 	387C
		BCR 	STATUS,0 		//007A 	1003
		RLR 	5FH,1 			//007B 	05DF
		ADDWI 	FFH 			//007C 	27FF
		BTSS 	STATUS,2 		//007D 	1D03
		LJUMP 	7AH 			//007E 	387A
		LDR 	5FH,0 			//007F 	085F
		XORWI 	FFH 			//0080 	26FF
		ANDWR 	50H,1 			//0081 	02D0
		LJUMP 	97H 			//0082 	3897
		LDR 	7BH,0 			//0083 	087B
		ADDWI 	5H 			//0084 	2705
		STR 	FSR 			//0085 	0184
		LCALL 	282H 			//0086 	3282
		SUBWR 	54H,0 			//0087 	0C54
		BTSC 	STATUS,0 		//0088 	1403
		BCR 	7AH,0 			//0089 	107A
		BTSS 	42H,6 			//008A 	1F42
		LJUMP 	97H 			//008B 	3897
		LDWI 	1H 			//008C 	2A01
		STR 	5FH 			//008D 	01DF
		INCR	7BH,0 			//008E 	097B
		LJUMP 	92H 			//008F 	3892
		BCR 	STATUS,0 		//0090 	1003
		RLR 	5FH,1 			//0091 	05DF
		ADDWI 	FFH 			//0092 	27FF
		BTSS 	STATUS,2 		//0093 	1D03
		LJUMP 	90H 			//0094 	3890
		LDR 	5FH,0 			//0095 	085F
		IORWR 	50H,1 			//0096 	03D0
		BTSC 	7AH,0 			//0097 	147A
		LJUMP 	F2H 			//0098 	38F2
		BTSS 	42H,1 			//0099 	1CC2
		LJUMP 	9CH 			//009A 	389C
		LCALL 	290H 			//009B 	3290
		LDR 	50H,0 			//009C 	0850
		BTSS 	STATUS,2 		//009D 	1D03
		LJUMP 	F0H 			//009E 	38F0
		BCR 	STATUS,0 		//009F 	1003
		LCALL 	130H 			//00A0 	3130
		LCALL 	124H 			//00A1 	3124
		BTSC 	STATUS,0 		//00A2 	1403
		LJUMP 	A8H 			//00A3 	38A8
		LCALL 	135H 			//00A4 	3135
		LDR 	INDF,0 			//00A5 	0800
		SUBWR 	45H,0 			//00A6 	0C45
		STR 	52H 			//00A7 	01D2
		LDR 	7BH,0 			//00A8 	087B
		ADDWI 	5H 			//00A9 	2705
		STR 	FSR 			//00AA 	0184
		LCALL 	282H 			//00AB 	3282
		STR 	5FH 			//00AC 	01DF
		BCR 	STATUS,0 		//00AD 	1003
		RRR	5FH,0 			//00AE 	065F
		SUBWR 	52H,0 			//00AF 	0C52
		LDR 	4EH,0 			//00B0 	084E
		BTSS 	STATUS,0 		//00B1 	1C03
		LJUMP 	C3H 			//00B2 	38C3
		ADDWI 	53H 			//00B3 	2753
		STR 	FSR 			//00B4 	0184
		INCR	INDF,1 			//00B5 	0980
		LDR 	4EH,0 			//00B6 	084E
		ADDWI 	53H 			//00B7 	2753
		STR 	FSR 			//00B8 	0184
		LDWI 	6H 			//00B9 	2A06
		SUBWR 	INDF,0 		//00BA 	0C00
		BTSS 	STATUS,0 		//00BB 	1C03
		LJUMP 	C6H 			//00BC 	38C6
		LCALL 	297H 			//00BD 	3297
		STR 	INDF 			//00BE 	0180
		INCR	FSR,1 			//00BF 	0984
		LDR 	46H,0 			//00C0 	0846
		STR 	INDF 			//00C1 	0180
		LDR 	4EH,0 			//00C2 	084E
		ADDWI 	53H 			//00C3 	2753
		STR 	FSR 			//00C4 	0184
		CLRR 	INDF 			//00C5 	0100
		LDWI 	3H 			//00C6 	2A03
		CLRR 	43H 			//00C7 	0143
		CLRR 	44H 			//00C8 	0144
		XORWR 	4FH,0 			//00C9 	044F
		BTSS 	STATUS,2 		//00CA 	1D03
		LJUMP 	10CH 			//00CB 	390C
		LCALL 	135H 			//00CC 	3135
		LCALL 	124H 			//00CD 	3124
		BTSC 	STATUS,0 		//00CE 	1403
		LJUMP 	DAH 			//00CF 	38DA
		BCR 	STATUS,0 		//00D0 	1003
		RLR 	4EH,0 			//00D1 	054E
		ADDWI 	47H 			//00D2 	2747
		STR 	FSR 			//00D3 	0184
		LDWI 	1H 			//00D4 	2A01
		ADDWR 	INDF,1 		//00D5 	0B80
		INCR	FSR,1 			//00D6 	0984
		BTSC 	STATUS,0 		//00D7 	1403
		INCR	INDF,1 			//00D8 	0980
		LJUMP 	10CH 			//00D9 	390C
		LCALL 	135H 			//00DA 	3135
		LDR 	INDF,0 			//00DB 	0800
		STR 	5FH 			//00DC 	01DF
		INCR	FSR,1 			//00DD 	0984
		LDR 	INDF,0 			//00DE 	0800
		STR 	60H 			//00DF 	01E0
		IORWR 	5FH,0 			//00E0 	035F
		BTSC 	STATUS,2 		//00E1 	1503
		LJUMP 	10CH 			//00E2 	390C
		BCR 	STATUS,0 		//00E3 	1003
		RLR 	4EH,0 			//00E4 	054E
		ADDWI 	47H 			//00E5 	2747
		STR 	FSR 			//00E6 	0184
		LDWI 	1H 			//00E7 	2A01
		SUBWR 	INDF,1 		//00E8 	0C80
		INCRSZ 	FSR,1 		//00E9 	0A84
		LDWI 	0H 			//00EA 	2A00
		BTSS 	STATUS,0 		//00EB 	1C03
		DECR 	INDF,1 			//00EC 	0D80
		SUBWR 	INDF,1 		//00ED 	0C80
		DECR 	FSR,1 			//00EE 	0D84
		LJUMP 	10CH 			//00EF 	390C
		CLRR 	4FH 			//00F0 	014F
		LJUMP 	10CH 			//00F1 	390C
		LDWI 	28H 			//00F2 	2A28
		INCR	51H,1 			//00F3 	09D1
		SUBWR 	51H,0 			//00F4 	0C51
		BTSS 	STATUS,0 		//00F5 	1C03
		LJUMP 	102H 			//00F6 	3902
		LDWI 	29H 			//00F7 	2A29
		SUBWR 	51H,0 			//00F8 	0C51
		BTSS 	STATUS,0 		//00F9 	1C03
		LJUMP 	FDH 			//00FA 	38FD
		CLRR 	51H 			//00FB 	0151
		BCR 	STATUS,0 		//00FC 	1003
		LCALL 	130H 			//00FD 	3130
		LCALL 	124H 			//00FE 	3124
		BTSS 	STATUS,0 		//00FF 	1C03
		LJUMP 	D1H 			//0100 	38D1
		LJUMP 	DAH 			//0101 	38DA
		LDR 	46H,0 			//0102 	0846
		SUBWR 	63H,0 			//0103 	0C63
		BTSS 	STATUS,2 		//0104 	1D03
		LJUMP 	108H 			//0105 	3908
		LDR 	45H,0 			//0106 	0845
		SUBWR 	62H,0 			//0107 	0C62
		BTSC 	STATUS,0 		//0108 	1403
		LJUMP 	10CH 			//0109 	390C
		LDWI 	28H 			//010A 	2A28
		STR 	51H 			//010B 	01D1
		INCR	4EH,1 			//010C 	09CE
		BTSC 	STATUS,2 		//010D 	1503
		LJUMP 	121H 			//010E 	3921
		LDWI 	4H 			//010F 	2A04
		SUBWR 	4FH,0 			//0110 	0C4F
		BTSS 	STATUS,0 		//0111 	1C03
		LJUMP 	114H 			//0112 	3914
		CLRR 	4FH 			//0113 	014F
		LDR 	43H,0 			//0114 	0843
		IORWR 	44H,0 			//0115 	0344
		BTSC 	STATUS,2 		//0116 	1503
		LJUMP 	11AH 			//0117 	391A
		CLRR 	43H 			//0118 	0143
		CLRR 	44H 			//0119 	0144
		INCR	4FH,1 			//011A 	09CF
		INCR	43H,1 			//011B 	09C3
		BTSC 	STATUS,2 		//011C 	1503
		INCR	44H,1 			//011D 	09C4
		CLRR 	4EH 			//011E 	014E
		LDR 	50H,0 			//011F 	0850
		STR 	4DH 			//0120 	01CD
		INCR	7BH,1 			//0121 	09FB
		LDR 	4DH,0 			//0122 	084D
		RET		 					//0123 	0004
		LDR 	INDF,0 			//0124 	0800
		STR 	5FH 			//0125 	01DF
		INCR	FSR,1 			//0126 	0984
		LDR 	INDF,0 			//0127 	0800
		STR 	60H 			//0128 	01E0
		LDR 	46H,0 			//0129 	0846
		SUBWR 	60H,0 			//012A 	0C60
		BTSS 	STATUS,2 		//012B 	1D03
		RET		 					//012C 	0004
		LDR 	45H,0 			//012D 	0845
		SUBWR 	5FH,0 			//012E 	0C5F
		RET		 					//012F 	0004
		RLR 	4EH,0 			//0130 	054E
		ADDWI 	47H 			//0131 	2747
		STR 	FSR 			//0132 	0184
		BCR 	STATUS,7 		//0133 	1383
		RET		 					//0134 	0004
		BCR 	STATUS,0 		//0135 	1003
		RLR 	4EH,0 			//0136 	054E
		ADDWI 	47H 			//0137 	2747
		STR 	FSR 			//0138 	0184
		RET		 					//0139 	0004

		//;main.c: 201: TRISA = 0B00000000;
		//;main.c: 202: PORTA = 0B00000000;
		LCALL 	1BBH 			//013A 	31BB

		//;main.c: 203: SYS_INITIAL();
		LCALL 	207H 			//013B 	3207

		//;main.c: 204: DelayMs(200);
		LDWI 	C8H 			//013C 	2AC8
		STR 	76H 			//013D 	01F6
		CLRR 	77H 			//013E 	0177
		LCALL 	23EH 			//013F 	323E

		//;main.c: 206: Effect=EEPROMread(0X10);
		LDWI 	10H 			//0140 	2A10
		LCALL 	29DH 			//0141 	329D
		BCR 	STATUS,5 		//0142 	1283
		STR 	5AH 			//0143 	01DA

		//;main.c: 207: TRISA = 0B00000000;
		BSR 	STATUS,5 		//0144 	1A83
		CLRR 	5H 			//0145 	0105

		//;main.c: 208: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0146 	1283
		CLRR 	5H 			//0147 	0105

		//;main.c: 209: if(Effect>100 & Effect< 110){Effect=120; while(1);}
		LDWI 	65H 			//0148 	2A65
		SUBWR 	5AH,0 			//0149 	0C5A
		BTSS 	STATUS,0 		//014A 	1C03
		LJUMP 	153H 			//014B 	3953
		LDWI 	6EH 			//014C 	2A6E
		SUBWR 	5AH,0 			//014D 	0C5A
		BTSC 	STATUS,0 		//014E 	1403
		LJUMP 	153H 			//014F 	3953
		LDWI 	78H 			//0150 	2A78
		STR 	5AH 			//0151 	01DA
		LJUMP 	152H 			//0152 	3952

		//;main.c: 210: else{Effect++;EEPROMwrite(0x10,Effect);};
		INCR	5AH,1 			//0153 	09DA
		LDR 	5AH,0 			//0154 	085A
		STR 	72H 			//0155 	01F2
		LDWI 	10H 			//0156 	2A10
		LCALL 	225H 			//0157 	3225

		//;main.c: 211: if(Effect>250){Effect=0;}
		LDWI 	FBH 			//0158 	2AFB
		BCR 	STATUS,5 		//0159 	1283
		SUBWR 	5AH,0 			//015A 	0C5A
		BTSC 	STATUS,0 		//015B 	1403
		CLRR 	5AH 			//015C 	015A

		//;main.c: 212: TRISA = 0B00000000;
		BSR 	STATUS,5 		//015D 	1A83
		CLRR 	5H 			//015E 	0105

		//;main.c: 213: PORTA = 0B00000000;
		BCR 	STATUS,5 		//015F 	1283
		CLRR 	5H 			//0160 	0105

		//;main.c: 215: Mute=EEPROMread(0X20);
		LDWI 	20H 			//0161 	2A20
		LCALL 	29DH 			//0162 	329D
		BCR 	STATUS,5 		//0163 	1283
		STR 	59H 			//0164 	01D9

		//;main.c: 216: if(Mute>2){Mute=1;}
		LDWI 	3H 			//0165 	2A03
		SUBWR 	59H,0 			//0166 	0C59
		BTSS 	STATUS,0 		//0167 	1C03
		LJUMP 	16BH 			//0168 	396B
		LDWI 	1H 			//0169 	2A01
		STR 	59H 			//016A 	01D9

		//;main.c: 217: TRISA = 0B00000000;
		//;main.c: 218: PORTA = 0B00000000;
		LCALL 	1BBH 			//016B 	31BB

		//;main.c: 221: TIMER0_INITIAL();
		LCALL 	2C1H 			//016C 	32C1

		//;main.c: 222: Touch_init();
		LCALL 	262H 			//016D 	3262

		//;main.c: 223: State=0;
		CLRR 	5CH 			//016E 	015C

		//;main.c: 225: {
		//;main.c: 226: Delay_Us(10);
		LDWI 	AH 			//016F 	2A0A
		STR 	72H 			//0170 	01F2
		CLRR 	73H 			//0171 	0173
		LCALL 	272H 			//0172 	3272

		//;main.c: 227: if(StartTouchTime >= (2500/12/1))
		LDWI 	0H 			//0173 	2A00
		BCR 	STATUS,5 		//0174 	1283
		SUBWR 	4CH,0 			//0175 	0C4C
		LDWI 	D0H 			//0176 	2AD0
		BTSC 	STATUS,2 		//0177 	1503
		SUBWR 	4BH,0 			//0178 	0C4B
		BTSS 	STATUS,0 		//0179 	1C03
		LJUMP 	17FH 			//017A 	397F

		//;main.c: 228: {
		//;main.c: 229: StartTouchTime = 0;
		CLRR 	4BH 			//017B 	014B
		CLRR 	4CH 			//017C 	014C

		//;main.c: 230: GKeyValue = TouchKeyScan();
		LCALL 	16H 			//017D 	3016
		STR 	5EH 			//017E 	01DE

		//;main.c: 231: }
		//;main.c: 232: if(GKeyValue!=0)
		LDR 	5EH,0 			//017F 	085E
		BTSC 	STATUS,2 		//0180 	1503
		LJUMP 	1B7H 			//0181 	39B7

		//;main.c: 233: {
		//;main.c: 234: if(GKeyValue==4)
		LDWI 	4H 			//0182 	2A04
		XORWR 	5EH,0 			//0183 	045E
		BTSS 	STATUS,2 		//0184 	1D03
		LJUMP 	1AAH 			//0185 	39AA

		//;main.c: 235: {
		//;main.c: 236: if(CountKey<1005)
		LDWI 	3H 			//0186 	2A03
		SUBWR 	4AH,0 			//0187 	0C4A
		LDWI 	EDH 			//0188 	2AED
		BTSC 	STATUS,2 		//0189 	1503
		SUBWR 	49H,0 			//018A 	0C49
		BTSC 	STATUS,0 		//018B 	1403
		LJUMP 	1AAH 			//018C 	39AA

		//;main.c: 237: {
		//;main.c: 238: CountKey++;
		INCR	49H,1 			//018D 	09C9
		BTSC 	STATUS,2 		//018E 	1503
		INCR	4AH,1 			//018F 	09CA

		//;main.c: 239: if(CountKey>1000)
		LDWI 	3H 			//0190 	2A03
		SUBWR 	4AH,0 			//0191 	0C4A
		LDWI 	E9H 			//0192 	2AE9
		BTSC 	STATUS,2 		//0193 	1503
		SUBWR 	49H,0 			//0194 	0C49
		BTSS 	STATUS,0 		//0195 	1C03
		LJUMP 	1AAH 			//0196 	39AA

		//;main.c: 240: {
		//;main.c: 241: CountKey=1010;
		LDWI 	F2H 			//0197 	2AF2
		STR 	49H 			//0198 	01C9
		LDWI 	3H 			//0199 	2A03
		STR 	4AH 			//019A 	01CA

		//;main.c: 243: if(State==1)
		DECRSZ 	5CH,0 		//019B 	0E5C
		LJUMP 	1A2H 			//019C 	39A2

		//;main.c: 244: {
		//;main.c: 245: PA3=0;__nop();;
		BCR 	5H,3 			//019D 	1185
		NOP		 					//019E 	0000

		//;main.c: 246: State=0;
		BCR 	STATUS,5 		//019F 	1283
		CLRR 	5CH 			//01A0 	015C

		//;main.c: 250: }
		LJUMP 	1AAH 			//01A1 	39AA

		//;main.c: 251: else if(State==0)
		LDR 	5CH,0 			//01A2 	085C
		BTSS 	STATUS,2 		//01A3 	1D03
		LJUMP 	1AAH 			//01A4 	39AA

		//;main.c: 252: {
		//;main.c: 253: PA3=1;__nop();;
		BSR 	5H,3 			//01A5 	1985
		NOP		 					//01A6 	0000

		//;main.c: 254: State=1;
		LDWI 	1H 			//01A7 	2A01
		BCR 	STATUS,5 		//01A8 	1283
		STR 	5CH 			//01A9 	01DC

		//;main.c: 258: }
		//;main.c: 260: }
		//;main.c: 261: }
		//;main.c: 262: }
		//;main.c: 263: if(Last!=GKeyValue)
		LDR 	5DH,0 			//01AA 	085D
		XORWR 	5EH,0 			//01AB 	045E
		BTSC 	STATUS,2 		//01AC 	1503
		LJUMP 	1B3H 			//01AD 	39B3

		//;main.c: 264: {
		//;main.c: 265: if(GKeyValue==4)
		LDWI 	4H 			//01AE 	2A04
		XORWR 	5EH,0 			//01AF 	045E
		BTSS 	STATUS,2 		//01B0 	1D03
		LJUMP 	1B3H 			//01B1 	39B3

		//;main.c: 266: {
		//;main.c: 267: __nop();
		NOP		 					//01B2 	0000

		//;main.c: 295: }
		//;main.c: 296: }
		//;main.c: 297: Last=GKeyValue;
		BCR 	STATUS,5 		//01B3 	1283
		LDR 	5EH,0 			//01B4 	085E
		STR 	5DH 			//01B5 	01DD

		//;main.c: 299: }
		LJUMP 	16FH 			//01B6 	396F

		//;main.c: 300: else
		//;main.c: 301: {
		//;main.c: 302: Last=0;
		CLRR 	5DH 			//01B7 	015D

		//;main.c: 307: }
		//;main.c: 308: CountKey=0;
		CLRR 	49H 			//01B8 	0149
		CLRR 	4AH 			//01B9 	014A
		LJUMP 	16FH 			//01BA 	396F
		BSR 	STATUS,5 		//01BB 	1A83
		CLRR 	5H 			//01BC 	0105
		BCR 	STATUS,5 		//01BD 	1283
		CLRR 	5H 			//01BE 	0105
		RET		 					//01BF 	0004
		BSR 	STATUS,5 		//01C0 	1A83
		BCR 	6H,6 			//01C1 	1306
		BSR 	6H,5 			//01C2 	1A86
		BSR 	6H,4 			//01C3 	1A06
		LCALL 	2B2H 			//01C4 	32B2
		LCALL 	2BAH 			//01C5 	32BA
		BSR 	6H,4 			//01C6 	1A06
		LCALL 	2B2H 			//01C7 	32B2
		BSR 	STATUS,5 		//01C8 	1A83
		BCR 	6H,4 			//01C9 	1206
		BSR 	6H,5 			//01CA 	1A86
		BCR 	6H,6 			//01CB 	1306
		LDWI 	1H 			//01CC 	2A01
		STR 	73H 			//01CD 	01F3
		INCR	7BH,0 			//01CE 	097B
		LJUMP 	1D2H 			//01CF 	39D2
		BCR 	STATUS,0 		//01D0 	1003
		RLR 	73H,1 			//01D1 	05F3
		ADDWI 	FFH 			//01D2 	27FF
		BTSS 	STATUS,2 		//01D3 	1D03
		LJUMP 	1D0H 			//01D4 	39D0
		LDR 	73H,0 			//01D5 	0873
		IORWR 	6H,1 			//01D6 	0386
		BSR 	STATUS,5 		//01D7 	1A83
		INCR	40H,1 			//01D8 	09C0
		BTSC 	STATUS,2 		//01D9 	1503
		INCR	41H,1 			//01DA 	09C1
		BSR 	6H,6 			//01DB 	1B06
		BSR 	6H,4 			//01DC 	1A06
		BCR 	6H,4 			//01DD 	1206
		BCR 	6H,6 			//01DE 	1306
		BTSC 	EH,2 			//01DF 	150E
		LJUMP 	1D8H 			//01E0 	39D8
		LCALL 	2C7H 			//01E1 	32C7
		BCR 	STATUS,5 		//01E2 	1283
		LDR 	41H,0 			//01E3 	0841
		STR 	46H 			//01E4 	01C6
		LDR 	40H,0 			//01E5 	0840
		STR 	45H 			//01E6 	01C5
		RET		 					//01E7 	0004
		CLRR 	76H 			//01E8 	0176
		CLRR 	77H 			//01E9 	0177
		CLRR 	78H 			//01EA 	0178
		CLRWDT	 			//01EB 	0001
		LCALL 	1C0H 			//01EC 	31C0
		LDR 	40H,0 			//01ED 	0840
		ADDWR 	76H,1 			//01EE 	0BF6
		BTSC 	STATUS,0 		//01EF 	1403
		INCR	77H,1 			//01F0 	09F7
		LDR 	41H,0 			//01F1 	0841
		ADDWR 	77H,1 			//01F2 	0BF7
		LDWI 	4H 			//01F3 	2A04
		INCR	78H,1 			//01F4 	09F8
		SUBWR 	78H,0 			//01F5 	0C78
		BTSS 	STATUS,0 		//01F6 	1C03
		LJUMP 	1EBH 			//01F7 	39EB
		LDR 	77H,0 			//01F8 	0877
		STR 	75H 			//01F9 	01F5
		LDR 	76H,0 			//01FA 	0876
		STR 	74H 			//01FB 	01F4
		BCR 	STATUS,0 		//01FC 	1003
		RRR	75H,1 			//01FD 	06F5
		RRR	74H,1 			//01FE 	06F4
		BCR 	STATUS,0 		//01FF 	1003
		RRR	75H,1 			//0200 	06F5
		RRR	74H,1 			//0201 	06F4
		LDR 	74H,0 			//0202 	0874
		STR 	45H 			//0203 	01C5
		LDR 	75H,0 			//0204 	0875
		STR 	46H 			//0205 	01C6
		RET		 					//0206 	0004

		//;main.c: 148: OSCCON = 0B01100000;
		LDWI 	60H 			//0207 	2A60
		BSR 	STATUS,5 		//0208 	1A83
		STR 	FH 			//0209 	018F

		//;main.c: 149: OPTION = 0B00000100;
		LDWI 	4H 			//020A 	2A04
		STR 	1H 			//020B 	0181

		//;main.c: 150: TRISA = 0B00000000;
		CLRR 	5H 			//020C 	0105

		//;main.c: 151: PORTA = 0B00000000;
		BCR 	STATUS,5 		//020D 	1283
		CLRR 	5H 			//020E 	0105

		//;main.c: 152: LVDCON = 0x03;
		LDWI 	3H 			//020F 	2A03
		BSR 	STATUS,5 		//0210 	1A83
		STR 	DH 			//0211 	018D

		//;main.c: 153: PCON = 0x88;
		LDWI 	88H 			//0212 	2A88
		STR 	EH 			//0213 	018E

		//;main.c: 154: TRISA = 0B00000000;
		CLRR 	5H 			//0214 	0105

		//;main.c: 155: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0215 	1283
		CLRR 	5H 			//0216 	0105

		//;main.c: 156: OSCCON = 0B01110000;
		LDWI 	70H 			//0217 	2A70
		BSR 	STATUS,5 		//0218 	1A83
		STR 	FH 			//0219 	018F

		//;main.c: 157: INTCON = 0;
		CLRR 	INTCON 			//021A 	010B

		//;main.c: 158: TRISA = 0B00000000;
		CLRR 	5H 			//021B 	0105

		//;main.c: 159: PORTA = 0B00000000;
		BCR 	STATUS,5 		//021C 	1283
		CLRR 	5H 			//021D 	0105

		//;main.c: 160: WPUA = 0B00000000;
		BSR 	STATUS,5 		//021E 	1A83
		CLRR 	15H 			//021F 	0115

		//;main.c: 161: PSRCA = 0B00000000;
		CLRR 	8H 			//0220 	0108

		//;main.c: 162: TRISA = 0B00000000;
		CLRR 	5H 			//0221 	0105

		//;main.c: 163: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0222 	1283
		CLRR 	5H 			//0223 	0105
		RET		 					//0224 	0004
		STR 	73H 			//0225 	01F3

		//;main.c: 182: GIE = 0;
		BCR 	INTCON,7 		//0226 	138B

		//;main.c: 183: while(GIE);
		BTSC 	INTCON,7 		//0227 	178B
		LJUMP 	227H 			//0228 	3A27

		//;main.c: 184: EEADR = EEAddr;
		LDR 	73H,0 			//0229 	0873
		BSR 	STATUS,5 		//022A 	1A83
		STR 	1BH 			//022B 	019B

		//;main.c: 185: EEDAT = Data;
		LDR 	72H,0 			//022C 	0872
		STR 	1AH 			//022D 	019A

		//;main.c: 186: EEIF = 0;
		BCR 	STATUS,5 		//022E 	1283
		BCR 	CH,7 			//022F 	138C

		//;main.c: 187: EECON1 |= 0x34;
		LDWI 	34H 			//0230 	2A34
		BSR 	STATUS,5 		//0231 	1A83
		IORWR 	1CH,1 			//0232 	039C

		//;main.c: 188: WR = 1;
		BSR 	1DH,0 			//0233 	181D

		//;main.c: 189: __nop();
		NOP		 					//0234 	0000

		//;main.c: 190: __nop();
		NOP		 					//0235 	0000

		//;main.c: 191: __nop();
		NOP		 					//0236 	0000

		//;main.c: 192: __nop();
		NOP		 					//0237 	0000
		CLRWDT	 			//0238 	0001

		//;main.c: 194: while(WR);
		BSR 	STATUS,5 		//0239 	1A83
		BTSC 	1DH,0 			//023A 	141D
		LJUMP 	239H 			//023B 	3A39

		//;main.c: 196: GIE = 1;
		BSR 	INTCON,7 		//023C 	1B8B
		RET		 					//023D 	0004

		//;main.c: 131: unsigned int a;
		//;main.c: 132: for(a=0;a<Time;a++)
		CLRR 	78H 			//023E 	0178
		CLRR 	79H 			//023F 	0179
		LDR 	77H,0 			//0240 	0877
		SUBWR 	79H,0 			//0241 	0C79
		BTSS 	STATUS,2 		//0242 	1D03
		LJUMP 	246H 			//0243 	3A46
		LDR 	76H,0 			//0244 	0876
		SUBWR 	78H,0 			//0245 	0C78
		BTSC 	STATUS,0 		//0246 	1403
		RET		 					//0247 	0004

		//;main.c: 133: {
		//;main.c: 134: Delay_Us(1000);
		LDWI 	E8H 			//0248 	2AE8
		STR 	72H 			//0249 	01F2
		LDWI 	3H 			//024A 	2A03
		STR 	73H 			//024B 	01F3
		LCALL 	272H 			//024C 	3272
		INCR	78H,1 			//024D 	09F8
		BTSC 	STATUS,2 		//024E 	1503
		INCR	79H,1 			//024F 	09F9
		LJUMP 	240H 			//0250 	3A40

		//;main.c: 20: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//0251 	168B
		BTSS 	INTCON,2 		//0252 	1D0B
		LJUMP 	25BH 			//0253 	3A5B

		//;main.c: 21: {
		//;main.c: 22: T0IF = 0;
		BCR 	INTCON,2 		//0254 	110B

		//;main.c: 23: TMR0 = 206;
		LDWI 	CEH 			//0255 	2ACE
		BCR 	STATUS,5 		//0256 	1283
		STR 	1H 			//0257 	0181

		//;main.c: 24: StartTouchTime++;
		INCR	4BH,1 			//0258 	09CB
		BTSC 	STATUS,2 		//0259 	1503
		INCR	4CH,1 			//025A 	09CC
		LDR 	71H,0 			//025B 	0871
		STR 	PCLATH 			//025C 	018A
		SWAPR 	70H,0 			//025D 	0770
		STR 	STATUS 			//025E 	0183
		SWAPR 	7EH,1 			//025F 	07FE
		SWAPR 	7EH,0 			//0260 	077E
		RETI		 			//0261 	0009
		BSR 	STATUS,5 		//0262 	1A83
		BSR 	5H,2 			//0263 	1905
		CLRR 	7BH 			//0264 	017B
		BCR 	STATUS,5 		//0265 	1283
		CLRR 	4EH 			//0266 	014E
		BSR 	42H,1 			//0267 	18C2
		CLRR 	79H 			//0268 	0179
		LCALL 	16H 			//0269 	3016
		INCR	79H,1 			//026A 	09F9
		LDR 	79H,0 			//026B 	0879
		BTSC 	STATUS,2 		//026C 	1503
		LJUMP 	269H 			//026D 	3A69
		BCR 	42H,1 			//026E 	10C2
		CLRR 	7BH 			//026F 	017B
		CLRR 	4EH 			//0270 	014E
		RET		 					//0271 	0004

		//;main.c: 121: unsigned int a;
		//;main.c: 122: for(a=0;a<Time;a++)
		CLRR 	74H 			//0272 	0174
		CLRR 	75H 			//0273 	0175
		LDR 	73H,0 			//0274 	0873
		SUBWR 	75H,0 			//0275 	0C75
		BTSS 	STATUS,2 		//0276 	1D03
		LJUMP 	27AH 			//0277 	3A7A
		LDR 	72H,0 			//0278 	0872
		SUBWR 	74H,0 			//0279 	0C74
		BTSC 	STATUS,0 		//027A 	1403
		RET		 					//027B 	0004

		//;main.c: 123: {
		//;main.c: 124: __nop();
		NOP		 					//027C 	0000
		CLRWDT	 			//027D 	0001
		INCR	74H,1 			//027E 	09F4
		BTSC 	STATUS,2 		//027F 	1503
		INCR	75H,1 			//0280 	09F5
		LJUMP 	274H 			//0281 	3A74
		LDWI 	2H 			//0282 	2A02
		STR 	PCLATH 			//0283 	018A
		LDR 	FSR,0 			//0284 	0804
		INCR	FSR,1 			//0285 	0984
		ADDWR 	PCL,1 			//0286 	0B82
		RETW 	0H 			//0287 	2100
		RETW 	0H 			//0288 	2100
		RETW 	0H 			//0289 	2100
		RETW 	CH 			//028A 	210C
		RETW 	0H 			//028B 	2100
		RETW 	0H 			//028C 	2100
		RETW 	0H 			//028D 	2100
		RETW 	14H 			//028E 	2114
		RETW 	0H 			//028F 	2100
		LCALL 	297H 			//0290 	3297
		BCR 	STATUS,7 		//0291 	1383
		STR 	INDF 			//0292 	0180
		INCR	FSR,1 			//0293 	0984
		LDR 	46H,0 			//0294 	0846
		STR 	INDF 			//0295 	0180
		RET		 					//0296 	0004
		BCR 	STATUS,0 		//0297 	1003
		RLR 	4EH,0 			//0298 	054E
		ADDWI 	47H 			//0299 	2747
		STR 	FSR 			//029A 	0184
		LDR 	45H,0 			//029B 	0845
		RET		 					//029C 	0004
		STR 	72H 			//029D 	01F2

		//;main.c: 168: unsigned char ReEEPROMread;
		//;main.c: 169: EEADR = EEAddr;
		BSR 	STATUS,5 		//029E 	1A83
		STR 	1BH 			//029F 	019B

		//;main.c: 170: RD=1;
		BSR 	1CH,0 			//02A0 	181C

		//;main.c: 171: __nop();
		NOP		 					//02A1 	0000

		//;main.c: 172: __nop();
		NOP		 					//02A2 	0000

		//;main.c: 173: __nop();
		NOP		 					//02A3 	0000

		//;main.c: 174: __nop();
		NOP		 					//02A4 	0000
		CLRWDT	 			//02A5 	0001

		//;main.c: 176: ReEEPROMread =EEDAT;
		BSR 	STATUS,5 		//02A6 	1A83
		LDR 	1AH,0 			//02A7 	081A
		STR 	73H 			//02A8 	01F3

		//;main.c: 177: return ReEEPROMread;
		RET		 					//02A9 	0004
		CLRWDT	 			//02AA 	0001
		CLRR 	INDF 			//02AB 	0100
		INCR	FSR,1 			//02AC 	0984
		XORWR 	FSR,0 			//02AD 	0404
		BTSC 	STATUS,2 		//02AE 	1503
		RETW 	0H 			//02AF 	2100
		XORWR 	FSR,0 			//02B0 	0404
		LJUMP 	2ABH 			//02B1 	3AAB
		CLRR 	72H 			//02B2 	0172
		NOP		 					//02B3 	0000
		LDWI 	19H 			//02B4 	2A19
		INCR	72H,1 			//02B5 	09F2
		SUBWR 	72H,0 			//02B6 	0C72
		BTSC 	STATUS,0 		//02B7 	1403
		RET		 					//02B8 	0004
		LJUMP 	2B3H 			//02B9 	3AB3
		BCR 	STATUS,5 		//02BA 	1283
		CLRR 	40H 			//02BB 	0140
		CLRR 	41H 			//02BC 	0141
		BSR 	STATUS,5 		//02BD 	1A83
		BSR 	EH,3 			//02BE 	198E
		CLRR 	6H 			//02BF 	0106
		RET		 					//02C0 	0004

		//;main.c: 140: TMR0 = 206;
		LDWI 	CEH 			//02C1 	2ACE
		STR 	1H 			//02C2 	0181

		//;main.c: 141: T0IF = 0;
		BCR 	INTCON,2 		//02C3 	110B

		//;main.c: 142: T0IE = 1;
		BSR 	INTCON,5 		//02C4 	1A8B

		//;main.c: 143: GIE = 1;
		BSR 	INTCON,7 		//02C5 	1B8B
		RET		 					//02C6 	0004
		BSR 	STATUS,5 		//02C7 	1A83
		CLRR 	6H 			//02C8 	0106
		BSR 	6H,4 			//02C9 	1A06
		BCR 	EH,3 			//02CA 	118E
		RET		 					//02CB 	0004
			END
