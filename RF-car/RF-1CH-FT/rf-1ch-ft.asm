//Deviec:FT60E01X
//-----------------------Variable---------------------------------
		_PA0		EQU		05H
		_PA1		EQU		05H
		_PA2		EQU		05H
		_PA4		EQU		05H
		_PA5		EQU		05H
		_PAIF		EQU		0BH
		_PAIE		EQU		0BH
		_PEIE		EQU		0BH
		_GIE		EQU		0BH
		_TMR2IF		EQU		0CH
		_EEIF		EQU		0CH
		_TMR2ON		EQU		12H
		_TRISA0		EQU		85H
		_TMR2IE		EQU		8CH
		_IOCA0		EQU		96H
		_RD		EQU		9CH
		_WR		EQU		9DH
		_CountKey		EQU		5BH
		_Belink		EQU		5FH
		_Data		EQU		58H
		_DataS		EQU		40H
		_RFData		EQU		55H
		_Timer		EQU		79H
		_Time		EQU		78H
		_Count		EQU		77H
		_Buffer		EQU		76H
		_Bit		EQU		5EH
		_Save		EQU		5DH
		_Frist		EQU		70H
		_Start		EQU		70H
		_Learn		EQU		70H
		_Finish		EQU		70H
		_Lock		EQU		70H
//		main@i_643		EQU		6AH
//		main@i_642		EQU		6DH
//		main@i_640		EQU		6BH
//		main@i		EQU		6CH
//		EEPROMwrite@EEAddr		EQU		60H
//		EEPROMwrite@EEAddr		EQU		60H
//		EEPROMwrite@Data		EQU		75H
//		EEPROMwrite@EEAddr		EQU		60H
//		EEPROMread@EEAddr		EQU		60H
//		EEPROMread@ReEEPROMread		EQU		61H
//		EEPROMread@EEAddr		EQU		60H
//		EEPROMread@EEAddr		EQU		60H
//		DelayMs@b		EQU		66H
//		DelayMs@a		EQU		64H
//		DelayMs@Time		EQU		62H
//		DelayUs@Time		EQU		60H
//		DelayUs@a		EQU		61H
//		DelayUs@Time		EQU		60H
//		DelayUs@Time		EQU		60H
//-----------------------Variable END---------------------------------

		LJUMP 	0CH 			//0000 	380C
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	72H 			//0006 	01F2
		LDR 	FSR,0 			//0007 	0804
		STR 	73H 			//0008 	01F3
		LDR 	PCLATH,0 		//0009 	080A
		STR 	74H 			//000A 	01F4
		LJUMP 	189H 			//000B 	3989
		LJUMP 	0DH 			//000C 	380D
		LDWI 	76H 			//000D 	2A76
		CLRR 	70H 			//000E 	0170
		STR 	FSR 			//000F 	0184
		LDWI 	7AH 			//0010 	2A7A
		LCALL 	261H 			//0011 	3261
		LDWI 	40H 			//0012 	2A40
		BCR 	STATUS,7 		//0013 	1383
		STR 	FSR 			//0014 	0184
		LDWI 	60H 			//0015 	2A60
		LCALL 	261H 			//0016 	3261
		CLRR 	STATUS 			//0017 	0103
		LJUMP 	19H 			//0018 	3819

		//;RF-1CH-FT.C: 99: POWER_INITIAL();
		LCALL 	21FH 			//0019 	321F

		//;RF-1CH-FT.C: 100: DelayMs(10);
		LCALL 	178H 			//001A 	3178
		LCALL 	203H 			//001B 	3203

		//;RF-1CH-FT.C: 101: Save=EEPROMread(0x30);
		LDWI 	30H 			//001C 	2A30
		LCALL 	269H 			//001D 	3269
		STR 	5DH 			//001E 	01DD

		//;RF-1CH-FT.C: 102: DelayMs(1);
		CLRR 	62H 			//001F 	0162
		INCR	62H,1 			//0020 	09E2
		CLRR 	63H 			//0021 	0163
		LCALL 	203H 			//0022 	3203

		//;RF-1CH-FT.C: 103: if(Save<8)
		LDWI 	8H 			//0023 	2A08
		SUBWR 	5DH,0 			//0024 	0C5D
		BTSC 	STATUS,0 		//0025 	1403
		LJUMP 	53H 			//0026 	3853

		//;RF-1CH-FT.C: 104: {
		//;RF-1CH-FT.C: 105: char i;
		//;RF-1CH-FT.C: 106: for(i=1;i<8;i++)
		CLRR 	6CH 			//0027 	016C
		INCR	6CH,1 			//0028 	09EC
		CLRWDT	 			//0029 	0001

		//;RF-1CH-FT.C: 109: DataS[i-1][0]=EEPROMread(i*3);
		BCR 	STATUS,5 		//002A 	1283
		LDR 	6CH,0 			//002B 	086C
		ADDWR 	6CH,0 			//002C 	0B6C
		ADDWR 	6CH,0 			//002D 	0B6C
		ADDWI 	3DH 			//002E 	273D
		STR 	FSR 			//002F 	0184
		LDR 	6CH,0 			//0030 	086C
		ADDWR 	6CH,0 			//0031 	0B6C
		ADDWR 	6CH,0 			//0032 	0B6C
		LCALL 	269H 			//0033 	3269

		//;RF-1CH-FT.C: 110: DelayMs(1);
		LCALL 	172H 			//0034 	3172
		LCALL 	203H 			//0035 	3203

		//;RF-1CH-FT.C: 111: DataS[i-1][1]=EEPROMread((i*3)+1);
		LDR 	6CH,0 			//0036 	086C
		ADDWR 	6CH,0 			//0037 	0B6C
		ADDWR 	6CH,0 			//0038 	0B6C
		ADDWI 	3EH 			//0039 	273E
		STR 	FSR 			//003A 	0184
		LDR 	6CH,0 			//003B 	086C
		ADDWR 	6CH,0 			//003C 	0B6C
		ADDWR 	6CH,0 			//003D 	0B6C
		ADDWI 	1H 			//003E 	2701
		LCALL 	269H 			//003F 	3269

		//;RF-1CH-FT.C: 112: DelayMs(1);
		LCALL 	172H 			//0040 	3172
		LCALL 	203H 			//0041 	3203

		//;RF-1CH-FT.C: 113: DataS[i-1][2]=EEPROMread((i*3)+2);
		LDR 	6CH,0 			//0042 	086C
		ADDWR 	6CH,0 			//0043 	0B6C
		ADDWR 	6CH,0 			//0044 	0B6C
		ADDWI 	3FH 			//0045 	273F
		STR 	FSR 			//0046 	0184
		LDR 	6CH,0 			//0047 	086C
		ADDWR 	6CH,0 			//0048 	0B6C
		ADDWR 	6CH,0 			//0049 	0B6C
		ADDWI 	2H 			//004A 	2702
		LCALL 	269H 			//004B 	3269

		//;RF-1CH-FT.C: 114: DelayMs(1);
		LCALL 	172H 			//004C 	3172
		LCALL 	203H 			//004D 	3203
		LDWI 	8H 			//004E 	2A08
		INCR	6CH,1 			//004F 	09EC
		SUBWR 	6CH,0 			//0050 	0C6C
		BTSS 	STATUS,0 		//0051 	1C03
		LJUMP 	29H 			//0052 	3829

		//;RF-1CH-FT.C: 115: }
		//;RF-1CH-FT.C: 116: }
		//;RF-1CH-FT.C: 117: TIMER2_INITIAL();
		LCALL 	247H 			//0053 	3247

		//;RF-1CH-FT.C: 118: Start=0;
		BCR 	70H,3 			//0054 	11F0

		//;RF-1CH-FT.C: 119: Learn=0;
		BCR 	70H,2 			//0055 	1170

		//;RF-1CH-FT.C: 120: PA2=1;
		//;RF-1CH-FT.C: 121: DelayMs(500);
		LCALL 	183H 			//0056 	3183
		LCALL 	203H 			//0057 	3203

		//;RF-1CH-FT.C: 122: PA2=0;
		BCR 	5H,2 			//0058 	1105

		//;RF-1CH-FT.C: 123: while(1)
		CLRWDT	 			//0059 	0001

		//;RF-1CH-FT.C: 126: if(Lock==1 & Learn==0)
		BTSS 	70H,2 			//005A 	1D70
		BTSS 	70H,0 			//005B 	1C70
		LJUMP 	91H 			//005C 	3891

		//;RF-1CH-FT.C: 127: {
		//;RF-1CH-FT.C: 128: Lock=0;
		BCR 	70H,0 			//005D 	1070

		//;RF-1CH-FT.C: 129: char i;
		//;RF-1CH-FT.C: 130: for(i=0;i<Save;i++)
		BCR 	STATUS,5 		//005E 	1283
		CLRR 	6BH 			//005F 	016B
		LJUMP 	65H 			//0060 	3865

		//;RF-1CH-FT.C: 141: }
		//;RF-1CH-FT.C: 142: else
		//;RF-1CH-FT.C: 143: {
		//;RF-1CH-FT.C: 144: PA1=1;
		BSR 	5H,1 			//0061 	1885

		//;RF-1CH-FT.C: 145: DelayMs(10);
		LDWI 	AH 			//0062 	2A0A
		LJUMP 	8DH 			//0063 	388D
		INCR	6BH,1 			//0064 	09EB
		LDR 	5DH,0 			//0065 	085D
		SUBWR 	6BH,0 			//0066 	0C6B
		BTSC 	STATUS,0 		//0067 	1403
		LJUMP 	91H 			//0068 	3891
		CLRWDT	 			//0069 	0001

		//;RF-1CH-FT.C: 133: if(RFData[0]==DataS[i][0] && RFData[1]==DataS[i][1] && RFData[2]==Dat
		//+                          aS[i][2])
		BCR 	STATUS,5 		//006A 	1283
		LDR 	6BH,0 			//006B 	086B
		ADDWR 	6BH,0 			//006C 	0B6B
		ADDWR 	6BH,0 			//006D 	0B6B
		ADDWI 	40H 			//006E 	2740
		STR 	FSR 			//006F 	0184
		BCR 	STATUS,7 		//0070 	1383
		LDR 	INDF,0 			//0071 	0800
		XORWR 	55H,0 			//0072 	0455
		BTSS 	STATUS,2 		//0073 	1D03
		LJUMP 	64H 			//0074 	3864
		LDR 	6BH,0 			//0075 	086B
		ADDWR 	6BH,0 			//0076 	0B6B
		ADDWR 	6BH,0 			//0077 	0B6B
		ADDWI 	41H 			//0078 	2741
		STR 	FSR 			//0079 	0184
		LDR 	56H,0 			//007A 	0856
		XORWR 	INDF,0 		//007B 	0400
		BTSS 	STATUS,2 		//007C 	1D03
		LJUMP 	64H 			//007D 	3864
		LDR 	6BH,0 			//007E 	086B
		ADDWR 	6BH,0 			//007F 	0B6B
		ADDWR 	6BH,0 			//0080 	0B6B
		ADDWI 	42H 			//0081 	2742
		STR 	FSR 			//0082 	0184
		LDR 	57H,0 			//0083 	0857
		XORWR 	INDF,0 		//0084 	0400
		BTSS 	STATUS,2 		//0085 	1D03
		LJUMP 	64H 			//0086 	3864

		//;RF-1CH-FT.C: 134: {
		//;RF-1CH-FT.C: 135: PA2=1;
		BSR 	5H,2 			//0087 	1905

		//;RF-1CH-FT.C: 136: if(PA4==0)
		BTSC 	5H,4 			//0088 	1605
		LJUMP 	61H 			//0089 	3861

		//;RF-1CH-FT.C: 137: {
		//;RF-1CH-FT.C: 138: PA1=!PA1;
		LDWI 	2H 			//008A 	2A02
		XORWR 	5H,1 			//008B 	0485

		//;RF-1CH-FT.C: 139: DelayMs(200);
		LDWI 	C8H 			//008C 	2AC8
		STR 	62H 			//008D 	01E2
		CLRR 	63H 			//008E 	0163
		LCALL 	203H 			//008F 	3203

		//;RF-1CH-FT.C: 140: PA2=0;
		BCR 	5H,2 			//0090 	1105

		//;RF-1CH-FT.C: 149: }
		//;RF-1CH-FT.C: 150: }
		//;RF-1CH-FT.C: 151: }
		//;RF-1CH-FT.C: 153: if(PA5==0)
		BCR 	STATUS,5 		//0091 	1283
		BTSC 	5H,5 			//0092 	1685
		LJUMP 	F2H 			//0093 	38F2

		//;RF-1CH-FT.C: 154: {
		//;RF-1CH-FT.C: 155: if(CountKey<1100){CountKey++;}
		LDWI 	4H 			//0094 	2A04
		SUBWR 	5CH,0 			//0095 	0C5C
		LDWI 	4CH 			//0096 	2A4C
		BTSC 	STATUS,2 		//0097 	1503
		SUBWR 	5BH,0 			//0098 	0C5B
		BTSC 	STATUS,0 		//0099 	1403
		LJUMP 	9EH 			//009A 	389E
		INCR	5BH,1 			//009B 	09DB
		BTSC 	STATUS,2 		//009C 	1503
		INCR	5CH,1 			//009D 	09DC
		LDWI 	3H 			//009E 	2A03

		//;RF-1CH-FT.C: 156: if(PA5==0 & CountKey>1000 & CountKey<1035)
		CLRR 	69H 			//009F 	0169
		SUBWR 	5CH,0 			//00A0 	0C5C
		LDWI 	E9H 			//00A1 	2AE9
		BTSC 	STATUS,2 		//00A2 	1503
		SUBWR 	5BH,0 			//00A3 	0C5B
		BTSS 	STATUS,0 		//00A4 	1C03
		LJUMP 	AFH 			//00A5 	38AF
		LDWI 	4H 			//00A6 	2A04
		SUBWR 	5CH,0 			//00A7 	0C5C
		LDWI 	BH 			//00A8 	2A0B
		BTSC 	STATUS,2 		//00A9 	1503
		SUBWR 	5BH,0 			//00AA 	0C5B
		BTSC 	STATUS,0 		//00AB 	1403
		LJUMP 	AFH 			//00AC 	38AF
		CLRR 	69H 			//00AD 	0169
		INCR	69H,1 			//00AE 	09E9
		BTSC 	5H,5 			//00AF 	1685
		LJUMP 	B3H 			//00B0 	38B3
		LDWI 	1H 			//00B1 	2A01
		LJUMP 	B4H 			//00B2 	38B4
		LDWI 	0H 			//00B3 	2A00
		STR 	68H 			//00B4 	01E8
		ANDWR 	69H,0 			//00B5 	0269
		BTSC 	STATUS,2 		//00B6 	1503
		LJUMP 	10FH 			//00B7 	390F

		//;RF-1CH-FT.C: 157: {
		//;RF-1CH-FT.C: 158: CountKey=1550;
		LDWI 	EH 			//00B8 	2A0E
		STR 	5BH 			//00B9 	01DB
		LDWI 	6H 			//00BA 	2A06
		STR 	5CH 			//00BB 	01DC

		//;RF-1CH-FT.C: 159: char i;
		//;RF-1CH-FT.C: 160: for(i=0;i<7;i++)
		CLRR 	6DH 			//00BC 	016D
		CLRWDT	 			//00BD 	0001

		//;RF-1CH-FT.C: 163: DataS[i][0]=DataS[i][1]=DataS[i][2]=0;
		BCR 	STATUS,5 		//00BE 	1283
		LDR 	6DH,0 			//00BF 	086D
		ADDWR 	6DH,0 			//00C0 	0B6D
		ADDWR 	6DH,0 			//00C1 	0B6D
		ADDWI 	42H 			//00C2 	2742
		STR 	FSR 			//00C3 	0184
		BCR 	STATUS,7 		//00C4 	1383
		CLRR 	INDF 			//00C5 	0100
		LDR 	6DH,0 			//00C6 	086D
		ADDWR 	6DH,0 			//00C7 	0B6D
		ADDWR 	6DH,0 			//00C8 	0B6D
		ADDWI 	41H 			//00C9 	2741
		STR 	FSR 			//00CA 	0184
		CLRR 	INDF 			//00CB 	0100
		LDR 	6DH,0 			//00CC 	086D
		ADDWR 	6DH,0 			//00CD 	0B6D
		ADDWR 	6DH,0 			//00CE 	0B6D
		ADDWI 	40H 			//00CF 	2740
		STR 	FSR 			//00D0 	0184
		CLRR 	INDF 			//00D1 	0100

		//;RF-1CH-FT.C: 164: Save=0;
		CLRR 	5DH 			//00D2 	015D

		//;RF-1CH-FT.C: 165: EEPROMwrite((i*3),0x00);
		CLRR 	75H 			//00D3 	0175
		LDR 	6DH,0 			//00D4 	086D
		ADDWR 	6DH,0 			//00D5 	0B6D
		ADDWR 	6DH,0 			//00D6 	0B6D
		LCALL 	234H 			//00D7 	3234

		//;RF-1CH-FT.C: 166: EEPROMwrite((i*3)+1,0x00);
		LCALL 	17DH 			//00D8 	317D
		ADDWI 	1H 			//00D9 	2701
		LCALL 	234H 			//00DA 	3234

		//;RF-1CH-FT.C: 167: EEPROMwrite((i*3)+2,0x00);
		LCALL 	17DH 			//00DB 	317D
		ADDWI 	2H 			//00DC 	2702
		LCALL 	234H 			//00DD 	3234

		//;RF-1CH-FT.C: 168: PA2=1;
		BCR 	STATUS,5 		//00DE 	1283
		BSR 	5H,2 			//00DF 	1905

		//;RF-1CH-FT.C: 169: DelayMs(100);
		LDWI 	64H 			//00E0 	2A64
		STR 	62H 			//00E1 	01E2
		CLRR 	63H 			//00E2 	0163
		LCALL 	203H 			//00E3 	3203

		//;RF-1CH-FT.C: 170: PA2=0;
		BCR 	5H,2 			//00E4 	1105

		//;RF-1CH-FT.C: 171: DelayMs(100);
		LDWI 	64H 			//00E5 	2A64
		STR 	62H 			//00E6 	01E2
		CLRR 	63H 			//00E7 	0163
		LCALL 	203H 			//00E8 	3203
		LDWI 	7H 			//00E9 	2A07
		INCR	6DH,1 			//00EA 	09ED
		SUBWR 	6DH,0 			//00EB 	0C6D
		BTSS 	STATUS,0 		//00EC 	1C03
		LJUMP 	BDH 			//00ED 	38BD
		LDWI 	30H 			//00EE 	2A30

		//;RF-1CH-FT.C: 172: }
		//;RF-1CH-FT.C: 173: EEPROMwrite(0x30,0x00);
		CLRR 	75H 			//00EF 	0175
		LCALL 	234H 			//00F0 	3234
		LJUMP 	10FH 			//00F1 	390F

		//;RF-1CH-FT.C: 176: else
		//;RF-1CH-FT.C: 177: {
		//;RF-1CH-FT.C: 178: if(CountKey>100 & CountKey<1000)
		LDWI 	0H 			//00F2 	2A00
		SUBWR 	5CH,0 			//00F3 	0C5C
		LDWI 	65H 			//00F4 	2A65
		BTSC 	STATUS,2 		//00F5 	1503
		SUBWR 	5BH,0 			//00F6 	0C5B
		BTSS 	STATUS,0 		//00F7 	1C03
		LJUMP 	10DH 			//00F8 	390D
		LDWI 	3H 			//00F9 	2A03
		SUBWR 	5CH,0 			//00FA 	0C5C
		LDWI 	E8H 			//00FB 	2AE8
		BTSC 	STATUS,2 		//00FC 	1503
		SUBWR 	5BH,0 			//00FD 	0C5B
		BTSC 	STATUS,0 		//00FE 	1403
		LJUMP 	10DH 			//00FF 	390D

		//;RF-1CH-FT.C: 179: {
		//;RF-1CH-FT.C: 180: if(Learn==1){Learn=0;}
		BTSS 	70H,2 			//0100 	1D70
		LJUMP 	104H 			//0101 	3904
		BCR 	70H,2 			//0102 	1170
		LJUMP 	107H 			//0103 	3907

		//;RF-1CH-FT.C: 181: else if(Learn==0){Learn=1;}
		BTSC 	70H,2 			//0104 	1570
		LJUMP 	107H 			//0105 	3907
		BSR 	70H,2 			//0106 	1970

		//;RF-1CH-FT.C: 182: PA2=1;
		BSR 	5H,2 			//0107 	1905

		//;RF-1CH-FT.C: 183: DelayMs(200);
		LDWI 	C8H 			//0108 	2AC8
		STR 	62H 			//0109 	01E2
		CLRR 	63H 			//010A 	0163
		LCALL 	203H 			//010B 	3203

		//;RF-1CH-FT.C: 184: PA2=0;
		BCR 	5H,2 			//010C 	1105

		//;RF-1CH-FT.C: 185: }
		//;RF-1CH-FT.C: 186: CountKey=0;
		CLRR 	5BH 			//010D 	015B
		CLRR 	5CH 			//010E 	015C

		//;RF-1CH-FT.C: 187: }
		//;RF-1CH-FT.C: 188: DelayMs(1);
		BCR 	STATUS,5 		//010F 	1283
		CLRR 	62H 			//0110 	0162
		INCR	62H,1 			//0111 	09E2
		CLRR 	63H 			//0112 	0163
		LCALL 	203H 			//0113 	3203

		//;RF-1CH-FT.C: 189: if(Learn==1)
		BTSS 	70H,2 			//0114 	1D70
		LJUMP 	59H 			//0115 	3859

		//;RF-1CH-FT.C: 190: {
		//;RF-1CH-FT.C: 191: Belink++;
		INCR	5FH,1 			//0116 	09DF

		//;RF-1CH-FT.C: 192: if(Belink>60)
		LDWI 	3DH 			//0117 	2A3D
		SUBWR 	5FH,0 			//0118 	0C5F
		BTSS 	STATUS,0 		//0119 	1C03
		LJUMP 	11EH 			//011A 	391E

		//;RF-1CH-FT.C: 193: {
		//;RF-1CH-FT.C: 194: PA2=!PA2;
		LDWI 	4H 			//011B 	2A04
		XORWR 	5H,1 			//011C 	0485

		//;RF-1CH-FT.C: 195: Belink=0;
		CLRR 	5FH 			//011D 	015F

		//;RF-1CH-FT.C: 196: }
		//;RF-1CH-FT.C: 197: if(Lock==1)
		BTSS 	70H,0 			//011E 	1C70
		LJUMP 	59H 			//011F 	3859

		//;RF-1CH-FT.C: 198: {
		//;RF-1CH-FT.C: 199: Save++;
		INCR	5DH,1 			//0120 	09DD

		//;RF-1CH-FT.C: 200: if(Save<=7)
		LDWI 	8H 			//0121 	2A08
		SUBWR 	5DH,0 			//0122 	0C5D
		BTSC 	STATUS,0 		//0123 	1403
		LJUMP 	15EH 			//0124 	395E

		//;RF-1CH-FT.C: 201: {
		//;RF-1CH-FT.C: 202: EEPROMwrite((Save*3),RFData[0]);
		LDR 	55H,0 			//0125 	0855
		STR 	75H 			//0126 	01F5
		LDR 	5DH,0 			//0127 	085D
		ADDWR 	5DH,0 			//0128 	0B5D
		ADDWR 	5DH,0 			//0129 	0B5D
		LCALL 	234H 			//012A 	3234

		//;RF-1CH-FT.C: 203: DelayMs(10);
		LCALL 	178H 			//012B 	3178
		LCALL 	203H 			//012C 	3203

		//;RF-1CH-FT.C: 204: EEPROMwrite(((Save*3)+1),RFData[1]);
		LDR 	56H,0 			//012D 	0856
		STR 	75H 			//012E 	01F5
		LDR 	5DH,0 			//012F 	085D
		ADDWR 	5DH,0 			//0130 	0B5D
		ADDWR 	5DH,0 			//0131 	0B5D
		ADDWI 	1H 			//0132 	2701
		LCALL 	234H 			//0133 	3234

		//;RF-1CH-FT.C: 205: DelayMs(10);
		LCALL 	178H 			//0134 	3178
		LCALL 	203H 			//0135 	3203

		//;RF-1CH-FT.C: 206: EEPROMwrite(((Save*3)+2),RFData[2]);
		LDR 	57H,0 			//0136 	0857
		STR 	75H 			//0137 	01F5
		LDR 	5DH,0 			//0138 	085D
		ADDWR 	5DH,0 			//0139 	0B5D
		ADDWR 	5DH,0 			//013A 	0B5D
		ADDWI 	2H 			//013B 	2702
		LCALL 	234H 			//013C 	3234

		//;RF-1CH-FT.C: 207: DelayMs(10);
		LCALL 	178H 			//013D 	3178
		LCALL 	203H 			//013E 	3203

		//;RF-1CH-FT.C: 208: EEPROMwrite(0x30,Save);
		LDR 	5DH,0 			//013F 	085D
		STR 	75H 			//0140 	01F5
		LDWI 	30H 			//0141 	2A30
		LCALL 	234H 			//0142 	3234

		//;RF-1CH-FT.C: 209: DelayMs(10);
		LCALL 	178H 			//0143 	3178
		LCALL 	203H 			//0144 	3203

		//;RF-1CH-FT.C: 210: DataS[Save-1][0]=RFData[0];
		LDR 	5DH,0 			//0145 	085D
		ADDWR 	5DH,0 			//0146 	0B5D
		ADDWR 	5DH,0 			//0147 	0B5D
		ADDWI 	3DH 			//0148 	273D
		STR 	FSR 			//0149 	0184
		LDR 	55H,0 			//014A 	0855
		BCR 	STATUS,7 		//014B 	1383
		STR 	INDF 			//014C 	0180

		//;RF-1CH-FT.C: 211: DataS[Save-1][1]=RFData[1];
		LDR 	5DH,0 			//014D 	085D
		ADDWR 	5DH,0 			//014E 	0B5D
		ADDWR 	5DH,0 			//014F 	0B5D
		ADDWI 	3EH 			//0150 	273E
		STR 	FSR 			//0151 	0184
		LDR 	56H,0 			//0152 	0856
		STR 	INDF 			//0153 	0180

		//;RF-1CH-FT.C: 212: DataS[Save-1][2]=RFData[2];
		LDR 	5DH,0 			//0154 	085D
		ADDWR 	5DH,0 			//0155 	0B5D
		ADDWR 	5DH,0 			//0156 	0B5D
		ADDWI 	3FH 			//0157 	273F
		STR 	FSR 			//0158 	0184
		LDR 	57H,0 			//0159 	0857
		STR 	INDF 			//015A 	0180

		//;RF-1CH-FT.C: 213: PA2=1;
		//;RF-1CH-FT.C: 214: DelayMs(500);
		LCALL 	183H 			//015B 	3183
		LCALL 	203H 			//015C 	3203

		//;RF-1CH-FT.C: 216: }
		LJUMP 	16DH 			//015D 	396D

		//;RF-1CH-FT.C: 217: else
		//;RF-1CH-FT.C: 218: {
		//;RF-1CH-FT.C: 219: Save=7;
		LDWI 	7H 			//015E 	2A07
		STR 	5DH 			//015F 	01DD

		//;RF-1CH-FT.C: 220: char i;
		//;RF-1CH-FT.C: 221: PA2=0;
		BCR 	5H,2 			//0160 	1105

		//;RF-1CH-FT.C: 222: for(i=0;i<5;i++)
		CLRR 	6AH 			//0161 	016A

		//;RF-1CH-FT.C: 223: {
		//;RF-1CH-FT.C: 224: PA2=!PA2;
		LDWI 	4H 			//0162 	2A04
		XORWR 	5H,1 			//0163 	0485

		//;RF-1CH-FT.C: 225: DelayMs(200);
		LDWI 	C8H 			//0164 	2AC8
		STR 	62H 			//0165 	01E2
		CLRR 	63H 			//0166 	0163
		LCALL 	203H 			//0167 	3203
		LDWI 	5H 			//0168 	2A05
		INCR	6AH,1 			//0169 	09EA
		SUBWR 	6AH,0 			//016A 	0C6A
		BTSS 	STATUS,0 		//016B 	1C03
		LJUMP 	162H 			//016C 	3962

		//;RF-1CH-FT.C: 215: PA2=0;
		BCR 	5H,2 			//016D 	1105

		//;RF-1CH-FT.C: 228: }
		//;RF-1CH-FT.C: 229: Lock=0;
		BCR 	70H,0 			//016E 	1070

		//;RF-1CH-FT.C: 230: Learn=0;
		BCR 	70H,2 			//016F 	1170

		//;RF-1CH-FT.C: 231: Belink=0;
		CLRR 	5FH 			//0170 	015F
		LJUMP 	59H 			//0171 	3859
		BCR 	STATUS,7 		//0172 	1383
		STR 	INDF 			//0173 	0180
		CLRR 	62H 			//0174 	0162
		INCR	62H,1 			//0175 	09E2
		CLRR 	63H 			//0176 	0163
		RET		 					//0177 	0004
		LDWI 	AH 			//0178 	2A0A
		BCR 	STATUS,5 		//0179 	1283
		STR 	62H 			//017A 	01E2
		CLRR 	63H 			//017B 	0163
		RET		 					//017C 	0004
		CLRR 	75H 			//017D 	0175
		BCR 	STATUS,5 		//017E 	1283
		LDR 	6DH,0 			//017F 	086D
		ADDWR 	6DH,0 			//0180 	0B6D
		ADDWR 	6DH,0 			//0181 	0B6D
		RET		 					//0182 	0004
		BSR 	5H,2 			//0183 	1905
		LDWI 	F4H 			//0184 	2AF4
		STR 	62H 			//0185 	01E2
		LDWI 	1H 			//0186 	2A01
		STR 	63H 			//0187 	01E3
		RET		 					//0188 	0004

		//;RF-1CH-FT.C: 38: if(PAIE && PAIF)
		BTSC 	INTCON,3 		//0189 	158B
		BTSS 	INTCON,0 		//018A 	1C0B
		LJUMP 	18DH 			//018B 	398D

		//;RF-1CH-FT.C: 39: {
		//;RF-1CH-FT.C: 40: PAIF = 0;
		BCR 	INTCON,0 		//018C 	100B

		//;RF-1CH-FT.C: 41: }
		//;RF-1CH-FT.C: 42: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//018D 	1A83
		BTSS 	CH,1 			//018E 	1C8C
		LJUMP 	1FAH 			//018F 	39FA
		BCR 	STATUS,5 		//0190 	1283
		BTSS 	CH,1 			//0191 	1C8C
		LJUMP 	1FAH 			//0192 	39FA

		//;RF-1CH-FT.C: 43: {
		//;RF-1CH-FT.C: 44: TMR2IF = 0;
		BCR 	CH,1 			//0193 	108C
		CLRWDT	 			//0194 	0001

		//;RF-1CH-FT.C: 47: if(PA4){Finish=0;}
		BCR 	STATUS,5 		//0195 	1283
		BTSC 	5H,4 			//0196 	1605
		BCR 	70H,1 			//0197 	10F0

		//;RF-1CH-FT.C: 48: if(PA0==0){Time++;Frist=1;Timer=0;}
		BTSC 	5H,0 			//0198 	1405
		LJUMP 	19EH 			//0199 	399E
		INCR	78H,1 			//019A 	09F8
		BSR 	70H,4 			//019B 	1A70
		CLRR 	79H 			//019C 	0179
		LJUMP 	1FAH 			//019D 	39FA

		//;RF-1CH-FT.C: 49: else
		//;RF-1CH-FT.C: 50: {
		//;RF-1CH-FT.C: 51: Timer++;
		INCR	79H,1 			//019E 	09F9

		//;RF-1CH-FT.C: 52: if(Timer>250){Timer=0;Finish=0; if(PA4){PA1=0;}}
		LDWI 	FBH 			//019F 	2AFB
		SUBWR 	79H,0 			//01A0 	0C79
		BTSS 	STATUS,0 		//01A1 	1C03
		LJUMP 	1A8H 			//01A2 	39A8
		CLRR 	79H 			//01A3 	0179
		BCR 	70H,1 			//01A4 	10F0
		BTSS 	5H,4 			//01A5 	1E05
		LJUMP 	1A8H 			//01A6 	39A8
		BCR 	5H,1 			//01A7 	1085

		//;RF-1CH-FT.C: 53: if(Frist==1 && Finish==0 && Lock==0)
		BTSC 	70H,4 			//01A8 	1670
		BTSC 	70H,1 			//01A9 	14F0
		LJUMP 	1FAH 			//01AA 	39FA
		BTSC 	70H,0 			//01AB 	1470
		LJUMP 	1FAH 			//01AC 	39FA

		//;RF-1CH-FT.C: 54: {
		//;RF-1CH-FT.C: 55: Timer=0;
		CLRR 	79H 			//01AD 	0179

		//;RF-1CH-FT.C: 56: if(Start==1)
		BTSS 	70H,3 			//01AE 	1DF0
		LJUMP 	1EDH 			//01AF 	39ED

		//;RF-1CH-FT.C: 57: {
		//;RF-1CH-FT.C: 58: Bit--;
		DECR 	5EH,1 			//01B0 	0DDE

		//;RF-1CH-FT.C: 59: if(Time>10 & Time< 30)
		LDWI 	BH 			//01B1 	2A0B
		SUBWR 	78H,0 			//01B2 	0C78
		BTSS 	STATUS,0 		//01B3 	1C03
		LJUMP 	1BDH 			//01B4 	39BD
		LDWI 	1EH 			//01B5 	2A1E
		SUBWR 	78H,0 			//01B6 	0C78
		BTSC 	STATUS,0 		//01B7 	1403
		LJUMP 	1BCH 			//01B8 	39BC

		//;RF-1CH-FT.C: 60: {
		//;RF-1CH-FT.C: 61: Buffer = Buffer << 1;
		BCR 	STATUS,0 		//01B9 	1003
		RLR 	76H,0 			//01BA 	0576
		LJUMP 	1C1H 			//01BB 	39C1

		//;RF-1CH-FT.C: 62: }
		//;RF-1CH-FT.C: 63: else
		//;RF-1CH-FT.C: 64: {
		//;RF-1CH-FT.C: 65: Buffer = Buffer << 1;
		BCR 	STATUS,0 		//01BC 	1003
		RLR 	76H,0 			//01BD 	0576
		STR 	76H 			//01BE 	01F6

		//;RF-1CH-FT.C: 66: Buffer = Buffer + 1;
		LDR 	76H,0 			//01BF 	0876
		ADDWI 	1H 			//01C0 	2701
		STR 	76H 			//01C1 	01F6

		//;RF-1CH-FT.C: 68: }
		//;RF-1CH-FT.C: 69: if(Bit == 0)
		LDR 	5EH,0 			//01C2 	085E
		BTSS 	STATUS,2 		//01C3 	1D03
		LJUMP 	1EDH 			//01C4 	39ED

		//;RF-1CH-FT.C: 70: {
		//;RF-1CH-FT.C: 71: Bit=8;
		LDWI 	8H 			//01C5 	2A08
		STR 	5EH 			//01C6 	01DE

		//;RF-1CH-FT.C: 72: Data[Count]=RFData[Count];
		LDR 	77H,0 			//01C7 	0877
		ADDWI 	55H 			//01C8 	2755
		STR 	FSR 			//01C9 	0184
		BCR 	STATUS,7 		//01CA 	1383
		LDR 	INDF,0 			//01CB 	0800
		STR 	71H 			//01CC 	01F1
		LDR 	77H,0 			//01CD 	0877
		ADDWI 	58H 			//01CE 	2758
		STR 	FSR 			//01CF 	0184
		LDR 	71H,0 			//01D0 	0871
		STR 	INDF 			//01D1 	0180

		//;RF-1CH-FT.C: 73: RFData[Count]=Buffer;
		LDR 	77H,0 			//01D2 	0877
		ADDWI 	55H 			//01D3 	2755
		STR 	FSR 			//01D4 	0184
		LDR 	76H,0 			//01D5 	0876
		STR 	INDF 			//01D6 	0180

		//;RF-1CH-FT.C: 74: Count++;
		INCR	77H,1 			//01D7 	09F7

		//;RF-1CH-FT.C: 76: if(Count>=3)
		LDWI 	3H 			//01D8 	2A03
		SUBWR 	77H,0 			//01D9 	0C77
		BTSS 	STATUS,0 		//01DA 	1C03
		LJUMP 	1ECH 			//01DB 	39EC

		//;RF-1CH-FT.C: 77: {
		//;RF-1CH-FT.C: 78: Count=0;
		CLRR 	77H 			//01DC 	0177

		//;RF-1CH-FT.C: 79: Start=0;
		BCR 	70H,3 			//01DD 	11F0

		//;RF-1CH-FT.C: 80: if(Data[0]==RFData[0] && Data[1]==RFData[1] && Data[2]==RFData[2])
		LDR 	58H,0 			//01DE 	0858
		XORWR 	55H,0 			//01DF 	0455
		BTSS 	STATUS,2 		//01E0 	1D03
		LJUMP 	1ECH 			//01E1 	39EC
		LDR 	59H,0 			//01E2 	0859
		XORWR 	56H,0 			//01E3 	0456
		BTSS 	STATUS,2 		//01E4 	1D03
		LJUMP 	1ECH 			//01E5 	39EC
		LDR 	5AH,0 			//01E6 	085A
		XORWR 	57H,0 			//01E7 	0457
		BTSS 	STATUS,2 		//01E8 	1D03
		LJUMP 	1ECH 			//01E9 	39EC

		//;RF-1CH-FT.C: 81: {
		//;RF-1CH-FT.C: 82: Finish=1;
		BSR 	70H,1 			//01EA 	18F0

		//;RF-1CH-FT.C: 83: Lock=1;
		BSR 	70H,0 			//01EB 	1870

		//;RF-1CH-FT.C: 84: }
		//;RF-1CH-FT.C: 85: }
		//;RF-1CH-FT.C: 86: Buffer=0;
		CLRR 	76H 			//01EC 	0176

		//;RF-1CH-FT.C: 87: }
		//;RF-1CH-FT.C: 88: }
		//;RF-1CH-FT.C: 89: if(Time>120 & Time<250){Start=1;Bit=8;}
		LDWI 	79H 			//01ED 	2A79
		SUBWR 	78H,0 			//01EE 	0C78
		BTSS 	STATUS,0 		//01EF 	1C03
		LJUMP 	1F8H 			//01F0 	39F8
		LDWI 	FAH 			//01F1 	2AFA
		SUBWR 	78H,0 			//01F2 	0C78
		BTSC 	STATUS,0 		//01F3 	1403
		LJUMP 	1F8H 			//01F4 	39F8
		BSR 	70H,3 			//01F5 	19F0
		LDWI 	8H 			//01F6 	2A08
		STR 	5EH 			//01F7 	01DE

		//;RF-1CH-FT.C: 90: Frist=0;
		BCR 	70H,4 			//01F8 	1270

		//;RF-1CH-FT.C: 91: Time=0;
		CLRR 	78H 			//01F9 	0178
		LDR 	74H,0 			//01FA 	0874
		STR 	PCLATH 			//01FB 	018A
		LDR 	73H,0 			//01FC 	0873
		STR 	FSR 			//01FD 	0184
		SWAPR 	72H,0 			//01FE 	0772
		STR 	STATUS 			//01FF 	0183
		SWAPR 	7EH,1 			//0200 	07FE
		SWAPR 	7EH,0 			//0201 	077E
		RETI		 			//0202 	0009

		//;RF-1CH-FT.C: 301: unsigned int a,b;
		//;RF-1CH-FT.C: 302: for(a=0;a<Time;a++)
		CLRR 	64H 			//0203 	0164
		CLRR 	65H 			//0204 	0165
		LDR 	63H,0 			//0205 	0863
		SUBWR 	65H,0 			//0206 	0C65
		BTSS 	STATUS,2 		//0207 	1D03
		LJUMP 	20BH 			//0208 	3A0B
		LDR 	62H,0 			//0209 	0862
		SUBWR 	64H,0 			//020A 	0C64
		BTSC 	STATUS,0 		//020B 	1403
		RET		 					//020C 	0004

		//;RF-1CH-FT.C: 303: {
		//;RF-1CH-FT.C: 304: for(b=0;b<5;b++)
		CLRR 	66H 			//020D 	0166
		CLRR 	67H 			//020E 	0167

		//;RF-1CH-FT.C: 305: {
		//;RF-1CH-FT.C: 306: DelayUs(197);
		LDWI 	C5H 			//020F 	2AC5
		LCALL 	256H 			//0210 	3256
		INCR	66H,1 			//0211 	09E6
		BTSC 	STATUS,2 		//0212 	1503
		INCR	67H,1 			//0213 	09E7
		LDWI 	0H 			//0214 	2A00
		SUBWR 	67H,0 			//0215 	0C67
		LDWI 	5H 			//0216 	2A05
		BTSC 	STATUS,2 		//0217 	1503
		SUBWR 	66H,0 			//0218 	0C66
		BTSS 	STATUS,0 		//0219 	1C03
		LJUMP 	20FH 			//021A 	3A0F
		INCR	64H,1 			//021B 	09E4
		BTSC 	STATUS,2 		//021C 	1503
		INCR	65H,1 			//021D 	09E5
		LJUMP 	205H 			//021E 	3A05

		//;RF-1CH-FT.C: 239: OSCCON = 0B01110001;
		LDWI 	71H 			//021F 	2A71
		BSR 	STATUS,5 		//0220 	1A83
		STR 	FH 			//0221 	018F

		//;RF-1CH-FT.C: 240: INTCON = 0;
		CLRR 	INTCON 			//0222 	010B

		//;RF-1CH-FT.C: 241: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0223 	1283
		CLRR 	5H 			//0224 	0105

		//;RF-1CH-FT.C: 242: TRISA = 0B11111001;
		LDWI 	F9H 			//0225 	2AF9
		BSR 	STATUS,5 		//0226 	1A83
		STR 	5H 			//0227 	0185

		//;RF-1CH-FT.C: 243: WPUA = 0B11111000;
		LDWI 	F8H 			//0228 	2AF8
		STR 	15H 			//0229 	0195

		//;RF-1CH-FT.C: 244: OPTION = 0B00001000;
		LDWI 	8H 			//022A 	2A08
		STR 	1H 			//022B 	0181

		//;RF-1CH-FT.C: 245: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//022C 	1283
		CLRR 	1BH 			//022D 	011B

		//;RF-1CH-FT.C: 246: TRISA0 =1;
		BSR 	STATUS,5 		//022E 	1A83
		BSR 	5H,0 			//022F 	1805

		//;RF-1CH-FT.C: 247: PAIF =0;
		BCR 	INTCON,0 		//0230 	100B

		//;RF-1CH-FT.C: 248: IOCA0 =1;
		BSR 	16H,0 			//0231 	1816

		//;RF-1CH-FT.C: 249: PAIE =1;
		BSR 	INTCON,3 		//0232 	198B
		RET		 					//0233 	0004
		STR 	60H 			//0234 	01E0

		//;RF-1CH-FT.C: 278: GIE = 0;
		BCR 	INTCON,7 		//0235 	138B

		//;RF-1CH-FT.C: 279: while(GIE);
		BTSC 	INTCON,7 		//0236 	178B
		LJUMP 	236H 			//0237 	3A36

		//;RF-1CH-FT.C: 280: EEADR = EEAddr;
		LDR 	60H,0 			//0238 	0860
		BSR 	STATUS,5 		//0239 	1A83
		STR 	1BH 			//023A 	019B

		//;RF-1CH-FT.C: 281: EEDAT = Data;
		LDR 	75H,0 			//023B 	0875
		STR 	1AH 			//023C 	019A

		//;RF-1CH-FT.C: 282: EEIF = 0;
		BCR 	STATUS,5 		//023D 	1283
		BCR 	CH,7 			//023E 	138C

		//;RF-1CH-FT.C: 283: EECON1 |= 0x34;
		LDWI 	34H 			//023F 	2A34
		BSR 	STATUS,5 		//0240 	1A83
		IORWR 	1CH,1 			//0241 	039C

		//;RF-1CH-FT.C: 284: WR = 1;
		BSR 	1DH,0 			//0242 	181D

		//;RF-1CH-FT.C: 285: while(WR);
		BTSC 	1DH,0 			//0243 	141D
		LJUMP 	243H 			//0244 	3A43

		//;RF-1CH-FT.C: 286: GIE = 1;
		BSR 	INTCON,7 		//0245 	1B8B
		RET		 					//0246 	0004

		//;RF-1CH-FT.C: 255: T2CON = 0B00000001;
		LDWI 	1H 			//0247 	2A01
		STR 	12H 			//0248 	0192

		//;RF-1CH-FT.C: 256: TMR2 = 0;
		CLRR 	11H 			//0249 	0111

		//;RF-1CH-FT.C: 257: PR2 = 50;
		LDWI 	32H 			//024A 	2A32
		BSR 	STATUS,5 		//024B 	1A83
		STR 	12H 			//024C 	0192

		//;RF-1CH-FT.C: 258: TMR2IF = 0;
		BCR 	STATUS,5 		//024D 	1283
		BCR 	CH,1 			//024E 	108C

		//;RF-1CH-FT.C: 259: TMR2IE = 1;
		BSR 	STATUS,5 		//024F 	1A83
		BSR 	CH,1 			//0250 	188C

		//;RF-1CH-FT.C: 260: TMR2ON = 1;
		BCR 	STATUS,5 		//0251 	1283
		BSR 	12H,2 			//0252 	1912

		//;RF-1CH-FT.C: 261: PEIE=1;
		BSR 	INTCON,6 		//0253 	1B0B

		//;RF-1CH-FT.C: 262: GIE = 1;
		BSR 	INTCON,7 		//0254 	1B8B
		RET		 					//0255 	0004
		STR 	60H 			//0256 	01E0

		//;RF-1CH-FT.C: 291: unsigned char a;
		//;RF-1CH-FT.C: 292: for(a=0;a<Time;a++)
		CLRR 	61H 			//0257 	0161
		LDR 	60H,0 			//0258 	0860
		SUBWR 	61H,0 			//0259 	0C61
		BTSC 	STATUS,0 		//025A 	1403
		RET		 					//025B 	0004

		//;RF-1CH-FT.C: 293: {
		//;RF-1CH-FT.C: 294: __nop();
		NOP		 					//025C 	0000
		CLRWDT	 			//025D 	0001
		BCR 	STATUS,5 		//025E 	1283
		INCR	61H,1 			//025F 	09E1
		LJUMP 	258H 			//0260 	3A58
		CLRWDT	 			//0261 	0001
		CLRR 	INDF 			//0262 	0100
		INCR	FSR,1 			//0263 	0984
		XORWR 	FSR,0 			//0264 	0404
		BTSC 	STATUS,2 		//0265 	1503
		RETW 	0H 			//0266 	2100
		XORWR 	FSR,0 			//0267 	0404
		LJUMP 	262H 			//0268 	3A62
		STR 	60H 			//0269 	01E0

		//;RF-1CH-FT.C: 268: unsigned char ReEEPROMread;
		//;RF-1CH-FT.C: 270: EEADR = EEAddr;
		BSR 	STATUS,5 		//026A 	1A83
		STR 	1BH 			//026B 	019B

		//;RF-1CH-FT.C: 271: RD = 1;
		BSR 	1CH,0 			//026C 	181C

		//;RF-1CH-FT.C: 272: ReEEPROMread = EEDAT;
		LDR 	1AH,0 			//026D 	081A
		BCR 	STATUS,5 		//026E 	1283
		STR 	61H 			//026F 	01E1

		//;RF-1CH-FT.C: 273: return ReEEPROMread;
		RET		 					//0270 	0004
			END
