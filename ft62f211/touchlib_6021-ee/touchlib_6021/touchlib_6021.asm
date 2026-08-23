//Deviec:FT62F21X
//-----------------------Variable---------------------------------
		_GKeyValue		EQU		5DH
		_Last		EQU		5CH
		_State		EQU		63H
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
//		TouchKeyScan@charcapBuff		EQU		61H
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
		LJUMP 	1D0H 			//0009 	39D0
		LJUMP 	0BH 			//000A 	380B
		LDWI 	1H 			//000B 	2A01
		STR 	64H 			//000C 	01E4
		LDWI 	43H 			//000D 	2A43
		BCR 	STATUS,7 		//000E 	1383
		STR 	FSR 			//000F 	0184
		LDWI 	5EH 			//0010 	2A5E
		LCALL 	2A1H 			//0011 	32A1
		CLRR 	7BH 			//0012 	017B
		CLRR 	7AH 			//0013 	017A
		CLRR 	STATUS 			//0014 	0103
		LJUMP 	13AH 			//0015 	393A
		INCR	7BH,0 			//0016 	097B
		STR 	5EH 			//0017 	01DE
		LDWI 	4H 			//0018 	2A04
		STR 	5FH 			//0019 	01DF
		LDWI 	0H 			//001A 	2A00
		STR 	60H 			//001B 	01E0
		LJUMP 	20H 			//001C 	3820
		RLR 	60H,0 			//001D 	0560
		RRR	60H,1 			//001E 	06E0
		RRR	5FH,1 			//001F 	06DF
		DECRSZ 	5EH,1 		//0020 	0EDE
		LJUMP 	1DH 			//0021 	381D
		BCR 	STATUS,5 		//0022 	1283
		BTSC 	5FH,0 			//0023 	145F
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
		STR 	61H 			//002F 	01E1
		INCR	FSR,1 			//0030 	0984
		LDR 	INDF,0 			//0031 	0800
		STR 	62H 			//0032 	01E2
		BTSS 	7AH,0 			//0033 	1C7A
		LJUMP 	37H 			//0034 	3837
		LCALL 	1A8H 			//0035 	31A8
		LJUMP 	38H 			//0036 	3838
		LCALL 	1F4H 			//0037 	31F4
		CLRR 	54H 			//0038 	0154
		LDR 	62H,0 			//0039 	0862
		SUBWR 	46H,0 			//003A 	0C46
		BTSS 	STATUS,2 		//003B 	1D03
		LJUMP 	3FH 			//003C 	383F
		LDR 	61H,0 			//003D 	0861
		SUBWR 	45H,0 			//003E 	0C45
		BTSC 	STATUS,0 		//003F 	1403
		LJUMP 	55H 			//0040 	3855
		LDR 	45H,0 			//0041 	0845
		SUBWR 	61H,0 			//0042 	0C61
		STR 	5EH 			//0043 	01DE
		LDR 	46H,0 			//0044 	0846
		BTSS 	STATUS,0 		//0045 	1C03
		INCR	46H,0 			//0046 	0946
		SUBWR 	62H,0 			//0047 	0C62
		STR 	5FH 			//0048 	01DF
		LDWI 	1H 			//0049 	2A01
		SUBWR 	5FH,0 			//004A 	0C5F
		LDWI 	0H 			//004B 	2A00
		BTSC 	STATUS,2 		//004C 	1503
		SUBWR 	5EH,0 			//004D 	0C5E
		BTSS 	STATUS,0 		//004E 	1C03
		LJUMP 	52H 			//004F 	3852
		LDWI 	FFH 			//0050 	2AFF
		LJUMP 	54H 			//0051 	3854
		LDR 	45H,0 			//0052 	0845
		SUBWR 	61H,0 			//0053 	0C61
		STR 	54H 			//0054 	01D4
		BCR 	42H,6 			//0055 	1342
		BCR 	42H,7 			//0056 	13C2
		LDR 	7BH,0 			//0057 	087B
		ADDWI 	1H 			//0058 	2701
		STR 	FSR 			//0059 	0184
		LCALL 	27AH 			//005A 	327A
		STR 	5EH 			//005B 	01DE
		LDR 	54H,0 			//005C 	0854
		SUBWR 	5EH,0 			//005D 	0C5E
		BTSC 	STATUS,0 		//005E 	1403
		BSR 	42H,7 			//005F 	1BC2
		LDR 	7BH,0 			//0060 	087B
		ADDWI 	5H 			//0061 	2705
		STR 	FSR 			//0062 	0184
		LCALL 	27AH 			//0063 	327A
		STR 	5EH 			//0064 	01DE
		LDR 	54H,0 			//0065 	0854
		SUBWR 	5EH,0 			//0066 	0C5E
		BTSS 	STATUS,0 		//0067 	1C03
		BSR 	42H,6 			//0068 	1B42
		LDR 	50H,0 			//0069 	0850
		STR 	5EH 			//006A 	01DE
		INCR	7BH,0 			//006B 	097B
		LJUMP 	6FH 			//006C 	386F
		BCR 	STATUS,0 		//006D 	1003
		RRR	5EH,1 			//006E 	06DE
		ADDWI 	FFH 			//006F 	27FF
		BTSS 	STATUS,2 		//0070 	1D03
		LJUMP 	6DH 			//0071 	386D
		BTSS 	5EH,0 			//0072 	1C5E
		LJUMP 	83H 			//0073 	3883
		BTSS 	42H,7 			//0074 	1FC2
		LJUMP 	97H 			//0075 	3897
		LDWI 	1H 			//0076 	2A01
		STR 	5EH 			//0077 	01DE
		INCR	7BH,0 			//0078 	097B
		LJUMP 	7CH 			//0079 	387C
		BCR 	STATUS,0 		//007A 	1003
		RLR 	5EH,1 			//007B 	05DE
		ADDWI 	FFH 			//007C 	27FF
		BTSS 	STATUS,2 		//007D 	1D03
		LJUMP 	7AH 			//007E 	387A
		LDR 	5EH,0 			//007F 	085E
		XORWI 	FFH 			//0080 	26FF
		ANDWR 	50H,1 			//0081 	02D0
		LJUMP 	97H 			//0082 	3897
		LDR 	7BH,0 			//0083 	087B
		ADDWI 	5H 			//0084 	2705
		STR 	FSR 			//0085 	0184
		LCALL 	27AH 			//0086 	327A
		SUBWR 	54H,0 			//0087 	0C54
		BTSC 	STATUS,0 		//0088 	1403
		BCR 	7AH,0 			//0089 	107A
		BTSS 	42H,6 			//008A 	1F42
		LJUMP 	97H 			//008B 	3897
		LDWI 	1H 			//008C 	2A01
		STR 	5EH 			//008D 	01DE
		INCR	7BH,0 			//008E 	097B
		LJUMP 	92H 			//008F 	3892
		BCR 	STATUS,0 		//0090 	1003
		RLR 	5EH,1 			//0091 	05DE
		ADDWI 	FFH 			//0092 	27FF
		BTSS 	STATUS,2 		//0093 	1D03
		LJUMP 	90H 			//0094 	3890
		LDR 	5EH,0 			//0095 	085E
		IORWR 	50H,1 			//0096 	03D0
		BTSC 	7AH,0 			//0097 	147A
		LJUMP 	F2H 			//0098 	38F2
		BTSS 	42H,1 			//0099 	1CC2
		LJUMP 	9CH 			//009A 	389C
		LCALL 	288H 			//009B 	3288
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
		LCALL 	27AH 			//00AB 	327A
		STR 	5EH 			//00AC 	01DE
		BCR 	STATUS,0 		//00AD 	1003
		RRR	5EH,0 			//00AE 	065E
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
		LCALL 	28FH 			//00BD 	328F
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
		STR 	5EH 			//00DC 	01DE
		INCR	FSR,1 			//00DD 	0984
		LDR 	INDF,0 			//00DE 	0800
		STR 	5FH 			//00DF 	01DF
		IORWR 	5EH,0 			//00E0 	035E
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
		SUBWR 	62H,0 			//0103 	0C62
		BTSS 	STATUS,2 		//0104 	1D03
		LJUMP 	108H 			//0105 	3908
		LDR 	45H,0 			//0106 	0845
		SUBWR 	61H,0 			//0107 	0C61
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
		STR 	5EH 			//0125 	01DE
		INCR	FSR,1 			//0126 	0984
		LDR 	INDF,0 			//0127 	0800
		STR 	5FH 			//0128 	01DF
		LDR 	46H,0 			//0129 	0846
		SUBWR 	5FH,0 			//012A 	0C5F
		BTSS 	STATUS,2 		//012B 	1D03
		RET		 					//012C 	0004
		LDR 	45H,0 			//012D 	0845
		SUBWR 	5EH,0 			//012E 	0C5E
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

		//;main.c: 264: TRISA = 0B00000000;
		BSR 	STATUS,5 		//013A 	1A83
		CLRR 	5H 			//013B 	0105

		//;main.c: 265: PORTA = 0B00000000;
		BCR 	STATUS,5 		//013C 	1283
		CLRR 	5H 			//013D 	0105

		//;main.c: 266: SYS_INITIAL();
		LCALL 	213H 			//013E 	3213

		//;main.c: 268: State=EEPROMread(0x10);
		LDWI 	10H 			//013F 	2A10
		LCALL 	295H 			//0140 	3295
		BCR 	STATUS,5 		//0141 	1283
		STR 	63H 			//0142 	01E3

		//;main.c: 269: if(State>1)State=1;
		LDWI 	2H 			//0143 	2A02
		SUBWR 	63H,0 			//0144 	0C63
		BTSS 	STATUS,0 		//0145 	1C03
		LJUMP 	149H 			//0146 	3949
		LDWI 	1H 			//0147 	2A01
		STR 	63H 			//0148 	01E3

		//;main.c: 270: PA3=State;__nop();;
		BTSS 	63H,0 			//0149 	1C63
		LJUMP 	14EH 			//014A 	394E
		BCR 	STATUS,5 		//014B 	1283
		BSR 	5H,3 			//014C 	1985
		LJUMP 	150H 			//014D 	3950
		BCR 	STATUS,5 		//014E 	1283
		BCR 	5H,3 			//014F 	1185
		NOP		 					//0150 	0000

		//;main.c: 273: DelayMs(200);
		LDWI 	C8H 			//0151 	2AC8
		STR 	76H 			//0152 	01F6
		CLRR 	77H 			//0153 	0177
		LCALL 	247H 			//0154 	3247

		//;main.c: 277: TIMER0_INITIAL();
		LCALL 	2B8H 			//0155 	32B8

		//;main.c: 278: Touch_init();
		LCALL 	25AH 			//0156 	325A

		//;main.c: 284: {
		//;main.c: 285: Delay_Us(10);
		LDWI 	AH 			//0157 	2A0A
		STR 	72H 			//0158 	01F2
		CLRR 	73H 			//0159 	0173
		LCALL 	26AH 			//015A 	326A

		//;main.c: 286: if(StartTouchTime >= (2500/12/1))
		LDWI 	0H 			//015B 	2A00
		BCR 	STATUS,5 		//015C 	1283
		SUBWR 	4CH,0 			//015D 	0C4C
		LDWI 	D0H 			//015E 	2AD0
		BTSC 	STATUS,2 		//015F 	1503
		SUBWR 	4BH,0 			//0160 	0C4B
		BTSS 	STATUS,0 		//0161 	1C03
		LJUMP 	167H 			//0162 	3967

		//;main.c: 287: {
		//;main.c: 288: StartTouchTime = 0;
		CLRR 	4BH 			//0163 	014B
		CLRR 	4CH 			//0164 	014C

		//;main.c: 289: GKeyValue = TouchKeyScan();
		LCALL 	16H 			//0165 	3016
		STR 	5DH 			//0166 	01DD

		//;main.c: 290: }
		//;main.c: 291: if(GKeyValue!=0)
		LDR 	5DH,0 			//0167 	085D
		BTSC 	STATUS,2 		//0168 	1503
		LJUMP 	1A4H 			//0169 	39A4

		//;main.c: 292: {
		//;main.c: 293: if(GKeyValue==4)
		LDWI 	4H 			//016A 	2A04
		XORWR 	5DH,0 			//016B 	045D
		BTSS 	STATUS,2 		//016C 	1D03
		LJUMP 	196H 			//016D 	3996

		//;main.c: 294: {
		//;main.c: 295: if(CountKey<305)
		LDWI 	1H 			//016E 	2A01
		SUBWR 	4AH,0 			//016F 	0C4A
		LDWI 	31H 			//0170 	2A31
		BTSC 	STATUS,2 		//0171 	1503
		SUBWR 	49H,0 			//0172 	0C49
		BTSC 	STATUS,0 		//0173 	1403
		LJUMP 	196H 			//0174 	3996

		//;main.c: 296: {
		//;main.c: 297: CountKey++;
		INCR	49H,1 			//0175 	09C9
		BTSC 	STATUS,2 		//0176 	1503
		INCR	4AH,1 			//0177 	09CA

		//;main.c: 298: if(CountKey>300)
		LDWI 	1H 			//0178 	2A01
		SUBWR 	4AH,0 			//0179 	0C4A
		LDWI 	2DH 			//017A 	2A2D
		BTSC 	STATUS,2 		//017B 	1503
		SUBWR 	49H,0 			//017C 	0C49
		BTSS 	STATUS,0 		//017D 	1C03
		LJUMP 	196H 			//017E 	3996

		//;main.c: 299: {
		//;main.c: 300: CountKey=310;
		LDWI 	36H 			//017F 	2A36
		STR 	49H 			//0180 	01C9
		LDWI 	1H 			//0181 	2A01
		STR 	4AH 			//0182 	01CA

		//;main.c: 302: if(State==1)
		DECRSZ 	63H,0 		//0183 	0E63
		LJUMP 	18BH 			//0184 	398B

		//;main.c: 303: {
		//;main.c: 304: State=0;
		CLRR 	63H 			//0185 	0163

		//;main.c: 305: PA3=0;__nop();;
		BCR 	5H,3 			//0186 	1185
		NOP		 					//0187 	0000
		LDWI 	10H 			//0188 	2A10

		//;main.c: 306: EEPROMwrite(0x10,0);
		CLRR 	72H 			//0189 	0172
		LJUMP 	195H 			//018A 	3995

		//;main.c: 310: }
		//;main.c: 311: else if(State==0)
		LDR 	63H,0 			//018B 	0863
		BTSS 	STATUS,2 		//018C 	1D03
		LJUMP 	196H 			//018D 	3996

		//;main.c: 312: {
		//;main.c: 313: State=1;
		LDWI 	1H 			//018E 	2A01
		STR 	63H 			//018F 	01E3

		//;main.c: 314: PA3=1;__nop();;
		BSR 	5H,3 			//0190 	1985
		NOP		 					//0191 	0000
		LDWI 	10H 			//0192 	2A10

		//;main.c: 315: EEPROMwrite(0x10,1);
		CLRR 	72H 			//0193 	0172
		INCR	72H,1 			//0194 	09F2
		LCALL 	22EH 			//0195 	322E

		//;main.c: 319: }
		//;main.c: 321: }
		//;main.c: 322: }
		//;main.c: 323: }
		//;main.c: 324: if(Last!=GKeyValue)
		BCR 	STATUS,5 		//0196 	1283
		LDR 	5CH,0 			//0197 	085C
		XORWR 	5DH,0 			//0198 	045D
		BTSC 	STATUS,2 		//0199 	1503
		LJUMP 	1A0H 			//019A 	39A0

		//;main.c: 325: {
		//;main.c: 326: if(GKeyValue==4)
		LDWI 	4H 			//019B 	2A04
		XORWR 	5DH,0 			//019C 	045D
		BTSS 	STATUS,2 		//019D 	1D03
		LJUMP 	1A0H 			//019E 	39A0

		//;main.c: 327: {
		//;main.c: 328: __nop();
		NOP		 					//019F 	0000

		//;main.c: 356: }
		//;main.c: 357: }
		//;main.c: 358: Last=GKeyValue;
		BCR 	STATUS,5 		//01A0 	1283
		LDR 	5DH,0 			//01A1 	085D
		STR 	5CH 			//01A2 	01DC

		//;main.c: 360: }
		LJUMP 	157H 			//01A3 	3957

		//;main.c: 361: else
		//;main.c: 362: {
		//;main.c: 363: Last=0;
		CLRR 	5CH 			//01A4 	015C

		//;main.c: 368: }
		//;main.c: 369: CountKey=0;
		CLRR 	49H 			//01A5 	0149
		CLRR 	4AH 			//01A6 	014A
		LJUMP 	157H 			//01A7 	3957
		BSR 	STATUS,5 		//01A8 	1A83
		BCR 	6H,6 			//01A9 	1306
		BSR 	6H,5 			//01AA 	1A86
		BSR 	6H,4 			//01AB 	1A06
		LCALL 	2A9H 			//01AC 	32A9
		LCALL 	2B1H 			//01AD 	32B1
		BSR 	6H,4 			//01AE 	1A06
		LCALL 	2A9H 			//01AF 	32A9
		BSR 	STATUS,5 		//01B0 	1A83
		BCR 	6H,4 			//01B1 	1206
		BSR 	6H,5 			//01B2 	1A86
		BCR 	6H,6 			//01B3 	1306
		LDWI 	1H 			//01B4 	2A01
		STR 	73H 			//01B5 	01F3
		INCR	7BH,0 			//01B6 	097B
		LJUMP 	1BAH 			//01B7 	39BA
		BCR 	STATUS,0 		//01B8 	1003
		RLR 	73H,1 			//01B9 	05F3
		ADDWI 	FFH 			//01BA 	27FF
		BTSS 	STATUS,2 		//01BB 	1D03
		LJUMP 	1B8H 			//01BC 	39B8
		LDR 	73H,0 			//01BD 	0873
		IORWR 	6H,1 			//01BE 	0386
		BSR 	STATUS,5 		//01BF 	1A83
		INCR	40H,1 			//01C0 	09C0
		BTSC 	STATUS,2 		//01C1 	1503
		INCR	41H,1 			//01C2 	09C1
		BSR 	6H,6 			//01C3 	1B06
		BSR 	6H,4 			//01C4 	1A06
		BCR 	6H,4 			//01C5 	1206
		BCR 	6H,6 			//01C6 	1306
		BTSC 	EH,2 			//01C7 	150E
		LJUMP 	1C0H 			//01C8 	39C0
		LCALL 	2BFH 			//01C9 	32BF
		BCR 	STATUS,5 		//01CA 	1283
		LDR 	41H,0 			//01CB 	0841
		STR 	46H 			//01CC 	01C6
		LDR 	40H,0 			//01CD 	0840
		STR 	45H 			//01CE 	01C5
		RET		 					//01CF 	0004

		//;main.c: 43: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//01D0 	168B
		BTSS 	INTCON,2 		//01D1 	1D0B
		LJUMP 	1DAH 			//01D2 	39DA

		//;main.c: 44: {
		//;main.c: 45: T0IF = 0;
		BCR 	INTCON,2 		//01D3 	110B

		//;main.c: 46: TMR0 = 206;
		LDWI 	CEH 			//01D4 	2ACE
		BCR 	STATUS,5 		//01D5 	1283
		STR 	1H 			//01D6 	0181

		//;main.c: 47: StartTouchTime++;
		INCR	4BH,1 			//01D7 	09CB
		BTSC 	STATUS,2 		//01D8 	1503
		INCR	4CH,1 			//01D9 	09CC

		//;main.c: 132: }
		//;main.c: 134: if(PAIE && PAIF)
		BTSC 	INTCON,3 		//01DA 	158B
		BTSS 	INTCON,0 		//01DB 	1C0B
		LJUMP 	1EDH 			//01DC 	39ED

		//;main.c: 135: {
		//;main.c: 137: if(State==1)
		BCR 	STATUS,5 		//01DD 	1283
		DECRSZ 	63H,0 		//01DE 	0E63
		LJUMP 	1E3H 			//01DF 	39E3

		//;main.c: 138: {
		//;main.c: 139: PA3=1;__nop();;
		BSR 	5H,3 			//01E0 	1985
		NOP		 					//01E1 	0000

		//;main.c: 140: }
		LJUMP 	1E8H 			//01E2 	39E8

		//;main.c: 141: else if(State==0)
		LDR 	63H,0 			//01E3 	0863
		BTSS 	STATUS,2 		//01E4 	1D03
		LJUMP 	1E8H 			//01E5 	39E8

		//;main.c: 142: {
		//;main.c: 143: PA3=0;__nop();;
		BCR 	5H,3 			//01E6 	1185
		NOP		 					//01E7 	0000

		//;main.c: 144: }
		//;main.c: 165: ReadAPin = PORTA;
		BCR 	STATUS,5 		//01E8 	1283
		LDR 	5H,0 			//01E9 	0805

		//;main.c: 166: PAIF = 0;
		BCR 	INTCON,0 		//01EA 	100B

		//;main.c: 167: IOCA2 =0;
		BSR 	STATUS,5 		//01EB 	1A83
		BCR 	16H,2 			//01EC 	1116
		LDR 	71H,0 			//01ED 	0871
		STR 	PCLATH 			//01EE 	018A
		SWAPR 	70H,0 			//01EF 	0770
		STR 	STATUS 			//01F0 	0183
		SWAPR 	7EH,1 			//01F1 	07FE
		SWAPR 	7EH,0 			//01F2 	077E
		RETI		 			//01F3 	0009
		CLRR 	76H 			//01F4 	0176
		CLRR 	77H 			//01F5 	0177
		CLRR 	78H 			//01F6 	0178
		CLRWDT	 			//01F7 	0001
		LCALL 	1A8H 			//01F8 	31A8
		LDR 	40H,0 			//01F9 	0840
		ADDWR 	76H,1 			//01FA 	0BF6
		BTSC 	STATUS,0 		//01FB 	1403
		INCR	77H,1 			//01FC 	09F7
		LDR 	41H,0 			//01FD 	0841
		ADDWR 	77H,1 			//01FE 	0BF7
		LDWI 	4H 			//01FF 	2A04
		INCR	78H,1 			//0200 	09F8
		SUBWR 	78H,0 			//0201 	0C78
		BTSS 	STATUS,0 		//0202 	1C03
		LJUMP 	1F7H 			//0203 	39F7
		LDR 	77H,0 			//0204 	0877
		STR 	75H 			//0205 	01F5
		LDR 	76H,0 			//0206 	0876
		STR 	74H 			//0207 	01F4
		BCR 	STATUS,0 		//0208 	1003
		RRR	75H,1 			//0209 	06F5
		RRR	74H,1 			//020A 	06F4
		BCR 	STATUS,0 		//020B 	1003
		RRR	75H,1 			//020C 	06F5
		RRR	74H,1 			//020D 	06F4
		LDR 	74H,0 			//020E 	0874
		STR 	45H 			//020F 	01C5
		LDR 	75H,0 			//0210 	0875
		STR 	46H 			//0211 	01C6
		RET		 					//0212 	0004

		//;main.c: 202: OSCCON = 0B01100000;
		LDWI 	60H 			//0213 	2A60
		BSR 	STATUS,5 		//0214 	1A83
		STR 	FH 			//0215 	018F

		//;main.c: 203: OPTION = 0B00000100;
		LDWI 	4H 			//0216 	2A04
		STR 	1H 			//0217 	0181

		//;main.c: 204: TRISA = 0B00000000;
		CLRR 	5H 			//0218 	0105

		//;main.c: 205: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0219 	1283
		CLRR 	5H 			//021A 	0105

		//;main.c: 206: LVDCON = 0x03;
		LDWI 	3H 			//021B 	2A03
		BSR 	STATUS,5 		//021C 	1A83
		STR 	DH 			//021D 	018D

		//;main.c: 207: PCON = 0x88;
		LDWI 	88H 			//021E 	2A88
		STR 	EH 			//021F 	018E

		//;main.c: 208: TRISA = 0B00000000;
		CLRR 	5H 			//0220 	0105

		//;main.c: 209: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0221 	1283
		CLRR 	5H 			//0222 	0105

		//;main.c: 210: OSCCON = 0B01110000;
		LDWI 	70H 			//0223 	2A70
		BSR 	STATUS,5 		//0224 	1A83
		STR 	FH 			//0225 	018F

		//;main.c: 211: INTCON = 0;
		CLRR 	INTCON 			//0226 	010B

		//;main.c: 213: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0227 	1283
		CLRR 	5H 			//0228 	0105

		//;main.c: 214: TRISA = 0B00000000;
		BSR 	STATUS,5 		//0229 	1A83
		CLRR 	5H 			//022A 	0105

		//;main.c: 215: WPUA = 0B00000000;
		CLRR 	15H 			//022B 	0115

		//;main.c: 216: PSRCA = 0B00000000;
		CLRR 	8H 			//022C 	0108
		RET		 					//022D 	0004
		STR 	73H 			//022E 	01F3

		//;main.c: 235: GIE = 0;
		BCR 	INTCON,7 		//022F 	138B

		//;main.c: 236: while(GIE);
		BTSC 	INTCON,7 		//0230 	178B
		LJUMP 	230H 			//0231 	3A30

		//;main.c: 237: EEADR = EEAddr;
		LDR 	73H,0 			//0232 	0873
		BSR 	STATUS,5 		//0233 	1A83
		STR 	1BH 			//0234 	019B

		//;main.c: 238: EEDAT = Data;
		LDR 	72H,0 			//0235 	0872
		STR 	1AH 			//0236 	019A

		//;main.c: 239: EEIF = 0;
		BCR 	STATUS,5 		//0237 	1283
		BCR 	CH,7 			//0238 	138C

		//;main.c: 240: EECON1 |= 0x34;
		LDWI 	34H 			//0239 	2A34
		BSR 	STATUS,5 		//023A 	1A83
		IORWR 	1CH,1 			//023B 	039C

		//;main.c: 241: WR = 1;
		BSR 	1DH,0 			//023C 	181D

		//;main.c: 242: __nop();
		NOP		 					//023D 	0000

		//;main.c: 243: __nop();
		NOP		 					//023E 	0000

		//;main.c: 244: __nop();
		NOP		 					//023F 	0000

		//;main.c: 245: __nop();
		NOP		 					//0240 	0000
		CLRWDT	 			//0241 	0001

		//;main.c: 247: while(WR);
		BSR 	STATUS,5 		//0242 	1A83
		BTSC 	1DH,0 			//0243 	141D
		LJUMP 	242H 			//0244 	3A42

		//;main.c: 249: GIE = 1;
		BSR 	INTCON,7 		//0245 	1B8B
		RET		 					//0246 	0004

		//;main.c: 185: unsigned int a;
		//;main.c: 186: for(a=0;a<Time;a++)
		CLRR 	78H 			//0247 	0178
		CLRR 	79H 			//0248 	0179
		LDR 	77H,0 			//0249 	0877
		SUBWR 	79H,0 			//024A 	0C79
		BTSS 	STATUS,2 		//024B 	1D03
		LJUMP 	24FH 			//024C 	3A4F
		LDR 	76H,0 			//024D 	0876
		SUBWR 	78H,0 			//024E 	0C78
		BTSC 	STATUS,0 		//024F 	1403
		RET		 					//0250 	0004

		//;main.c: 187: {
		//;main.c: 188: Delay_Us(1000);
		LDWI 	E8H 			//0251 	2AE8
		STR 	72H 			//0252 	01F2
		LDWI 	3H 			//0253 	2A03
		STR 	73H 			//0254 	01F3
		LCALL 	26AH 			//0255 	326A
		INCR	78H,1 			//0256 	09F8
		BTSC 	STATUS,2 		//0257 	1503
		INCR	79H,1 			//0258 	09F9
		LJUMP 	249H 			//0259 	3A49
		BSR 	STATUS,5 		//025A 	1A83
		BSR 	5H,2 			//025B 	1905
		CLRR 	7BH 			//025C 	017B
		BCR 	STATUS,5 		//025D 	1283
		CLRR 	4EH 			//025E 	014E
		BSR 	42H,1 			//025F 	18C2
		CLRR 	79H 			//0260 	0179
		LCALL 	16H 			//0261 	3016
		INCR	79H,1 			//0262 	09F9
		LDR 	79H,0 			//0263 	0879
		BTSC 	STATUS,2 		//0264 	1503
		LJUMP 	261H 			//0265 	3A61
		BCR 	42H,1 			//0266 	10C2
		CLRR 	7BH 			//0267 	017B
		CLRR 	4EH 			//0268 	014E
		RET		 					//0269 	0004

		//;main.c: 175: unsigned int a;
		//;main.c: 176: for(a=0;a<Time;a++)
		CLRR 	74H 			//026A 	0174
		CLRR 	75H 			//026B 	0175
		LDR 	73H,0 			//026C 	0873
		SUBWR 	75H,0 			//026D 	0C75
		BTSS 	STATUS,2 		//026E 	1D03
		LJUMP 	272H 			//026F 	3A72
		LDR 	72H,0 			//0270 	0872
		SUBWR 	74H,0 			//0271 	0C74
		BTSC 	STATUS,0 		//0272 	1403
		RET		 					//0273 	0004

		//;main.c: 177: {
		//;main.c: 178: __nop();
		NOP		 					//0274 	0000
		CLRWDT	 			//0275 	0001
		INCR	74H,1 			//0276 	09F4
		BTSC 	STATUS,2 		//0277 	1503
		INCR	75H,1 			//0278 	09F5
		LJUMP 	26CH 			//0279 	3A6C
		LDWI 	2H 			//027A 	2A02
		STR 	PCLATH 			//027B 	018A
		LDR 	FSR,0 			//027C 	0804
		INCR	FSR,1 			//027D 	0984
		ADDWR 	PCL,1 			//027E 	0B82
		RETW 	0H 			//027F 	2100
		RETW 	0H 			//0280 	2100
		RETW 	0H 			//0281 	2100
		RETW 	20H 			//0282 	2120
		RETW 	0H 			//0283 	2100
		RETW 	0H 			//0284 	2100
		RETW 	0H 			//0285 	2100
		RETW 	35H 			//0286 	2135
		RETW 	0H 			//0287 	2100
		LCALL 	28FH 			//0288 	328F
		BCR 	STATUS,7 		//0289 	1383
		STR 	INDF 			//028A 	0180
		INCR	FSR,1 			//028B 	0984
		LDR 	46H,0 			//028C 	0846
		STR 	INDF 			//028D 	0180
		RET		 					//028E 	0004
		BCR 	STATUS,0 		//028F 	1003
		RLR 	4EH,0 			//0290 	054E
		ADDWI 	47H 			//0291 	2747
		STR 	FSR 			//0292 	0184
		LDR 	45H,0 			//0293 	0845
		RET		 					//0294 	0004
		STR 	72H 			//0295 	01F2

		//;main.c: 221: unsigned char ReEEPROMread;
		//;main.c: 222: EEADR = EEAddr;
		STR 	1BH 			//0296 	019B

		//;main.c: 223: RD=1;
		BSR 	1CH,0 			//0297 	181C

		//;main.c: 224: __nop();
		NOP		 					//0298 	0000

		//;main.c: 225: __nop();
		NOP		 					//0299 	0000

		//;main.c: 226: __nop();
		NOP		 					//029A 	0000

		//;main.c: 227: __nop();
		NOP		 					//029B 	0000
		CLRWDT	 			//029C 	0001

		//;main.c: 229: ReEEPROMread =EEDAT;
		BSR 	STATUS,5 		//029D 	1A83
		LDR 	1AH,0 			//029E 	081A
		STR 	73H 			//029F 	01F3

		//;main.c: 230: return ReEEPROMread;
		RET		 					//02A0 	0004
		CLRWDT	 			//02A1 	0001
		CLRR 	INDF 			//02A2 	0100
		INCR	FSR,1 			//02A3 	0984
		XORWR 	FSR,0 			//02A4 	0404
		BTSC 	STATUS,2 		//02A5 	1503
		RETW 	0H 			//02A6 	2100
		XORWR 	FSR,0 			//02A7 	0404
		LJUMP 	2A2H 			//02A8 	3AA2
		CLRR 	72H 			//02A9 	0172
		NOP		 					//02AA 	0000
		LDWI 	19H 			//02AB 	2A19
		INCR	72H,1 			//02AC 	09F2
		SUBWR 	72H,0 			//02AD 	0C72
		BTSC 	STATUS,0 		//02AE 	1403
		RET		 					//02AF 	0004
		LJUMP 	2AAH 			//02B0 	3AAA
		BCR 	STATUS,5 		//02B1 	1283
		CLRR 	40H 			//02B2 	0140
		CLRR 	41H 			//02B3 	0141
		BSR 	STATUS,5 		//02B4 	1A83
		BSR 	EH,3 			//02B5 	198E
		CLRR 	6H 			//02B6 	0106
		RET		 					//02B7 	0004

		//;main.c: 194: TMR0 = 206;
		LDWI 	CEH 			//02B8 	2ACE
		BCR 	STATUS,5 		//02B9 	1283
		STR 	1H 			//02BA 	0181

		//;main.c: 195: T0IF = 0;
		BCR 	INTCON,2 		//02BB 	110B

		//;main.c: 196: T0IE = 1;
		BSR 	INTCON,5 		//02BC 	1A8B

		//;main.c: 197: GIE = 1;
		BSR 	INTCON,7 		//02BD 	1B8B
		RET		 					//02BE 	0004
		BSR 	STATUS,5 		//02BF 	1A83
		CLRR 	6H 			//02C0 	0106
		BSR 	6H,4 			//02C1 	1A06
		BCR 	EH,3 			//02C2 	118E
		RET		 					//02C3 	0004
			END
