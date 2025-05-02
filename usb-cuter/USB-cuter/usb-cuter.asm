//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_Puls_Count		EQU		74H
		_conter		EQU		72H
		_conter2		EQU		70H
		_S		EQU		79H
		_M		EQU		78H
		_H		EQU		77H
		_mode		EQU		7CH
		_Lock		EQU		76H
//-----------------------Variable END---------------------------------

		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	7AH 			//0006 	01FA
		LDR 	PCLATH,0 		//0007 	080A
		STR 	7BH 			//0008 	01FB
		LJUMP 	A1H 			//0009 	38A1
		LJUMP 	0BH 			//000A 	380B
		LDWI 	4H 			//000B 	2A04
		STR 	7CH 			//000C 	01FC
		CLRR 	70H 			//000D 	0170
		CLRR 	71H 			//000E 	0171
		CLRR 	72H 			//000F 	0172
		CLRR 	73H 			//0010 	0173
		CLRR 	74H 			//0011 	0174
		CLRR 	75H 			//0012 	0175
		CLRR 	76H 			//0013 	0176
		CLRR 	77H 			//0014 	0177
		CLRR 	78H 			//0015 	0178
		CLRR 	79H 			//0016 	0179
		CLRR 	STATUS 			//0017 	0103
		LJUMP 	19H 			//0018 	3819

		//;USB-cuter.C: 137: POWER_INITIAL();
		LCALL 	C8H 			//0019 	30C8

		//;USB-cuter.C: 138: TIMER0_INITIAL();
		LCALL 	D6H 			//001A 	30D6

		//;USB-cuter.C: 141: GIE = 1;
		BSR 	INTCON,7 		//001B 	1B8B

		//;USB-cuter.C: 143: T0IE = 0;
		BCR 	INTCON,5 		//001C 	128B

		//;USB-cuter.C: 145: PA4=1;
		BSR 	5H,4 			//001D 	1A05

		//;USB-cuter.C: 146: mode=4;
		LDWI 	4H 			//001E 	2A04
		STR 	7CH 			//001F 	01FC

		//;USB-cuter.C: 149: {
		//;USB-cuter.C: 151: if(PA3==0 && Lock==0){
		BTSC 	5H,3 			//0020 	1585
		LJUMP 	3DH 			//0021 	383D
		LDR 	76H,0 			//0022 	0876
		BTSS 	STATUS,2 		//0023 	1D03
		LJUMP 	3DH 			//0024 	383D

		//;USB-cuter.C: 152: conter++;
		INCR	72H,1 			//0025 	09F2
		BTSC 	STATUS,2 		//0026 	1503
		INCR	73H,1 			//0027 	09F3

		//;USB-cuter.C: 153: if(conter>=1000){
		LDWI 	3H 			//0028 	2A03
		SUBWR 	73H,0 			//0029 	0C73
		LDWI 	E8H 			//002A 	2AE8
		BTSC 	STATUS,2 		//002B 	1503
		SUBWR 	72H,0 			//002C 	0C72
		BTSS 	STATUS,0 		//002D 	1C03
		LJUMP 	3DH 			//002E 	383D

		//;USB-cuter.C: 154: conter=0;
		CLRR 	72H 			//002F 	0172
		CLRR 	73H 			//0030 	0173

		//;USB-cuter.C: 156: Lock=1;
		LDWI 	1H 			//0031 	2A01
		STR 	76H 			//0032 	01F6

		//;USB-cuter.C: 157: mode++;
		INCR	7CH,1 			//0033 	09FC

		//;USB-cuter.C: 159: if(mode>=5)mode=1;
		LDWI 	5H 			//0034 	2A05
		SUBWR 	7CH,0 			//0035 	0C7C
		BTSS 	STATUS,0 		//0036 	1C03
		LJUMP 	3AH 			//0037 	383A
		LDWI 	1H 			//0038 	2A01
		STR 	7CH 			//0039 	01FC

		//;USB-cuter.C: 161: S=0,M=0,H=0;
		CLRR 	79H 			//003A 	0179
		CLRR 	78H 			//003B 	0178
		CLRR 	77H 			//003C 	0177

		//;USB-cuter.C: 162: }
		//;USB-cuter.C: 163: }
		//;USB-cuter.C: 165: if(PA3==1 && Lock==1){
		BTSS 	5H,3 			//003D 	1D85
		LJUMP 	50H 			//003E 	3850
		DECRSZ 	76H,0 		//003F 	0E76
		LJUMP 	50H 			//0040 	3850

		//;USB-cuter.C: 166: conter2++;
		INCR	70H,1 			//0041 	09F0
		BTSC 	STATUS,2 		//0042 	1503
		INCR	71H,1 			//0043 	09F1

		//;USB-cuter.C: 167: if(conter2>=1000){
		LDWI 	3H 			//0044 	2A03
		SUBWR 	71H,0 			//0045 	0C71
		LDWI 	E8H 			//0046 	2AE8
		BTSC 	STATUS,2 		//0047 	1503
		SUBWR 	70H,0 			//0048 	0C70
		BTSS 	STATUS,0 		//0049 	1C03
		LJUMP 	50H 			//004A 	3850

		//;USB-cuter.C: 168: conter=0;
		CLRR 	72H 			//004B 	0172
		CLRR 	73H 			//004C 	0173

		//;USB-cuter.C: 169: conter2=0;
		CLRR 	70H 			//004D 	0170
		CLRR 	71H 			//004E 	0171

		//;USB-cuter.C: 170: Lock=0;
		CLRR 	76H 			//004F 	0176

		//;USB-cuter.C: 171: }
		//;USB-cuter.C: 172: }
		//;USB-cuter.C: 176: if(mode==0 )PA1=0,PA0=0,PA5=0,PA4=0 , T0IE=0;
		LDR 	7CH,0 			//0050 	087C
		BTSS 	STATUS,2 		//0051 	1D03
		LJUMP 	58H 			//0052 	3858
		BCR 	5H,1 			//0053 	1085
		BCR 	5H,0 			//0054 	1005
		BCR 	5H,5 			//0055 	1285
		BCR 	5H,4 			//0056 	1205
		BCR 	INTCON,5 		//0057 	128B

		//;USB-cuter.C: 178: if(mode==1 )PA1=1,PA0=0,PA5=0,PA4=1 , T0IE=1;
		DECRSZ 	7CH,0 		//0058 	0E7C
		LJUMP 	5FH 			//0059 	385F
		BSR 	5H,1 			//005A 	1885
		BCR 	5H,0 			//005B 	1005
		BCR 	5H,5 			//005C 	1285
		BSR 	5H,4 			//005D 	1A05
		BSR 	INTCON,5 		//005E 	1A8B

		//;USB-cuter.C: 179: if(mode==2 )PA1=0,PA0=1,PA5=0,PA4=1 , T0IE=1;
		LDWI 	2H 			//005F 	2A02
		XORWR 	7CH,0 			//0060 	047C
		BTSS 	STATUS,2 		//0061 	1D03
		LJUMP 	68H 			//0062 	3868
		BCR 	5H,1 			//0063 	1085
		BSR 	5H,0 			//0064 	1805
		BCR 	5H,5 			//0065 	1285
		BSR 	5H,4 			//0066 	1A05
		BSR 	INTCON,5 		//0067 	1A8B

		//;USB-cuter.C: 180: if(mode==3 )PA1=0,PA0=0,PA5=1,PA4=1 , T0IE=1;
		LDWI 	3H 			//0068 	2A03
		XORWR 	7CH,0 			//0069 	047C
		BTSS 	STATUS,2 		//006A 	1D03
		LJUMP 	71H 			//006B 	3871
		BCR 	5H,1 			//006C 	1085
		BCR 	5H,0 			//006D 	1005
		BSR 	5H,5 			//006E 	1A85
		BSR 	5H,4 			//006F 	1A05
		BSR 	INTCON,5 		//0070 	1A8B

		//;USB-cuter.C: 182: if(mode==4 )PA1=1,PA0=1,PA5=1,PA4=1 , T0IE=0;
		LDWI 	4H 			//0071 	2A04
		XORWR 	7CH,0 			//0072 	047C
		BTSS 	STATUS,2 		//0073 	1D03
		LJUMP 	7AH 			//0074 	387A
		BSR 	5H,1 			//0075 	1885
		BSR 	5H,0 			//0076 	1805
		BSR 	5H,5 			//0077 	1A85
		BSR 	5H,4 			//0078 	1A05
		BCR 	INTCON,5 		//0079 	128B

		//;USB-cuter.C: 185: if(mode==1 && M==45 && H==0 && PA4==1) mode=0 ;
		DECRSZ 	7CH,0 		//007A 	0E7C
		LJUMP 	85H 			//007B 	3885
		LDWI 	2DH 			//007C 	2A2D
		XORWR 	78H,0 			//007D 	0478
		BTSS 	STATUS,2 		//007E 	1D03
		LJUMP 	85H 			//007F 	3885
		LDR 	77H,0 			//0080 	0877
		BTSC 	STATUS,2 		//0081 	1503
		BTSS 	5H,4 			//0082 	1E05
		LJUMP 	85H 			//0083 	3885
		CLRR 	7CH 			//0084 	017C

		//;USB-cuter.C: 187: if(mode==2 && M==30 && H==1 && PA4==1) mode=0 ;
		LDWI 	2H 			//0085 	2A02
		XORWR 	7CH,0 			//0086 	047C
		BTSS 	STATUS,2 		//0087 	1D03
		LJUMP 	92H 			//0088 	3892
		LDWI 	1EH 			//0089 	2A1E
		XORWR 	78H,0 			//008A 	0478
		BTSS 	STATUS,2 		//008B 	1D03
		LJUMP 	92H 			//008C 	3892
		DECRSZ 	77H,0 		//008D 	0E77
		LJUMP 	92H 			//008E 	3892
		BTSS 	5H,4 			//008F 	1E05
		LJUMP 	92H 			//0090 	3892
		CLRR 	7CH 			//0091 	017C

		//;USB-cuter.C: 189: if(mode==3 && M==30 && H==2 && PA4==1) mode=0 ;
		LDWI 	3H 			//0092 	2A03
		XORWR 	7CH,0 			//0093 	047C
		BTSS 	STATUS,2 		//0094 	1D03
		LJUMP 	20H 			//0095 	3820
		LDWI 	1EH 			//0096 	2A1E
		XORWR 	78H,0 			//0097 	0478
		BTSS 	STATUS,2 		//0098 	1D03
		LJUMP 	20H 			//0099 	3820
		LDWI 	2H 			//009A 	2A02
		XORWR 	77H,0 			//009B 	0477
		BTSC 	STATUS,2 		//009C 	1503
		BTSS 	5H,4 			//009D 	1E05
		LJUMP 	20H 			//009E 	3820
		CLRR 	7CH 			//009F 	017C
		LJUMP 	20H 			//00A0 	3820

		//;USB-cuter.C: 39: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//00A1 	168B
		BTSS 	INTCON,2 		//00A2 	1D0B
		LJUMP 	C1H 			//00A3 	38C1

		//;USB-cuter.C: 40: {
		//;USB-cuter.C: 41: TMR0 = 239;
		LDWI 	EFH 			//00A4 	2AEF
		BCR 	STATUS,5 		//00A5 	1283
		STR 	1H 			//00A6 	0181

		//;USB-cuter.C: 42: T0IF = 0;
		BCR 	INTCON,2 		//00A7 	110B

		//;USB-cuter.C: 44: Puls_Count++;
		INCR	74H,1 			//00A8 	09F4
		BTSC 	STATUS,2 		//00A9 	1503
		INCR	75H,1 			//00AA 	09F5

		//;USB-cuter.C: 46: if(Puls_Count>=1000)Puls_Count=0,S++;
		LDWI 	3H 			//00AB 	2A03
		SUBWR 	75H,0 			//00AC 	0C75
		LDWI 	E8H 			//00AD 	2AE8
		BTSC 	STATUS,2 		//00AE 	1503
		SUBWR 	74H,0 			//00AF 	0C74
		BTSS 	STATUS,0 		//00B0 	1C03
		LJUMP 	B5H 			//00B1 	38B5
		CLRR 	74H 			//00B2 	0174
		CLRR 	75H 			//00B3 	0175
		INCR	79H,1 			//00B4 	09F9

		//;USB-cuter.C: 48: if(S>=60)S=0,M++;
		LDWI 	3CH 			//00B5 	2A3C
		SUBWR 	79H,0 			//00B6 	0C79
		BTSS 	STATUS,0 		//00B7 	1C03
		LJUMP 	BBH 			//00B8 	38BB
		CLRR 	79H 			//00B9 	0179
		INCR	78H,1 			//00BA 	09F8

		//;USB-cuter.C: 49: if(M>=60)M=0,H++;
		LDWI 	3CH 			//00BB 	2A3C
		SUBWR 	78H,0 			//00BC 	0C78
		BTSS 	STATUS,0 		//00BD 	1C03
		LJUMP 	C1H 			//00BE 	38C1
		CLRR 	78H 			//00BF 	0178
		INCR	77H,1 			//00C0 	09F7
		LDR 	7BH,0 			//00C1 	087B
		STR 	PCLATH 			//00C2 	018A
		SWAPR 	7AH,0 			//00C3 	077A
		STR 	STATUS 			//00C4 	0183
		SWAPR 	7EH,1 			//00C5 	07FE
		SWAPR 	7EH,0 			//00C6 	077E
		RETI		 			//00C7 	0009

		//;USB-cuter.C: 102: OSCCON = 0B01110001;
		LDWI 	71H 			//00C8 	2A71
		BSR 	STATUS,5 		//00C9 	1A83
		STR 	FH 			//00CA 	018F

		//;USB-cuter.C: 104: INTCON = 0;
		CLRR 	INTCON 			//00CB 	010B

		//;USB-cuter.C: 105: OPTION = 0B00001000;
		LDWI 	8H 			//00CC 	2A08
		STR 	1H 			//00CD 	0181

		//;USB-cuter.C: 107: PORTA = 0B00000000;
		BCR 	STATUS,5 		//00CE 	1283
		CLRR 	5H 			//00CF 	0105

		//;USB-cuter.C: 108: TRISA = 0B00001000;
		BSR 	STATUS,5 		//00D0 	1A83
		STR 	5H 			//00D1 	0185

		//;USB-cuter.C: 110: WPUA = 0B00001000;
		STR 	15H 			//00D2 	0195

		//;USB-cuter.C: 112: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//00D3 	1283
		CLRR 	1BH 			//00D4 	011B
		RET		 					//00D5 	0004

		//;USB-cuter.C: 118: OPTION = 0B00000110;
		LDWI 	6H 			//00D6 	2A06
		BSR 	STATUS,5 		//00D7 	1A83
		STR 	1H 			//00D8 	0181

		//;USB-cuter.C: 124: TMR0 = 239;
		LDWI 	EFH 			//00D9 	2AEF
		BCR 	STATUS,5 		//00DA 	1283
		STR 	1H 			//00DB 	0181

		//;USB-cuter.C: 125: T0IF = 0;
		BCR 	INTCON,2 		//00DC 	110B

		//;USB-cuter.C: 126: T0IE = 1;
		BSR 	INTCON,5 		//00DD 	1A8B
		RET		 					//00DE 	0004
			END
