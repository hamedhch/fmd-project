//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_PA0		EQU		05H
		_PA1		EQU		05H
		_PA2		EQU		05H
		_PA3		EQU		05H
		_PA4		EQU		05H
		_PA5		EQU		05H
		_T0IF		EQU		0BH
		_T0IE		EQU		0BH
		_PEIE		EQU		0BH
		_GIE		EQU		0BH
		_TMR2IF		EQU		0CH
		_EEIF		EQU		0CH
		_TMR2ON		EQU		12H
		_TMR2IE		EQU		8CH
		_RD		EQU		9CH
		_WR		EQU		9DH
		_conternotRF		EQU		59H
		_conterout		EQU		57H
		_conteroutnot		EQU		55H
		_Timedown		EQU		79H
		_Data		EQU		52H
		_DataM		EQU		4FH
		_DataS		EQU		40H
		_RFData		EQU		4CH
		_eerom		EQU		5FH
		_lastKey		EQU		5EH
		_LernRFKey		EQU		5DH
		_Count		EQU		78H
		_Buffer		EQU		5CH
		_Bit		EQU		5BH
		_O1		EQU		71H
		_O2		EQU		71H
		_O3		EQU		70H
		_O4		EQU		70H
		_Start		EQU		70H
		_state1		EQU		77H
		_state2		EQU		77H
		_state3		EQU		77H
		_state4		EQU		77H
		_LernRFblink		EQU		70H
		_LernRF		EQU		70H
		_Frist		EQU		70H
		_Finish		EQU		70H
		_Lock		EQU		70H
//		main@i_656		EQU		6AH
//		main@i		EQU		69H
//		EEPROMwrite@EEAddr		EQU		76H
//		EEPROMwrite@EEAddr		EQU		76H
//		EEPROMwrite@Data		EQU		60H
//		EEPROMwrite@EEAddr		EQU		76H
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
		STR 	73H 			//0006 	01F3
		LDR 	FSR,0 			//0007 	0804
		STR 	74H 			//0008 	01F4
		LDR 	PCLATH,0 		//0009 	080A
		STR 	75H 			//000A 	01F5
		LJUMP 	18H 			//000B 	3818
		LJUMP 	0DH 			//000C 	380D
		LDWI 	40H 			//000D 	2A40
		CLRR 	70H 			//000E 	0170
		CLRR 	71H 			//000F 	0171
		CLRR 	78H 			//0010 	0178
		CLRR 	79H 			//0011 	0179
		BCR 	STATUS,7 		//0012 	1383
		STR 	FSR 			//0013 	0184
		LDWI 	60H 			//0014 	2A60
		LCALL 	394H 			//0015 	3394
		CLRR 	STATUS 			//0016 	0103
		LJUMP 	1A7H 			//0017 	39A7

		//;rf-out-key.C: 69: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//0018 	168B
		BTSS 	INTCON,2 		//0019 	1D0B
		LJUMP 	124H 			//001A 	3924

		//;rf-out-key.C: 70: {
		//;rf-out-key.C: 71: TMR0 = 239;
		LDWI 	EFH 			//001B 	2AEF
		BCR 	STATUS,5 		//001C 	1283
		STR 	1H 			//001D 	0181

		//;rf-out-key.C: 72: T0IF = 0;
		BCR 	INTCON,2 		//001E 	110B

		//;rf-out-key.C: 75: if(LernRF==1){
		BTSS 	70H,3 			//001F 	1DF0
		LJUMP 	24H 			//0020 	3824

		//;rf-out-key.C: 76: conternotRF++;
		INCR	59H,1 			//0021 	09D9
		BTSC 	STATUS,2 		//0022 	1503
		INCR	5AH,1 			//0023 	09DA

		//;rf-out-key.C: 77: }
		//;rf-out-key.C: 79: if(conternotRF>=20000 ){
		LDWI 	4EH 			//0024 	2A4E
		SUBWR 	5AH,0 			//0025 	0C5A
		LDWI 	20H 			//0026 	2A20
		BTSC 	STATUS,2 		//0027 	1503
		SUBWR 	59H,0 			//0028 	0C59
		BTSS 	STATUS,0 		//0029 	1C03
		LJUMP 	31H 			//002A 	3831

		//;rf-out-key.C: 80: conternotRF=0;
		CLRR 	59H 			//002B 	0159
		CLRR 	5AH 			//002C 	015A

		//;rf-out-key.C: 82: DataM[0]=0;
		CLRR 	4FH 			//002D 	014F

		//;rf-out-key.C: 83: DataM[1]=0;
		CLRR 	50H 			//002E 	0150

		//;rf-out-key.C: 84: DataM[2]=0;
		CLRR 	51H 			//002F 	0151

		//;rf-out-key.C: 86: Lock=1;
		BSR 	70H,0 			//0030 	1870

		//;rf-out-key.C: 87: }
		//;rf-out-key.C: 90: if(PA2==0){
		BTSC 	5H,2 			//0031 	1505
		LJUMP 	38H 			//0032 	3838

		//;rf-out-key.C: 91: conterout++;
		INCR	57H,1 			//0033 	09D7
		BTSC 	STATUS,2 		//0034 	1503
		INCR	58H,1 			//0035 	09D8

		//;rf-out-key.C: 92: conteroutnot=0;
		CLRR 	55H 			//0036 	0155
		CLRR 	56H 			//0037 	0156

		//;rf-out-key.C: 93: }
		//;rf-out-key.C: 95: if(PA2!=0 && conteroutnot<=110){
		BTSS 	5H,2 			//0038 	1D05
		LJUMP 	44H 			//0039 	3844
		LDWI 	0H 			//003A 	2A00
		SUBWR 	56H,0 			//003B 	0C56
		LDWI 	6FH 			//003C 	2A6F
		BTSC 	STATUS,2 		//003D 	1503
		SUBWR 	55H,0 			//003E 	0C55
		BTSC 	STATUS,0 		//003F 	1403
		LJUMP 	44H 			//0040 	3844

		//;rf-out-key.C: 96: conteroutnot++;
		INCR	55H,1 			//0041 	09D5
		BTSC 	STATUS,2 		//0042 	1503
		INCR	56H,1 			//0043 	09D6

		//;rf-out-key.C: 97: }
		//;rf-out-key.C: 100: if(PA2==1 && conterout>5 && conterout<15 ){
		BTSS 	5H,2 			//0044 	1D05
		LJUMP 	57H 			//0045 	3857
		LDWI 	0H 			//0046 	2A00
		SUBWR 	58H,0 			//0047 	0C58
		LDWI 	6H 			//0048 	2A06
		BTSC 	STATUS,2 		//0049 	1503
		SUBWR 	57H,0 			//004A 	0C57
		LDWI 	0H 			//004B 	2A00
		BTSS 	STATUS,0 		//004C 	1C03
		LJUMP 	58H 			//004D 	3858
		SUBWR 	58H,0 			//004E 	0C58
		LDWI 	FH 			//004F 	2A0F
		BTSC 	STATUS,2 		//0050 	1503
		SUBWR 	57H,0 			//0051 	0C57
		BTSC 	STATUS,0 		//0052 	1403
		LJUMP 	57H 			//0053 	3857

		//;rf-out-key.C: 101: conterout++;
		INCR	57H,1 			//0054 	09D7
		BTSC 	STATUS,2 		//0055 	1503
		INCR	58H,1 			//0056 	09D8

		//;rf-out-key.C: 102: }
		//;rf-out-key.C: 104: if(conteroutnot>10 ){
		LDWI 	0H 			//0057 	2A00
		SUBWR 	56H,0 			//0058 	0C56
		LDWI 	BH 			//0059 	2A0B
		BTSC 	STATUS,2 		//005A 	1503
		SUBWR 	55H,0 			//005B 	0C55
		BTSS 	STATUS,0 		//005C 	1C03
		LJUMP 	124H 			//005D 	3924

		//;rf-out-key.C: 107: if(conterout>53 && conterout<57 ){
		LDWI 	0H 			//005E 	2A00
		SUBWR 	58H,0 			//005F 	0C58
		LDWI 	36H 			//0060 	2A36
		BTSC 	STATUS,2 		//0061 	1503
		SUBWR 	57H,0 			//0062 	0C57
		LDWI 	0H 			//0063 	2A00
		BTSS 	STATUS,0 		//0064 	1C03
		LJUMP 	88H 			//0065 	3888
		SUBWR 	58H,0 			//0066 	0C58
		LDWI 	39H 			//0067 	2A39
		BTSC 	STATUS,2 		//0068 	1503
		SUBWR 	57H,0 			//0069 	0C57
		BTSC 	STATUS,0 		//006A 	1403
		LJUMP 	87H 			//006B 	3887

		//;rf-out-key.C: 110: if(lastKey==1)conterout=20;
		DECRSZ 	5EH,0 		//006C 	0E5E
		LJUMP 	71H 			//006D 	3871
		LDWI 	14H 			//006E 	2A14
		STR 	57H 			//006F 	01D7
		CLRR 	58H 			//0070 	0158

		//;rf-out-key.C: 111: if(lastKey==2)conterout=27;
		LDWI 	2H 			//0071 	2A02
		XORWR 	5EH,0 			//0072 	045E
		BTSS 	STATUS,2 		//0073 	1D03
		LJUMP 	78H 			//0074 	3878
		LDWI 	1BH 			//0075 	2A1B
		STR 	57H 			//0076 	01D7
		CLRR 	58H 			//0077 	0158

		//;rf-out-key.C: 112: if(lastKey==3)conterout=34;
		LDWI 	3H 			//0078 	2A03
		XORWR 	5EH,0 			//0079 	045E
		BTSS 	STATUS,2 		//007A 	1D03
		LJUMP 	7FH 			//007B 	387F
		LDWI 	22H 			//007C 	2A22
		STR 	57H 			//007D 	01D7
		CLRR 	58H 			//007E 	0158

		//;rf-out-key.C: 113: if(lastKey==4)conterout=41;
		LDWI 	4H 			//007F 	2A04
		XORWR 	5EH,0 			//0080 	045E
		BTSS 	STATUS,2 		//0081 	1D03
		LJUMP 	86H 			//0082 	3886
		LDWI 	29H 			//0083 	2A29
		STR 	57H 			//0084 	01D7
		CLRR 	58H 			//0085 	0158

		//;rf-out-key.C: 115: LernRFblink=1;
		BSR 	70H,4 			//0086 	1A70

		//;rf-out-key.C: 118: }
		//;rf-out-key.C: 120: if(((conterout>18 && conterout<22 ) || O1==1 ) && LernRFKey!=1){
		LDWI 	0H 			//0087 	2A00
		SUBWR 	58H,0 			//0088 	0C58
		LDWI 	13H 			//0089 	2A13
		BTSC 	STATUS,2 		//008A 	1503
		SUBWR 	57H,0 			//008B 	0C57
		BTSS 	STATUS,0 		//008C 	1C03
		LJUMP 	95H 			//008D 	3895
		LDWI 	0H 			//008E 	2A00
		SUBWR 	58H,0 			//008F 	0C58
		LDWI 	16H 			//0090 	2A16
		BTSC 	STATUS,2 		//0091 	1503
		SUBWR 	57H,0 			//0092 	0C57
		BTSS 	STATUS,0 		//0093 	1C03
		LJUMP 	97H 			//0094 	3897
		BTSS 	71H,1 			//0095 	1CF1
		LJUMP 	ADH 			//0096 	38AD
		DECR 	5DH,0 			//0097 	0D5D
		BTSC 	STATUS,2 		//0098 	1503
		LJUMP 	ADH 			//0099 	38AD

		//;rf-out-key.C: 122: if(state1==0){
		BTSC 	77H,3 			//009A 	15F7
		LJUMP 	9EH 			//009B 	389E

		//;rf-out-key.C: 123: state1=1;
		BSR 	77H,3 			//009C 	19F7

		//;rf-out-key.C: 124: }else{
		LJUMP 	9FH 			//009D 	389F

		//;rf-out-key.C: 125: state1=0;
		BCR 	77H,3 			//009E 	11F7

		//;rf-out-key.C: 126: }
		//;rf-out-key.C: 128: eerom=1;
		LDWI 	1H 			//009F 	2A01
		STR 	5FH 			//00A0 	01DF

		//;rf-out-key.C: 129: if(O1!=1)lastKey=1;
		BTSC 	71H,1 			//00A1 	14F1
		LJUMP 	A5H 			//00A2 	38A5
		LDWI 	1H 			//00A3 	2A01
		STR 	5EH 			//00A4 	01DE

		//;rf-out-key.C: 130: PA4=state1;
		BTSS 	77H,3 			//00A5 	1DF7
		LJUMP 	AAH 			//00A6 	38AA
		BCR 	STATUS,5 		//00A7 	1283
		BSR 	5H,4 			//00A8 	1A05
		LJUMP 	ACH 			//00A9 	38AC
		BCR 	STATUS,5 		//00AA 	1283
		BCR 	5H,4 			//00AB 	1205

		//;rf-out-key.C: 131: O1=0;
		BCR 	71H,1 			//00AC 	10F1

		//;rf-out-key.C: 132: }
		//;rf-out-key.C: 134: if(((conterout>25 && conterout<29 ) || O2==1) && LernRFKey!=2){
		LDWI 	0H 			//00AD 	2A00
		SUBWR 	58H,0 			//00AE 	0C58
		LDWI 	1AH 			//00AF 	2A1A
		BTSC 	STATUS,2 		//00B0 	1503
		SUBWR 	57H,0 			//00B1 	0C57
		BTSS 	STATUS,0 		//00B2 	1C03
		LJUMP 	BBH 			//00B3 	38BB
		LDWI 	0H 			//00B4 	2A00
		SUBWR 	58H,0 			//00B5 	0C58
		LDWI 	1DH 			//00B6 	2A1D
		BTSC 	STATUS,2 		//00B7 	1503
		SUBWR 	57H,0 			//00B8 	0C57
		BTSS 	STATUS,0 		//00B9 	1C03
		LJUMP 	BDH 			//00BA 	38BD
		BTSS 	71H,0 			//00BB 	1C71
		LJUMP 	D4H 			//00BC 	38D4
		LDWI 	2H 			//00BD 	2A02
		XORWR 	5DH,0 			//00BE 	045D
		BTSC 	STATUS,2 		//00BF 	1503
		LJUMP 	D4H 			//00C0 	38D4

		//;rf-out-key.C: 136: if(state2==0){
		BTSC 	77H,2 			//00C1 	1577
		LJUMP 	C5H 			//00C2 	38C5

		//;rf-out-key.C: 137: state2=1;
		BSR 	77H,2 			//00C3 	1977

		//;rf-out-key.C: 138: }else{
		LJUMP 	C6H 			//00C4 	38C6

		//;rf-out-key.C: 139: state2=0;
		BCR 	77H,2 			//00C5 	1177

		//;rf-out-key.C: 140: }
		//;rf-out-key.C: 141: eerom=2;
		LDWI 	2H 			//00C6 	2A02
		STR 	5FH 			//00C7 	01DF

		//;rf-out-key.C: 143: PA0=state2;
		BTSS 	77H,2 			//00C8 	1D77
		LJUMP 	CDH 			//00C9 	38CD
		BCR 	STATUS,5 		//00CA 	1283
		BSR 	5H,0 			//00CB 	1805
		LJUMP 	CFH 			//00CC 	38CF
		BCR 	STATUS,5 		//00CD 	1283
		BCR 	5H,0 			//00CE 	1005

		//;rf-out-key.C: 144: if(O2!=1)lastKey=2;
		BTSC 	71H,0 			//00CF 	1471
		LJUMP 	D3H 			//00D0 	38D3
		LDWI 	2H 			//00D1 	2A02
		STR 	5EH 			//00D2 	01DE

		//;rf-out-key.C: 145: O2=0;
		BCR 	71H,0 			//00D3 	1071

		//;rf-out-key.C: 146: }
		//;rf-out-key.C: 148: if(((conterout>32 && conterout<36 ) || O3==1) && LernRFKey!=3){
		LDWI 	0H 			//00D4 	2A00
		SUBWR 	58H,0 			//00D5 	0C58
		LDWI 	21H 			//00D6 	2A21
		BTSC 	STATUS,2 		//00D7 	1503
		SUBWR 	57H,0 			//00D8 	0C57
		BTSS 	STATUS,0 		//00D9 	1C03
		LJUMP 	E2H 			//00DA 	38E2
		LDWI 	0H 			//00DB 	2A00
		SUBWR 	58H,0 			//00DC 	0C58
		LDWI 	24H 			//00DD 	2A24
		BTSC 	STATUS,2 		//00DE 	1503
		SUBWR 	57H,0 			//00DF 	0C57
		BTSS 	STATUS,0 		//00E0 	1C03
		LJUMP 	E4H 			//00E1 	38E4
		BTSS 	70H,7 			//00E2 	1FF0
		LJUMP 	FBH 			//00E3 	38FB
		LDWI 	3H 			//00E4 	2A03
		XORWR 	5DH,0 			//00E5 	045D
		BTSC 	STATUS,2 		//00E6 	1503
		LJUMP 	FBH 			//00E7 	38FB

		//;rf-out-key.C: 150: if(state3==0){
		BTSC 	77H,1 			//00E8 	14F7
		LJUMP 	ECH 			//00E9 	38EC

		//;rf-out-key.C: 151: state3=1;
		BSR 	77H,1 			//00EA 	18F7

		//;rf-out-key.C: 152: }else{
		LJUMP 	EDH 			//00EB 	38ED

		//;rf-out-key.C: 153: state3=0;
		BCR 	77H,1 			//00EC 	10F7

		//;rf-out-key.C: 154: }
		//;rf-out-key.C: 155: eerom=3;
		LDWI 	3H 			//00ED 	2A03
		STR 	5FH 			//00EE 	01DF

		//;rf-out-key.C: 157: PA1=state3;
		BTSS 	77H,1 			//00EF 	1CF7
		LJUMP 	F4H 			//00F0 	38F4
		BCR 	STATUS,5 		//00F1 	1283
		BSR 	5H,1 			//00F2 	1885
		LJUMP 	F6H 			//00F3 	38F6
		BCR 	STATUS,5 		//00F4 	1283
		BCR 	5H,1 			//00F5 	1085

		//;rf-out-key.C: 158: if(O3!=1)lastKey=3;
		BTSC 	70H,7 			//00F6 	17F0
		LJUMP 	FAH 			//00F7 	38FA
		LDWI 	3H 			//00F8 	2A03
		STR 	5EH 			//00F9 	01DE

		//;rf-out-key.C: 159: O3=0;
		BCR 	70H,7 			//00FA 	13F0

		//;rf-out-key.C: 160: }
		//;rf-out-key.C: 162: if(((conterout>39 && conterout<43 ) || O4==1) && LernRFKey!=4){
		LDWI 	0H 			//00FB 	2A00
		SUBWR 	58H,0 			//00FC 	0C58
		LDWI 	28H 			//00FD 	2A28
		BTSC 	STATUS,2 		//00FE 	1503
		SUBWR 	57H,0 			//00FF 	0C57
		BTSS 	STATUS,0 		//0100 	1C03
		LJUMP 	109H 			//0101 	3909
		LDWI 	0H 			//0102 	2A00
		SUBWR 	58H,0 			//0103 	0C58
		LDWI 	2BH 			//0104 	2A2B
		BTSC 	STATUS,2 		//0105 	1503
		SUBWR 	57H,0 			//0106 	0C57
		BTSS 	STATUS,0 		//0107 	1C03
		LJUMP 	10BH 			//0108 	390B
		BTSS 	70H,6 			//0109 	1F70
		LJUMP 	122H 			//010A 	3922
		LDWI 	4H 			//010B 	2A04
		XORWR 	5DH,0 			//010C 	045D
		BTSC 	STATUS,2 		//010D 	1503
		LJUMP 	122H 			//010E 	3922

		//;rf-out-key.C: 164: if(state4==0){
		BTSC 	77H,0 			//010F 	1477
		LJUMP 	113H 			//0110 	3913

		//;rf-out-key.C: 165: state4=1;
		BSR 	77H,0 			//0111 	1877

		//;rf-out-key.C: 166: }else{
		LJUMP 	114H 			//0112 	3914

		//;rf-out-key.C: 167: state4=0;
		BCR 	77H,0 			//0113 	1077

		//;rf-out-key.C: 168: }
		//;rf-out-key.C: 169: eerom=4;
		LDWI 	4H 			//0114 	2A04
		STR 	5FH 			//0115 	01DF

		//;rf-out-key.C: 171: PA5=state4;
		BTSS 	77H,0 			//0116 	1C77
		LJUMP 	11BH 			//0117 	391B
		BCR 	STATUS,5 		//0118 	1283
		BSR 	5H,5 			//0119 	1A85
		LJUMP 	11DH 			//011A 	391D
		BCR 	STATUS,5 		//011B 	1283
		BCR 	5H,5 			//011C 	1285

		//;rf-out-key.C: 172: if(O4!=1)lastKey=4;
		BTSC 	70H,6 			//011D 	1770
		LJUMP 	121H 			//011E 	3921
		LDWI 	4H 			//011F 	2A04
		STR 	5EH 			//0120 	01DE

		//;rf-out-key.C: 173: O4=0;
		BCR 	70H,6 			//0121 	1370

		//;rf-out-key.C: 174: }
		//;rf-out-key.C: 177: conterout=0;
		CLRR 	57H 			//0122 	0157
		CLRR 	58H 			//0123 	0158

		//;rf-out-key.C: 178: }
		//;rf-out-key.C: 180: }
		//;rf-out-key.C: 184: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//0124 	1A83
		BTSS 	CH,1 			//0125 	1C8C
		LJUMP 	19EH 			//0126 	399E
		BCR 	STATUS,5 		//0127 	1283
		BTSS 	CH,1 			//0128 	1C8C
		LJUMP 	19EH 			//0129 	399E

		//;rf-out-key.C: 185: {
		//;rf-out-key.C: 189: TMR2IF = 0;
		BCR 	CH,1 			//012A 	108C
		CLRWDT	 			//012B 	0001

		//;rf-out-key.C: 192: if(PA3==0){
		BCR 	STATUS,5 		//012C 	1283
		BTSC 	5H,3 			//012D 	1585
		LJUMP 	132H 			//012E 	3932

		//;rf-out-key.C: 193: Timedown++;Frist=1;
		INCR	79H,1 			//012F 	09F9
		BSR 	70H,2 			//0130 	1970

		//;rf-out-key.C: 195: }
		LJUMP 	19EH 			//0131 	399E

		//;rf-out-key.C: 196: else
		//;rf-out-key.C: 197: {
		//;rf-out-key.C: 200: if(Timedown>250){
		LDWI 	FBH 			//0132 	2AFB
		SUBWR 	79H,0 			//0133 	0C79
		BTSS 	STATUS,0 		//0134 	1C03
		LJUMP 	138H 			//0135 	3938

		//;rf-out-key.C: 201: Finish=0;
		BCR 	70H,1 			//0136 	10F0

		//;rf-out-key.C: 202: Timedown=0;
		CLRR 	79H 			//0137 	0179

		//;rf-out-key.C: 203: }
		//;rf-out-key.C: 205: if(Frist==1 & Finish==0)
		BTSS 	70H,1 			//0138 	1CF0
		BTSS 	70H,2 			//0139 	1D70
		LJUMP 	19DH 			//013A 	399D

		//;rf-out-key.C: 206: {
		//;rf-out-key.C: 208: if(Start==1)
		BTSS 	70H,5 			//013B 	1EF0
		LJUMP 	191H 			//013C 	3991

		//;rf-out-key.C: 209: {
		//;rf-out-key.C: 210: Bit--;
		DECR 	5BH,1 			//013D 	0DDB

		//;rf-out-key.C: 211: if(Timedown>15 & Timedown< 30){
		LDWI 	10H 			//013E 	2A10
		SUBWR 	79H,0 			//013F 	0C79
		BTSS 	STATUS,0 		//0140 	1C03
		LJUMP 	149H 			//0141 	3949
		LDWI 	1EH 			//0142 	2A1E
		SUBWR 	79H,0 			//0143 	0C79
		BTSC 	STATUS,0 		//0144 	1403
		LJUMP 	149H 			//0145 	3949

		//;rf-out-key.C: 212: Buffer = Buffer << 1;
		BCR 	STATUS,0 		//0146 	1003
		RLR 	5CH,0 			//0147 	055C
		LJUMP 	156H 			//0148 	3956

		//;rf-out-key.C: 213: }
		//;rf-out-key.C: 214: else if(Timedown>5 & Timedown< 12){
		LDWI 	6H 			//0149 	2A06
		SUBWR 	79H,0 			//014A 	0C79
		BTSS 	STATUS,0 		//014B 	1C03
		LJUMP 	158H 			//014C 	3958
		LDWI 	CH 			//014D 	2A0C
		SUBWR 	79H,0 			//014E 	0C79
		BTSC 	STATUS,0 		//014F 	1403
		LJUMP 	158H 			//0150 	3958

		//;rf-out-key.C: 215: Buffer = Buffer << 1;
		BCR 	STATUS,0 		//0151 	1003
		RLR 	5CH,0 			//0152 	055C
		STR 	5CH 			//0153 	01DC

		//;rf-out-key.C: 216: Buffer = Buffer + 1;
		LDR 	5CH,0 			//0154 	085C
		ADDWI 	1H 			//0155 	2701
		STR 	5CH 			//0156 	01DC

		//;rf-out-key.C: 217: }
		LJUMP 	15DH 			//0157 	395D

		//;rf-out-key.C: 218: else{
		//;rf-out-key.C: 219: Count=0;
		CLRR 	78H 			//0158 	0178

		//;rf-out-key.C: 220: Bit=8;
		LDWI 	8H 			//0159 	2A08
		STR 	5BH 			//015A 	01DB

		//;rf-out-key.C: 221: Buffer=0;
		CLRR 	5CH 			//015B 	015C

		//;rf-out-key.C: 222: Start=0;
		BCR 	70H,5 			//015C 	12F0

		//;rf-out-key.C: 223: }
		//;rf-out-key.C: 225: if(Bit == 0){
		LDR 	5BH,0 			//015D 	085B
		BTSS 	STATUS,2 		//015E 	1D03
		LJUMP 	191H 			//015F 	3991

		//;rf-out-key.C: 226: Bit=8;
		LDWI 	8H 			//0160 	2A08
		STR 	5BH 			//0161 	01DB

		//;rf-out-key.C: 227: Data[Count]=RFData[Count];
		LDR 	78H,0 			//0162 	0878
		ADDWI 	4CH 			//0163 	274C
		STR 	FSR 			//0164 	0184
		BCR 	STATUS,7 		//0165 	1383
		LDR 	INDF,0 			//0166 	0800
		STR 	72H 			//0167 	01F2
		LDR 	78H,0 			//0168 	0878
		ADDWI 	52H 			//0169 	2752
		STR 	FSR 			//016A 	0184
		LDR 	72H,0 			//016B 	0872
		STR 	INDF 			//016C 	0180

		//;rf-out-key.C: 228: RFData[Count]=Buffer;
		LDR 	78H,0 			//016D 	0878
		ADDWI 	4CH 			//016E 	274C
		STR 	FSR 			//016F 	0184
		LDR 	5CH,0 			//0170 	085C
		STR 	INDF 			//0171 	0180

		//;rf-out-key.C: 229: Count++;
		INCR	78H,1 			//0172 	09F8

		//;rf-out-key.C: 231: if(Count>=3)
		LDWI 	3H 			//0173 	2A03
		SUBWR 	78H,0 			//0174 	0C78
		BTSS 	STATUS,0 		//0175 	1C03
		LJUMP 	18FH 			//0176 	398F

		//;rf-out-key.C: 232: {
		//;rf-out-key.C: 233: Count=0;
		CLRR 	78H 			//0177 	0178

		//;rf-out-key.C: 234: Start=0;
		BCR 	70H,5 			//0178 	12F0

		//;rf-out-key.C: 235: if(Data[0]==RFData[0] && Data[1]==RFData[1] &&Data[2]==RFData[2])
		LDR 	52H,0 			//0179 	0852
		XORWR 	4CH,0 			//017A 	044C
		BTSS 	STATUS,2 		//017B 	1D03
		LJUMP 	18EH 			//017C 	398E
		LDR 	53H,0 			//017D 	0853
		XORWR 	4DH,0 			//017E 	044D
		BTSS 	STATUS,2 		//017F 	1D03
		LJUMP 	18EH 			//0180 	398E
		LDR 	54H,0 			//0181 	0854
		XORWR 	4EH,0 			//0182 	044E
		BTSS 	STATUS,2 		//0183 	1D03
		LJUMP 	18EH 			//0184 	398E

		//;rf-out-key.C: 236: {
		//;rf-out-key.C: 237: DataM[0]=RFData[0];
		LDR 	4CH,0 			//0185 	084C
		STR 	4FH 			//0186 	01CF

		//;rf-out-key.C: 238: DataM[1]=RFData[1];
		LDR 	4DH,0 			//0187 	084D
		STR 	50H 			//0188 	01D0

		//;rf-out-key.C: 239: DataM[2]=RFData[2];
		LDR 	4EH,0 			//0189 	084E
		STR 	51H 			//018A 	01D1

		//;rf-out-key.C: 241: Finish=1;
		BSR 	70H,1 			//018B 	18F0

		//;rf-out-key.C: 242: Lock=1;
		BSR 	70H,0 			//018C 	1870

		//;rf-out-key.C: 243: }else
		LJUMP 	18FH 			//018D 	398F

		//;rf-out-key.C: 244: {
		//;rf-out-key.C: 245: __nop();
		NOP		 					//018E 	0000

		//;rf-out-key.C: 246: }
		//;rf-out-key.C: 247: }
		//;rf-out-key.C: 248: Buffer=0;
		BCR 	STATUS,5 		//018F 	1283
		CLRR 	5CH 			//0190 	015C

		//;rf-out-key.C: 249: }
		//;rf-out-key.C: 250: }
		//;rf-out-key.C: 252: if(Timedown>200 && Timedown<240){
		LDWI 	C9H 			//0191 	2AC9
		SUBWR 	79H,0 			//0192 	0C79
		BTSS 	STATUS,0 		//0193 	1C03
		LJUMP 	19CH 			//0194 	399C
		LDWI 	F0H 			//0195 	2AF0
		SUBWR 	79H,0 			//0196 	0C79
		BTSC 	STATUS,0 		//0197 	1403
		LJUMP 	19CH 			//0198 	399C

		//;rf-out-key.C: 253: Start=1;Bit=8;
		BSR 	70H,5 			//0199 	1AF0
		LDWI 	8H 			//019A 	2A08
		STR 	5BH 			//019B 	01DB

		//;rf-out-key.C: 254: }
		//;rf-out-key.C: 256: Frist=0;
		BCR 	70H,2 			//019C 	1170

		//;rf-out-key.C: 258: }
		//;rf-out-key.C: 259: Timedown=0;
		CLRR 	79H 			//019D 	0179
		LDR 	75H,0 			//019E 	0875
		STR 	PCLATH 			//019F 	018A
		LDR 	74H,0 			//01A0 	0874
		STR 	FSR 			//01A1 	0184
		SWAPR 	73H,0 			//01A2 	0773
		STR 	STATUS 			//01A3 	0183
		SWAPR 	7EH,1 			//01A4 	07FE
		SWAPR 	7EH,0 			//01A5 	077E
		RETI		 			//01A6 	0009

		//;rf-out-key.C: 271: POWER_INITIAL();
		LCALL 	35BH 			//01A7 	335B

		//;rf-out-key.C: 272: TIMER2_INITIAL();
		LCALL 	36BH 			//01A8 	336B

		//;rf-out-key.C: 273: TIMER0_INITIAL();
		LCALL 	382H 			//01A9 	3382

		//;rf-out-key.C: 275: TMR2IE = 1;
		BSR 	STATUS,5 		//01AA 	1A83
		BSR 	CH,1 			//01AB 	188C

		//;rf-out-key.C: 277: Finish=0;
		BCR 	70H,1 			//01AC 	10F0

		//;rf-out-key.C: 279: state1=EEPROMread(31);
		LDWI 	1FH 			//01AD 	2A1F
		LCALL 	38BH 			//01AE 	338B
		STR 	68H 			//01AF 	01E8
		RRR	68H,0 			//01B0 	0668
		BTSS 	STATUS,0 		//01B1 	1C03
		LJUMP 	1B5H 			//01B2 	39B5
		BSR 	77H,3 			//01B3 	19F7
		LJUMP 	1B6H 			//01B4 	39B6
		BCR 	77H,3 			//01B5 	11F7

		//;rf-out-key.C: 280: state2=EEPROMread(32);
		LDWI 	20H 			//01B6 	2A20
		LCALL 	38BH 			//01B7 	338B
		STR 	68H 			//01B8 	01E8
		RRR	68H,0 			//01B9 	0668
		BTSS 	STATUS,0 		//01BA 	1C03
		LJUMP 	1BEH 			//01BB 	39BE
		BSR 	77H,2 			//01BC 	1977
		LJUMP 	1BFH 			//01BD 	39BF
		BCR 	77H,2 			//01BE 	1177

		//;rf-out-key.C: 281: state3=EEPROMread(33);
		LDWI 	21H 			//01BF 	2A21
		LCALL 	38BH 			//01C0 	338B
		STR 	68H 			//01C1 	01E8
		RRR	68H,0 			//01C2 	0668
		BTSS 	STATUS,0 		//01C3 	1C03
		LJUMP 	1C7H 			//01C4 	39C7
		BSR 	77H,1 			//01C5 	18F7
		LJUMP 	1C8H 			//01C6 	39C8
		BCR 	77H,1 			//01C7 	10F7

		//;rf-out-key.C: 282: state4=EEPROMread(34);
		LDWI 	22H 			//01C8 	2A22
		LCALL 	38BH 			//01C9 	338B
		STR 	68H 			//01CA 	01E8
		RRR	68H,0 			//01CB 	0668
		BTSS 	STATUS,0 		//01CC 	1C03
		LJUMP 	1D0H 			//01CD 	39D0
		BSR 	77H,0 			//01CE 	1877
		LJUMP 	1D1H 			//01CF 	39D1
		BCR 	77H,0 			//01D0 	1077

		//;rf-out-key.C: 285: PA4=state1;
		BTSS 	77H,3 			//01D1 	1DF7
		LJUMP 	1D6H 			//01D2 	39D6
		BCR 	STATUS,5 		//01D3 	1283
		BSR 	5H,4 			//01D4 	1A05
		LJUMP 	1D8H 			//01D5 	39D8
		BCR 	STATUS,5 		//01D6 	1283
		BCR 	5H,4 			//01D7 	1205

		//;rf-out-key.C: 286: PA0=state2;
		BTSS 	77H,2 			//01D8 	1D77
		LJUMP 	1DDH 			//01D9 	39DD
		BCR 	STATUS,5 		//01DA 	1283
		BSR 	5H,0 			//01DB 	1805
		LJUMP 	1DFH 			//01DC 	39DF
		BCR 	STATUS,5 		//01DD 	1283
		BCR 	5H,0 			//01DE 	1005

		//;rf-out-key.C: 287: PA1=state3;
		BTSS 	77H,1 			//01DF 	1CF7
		LJUMP 	1E4H 			//01E0 	39E4
		BCR 	STATUS,5 		//01E1 	1283
		BSR 	5H,1 			//01E2 	1885
		LJUMP 	1E6H 			//01E3 	39E6
		BCR 	STATUS,5 		//01E4 	1283
		BCR 	5H,1 			//01E5 	1085

		//;rf-out-key.C: 288: PA5=state4;
		BTSS 	77H,0 			//01E6 	1C77
		LJUMP 	1EBH 			//01E7 	39EB
		BCR 	STATUS,5 		//01E8 	1283
		BSR 	5H,5 			//01E9 	1A85
		LJUMP 	1EDH 			//01EA 	39ED
		BCR 	STATUS,5 		//01EB 	1283
		BCR 	5H,5 			//01EC 	1285

		//;rf-out-key.C: 290: char i;
		//;rf-out-key.C: 291: for(i=0;i<4;i++)
		CLRR 	69H 			//01ED 	0169
		CLRWDT	 			//01EE 	0001

		//;rf-out-key.C: 294: DataS[i][0]=EEPROMread(i*3);
		BCR 	STATUS,5 		//01EF 	1283
		LDR 	69H,0 			//01F0 	0869
		ADDWR 	69H,0 			//01F1 	0B69
		ADDWR 	69H,0 			//01F2 	0B69
		ADDWI 	40H 			//01F3 	2740
		STR 	FSR 			//01F4 	0184
		LDR 	69H,0 			//01F5 	0869
		ADDWR 	69H,0 			//01F6 	0B69
		ADDWR 	69H,0 			//01F7 	0B69
		LCALL 	38BH 			//01F8 	338B

		//;rf-out-key.C: 295: DataS[i][1]=EEPROMread((i*3)+1);
		LCALL 	31AH 			//01F9 	331A
		ADDWI 	41H 			//01FA 	2741
		STR 	FSR 			//01FB 	0184
		LDR 	69H,0 			//01FC 	0869
		ADDWR 	69H,0 			//01FD 	0B69
		ADDWR 	69H,0 			//01FE 	0B69
		ADDWI 	1H 			//01FF 	2701
		LCALL 	38BH 			//0200 	338B

		//;rf-out-key.C: 296: DataS[i][2]=EEPROMread((i*3)+2);
		LCALL 	31AH 			//0201 	331A
		ADDWI 	42H 			//0202 	2742
		STR 	FSR 			//0203 	0184
		LDR 	69H,0 			//0204 	0869
		ADDWR 	69H,0 			//0205 	0B69
		ADDWR 	69H,0 			//0206 	0B69
		ADDWI 	2H 			//0207 	2702
		LCALL 	38BH 			//0208 	338B
		BCR 	STATUS,7 		//0209 	1383
		STR 	INDF 			//020A 	0180
		LDWI 	4H 			//020B 	2A04
		INCR	69H,1 			//020C 	09E9
		SUBWR 	69H,0 			//020D 	0C69
		BTSS 	STATUS,0 		//020E 	1C03
		LJUMP 	1EEH 			//020F 	39EE

		//;rf-out-key.C: 297: }
		//;rf-out-key.C: 300: Start=0;
		BCR 	70H,5 			//0210 	12F0

		//;rf-out-key.C: 302: while(1)
		CLRWDT	 			//0211 	0001

		//;rf-out-key.C: 306: if(eerom!=0){
		BCR 	STATUS,5 		//0212 	1283
		LDR 	5FH,0 			//0213 	085F
		BTSC 	STATUS,2 		//0214 	1503
		LJUMP 	251H 			//0215 	3A51

		//;rf-out-key.C: 307: if(eerom==1)EEPROMwrite(31,state1);
		DECRSZ 	5FH,0 		//0216 	0E5F
		LJUMP 	222H 			//0217 	3A22
		BCR 	STATUS,0 		//0218 	1003
		BTSC 	77H,3 			//0219 	15F7
		BSR 	STATUS,0 		//021A 	1803
		LDWI 	0H 			//021B 	2A00
		BTSC 	STATUS,0 		//021C 	1403
		LDWI 	1H 			//021D 	2A01
		STR 	60H 			//021E 	01E0
		LDWI 	1FH 			//021F 	2A1F
		CLRR 	61H 			//0220 	0161
		LCALL 	346H 			//0221 	3346

		//;rf-out-key.C: 308: if(eerom==2)EEPROMwrite(32,state2);
		LDWI 	2H 			//0222 	2A02
		BCR 	STATUS,5 		//0223 	1283
		XORWR 	5FH,0 			//0224 	045F
		BTSS 	STATUS,2 		//0225 	1D03
		LJUMP 	231H 			//0226 	3A31
		BCR 	STATUS,0 		//0227 	1003
		BTSC 	77H,2 			//0228 	1577
		BSR 	STATUS,0 		//0229 	1803
		LDWI 	0H 			//022A 	2A00
		BTSC 	STATUS,0 		//022B 	1403
		LDWI 	1H 			//022C 	2A01
		STR 	60H 			//022D 	01E0
		LDWI 	20H 			//022E 	2A20
		CLRR 	61H 			//022F 	0161
		LCALL 	346H 			//0230 	3346

		//;rf-out-key.C: 309: if(eerom==3)EEPROMwrite(33,state3);
		LDWI 	3H 			//0231 	2A03
		BCR 	STATUS,5 		//0232 	1283
		XORWR 	5FH,0 			//0233 	045F
		BTSS 	STATUS,2 		//0234 	1D03
		LJUMP 	240H 			//0235 	3A40
		BCR 	STATUS,0 		//0236 	1003
		BTSC 	77H,1 			//0237 	14F7
		BSR 	STATUS,0 		//0238 	1803
		LDWI 	0H 			//0239 	2A00
		BTSC 	STATUS,0 		//023A 	1403
		LDWI 	1H 			//023B 	2A01
		STR 	60H 			//023C 	01E0
		LDWI 	21H 			//023D 	2A21
		CLRR 	61H 			//023E 	0161
		LCALL 	346H 			//023F 	3346

		//;rf-out-key.C: 310: if(eerom==4)EEPROMwrite(34,state4);
		LDWI 	4H 			//0240 	2A04
		BCR 	STATUS,5 		//0241 	1283
		XORWR 	5FH,0 			//0242 	045F
		BTSS 	STATUS,2 		//0243 	1D03
		LJUMP 	24FH 			//0244 	3A4F
		BCR 	STATUS,0 		//0245 	1003
		BTSC 	77H,0 			//0246 	1477
		BSR 	STATUS,0 		//0247 	1803
		LDWI 	0H 			//0248 	2A00
		BTSC 	STATUS,0 		//0249 	1403
		LDWI 	1H 			//024A 	2A01
		STR 	60H 			//024B 	01E0
		LDWI 	22H 			//024C 	2A22
		CLRR 	61H 			//024D 	0161
		LCALL 	346H 			//024E 	3346

		//;rf-out-key.C: 311: eerom=0;
		BCR 	STATUS,5 		//024F 	1283
		CLRR 	5FH 			//0250 	015F

		//;rf-out-key.C: 312: }
		//;rf-out-key.C: 315: if(LernRFblink==1){
		BTSS 	70H,4 			//0251 	1E70
		LJUMP 	291H 			//0252 	3A91

		//;rf-out-key.C: 317: if(lastKey==1) DelayMs(200) ,PA4=!PA4 , DelayMs(200) , PA4=!PA4 , Le
		//+                          rnRFKey=1;
		DECRSZ 	5EH,0 		//0253 	0E5E
		LJUMP 	260H 			//0254 	3A60
		LDWI 	C8H 			//0255 	2AC8
		STR 	62H 			//0256 	01E2
		CLRR 	63H 			//0257 	0163
		LCALL 	32AH 			//0258 	332A
		LDWI 	10H 			//0259 	2A10
		LCALL 	320H 			//025A 	3320
		LCALL 	32AH 			//025B 	332A
		LDWI 	10H 			//025C 	2A10
		XORWR 	5H,1 			//025D 	0485
		LDWI 	1H 			//025E 	2A01
		STR 	5DH 			//025F 	01DD

		//;rf-out-key.C: 318: if(lastKey==2) DelayMs(200) ,PA0=!PA0 , DelayMs(200) , PA0=!PA0 , Le
		//+                          rnRFKey=2 ;
		LDWI 	2H 			//0260 	2A02
		XORWR 	5EH,0 			//0261 	045E
		BTSS 	STATUS,2 		//0262 	1D03
		LJUMP 	26FH 			//0263 	3A6F
		LDWI 	C8H 			//0264 	2AC8
		STR 	62H 			//0265 	01E2
		CLRR 	63H 			//0266 	0163
		LCALL 	32AH 			//0267 	332A
		LDWI 	1H 			//0268 	2A01
		LCALL 	320H 			//0269 	3320
		LCALL 	32AH 			//026A 	332A
		LDWI 	1H 			//026B 	2A01
		XORWR 	5H,1 			//026C 	0485
		LDWI 	2H 			//026D 	2A02
		STR 	5DH 			//026E 	01DD

		//;rf-out-key.C: 319: if(lastKey==3) DelayMs(200) ,PA1=!PA1 , DelayMs(200) , PA1=!PA1 , Le
		//+                          rnRFKey=3 ;
		LDWI 	3H 			//026F 	2A03
		XORWR 	5EH,0 			//0270 	045E
		BTSS 	STATUS,2 		//0271 	1D03
		LJUMP 	27EH 			//0272 	3A7E
		LDWI 	C8H 			//0273 	2AC8
		STR 	62H 			//0274 	01E2
		CLRR 	63H 			//0275 	0163
		LCALL 	32AH 			//0276 	332A
		LDWI 	2H 			//0277 	2A02
		LCALL 	320H 			//0278 	3320
		LCALL 	32AH 			//0279 	332A
		LDWI 	2H 			//027A 	2A02
		XORWR 	5H,1 			//027B 	0485
		LDWI 	3H 			//027C 	2A03
		STR 	5DH 			//027D 	01DD

		//;rf-out-key.C: 320: if(lastKey==4) DelayMs(200) ,PA5=!PA5 , DelayMs(200) , PA5=!PA5 , Le
		//+                          rnRFKey=4 ;
		LDWI 	4H 			//027E 	2A04
		XORWR 	5EH,0 			//027F 	045E
		BTSS 	STATUS,2 		//0280 	1D03
		LJUMP 	28DH 			//0281 	3A8D
		LDWI 	C8H 			//0282 	2AC8
		STR 	62H 			//0283 	01E2
		CLRR 	63H 			//0284 	0163
		LCALL 	32AH 			//0285 	332A
		LDWI 	20H 			//0286 	2A20
		LCALL 	320H 			//0287 	3320
		LCALL 	32AH 			//0288 	332A
		LDWI 	20H 			//0289 	2A20
		XORWR 	5H,1 			//028A 	0485
		LDWI 	4H 			//028B 	2A04
		STR 	5DH 			//028C 	01DD

		//;rf-out-key.C: 322: LernRFblink=0;
		BCR 	70H,4 			//028D 	1270

		//;rf-out-key.C: 323: conternotRF=0;
		CLRR 	59H 			//028E 	0159
		CLRR 	5AH 			//028F 	015A

		//;rf-out-key.C: 324: LernRF=1;
		BSR 	70H,3 			//0290 	19F0

		//;rf-out-key.C: 326: }
		//;rf-out-key.C: 328: if(Lock==1 & LernRF==0)
		BTSS 	70H,3 			//0291 	1DF0
		BTSS 	70H,0 			//0292 	1C70
		LJUMP 	2C6H 			//0293 	3AC6

		//;rf-out-key.C: 329: {
		//;rf-out-key.C: 330: Lock=0;
		BCR 	70H,0 			//0294 	1070

		//;rf-out-key.C: 331: char i;
		//;rf-out-key.C: 332: for(i=0;i<4;i++)
		CLRR 	6AH 			//0295 	016A

		//;rf-out-key.C: 333: {
		//;rf-out-key.C: 334: if(DataM[0]==DataS[i][0] && DataM[1]==DataS[i][1] && DataM[2]==DataS
		//+                          [i][2]){
		LDR 	6AH,0 			//0296 	086A
		ADDWR 	6AH,0 			//0297 	0B6A
		ADDWR 	6AH,0 			//0298 	0B6A
		ADDWI 	40H 			//0299 	2740
		STR 	FSR 			//029A 	0184
		BCR 	STATUS,7 		//029B 	1383
		LDR 	INDF,0 			//029C 	0800
		XORWR 	4FH,0 			//029D 	044F
		BTSS 	STATUS,2 		//029E 	1D03
		LJUMP 	2C1H 			//029F 	3AC1
		LDR 	6AH,0 			//02A0 	086A
		ADDWR 	6AH,0 			//02A1 	0B6A
		ADDWR 	6AH,0 			//02A2 	0B6A
		ADDWI 	41H 			//02A3 	2741
		STR 	FSR 			//02A4 	0184
		LDR 	50H,0 			//02A5 	0850
		XORWR 	INDF,0 		//02A6 	0400
		BTSS 	STATUS,2 		//02A7 	1D03
		LJUMP 	2C1H 			//02A8 	3AC1
		LDR 	6AH,0 			//02A9 	086A
		ADDWR 	6AH,0 			//02AA 	0B6A
		ADDWR 	6AH,0 			//02AB 	0B6A
		ADDWI 	42H 			//02AC 	2742
		STR 	FSR 			//02AD 	0184
		LDR 	51H,0 			//02AE 	0851
		XORWR 	INDF,0 		//02AF 	0400
		BTSS 	STATUS,2 		//02B0 	1D03
		LJUMP 	2C1H 			//02B1 	3AC1

		//;rf-out-key.C: 335: if(i==0)O1=1;
		LDR 	6AH,0 			//02B2 	086A
		BTSS 	STATUS,2 		//02B3 	1D03
		LJUMP 	2B6H 			//02B4 	3AB6
		BSR 	71H,1 			//02B5 	18F1

		//;rf-out-key.C: 336: if(i==1)O2=1;
		DECRSZ 	6AH,0 		//02B6 	0E6A
		LJUMP 	2B9H 			//02B7 	3AB9
		BSR 	71H,0 			//02B8 	1871

		//;rf-out-key.C: 337: if(i==2)O3=1;
		LDWI 	2H 			//02B9 	2A02
		XORWR 	6AH,0 			//02BA 	046A
		BTSC 	STATUS,2 		//02BB 	1503
		BSR 	70H,7 			//02BC 	1BF0

		//;rf-out-key.C: 338: if(i==3)O4=1;
		LDWI 	3H 			//02BD 	2A03
		XORWR 	6AH,0 			//02BE 	046A
		BTSC 	STATUS,2 		//02BF 	1503
		BSR 	70H,6 			//02C0 	1B70
		LDWI 	4H 			//02C1 	2A04
		INCR	6AH,1 			//02C2 	09EA
		SUBWR 	6AH,0 			//02C3 	0C6A
		BTSS 	STATUS,0 		//02C4 	1C03
		LJUMP 	296H 			//02C5 	3A96

		//;rf-out-key.C: 339: }
		//;rf-out-key.C: 340: }
		//;rf-out-key.C: 341: }
		//;rf-out-key.C: 344: if(Lock==1 & LernRF==1)
		BTSC 	70H,0 			//02C6 	1470
		BTSS 	70H,3 			//02C7 	1DF0
		LJUMP 	211H 			//02C8 	3A11

		//;rf-out-key.C: 345: {
		//;rf-out-key.C: 346: EEPROMwrite(((LernRFKey-1)*3),DataM[0]);
		LDR 	4FH,0 			//02C9 	084F
		STR 	60H 			//02CA 	01E0
		LDWI 	FFH 			//02CB 	2AFF
		CLRR 	61H 			//02CC 	0161
		ADDWR 	5DH,0 			//02CD 	0B5D
		STR 	68H 			//02CE 	01E8
		ADDWR 	68H,0 			//02CF 	0B68
		ADDWR 	68H,0 			//02D0 	0B68
		LCALL 	346H 			//02D1 	3346

		//;rf-out-key.C: 347: DelayMs(10);
		LCALL 	325H 			//02D2 	3325
		LCALL 	32AH 			//02D3 	332A

		//;rf-out-key.C: 348: EEPROMwrite((((LernRFKey-1)*3)+1),DataM[1]);
		LDR 	50H,0 			//02D4 	0850
		LCALL 	314H 			//02D5 	3314
		ADDWI 	FEH 			//02D6 	27FE
		LCALL 	346H 			//02D7 	3346

		//;rf-out-key.C: 349: DelayMs(10);
		LCALL 	325H 			//02D8 	3325
		LCALL 	32AH 			//02D9 	332A

		//;rf-out-key.C: 350: EEPROMwrite((((LernRFKey-1)*3)+2),DataM[2]);
		LDR 	51H,0 			//02DA 	0851
		LCALL 	314H 			//02DB 	3314
		ADDWI 	FFH 			//02DC 	27FF
		LCALL 	346H 			//02DD 	3346

		//;rf-out-key.C: 351: DelayMs(10);
		LCALL 	325H 			//02DE 	3325
		LCALL 	32AH 			//02DF 	332A

		//;rf-out-key.C: 352: DataS[LernRFKey-1][0]=DataM[0];
		LDR 	5DH,0 			//02E0 	085D
		ADDWR 	5DH,0 			//02E1 	0B5D
		ADDWR 	5DH,0 			//02E2 	0B5D
		ADDWI 	3DH 			//02E3 	273D
		STR 	FSR 			//02E4 	0184
		LDR 	4FH,0 			//02E5 	084F
		BCR 	STATUS,7 		//02E6 	1383
		STR 	INDF 			//02E7 	0180

		//;rf-out-key.C: 353: DataS[LernRFKey-1][1]=DataM[1];
		LDR 	5DH,0 			//02E8 	085D
		ADDWR 	5DH,0 			//02E9 	0B5D
		ADDWR 	5DH,0 			//02EA 	0B5D
		ADDWI 	3EH 			//02EB 	273E
		STR 	FSR 			//02EC 	0184
		LDR 	50H,0 			//02ED 	0850
		STR 	INDF 			//02EE 	0180

		//;rf-out-key.C: 354: DataS[LernRFKey-1][2]=DataM[2];
		LDR 	5DH,0 			//02EF 	085D
		ADDWR 	5DH,0 			//02F0 	0B5D
		ADDWR 	5DH,0 			//02F1 	0B5D
		ADDWI 	3FH 			//02F2 	273F
		STR 	FSR 			//02F3 	0184
		LDR 	51H,0 			//02F4 	0851
		STR 	INDF 			//02F5 	0180

		//;rf-out-key.C: 356: if(LernRFKey==1)conterout=20;
		DECRSZ 	5DH,0 		//02F6 	0E5D
		LJUMP 	2FBH 			//02F7 	3AFB
		LDWI 	14H 			//02F8 	2A14
		STR 	57H 			//02F9 	01D7
		CLRR 	58H 			//02FA 	0158

		//;rf-out-key.C: 357: if(LernRFKey==2)conterout=27;
		LDWI 	2H 			//02FB 	2A02
		XORWR 	5DH,0 			//02FC 	045D
		BTSS 	STATUS,2 		//02FD 	1D03
		LJUMP 	302H 			//02FE 	3B02
		LDWI 	1BH 			//02FF 	2A1B
		STR 	57H 			//0300 	01D7
		CLRR 	58H 			//0301 	0158

		//;rf-out-key.C: 358: if(LernRFKey==3)conterout=34;
		LDWI 	3H 			//0302 	2A03
		XORWR 	5DH,0 			//0303 	045D
		BTSS 	STATUS,2 		//0304 	1D03
		LJUMP 	309H 			//0305 	3B09
		LDWI 	22H 			//0306 	2A22
		STR 	57H 			//0307 	01D7
		CLRR 	58H 			//0308 	0158

		//;rf-out-key.C: 359: if(LernRFKey==4)conterout=41;
		LDWI 	4H 			//0309 	2A04
		XORWR 	5DH,0 			//030A 	045D
		BTSS 	STATUS,2 		//030B 	1D03
		LJUMP 	310H 			//030C 	3B10
		LDWI 	29H 			//030D 	2A29
		STR 	57H 			//030E 	01D7
		CLRR 	58H 			//030F 	0158

		//;rf-out-key.C: 361: LernRFKey=0;
		CLRR 	5DH 			//0310 	015D

		//;rf-out-key.C: 362: Lock=0;
		BCR 	70H,0 			//0311 	1070

		//;rf-out-key.C: 363: LernRF=0;
		BCR 	70H,3 			//0312 	11F0
		LJUMP 	211H 			//0313 	3A11
		STR 	60H 			//0314 	01E0
		CLRR 	61H 			//0315 	0161
		LDR 	5DH,0 			//0316 	085D
		ADDWR 	5DH,0 			//0317 	0B5D
		ADDWR 	5DH,0 			//0318 	0B5D
		RET		 					//0319 	0004
		BCR 	STATUS,7 		//031A 	1383
		STR 	INDF 			//031B 	0180
		LDR 	69H,0 			//031C 	0869
		ADDWR 	69H,0 			//031D 	0B69
		ADDWR 	69H,0 			//031E 	0B69
		RET		 					//031F 	0004
		XORWR 	5H,1 			//0320 	0485
		LDWI 	C8H 			//0321 	2AC8
		STR 	62H 			//0322 	01E2
		CLRR 	63H 			//0323 	0163
		RET		 					//0324 	0004
		LDWI 	AH 			//0325 	2A0A
		BCR 	STATUS,5 		//0326 	1283
		STR 	62H 			//0327 	01E2
		CLRR 	63H 			//0328 	0163
		RET		 					//0329 	0004

		//;rf-out-key.C: 454: unsigned int a,b;
		//;rf-out-key.C: 455: for(a=0;a<Time;a++)
		CLRR 	64H 			//032A 	0164
		CLRR 	65H 			//032B 	0165
		LDR 	63H,0 			//032C 	0863
		SUBWR 	65H,0 			//032D 	0C65
		BTSS 	STATUS,2 		//032E 	1D03
		LJUMP 	332H 			//032F 	3B32
		LDR 	62H,0 			//0330 	0862
		SUBWR 	64H,0 			//0331 	0C64
		BTSC 	STATUS,0 		//0332 	1403
		RET		 					//0333 	0004

		//;rf-out-key.C: 456: {
		//;rf-out-key.C: 457: for(b=0;b<5;b++)
		CLRR 	66H 			//0334 	0166
		CLRR 	67H 			//0335 	0167

		//;rf-out-key.C: 458: {
		//;rf-out-key.C: 459: DelayUs(197);
		LDWI 	C5H 			//0336 	2AC5
		LCALL 	377H 			//0337 	3377
		INCR	66H,1 			//0338 	09E6
		BTSC 	STATUS,2 		//0339 	1503
		INCR	67H,1 			//033A 	09E7
		LDWI 	0H 			//033B 	2A00
		SUBWR 	67H,0 			//033C 	0C67
		LDWI 	5H 			//033D 	2A05
		BTSC 	STATUS,2 		//033E 	1503
		SUBWR 	66H,0 			//033F 	0C66
		BTSS 	STATUS,0 		//0340 	1C03
		LJUMP 	336H 			//0341 	3B36
		INCR	64H,1 			//0342 	09E4
		BTSC 	STATUS,2 		//0343 	1503
		INCR	65H,1 			//0344 	09E5
		LJUMP 	32CH 			//0345 	3B2C
		STR 	76H 			//0346 	01F6

		//;rf-out-key.C: 431: GIE = 0;
		BCR 	INTCON,7 		//0347 	138B

		//;rf-out-key.C: 432: while(GIE);
		BTSC 	INTCON,7 		//0348 	178B
		LJUMP 	348H 			//0349 	3B48

		//;rf-out-key.C: 433: EEADR = EEAddr;
		LDR 	76H,0 			//034A 	0876
		BSR 	STATUS,5 		//034B 	1A83
		STR 	1BH 			//034C 	019B

		//;rf-out-key.C: 434: EEDAT = Data;
		BCR 	STATUS,5 		//034D 	1283
		LDR 	60H,0 			//034E 	0860
		BSR 	STATUS,5 		//034F 	1A83
		STR 	1AH 			//0350 	019A

		//;rf-out-key.C: 435: EEIF = 0;
		BCR 	STATUS,5 		//0351 	1283
		BCR 	CH,7 			//0352 	138C

		//;rf-out-key.C: 436: EECON1 |= 0x34;
		LDWI 	34H 			//0353 	2A34
		BSR 	STATUS,5 		//0354 	1A83
		IORWR 	1CH,1 			//0355 	039C

		//;rf-out-key.C: 437: WR = 1;
		BSR 	1DH,0 			//0356 	181D

		//;rf-out-key.C: 438: while(WR);
		BTSC 	1DH,0 			//0357 	141D
		LJUMP 	357H 			//0358 	3B57

		//;rf-out-key.C: 439: GIE = 1;
		BSR 	INTCON,7 		//0359 	1B8B
		RET		 					//035A 	0004

		//;rf-out-key.C: 380: OSCCON = 0B01110000;
		LDWI 	70H 			//035B 	2A70
		BSR 	STATUS,5 		//035C 	1A83
		STR 	FH 			//035D 	018F

		//;rf-out-key.C: 382: INTCON = 0;
		CLRR 	INTCON 			//035E 	010B

		//;rf-out-key.C: 383: OPTION = 0B00001000;
		LDWI 	8H 			//035F 	2A08
		STR 	1H 			//0360 	0181

		//;rf-out-key.C: 385: PORTA = 0B00000100;
		LDWI 	4H 			//0361 	2A04
		BCR 	STATUS,5 		//0362 	1283
		STR 	5H 			//0363 	0185

		//;rf-out-key.C: 386: TRISA = 0B00001100;
		LDWI 	CH 			//0364 	2A0C
		BSR 	STATUS,5 		//0365 	1A83
		STR 	5H 			//0366 	0185

		//;rf-out-key.C: 388: WPUA = 0B00001100;
		STR 	15H 			//0367 	0195

		//;rf-out-key.C: 390: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//0368 	1283
		CLRR 	1BH 			//0369 	011B
		RET		 					//036A 	0004

		//;rf-out-key.C: 396: T2CON = 0B00000001;
		LDWI 	1H 			//036B 	2A01
		STR 	12H 			//036C 	0192

		//;rf-out-key.C: 397: TMR2 = 0;
		CLRR 	11H 			//036D 	0111

		//;rf-out-key.C: 398: PR2 = 50;
		LDWI 	32H 			//036E 	2A32
		BSR 	STATUS,5 		//036F 	1A83
		STR 	12H 			//0370 	0192

		//;rf-out-key.C: 399: TMR2IF = 0;
		BCR 	STATUS,5 		//0371 	1283
		BCR 	CH,1 			//0372 	108C

		//;rf-out-key.C: 401: TMR2ON = 1;
		BSR 	12H,2 			//0373 	1912

		//;rf-out-key.C: 402: PEIE=1;
		BSR 	INTCON,6 		//0374 	1B0B

		//;rf-out-key.C: 403: GIE = 1;
		BSR 	INTCON,7 		//0375 	1B8B
		RET		 					//0376 	0004
		STR 	60H 			//0377 	01E0

		//;rf-out-key.C: 444: unsigned char a;
		//;rf-out-key.C: 445: for(a=0;a<Time;a++)
		CLRR 	61H 			//0378 	0161
		LDR 	60H,0 			//0379 	0860
		SUBWR 	61H,0 			//037A 	0C61
		BTSC 	STATUS,0 		//037B 	1403
		RET		 					//037C 	0004

		//;rf-out-key.C: 446: {
		//;rf-out-key.C: 447: __nop();
		NOP		 					//037D 	0000
		CLRWDT	 			//037E 	0001
		BCR 	STATUS,5 		//037F 	1283
		INCR	61H,1 			//0380 	09E1
		LJUMP 	379H 			//0381 	3B79

		//;rf-out-key.C: 408: OPTION = 0B00000110;
		LDWI 	6H 			//0382 	2A06
		BSR 	STATUS,5 		//0383 	1A83
		STR 	1H 			//0384 	0181

		//;rf-out-key.C: 414: TMR0 = 239;
		LDWI 	EFH 			//0385 	2AEF
		BCR 	STATUS,5 		//0386 	1283
		STR 	1H 			//0387 	0181

		//;rf-out-key.C: 415: T0IF = 0;
		BCR 	INTCON,2 		//0388 	110B

		//;rf-out-key.C: 416: T0IE = 1;
		BSR 	INTCON,5 		//0389 	1A8B
		RET		 					//038A 	0004
		BCR 	STATUS,5 		//038B 	1283
		STR 	60H 			//038C 	01E0

		//;rf-out-key.C: 421: unsigned char ReEEPROMread;
		//;rf-out-key.C: 423: EEADR = EEAddr;
		BSR 	STATUS,5 		//038D 	1A83
		STR 	1BH 			//038E 	019B

		//;rf-out-key.C: 424: RD = 1;
		BSR 	1CH,0 			//038F 	181C

		//;rf-out-key.C: 425: ReEEPROMread = EEDAT;
		LDR 	1AH,0 			//0390 	081A
		BCR 	STATUS,5 		//0391 	1283
		STR 	61H 			//0392 	01E1

		//;rf-out-key.C: 426: return ReEEPROMread;
		RET		 					//0393 	0004
		CLRWDT	 			//0394 	0001
		CLRR 	INDF 			//0395 	0100
		INCR	FSR,1 			//0396 	0984
		XORWR 	FSR,0 			//0397 	0404
		BTSC 	STATUS,2 		//0398 	1503
		RETW 	0H 			//0399 	2100
		XORWR 	FSR,0 			//039A 	0404
		LJUMP 	395H 			//039B 	3B95
			END
