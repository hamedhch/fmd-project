//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_Set		EQU		78H
		_Counter		EQU		4AH
		_Counter_On		EQU		76H
		_Counter_On_set		EQU		74H
		_ir_count		EQU		70H
		_Puls_end		EQU		40H
		_ir_status		EQU		48H
		_up		EQU		46H
		_lockup		EQU		44H
//-----------------------Variable END---------------------------------

		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	7CH 			//0006 	01FC
		LDR 	PCLATH,0 		//0007 	080A
		STR 	7DH 			//0008 	01FD
		LJUMP 	16H 			//0009 	3816
		LJUMP 	0BH 			//000A 	380B
		LDWI 	70H 			//000B 	2A70
		STR 	FSR 			//000C 	0184
		LDWI 	7AH 			//000D 	2A7A
		LCALL 	151H 			//000E 	3151
		LDWI 	40H 			//000F 	2A40
		BCR 	STATUS,7 		//0010 	1383
		STR 	FSR 			//0011 	0184
		LDWI 	4CH 			//0012 	2A4C
		LCALL 	151H 			//0013 	3151
		CLRR 	STATUS 			//0014 	0103
		LJUMP 	159H 			//0015 	3959

		//;ir-remote-38k-tm0.C: 45: if(PAIE && PAIF)
		BTSC 	INTCON,3 		//0016 	158B
		BTSS 	INTCON,0 		//0017 	1C0B
		LJUMP 	47H 			//0018 	3847

		//;ir-remote-38k-tm0.C: 46: {
		//;ir-remote-38k-tm0.C: 47: ReadAPin = PORTA;
		BCR 	STATUS,5 		//0019 	1283
		LDR 	5H,0 			//001A 	0805

		//;ir-remote-38k-tm0.C: 50: Backup=Counter;
		BCR 	INTCON,0 		//001B 	100B

		//;ir-remote-38k-tm0.C: 52: Counter=0;
		CLRR 	4AH 			//001C 	014A
		CLRR 	4BH 			//001D 	014B

		//;ir-remote-38k-tm0.C: 68: if(Set==1){
		DECR 	78H,0 			//001E 	0D78
		IORWR 	79H,0 			//001F 	0379
		BTSS 	STATUS,2 		//0020 	1D03
		LJUMP 	36H 			//0021 	3836

		//;ir-remote-38k-tm0.C: 70: if(Counter_On>Counter_On_set){
		LDR 	77H,0 			//0022 	0877
		SUBWR 	75H,0 			//0023 	0C75
		BTSS 	STATUS,2 		//0024 	1D03
		LJUMP 	28H 			//0025 	3828
		LDR 	76H,0 			//0026 	0876
		SUBWR 	74H,0 			//0027 	0C74
		BTSC 	STATUS,0 		//0028 	1403
		LJUMP 	30H 			//0029 	3830

		//;ir-remote-38k-tm0.C: 71: Counter_On=Counter_On-1;
		LDWI 	FFH 			//002A 	2AFF
		ADDWR 	76H,1 			//002B 	0BF6
		BTSC 	STATUS,0 		//002C 	1403
		INCR	77H,1 			//002D 	09F7
		ADDWR 	77H,1 			//002E 	0BF7

		//;ir-remote-38k-tm0.C: 74: }else{
		LJUMP 	34H 			//002F 	3834

		//;ir-remote-38k-tm0.C: 75: Counter_On=Counter_On_set;
		LDR 	75H,0 			//0030 	0875
		STR 	77H 			//0031 	01F7
		LDR 	74H,0 			//0032 	0874
		STR 	76H 			//0033 	01F6

		//;ir-remote-38k-tm0.C: 72: PA2= 0;
		BCR 	5H,2 			//0034 	1105

		//;ir-remote-38k-tm0.C: 73: PA0= 0;
		BCR 	5H,0 			//0035 	1005

		//;ir-remote-38k-tm0.C: 78: }
		//;ir-remote-38k-tm0.C: 81: }
		//;ir-remote-38k-tm0.C: 83: if(Set==0)
		LDR 	78H,0 			//0036 	0878
		IORWR 	79H,0 			//0037 	0379
		BTSS 	STATUS,2 		//0038 	1D03
		LJUMP 	47H 			//0039 	3847

		//;ir-remote-38k-tm0.C: 84: {
		//;ir-remote-38k-tm0.C: 85: PA2=0;
		BCR 	5H,2 			//003A 	1105

		//;ir-remote-38k-tm0.C: 86: PA0=0;
		BCR 	5H,0 			//003B 	1005

		//;ir-remote-38k-tm0.C: 87: if(Counter_On<=160)
		LDWI 	0H 			//003C 	2A00
		SUBWR 	77H,0 			//003D 	0C77
		LDWI 	A1H 			//003E 	2AA1
		BTSC 	STATUS,2 		//003F 	1503
		SUBWR 	76H,0 			//0040 	0C76
		BTSC 	STATUS,0 		//0041 	1403
		LJUMP 	47H 			//0042 	3847

		//;ir-remote-38k-tm0.C: 88: {
		//;ir-remote-38k-tm0.C: 89: Counter_On=Counter_On+2;
		LDWI 	2H 			//0043 	2A02
		ADDWR 	76H,1 			//0044 	0BF6
		BTSC 	STATUS,0 		//0045 	1403
		INCR	77H,1 			//0046 	09F7

		//;ir-remote-38k-tm0.C: 90: }
		//;ir-remote-38k-tm0.C: 91: }
		//;ir-remote-38k-tm0.C: 95: }
		//;ir-remote-38k-tm0.C: 98: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//0047 	1A83
		BTSS 	CH,1 			//0048 	1C8C
		LJUMP 	12DH 			//0049 	392D
		BCR 	STATUS,5 		//004A 	1283
		BTSS 	CH,1 			//004B 	1C8C
		LJUMP 	12DH 			//004C 	392D

		//;ir-remote-38k-tm0.C: 99: {
		//;ir-remote-38k-tm0.C: 101: TMR2IF = 0;
		BCR 	CH,1 			//004D 	108C

		//;ir-remote-38k-tm0.C: 102: TMR2IE = 1;
		BSR 	STATUS,5 		//004E 	1A83
		BSR 	CH,1 			//004F 	188C

		//;ir-remote-38k-tm0.C: 104: if(ir_count!=0)Puls_off++,Puls_end++;
		LDR 	73H,0 			//0050 	0873
		IORWR 	72H,0 			//0051 	0372
		IORWR 	71H,0 			//0052 	0371
		IORWR 	70H,0 			//0053 	0370
		BCR 	STATUS,5 		//0054 	1283
		BTSC 	STATUS,2 		//0055 	1503
		LJUMP 	5FH 			//0056 	385F
		INCR	40H,1 			//0057 	09C0
		BTSC 	STATUS,2 		//0058 	1503
		INCR	41H,1 			//0059 	09C1
		BTSC 	STATUS,2 		//005A 	1503
		INCR	42H,1 			//005B 	09C2
		BTSC 	STATUS,2 		//005C 	1503
		INCR	43H,1 			//005D 	09C3

		//;ir-remote-38k-tm0.C: 105: if(Puls_end>5000){
		BCR 	STATUS,5 		//005E 	1283
		LDR 	43H,0 			//005F 	0843
		BTSS 	STATUS,2 		//0060 	1D03
		LJUMP 	6DH 			//0061 	386D
		LDR 	42H,0 			//0062 	0842
		BTSS 	STATUS,2 		//0063 	1D03
		LJUMP 	6DH 			//0064 	386D
		LDWI 	13H 			//0065 	2A13
		SUBWR 	41H,0 			//0066 	0C41
		BTSS 	STATUS,2 		//0067 	1D03
		LJUMP 	6BH 			//0068 	386B
		LDWI 	89H 			//0069 	2A89
		SUBWR 	40H,0 			//006A 	0C40
		BTSS 	STATUS,0 		//006B 	1C03
		LJUMP 	78H 			//006C 	3878

		//;ir-remote-38k-tm0.C: 107: Puls_end=0;
		CLRR 	40H 			//006D 	0140
		CLRR 	41H 			//006E 	0141
		CLRR 	42H 			//006F 	0142
		CLRR 	43H 			//0070 	0143

		//;ir-remote-38k-tm0.C: 108: ir_count=0;
		CLRR 	70H 			//0071 	0170
		CLRR 	71H 			//0072 	0171
		CLRR 	72H 			//0073 	0172
		CLRR 	73H 			//0074 	0173

		//;ir-remote-38k-tm0.C: 109: lockup=0;
		CLRR 	44H 			//0075 	0144
		CLRR 	45H 			//0076 	0145

		//;ir-remote-38k-tm0.C: 110: }
		//;ir-remote-38k-tm0.C: 112: if(ir_status != PA3){
		BCR 	STATUS,0 		//0077 	1003
		BTSC 	5H,3 			//0078 	1585
		BSR 	STATUS,0 		//0079 	1803
		LDWI 	0H 			//007A 	2A00
		BTSC 	STATUS,0 		//007B 	1403
		LDWI 	1H 			//007C 	2A01
		STR 	7AH 			//007D 	01FA
		CLRR 	7BH 			//007E 	017B
		LDR 	49H,0 			//007F 	0849
		XORWR 	7BH,0 			//0080 	047B
		BTSS 	STATUS,2 		//0081 	1D03
		LJUMP 	85H 			//0082 	3885
		LDR 	48H,0 			//0083 	0848
		XORWR 	7AH,0 			//0084 	047A
		BTSC 	STATUS,2 		//0085 	1503
		LJUMP 	E2H 			//0086 	38E2

		//;ir-remote-38k-tm0.C: 114: ir_status=PA3;
		BCR 	STATUS,0 		//0087 	1003
		BTSC 	5H,3 			//0088 	1585
		BSR 	STATUS,0 		//0089 	1803
		LDWI 	0H 			//008A 	2A00
		BTSC 	STATUS,0 		//008B 	1403
		LDWI 	1H 			//008C 	2A01
		STR 	48H 			//008D 	01C8
		CLRR 	49H 			//008E 	0149

		//;ir-remote-38k-tm0.C: 115: ir_count++;
		INCR	70H,1 			//008F 	09F0
		BTSC 	STATUS,2 		//0090 	1503
		INCR	71H,1 			//0091 	09F1
		BTSC 	STATUS,2 		//0092 	1503
		INCR	72H,1 			//0093 	09F2
		BTSC 	STATUS,2 		//0094 	1503
		INCR	73H,1 			//0095 	09F3

		//;ir-remote-38k-tm0.C: 116: Puls_end=0;
		CLRR 	40H 			//0096 	0140
		CLRR 	41H 			//0097 	0141
		CLRR 	42H 			//0098 	0142
		CLRR 	43H 			//0099 	0143

		//;ir-remote-38k-tm0.C: 118: if(ir_count>80 && lockup==0 && Set==1){
		LDR 	73H,0 			//009A 	0873
		BTSS 	STATUS,2 		//009B 	1D03
		LJUMP 	A7H 			//009C 	38A7
		LDR 	72H,0 			//009D 	0872
		BTSS 	STATUS,2 		//009E 	1D03
		LJUMP 	A7H 			//009F 	38A7
		LDR 	71H,0 			//00A0 	0871
		BTSS 	STATUS,2 		//00A1 	1D03
		LJUMP 	A7H 			//00A2 	38A7
		LDWI 	51H 			//00A3 	2A51
		SUBWR 	70H,0 			//00A4 	0C70
		BTSS 	STATUS,0 		//00A5 	1C03
		LJUMP 	B5H 			//00A6 	38B5
		LDR 	44H,0 			//00A7 	0844
		IORWR 	45H,0 			//00A8 	0345
		BTSS 	STATUS,2 		//00A9 	1D03
		LJUMP 	B5H 			//00AA 	38B5
		DECR 	78H,0 			//00AB 	0D78
		IORWR 	79H,0 			//00AC 	0379
		BTSS 	STATUS,2 		//00AD 	1D03
		LJUMP 	B5H 			//00AE 	38B5
		LDWI 	FFH 			//00AF 	2AFF

		//;ir-remote-38k-tm0.C: 119: lockup=1;
		CLRR 	44H 			//00B0 	0144
		INCR	44H,1 			//00B1 	09C4
		CLRR 	45H 			//00B2 	0145

		//;ir-remote-38k-tm0.C: 120: up=~up;
		XORWR 	46H,1 			//00B3 	04C6
		XORWR 	47H,1 			//00B4 	04C7

		//;ir-remote-38k-tm0.C: 121: }
		//;ir-remote-38k-tm0.C: 122: if(ir_count>80 && Set==1&& ir_status){
		LDR 	73H,0 			//00B5 	0873
		BTSS 	STATUS,2 		//00B6 	1D03
		LJUMP 	C2H 			//00B7 	38C2
		LDR 	72H,0 			//00B8 	0872
		BTSS 	STATUS,2 		//00B9 	1D03
		LJUMP 	C2H 			//00BA 	38C2
		LDR 	71H,0 			//00BB 	0871
		BTSS 	STATUS,2 		//00BC 	1D03
		LJUMP 	C2H 			//00BD 	38C2
		LDWI 	51H 			//00BE 	2A51
		SUBWR 	70H,0 			//00BF 	0C70
		BTSS 	STATUS,0 		//00C0 	1C03
		LJUMP 	E2H 			//00C1 	38E2
		DECR 	78H,0 			//00C2 	0D78
		IORWR 	79H,0 			//00C3 	0379
		BTSS 	STATUS,2 		//00C4 	1D03
		LJUMP 	E2H 			//00C5 	38E2
		LDR 	48H,0 			//00C6 	0848
		IORWR 	49H,0 			//00C7 	0349
		BTSC 	STATUS,2 		//00C8 	1503
		LJUMP 	E2H 			//00C9 	38E2

		//;ir-remote-38k-tm0.C: 123: if(up){
		LDR 	46H,0 			//00CA 	0846
		IORWR 	47H,0 			//00CB 	0347
		BTSC 	STATUS,2 		//00CC 	1503
		LJUMP 	D8H 			//00CD 	38D8

		//;ir-remote-38k-tm0.C: 124: if(Counter_On_set>0)Counter_On_set=Counter_On_set-1;
		LDR 	74H,0 			//00CE 	0874
		IORWR 	75H,0 			//00CF 	0375
		BTSC 	STATUS,2 		//00D0 	1503
		LJUMP 	E2H 			//00D1 	38E2
		LDWI 	FFH 			//00D2 	2AFF
		ADDWR 	74H,1 			//00D3 	0BF4
		BTSC 	STATUS,0 		//00D4 	1403
		INCR	75H,1 			//00D5 	09F5
		ADDWR 	75H,1 			//00D6 	0BF5
		LJUMP 	E2H 			//00D7 	38E2

		//;ir-remote-38k-tm0.C: 126: if(Counter_On_set<140)Counter_On_set=Counter_On_set+1;
		LDWI 	0H 			//00D8 	2A00
		SUBWR 	75H,0 			//00D9 	0C75
		LDWI 	8CH 			//00DA 	2A8C
		BTSC 	STATUS,2 		//00DB 	1503
		SUBWR 	74H,0 			//00DC 	0C74
		BTSC 	STATUS,0 		//00DD 	1403
		LJUMP 	E2H 			//00DE 	38E2
		INCR	74H,1 			//00DF 	09F4
		BTSC 	STATUS,2 		//00E0 	1503
		INCR	75H,1 			//00E1 	09F5

		//;ir-remote-38k-tm0.C: 127: }
		//;ir-remote-38k-tm0.C: 128: }
		//;ir-remote-38k-tm0.C: 129: }
		//;ir-remote-38k-tm0.C: 131: if(ir_count>60 && ir_count<80 && Puls_end>1700){
		LDR 	73H,0 			//00E2 	0873
		BTSS 	STATUS,2 		//00E3 	1D03
		LJUMP 	EFH 			//00E4 	38EF
		LDR 	72H,0 			//00E5 	0872
		BTSS 	STATUS,2 		//00E6 	1D03
		LJUMP 	EFH 			//00E7 	38EF
		LDR 	71H,0 			//00E8 	0871
		BTSS 	STATUS,2 		//00E9 	1D03
		LJUMP 	EFH 			//00EA 	38EF
		LDWI 	3DH 			//00EB 	2A3D
		SUBWR 	70H,0 			//00EC 	0C70
		BTSS 	STATUS,0 		//00ED 	1C03
		LJUMP 	120H 			//00EE 	3920
		LDR 	73H,0 			//00EF 	0873
		BTSS 	STATUS,2 		//00F0 	1D03
		LJUMP 	120H 			//00F1 	3920
		LDR 	72H,0 			//00F2 	0872
		BTSS 	STATUS,2 		//00F3 	1D03
		LJUMP 	120H 			//00F4 	3920
		LDR 	71H,0 			//00F5 	0871
		BTSS 	STATUS,2 		//00F6 	1D03
		LJUMP 	120H 			//00F7 	3920
		LDWI 	50H 			//00F8 	2A50
		SUBWR 	70H,0 			//00F9 	0C70
		BTSC 	STATUS,0 		//00FA 	1403
		LJUMP 	120H 			//00FB 	3920
		LDR 	43H,0 			//00FC 	0843
		BTSS 	STATUS,2 		//00FD 	1D03
		LJUMP 	10AH 			//00FE 	390A
		LDR 	42H,0 			//00FF 	0842
		BTSS 	STATUS,2 		//0100 	1D03
		LJUMP 	10AH 			//0101 	390A
		LDWI 	6H 			//0102 	2A06
		SUBWR 	41H,0 			//0103 	0C41
		BTSS 	STATUS,2 		//0104 	1D03
		LJUMP 	108H 			//0105 	3908
		LDWI 	A5H 			//0106 	2AA5
		SUBWR 	40H,0 			//0107 	0C40
		BTSS 	STATUS,0 		//0108 	1C03
		LJUMP 	120H 			//0109 	3920

		//;ir-remote-38k-tm0.C: 133: ir_count=0;
		CLRR 	70H 			//010A 	0170
		CLRR 	71H 			//010B 	0171
		CLRR 	72H 			//010C 	0172
		CLRR 	73H 			//010D 	0173

		//;ir-remote-38k-tm0.C: 134: Puls_end=0;
		CLRR 	40H 			//010E 	0140
		CLRR 	41H 			//010F 	0141
		CLRR 	42H 			//0110 	0142
		CLRR 	43H 			//0111 	0143

		//;ir-remote-38k-tm0.C: 136: Set++;
		INCR	78H,1 			//0112 	09F8
		BTSC 	STATUS,2 		//0113 	1503
		INCR	79H,1 			//0114 	09F9

		//;ir-remote-38k-tm0.C: 137: if(Set==1)
		DECR 	78H,0 			//0115 	0D78
		IORWR 	79H,0 			//0116 	0379
		BTSS 	STATUS,2 		//0117 	1D03
		LJUMP 	11CH 			//0118 	391C

		//;ir-remote-38k-tm0.C: 138: {
		//;ir-remote-38k-tm0.C: 139: PA4=1;
		BSR 	5H,4 			//0119 	1A05

		//;ir-remote-38k-tm0.C: 140: PA5=0;
		BCR 	5H,5 			//011A 	1285

		//;ir-remote-38k-tm0.C: 143: }
		LJUMP 	120H 			//011B 	3920

		//;ir-remote-38k-tm0.C: 144: else
		//;ir-remote-38k-tm0.C: 145: {
		//;ir-remote-38k-tm0.C: 146: PA4=0;
		BCR 	5H,4 			//011C 	1205

		//;ir-remote-38k-tm0.C: 147: PA5=1;
		BSR 	5H,5 			//011D 	1A85

		//;ir-remote-38k-tm0.C: 149: Set=0;
		CLRR 	78H 			//011E 	0178
		CLRR 	79H 			//011F 	0179

		//;ir-remote-38k-tm0.C: 151: }
		//;ir-remote-38k-tm0.C: 152: }
		//;ir-remote-38k-tm0.C: 158: Counter++;
		INCR	4AH,1 			//0120 	09CA
		BTSC 	STATUS,2 		//0121 	1503
		INCR	4BH,1 			//0122 	09CB

		//;ir-remote-38k-tm0.C: 160: if(Counter>=Counter_On)
		LDR 	77H,0 			//0123 	0877
		SUBWR 	4BH,0 			//0124 	0C4B
		BTSS 	STATUS,2 		//0125 	1D03
		LJUMP 	129H 			//0126 	3929
		LDR 	76H,0 			//0127 	0876
		SUBWR 	4AH,0 			//0128 	0C4A
		BTSS 	STATUS,0 		//0129 	1C03
		LJUMP 	12DH 			//012A 	392D

		//;ir-remote-38k-tm0.C: 161: {
		//;ir-remote-38k-tm0.C: 162: PA2=1;
		BSR 	5H,2 			//012B 	1905

		//;ir-remote-38k-tm0.C: 163: PA0=1;
		BSR 	5H,0 			//012C 	1805
		LDR 	7DH,0 			//012D 	087D
		STR 	PCLATH 			//012E 	018A
		SWAPR 	7CH,0 			//012F 	077C
		STR 	STATUS 			//0130 	0183
		SWAPR 	7EH,1 			//0131 	07FE
		SWAPR 	7EH,0 			//0132 	077E
		RETI		 			//0133 	0009

		//;ir-remote-38k-tm0.C: 212: OSCCON = 0B01110001;
		LDWI 	71H 			//0134 	2A71
		BSR 	STATUS,5 		//0135 	1A83
		STR 	FH 			//0136 	018F

		//;ir-remote-38k-tm0.C: 214: INTCON = 0;
		CLRR 	INTCON 			//0137 	010B

		//;ir-remote-38k-tm0.C: 215: OPTION = 0B00001000;
		LDWI 	8H 			//0138 	2A08
		STR 	1H 			//0139 	0181

		//;ir-remote-38k-tm0.C: 217: PORTA = 0B00100000;
		LDWI 	20H 			//013A 	2A20
		BCR 	STATUS,5 		//013B 	1283
		STR 	5H 			//013C 	0185

		//;ir-remote-38k-tm0.C: 218: TRISA = 0B00001010;
		LDWI 	AH 			//013D 	2A0A
		BSR 	STATUS,5 		//013E 	1A83
		STR 	5H 			//013F 	0185

		//;ir-remote-38k-tm0.C: 220: WPUA = 0B00000000;
		CLRR 	15H 			//0140 	0115

		//;ir-remote-38k-tm0.C: 222: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//0141 	1283
		CLRR 	1BH 			//0142 	011B
		RET		 					//0143 	0004

		//;ir-remote-38k-tm0.C: 240: T2CON = 0B00000001;
		LDWI 	1H 			//0144 	2A01
		BCR 	STATUS,5 		//0145 	1283
		STR 	12H 			//0146 	0192

		//;ir-remote-38k-tm0.C: 245: TMR2 = 0;
		CLRR 	11H 			//0147 	0111

		//;ir-remote-38k-tm0.C: 246: PR2 = 63;
		LDWI 	3FH 			//0148 	2A3F
		BSR 	STATUS,5 		//0149 	1A83
		STR 	12H 			//014A 	0192

		//;ir-remote-38k-tm0.C: 247: TMR2IF = 0;
		BCR 	STATUS,5 		//014B 	1283
		BCR 	CH,1 			//014C 	108C

		//;ir-remote-38k-tm0.C: 249: TMR2ON = 1;
		BSR 	12H,2 			//014D 	1912

		//;ir-remote-38k-tm0.C: 250: PEIE=1;
		BSR 	INTCON,6 		//014E 	1B0B

		//;ir-remote-38k-tm0.C: 251: GIE = 1;
		BSR 	INTCON,7 		//014F 	1B8B
		RET		 					//0150 	0004
		CLRWDT	 			//0151 	0001
		CLRR 	INDF 			//0152 	0100
		INCR	FSR,1 			//0153 	0984
		XORWR 	FSR,0 			//0154 	0404
		BTSC 	STATUS,2 		//0155 	1503
		RETW 	0H 			//0156 	2100
		XORWR 	FSR,0 			//0157 	0404
		LJUMP 	152H 			//0158 	3952

		//;ir-remote-38k-tm0.C: 259: POWER_INITIAL();
		LCALL 	134H 			//0159 	3134

		//;ir-remote-38k-tm0.C: 261: PA1_Level_Change_INITIAL();
		LCALL 	161H 			//015A 	3161

		//;ir-remote-38k-tm0.C: 262: TIMER2_INITIAL();
		LCALL 	144H 			//015B 	3144

		//;ir-remote-38k-tm0.C: 264: GIE = 1;
		BSR 	INTCON,7 		//015C 	1B8B

		//;ir-remote-38k-tm0.C: 266: PAIE =1;
		BSR 	INTCON,3 		//015D 	198B

		//;ir-remote-38k-tm0.C: 267: TMR2IE = 1;
		BSR 	STATUS,5 		//015E 	1A83
		BSR 	CH,1 			//015F 	188C

		//;ir-remote-38k-tm0.C: 269: while(1)
		//;ir-remote-38k-tm0.C: 270: {
		LJUMP 	160H 			//0160 	3960

		//;ir-remote-38k-tm0.C: 230: TRISA1 =1;
		BSR 	STATUS,5 		//0161 	1A83
		BSR 	5H,1 			//0162 	1885

		//;ir-remote-38k-tm0.C: 231: ReadAPin = PORTA;
		BCR 	STATUS,5 		//0163 	1283
		LDR 	5H,0 			//0164 	0805

		//;ir-remote-38k-tm0.C: 232: PAIF =0;
		BCR 	INTCON,0 		//0165 	100B

		//;ir-remote-38k-tm0.C: 233: IOCA1 =1;
		BSR 	STATUS,5 		//0166 	1A83
		BSR 	16H,1 			//0167 	1896
		RET		 					//0168 	0004
			END
