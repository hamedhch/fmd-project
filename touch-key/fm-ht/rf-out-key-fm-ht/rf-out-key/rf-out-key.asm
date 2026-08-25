//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_rx_state		EQU		56H
		_pulse_counter		EQU		55H
		_high_counter		EQU		54H
		_payload_val		EQU		53H
		_RxBusy		EQU		52H
		_frame_ready		EQU		51H
		_conternotRF		EQU		49H
		_Timedown		EQU		79H
		_Data		EQU		46H
		_DataM		EQU		43H
		_RFData		EQU		40H
		_eerom		EQU		50H
		_lastKey		EQU		4FH
		_LernRFKey		EQU		4EH
		_Count		EQU		4DH
		_Buffer		EQU		4CH
		_Bit		EQU		4BH
		_O1		EQU		71H
		_O2		EQU		71H
		_O3		EQU		70H
		_O4		EQU		70H
		_Start		EQU		70H
		_state1		EQU		78H
		_state2		EQU		78H
		_state3		EQU		78H
		_state4		EQU		78H
		_LernRFblink		EQU		70H
		_LernRF		EQU		70H
		_Frist		EQU		70H
		_Finish		EQU		70H
		_Lock		EQU		70H
//		Process_Touch_Payload@val		EQU		76H
//		Learn_Current_Remote@key_num		EQU		64H
//		Learn_Current_Remote@current_ptr		EQU		63H
//		Learn_Current_Remote@r		EQU		62H
//		Learn_Current_Remote@target_addr		EQU		61H
//		Learn_Current_Remote@base_addr		EQU		60H
//		Learn_Current_Remote@k_idx		EQU		5FH
//		Learn_Current_Remote@fifo_ptr_addr		EQU		5EH
//		Learn_Current_Remote@key_num		EQU		64H
//		Learn_Current_Remote@key_num		EQU		64H
//		EEPROMwrite@EEAddr		EQU		77H
//		EEPROMwrite@EEAddr		EQU		77H
//		EEPROMwrite@Data		EQU		76H
//		EEPROMwrite@EEAddr		EQU		77H
//		DelayMs@b		EQU		5BH
//		DelayMs@a		EQU		59H
//		DelayMs@Time		EQU		57H
//		DelayUs@Time		EQU		76H
//		DelayUs@a		EQU		77H
//		DelayUs@Time		EQU		76H
//		DelayUs@Time		EQU		76H
//		Check_RF_Match@k		EQU		5BH
//		Check_RF_Match@r		EQU		5AH
//		Check_RF_Match@base_addr		EQU		59H
//		___bmul@multiplier		EQU		58H
//		___bmul@product		EQU		57H
//		___bmul@multiplier		EQU		58H
//		___bmul@multiplicand		EQU		76H
//		___bmul@multiplier		EQU		58H
//		EEPROMread@EEAddr		EQU		76H
//		EEPROMread@EEAddr		EQU		76H
//		EEPROMread@EEAddr		EQU		76H
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
		LJUMP 	129H 			//000B 	3929
		LJUMP 	0DH 			//000C 	380D
		LDWI 	40H 			//000D 	2A40
		CLRR 	70H 			//000E 	0170
		CLRR 	71H 			//000F 	0171
		CLRR 	79H 			//0010 	0179
		BCR 	STATUS,7 		//0011 	1383
		STR 	FSR 			//0012 	0184
		LDWI 	57H 			//0013 	2A57
		LCALL 	3D7H 			//0014 	33D7
		CLRR 	STATUS 			//0015 	0103
		LJUMP 	17H 			//0016 	3817

		//;rf-out-key.C: 434: POWER_INITIAL();
		LCALL 	39AH 			//0017 	339A

		//;rf-out-key.C: 435: TIMER2_INITIAL();
		LCALL 	3B8H 			//0018 	33B8

		//;rf-out-key.C: 436: TIMER0_INITIAL();
		LCALL 	3CEH 			//0019 	33CE

		//;rf-out-key.C: 437: TMR2IE = 1;
		BSR 	STATUS,5 		//001A 	1A83
		BSR 	CH,1 			//001B 	188C

		//;rf-out-key.C: 439: Finish = 0;
		BCR 	70H,1 			//001C 	10F0

		//;rf-out-key.C: 440: Start = 0;
		BCR 	70H,5 			//001D 	12F0

		//;rf-out-key.C: 443: state1 = EEPROMread(70);
		LDWI 	46H 			//001E 	2A46
		LCALL 	3DFH 			//001F 	33DF
		BCR 	STATUS,5 		//0020 	1283
		STR 	65H 			//0021 	01E5
		RRR	65H,0 			//0022 	0665
		BTSS 	STATUS,0 		//0023 	1C03
		LJUMP 	27H 			//0024 	3827
		BSR 	78H,3 			//0025 	19F8
		LJUMP 	28H 			//0026 	3828
		BCR 	78H,3 			//0027 	11F8

		//;rf-out-key.C: 444: state2 = EEPROMread(71);
		LDWI 	47H 			//0028 	2A47
		LCALL 	3DFH 			//0029 	33DF
		BCR 	STATUS,5 		//002A 	1283
		STR 	65H 			//002B 	01E5
		RRR	65H,0 			//002C 	0665
		BTSS 	STATUS,0 		//002D 	1C03
		LJUMP 	31H 			//002E 	3831
		BSR 	78H,2 			//002F 	1978
		LJUMP 	32H 			//0030 	3832
		BCR 	78H,2 			//0031 	1178

		//;rf-out-key.C: 445: state3 = EEPROMread(72);
		LDWI 	48H 			//0032 	2A48
		LCALL 	3DFH 			//0033 	33DF
		BCR 	STATUS,5 		//0034 	1283
		STR 	65H 			//0035 	01E5
		RRR	65H,0 			//0036 	0665
		BTSS 	STATUS,0 		//0037 	1C03
		LJUMP 	3BH 			//0038 	383B
		BSR 	78H,1 			//0039 	18F8
		LJUMP 	3CH 			//003A 	383C
		BCR 	78H,1 			//003B 	10F8

		//;rf-out-key.C: 446: state4 = EEPROMread(73);
		LDWI 	49H 			//003C 	2A49
		LCALL 	3DFH 			//003D 	33DF
		BCR 	STATUS,5 		//003E 	1283
		STR 	65H 			//003F 	01E5
		RRR	65H,0 			//0040 	0665
		BTSS 	STATUS,0 		//0041 	1C03
		LJUMP 	45H 			//0042 	3845
		BSR 	78H,0 			//0043 	1878
		LJUMP 	46H 			//0044 	3846
		BCR 	78H,0 			//0045 	1078

		//;rf-out-key.C: 448: PA5 = state1;
		BTSS 	78H,3 			//0046 	1DF8
		LJUMP 	4BH 			//0047 	384B
		BCR 	STATUS,5 		//0048 	1283
		BSR 	5H,5 			//0049 	1A85
		LJUMP 	4DH 			//004A 	384D
		BCR 	STATUS,5 		//004B 	1283
		BCR 	5H,5 			//004C 	1285

		//;rf-out-key.C: 449: PA1 = state2;
		BTSS 	78H,2 			//004D 	1D78
		LJUMP 	52H 			//004E 	3852
		BCR 	STATUS,5 		//004F 	1283
		BSR 	5H,1 			//0050 	1885
		LJUMP 	54H 			//0051 	3854
		BCR 	STATUS,5 		//0052 	1283
		BCR 	5H,1 			//0053 	1085

		//;rf-out-key.C: 450: PA0 = state3;
		BTSS 	78H,1 			//0054 	1CF8
		LJUMP 	59H 			//0055 	3859
		BCR 	STATUS,5 		//0056 	1283
		BSR 	5H,0 			//0057 	1805
		LJUMP 	5BH 			//0058 	385B
		BCR 	STATUS,5 		//0059 	1283
		BCR 	5H,0 			//005A 	1005

		//;rf-out-key.C: 451: PA4 = state4;
		BTSS 	78H,0 			//005B 	1C78
		LJUMP 	60H 			//005C 	3860
		BCR 	STATUS,5 		//005D 	1283
		BSR 	5H,4 			//005E 	1A05
		LJUMP 	62H 			//005F 	3862
		BCR 	STATUS,5 		//0060 	1283
		BCR 	5H,4 			//0061 	1205

		//;rf-out-key.C: 453: while(1)
		CLRWDT	 			//0062 	0001

		//;rf-out-key.C: 458: if(frame_ready == 1)
		BCR 	STATUS,5 		//0063 	1283
		DECRSZ 	51H,0 		//0064 	0E51
		LJUMP 	68H 			//0065 	3868

		//;rf-out-key.C: 459: {
		//;rf-out-key.C: 460: frame_ready = 0;
		CLRR 	51H 			//0066 	0151

		//;rf-out-key.C: 461: Process_Touch_Payload();
		LCALL 	2B3H 			//0067 	32B3

		//;rf-out-key.C: 462: }
		//;rf-out-key.C: 466: if(Lock == 1)
		BTSS 	70H,0 			//0068 	1C70
		LJUMP 	78H 			//0069 	3878

		//;rf-out-key.C: 467: {
		//;rf-out-key.C: 468: Lock = 0;
		BCR 	70H,0 			//006A 	1070

		//;rf-out-key.C: 470: if(LernRF == 1)
		BTSS 	70H,3 			//006B 	1DF0
		LJUMP 	77H 			//006C 	3877

		//;rf-out-key.C: 471: {
		//;rf-out-key.C: 472: if((LernRFKey >= 1) && (LernRFKey <= 4))
		LDR 	4EH,0 			//006D 	084E
		BTSC 	STATUS,2 		//006E 	1503
		LJUMP 	78H 			//006F 	3878
		LDWI 	5H 			//0070 	2A05
		SUBWR 	4EH,0 			//0071 	0C4E
		BTSC 	STATUS,0 		//0072 	1403
		LJUMP 	78H 			//0073 	3878

		//;rf-out-key.C: 473: {
		//;rf-out-key.C: 474: Learn_Current_Remote(LernRFKey);
		LDR 	4EH,0 			//0074 	084E
		LCALL 	213H 			//0075 	3213
		LJUMP 	78H 			//0076 	3878

		//;rf-out-key.C: 477: else
		//;rf-out-key.C: 478: {
		//;rf-out-key.C: 479: Check_RF_Match();
		LCALL 	32CH 			//0077 	332C

		//;rf-out-key.C: 480: }
		//;rf-out-key.C: 481: }
		//;rf-out-key.C: 486: if(O1 == 1) { O1 = 0; state1 = !state1; eerom = 1; PA5 = state1; las
		//+                          tKey = 1; }
		BTSS 	71H,1 			//0078 	1CF1
		LJUMP 	88H 			//0079 	3888
		BCR 	71H,1 			//007A 	10F1
		LDWI 	8H 			//007B 	2A08
		XORWR 	78H,1 			//007C 	04F8
		LDWI 	1H 			//007D 	2A01
		STR 	50H 			//007E 	01D0
		BTSS 	78H,3 			//007F 	1DF8
		LJUMP 	84H 			//0080 	3884
		BCR 	STATUS,5 		//0081 	1283
		BSR 	5H,5 			//0082 	1A85
		LJUMP 	86H 			//0083 	3886
		BCR 	STATUS,5 		//0084 	1283
		BCR 	5H,5 			//0085 	1285
		LDWI 	1H 			//0086 	2A01
		STR 	4FH 			//0087 	01CF

		//;rf-out-key.C: 487: if(O2 == 1) { O2 = 0; state2 = !state2; eerom = 2; PA1 = state2; las
		//+                          tKey = 2; }
		BTSS 	71H,0 			//0088 	1C71
		LJUMP 	98H 			//0089 	3898
		BCR 	71H,0 			//008A 	1071
		LDWI 	4H 			//008B 	2A04
		XORWR 	78H,1 			//008C 	04F8
		LDWI 	2H 			//008D 	2A02
		STR 	50H 			//008E 	01D0
		BTSS 	78H,2 			//008F 	1D78
		LJUMP 	94H 			//0090 	3894
		BCR 	STATUS,5 		//0091 	1283
		BSR 	5H,1 			//0092 	1885
		LJUMP 	96H 			//0093 	3896
		BCR 	STATUS,5 		//0094 	1283
		BCR 	5H,1 			//0095 	1085
		LDWI 	2H 			//0096 	2A02
		STR 	4FH 			//0097 	01CF

		//;rf-out-key.C: 488: if(O3 == 1) { O3 = 0; state3 = !state3; eerom = 3; PA0 = state3; las
		//+                          tKey = 3; }
		BTSS 	70H,7 			//0098 	1FF0
		LJUMP 	A8H 			//0099 	38A8
		BCR 	70H,7 			//009A 	13F0
		LDWI 	2H 			//009B 	2A02
		XORWR 	78H,1 			//009C 	04F8
		LDWI 	3H 			//009D 	2A03
		STR 	50H 			//009E 	01D0
		BTSS 	78H,1 			//009F 	1CF8
		LJUMP 	A4H 			//00A0 	38A4
		BCR 	STATUS,5 		//00A1 	1283
		BSR 	5H,0 			//00A2 	1805
		LJUMP 	A6H 			//00A3 	38A6
		BCR 	STATUS,5 		//00A4 	1283
		BCR 	5H,0 			//00A5 	1005
		LDWI 	3H 			//00A6 	2A03
		STR 	4FH 			//00A7 	01CF

		//;rf-out-key.C: 489: if(O4 == 1) { O4 = 0; state4 = !state4; eerom = 4; PA4 = state4; las
		//+                          tKey = 4; }
		BTSS 	70H,6 			//00A8 	1F70
		LJUMP 	B8H 			//00A9 	38B8
		BCR 	70H,6 			//00AA 	1370
		LDWI 	1H 			//00AB 	2A01
		XORWR 	78H,1 			//00AC 	04F8
		LDWI 	4H 			//00AD 	2A04
		STR 	50H 			//00AE 	01D0
		BTSS 	78H,0 			//00AF 	1C78
		LJUMP 	B4H 			//00B0 	38B4
		BCR 	STATUS,5 		//00B1 	1283
		BSR 	5H,4 			//00B2 	1A05
		LJUMP 	B6H 			//00B3 	38B6
		BCR 	STATUS,5 		//00B4 	1283
		BCR 	5H,4 			//00B5 	1205
		LDWI 	4H 			//00B6 	2A04
		STR 	4FH 			//00B7 	01CF

		//;rf-out-key.C: 492: if(eerom != 0)
		LDR 	50H,0 			//00B8 	0850
		BTSC 	STATUS,2 		//00B9 	1503
		LJUMP 	E4H 			//00BA 	38E4

		//;rf-out-key.C: 493: {
		//;rf-out-key.C: 494: if(eerom == 1) EEPROMwrite(70, state1);
		DECR 	50H,0 			//00BB 	0D50
		BTSS 	STATUS,2 		//00BC 	1D03
		LJUMP 	C4H 			//00BD 	38C4
		LDWI 	0H 			//00BE 	2A00
		BTSC 	78H,3 			//00BF 	15F8
		LDWI 	1H 			//00C0 	2A01
		STR 	76H 			//00C1 	01F6
		LDWI 	46H 			//00C2 	2A46
		LJUMP 	E1H 			//00C3 	38E1

		//;rf-out-key.C: 495: else if(eerom == 2) EEPROMwrite(71, state2);
		LDWI 	2H 			//00C4 	2A02
		XORWR 	50H,0 			//00C5 	0450
		BTSS 	STATUS,2 		//00C6 	1D03
		LJUMP 	CEH 			//00C7 	38CE
		LDWI 	0H 			//00C8 	2A00
		BTSC 	78H,2 			//00C9 	1578
		LDWI 	1H 			//00CA 	2A01
		STR 	76H 			//00CB 	01F6
		LDWI 	47H 			//00CC 	2A47
		LJUMP 	E1H 			//00CD 	38E1

		//;rf-out-key.C: 496: else if(eerom == 3) EEPROMwrite(72, state3);
		LDWI 	3H 			//00CE 	2A03
		XORWR 	50H,0 			//00CF 	0450
		BTSS 	STATUS,2 		//00D0 	1D03
		LJUMP 	D8H 			//00D1 	38D8
		LDWI 	0H 			//00D2 	2A00
		BTSC 	78H,1 			//00D3 	14F8
		LDWI 	1H 			//00D4 	2A01
		STR 	76H 			//00D5 	01F6
		LDWI 	48H 			//00D6 	2A48
		LJUMP 	E1H 			//00D7 	38E1

		//;rf-out-key.C: 497: else if(eerom == 4) EEPROMwrite(73, state4);
		LDWI 	4H 			//00D8 	2A04
		XORWR 	50H,0 			//00D9 	0450
		BTSS 	STATUS,2 		//00DA 	1D03
		LJUMP 	E2H 			//00DB 	38E2
		LDWI 	0H 			//00DC 	2A00
		BTSC 	78H,0 			//00DD 	1478
		LDWI 	1H 			//00DE 	2A01
		STR 	76H 			//00DF 	01F6
		LDWI 	49H 			//00E0 	2A49
		LCALL 	387H 			//00E1 	3387

		//;rf-out-key.C: 498: eerom = 0;
		BCR 	STATUS,5 		//00E2 	1283
		CLRR 	50H 			//00E3 	0150

		//;rf-out-key.C: 499: }
		//;rf-out-key.C: 502: if(LernRFblink==1){
		BTSS 	70H,4 			//00E4 	1E70
		LJUMP 	62H 			//00E5 	3862

		//;rf-out-key.C: 504: if(lastKey==1) DelayMs(200) ,PA5=!PA5 , DelayMs(200) , PA5=!PA5 , Le
		//+                          rnRFKey=1;
		DECRSZ 	4FH,0 		//00E6 	0E4F
		LJUMP 	F3H 			//00E7 	38F3
		LDWI 	C8H 			//00E8 	2AC8
		STR 	57H 			//00E9 	01D7
		CLRR 	58H 			//00EA 	0158
		LCALL 	36AH 			//00EB 	336A
		LDWI 	20H 			//00EC 	2A20
		LCALL 	124H 			//00ED 	3124
		LCALL 	36AH 			//00EE 	336A
		LDWI 	20H 			//00EF 	2A20
		XORWR 	5H,1 			//00F0 	0485
		LDWI 	1H 			//00F1 	2A01
		STR 	4EH 			//00F2 	01CE

		//;rf-out-key.C: 505: if(lastKey==2) DelayMs(200) ,PA1=!PA1 , DelayMs(200) , PA1=!PA1 , Le
		//+                          rnRFKey=2 ;
		LDWI 	2H 			//00F3 	2A02
		XORWR 	4FH,0 			//00F4 	044F
		BTSS 	STATUS,2 		//00F5 	1D03
		LJUMP 	101H 			//00F6 	3901
		LDWI 	C8H 			//00F7 	2AC8
		STR 	57H 			//00F8 	01D7
		CLRR 	58H 			//00F9 	0158
		LCALL 	36AH 			//00FA 	336A
		LDWI 	2H 			//00FB 	2A02
		LCALL 	124H 			//00FC 	3124
		LCALL 	36AH 			//00FD 	336A
		LDWI 	2H 			//00FE 	2A02
		XORWR 	5H,1 			//00FF 	0485
		STR 	4EH 			//0100 	01CE

		//;rf-out-key.C: 506: if(lastKey==3) DelayMs(200) ,PA0=!PA0 , DelayMs(200) , PA0=!PA0 , Le
		//+                          rnRFKey=3 ;
		LDWI 	3H 			//0101 	2A03
		XORWR 	4FH,0 			//0102 	044F
		BTSS 	STATUS,2 		//0103 	1D03
		LJUMP 	110H 			//0104 	3910
		LDWI 	C8H 			//0105 	2AC8
		STR 	57H 			//0106 	01D7
		CLRR 	58H 			//0107 	0158
		LCALL 	36AH 			//0108 	336A
		LDWI 	1H 			//0109 	2A01
		LCALL 	124H 			//010A 	3124
		LCALL 	36AH 			//010B 	336A
		LDWI 	1H 			//010C 	2A01
		XORWR 	5H,1 			//010D 	0485
		LDWI 	3H 			//010E 	2A03
		STR 	4EH 			//010F 	01CE

		//;rf-out-key.C: 507: if(lastKey==4) DelayMs(200) ,PA4=!PA4 , DelayMs(200) , PA4=!PA4 , Le
		//+                          rnRFKey=4 ;
		LDWI 	4H 			//0110 	2A04
		XORWR 	4FH,0 			//0111 	044F
		BTSS 	STATUS,2 		//0112 	1D03
		LJUMP 	11FH 			//0113 	391F
		LDWI 	C8H 			//0114 	2AC8
		STR 	57H 			//0115 	01D7
		CLRR 	58H 			//0116 	0158
		LCALL 	36AH 			//0117 	336A
		LDWI 	10H 			//0118 	2A10
		LCALL 	124H 			//0119 	3124
		LCALL 	36AH 			//011A 	336A
		LDWI 	10H 			//011B 	2A10
		XORWR 	5H,1 			//011C 	0485
		LDWI 	4H 			//011D 	2A04
		STR 	4EH 			//011E 	01CE

		//;rf-out-key.C: 509: LernRFblink=0;
		BCR 	70H,4 			//011F 	1270

		//;rf-out-key.C: 510: conternotRF=0;
		CLRR 	49H 			//0120 	0149
		CLRR 	4AH 			//0121 	014A

		//;rf-out-key.C: 511: LernRF=1;
		BSR 	70H,3 			//0122 	19F0
		LJUMP 	62H 			//0123 	3862
		XORWR 	5H,1 			//0124 	0485
		LDWI 	C8H 			//0125 	2AC8
		STR 	57H 			//0126 	01D7
		CLRR 	58H 			//0127 	0158
		RET		 					//0128 	0004

		//;rf-out-key.C: 82: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//0129 	168B
		BTSS 	INTCON,2 		//012A 	1D0B
		LJUMP 	189H 			//012B 	3989

		//;rf-out-key.C: 83: {
		//;rf-out-key.C: 84: TMR0 = 239;
		LDWI 	EFH 			//012C 	2AEF
		BCR 	STATUS,5 		//012D 	1283
		STR 	1H 			//012E 	0181

		//;rf-out-key.C: 85: T0IF = 0;
		BCR 	INTCON,2 		//012F 	110B

		//;rf-out-key.C: 87: if(LernRF == 1)
		BTSS 	70H,3 			//0130 	1DF0
		LJUMP 	140H 			//0131 	3940

		//;rf-out-key.C: 88: {
		//;rf-out-key.C: 89: conternotRF++;
		INCR	49H,1 			//0132 	09C9
		BTSC 	STATUS,2 		//0133 	1503
		INCR	4AH,1 			//0134 	09CA

		//;rf-out-key.C: 90: if(conternotRF >= 15000)
		LDWI 	3AH 			//0135 	2A3A
		SUBWR 	4AH,0 			//0136 	0C4A
		LDWI 	98H 			//0137 	2A98
		BTSC 	STATUS,2 		//0138 	1503
		SUBWR 	49H,0 			//0139 	0C49
		BTSS 	STATUS,0 		//013A 	1C03
		LJUMP 	140H 			//013B 	3940

		//;rf-out-key.C: 91: {
		//;rf-out-key.C: 92: conternotRF = 0;
		CLRR 	49H 			//013C 	0149
		CLRR 	4AH 			//013D 	014A

		//;rf-out-key.C: 93: LernRF = 0;
		BCR 	70H,3 			//013E 	11F0

		//;rf-out-key.C: 94: LernRFKey = 0;
		CLRR 	4EH 			//013F 	014E

		//;rf-out-key.C: 95: }
		//;rf-out-key.C: 96: }
		//;rf-out-key.C: 99: if(PA2 == 0)
		BTSC 	5H,2 			//0140 	1505
		LJUMP 	14EH 			//0141 	394E

		//;rf-out-key.C: 100: {
		//;rf-out-key.C: 101: high_counter = 0;
		CLRR 	54H 			//0142 	0154

		//;rf-out-key.C: 102: if(pulse_counter < 250) pulse_counter++;
		LDWI 	FAH 			//0143 	2AFA
		SUBWR 	55H,0 			//0144 	0C55
		BTSS 	STATUS,0 		//0145 	1C03
		INCR	55H,1 			//0146 	09D5

		//;rf-out-key.C: 104: if(rx_state == 1)
		DECRSZ 	56H,0 		//0147 	0E56
		LJUMP 	180H 			//0148 	3980

		//;rf-out-key.C: 105: {
		//;rf-out-key.C: 106: rx_state = 2;
		LDWI 	2H 			//0149 	2A02
		STR 	56H 			//014A 	01D6

		//;rf-out-key.C: 107: pulse_counter = 1;
		LDWI 	1H 			//014B 	2A01
		STR 	55H 			//014C 	01D5
		LJUMP 	180H 			//014D 	3980

		//;rf-out-key.C: 110: else
		//;rf-out-key.C: 111: {
		//;rf-out-key.C: 112: if(high_counter < 250) high_counter++;
		LDWI 	FAH 			//014E 	2AFA
		SUBWR 	54H,0 			//014F 	0C54
		BTSS 	STATUS,0 		//0150 	1C03
		INCR	54H,1 			//0151 	09D4

		//;rf-out-key.C: 114: if(rx_state == 0)
		LDR 	56H,0 			//0152 	0856
		BTSS 	STATUS,2 		//0153 	1D03
		LJUMP 	160H 			//0154 	3960

		//;rf-out-key.C: 115: {
		//;rf-out-key.C: 116: if(pulse_counter >= 20 && pulse_counter <= 30)
		LDWI 	14H 			//0155 	2A14
		SUBWR 	55H,0 			//0156 	0C55
		BTSS 	STATUS,0 		//0157 	1C03
		LJUMP 	167H 			//0158 	3967
		LDWI 	1FH 			//0159 	2A1F
		SUBWR 	55H,0 			//015A 	0C55
		BTSC 	STATUS,0 		//015B 	1403
		LJUMP 	167H 			//015C 	3967

		//;rf-out-key.C: 117: {
		//;rf-out-key.C: 118: rx_state = 1;
		LDWI 	1H 			//015D 	2A01
		STR 	56H 			//015E 	01D6
		LJUMP 	167H 			//015F 	3967

		//;rf-out-key.C: 121: }
		//;rf-out-key.C: 119: }
		//;rf-out-key.C: 120: pulse_counter = 0;
		//;rf-out-key.C: 122: else if(rx_state == 1)
		DECRSZ 	56H,0 		//0160 	0E56
		LJUMP 	169H 			//0161 	3969

		//;rf-out-key.C: 123: {
		//;rf-out-key.C: 124: if(high_counter > 80)
		LDWI 	51H 			//0162 	2A51
		SUBWR 	54H,0 			//0163 	0C54
		BTSS 	STATUS,0 		//0164 	1C03
		LJUMP 	180H 			//0165 	3980

		//;rf-out-key.C: 125: {
		//;rf-out-key.C: 126: rx_state = 0;
		CLRR 	56H 			//0166 	0156

		//;rf-out-key.C: 127: pulse_counter = 0;
		CLRR 	55H 			//0167 	0155
		LJUMP 	180H 			//0168 	3980

		//;rf-out-key.C: 130: else if(rx_state == 2)
		LDWI 	2H 			//0169 	2A02
		XORWR 	56H,0 			//016A 	0456
		BTSS 	STATUS,2 		//016B 	1D03
		LJUMP 	175H 			//016C 	3975

		//;rf-out-key.C: 131: {
		//;rf-out-key.C: 132: payload_val = pulse_counter;
		LDR 	55H,0 			//016D 	0855
		STR 	53H 			//016E 	01D3

		//;rf-out-key.C: 133: rx_state = 3;
		LDWI 	3H 			//016F 	2A03
		STR 	56H 			//0170 	01D6

		//;rf-out-key.C: 134: pulse_counter = 0;
		CLRR 	55H 			//0171 	0155

		//;rf-out-key.C: 135: high_counter = 1;
		LDWI 	1H 			//0172 	2A01
		STR 	54H 			//0173 	01D4

		//;rf-out-key.C: 136: }
		LJUMP 	180H 			//0174 	3980

		//;rf-out-key.C: 137: else if(rx_state == 3)
		LDWI 	3H 			//0175 	2A03
		XORWR 	56H,0 			//0176 	0456
		BTSS 	STATUS,2 		//0177 	1D03
		LJUMP 	180H 			//0178 	3980

		//;rf-out-key.C: 138: {
		//;rf-out-key.C: 139: if(high_counter >= 15)
		LDWI 	FH 			//0179 	2A0F
		SUBWR 	54H,0 			//017A 	0C54
		BTSS 	STATUS,0 		//017B 	1C03
		LJUMP 	180H 			//017C 	3980

		//;rf-out-key.C: 140: {
		//;rf-out-key.C: 141: frame_ready = 1;
		LDWI 	1H 			//017D 	2A01
		STR 	51H 			//017E 	01D1

		//;rf-out-key.C: 142: rx_state = 0;
		CLRR 	56H 			//017F 	0156

		//;rf-out-key.C: 143: }
		//;rf-out-key.C: 144: }
		//;rf-out-key.C: 145: }
		//;rf-out-key.C: 148: if(RxBusy == 1 && PA2 == 1 && high_counter >= 60)
		DECRSZ 	52H,0 		//0180 	0E52
		LJUMP 	189H 			//0181 	3989
		BTSS 	5H,2 			//0182 	1D05
		LJUMP 	189H 			//0183 	3989
		LDWI 	3CH 			//0184 	2A3C
		SUBWR 	54H,0 			//0185 	0C54
		BTSS 	STATUS,0 		//0186 	1C03
		LJUMP 	189H 			//0187 	3989

		//;rf-out-key.C: 149: {
		//;rf-out-key.C: 150: RxBusy = 0;
		CLRR 	52H 			//0188 	0152

		//;rf-out-key.C: 151: }
		//;rf-out-key.C: 152: }
		//;rf-out-key.C: 156: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//0189 	1A83
		BTSS 	CH,1 			//018A 	1C8C
		LJUMP 	20AH 			//018B 	3A0A
		BCR 	STATUS,5 		//018C 	1283
		BTSS 	CH,1 			//018D 	1C8C
		LJUMP 	20AH 			//018E 	3A0A

		//;rf-out-key.C: 157: {
		//;rf-out-key.C: 158: TMR2IF = 0;
		BCR 	CH,1 			//018F 	108C
		CLRWDT	 			//0190 	0001

		//;rf-out-key.C: 161: if(PA3 == 0)
		BCR 	STATUS,5 		//0191 	1283
		BTSC 	5H,3 			//0192 	1585
		LJUMP 	19BH 			//0193 	399B

		//;rf-out-key.C: 162: {
		//;rf-out-key.C: 163: if(Timedown < 250)
		LDWI 	FAH 			//0194 	2AFA
		SUBWR 	79H,0 			//0195 	0C79
		BTSC 	STATUS,0 		//0196 	1403
		LJUMP 	199H 			//0197 	3999

		//;rf-out-key.C: 164: {
		//;rf-out-key.C: 165: Timedown++;
		INCR	79H,1 			//0198 	09F9

		//;rf-out-key.C: 166: }
		//;rf-out-key.C: 167: Frist = 1;
		BSR 	70H,2 			//0199 	1970

		//;rf-out-key.C: 168: }
		LJUMP 	20AH 			//019A 	3A0A

		//;rf-out-key.C: 169: else
		//;rf-out-key.C: 170: {
		//;rf-out-key.C: 172: if(Timedown >= 250)
		LDWI 	FAH 			//019B 	2AFA
		SUBWR 	79H,0 			//019C 	0C79
		BTSS 	STATUS,0 		//019D 	1C03
		LJUMP 	1A8H 			//019E 	39A8

		//;rf-out-key.C: 173: {
		//;rf-out-key.C: 174: Timedown = 0;
		CLRR 	79H 			//019F 	0179

		//;rf-out-key.C: 175: Frist = 0;
		BCR 	70H,2 			//01A0 	1170

		//;rf-out-key.C: 176: Start = 0;
		BCR 	70H,5 			//01A1 	12F0

		//;rf-out-key.C: 177: Bit = 8;
		LDWI 	8H 			//01A2 	2A08
		STR 	4BH 			//01A3 	01CB

		//;rf-out-key.C: 178: Buffer = 0;
		CLRR 	4CH 			//01A4 	014C

		//;rf-out-key.C: 179: Count = 0;
		CLRR 	4DH 			//01A5 	014D

		//;rf-out-key.C: 180: Finish = 0;
		BCR 	70H,1 			//01A6 	10F0
		LJUMP 	20AH 			//01A7 	3A0A

		//;rf-out-key.C: 182: }
		//;rf-out-key.C: 185: if((Frist == 1) && (Finish == 0))
		BTSC 	70H,2 			//01A8 	1570
		BTSC 	70H,1 			//01A9 	14F0
		LJUMP 	209H 			//01AA 	3A09

		//;rf-out-key.C: 186: {
		//;rf-out-key.C: 188: if(Timedown >= 180 && Timedown <= 245)
		LDWI 	B4H 			//01AB 	2AB4
		SUBWR 	79H,0 			//01AC 	0C79
		BTSS 	STATUS,0 		//01AD 	1C03
		LJUMP 	1B8H 			//01AE 	39B8
		LDWI 	F6H 			//01AF 	2AF6
		SUBWR 	79H,0 			//01B0 	0C79
		BTSC 	STATUS,0 		//01B1 	1403
		LJUMP 	1B8H 			//01B2 	39B8

		//;rf-out-key.C: 189: {
		//;rf-out-key.C: 190: Start = 1;
		BSR 	70H,5 			//01B3 	1AF0

		//;rf-out-key.C: 191: Bit = 8;
		LDWI 	8H 			//01B4 	2A08
		STR 	4BH 			//01B5 	01CB

		//;rf-out-key.C: 192: Count = 0;
		CLRR 	4DH 			//01B6 	014D

		//;rf-out-key.C: 194: }
		LJUMP 	207H 			//01B7 	3A07

		//;rf-out-key.C: 196: else if(Start == 1)
		BTSS 	70H,5 			//01B8 	1EF0
		LJUMP 	208H 			//01B9 	3A08

		//;rf-out-key.C: 197: {
		//;rf-out-key.C: 198: Bit--;
		DECR 	4BH,1 			//01BA 	0DCB

		//;rf-out-key.C: 201: if(Timedown >= 14 && Timedown <= 32)
		LDWI 	EH 			//01BB 	2A0E
		SUBWR 	79H,0 			//01BC 	0C79
		BTSS 	STATUS,0 		//01BD 	1C03
		LJUMP 	1C7H 			//01BE 	39C7
		LDWI 	21H 			//01BF 	2A21
		SUBWR 	79H,0 			//01C0 	0C79
		BTSC 	STATUS,0 		//01C1 	1403
		LJUMP 	1C7H 			//01C2 	39C7

		//;rf-out-key.C: 202: {
		//;rf-out-key.C: 203: Buffer = Buffer << 1;
		BCR 	STATUS,0 		//01C3 	1003
		RLR 	4CH,0 			//01C4 	054C
		STR 	4CH 			//01C5 	01CC

		//;rf-out-key.C: 204: }
		LJUMP 	1D7H 			//01C6 	39D7

		//;rf-out-key.C: 206: else if(Timedown >= 4 && Timedown <= 13)
		LDWI 	4H 			//01C7 	2A04
		SUBWR 	79H,0 			//01C8 	0C79
		BTSS 	STATUS,0 		//01C9 	1C03
		LJUMP 	1D2H 			//01CA 	39D2
		LDWI 	EH 			//01CB 	2A0E
		SUBWR 	79H,0 			//01CC 	0C79
		BTSC 	STATUS,0 		//01CD 	1403
		LJUMP 	1D2H 			//01CE 	39D2

		//;rf-out-key.C: 207: {
		//;rf-out-key.C: 208: Buffer = (Buffer << 1) | 1;
		BSR 	STATUS,0 		//01CF 	1803
		RLR 	4CH,1 			//01D0 	05CC

		//;rf-out-key.C: 209: }
		LJUMP 	1D7H 			//01D1 	39D7

		//;rf-out-key.C: 211: else
		//;rf-out-key.C: 212: {
		//;rf-out-key.C: 213: Count = 0;
		CLRR 	4DH 			//01D2 	014D

		//;rf-out-key.C: 214: Bit = 8;
		LDWI 	8H 			//01D3 	2A08
		STR 	4BH 			//01D4 	01CB

		//;rf-out-key.C: 215: Buffer = 0;
		CLRR 	4CH 			//01D5 	014C

		//;rf-out-key.C: 216: Start = 0;
		BCR 	70H,5 			//01D6 	12F0

		//;rf-out-key.C: 217: }
		//;rf-out-key.C: 220: if(Bit == 0)
		LDR 	4BH,0 			//01D7 	084B
		BTSS 	STATUS,2 		//01D8 	1D03
		LJUMP 	208H 			//01D9 	3A08

		//;rf-out-key.C: 221: {
		//;rf-out-key.C: 222: Bit = 8;
		LDWI 	8H 			//01DA 	2A08
		STR 	4BH 			//01DB 	01CB

		//;rf-out-key.C: 223: Data[Count] = RFData[Count];
		LDR 	4DH,0 			//01DC 	084D
		ADDWI 	40H 			//01DD 	2740
		STR 	FSR 			//01DE 	0184
		BCR 	STATUS,7 		//01DF 	1383
		LDR 	INDF,0 			//01E0 	0800
		STR 	72H 			//01E1 	01F2
		LDR 	4DH,0 			//01E2 	084D
		ADDWI 	46H 			//01E3 	2746
		STR 	FSR 			//01E4 	0184
		LDR 	72H,0 			//01E5 	0872
		STR 	INDF 			//01E6 	0180

		//;rf-out-key.C: 224: RFData[Count] = Buffer;
		LDR 	4DH,0 			//01E7 	084D
		ADDWI 	40H 			//01E8 	2740
		STR 	FSR 			//01E9 	0184
		LDR 	4CH,0 			//01EA 	084C
		STR 	INDF 			//01EB 	0180

		//;rf-out-key.C: 225: Count++;
		INCR	4DH,1 			//01EC 	09CD

		//;rf-out-key.C: 228: if(Count >= 3)
		LDWI 	3H 			//01ED 	2A03
		SUBWR 	4DH,0 			//01EE 	0C4D
		BTSS 	STATUS,0 		//01EF 	1C03
		LJUMP 	207H 			//01F0 	3A07

		//;rf-out-key.C: 229: {
		//;rf-out-key.C: 230: Count = 0;
		CLRR 	4DH 			//01F1 	014D

		//;rf-out-key.C: 231: Start = 0;
		BCR 	70H,5 			//01F2 	12F0

		//;rf-out-key.C: 234: if(Data[0] == RFData[0] &&
		//;rf-out-key.C: 235: Data[1] == RFData[1] &&
		//;rf-out-key.C: 236: Data[2] == RFData[2])
		LDR 	46H,0 			//01F3 	0846
		XORWR 	40H,0 			//01F4 	0440
		BTSS 	STATUS,2 		//01F5 	1D03
		LJUMP 	207H 			//01F6 	3A07
		LDR 	47H,0 			//01F7 	0847
		XORWR 	41H,0 			//01F8 	0441
		BTSS 	STATUS,2 		//01F9 	1D03
		LJUMP 	207H 			//01FA 	3A07
		LDR 	48H,0 			//01FB 	0848
		XORWR 	42H,0 			//01FC 	0442
		BTSS 	STATUS,2 		//01FD 	1D03
		LJUMP 	207H 			//01FE 	3A07

		//;rf-out-key.C: 237: {
		//;rf-out-key.C: 238: DataM[0] = RFData[0];
		LDR 	40H,0 			//01FF 	0840
		STR 	43H 			//0200 	01C3

		//;rf-out-key.C: 239: DataM[1] = RFData[1];
		LDR 	41H,0 			//0201 	0841
		STR 	44H 			//0202 	01C4

		//;rf-out-key.C: 240: DataM[2] = RFData[2];
		LDR 	42H,0 			//0203 	0842
		STR 	45H 			//0204 	01C5

		//;rf-out-key.C: 241: Finish = 1;
		BSR 	70H,1 			//0205 	18F0

		//;rf-out-key.C: 242: Lock = 1;
		BSR 	70H,0 			//0206 	1870

		//;rf-out-key.C: 193: Buffer = 0;
		CLRR 	4CH 			//0207 	014C

		//;rf-out-key.C: 246: }
		//;rf-out-key.C: 247: }
		//;rf-out-key.C: 249: Frist = 0;
		BCR 	70H,2 			//0208 	1170

		//;rf-out-key.C: 250: }
		//;rf-out-key.C: 252: Timedown = 0;
		CLRR 	79H 			//0209 	0179
		LDR 	75H,0 			//020A 	0875
		STR 	PCLATH 			//020B 	018A
		LDR 	74H,0 			//020C 	0874
		STR 	FSR 			//020D 	0184
		SWAPR 	73H,0 			//020E 	0773
		STR 	STATUS 			//020F 	0183
		SWAPR 	7EH,1 			//0210 	07FE
		SWAPR 	7EH,0 			//0211 	077E
		RETI		 			//0212 	0009
		STR 	64H 			//0213 	01E4

		//;rf-out-key.C: 291: unsigned char r;
		//;rf-out-key.C: 292: unsigned char k_idx;
		//;rf-out-key.C: 293: unsigned char base_addr;
		//;rf-out-key.C: 294: unsigned char fifo_ptr_addr;
		//;rf-out-key.C: 295: unsigned char current_ptr;
		//;rf-out-key.C: 296: unsigned char target_addr;
		//;rf-out-key.C: 298: if((key_num < 1) || (key_num > 4))
		LDR 	64H,0 			//0214 	0864
		BTSC 	STATUS,2 		//0215 	1503
		RET		 					//0216 	0004
		LDWI 	5H 			//0217 	2A05
		SUBWR 	64H,0 			//0218 	0C64
		BTSC 	STATUS,0 		//0219 	1403
		RET		 					//021A 	0004

		//;rf-out-key.C: 301: k_idx = key_num - 1;
		LDR 	64H,0 			//021B 	0864
		ADDWI 	FFH 			//021C 	27FF
		STR 	5FH 			//021D 	01DF

		//;rf-out-key.C: 304: for(r = 0; r < 5; r++)
		CLRR 	62H 			//021E 	0162

		//;rf-out-key.C: 305: {
		//;rf-out-key.C: 306: base_addr = (k_idx * 5 * 3) + (r * 3);
		LDWI 	FH 			//021F 	2A0F
		STR 	76H 			//0220 	01F6
		LDR 	5FH,0 			//0221 	085F
		LCALL 	3AAH 			//0222 	33AA
		STR 	5DH 			//0223 	01DD
		LDR 	62H,0 			//0224 	0862
		ADDWR 	62H,0 			//0225 	0B62
		ADDWR 	62H,0 			//0226 	0B62
		ADDWR 	5DH,0 			//0227 	0B5D
		STR 	60H 			//0228 	01E0

		//;rf-out-key.C: 308: if((DataM[0] == EEPROMread(base_addr)) &&
		//;rf-out-key.C: 309: (DataM[1] == EEPROMread(base_addr + 1)) &&
		//;rf-out-key.C: 310: (DataM[2] == EEPROMread(base_addr + 2)))
		LCALL 	3DFH 			//0229 	33DF
		BCR 	STATUS,5 		//022A 	1283
		XORWR 	43H,0 			//022B 	0443
		BTSS 	STATUS,2 		//022C 	1D03
		LJUMP 	23CH 			//022D 	3A3C
		LDR 	60H,0 			//022E 	0860
		ADDWI 	1H 			//022F 	2701
		LCALL 	3DFH 			//0230 	33DF
		BCR 	STATUS,5 		//0231 	1283
		XORWR 	44H,0 			//0232 	0444
		BTSS 	STATUS,2 		//0233 	1D03
		LJUMP 	23CH 			//0234 	3A3C
		LDR 	60H,0 			//0235 	0860
		ADDWI 	2H 			//0236 	2702
		LCALL 	3DFH 			//0237 	33DF
		BCR 	STATUS,5 		//0238 	1283
		XORWR 	45H,0 			//0239 	0445
		BTSC 	STATUS,2 		//023A 	1503
		RET		 					//023B 	0004
		LDWI 	5H 			//023C 	2A05
		INCR	62H,1 			//023D 	09E2
		SUBWR 	62H,0 			//023E 	0C62
		BTSS 	STATUS,0 		//023F 	1C03
		LJUMP 	21FH 			//0240 	3A1F

		//;rf-out-key.C: 313: }
		//;rf-out-key.C: 314: }
		//;rf-out-key.C: 317: fifo_ptr_addr = 60 + k_idx;
		LDR 	5FH,0 			//0241 	085F
		ADDWI 	3CH 			//0242 	273C
		STR 	5EH 			//0243 	01DE

		//;rf-out-key.C: 318: current_ptr = EEPROMread(fifo_ptr_addr);
		LCALL 	3DFH 			//0244 	33DF
		BCR 	STATUS,5 		//0245 	1283
		STR 	63H 			//0246 	01E3

		//;rf-out-key.C: 320: if(current_ptr >= 5)
		LDWI 	5H 			//0247 	2A05
		SUBWR 	63H,0 			//0248 	0C63
		BTSC 	STATUS,0 		//0249 	1403

		//;rf-out-key.C: 321: current_ptr = 0;
		CLRR 	63H 			//024A 	0163

		//;rf-out-key.C: 323: target_addr = (k_idx * 5 * 3) + (current_ptr * 3);
		LDWI 	FH 			//024B 	2A0F
		STR 	76H 			//024C 	01F6
		LDR 	5FH,0 			//024D 	085F
		LCALL 	3AAH 			//024E 	33AA
		STR 	5DH 			//024F 	01DD
		LDR 	63H,0 			//0250 	0863
		ADDWR 	63H,0 			//0251 	0B63
		ADDWR 	63H,0 			//0252 	0B63
		ADDWR 	5DH,0 			//0253 	0B5D
		STR 	61H 			//0254 	01E1

		//;rf-out-key.C: 326: EEPROMwrite(target_addr, DataM[0]);
		LDR 	43H,0 			//0255 	0843
		STR 	76H 			//0256 	01F6
		LDR 	61H,0 			//0257 	0861
		LCALL 	387H 			//0258 	3387

		//;rf-out-key.C: 327: DelayMs(10);
		LCALL 	2AEH 			//0259 	32AE
		LCALL 	36AH 			//025A 	336A

		//;rf-out-key.C: 329: EEPROMwrite(target_addr + 1, DataM[1]);
		LDR 	44H,0 			//025B 	0844
		STR 	76H 			//025C 	01F6
		LDR 	61H,0 			//025D 	0861
		ADDWI 	1H 			//025E 	2701
		LCALL 	387H 			//025F 	3387

		//;rf-out-key.C: 330: DelayMs(10);
		LCALL 	2AEH 			//0260 	32AE
		LCALL 	36AH 			//0261 	336A

		//;rf-out-key.C: 332: EEPROMwrite(target_addr + 2, DataM[2]);
		LDR 	45H,0 			//0262 	0845
		STR 	76H 			//0263 	01F6
		LDR 	61H,0 			//0264 	0861
		ADDWI 	2H 			//0265 	2702
		LCALL 	387H 			//0266 	3387

		//;rf-out-key.C: 333: DelayMs(10);
		LCALL 	2AEH 			//0267 	32AE
		LCALL 	36AH 			//0268 	336A
		LDWI 	5H 			//0269 	2A05

		//;rf-out-key.C: 336: current_ptr++;
		INCR	63H,1 			//026A 	09E3

		//;rf-out-key.C: 337: if(current_ptr >= 5)
		SUBWR 	63H,0 			//026B 	0C63
		BTSC 	STATUS,0 		//026C 	1403

		//;rf-out-key.C: 338: current_ptr = 0;
		CLRR 	63H 			//026D 	0163

		//;rf-out-key.C: 340: EEPROMwrite(fifo_ptr_addr, current_ptr);
		LDR 	63H,0 			//026E 	0863
		STR 	76H 			//026F 	01F6
		LDR 	5EH,0 			//0270 	085E
		LCALL 	387H 			//0271 	3387

		//;rf-out-key.C: 341: DelayMs(10);
		LCALL 	2AEH 			//0272 	32AE
		LCALL 	36AH 			//0273 	336A

		//;rf-out-key.C: 344: if(key_num == 1)
		DECRSZ 	64H,0 		//0274 	0E64
		LJUMP 	27FH 			//0275 	3A7F

		//;rf-out-key.C: 345: {
		//;rf-out-key.C: 346: DelayMs(100);
		LDWI 	64H 			//0276 	2A64
		STR 	57H 			//0277 	01D7
		CLRR 	58H 			//0278 	0158
		LCALL 	36AH 			//0279 	336A

		//;rf-out-key.C: 347: PA5 = !PA5;
		LDWI 	20H 			//027A 	2A20

		//;rf-out-key.C: 348: DelayMs(100);
		LCALL 	2A9H 			//027B 	32A9
		LCALL 	36AH 			//027C 	336A

		//;rf-out-key.C: 349: PA5 = !PA5;
		LDWI 	20H 			//027D 	2A20
		LJUMP 	2A5H 			//027E 	3AA5

		//;rf-out-key.C: 350: }
		//;rf-out-key.C: 351: else if(key_num == 2)
		LDWI 	2H 			//027F 	2A02
		XORWR 	64H,0 			//0280 	0464
		BTSS 	STATUS,2 		//0281 	1D03
		LJUMP 	28CH 			//0282 	3A8C

		//;rf-out-key.C: 352: {
		//;rf-out-key.C: 353: DelayMs(100);
		LDWI 	64H 			//0283 	2A64
		STR 	57H 			//0284 	01D7
		CLRR 	58H 			//0285 	0158
		LCALL 	36AH 			//0286 	336A

		//;rf-out-key.C: 354: PA1 = !PA1;
		LDWI 	2H 			//0287 	2A02

		//;rf-out-key.C: 355: DelayMs(100);
		LCALL 	2A9H 			//0288 	32A9
		LCALL 	36AH 			//0289 	336A

		//;rf-out-key.C: 356: PA1 = !PA1;
		LDWI 	2H 			//028A 	2A02
		LJUMP 	2A5H 			//028B 	3AA5

		//;rf-out-key.C: 357: }
		//;rf-out-key.C: 358: else if(key_num == 3)
		LDWI 	3H 			//028C 	2A03
		XORWR 	64H,0 			//028D 	0464
		BTSS 	STATUS,2 		//028E 	1D03
		LJUMP 	299H 			//028F 	3A99

		//;rf-out-key.C: 359: {
		//;rf-out-key.C: 360: DelayMs(100);
		LDWI 	64H 			//0290 	2A64
		STR 	57H 			//0291 	01D7
		CLRR 	58H 			//0292 	0158
		LCALL 	36AH 			//0293 	336A

		//;rf-out-key.C: 361: PA0 = !PA0;
		LDWI 	1H 			//0294 	2A01

		//;rf-out-key.C: 362: DelayMs(100);
		LCALL 	2A9H 			//0295 	32A9
		LCALL 	36AH 			//0296 	336A

		//;rf-out-key.C: 363: PA0 = !PA0;
		LDWI 	1H 			//0297 	2A01
		LJUMP 	2A5H 			//0298 	3AA5

		//;rf-out-key.C: 364: }
		//;rf-out-key.C: 365: else if(key_num == 4)
		LDWI 	4H 			//0299 	2A04
		XORWR 	64H,0 			//029A 	0464
		BTSS 	STATUS,2 		//029B 	1D03
		LJUMP 	2A6H 			//029C 	3AA6

		//;rf-out-key.C: 366: {
		//;rf-out-key.C: 367: DelayMs(100);
		LDWI 	64H 			//029D 	2A64
		STR 	57H 			//029E 	01D7
		CLRR 	58H 			//029F 	0158
		LCALL 	36AH 			//02A0 	336A

		//;rf-out-key.C: 368: PA4 = !PA4;
		LDWI 	10H 			//02A1 	2A10

		//;rf-out-key.C: 369: DelayMs(100);
		LCALL 	2A9H 			//02A2 	32A9
		LCALL 	36AH 			//02A3 	336A

		//;rf-out-key.C: 370: PA4 = !PA4;
		LDWI 	10H 			//02A4 	2A10
		XORWR 	5H,1 			//02A5 	0485

		//;rf-out-key.C: 371: }
		//;rf-out-key.C: 374: LernRFKey = 0;
		CLRR 	4EH 			//02A6 	014E

		//;rf-out-key.C: 375: LernRF = 0;
		BCR 	70H,3 			//02A7 	11F0
		RET		 					//02A8 	0004
		XORWR 	5H,1 			//02A9 	0485
		LDWI 	64H 			//02AA 	2A64
		STR 	57H 			//02AB 	01D7
		CLRR 	58H 			//02AC 	0158
		RET		 					//02AD 	0004
		LDWI 	AH 			//02AE 	2A0A
		BCR 	STATUS,5 		//02AF 	1283
		STR 	57H 			//02B0 	01D7
		CLRR 	58H 			//02B1 	0158
		RET		 					//02B2 	0004

		//;rf-out-key.C: 383: unsigned char val = payload_val;
		LDR 	53H,0 			//02B3 	0853
		STR 	76H 			//02B4 	01F6

		//;rf-out-key.C: 384: payload_val = 0;
		CLRR 	53H 			//02B5 	0153

		//;rf-out-key.C: 386: if(RxBusy == 1) return;
		DECRSZ 	52H,0 		//02B6 	0E52
		LJUMP 	2B9H 			//02B7 	3AB9
		RET		 					//02B8 	0004

		//;rf-out-key.C: 387: RxBusy = 1;
		LDWI 	1H 			//02B9 	2A01
		STR 	52H 			//02BA 	01D2

		//;rf-out-key.C: 390: if(val >= 120 && val <= 140)
		LDWI 	78H 			//02BB 	2A78
		SUBWR 	76H,0 			//02BC 	0C76
		BTSS 	STATUS,0 		//02BD 	1C03
		LJUMP 	2C5H 			//02BE 	3AC5
		LDWI 	8DH 			//02BF 	2A8D
		SUBWR 	76H,0 			//02C0 	0C76
		BTSC 	STATUS,0 		//02C1 	1403
		LJUMP 	2C5H 			//02C2 	3AC5

		//;rf-out-key.C: 391: {
		//;rf-out-key.C: 392: LernRFblink = 1;
		BSR 	70H,4 			//02C3 	1A70

		//;rf-out-key.C: 394: }
		RET		 					//02C4 	0004

		//;rf-out-key.C: 396: else if(val >= 10 && val <= 20 && LernRFKey != 1)
		LDWI 	AH 			//02C5 	2A0A
		SUBWR 	76H,0 			//02C6 	0C76
		BTSS 	STATUS,0 		//02C7 	1C03
		LJUMP 	2DEH 			//02C8 	3ADE
		LDWI 	15H 			//02C9 	2A15
		SUBWR 	76H,0 			//02CA 	0C76
		BTSC 	STATUS,0 		//02CB 	1403
		LJUMP 	2DEH 			//02CC 	3ADE
		DECR 	4EH,0 			//02CD 	0D4E
		BTSC 	STATUS,2 		//02CE 	1503
		LJUMP 	2DEH 			//02CF 	3ADE

		//;rf-out-key.C: 397: {
		//;rf-out-key.C: 398: state1 = !state1;
		LDWI 	8H 			//02D0 	2A08
		XORWR 	78H,1 			//02D1 	04F8

		//;rf-out-key.C: 399: eerom = 1;
		LDWI 	1H 			//02D2 	2A01
		STR 	50H 			//02D3 	01D0

		//;rf-out-key.C: 400: PA5 = state1;
		BTSS 	78H,3 			//02D4 	1DF8
		LJUMP 	2D9H 			//02D5 	3AD9
		BCR 	STATUS,5 		//02D6 	1283
		BSR 	5H,5 			//02D7 	1A85
		LJUMP 	2DBH 			//02D8 	3ADB
		BCR 	STATUS,5 		//02D9 	1283
		BCR 	5H,5 			//02DA 	1285

		//;rf-out-key.C: 401: lastKey = 1;
		LDWI 	1H 			//02DB 	2A01
		STR 	4FH 			//02DC 	01CF

		//;rf-out-key.C: 402: }
		RET		 					//02DD 	0004

		//;rf-out-key.C: 404: else if(val >= 30 && val <= 45 && LernRFKey != 2)
		LDWI 	1EH 			//02DE 	2A1E
		SUBWR 	76H,0 			//02DF 	0C76
		BTSS 	STATUS,0 		//02E0 	1C03
		LJUMP 	2F8H 			//02E1 	3AF8
		LDWI 	2EH 			//02E2 	2A2E
		SUBWR 	76H,0 			//02E3 	0C76
		BTSC 	STATUS,0 		//02E4 	1403
		LJUMP 	2F8H 			//02E5 	3AF8
		LDWI 	2H 			//02E6 	2A02
		XORWR 	4EH,0 			//02E7 	044E
		BTSC 	STATUS,2 		//02E8 	1503
		LJUMP 	2F8H 			//02E9 	3AF8

		//;rf-out-key.C: 405: {
		//;rf-out-key.C: 406: state2 = !state2;
		LDWI 	4H 			//02EA 	2A04
		XORWR 	78H,1 			//02EB 	04F8

		//;rf-out-key.C: 407: eerom = 2;
		LDWI 	2H 			//02EC 	2A02
		STR 	50H 			//02ED 	01D0

		//;rf-out-key.C: 408: PA1 = state2;
		BTSS 	78H,2 			//02EE 	1D78
		LJUMP 	2F3H 			//02EF 	3AF3
		BCR 	STATUS,5 		//02F0 	1283
		BSR 	5H,1 			//02F1 	1885
		LJUMP 	2F5H 			//02F2 	3AF5
		BCR 	STATUS,5 		//02F3 	1283
		BCR 	5H,1 			//02F4 	1085

		//;rf-out-key.C: 409: lastKey = 2;
		LDWI 	2H 			//02F5 	2A02
		STR 	4FH 			//02F6 	01CF

		//;rf-out-key.C: 410: }
		RET		 					//02F7 	0004

		//;rf-out-key.C: 412: else if(val >= 50 && val <= 70 && LernRFKey != 3)
		LDWI 	32H 			//02F8 	2A32
		SUBWR 	76H,0 			//02F9 	0C76
		BTSS 	STATUS,0 		//02FA 	1C03
		LJUMP 	312H 			//02FB 	3B12
		LDWI 	47H 			//02FC 	2A47
		SUBWR 	76H,0 			//02FD 	0C76
		BTSC 	STATUS,0 		//02FE 	1403
		LJUMP 	312H 			//02FF 	3B12
		LDWI 	3H 			//0300 	2A03
		XORWR 	4EH,0 			//0301 	044E
		BTSC 	STATUS,2 		//0302 	1503
		LJUMP 	312H 			//0303 	3B12

		//;rf-out-key.C: 413: {
		//;rf-out-key.C: 414: state3 = !state3;
		LDWI 	2H 			//0304 	2A02
		XORWR 	78H,1 			//0305 	04F8

		//;rf-out-key.C: 415: eerom = 3;
		LDWI 	3H 			//0306 	2A03
		STR 	50H 			//0307 	01D0

		//;rf-out-key.C: 416: PA0 = state3;
		BTSS 	78H,1 			//0308 	1CF8
		LJUMP 	30DH 			//0309 	3B0D
		BCR 	STATUS,5 		//030A 	1283
		BSR 	5H,0 			//030B 	1805
		LJUMP 	30FH 			//030C 	3B0F
		BCR 	STATUS,5 		//030D 	1283
		BCR 	5H,0 			//030E 	1005

		//;rf-out-key.C: 417: lastKey = 3;
		LDWI 	3H 			//030F 	2A03
		STR 	4FH 			//0310 	01CF

		//;rf-out-key.C: 418: }
		RET		 					//0311 	0004

		//;rf-out-key.C: 420: else if(val >= 75 && val <= 95 && LernRFKey != 4)
		LDWI 	4BH 			//0312 	2A4B
		SUBWR 	76H,0 			//0313 	0C76
		BTSS 	STATUS,0 		//0314 	1C03
		RET		 					//0315 	0004
		LDWI 	60H 			//0316 	2A60
		SUBWR 	76H,0 			//0317 	0C76
		BTSC 	STATUS,0 		//0318 	1403
		RET		 					//0319 	0004
		LDWI 	4H 			//031A 	2A04
		XORWR 	4EH,0 			//031B 	044E
		BTSC 	STATUS,2 		//031C 	1503
		RET		 					//031D 	0004

		//;rf-out-key.C: 421: {
		//;rf-out-key.C: 422: state4 = !state4;
		LDWI 	1H 			//031E 	2A01
		XORWR 	78H,1 			//031F 	04F8

		//;rf-out-key.C: 423: eerom = 4;
		LDWI 	4H 			//0320 	2A04
		STR 	50H 			//0321 	01D0

		//;rf-out-key.C: 424: PA4 = state4;
		BTSS 	78H,0 			//0322 	1C78
		LJUMP 	327H 			//0323 	3B27
		BCR 	STATUS,5 		//0324 	1283
		BSR 	5H,4 			//0325 	1A05
		LJUMP 	329H 			//0326 	3B29
		BCR 	STATUS,5 		//0327 	1283
		BCR 	5H,4 			//0328 	1205

		//;rf-out-key.C: 425: lastKey = 4;
		LDWI 	4H 			//0329 	2A04
		STR 	4FH 			//032A 	01CF
		RET		 					//032B 	0004

		//;rf-out-key.C: 264: unsigned char k, r, base_addr;
		//;rf-out-key.C: 266: for(k = 0; k < 4; k++)
		CLRR 	5BH 			//032C 	015B

		//;rf-out-key.C: 267: {
		//;rf-out-key.C: 268: for(r = 0; r < 5; r++)
		CLRR 	5AH 			//032D 	015A

		//;rf-out-key.C: 269: {
		//;rf-out-key.C: 270: base_addr = (k * 5 * 3) + (r * 3);
		LDWI 	FH 			//032E 	2A0F
		STR 	76H 			//032F 	01F6
		LDR 	5BH,0 			//0330 	085B
		LCALL 	3AAH 			//0331 	33AA
		STR 	77H 			//0332 	01F7
		LDR 	5AH,0 			//0333 	085A
		ADDWR 	5AH,0 			//0334 	0B5A
		ADDWR 	5AH,0 			//0335 	0B5A
		ADDWR 	77H,0 			//0336 	0B77
		STR 	59H 			//0337 	01D9

		//;rf-out-key.C: 272: if(DataM[0] == EEPROMread(base_addr) &&
		//;rf-out-key.C: 273: DataM[1] == EEPROMread(base_addr + 1) &&
		//;rf-out-key.C: 274: DataM[2] == EEPROMread(base_addr + 2))
		LCALL 	3DFH 			//0338 	33DF
		BCR 	STATUS,5 		//0339 	1283
		XORWR 	43H,0 			//033A 	0443
		BTSS 	STATUS,2 		//033B 	1D03
		LJUMP 	35FH 			//033C 	3B5F
		LDR 	59H,0 			//033D 	0859
		ADDWI 	1H 			//033E 	2701
		LCALL 	3DFH 			//033F 	33DF
		BCR 	STATUS,5 		//0340 	1283
		XORWR 	44H,0 			//0341 	0444
		BTSS 	STATUS,2 		//0342 	1D03
		LJUMP 	35FH 			//0343 	3B5F
		LDR 	59H,0 			//0344 	0859
		ADDWI 	2H 			//0345 	2702
		LCALL 	3DFH 			//0346 	33DF
		BCR 	STATUS,5 		//0347 	1283
		XORWR 	45H,0 			//0348 	0445
		BTSS 	STATUS,2 		//0349 	1D03
		LJUMP 	35FH 			//034A 	3B5F

		//;rf-out-key.C: 275: {
		//;rf-out-key.C: 276: if(k == 0) O1 = 1;
		LDR 	5BH,0 			//034B 	085B
		BTSS 	STATUS,2 		//034C 	1D03
		LJUMP 	350H 			//034D 	3B50
		BSR 	71H,1 			//034E 	18F1
		RET		 					//034F 	0004

		//;rf-out-key.C: 277: else if(k == 1) O2 = 1;
		DECRSZ 	5BH,0 		//0350 	0E5B
		LJUMP 	354H 			//0351 	3B54
		BSR 	71H,0 			//0352 	1871
		RET		 					//0353 	0004

		//;rf-out-key.C: 278: else if(k == 2) O3 = 1;
		LDWI 	2H 			//0354 	2A02
		XORWR 	5BH,0 			//0355 	045B
		BTSS 	STATUS,2 		//0356 	1D03
		LJUMP 	35AH 			//0357 	3B5A
		BSR 	70H,7 			//0358 	1BF0
		RET		 					//0359 	0004

		//;rf-out-key.C: 279: else if(k == 3) O4 = 1;
		LDWI 	3H 			//035A 	2A03
		XORWR 	5BH,0 			//035B 	045B
		BTSC 	STATUS,2 		//035C 	1503
		BSR 	70H,6 			//035D 	1B70
		RET		 					//035E 	0004
		LDWI 	5H 			//035F 	2A05
		INCR	5AH,1 			//0360 	09DA
		SUBWR 	5AH,0 			//0361 	0C5A
		BTSS 	STATUS,0 		//0362 	1C03
		LJUMP 	32EH 			//0363 	3B2E
		LDWI 	4H 			//0364 	2A04
		INCR	5BH,1 			//0365 	09DB
		SUBWR 	5BH,0 			//0366 	0C5B
		BTSC 	STATUS,0 		//0367 	1403
		RET		 					//0368 	0004
		LJUMP 	32DH 			//0369 	3B2D

		//;rf-out-key.C: 583: unsigned int a, b;
		//;rf-out-key.C: 584: for(a = 0; a < Time; a++)
		CLRR 	59H 			//036A 	0159
		CLRR 	5AH 			//036B 	015A
		LDR 	58H,0 			//036C 	0858
		SUBWR 	5AH,0 			//036D 	0C5A
		BTSS 	STATUS,2 		//036E 	1D03
		LJUMP 	372H 			//036F 	3B72
		LDR 	57H,0 			//0370 	0857
		SUBWR 	59H,0 			//0371 	0C59
		BTSC 	STATUS,0 		//0372 	1403
		RET		 					//0373 	0004

		//;rf-out-key.C: 585: {
		//;rf-out-key.C: 586: for(b = 0; b < 5; b++)
		CLRR 	5BH 			//0374 	015B
		CLRR 	5CH 			//0375 	015C

		//;rf-out-key.C: 587: {
		//;rf-out-key.C: 588: DelayUs(197);
		LDWI 	C5H 			//0376 	2AC5
		LCALL 	3C4H 			//0377 	33C4
		BCR 	STATUS,5 		//0378 	1283
		INCR	5BH,1 			//0379 	09DB
		BTSC 	STATUS,2 		//037A 	1503
		INCR	5CH,1 			//037B 	09DC
		LDWI 	0H 			//037C 	2A00
		SUBWR 	5CH,0 			//037D 	0C5C
		LDWI 	5H 			//037E 	2A05
		BTSC 	STATUS,2 		//037F 	1503
		SUBWR 	5BH,0 			//0380 	0C5B
		BTSS 	STATUS,0 		//0381 	1C03
		LJUMP 	376H 			//0382 	3B76
		INCR	59H,1 			//0383 	09D9
		BTSC 	STATUS,2 		//0384 	1503
		INCR	5AH,1 			//0385 	09DA
		LJUMP 	36CH 			//0386 	3B6C
		STR 	77H 			//0387 	01F7

		//;rf-out-key.C: 560: GIE = 0;
		BCR 	INTCON,7 		//0388 	138B

		//;rf-out-key.C: 561: while(GIE);
		BTSC 	INTCON,7 		//0389 	178B
		LJUMP 	389H 			//038A 	3B89

		//;rf-out-key.C: 562: EEADR = EEAddr;
		LDR 	77H,0 			//038B 	0877
		BSR 	STATUS,5 		//038C 	1A83
		STR 	1BH 			//038D 	019B

		//;rf-out-key.C: 563: EEDAT = Data;
		LDR 	76H,0 			//038E 	0876
		STR 	1AH 			//038F 	019A

		//;rf-out-key.C: 564: EEIF = 0;
		BCR 	STATUS,5 		//0390 	1283
		BCR 	CH,7 			//0391 	138C

		//;rf-out-key.C: 565: EECON1 |= 0x34;
		LDWI 	34H 			//0392 	2A34
		BSR 	STATUS,5 		//0393 	1A83
		IORWR 	1CH,1 			//0394 	039C

		//;rf-out-key.C: 566: WR = 1;
		BSR 	1DH,0 			//0395 	181D

		//;rf-out-key.C: 567: while(WR);
		BTSC 	1DH,0 			//0396 	141D
		LJUMP 	396H 			//0397 	3B96

		//;rf-out-key.C: 568: GIE = 1;
		BSR 	INTCON,7 		//0398 	1B8B
		RET		 					//0399 	0004

		//;rf-out-key.C: 523: OSCCON = 0B01110000;
		LDWI 	70H 			//039A 	2A70
		BSR 	STATUS,5 		//039B 	1A83
		STR 	FH 			//039C 	018F

		//;rf-out-key.C: 524: INTCON = 0;
		CLRR 	INTCON 			//039D 	010B

		//;rf-out-key.C: 525: OPTION = 0B00001000;
		LDWI 	8H 			//039E 	2A08
		STR 	1H 			//039F 	0181

		//;rf-out-key.C: 526: PORTA = 0B00000100;
		LDWI 	4H 			//03A0 	2A04
		BCR 	STATUS,5 		//03A1 	1283
		STR 	5H 			//03A2 	0185

		//;rf-out-key.C: 527: TRISA = 0B00001100;
		LDWI 	CH 			//03A3 	2A0C
		BSR 	STATUS,5 		//03A4 	1A83
		STR 	5H 			//03A5 	0185

		//;rf-out-key.C: 528: WPUA = 0B00001100;
		STR 	15H 			//03A6 	0195

		//;rf-out-key.C: 529: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//03A7 	1283
		CLRR 	1BH 			//03A8 	011B
		RET		 					//03A9 	0004
		STR 	58H 			//03AA 	01D8
		CLRR 	57H 			//03AB 	0157
		LDR 	76H,0 			//03AC 	0876
		BTSC 	58H,0 			//03AD 	1458
		ADDWR 	57H,1 			//03AE 	0BD7
		BCR 	STATUS,0 		//03AF 	1003
		RLR 	76H,1 			//03B0 	05F6
		BCR 	STATUS,0 		//03B1 	1003
		RRR	58H,1 			//03B2 	06D8
		LDR 	58H,0 			//03B3 	0858
		BTSS 	STATUS,2 		//03B4 	1D03
		LJUMP 	3ACH 			//03B5 	3BAC
		LDR 	57H,0 			//03B6 	0857
		RET		 					//03B7 	0004

		//;rf-out-key.C: 534: T2CON = 0B00000001;
		LDWI 	1H 			//03B8 	2A01
		STR 	12H 			//03B9 	0192

		//;rf-out-key.C: 535: TMR2 = 0;
		CLRR 	11H 			//03BA 	0111

		//;rf-out-key.C: 536: PR2 = 50;
		LDWI 	32H 			//03BB 	2A32
		BSR 	STATUS,5 		//03BC 	1A83
		STR 	12H 			//03BD 	0192

		//;rf-out-key.C: 537: TMR2IF = 0;
		BCR 	STATUS,5 		//03BE 	1283
		BCR 	CH,1 			//03BF 	108C

		//;rf-out-key.C: 538: TMR2ON = 1;
		BSR 	12H,2 			//03C0 	1912

		//;rf-out-key.C: 539: PEIE = 1;
		BSR 	INTCON,6 		//03C1 	1B0B

		//;rf-out-key.C: 540: GIE = 1;
		BSR 	INTCON,7 		//03C2 	1B8B
		RET		 					//03C3 	0004
		STR 	76H 			//03C4 	01F6

		//;rf-out-key.C: 573: unsigned char a;
		//;rf-out-key.C: 574: for(a = 0; a < Time; a++)
		CLRR 	77H 			//03C5 	0177
		LDR 	76H,0 			//03C6 	0876
		SUBWR 	77H,0 			//03C7 	0C77
		BTSC 	STATUS,0 		//03C8 	1403
		RET		 					//03C9 	0004

		//;rf-out-key.C: 575: {
		//;rf-out-key.C: 576: __nop();
		NOP		 					//03CA 	0000
		CLRWDT	 			//03CB 	0001
		INCR	77H,1 			//03CC 	09F7
		LJUMP 	3C6H 			//03CD 	3BC6

		//;rf-out-key.C: 545: OPTION = 0B00000110;
		LDWI 	6H 			//03CE 	2A06
		BSR 	STATUS,5 		//03CF 	1A83
		STR 	1H 			//03D0 	0181

		//;rf-out-key.C: 546: TMR0 = 239;
		LDWI 	EFH 			//03D1 	2AEF
		BCR 	STATUS,5 		//03D2 	1283
		STR 	1H 			//03D3 	0181

		//;rf-out-key.C: 547: T0IF = 0;
		BCR 	INTCON,2 		//03D4 	110B

		//;rf-out-key.C: 548: T0IE = 1;
		BSR 	INTCON,5 		//03D5 	1A8B
		RET		 					//03D6 	0004
		CLRWDT	 			//03D7 	0001
		CLRR 	INDF 			//03D8 	0100
		INCR	FSR,1 			//03D9 	0984
		XORWR 	FSR,0 			//03DA 	0404
		BTSC 	STATUS,2 		//03DB 	1503
		RETW 	0H 			//03DC 	2100
		XORWR 	FSR,0 			//03DD 	0404
		LJUMP 	3D8H 			//03DE 	3BD8
		STR 	76H 			//03DF 	01F6

		//;rf-out-key.C: 553: EEADR = EEAddr;
		BSR 	STATUS,5 		//03E0 	1A83
		STR 	1BH 			//03E1 	019B

		//;rf-out-key.C: 554: RD = 1;
		BSR 	1CH,0 			//03E2 	181C

		//;rf-out-key.C: 555: return EEDAT;
		LDR 	1AH,0 			//03E3 	081A
		RET		 					//03E4 	0004
			END
