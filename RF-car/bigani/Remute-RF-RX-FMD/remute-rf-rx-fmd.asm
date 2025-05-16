//Deviec:FT60E02X
//-----------------------Variable---------------------------------
		_PA2		EQU		05H
		_PA4		EQU		05H
		_PA6		EQU		05H
		_PA7		EQU		05H
		_PC0		EQU		07H
		_PC1		EQU		07H
		_PC2		EQU		07H
		_PC3		EQU		07H
		_PC4		EQU		07H
		_PC5		EQU		07H
		_PC6		EQU		07H
		_PC7		EQU		07H
		_PEIE		EQU		0BH
		_GIE		EQU		0BH
		_TMR2IF		EQU		0CH
		_EEIF		EQU		0CH
		_TMR2ON		EQU		12H
		_TMR2IE		EQU		8CH
		_RD		EQU		9CH
		_WR		EQU		9DH
		_Belink		EQU		3EH
		_CountKey1		EQU		3CH
		_CountKey2		EQU		3AH
		_Timer		EQU		38H
		_Time		EQU		70H
		_True		EQU		48H
		_State		EQU		47H
		_Set		EQU		46H
		_Data		EQU		35H
		_DataM		EQU		32H
		_DataS		EQU		20H
		_RFData		EQU		2FH
		_RFCode		EQU		45H
		_Frist		EQU		74H
		_Start		EQU		44H
		_Count		EQU		73H
		_Lock		EQU		43H
		_Buffer		EQU		72H
		_Bit		EQU		42H
		_Finish		EQU		41H
		_Learn		EQU		40H
		_Save		EQU		58H
//		main@i_841		EQU		54H
//		main@i_840		EQU		57H
//		main@i_837		EQU		56H
//		main@i		EQU		55H
//		EEPROMwrite@EEAddr		EQU		49H
//		EEPROMwrite@EEAddr		EQU		49H
//		EEPROMwrite@Data		EQU		79H
//		EEPROMwrite@EEAddr		EQU		49H
//		EEPROMread@EEAddr		EQU		49H
//		EEPROMread@ReEEPROMread		EQU		4AH
//		EEPROMread@EEAddr		EQU		49H
//		EEPROMread@EEAddr		EQU		49H
//		DelayMs@b		EQU		4FH
//		DelayMs@a		EQU		4DH
//		DelayMs@Time		EQU		4BH
//		DelayUs@Time		EQU		49H
//		DelayUs@a		EQU		4AH
//		DelayUs@Time		EQU		49H
//		DelayUs@Time		EQU		49H
//-----------------------Variable END---------------------------------

		LJUMP 	0CH 			//0000 	380C
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	76H 			//0006 	01F6
		LDR 	FSR,0 			//0007 	0804
		STR 	77H 			//0008 	01F7
		LDR 	PCLATH,0 		//0009 	080A
		STR 	78H 			//000A 	01F8
		LJUMP 	1FCH 			//000B 	39FC
		LJUMP 	0DH 			//000C 	380D
		LDWI 	70H 			//000D 	2A70
		STR 	FSR 			//000E 	0184
		LDWI 	75H 			//000F 	2A75
		LCALL 	300H 			//0010 	3300
		LDWI 	20H 			//0011 	2A20
		BCR 	STATUS,7 		//0012 	1383
		STR 	FSR 			//0013 	0184
		LDWI 	49H 			//0014 	2A49
		LCALL 	300H 			//0015 	3300
		CLRR 	STATUS 			//0016 	0103
		LJUMP 	18H 			//0017 	3818

		//;Remute-RF-RX-FMD.C: 95: POWER_INITIAL();
		LCALL 	2B3H 			//0018 	32B3

		//;Remute-RF-RX-FMD.C: 96: TIMER2_INITIAL();
		LCALL 	2DDH 			//0019 	32DD

		//;Remute-RF-RX-FMD.C: 97: PA4=1;PC0=1;PC1=1;PC2=1;PC3=1;PC4=1;PC5=1;PC6=1;;
		LCALL 	1CDH 			//001A 	31CD

		//;Remute-RF-RX-FMD.C: 98: Save=EEPROMread(0x50);
		LDWI 	50H 			//001B 	2A50
		LCALL 	308H 			//001C 	3308
		STR 	58H 			//001D 	01D8

		//;Remute-RF-RX-FMD.C: 99: if(Save<6)
		LDWI 	6H 			//001E 	2A06
		SUBWR 	58H,0 			//001F 	0C58
		BTSC 	STATUS,0 		//0020 	1403
		LJUMP 	40H 			//0021 	3840

		//;Remute-RF-RX-FMD.C: 100: {
		//;Remute-RF-RX-FMD.C: 101: char i;
		//;Remute-RF-RX-FMD.C: 102: for(i=0;i<Save;i++)
		CLRR 	55H 			//0022 	0155
		LDR 	58H,0 			//0023 	0858
		SUBWR 	55H,0 			//0024 	0C55
		BTSC 	STATUS,0 		//0025 	1403
		LJUMP 	40H 			//0026 	3840
		CLRWDT	 			//0027 	0001

		//;Remute-RF-RX-FMD.C: 105: DataS[i][0]=EEPROMread(Save*3);
		BCR 	STATUS,5 		//0028 	1283
		LDR 	55H,0 			//0029 	0855
		ADDWR 	55H,0 			//002A 	0B55
		ADDWR 	55H,0 			//002B 	0B55
		ADDWI 	20H 			//002C 	2720
		STR 	FSR 			//002D 	0184
		LDR 	58H,0 			//002E 	0858
		ADDWR 	58H,0 			//002F 	0B58
		ADDWR 	58H,0 			//0030 	0B58
		LCALL 	308H 			//0031 	3308

		//;Remute-RF-RX-FMD.C: 106: DataS[i][1]=EEPROMread((Save*3)+1);
		LCALL 	1E7H 			//0032 	31E7
		ADDWI 	21H 			//0033 	2721
		STR 	FSR 			//0034 	0184
		LCALL 	1F7H 			//0035 	31F7
		LCALL 	308H 			//0036 	3308

		//;Remute-RF-RX-FMD.C: 107: DataS[i][2]=EEPROMread((Save*3)+2);
		LCALL 	1E7H 			//0037 	31E7
		ADDWI 	22H 			//0038 	2722
		STR 	FSR 			//0039 	0184
		LCALL 	1F2H 			//003A 	31F2
		LCALL 	308H 			//003B 	3308
		BCR 	STATUS,7 		//003C 	1383
		STR 	INDF 			//003D 	0180
		INCR	55H,1 			//003E 	09D5
		LJUMP 	23H 			//003F 	3823

		//;Remute-RF-RX-FMD.C: 108: }
		//;Remute-RF-RX-FMD.C: 109: }
		//;Remute-RF-RX-FMD.C: 111: State=8;
		LDWI 	8H 			//0040 	2A08
		STR 	47H 			//0041 	01C7

		//;Remute-RF-RX-FMD.C: 112: Set=1;
		LDWI 	1H 			//0042 	2A01
		STR 	46H 			//0043 	01C6

		//;Remute-RF-RX-FMD.C: 113: Start=0;
		CLRR 	44H 			//0044 	0144

		//;Remute-RF-RX-FMD.C: 115: while(1)
		CLRWDT	 			//0045 	0001

		//;Remute-RF-RX-FMD.C: 118: if(Lock==1 & Learn==0)
		BCR 	STATUS,5 		//0046 	1283
		DECRSZ 	43H,0 		//0047 	0E43
		LJUMP 	9FH 			//0048 	389F
		LDR 	40H,0 			//0049 	0840
		BTSS 	STATUS,2 		//004A 	1D03
		LJUMP 	9FH 			//004B 	389F

		//;Remute-RF-RX-FMD.C: 119: {
		//;Remute-RF-RX-FMD.C: 120: Lock=0;
		CLRR 	43H 			//004C 	0143

		//;Remute-RF-RX-FMD.C: 121: char i;
		//;Remute-RF-RX-FMD.C: 122: for(i=0;i<Save;i++)
		CLRR 	56H 			//004D 	0156
		LJUMP 	50H 			//004E 	3850

		//;Remute-RF-RX-FMD.C: 127: break;
		INCR	56H,1 			//004F 	09D6
		LDR 	58H,0 			//0050 	0858
		SUBWR 	56H,0 			//0051 	0C56
		BTSC 	STATUS,0 		//0052 	1403
		LJUMP 	72H 			//0053 	3872

		//;Remute-RF-RX-FMD.C: 123: {
		//;Remute-RF-RX-FMD.C: 124: if(DataM[0]==DataS[i][0] && DataM[1]==DataS[i][1] && DataM[2]=
		//+                          =DataS[i][2])
		LDR 	56H,0 			//0054 	0856
		ADDWR 	56H,0 			//0055 	0B56
		ADDWR 	56H,0 			//0056 	0B56
		ADDWI 	20H 			//0057 	2720
		STR 	FSR 			//0058 	0184
		BCR 	STATUS,7 		//0059 	1383
		LDR 	INDF,0 			//005A 	0800
		XORWR 	32H,0 			//005B 	0432
		BTSS 	STATUS,2 		//005C 	1D03
		LJUMP 	4FH 			//005D 	384F
		LDR 	56H,0 			//005E 	0856
		ADDWR 	56H,0 			//005F 	0B56
		ADDWR 	56H,0 			//0060 	0B56
		ADDWI 	21H 			//0061 	2721
		STR 	FSR 			//0062 	0184
		LDR 	33H,0 			//0063 	0833
		XORWR 	INDF,0 		//0064 	0400
		BTSS 	STATUS,2 		//0065 	1D03
		LJUMP 	4FH 			//0066 	384F
		LDR 	56H,0 			//0067 	0856
		ADDWR 	56H,0 			//0068 	0B56
		ADDWR 	56H,0 			//0069 	0B56
		ADDWI 	22H 			//006A 	2722
		STR 	FSR 			//006B 	0184
		LDR 	34H,0 			//006C 	0834
		XORWR 	INDF,0 		//006D 	0400
		BTSS 	STATUS,2 		//006E 	1D03
		LJUMP 	4FH 			//006F 	384F

		//;Remute-RF-RX-FMD.C: 125: {
		//;Remute-RF-RX-FMD.C: 126: True=1;
		LDWI 	1H 			//0070 	2A01
		STR 	48H 			//0071 	01C8

		//;Remute-RF-RX-FMD.C: 128: }
		//;Remute-RF-RX-FMD.C: 129: }
		//;Remute-RF-RX-FMD.C: 130: if(True==1)
		DECRSZ 	48H,0 		//0072 	0E48
		LJUMP 	9FH 			//0073 	389F
		LJUMP 	8DH 			//0074 	388D

		//;Remute-RF-RX-FMD.C: 133: {
		//;Remute-RF-RX-FMD.C: 134: case 1:PA4=1;PC0=1;PC1=1;PC2=1;PC3=1;PC4=1;PC5=1;PC6=1;;State=
		//+                          8;break;
		LCALL 	1CDH 			//0075 	31CD
		LDWI 	8H 			//0076 	2A08
		STR 	47H 			//0077 	01C7
		LJUMP 	9BH 			//0078 	389B

		//;Remute-RF-RX-FMD.C: 135: case 2:PA4=0;PC0=0;PC1=0;PC2=0;PC3=0;PC4=0;PC5=0;PC6=0;;State=
		//+                          0;break;
		BCR 	5H,4 			//0079 	1205
		BCR 	7H,0 			//007A 	1007
		BCR 	7H,1 			//007B 	1087
		BCR 	7H,2 			//007C 	1107
		BCR 	7H,3 			//007D 	1187
		BCR 	7H,4 			//007E 	1207
		BCR 	7H,5 			//007F 	1287
		BCR 	7H,6 			//0080 	1307
		CLRR 	47H 			//0081 	0147
		LJUMP 	9BH 			//0082 	389B
		INCR	47H,1 			//0083 	09C7
		LDWI 	8H 			//0084 	2A08
		SUBWR 	47H,0 			//0085 	0C47
		BTSC 	STATUS,0 		//0086 	1403
		LJUMP 	76H 			//0087 	3876
		LJUMP 	9BH 			//0088 	389B
		DECR 	47H,1 			//0089 	0DC7
		INCRSZ 	47H,0 		//008A 	0A47
		LJUMP 	9BH 			//008B 	389B
		LJUMP 	81H 			//008C 	3881
		LDR 	45H,0 			//008D 	0845
		XORWI 	1H 			//008E 	2601
		BTSC 	STATUS,2 		//008F 	1503
		LJUMP 	75H 			//0090 	3875
		XORWI 	3H 			//0091 	2603
		BTSC 	STATUS,2 		//0092 	1503
		LJUMP 	79H 			//0093 	3879
		XORWI 	6H 			//0094 	2606
		BTSC 	STATUS,2 		//0095 	1503
		LJUMP 	83H 			//0096 	3883
		XORWI 	CH 			//0097 	260C
		BTSC 	STATUS,2 		//0098 	1503
		LJUMP 	89H 			//0099 	3889
		LJUMP 	9BH 			//009A 	389B

		//;Remute-RF-RX-FMD.C: 140: True=0;
		CLRR 	48H 			//009B 	0148

		//;Remute-RF-RX-FMD.C: 141: PC7=1;
		//;Remute-RF-RX-FMD.C: 142: DelayMs(200);
		LCALL 	1EDH 			//009C 	31ED
		LCALL 	297H 			//009D 	3297

		//;Remute-RF-RX-FMD.C: 143: PC7=0;
		BCR 	7H,7 			//009E 	1387

		//;Remute-RF-RX-FMD.C: 144: }
		//;Remute-RF-RX-FMD.C: 145: }
		//;Remute-RF-RX-FMD.C: 147: if(PA6==0)
		BTSC 	5H,6 			//009F 	1705
		LJUMP 	D5H 			//00A0 	38D5

		//;Remute-RF-RX-FMD.C: 148: {
		//;Remute-RF-RX-FMD.C: 149: if(CountKey1<240){CountKey1++;}
		LDWI 	0H 			//00A1 	2A00
		SUBWR 	3DH,0 			//00A2 	0C3D
		LDWI 	F0H 			//00A3 	2AF0
		BTSC 	STATUS,2 		//00A4 	1503
		SUBWR 	3CH,0 			//00A5 	0C3C
		BTSC 	STATUS,0 		//00A6 	1403
		LJUMP 	ABH 			//00A7 	38AB
		INCR	3CH,1 			//00A8 	09BC
		BTSC 	STATUS,2 		//00A9 	1503
		INCR	3DH,1 			//00AA 	09BD
		LDWI 	0H 			//00AB 	2A00

		//;Remute-RF-RX-FMD.C: 150: if(PA6==0 & CountKey1>225 & CountKey1<235)
		CLRR 	52H 			//00AC 	0152
		SUBWR 	3DH,0 			//00AD 	0C3D
		LDWI 	E2H 			//00AE 	2AE2
		BTSC 	STATUS,2 		//00AF 	1503
		SUBWR 	3CH,0 			//00B0 	0C3C
		BTSS 	STATUS,0 		//00B1 	1C03
		LJUMP 	BCH 			//00B2 	38BC
		LDWI 	0H 			//00B3 	2A00
		SUBWR 	3DH,0 			//00B4 	0C3D
		LDWI 	EBH 			//00B5 	2AEB
		BTSC 	STATUS,2 		//00B6 	1503
		SUBWR 	3CH,0 			//00B7 	0C3C
		BTSC 	STATUS,0 		//00B8 	1403
		LJUMP 	BCH 			//00B9 	38BC
		CLRR 	52H 			//00BA 	0152
		INCR	52H,1 			//00BB 	09D2
		BTSC 	5H,6 			//00BC 	1705
		LJUMP 	C0H 			//00BD 	38C0
		LDWI 	1H 			//00BE 	2A01
		LJUMP 	C1H 			//00BF 	38C1
		LDWI 	0H 			//00C0 	2A00
		STR 	51H 			//00C1 	01D1
		ANDWR 	52H,0 			//00C2 	0252
		BTSC 	STATUS,2 		//00C3 	1503
		LJUMP 	D7H 			//00C4 	38D7

		//;Remute-RF-RX-FMD.C: 151: {
		//;Remute-RF-RX-FMD.C: 152: CountKey1=250;
		LDWI 	FAH 			//00C5 	2AFA
		STR 	3CH 			//00C6 	01BC
		CLRR 	3DH 			//00C7 	013D

		//;Remute-RF-RX-FMD.C: 155: if(Learn==1){Learn=0;}
		DECRSZ 	40H,0 		//00C8 	0E40
		LJUMP 	CCH 			//00C9 	38CC
		CLRR 	40H 			//00CA 	0140
		LJUMP 	D1H 			//00CB 	38D1

		//;Remute-RF-RX-FMD.C: 156: else if(Learn==0){Learn=1;}
		LDR 	40H,0 			//00CC 	0840
		BTSS 	STATUS,2 		//00CD 	1D03
		LJUMP 	D1H 			//00CE 	38D1
		LDWI 	1H 			//00CF 	2A01
		STR 	40H 			//00D0 	01C0

		//;Remute-RF-RX-FMD.C: 157: PC7=1;
		//;Remute-RF-RX-FMD.C: 158: DelayMs(200);
		LCALL 	1EDH 			//00D1 	31ED
		LCALL 	297H 			//00D2 	3297

		//;Remute-RF-RX-FMD.C: 159: PC7=0;
		BCR 	7H,7 			//00D3 	1387
		LJUMP 	D7H 			//00D4 	38D7

		//;Remute-RF-RX-FMD.C: 162: else
		//;Remute-RF-RX-FMD.C: 163: {
		//;Remute-RF-RX-FMD.C: 164: CountKey1=0;
		CLRR 	3CH 			//00D5 	013C
		CLRR 	3DH 			//00D6 	013D

		//;Remute-RF-RX-FMD.C: 165: }
		//;Remute-RF-RX-FMD.C: 167: if(PA7==0)
		BTSC 	5H,7 			//00D7 	1785
		LJUMP 	135H 			//00D8 	3935

		//;Remute-RF-RX-FMD.C: 168: {
		//;Remute-RF-RX-FMD.C: 169: if(CountKey2<240){CountKey2++;}
		LDWI 	0H 			//00D9 	2A00
		SUBWR 	3BH,0 			//00DA 	0C3B
		LDWI 	F0H 			//00DB 	2AF0
		BTSC 	STATUS,2 		//00DC 	1503
		SUBWR 	3AH,0 			//00DD 	0C3A
		BTSC 	STATUS,0 		//00DE 	1403
		LJUMP 	E3H 			//00DF 	38E3
		INCR	3AH,1 			//00E0 	09BA
		BTSC 	STATUS,2 		//00E1 	1503
		INCR	3BH,1 			//00E2 	09BB
		LDWI 	0H 			//00E3 	2A00

		//;Remute-RF-RX-FMD.C: 170: if(PA7==0 & CountKey2>225 & CountKey2<235)
		CLRR 	53H 			//00E4 	0153
		SUBWR 	3BH,0 			//00E5 	0C3B
		LDWI 	E2H 			//00E6 	2AE2
		BTSC 	STATUS,2 		//00E7 	1503
		SUBWR 	3AH,0 			//00E8 	0C3A
		BTSS 	STATUS,0 		//00E9 	1C03
		LJUMP 	F4H 			//00EA 	38F4
		LDWI 	0H 			//00EB 	2A00
		SUBWR 	3BH,0 			//00EC 	0C3B
		LDWI 	EBH 			//00ED 	2AEB
		BTSC 	STATUS,2 		//00EE 	1503
		SUBWR 	3AH,0 			//00EF 	0C3A
		BTSC 	STATUS,0 		//00F0 	1403
		LJUMP 	F4H 			//00F1 	38F4
		CLRR 	53H 			//00F2 	0153
		INCR	53H,1 			//00F3 	09D3
		BTSC 	5H,7 			//00F4 	1785
		LJUMP 	F8H 			//00F5 	38F8
		LDWI 	1H 			//00F6 	2A01
		LJUMP 	F9H 			//00F7 	38F9
		LDWI 	0H 			//00F8 	2A00
		STR 	51H 			//00F9 	01D1
		ANDWR 	53H,0 			//00FA 	0253
		BTSC 	STATUS,2 		//00FB 	1503
		LJUMP 	137H 			//00FC 	3937

		//;Remute-RF-RX-FMD.C: 171: {
		//;Remute-RF-RX-FMD.C: 172: CountKey2=250;
		LDWI 	FAH 			//00FD 	2AFA
		STR 	3AH 			//00FE 	01BA
		CLRR 	3BH 			//00FF 	013B

		//;Remute-RF-RX-FMD.C: 175: char i;
		//;Remute-RF-RX-FMD.C: 176: for(i=0;i<6;i++)
		CLRR 	57H 			//0100 	0157
		CLRWDT	 			//0101 	0001

		//;Remute-RF-RX-FMD.C: 179: DataS[i][0]=DataS[i][1]=DataS[i][2]=0;
		BCR 	STATUS,5 		//0102 	1283
		LDR 	57H,0 			//0103 	0857
		ADDWR 	57H,0 			//0104 	0B57
		ADDWR 	57H,0 			//0105 	0B57
		ADDWI 	22H 			//0106 	2722
		STR 	FSR 			//0107 	0184
		BCR 	STATUS,7 		//0108 	1383
		CLRR 	INDF 			//0109 	0100
		LDR 	57H,0 			//010A 	0857
		ADDWR 	57H,0 			//010B 	0B57
		ADDWR 	57H,0 			//010C 	0B57
		ADDWI 	21H 			//010D 	2721
		STR 	FSR 			//010E 	0184
		CLRR 	INDF 			//010F 	0100
		LDR 	57H,0 			//0110 	0857
		ADDWR 	57H,0 			//0111 	0B57
		ADDWR 	57H,0 			//0112 	0B57
		ADDWI 	20H 			//0113 	2720
		STR 	FSR 			//0114 	0184
		CLRR 	INDF 			//0115 	0100

		//;Remute-RF-RX-FMD.C: 180: Save=0;
		CLRR 	58H 			//0116 	0158

		//;Remute-RF-RX-FMD.C: 181: EEPROMwrite((i+1*3),0x00);
		CLRR 	79H 			//0117 	0179
		LDR 	57H,0 			//0118 	0857
		ADDWI 	3H 			//0119 	2703
		LCALL 	2C8H 			//011A 	32C8

		//;Remute-RF-RX-FMD.C: 182: EEPROMwrite((i*3)+1,0x00);
		LCALL 	1DCH 			//011B 	31DC
		ADDWI 	1H 			//011C 	2701
		LCALL 	2C8H 			//011D 	32C8

		//;Remute-RF-RX-FMD.C: 183: EEPROMwrite((i*3)+2,0x00);
		LCALL 	1DCH 			//011E 	31DC
		ADDWI 	2H 			//011F 	2702
		LCALL 	2C8H 			//0120 	32C8
		LDWI 	50H 			//0121 	2A50

		//;Remute-RF-RX-FMD.C: 184: EEPROMwrite(0x50,0x00);
		CLRR 	79H 			//0122 	0179
		LCALL 	2C8H 			//0123 	32C8

		//;Remute-RF-RX-FMD.C: 185: PC7=1;
		BCR 	STATUS,5 		//0124 	1283
		BSR 	7H,7 			//0125 	1B87

		//;Remute-RF-RX-FMD.C: 186: DelayMs(100);
		LDWI 	64H 			//0126 	2A64
		STR 	4BH 			//0127 	01CB
		CLRR 	4CH 			//0128 	014C
		LCALL 	297H 			//0129 	3297

		//;Remute-RF-RX-FMD.C: 187: PC7=0;
		BCR 	7H,7 			//012A 	1387

		//;Remute-RF-RX-FMD.C: 188: DelayMs(100);
		LDWI 	64H 			//012B 	2A64
		STR 	4BH 			//012C 	01CB
		CLRR 	4CH 			//012D 	014C
		LCALL 	297H 			//012E 	3297
		LDWI 	6H 			//012F 	2A06
		INCR	57H,1 			//0130 	09D7
		SUBWR 	57H,0 			//0131 	0C57
		BTSC 	STATUS,0 		//0132 	1403
		LJUMP 	137H 			//0133 	3937
		LJUMP 	101H 			//0134 	3901

		//;Remute-RF-RX-FMD.C: 192: else
		//;Remute-RF-RX-FMD.C: 193: {
		//;Remute-RF-RX-FMD.C: 194: CountKey2=0;
		CLRR 	3AH 			//0135 	013A
		CLRR 	3BH 			//0136 	013B

		//;Remute-RF-RX-FMD.C: 195: }
		//;Remute-RF-RX-FMD.C: 197: if(Learn==1)
		DECRSZ 	40H,0 		//0137 	0E40
		LJUMP 	1C1H 			//0138 	39C1

		//;Remute-RF-RX-FMD.C: 198: {
		//;Remute-RF-RX-FMD.C: 199: Belink++;
		INCR	3EH,1 			//0139 	09BE
		BTSC 	STATUS,2 		//013A 	1503
		INCR	3FH,1 			//013B 	09BF

		//;Remute-RF-RX-FMD.C: 200: if(Belink>10000)
		LDWI 	27H 			//013C 	2A27
		SUBWR 	3FH,0 			//013D 	0C3F
		LDWI 	11H 			//013E 	2A11
		BTSC 	STATUS,2 		//013F 	1503
		SUBWR 	3EH,0 			//0140 	0C3E
		BTSS 	STATUS,0 		//0141 	1C03
		LJUMP 	147H 			//0142 	3947

		//;Remute-RF-RX-FMD.C: 201: {
		//;Remute-RF-RX-FMD.C: 202: PC7=!PC7;
		LDWI 	80H 			//0143 	2A80
		XORWR 	7H,1 			//0144 	0487

		//;Remute-RF-RX-FMD.C: 203: Belink=0;
		CLRR 	3EH 			//0145 	013E
		CLRR 	3FH 			//0146 	013F

		//;Remute-RF-RX-FMD.C: 204: }
		//;Remute-RF-RX-FMD.C: 205: if(Lock==1)
		DECRSZ 	43H,0 		//0147 	0E43
		LJUMP 	1C1H 			//0148 	39C1

		//;Remute-RF-RX-FMD.C: 206: {
		//;Remute-RF-RX-FMD.C: 207: Save++;
		INCR	58H,1 			//0149 	09D8

		//;Remute-RF-RX-FMD.C: 208: if(Save<6)
		LDWI 	6H 			//014A 	2A06
		SUBWR 	58H,0 			//014B 	0C58
		BTSC 	STATUS,0 		//014C 	1403
		LJUMP 	185H 			//014D 	3985

		//;Remute-RF-RX-FMD.C: 209: {
		//;Remute-RF-RX-FMD.C: 210: EEPROMwrite((Save*3),DataM[0]);
		LDR 	32H,0 			//014E 	0832
		STR 	79H 			//014F 	01F9
		LDR 	58H,0 			//0150 	0858
		ADDWR 	58H,0 			//0151 	0B58
		ADDWR 	58H,0 			//0152 	0B58
		LCALL 	2C8H 			//0153 	32C8

		//;Remute-RF-RX-FMD.C: 211: DelayMs(10);
		LCALL 	1E2H 			//0154 	31E2
		LCALL 	297H 			//0155 	3297

		//;Remute-RF-RX-FMD.C: 212: EEPROMwrite(((Save*3)+1),DataM[1]);
		LDR 	33H,0 			//0156 	0833
		STR 	79H 			//0157 	01F9
		LCALL 	1F7H 			//0158 	31F7
		LCALL 	2C8H 			//0159 	32C8

		//;Remute-RF-RX-FMD.C: 213: DelayMs(10);
		LCALL 	1E2H 			//015A 	31E2
		LCALL 	297H 			//015B 	3297

		//;Remute-RF-RX-FMD.C: 214: EEPROMwrite(((Save*3)+2),DataM[2]);
		LDR 	34H,0 			//015C 	0834
		STR 	79H 			//015D 	01F9
		LCALL 	1F2H 			//015E 	31F2
		LCALL 	2C8H 			//015F 	32C8

		//;Remute-RF-RX-FMD.C: 215: DelayMs(10);
		LCALL 	1E2H 			//0160 	31E2
		LCALL 	297H 			//0161 	3297

		//;Remute-RF-RX-FMD.C: 216: EEPROMwrite(0x50,Save);
		LDR 	58H,0 			//0162 	0858
		STR 	79H 			//0163 	01F9
		LDWI 	50H 			//0164 	2A50
		LCALL 	2C8H 			//0165 	32C8

		//;Remute-RF-RX-FMD.C: 217: DelayMs(10);
		LCALL 	1E2H 			//0166 	31E2
		LCALL 	297H 			//0167 	3297

		//;Remute-RF-RX-FMD.C: 218: DataS[Save-1][0]=DataM[0];
		LDR 	58H,0 			//0168 	0858
		ADDWR 	58H,0 			//0169 	0B58
		ADDWR 	58H,0 			//016A 	0B58
		ADDWI 	1DH 			//016B 	271D
		STR 	FSR 			//016C 	0184
		LDR 	32H,0 			//016D 	0832
		BCR 	STATUS,7 		//016E 	1383
		STR 	INDF 			//016F 	0180

		//;Remute-RF-RX-FMD.C: 219: DataS[Save-1][1]=DataM[1];
		LDR 	58H,0 			//0170 	0858
		ADDWR 	58H,0 			//0171 	0B58
		ADDWR 	58H,0 			//0172 	0B58
		ADDWI 	1EH 			//0173 	271E
		STR 	FSR 			//0174 	0184
		LDR 	33H,0 			//0175 	0833
		STR 	INDF 			//0176 	0180

		//;Remute-RF-RX-FMD.C: 220: DataS[Save-1][2]=DataM[2];
		LDR 	58H,0 			//0177 	0858
		ADDWR 	58H,0 			//0178 	0B58
		ADDWR 	58H,0 			//0179 	0B58
		ADDWI 	1FH 			//017A 	271F
		STR 	FSR 			//017B 	0184
		LDR 	34H,0 			//017C 	0834
		STR 	INDF 			//017D 	0180

		//;Remute-RF-RX-FMD.C: 221: PC7=1;
		BSR 	7H,7 			//017E 	1B87

		//;Remute-RF-RX-FMD.C: 222: DelayMs(1000);
		LDWI 	E8H 			//017F 	2AE8
		STR 	4BH 			//0180 	01CB
		LDWI 	3H 			//0181 	2A03
		STR 	4CH 			//0182 	01CC
		LCALL 	297H 			//0183 	3297

		//;Remute-RF-RX-FMD.C: 224: }
		LJUMP 	195H 			//0184 	3995

		//;Remute-RF-RX-FMD.C: 225: else
		//;Remute-RF-RX-FMD.C: 226: {
		//;Remute-RF-RX-FMD.C: 227: Save=5;
		LDWI 	5H 			//0185 	2A05
		STR 	58H 			//0186 	01D8

		//;Remute-RF-RX-FMD.C: 228: char i;
		//;Remute-RF-RX-FMD.C: 229: PC7=0;
		BCR 	7H,7 			//0187 	1387

		//;Remute-RF-RX-FMD.C: 230: for(i=0;i<5;i++)
		CLRR 	54H 			//0188 	0154

		//;Remute-RF-RX-FMD.C: 231: {
		//;Remute-RF-RX-FMD.C: 232: PC7=!PC7;
		LDWI 	80H 			//0189 	2A80
		XORWR 	7H,1 			//018A 	0487

		//;Remute-RF-RX-FMD.C: 233: DelayMs(300);
		LDWI 	2CH 			//018B 	2A2C
		STR 	4BH 			//018C 	01CB
		LDWI 	1H 			//018D 	2A01
		STR 	4CH 			//018E 	01CC
		LCALL 	297H 			//018F 	3297
		LDWI 	5H 			//0190 	2A05
		INCR	54H,1 			//0191 	09D4
		SUBWR 	54H,0 			//0192 	0C54
		BTSS 	STATUS,0 		//0193 	1C03
		LJUMP 	189H 			//0194 	3989

		//;Remute-RF-RX-FMD.C: 223: PC7=0;
		BCR 	7H,7 			//0195 	1387

		//;Remute-RF-RX-FMD.C: 236: }
		//;Remute-RF-RX-FMD.C: 237: Lock=0;
		CLRR 	43H 			//0196 	0143

		//;Remute-RF-RX-FMD.C: 238: Learn=0;
		CLRR 	40H 			//0197 	0140

		//;Remute-RF-RX-FMD.C: 239: Belink=0;
		CLRR 	3EH 			//0198 	013E
		CLRR 	3FH 			//0199 	013F
		LJUMP 	1C1H 			//019A 	39C1

		//;Remute-RF-RX-FMD.C: 245: {
		//;Remute-RF-RX-FMD.C: 246: case 0:PA4=0;PC0=0;PC1=0;PC2=0;PC3=0;PC4=0;PC5=0;PC6=0;;break;
		BCR 	5H,4 			//019B 	1205
		LJUMP 	19EH 			//019C 	399E

		//;Remute-RF-RX-FMD.C: 247: case 1:PA4=1;PC0=0;PC1=0;PC2=0;PC3=0;PC4=0;PC5=0;PC6=0;;break;
		BSR 	5H,4 			//019D 	1A05
		BCR 	7H,0 			//019E 	1007
		LJUMP 	1A2H 			//019F 	39A2

		//;Remute-RF-RX-FMD.C: 248: case 2:PA4=1;PC0=1;PC1=0;PC2=0;PC3=0;PC4=0;PC5=0;PC6=0;;break;
		BSR 	5H,4 			//01A0 	1A05
		BSR 	7H,0 			//01A1 	1807
		BCR 	7H,1 			//01A2 	1087
		LJUMP 	1A7H 			//01A3 	39A7

		//;Remute-RF-RX-FMD.C: 249: case 3:PA4=1;PC0=1;PC1=1;PC2=0;PC3=0;PC4=0;PC5=0;PC6=0;;break;
		BSR 	5H,4 			//01A4 	1A05
		BSR 	7H,0 			//01A5 	1807
		BSR 	7H,1 			//01A6 	1887
		BCR 	7H,2 			//01A7 	1107
		LJUMP 	1ADH 			//01A8 	39AD

		//;Remute-RF-RX-FMD.C: 250: case 4:PA4=1;PC0=1;PC1=1;PC2=1;PC3=0;PC4=0;PC5=0;PC6=0;;break;
		BSR 	5H,4 			//01A9 	1A05
		BSR 	7H,0 			//01AA 	1807
		BSR 	7H,1 			//01AB 	1887
		BSR 	7H,2 			//01AC 	1907
		BCR 	7H,3 			//01AD 	1187
		LJUMP 	1B4H 			//01AE 	39B4

		//;Remute-RF-RX-FMD.C: 251: case 5:PA4=1;PC0=1;PC1=1;PC2=1;PC3=1;PC4=0;PC5=0;PC6=0;;break;
		BSR 	5H,4 			//01AF 	1A05
		BSR 	7H,0 			//01B0 	1807
		BSR 	7H,1 			//01B1 	1887
		BSR 	7H,2 			//01B2 	1907
		BSR 	7H,3 			//01B3 	1987
		BCR 	7H,4 			//01B4 	1207
		LJUMP 	1B8H 			//01B5 	39B8

		//;Remute-RF-RX-FMD.C: 252: case 6:PA4=1;PC0=1;PC1=1;PC2=1;PC3=1;PC4=1;PC5=0;PC6=0;;break;
		BSR 	5H,4 			//01B6 	1A05
		LCALL 	1D6H 			//01B7 	31D6
		BCR 	7H,5 			//01B8 	1287
		LJUMP 	1BDH 			//01B9 	39BD

		//;Remute-RF-RX-FMD.C: 253: case 7:PA4=1;PC0=1;PC1=1;PC2=1;PC3=1;PC4=1;PC5=1;PC6=0;;break;
		BSR 	5H,4 			//01BA 	1A05
		LCALL 	1D6H 			//01BB 	31D6
		BSR 	7H,5 			//01BC 	1A87
		BCR 	7H,6 			//01BD 	1307
		LJUMP 	45H 			//01BE 	3845

		//;Remute-RF-RX-FMD.C: 254: case 8:PA4=1;PC0=1;PC1=1;PC2=1;PC3=1;PC4=1;PC5=1;PC6=1;;break;
		LCALL 	1CDH 			//01BF 	31CD
		LJUMP 	45H 			//01C0 	3845
		LDR 	47H,0 			//01C1 	0847
		STR 	FSR 			//01C2 	0184
		LDWI 	9H 			//01C3 	2A09
		SUBWR 	FSR,0 			//01C4 	0C04
		BTSC 	STATUS,0 		//01C5 	1403
		LJUMP 	45H 			//01C6 	3845
		LDWI 	2H 			//01C7 	2A02
		STR 	PCLATH 			//01C8 	018A
		LDWI 	F7H 			//01C9 	2AF7
		ADDWR 	FSR,0 			//01CA 	0B04
		STR 	PCL 			//01CB 	0182
		LJUMP 	0CH 			//01CC 	380C
		BSR 	5H,4 			//01CD 	1A05
		BSR 	7H,0 			//01CE 	1807
		BSR 	7H,1 			//01CF 	1887
		BSR 	7H,2 			//01D0 	1907
		BSR 	7H,3 			//01D1 	1987
		BSR 	7H,4 			//01D2 	1A07
		BSR 	7H,5 			//01D3 	1A87
		BSR 	7H,6 			//01D4 	1B07
		RET		 					//01D5 	0004
		BSR 	7H,0 			//01D6 	1807
		BSR 	7H,1 			//01D7 	1887
		BSR 	7H,2 			//01D8 	1907
		BSR 	7H,3 			//01D9 	1987
		BSR 	7H,4 			//01DA 	1A07
		RET		 					//01DB 	0004
		CLRR 	79H 			//01DC 	0179
		BCR 	STATUS,5 		//01DD 	1283
		LDR 	57H,0 			//01DE 	0857
		ADDWR 	57H,0 			//01DF 	0B57
		ADDWR 	57H,0 			//01E0 	0B57
		RET		 					//01E1 	0004
		LDWI 	AH 			//01E2 	2A0A
		BCR 	STATUS,5 		//01E3 	1283
		STR 	4BH 			//01E4 	01CB
		CLRR 	4CH 			//01E5 	014C
		RET		 					//01E6 	0004
		BCR 	STATUS,7 		//01E7 	1383
		STR 	INDF 			//01E8 	0180
		LDR 	55H,0 			//01E9 	0855
		ADDWR 	55H,0 			//01EA 	0B55
		ADDWR 	55H,0 			//01EB 	0B55
		RET		 					//01EC 	0004
		BSR 	7H,7 			//01ED 	1B87
		LDWI 	C8H 			//01EE 	2AC8
		STR 	4BH 			//01EF 	01CB
		CLRR 	4CH 			//01F0 	014C
		RET		 					//01F1 	0004
		LDR 	58H,0 			//01F2 	0858
		ADDWR 	58H,0 			//01F3 	0B58
		ADDWR 	58H,0 			//01F4 	0B58
		ADDWI 	2H 			//01F5 	2702
		RET		 					//01F6 	0004
		LDR 	58H,0 			//01F7 	0858
		ADDWR 	58H,0 			//01F8 	0B58
		ADDWR 	58H,0 			//01F9 	0B58
		ADDWI 	1H 			//01FA 	2701
		RET		 					//01FB 	0004

		//;Remute-RF-RX-FMD.C: 34: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//01FC 	1A83
		BTSS 	CH,1 			//01FD 	1C8C
		LJUMP 	28EH 			//01FE 	3A8E
		BCR 	STATUS,5 		//01FF 	1283
		BTSS 	CH,1 			//0200 	1C8C
		LJUMP 	28EH 			//0201 	3A8E

		//;Remute-RF-RX-FMD.C: 35: {
		//;Remute-RF-RX-FMD.C: 36: TMR2IF = 0;
		BCR 	CH,1 			//0202 	108C
		CLRWDT	 			//0203 	0001

		//;Remute-RF-RX-FMD.C: 38: if(PA2==0){Time++;Frist=1;Timer=0;}
		BCR 	STATUS,5 		//0204 	1283
		BTSC 	5H,2 			//0205 	1505
		LJUMP 	20FH 			//0206 	3A0F
		INCR	70H,1 			//0207 	09F0
		BTSC 	STATUS,2 		//0208 	1503
		INCR	71H,1 			//0209 	09F1
		LDWI 	1H 			//020A 	2A01
		STR 	74H 			//020B 	01F4
		CLRR 	38H 			//020C 	0138
		CLRR 	39H 			//020D 	0139
		LJUMP 	28EH 			//020E 	3A8E

		//;Remute-RF-RX-FMD.C: 39: else
		//;Remute-RF-RX-FMD.C: 40: {
		//;Remute-RF-RX-FMD.C: 41: Timer++;
		INCR	38H,1 			//020F 	09B8
		BTSC 	STATUS,2 		//0210 	1503
		INCR	39H,1 			//0211 	09B9

		//;Remute-RF-RX-FMD.C: 42: if(Timer>500){Timer=0;Finish=0;}
		LDWI 	1H 			//0212 	2A01
		SUBWR 	39H,0 			//0213 	0C39
		LDWI 	F5H 			//0214 	2AF5
		BTSC 	STATUS,2 		//0215 	1503
		SUBWR 	38H,0 			//0216 	0C38
		BTSS 	STATUS,0 		//0217 	1C03
		LJUMP 	21CH 			//0218 	3A1C
		CLRR 	38H 			//0219 	0138
		CLRR 	39H 			//021A 	0139
		CLRR 	41H 			//021B 	0141

		//;Remute-RF-RX-FMD.C: 43: if(Frist==1 & Finish==0)
		DECRSZ 	74H,0 		//021C 	0E74
		LJUMP 	28EH 			//021D 	3A8E
		LDR 	41H,0 			//021E 	0841
		BTSS 	STATUS,2 		//021F 	1D03
		LJUMP 	28EH 			//0220 	3A8E

		//;Remute-RF-RX-FMD.C: 44: {
		//;Remute-RF-RX-FMD.C: 45: Timer=0;
		CLRR 	38H 			//0221 	0138
		CLRR 	39H 			//0222 	0139

		//;Remute-RF-RX-FMD.C: 46: if(Start==1)
		DECRSZ 	44H,0 		//0223 	0E44
		LJUMP 	279H 			//0224 	3A79

		//;Remute-RF-RX-FMD.C: 47: {
		//;Remute-RF-RX-FMD.C: 48: Bit--;
		DECR 	42H,1 			//0225 	0DC2

		//;Remute-RF-RX-FMD.C: 49: if(Time>14 & Time< 25)
		LDWI 	0H 			//0226 	2A00
		SUBWR 	71H,0 			//0227 	0C71
		LDWI 	FH 			//0228 	2A0F
		BTSC 	STATUS,2 		//0229 	1503
		SUBWR 	70H,0 			//022A 	0C70
		BTSS 	STATUS,0 		//022B 	1C03
		LJUMP 	238H 			//022C 	3A38
		LDWI 	0H 			//022D 	2A00
		SUBWR 	71H,0 			//022E 	0C71
		LDWI 	19H 			//022F 	2A19
		BTSC 	STATUS,2 		//0230 	1503
		SUBWR 	70H,0 			//0231 	0C70
		BTSC 	STATUS,0 		//0232 	1403
		LJUMP 	237H 			//0233 	3A37

		//;Remute-RF-RX-FMD.C: 50: {
		//;Remute-RF-RX-FMD.C: 51: Buffer = Buffer << 1;
		BCR 	STATUS,0 		//0234 	1003
		RLR 	72H,0 			//0235 	0572
		LJUMP 	23CH 			//0236 	3A3C

		//;Remute-RF-RX-FMD.C: 52: }
		//;Remute-RF-RX-FMD.C: 53: else
		//;Remute-RF-RX-FMD.C: 54: {
		//;Remute-RF-RX-FMD.C: 55: Buffer = Buffer << 1;
		BCR 	STATUS,0 		//0237 	1003
		RLR 	72H,0 			//0238 	0572
		STR 	72H 			//0239 	01F2

		//;Remute-RF-RX-FMD.C: 56: Buffer = Buffer + 1;
		LDR 	72H,0 			//023A 	0872
		ADDWI 	1H 			//023B 	2701
		STR 	72H 			//023C 	01F2

		//;Remute-RF-RX-FMD.C: 58: }
		//;Remute-RF-RX-FMD.C: 59: if(Bit == 0)
		LDR 	42H,0 			//023D 	0842
		BTSS 	STATUS,2 		//023E 	1D03
		LJUMP 	279H 			//023F 	3A79

		//;Remute-RF-RX-FMD.C: 60: {
		//;Remute-RF-RX-FMD.C: 61: Bit=8;
		LDWI 	8H 			//0240 	2A08
		STR 	42H 			//0241 	01C2

		//;Remute-RF-RX-FMD.C: 62: Data[Count]=RFData[Count];
		LDR 	73H,0 			//0242 	0873
		ADDWI 	2FH 			//0243 	272F
		STR 	FSR 			//0244 	0184
		BCR 	STATUS,7 		//0245 	1383
		LDR 	INDF,0 			//0246 	0800
		STR 	75H 			//0247 	01F5
		LDR 	73H,0 			//0248 	0873
		ADDWI 	35H 			//0249 	2735
		STR 	FSR 			//024A 	0184
		LDR 	75H,0 			//024B 	0875
		STR 	INDF 			//024C 	0180

		//;Remute-RF-RX-FMD.C: 63: RFData[Count]=Buffer;
		LDR 	73H,0 			//024D 	0873
		ADDWI 	2FH 			//024E 	272F
		STR 	FSR 			//024F 	0184
		LDR 	72H,0 			//0250 	0872
		STR 	INDF 			//0251 	0180

		//;Remute-RF-RX-FMD.C: 64: Count++;
		INCR	73H,1 			//0252 	09F3

		//;Remute-RF-RX-FMD.C: 66: if(Count>=3)
		LDWI 	3H 			//0253 	2A03
		SUBWR 	73H,0 			//0254 	0C73
		BTSS 	STATUS,0 		//0255 	1C03
		LJUMP 	278H 			//0256 	3A78

		//;Remute-RF-RX-FMD.C: 67: {
		//;Remute-RF-RX-FMD.C: 68: Count=0;
		CLRR 	73H 			//0257 	0173

		//;Remute-RF-RX-FMD.C: 69: Start=0;
		CLRR 	44H 			//0258 	0144

		//;Remute-RF-RX-FMD.C: 70: if(Data[0]==RFData[0] && Data[1]==RFData[1] &&Data[2]==RFData[2
		//+                          ])
		LDR 	35H,0 			//0259 	0835
		XORWR 	2FH,0 			//025A 	042F
		BTSS 	STATUS,2 		//025B 	1D03
		LJUMP 	278H 			//025C 	3A78
		LDR 	36H,0 			//025D 	0836
		XORWR 	30H,0 			//025E 	0430
		BTSS 	STATUS,2 		//025F 	1D03
		LJUMP 	278H 			//0260 	3A78
		LDR 	37H,0 			//0261 	0837
		XORWR 	31H,0 			//0262 	0431
		BTSS 	STATUS,2 		//0263 	1D03
		LJUMP 	278H 			//0264 	3A78

		//;Remute-RF-RX-FMD.C: 71: {
		//;Remute-RF-RX-FMD.C: 72: DataM[0]=RFData[0];
		LDR 	2FH,0 			//0265 	082F
		STR 	32H 			//0266 	01B2

		//;Remute-RF-RX-FMD.C: 73: DataM[1]=RFData[1];
		LDR 	30H,0 			//0267 	0830
		STR 	33H 			//0268 	01B3

		//;Remute-RF-RX-FMD.C: 74: DataM[2]=RFData[2];
		LDR 	31H,0 			//0269 	0831
		STR 	34H 			//026A 	01B4

		//;Remute-RF-RX-FMD.C: 75: RFCode=DataM[2]&0XF;
		LDR 	34H,0 			//026B 	0834
		STR 	45H 			//026C 	01C5
		LDWI 	FH 			//026D 	2A0F
		ANDWR 	45H,1 			//026E 	02C5

		//;Remute-RF-RX-FMD.C: 76: DataM[2]=DataM[2]>>4;
		SWAPR 	34H,0 			//026F 	0734
		ANDWI 	FH 			//0270 	240F
		STR 	34H 			//0271 	01B4

		//;Remute-RF-RX-FMD.C: 77: DataM[2]=DataM[2]<<4;
		SWAPR 	34H,0 			//0272 	0734
		ANDWI 	F0H 			//0273 	24F0
		STR 	34H 			//0274 	01B4

		//;Remute-RF-RX-FMD.C: 78: Finish=1;
		LDWI 	1H 			//0275 	2A01
		STR 	41H 			//0276 	01C1

		//;Remute-RF-RX-FMD.C: 79: Lock=1;
		STR 	43H 			//0277 	01C3

		//;Remute-RF-RX-FMD.C: 80: }
		//;Remute-RF-RX-FMD.C: 81: }
		//;Remute-RF-RX-FMD.C: 82: Buffer=0;
		CLRR 	72H 			//0278 	0172

		//;Remute-RF-RX-FMD.C: 83: }
		//;Remute-RF-RX-FMD.C: 84: }
		//;Remute-RF-RX-FMD.C: 85: if(Time>150 & Time<250){Start=1;Bit=8;}
		LDWI 	0H 			//0279 	2A00
		SUBWR 	71H,0 			//027A 	0C71
		LDWI 	97H 			//027B 	2A97
		BTSC 	STATUS,2 		//027C 	1503
		SUBWR 	70H,0 			//027D 	0C70
		BTSS 	STATUS,0 		//027E 	1C03
		LJUMP 	28BH 			//027F 	3A8B
		LDWI 	0H 			//0280 	2A00
		SUBWR 	71H,0 			//0281 	0C71
		LDWI 	FAH 			//0282 	2AFA
		BTSC 	STATUS,2 		//0283 	1503
		SUBWR 	70H,0 			//0284 	0C70
		BTSC 	STATUS,0 		//0285 	1403
		LJUMP 	28BH 			//0286 	3A8B
		LDWI 	1H 			//0287 	2A01
		STR 	44H 			//0288 	01C4
		LDWI 	8H 			//0289 	2A08
		STR 	42H 			//028A 	01C2

		//;Remute-RF-RX-FMD.C: 86: Frist=0;
		CLRR 	74H 			//028B 	0174

		//;Remute-RF-RX-FMD.C: 87: Time=0;
		CLRR 	70H 			//028C 	0170
		CLRR 	71H 			//028D 	0171
		LDR 	78H,0 			//028E 	0878
		STR 	PCLATH 			//028F 	018A
		LDR 	77H,0 			//0290 	0877
		STR 	FSR 			//0291 	0184
		SWAPR 	76H,0 			//0292 	0776
		STR 	STATUS 			//0293 	0183
		SWAPR 	7EH,1 			//0294 	07FE
		SWAPR 	7EH,0 			//0295 	077E
		RETI		 			//0296 	0009

		//;Remute-RF-RX-FMD.C: 322: unsigned int a,b;
		//;Remute-RF-RX-FMD.C: 323: for(a=0;a<Time;a++)
		CLRR 	4DH 			//0297 	014D
		CLRR 	4EH 			//0298 	014E
		LDR 	4CH,0 			//0299 	084C
		SUBWR 	4EH,0 			//029A 	0C4E
		BTSS 	STATUS,2 		//029B 	1D03
		LJUMP 	29FH 			//029C 	3A9F
		LDR 	4BH,0 			//029D 	084B
		SUBWR 	4DH,0 			//029E 	0C4D
		BTSC 	STATUS,0 		//029F 	1403
		RET		 					//02A0 	0004

		//;Remute-RF-RX-FMD.C: 324: {
		//;Remute-RF-RX-FMD.C: 325: for(b=0;b<5;b++)
		CLRR 	4FH 			//02A1 	014F
		CLRR 	50H 			//02A2 	0150

		//;Remute-RF-RX-FMD.C: 326: {
		//;Remute-RF-RX-FMD.C: 327: DelayUs(197);
		LDWI 	C5H 			//02A3 	2AC5
		LCALL 	2ECH 			//02A4 	32EC
		INCR	4FH,1 			//02A5 	09CF
		BTSC 	STATUS,2 		//02A6 	1503
		INCR	50H,1 			//02A7 	09D0
		LDWI 	0H 			//02A8 	2A00
		SUBWR 	50H,0 			//02A9 	0C50
		LDWI 	5H 			//02AA 	2A05
		BTSC 	STATUS,2 		//02AB 	1503
		SUBWR 	4FH,0 			//02AC 	0C4F
		BTSS 	STATUS,0 		//02AD 	1C03
		LJUMP 	2A3H 			//02AE 	3AA3
		INCR	4DH,1 			//02AF 	09CD
		BTSC 	STATUS,2 		//02B0 	1503
		INCR	4EH,1 			//02B1 	09CE
		LJUMP 	299H 			//02B2 	3A99

		//;Remute-RF-RX-FMD.C: 261: OSCCON = 0B01110001;
		LDWI 	71H 			//02B3 	2A71
		BSR 	STATUS,5 		//02B4 	1A83
		STR 	FH 			//02B5 	018F

		//;Remute-RF-RX-FMD.C: 262: INTCON = 0;
		CLRR 	INTCON 			//02B6 	010B

		//;Remute-RF-RX-FMD.C: 263: PORTA = 0B00000000;
		BCR 	STATUS,5 		//02B7 	1283
		CLRR 	5H 			//02B8 	0105

		//;Remute-RF-RX-FMD.C: 264: TRISA = 0B11000110;
		LDWI 	C6H 			//02B9 	2AC6
		BSR 	STATUS,5 		//02BA 	1A83
		STR 	5H 			//02BB 	0185

		//;Remute-RF-RX-FMD.C: 265: PORTC = 0B00000000;
		BCR 	STATUS,5 		//02BC 	1283
		CLRR 	7H 			//02BD 	0107

		//;Remute-RF-RX-FMD.C: 266: TRISC = 0B00000000;
		BSR 	STATUS,5 		//02BE 	1A83
		CLRR 	7H 			//02BF 	0107

		//;Remute-RF-RX-FMD.C: 267: WPUA = 0B11000110;
		STR 	15H 			//02C0 	0195

		//;Remute-RF-RX-FMD.C: 268: OPTION = 0B00001000;
		LDWI 	8H 			//02C1 	2A08
		STR 	1H 			//02C2 	0181

		//;Remute-RF-RX-FMD.C: 269: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//02C3 	1283
		CLRR 	1BH 			//02C4 	011B

		//;Remute-RF-RX-FMD.C: 270: CMCON0 = 0B00000111;
		LDWI 	7H 			//02C5 	2A07
		STR 	19H 			//02C6 	0199
		RET		 					//02C7 	0004
		BCR 	STATUS,5 		//02C8 	1283
		STR 	49H 			//02C9 	01C9

		//;Remute-RF-RX-FMD.C: 299: GIE = 0;
		BCR 	INTCON,7 		//02CA 	138B

		//;Remute-RF-RX-FMD.C: 300: while(GIE);
		BTSC 	INTCON,7 		//02CB 	178B
		LJUMP 	2CBH 			//02CC 	3ACB

		//;Remute-RF-RX-FMD.C: 301: EEADR = EEAddr;
		BCR 	STATUS,5 		//02CD 	1283
		LDR 	49H,0 			//02CE 	0849
		BSR 	STATUS,5 		//02CF 	1A83
		STR 	1BH 			//02D0 	019B

		//;Remute-RF-RX-FMD.C: 302: EEDAT = Data;
		LDR 	79H,0 			//02D1 	0879
		STR 	1AH 			//02D2 	019A

		//;Remute-RF-RX-FMD.C: 303: EEIF = 0;
		BCR 	STATUS,5 		//02D3 	1283
		BCR 	CH,7 			//02D4 	138C

		//;Remute-RF-RX-FMD.C: 304: EECON1 |= 0x34;
		LDWI 	34H 			//02D5 	2A34
		BSR 	STATUS,5 		//02D6 	1A83
		IORWR 	1CH,1 			//02D7 	039C

		//;Remute-RF-RX-FMD.C: 305: WR = 1;
		BSR 	1DH,0 			//02D8 	181D

		//;Remute-RF-RX-FMD.C: 306: while(WR);
		BTSC 	1DH,0 			//02D9 	141D
		LJUMP 	2D9H 			//02DA 	3AD9

		//;Remute-RF-RX-FMD.C: 307: GIE = 1;
		BSR 	INTCON,7 		//02DB 	1B8B
		RET		 					//02DC 	0004

		//;Remute-RF-RX-FMD.C: 276: T2CON = 0B00000001;
		LDWI 	1H 			//02DD 	2A01
		STR 	12H 			//02DE 	0192

		//;Remute-RF-RX-FMD.C: 277: TMR2 = 0;
		CLRR 	11H 			//02DF 	0111

		//;Remute-RF-RX-FMD.C: 278: PR2 = 100;
		LDWI 	64H 			//02E0 	2A64
		BSR 	STATUS,5 		//02E1 	1A83
		STR 	12H 			//02E2 	0192

		//;Remute-RF-RX-FMD.C: 279: TMR2IF = 0;
		BCR 	STATUS,5 		//02E3 	1283
		BCR 	CH,1 			//02E4 	108C

		//;Remute-RF-RX-FMD.C: 280: TMR2IE = 1;
		BSR 	STATUS,5 		//02E5 	1A83
		BSR 	CH,1 			//02E6 	188C

		//;Remute-RF-RX-FMD.C: 281: TMR2ON = 1;
		BCR 	STATUS,5 		//02E7 	1283
		BSR 	12H,2 			//02E8 	1912

		//;Remute-RF-RX-FMD.C: 282: PEIE=1;
		BSR 	INTCON,6 		//02E9 	1B0B

		//;Remute-RF-RX-FMD.C: 283: GIE = 1;
		BSR 	INTCON,7 		//02EA 	1B8B
		RET		 					//02EB 	0004
		STR 	49H 			//02EC 	01C9

		//;Remute-RF-RX-FMD.C: 312: unsigned char a;
		//;Remute-RF-RX-FMD.C: 313: for(a=0;a<Time;a++)
		CLRR 	4AH 			//02ED 	014A
		LDR 	49H,0 			//02EE 	0849
		SUBWR 	4AH,0 			//02EF 	0C4A
		BTSC 	STATUS,0 		//02F0 	1403
		RET		 					//02F1 	0004

		//;Remute-RF-RX-FMD.C: 314: {
		//;Remute-RF-RX-FMD.C: 315: __nop();
		NOP		 					//02F2 	0000
		CLRWDT	 			//02F3 	0001
		BCR 	STATUS,5 		//02F4 	1283
		INCR	4AH,1 			//02F5 	09CA
		LJUMP 	2EEH 			//02F6 	3AEE
		LJUMP 	19BH 			//02F7 	399B
		LJUMP 	19DH 			//02F8 	399D
		LJUMP 	1A0H 			//02F9 	39A0
		LJUMP 	1A4H 			//02FA 	39A4
		LJUMP 	1A9H 			//02FB 	39A9
		LJUMP 	1AFH 			//02FC 	39AF
		LJUMP 	1B6H 			//02FD 	39B6
		LJUMP 	1BAH 			//02FE 	39BA
		LJUMP 	1BFH 			//02FF 	39BF
		CLRWDT	 			//0300 	0001
		CLRR 	INDF 			//0301 	0100
		INCR	FSR,1 			//0302 	0984
		XORWR 	FSR,0 			//0303 	0404
		BTSC 	STATUS,2 		//0304 	1503
		RETW 	0H 			//0305 	2100
		XORWR 	FSR,0 			//0306 	0404
		LJUMP 	301H 			//0307 	3B01
		STR 	49H 			//0308 	01C9

		//;Remute-RF-RX-FMD.C: 289: unsigned char ReEEPROMread;
		//;Remute-RF-RX-FMD.C: 291: EEADR = EEAddr;
		BSR 	STATUS,5 		//0309 	1A83
		STR 	1BH 			//030A 	019B

		//;Remute-RF-RX-FMD.C: 292: RD = 1;
		BSR 	1CH,0 			//030B 	181C

		//;Remute-RF-RX-FMD.C: 293: ReEEPROMread = EEDAT;
		LDR 	1AH,0 			//030C 	081A
		BCR 	STATUS,5 		//030D 	1283
		STR 	4AH 			//030E 	01CA

		//;Remute-RF-RX-FMD.C: 294: return ReEEPROMread;
		RET		 					//030F 	0004
			END
