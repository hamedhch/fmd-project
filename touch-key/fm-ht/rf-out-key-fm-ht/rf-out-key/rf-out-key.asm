//Deviec:FT60F01X
//-----------------------Variable---------------------------------
		_rx_state		EQU		57H
		_pulse_counter		EQU		56H
		_high_counter		EQU		55H
		_payload_val		EQU		54H
		_RxBusy		EQU		53H
		_frame_ready		EQU		52H
		_conternotRF		EQU		49H
		_Timedown		EQU		79H
		_Data		EQU		46H
		_DataM		EQU		43H
		_RFData		EQU		40H
		_eerom		EQU		51H
		_lastKey		EQU		50H
		_LernRFKey		EQU		4FH
		_Count		EQU		4EH
		_Buffer		EQU		4DH
		_Bit		EQU		4CH
		_lastLearnKey		EQU		4BH
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
//		Process_Touch_Payload@val		EQU		5DH
//		Clear_Key_Remotes@key_num		EQU		5BH
//		Clear_Key_Remotes@i		EQU		5CH
//		Clear_Key_Remotes@addr		EQU		5AH
//		Clear_Key_Remotes@key_num		EQU		5BH
//		Clear_Key_Remotes@key_num		EQU		5BH
//		Learn_Current_Remote@key_num		EQU		61H
//		Learn_Current_Remote@current_ptr		EQU		60H
//		Learn_Current_Remote@r		EQU		5FH
//		Learn_Current_Remote@target_addr		EQU		5EH
//		Learn_Current_Remote@base_addr		EQU		5DH
//		Learn_Current_Remote@k_idx		EQU		5CH
//		Learn_Current_Remote@fifo_ptr_addr		EQU		5BH
//		Learn_Current_Remote@key_num		EQU		61H
//		Learn_Current_Remote@key_num		EQU		61H
//		EEPROMwrite@EEAddr		EQU		77H
//		EEPROMwrite@EEAddr		EQU		77H
//		EEPROMwrite@Data		EQU		76H
//		EEPROMwrite@EEAddr		EQU		77H
//		DelayMs@b		EQU		5CH
//		DelayMs@a		EQU		5AH
//		DelayMs@Time		EQU		58H
//		DelayUs@Time		EQU		76H
//		DelayUs@a		EQU		77H
//		DelayUs@Time		EQU		76H
//		DelayUs@Time		EQU		76H
//		Check_RF_Match@k		EQU		5CH
//		Check_RF_Match@r		EQU		5BH
//		Check_RF_Match@base_addr		EQU		5AH
//		___bmul@multiplier		EQU		59H
//		___bmul@product		EQU		58H
//		___bmul@multiplier		EQU		59H
//		___bmul@multiplicand		EQU		76H
//		___bmul@multiplier		EQU		59H
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
		LJUMP 	132H 			//000B 	3932
		LJUMP 	0DH 			//000C 	380D
		LDWI 	40H 			//000D 	2A40
		CLRR 	70H 			//000E 	0170
		CLRR 	71H 			//000F 	0171
		CLRR 	79H 			//0010 	0179
		BCR 	STATUS,7 		//0011 	1383
		STR 	FSR 			//0012 	0184
		LDWI 	58H 			//0013 	2A58
		LCALL 	3DCH 			//0014 	33DC
		CLRR 	STATUS 			//0015 	0103
		LJUMP 	17H 			//0016 	3817

		//;rf-out-key.C: 494: POWER_INITIAL();
		LCALL 	39FH 			//0017 	339F

		//;rf-out-key.C: 495: TIMER2_INITIAL();
		LCALL 	3BDH 			//0018 	33BD

		//;rf-out-key.C: 496: TIMER0_INITIAL();
		LCALL 	3D3H 			//0019 	33D3

		//;rf-out-key.C: 497: TMR2IE = 1;
		BSR 	STATUS,5 		//001A 	1A83
		BSR 	CH,1 			//001B 	188C

		//;rf-out-key.C: 499: Finish = 0;
		BCR 	70H,1 			//001C 	10F0

		//;rf-out-key.C: 500: Start = 0;
		BCR 	70H,5 			//001D 	12F0

		//;rf-out-key.C: 501: lastLearnKey = 0;
		BCR 	STATUS,5 		//001E 	1283
		CLRR 	4BH 			//001F 	014B

		//;rf-out-key.C: 504: state1 = EEPROMread(70);
		LDWI 	46H 			//0020 	2A46
		LCALL 	3E4H 			//0021 	33E4
		BCR 	STATUS,5 		//0022 	1283
		STR 	62H 			//0023 	01E2
		RRR	62H,0 			//0024 	0662
		BTSS 	STATUS,0 		//0025 	1C03
		LJUMP 	29H 			//0026 	3829
		BSR 	78H,3 			//0027 	19F8
		LJUMP 	2AH 			//0028 	382A
		BCR 	78H,3 			//0029 	11F8

		//;rf-out-key.C: 505: state2 = EEPROMread(71);
		LDWI 	47H 			//002A 	2A47
		LCALL 	3E4H 			//002B 	33E4
		BCR 	STATUS,5 		//002C 	1283
		STR 	62H 			//002D 	01E2
		RRR	62H,0 			//002E 	0662
		BTSS 	STATUS,0 		//002F 	1C03
		LJUMP 	33H 			//0030 	3833
		BSR 	78H,2 			//0031 	1978
		LJUMP 	34H 			//0032 	3834
		BCR 	78H,2 			//0033 	1178

		//;rf-out-key.C: 506: state3 = EEPROMread(72);
		LDWI 	48H 			//0034 	2A48
		LCALL 	3E4H 			//0035 	33E4
		BCR 	STATUS,5 		//0036 	1283
		STR 	62H 			//0037 	01E2
		RRR	62H,0 			//0038 	0662
		BTSS 	STATUS,0 		//0039 	1C03
		LJUMP 	3DH 			//003A 	383D
		BSR 	78H,1 			//003B 	18F8
		LJUMP 	3EH 			//003C 	383E
		BCR 	78H,1 			//003D 	10F8

		//;rf-out-key.C: 507: state4 = EEPROMread(73);
		LDWI 	49H 			//003E 	2A49
		LCALL 	3E4H 			//003F 	33E4
		BCR 	STATUS,5 		//0040 	1283
		STR 	62H 			//0041 	01E2
		RRR	62H,0 			//0042 	0662
		BTSS 	STATUS,0 		//0043 	1C03
		LJUMP 	47H 			//0044 	3847
		BSR 	78H,0 			//0045 	1878
		LJUMP 	48H 			//0046 	3848
		BCR 	78H,0 			//0047 	1078

		//;rf-out-key.C: 509: PA5 = state1;
		BTSS 	78H,3 			//0048 	1DF8
		LJUMP 	4DH 			//0049 	384D
		BCR 	STATUS,5 		//004A 	1283
		BSR 	5H,5 			//004B 	1A85
		LJUMP 	4FH 			//004C 	384F
		BCR 	STATUS,5 		//004D 	1283
		BCR 	5H,5 			//004E 	1285

		//;rf-out-key.C: 510: PA1 = state2;
		BTSS 	78H,2 			//004F 	1D78
		LJUMP 	54H 			//0050 	3854
		BCR 	STATUS,5 		//0051 	1283
		BSR 	5H,1 			//0052 	1885
		LJUMP 	56H 			//0053 	3856
		BCR 	STATUS,5 		//0054 	1283
		BCR 	5H,1 			//0055 	1085

		//;rf-out-key.C: 511: PA0 = state3;
		BTSS 	78H,1 			//0056 	1CF8
		LJUMP 	5BH 			//0057 	385B
		BCR 	STATUS,5 		//0058 	1283
		BSR 	5H,0 			//0059 	1805
		LJUMP 	5DH 			//005A 	385D
		BCR 	STATUS,5 		//005B 	1283
		BCR 	5H,0 			//005C 	1005

		//;rf-out-key.C: 512: PA4 = state4;
		BTSS 	78H,0 			//005D 	1C78
		LJUMP 	62H 			//005E 	3862
		BCR 	STATUS,5 		//005F 	1283
		BSR 	5H,4 			//0060 	1A05
		LJUMP 	64H 			//0061 	3864
		BCR 	STATUS,5 		//0062 	1283
		BCR 	5H,4 			//0063 	1205

		//;rf-out-key.C: 514: while(1)
		CLRWDT	 			//0064 	0001

		//;rf-out-key.C: 519: if(frame_ready == 1)
		BCR 	STATUS,5 		//0065 	1283
		DECRSZ 	52H,0 		//0066 	0E52
		LJUMP 	6AH 			//0067 	386A

		//;rf-out-key.C: 520: {
		//;rf-out-key.C: 521: frame_ready = 0;
		CLRR 	52H 			//0068 	0152

		//;rf-out-key.C: 522: Process_Touch_Payload();
		LCALL 	21CH 			//0069 	321C

		//;rf-out-key.C: 523: }
		//;rf-out-key.C: 527: if(Lock == 1)
		BTSS 	70H,0 			//006A 	1C70
		LJUMP 	7AH 			//006B 	387A

		//;rf-out-key.C: 528: {
		//;rf-out-key.C: 529: Lock = 0;
		BCR 	70H,0 			//006C 	1070

		//;rf-out-key.C: 531: if(LernRF == 1)
		BTSS 	70H,3 			//006D 	1DF0
		LJUMP 	79H 			//006E 	3879

		//;rf-out-key.C: 532: {
		//;rf-out-key.C: 533: if((LernRFKey >= 1) && (LernRFKey <= 4))
		LDR 	4FH,0 			//006F 	084F
		BTSC 	STATUS,2 		//0070 	1503
		LJUMP 	7AH 			//0071 	387A
		LDWI 	5H 			//0072 	2A05
		SUBWR 	4FH,0 			//0073 	0C4F
		BTSC 	STATUS,0 		//0074 	1403
		LJUMP 	7AH 			//0075 	387A

		//;rf-out-key.C: 534: {
		//;rf-out-key.C: 535: Learn_Current_Remote(LernRFKey);
		LDR 	4FH,0 			//0076 	084F
		LCALL 	2A9H 			//0077 	32A9
		LJUMP 	7AH 			//0078 	387A

		//;rf-out-key.C: 538: else
		//;rf-out-key.C: 539: {
		//;rf-out-key.C: 540: Check_RF_Match();
		LCALL 	31BH 			//0079 	331B

		//;rf-out-key.C: 541: }
		//;rf-out-key.C: 542: }
		//;rf-out-key.C: 547: if(O1 == 1) { O1 = 0; state1 = !state1; eerom = 1; PA5 = state1; las
		//+                          tKey = 1; }
		BTSS 	71H,1 			//007A 	1CF1
		LJUMP 	8AH 			//007B 	388A
		BCR 	71H,1 			//007C 	10F1
		LDWI 	8H 			//007D 	2A08
		XORWR 	78H,1 			//007E 	04F8
		LDWI 	1H 			//007F 	2A01
		STR 	51H 			//0080 	01D1
		BTSS 	78H,3 			//0081 	1DF8
		LJUMP 	86H 			//0082 	3886
		BCR 	STATUS,5 		//0083 	1283
		BSR 	5H,5 			//0084 	1A85
		LJUMP 	88H 			//0085 	3888
		BCR 	STATUS,5 		//0086 	1283
		BCR 	5H,5 			//0087 	1285
		LDWI 	1H 			//0088 	2A01
		STR 	50H 			//0089 	01D0

		//;rf-out-key.C: 548: if(O2 == 1) { O2 = 0; state2 = !state2; eerom = 2; PA1 = state2; las
		//+                          tKey = 2; }
		BTSS 	71H,0 			//008A 	1C71
		LJUMP 	9AH 			//008B 	389A
		BCR 	71H,0 			//008C 	1071
		LDWI 	4H 			//008D 	2A04
		XORWR 	78H,1 			//008E 	04F8
		LDWI 	2H 			//008F 	2A02
		STR 	51H 			//0090 	01D1
		BTSS 	78H,2 			//0091 	1D78
		LJUMP 	96H 			//0092 	3896
		BCR 	STATUS,5 		//0093 	1283
		BSR 	5H,1 			//0094 	1885
		LJUMP 	98H 			//0095 	3898
		BCR 	STATUS,5 		//0096 	1283
		BCR 	5H,1 			//0097 	1085
		LDWI 	2H 			//0098 	2A02
		STR 	50H 			//0099 	01D0

		//;rf-out-key.C: 549: if(O3 == 1) { O3 = 0; state3 = !state3; eerom = 3; PA0 = state3; las
		//+                          tKey = 3; }
		BTSS 	70H,7 			//009A 	1FF0
		LJUMP 	AAH 			//009B 	38AA
		BCR 	70H,7 			//009C 	13F0
		LDWI 	2H 			//009D 	2A02
		XORWR 	78H,1 			//009E 	04F8
		LDWI 	3H 			//009F 	2A03
		STR 	51H 			//00A0 	01D1
		BTSS 	78H,1 			//00A1 	1CF8
		LJUMP 	A6H 			//00A2 	38A6
		BCR 	STATUS,5 		//00A3 	1283
		BSR 	5H,0 			//00A4 	1805
		LJUMP 	A8H 			//00A5 	38A8
		BCR 	STATUS,5 		//00A6 	1283
		BCR 	5H,0 			//00A7 	1005
		LDWI 	3H 			//00A8 	2A03
		STR 	50H 			//00A9 	01D0

		//;rf-out-key.C: 550: if(O4 == 1) { O4 = 0; state4 = !state4; eerom = 4; PA4 = state4; las
		//+                          tKey = 4; }
		BTSS 	70H,6 			//00AA 	1F70
		LJUMP 	BAH 			//00AB 	38BA
		BCR 	70H,6 			//00AC 	1370
		LDWI 	1H 			//00AD 	2A01
		XORWR 	78H,1 			//00AE 	04F8
		LDWI 	4H 			//00AF 	2A04
		STR 	51H 			//00B0 	01D1
		BTSS 	78H,0 			//00B1 	1C78
		LJUMP 	B6H 			//00B2 	38B6
		BCR 	STATUS,5 		//00B3 	1283
		BSR 	5H,4 			//00B4 	1A05
		LJUMP 	B8H 			//00B5 	38B8
		BCR 	STATUS,5 		//00B6 	1283
		BCR 	5H,4 			//00B7 	1205
		LDWI 	4H 			//00B8 	2A04
		STR 	50H 			//00B9 	01D0

		//;rf-out-key.C: 553: if(eerom != 0)
		LDR 	51H,0 			//00BA 	0851
		BTSC 	STATUS,2 		//00BB 	1503
		LJUMP 	E6H 			//00BC 	38E6

		//;rf-out-key.C: 554: {
		//;rf-out-key.C: 555: if(eerom == 1) EEPROMwrite(70, state1);
		DECR 	51H,0 			//00BD 	0D51
		BTSS 	STATUS,2 		//00BE 	1D03
		LJUMP 	C6H 			//00BF 	38C6
		LDWI 	0H 			//00C0 	2A00
		BTSC 	78H,3 			//00C1 	15F8
		LDWI 	1H 			//00C2 	2A01
		STR 	76H 			//00C3 	01F6
		LDWI 	46H 			//00C4 	2A46
		LJUMP 	E3H 			//00C5 	38E3

		//;rf-out-key.C: 556: else if(eerom == 2) EEPROMwrite(71, state2);
		LDWI 	2H 			//00C6 	2A02
		XORWR 	51H,0 			//00C7 	0451
		BTSS 	STATUS,2 		//00C8 	1D03
		LJUMP 	D0H 			//00C9 	38D0
		LDWI 	0H 			//00CA 	2A00
		BTSC 	78H,2 			//00CB 	1578
		LDWI 	1H 			//00CC 	2A01
		STR 	76H 			//00CD 	01F6
		LDWI 	47H 			//00CE 	2A47
		LJUMP 	E3H 			//00CF 	38E3

		//;rf-out-key.C: 557: else if(eerom == 3) EEPROMwrite(72, state3);
		LDWI 	3H 			//00D0 	2A03
		XORWR 	51H,0 			//00D1 	0451
		BTSS 	STATUS,2 		//00D2 	1D03
		LJUMP 	DAH 			//00D3 	38DA
		LDWI 	0H 			//00D4 	2A00
		BTSC 	78H,1 			//00D5 	14F8
		LDWI 	1H 			//00D6 	2A01
		STR 	76H 			//00D7 	01F6
		LDWI 	48H 			//00D8 	2A48
		LJUMP 	E3H 			//00D9 	38E3

		//;rf-out-key.C: 558: else if(eerom == 4) EEPROMwrite(73, state4);
		LDWI 	4H 			//00DA 	2A04
		XORWR 	51H,0 			//00DB 	0451
		BTSS 	STATUS,2 		//00DC 	1D03
		LJUMP 	E4H 			//00DD 	38E4
		LDWI 	0H 			//00DE 	2A00
		BTSC 	78H,0 			//00DF 	1478
		LDWI 	1H 			//00E0 	2A01
		STR 	76H 			//00E1 	01F6
		LDWI 	49H 			//00E2 	2A49
		LCALL 	38CH 			//00E3 	338C

		//;rf-out-key.C: 559: eerom = 0;
		BCR 	STATUS,5 		//00E4 	1283
		CLRR 	51H 			//00E5 	0151

		//;rf-out-key.C: 560: }
		//;rf-out-key.C: 563: if(LernRFblink == 1)
		BTSS 	70H,4 			//00E6 	1E70
		LJUMP 	64H 			//00E7 	3864

		//;rf-out-key.C: 564: {
		//;rf-out-key.C: 566: if(lastKey == 1)
		DECRSZ 	50H,0 		//00E8 	0E50
		LJUMP 	F3H 			//00E9 	38F3

		//;rf-out-key.C: 567: {
		//;rf-out-key.C: 568: DelayMs(200);
		LDWI 	C8H 			//00EA 	2AC8
		STR 	58H 			//00EB 	01D8
		CLRR 	59H 			//00EC 	0159
		LCALL 	358H 			//00ED 	3358

		//;rf-out-key.C: 569: PA5 = !PA5;
		LDWI 	20H 			//00EE 	2A20

		//;rf-out-key.C: 570: DelayMs(200);
		LCALL 	12DH 			//00EF 	312D
		LCALL 	358H 			//00F0 	3358

		//;rf-out-key.C: 571: PA5 = !PA5;
		LDWI 	20H 			//00F1 	2A20
		LJUMP 	119H 			//00F2 	3919

		//;rf-out-key.C: 572: }
		//;rf-out-key.C: 573: else if(lastKey == 2)
		LDWI 	2H 			//00F3 	2A02
		XORWR 	50H,0 			//00F4 	0450
		BTSS 	STATUS,2 		//00F5 	1D03
		LJUMP 	100H 			//00F6 	3900

		//;rf-out-key.C: 574: {
		//;rf-out-key.C: 575: DelayMs(200);
		LDWI 	C8H 			//00F7 	2AC8
		STR 	58H 			//00F8 	01D8
		CLRR 	59H 			//00F9 	0159
		LCALL 	358H 			//00FA 	3358

		//;rf-out-key.C: 576: PA1 = !PA1;
		LDWI 	2H 			//00FB 	2A02

		//;rf-out-key.C: 577: DelayMs(200);
		LCALL 	12DH 			//00FC 	312D
		LCALL 	358H 			//00FD 	3358

		//;rf-out-key.C: 578: PA1 = !PA1;
		LDWI 	2H 			//00FE 	2A02
		LJUMP 	119H 			//00FF 	3919

		//;rf-out-key.C: 579: }
		//;rf-out-key.C: 580: else if(lastKey == 3)
		LDWI 	3H 			//0100 	2A03
		XORWR 	50H,0 			//0101 	0450
		BTSS 	STATUS,2 		//0102 	1D03
		LJUMP 	10DH 			//0103 	390D

		//;rf-out-key.C: 581: {
		//;rf-out-key.C: 582: DelayMs(200);
		LDWI 	C8H 			//0104 	2AC8
		STR 	58H 			//0105 	01D8
		CLRR 	59H 			//0106 	0159
		LCALL 	358H 			//0107 	3358

		//;rf-out-key.C: 583: PA0 = !PA0;
		LDWI 	1H 			//0108 	2A01

		//;rf-out-key.C: 584: DelayMs(200);
		LCALL 	12DH 			//0109 	312D
		LCALL 	358H 			//010A 	3358

		//;rf-out-key.C: 585: PA0 = !PA0;
		LDWI 	1H 			//010B 	2A01
		LJUMP 	119H 			//010C 	3919

		//;rf-out-key.C: 586: }
		//;rf-out-key.C: 587: else if(lastKey == 4)
		LDWI 	4H 			//010D 	2A04
		XORWR 	50H,0 			//010E 	0450
		BTSS 	STATUS,2 		//010F 	1D03
		LJUMP 	11AH 			//0110 	391A

		//;rf-out-key.C: 588: {
		//;rf-out-key.C: 589: DelayMs(200);
		LDWI 	C8H 			//0111 	2AC8
		STR 	58H 			//0112 	01D8
		CLRR 	59H 			//0113 	0159
		LCALL 	358H 			//0114 	3358

		//;rf-out-key.C: 590: PA4 = !PA4;
		LDWI 	10H 			//0115 	2A10

		//;rf-out-key.C: 591: DelayMs(200);
		LCALL 	12DH 			//0116 	312D
		LCALL 	358H 			//0117 	3358

		//;rf-out-key.C: 592: PA4 = !PA4;
		LDWI 	10H 			//0118 	2A10
		XORWR 	5H,1 			//0119 	0485

		//;rf-out-key.C: 593: }
		//;rf-out-key.C: 595: LernRFblink = 0;
		BCR 	70H,4 			//011A 	1270

		//;rf-out-key.C: 596: conternotRF = 0;
		CLRR 	49H 			//011B 	0149
		CLRR 	4AH 			//011C 	014A

		//;rf-out-key.C: 600: if(lastLearnKey == 5)
		LDWI 	5H 			//011D 	2A05
		XORWR 	4BH,0 			//011E 	044B
		BTSS 	STATUS,2 		//011F 	1D03
		LJUMP 	126H 			//0120 	3926

		//;rf-out-key.C: 601: {
		//;rf-out-key.C: 602: lastLearnKey = 0;
		CLRR 	4BH 			//0121 	014B

		//;rf-out-key.C: 603: LernRFblink = 1;
		BSR 	70H,4 			//0122 	1A70

		//;rf-out-key.C: 604: LernRFKey = 0;
		CLRR 	4FH 			//0123 	014F

		//;rf-out-key.C: 605: LernRF = 0;
		BCR 	70H,3 			//0124 	11F0

		//;rf-out-key.C: 606: }
		LJUMP 	64H 			//0125 	3864

		//;rf-out-key.C: 607: else if(lastLearnKey != 0)
		LDR 	4BH,0 			//0126 	084B
		BTSC 	STATUS,2 		//0127 	1503
		LJUMP 	123H 			//0128 	3923

		//;rf-out-key.C: 608: {
		//;rf-out-key.C: 610: LernRFKey = lastLearnKey;
		LDR 	4BH,0 			//0129 	084B
		STR 	4FH 			//012A 	01CF

		//;rf-out-key.C: 611: LernRF = 1;
		BSR 	70H,3 			//012B 	19F0

		//;rf-out-key.C: 612: }
		LJUMP 	64H 			//012C 	3864

		//;rf-out-key.C: 613: else
		//;rf-out-key.C: 614: {
		//;rf-out-key.C: 616: LernRFKey = 0;
		XORWR 	5H,1 			//012D 	0485
		LDWI 	C8H 			//012E 	2AC8
		STR 	58H 			//012F 	01D8
		CLRR 	59H 			//0130 	0159
		RET		 					//0131 	0004

		//;rf-out-key.C: 84: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//0132 	168B
		BTSS 	INTCON,2 		//0133 	1D0B
		LJUMP 	192H 			//0134 	3992

		//;rf-out-key.C: 85: {
		//;rf-out-key.C: 86: TMR0 = 239;
		LDWI 	EFH 			//0135 	2AEF
		BCR 	STATUS,5 		//0136 	1283
		STR 	1H 			//0137 	0181

		//;rf-out-key.C: 87: T0IF = 0;
		BCR 	INTCON,2 		//0138 	110B

		//;rf-out-key.C: 89: if(LernRF == 1)
		BTSS 	70H,3 			//0139 	1DF0
		LJUMP 	149H 			//013A 	3949

		//;rf-out-key.C: 90: {
		//;rf-out-key.C: 91: conternotRF++;
		INCR	49H,1 			//013B 	09C9
		BTSC 	STATUS,2 		//013C 	1503
		INCR	4AH,1 			//013D 	09CA

		//;rf-out-key.C: 92: if(conternotRF >= 15000)
		LDWI 	3AH 			//013E 	2A3A
		SUBWR 	4AH,0 			//013F 	0C4A
		LDWI 	98H 			//0140 	2A98
		BTSC 	STATUS,2 		//0141 	1503
		SUBWR 	49H,0 			//0142 	0C49
		BTSS 	STATUS,0 		//0143 	1C03
		LJUMP 	149H 			//0144 	3949

		//;rf-out-key.C: 93: {
		//;rf-out-key.C: 94: conternotRF = 0;
		CLRR 	49H 			//0145 	0149
		CLRR 	4AH 			//0146 	014A

		//;rf-out-key.C: 95: LernRF = 0;
		BCR 	70H,3 			//0147 	11F0

		//;rf-out-key.C: 96: LernRFKey = 0;
		CLRR 	4FH 			//0148 	014F

		//;rf-out-key.C: 97: }
		//;rf-out-key.C: 98: }
		//;rf-out-key.C: 101: if(PA2 == 0)
		BTSC 	5H,2 			//0149 	1505
		LJUMP 	157H 			//014A 	3957

		//;rf-out-key.C: 102: {
		//;rf-out-key.C: 103: high_counter = 0;
		CLRR 	55H 			//014B 	0155

		//;rf-out-key.C: 104: if(pulse_counter < 250) pulse_counter++;
		LDWI 	FAH 			//014C 	2AFA
		SUBWR 	56H,0 			//014D 	0C56
		BTSS 	STATUS,0 		//014E 	1C03
		INCR	56H,1 			//014F 	09D6

		//;rf-out-key.C: 106: if(rx_state == 1)
		DECRSZ 	57H,0 		//0150 	0E57
		LJUMP 	189H 			//0151 	3989

		//;rf-out-key.C: 107: {
		//;rf-out-key.C: 108: rx_state = 2;
		LDWI 	2H 			//0152 	2A02
		STR 	57H 			//0153 	01D7

		//;rf-out-key.C: 109: pulse_counter = 1;
		LDWI 	1H 			//0154 	2A01
		STR 	56H 			//0155 	01D6
		LJUMP 	189H 			//0156 	3989

		//;rf-out-key.C: 112: else
		//;rf-out-key.C: 113: {
		//;rf-out-key.C: 114: if(high_counter < 250) high_counter++;
		LDWI 	FAH 			//0157 	2AFA
		SUBWR 	55H,0 			//0158 	0C55
		BTSS 	STATUS,0 		//0159 	1C03
		INCR	55H,1 			//015A 	09D5

		//;rf-out-key.C: 116: if(rx_state == 0)
		LDR 	57H,0 			//015B 	0857
		BTSS 	STATUS,2 		//015C 	1D03
		LJUMP 	169H 			//015D 	3969

		//;rf-out-key.C: 117: {
		//;rf-out-key.C: 118: if(pulse_counter >= 20 && pulse_counter <= 30)
		LDWI 	14H 			//015E 	2A14
		SUBWR 	56H,0 			//015F 	0C56
		BTSS 	STATUS,0 		//0160 	1C03
		LJUMP 	170H 			//0161 	3970
		LDWI 	1FH 			//0162 	2A1F
		SUBWR 	56H,0 			//0163 	0C56
		BTSC 	STATUS,0 		//0164 	1403
		LJUMP 	170H 			//0165 	3970

		//;rf-out-key.C: 119: {
		//;rf-out-key.C: 120: rx_state = 1;
		LDWI 	1H 			//0166 	2A01
		STR 	57H 			//0167 	01D7
		LJUMP 	170H 			//0168 	3970

		//;rf-out-key.C: 123: }
		//;rf-out-key.C: 121: }
		//;rf-out-key.C: 122: pulse_counter = 0;
		//;rf-out-key.C: 124: else if(rx_state == 1)
		DECRSZ 	57H,0 		//0169 	0E57
		LJUMP 	172H 			//016A 	3972

		//;rf-out-key.C: 125: {
		//;rf-out-key.C: 126: if(high_counter > 80)
		LDWI 	51H 			//016B 	2A51
		SUBWR 	55H,0 			//016C 	0C55
		BTSS 	STATUS,0 		//016D 	1C03
		LJUMP 	189H 			//016E 	3989

		//;rf-out-key.C: 127: {
		//;rf-out-key.C: 128: rx_state = 0;
		CLRR 	57H 			//016F 	0157

		//;rf-out-key.C: 129: pulse_counter = 0;
		CLRR 	56H 			//0170 	0156
		LJUMP 	189H 			//0171 	3989

		//;rf-out-key.C: 132: else if(rx_state == 2)
		LDWI 	2H 			//0172 	2A02
		XORWR 	57H,0 			//0173 	0457
		BTSS 	STATUS,2 		//0174 	1D03
		LJUMP 	17EH 			//0175 	397E

		//;rf-out-key.C: 133: {
		//;rf-out-key.C: 134: payload_val = pulse_counter;
		LDR 	56H,0 			//0176 	0856
		STR 	54H 			//0177 	01D4

		//;rf-out-key.C: 135: rx_state = 3;
		LDWI 	3H 			//0178 	2A03
		STR 	57H 			//0179 	01D7

		//;rf-out-key.C: 136: pulse_counter = 0;
		CLRR 	56H 			//017A 	0156

		//;rf-out-key.C: 137: high_counter = 1;
		LDWI 	1H 			//017B 	2A01
		STR 	55H 			//017C 	01D5

		//;rf-out-key.C: 138: }
		LJUMP 	189H 			//017D 	3989

		//;rf-out-key.C: 139: else if(rx_state == 3)
		LDWI 	3H 			//017E 	2A03
		XORWR 	57H,0 			//017F 	0457
		BTSS 	STATUS,2 		//0180 	1D03
		LJUMP 	189H 			//0181 	3989

		//;rf-out-key.C: 140: {
		//;rf-out-key.C: 141: if(high_counter >= 15)
		LDWI 	FH 			//0182 	2A0F
		SUBWR 	55H,0 			//0183 	0C55
		BTSS 	STATUS,0 		//0184 	1C03
		LJUMP 	189H 			//0185 	3989

		//;rf-out-key.C: 142: {
		//;rf-out-key.C: 143: frame_ready = 1;
		LDWI 	1H 			//0186 	2A01
		STR 	52H 			//0187 	01D2

		//;rf-out-key.C: 144: rx_state = 0;
		CLRR 	57H 			//0188 	0157

		//;rf-out-key.C: 145: }
		//;rf-out-key.C: 146: }
		//;rf-out-key.C: 147: }
		//;rf-out-key.C: 150: if(RxBusy == 1 && PA2 == 1 && high_counter >= 60)
		DECRSZ 	53H,0 		//0189 	0E53
		LJUMP 	192H 			//018A 	3992
		BTSS 	5H,2 			//018B 	1D05
		LJUMP 	192H 			//018C 	3992
		LDWI 	3CH 			//018D 	2A3C
		SUBWR 	55H,0 			//018E 	0C55
		BTSS 	STATUS,0 		//018F 	1C03
		LJUMP 	192H 			//0190 	3992

		//;rf-out-key.C: 151: {
		//;rf-out-key.C: 152: RxBusy = 0;
		CLRR 	53H 			//0191 	0153

		//;rf-out-key.C: 153: }
		//;rf-out-key.C: 154: }
		//;rf-out-key.C: 158: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//0192 	1A83
		BTSS 	CH,1 			//0193 	1C8C
		LJUMP 	213H 			//0194 	3A13
		BCR 	STATUS,5 		//0195 	1283
		BTSS 	CH,1 			//0196 	1C8C
		LJUMP 	213H 			//0197 	3A13

		//;rf-out-key.C: 159: {
		//;rf-out-key.C: 160: TMR2IF = 0;
		BCR 	CH,1 			//0198 	108C
		CLRWDT	 			//0199 	0001

		//;rf-out-key.C: 163: if(PA3 == 0)
		BCR 	STATUS,5 		//019A 	1283
		BTSC 	5H,3 			//019B 	1585
		LJUMP 	1A4H 			//019C 	39A4

		//;rf-out-key.C: 164: {
		//;rf-out-key.C: 165: if(Timedown < 250)
		LDWI 	FAH 			//019D 	2AFA
		SUBWR 	79H,0 			//019E 	0C79
		BTSC 	STATUS,0 		//019F 	1403
		LJUMP 	1A2H 			//01A0 	39A2

		//;rf-out-key.C: 166: {
		//;rf-out-key.C: 167: Timedown++;
		INCR	79H,1 			//01A1 	09F9

		//;rf-out-key.C: 168: }
		//;rf-out-key.C: 169: Frist = 1;
		BSR 	70H,2 			//01A2 	1970

		//;rf-out-key.C: 170: }
		LJUMP 	213H 			//01A3 	3A13

		//;rf-out-key.C: 171: else
		//;rf-out-key.C: 172: {
		//;rf-out-key.C: 174: if(Timedown >= 250)
		LDWI 	FAH 			//01A4 	2AFA
		SUBWR 	79H,0 			//01A5 	0C79
		BTSS 	STATUS,0 		//01A6 	1C03
		LJUMP 	1B1H 			//01A7 	39B1

		//;rf-out-key.C: 175: {
		//;rf-out-key.C: 176: Timedown = 0;
		CLRR 	79H 			//01A8 	0179

		//;rf-out-key.C: 177: Frist = 0;
		BCR 	70H,2 			//01A9 	1170

		//;rf-out-key.C: 178: Start = 0;
		BCR 	70H,5 			//01AA 	12F0

		//;rf-out-key.C: 179: Bit = 8;
		LDWI 	8H 			//01AB 	2A08
		STR 	4CH 			//01AC 	01CC

		//;rf-out-key.C: 180: Buffer = 0;
		CLRR 	4DH 			//01AD 	014D

		//;rf-out-key.C: 181: Count = 0;
		CLRR 	4EH 			//01AE 	014E

		//;rf-out-key.C: 182: Finish = 0;
		BCR 	70H,1 			//01AF 	10F0
		LJUMP 	213H 			//01B0 	3A13

		//;rf-out-key.C: 184: }
		//;rf-out-key.C: 187: if((Frist == 1) && (Finish == 0))
		BTSC 	70H,2 			//01B1 	1570
		BTSC 	70H,1 			//01B2 	14F0
		LJUMP 	212H 			//01B3 	3A12

		//;rf-out-key.C: 188: {
		//;rf-out-key.C: 190: if(Timedown >= 180 && Timedown <= 245)
		LDWI 	B4H 			//01B4 	2AB4
		SUBWR 	79H,0 			//01B5 	0C79
		BTSS 	STATUS,0 		//01B6 	1C03
		LJUMP 	1C1H 			//01B7 	39C1
		LDWI 	F6H 			//01B8 	2AF6
		SUBWR 	79H,0 			//01B9 	0C79
		BTSC 	STATUS,0 		//01BA 	1403
		LJUMP 	1C1H 			//01BB 	39C1

		//;rf-out-key.C: 191: {
		//;rf-out-key.C: 192: Start = 1;
		BSR 	70H,5 			//01BC 	1AF0

		//;rf-out-key.C: 193: Bit = 8;
		LDWI 	8H 			//01BD 	2A08
		STR 	4CH 			//01BE 	01CC

		//;rf-out-key.C: 194: Count = 0;
		CLRR 	4EH 			//01BF 	014E

		//;rf-out-key.C: 196: }
		LJUMP 	210H 			//01C0 	3A10

		//;rf-out-key.C: 198: else if(Start == 1)
		BTSS 	70H,5 			//01C1 	1EF0
		LJUMP 	211H 			//01C2 	3A11

		//;rf-out-key.C: 199: {
		//;rf-out-key.C: 200: Bit--;
		DECR 	4CH,1 			//01C3 	0DCC

		//;rf-out-key.C: 203: if(Timedown >= 14 && Timedown <= 32)
		LDWI 	EH 			//01C4 	2A0E
		SUBWR 	79H,0 			//01C5 	0C79
		BTSS 	STATUS,0 		//01C6 	1C03
		LJUMP 	1D0H 			//01C7 	39D0
		LDWI 	21H 			//01C8 	2A21
		SUBWR 	79H,0 			//01C9 	0C79
		BTSC 	STATUS,0 		//01CA 	1403
		LJUMP 	1D0H 			//01CB 	39D0

		//;rf-out-key.C: 204: {
		//;rf-out-key.C: 205: Buffer = Buffer << 1;
		BCR 	STATUS,0 		//01CC 	1003
		RLR 	4DH,0 			//01CD 	054D
		STR 	4DH 			//01CE 	01CD

		//;rf-out-key.C: 206: }
		LJUMP 	1E0H 			//01CF 	39E0

		//;rf-out-key.C: 208: else if(Timedown >= 4 && Timedown <= 13)
		LDWI 	4H 			//01D0 	2A04
		SUBWR 	79H,0 			//01D1 	0C79
		BTSS 	STATUS,0 		//01D2 	1C03
		LJUMP 	1DBH 			//01D3 	39DB
		LDWI 	EH 			//01D4 	2A0E
		SUBWR 	79H,0 			//01D5 	0C79
		BTSC 	STATUS,0 		//01D6 	1403
		LJUMP 	1DBH 			//01D7 	39DB

		//;rf-out-key.C: 209: {
		//;rf-out-key.C: 210: Buffer = (Buffer << 1) | 1;
		BSR 	STATUS,0 		//01D8 	1803
		RLR 	4DH,1 			//01D9 	05CD

		//;rf-out-key.C: 211: }
		LJUMP 	1E0H 			//01DA 	39E0

		//;rf-out-key.C: 213: else
		//;rf-out-key.C: 214: {
		//;rf-out-key.C: 215: Count = 0;
		CLRR 	4EH 			//01DB 	014E

		//;rf-out-key.C: 216: Bit = 8;
		LDWI 	8H 			//01DC 	2A08
		STR 	4CH 			//01DD 	01CC

		//;rf-out-key.C: 217: Buffer = 0;
		CLRR 	4DH 			//01DE 	014D

		//;rf-out-key.C: 218: Start = 0;
		BCR 	70H,5 			//01DF 	12F0

		//;rf-out-key.C: 219: }
		//;rf-out-key.C: 222: if(Bit == 0)
		LDR 	4CH,0 			//01E0 	084C
		BTSS 	STATUS,2 		//01E1 	1D03
		LJUMP 	211H 			//01E2 	3A11

		//;rf-out-key.C: 223: {
		//;rf-out-key.C: 224: Bit = 8;
		LDWI 	8H 			//01E3 	2A08
		STR 	4CH 			//01E4 	01CC

		//;rf-out-key.C: 225: Data[Count] = RFData[Count];
		LDR 	4EH,0 			//01E5 	084E
		ADDWI 	40H 			//01E6 	2740
		STR 	FSR 			//01E7 	0184
		BCR 	STATUS,7 		//01E8 	1383
		LDR 	INDF,0 			//01E9 	0800
		STR 	72H 			//01EA 	01F2
		LDR 	4EH,0 			//01EB 	084E
		ADDWI 	46H 			//01EC 	2746
		STR 	FSR 			//01ED 	0184
		LDR 	72H,0 			//01EE 	0872
		STR 	INDF 			//01EF 	0180

		//;rf-out-key.C: 226: RFData[Count] = Buffer;
		LDR 	4EH,0 			//01F0 	084E
		ADDWI 	40H 			//01F1 	2740
		STR 	FSR 			//01F2 	0184
		LDR 	4DH,0 			//01F3 	084D
		STR 	INDF 			//01F4 	0180

		//;rf-out-key.C: 227: Count++;
		INCR	4EH,1 			//01F5 	09CE

		//;rf-out-key.C: 230: if(Count >= 3)
		LDWI 	3H 			//01F6 	2A03
		SUBWR 	4EH,0 			//01F7 	0C4E
		BTSS 	STATUS,0 		//01F8 	1C03
		LJUMP 	210H 			//01F9 	3A10

		//;rf-out-key.C: 231: {
		//;rf-out-key.C: 232: Count = 0;
		CLRR 	4EH 			//01FA 	014E

		//;rf-out-key.C: 233: Start = 0;
		BCR 	70H,5 			//01FB 	12F0

		//;rf-out-key.C: 236: if(Data[0] == RFData[0] &&
		//;rf-out-key.C: 237: Data[1] == RFData[1] &&
		//;rf-out-key.C: 238: Data[2] == RFData[2])
		LDR 	46H,0 			//01FC 	0846
		XORWR 	40H,0 			//01FD 	0440
		BTSS 	STATUS,2 		//01FE 	1D03
		LJUMP 	210H 			//01FF 	3A10
		LDR 	47H,0 			//0200 	0847
		XORWR 	41H,0 			//0201 	0441
		BTSS 	STATUS,2 		//0202 	1D03
		LJUMP 	210H 			//0203 	3A10
		LDR 	48H,0 			//0204 	0848
		XORWR 	42H,0 			//0205 	0442
		BTSS 	STATUS,2 		//0206 	1D03
		LJUMP 	210H 			//0207 	3A10

		//;rf-out-key.C: 239: {
		//;rf-out-key.C: 240: DataM[0] = RFData[0];
		LDR 	40H,0 			//0208 	0840
		STR 	43H 			//0209 	01C3

		//;rf-out-key.C: 241: DataM[1] = RFData[1];
		LDR 	41H,0 			//020A 	0841
		STR 	44H 			//020B 	01C4

		//;rf-out-key.C: 242: DataM[2] = RFData[2];
		LDR 	42H,0 			//020C 	0842
		STR 	45H 			//020D 	01C5

		//;rf-out-key.C: 243: Finish = 1;
		BSR 	70H,1 			//020E 	18F0

		//;rf-out-key.C: 244: Lock = 1;
		BSR 	70H,0 			//020F 	1870

		//;rf-out-key.C: 195: Buffer = 0;
		CLRR 	4DH 			//0210 	014D

		//;rf-out-key.C: 248: }
		//;rf-out-key.C: 249: }
		//;rf-out-key.C: 251: Frist = 0;
		BCR 	70H,2 			//0211 	1170

		//;rf-out-key.C: 252: }
		//;rf-out-key.C: 254: Timedown = 0;
		CLRR 	79H 			//0212 	0179
		LDR 	75H,0 			//0213 	0875
		STR 	PCLATH 			//0214 	018A
		LDR 	74H,0 			//0215 	0874
		STR 	FSR 			//0216 	0184
		SWAPR 	73H,0 			//0217 	0773
		STR 	STATUS 			//0218 	0183
		SWAPR 	7EH,1 			//0219 	07FE
		SWAPR 	7EH,0 			//021A 	077E
		RETI		 			//021B 	0009

		//;rf-out-key.C: 419: unsigned char val = payload_val;
		LDR 	54H,0 			//021C 	0854
		STR 	5DH 			//021D 	01DD

		//;rf-out-key.C: 420: payload_val = 0;
		CLRR 	54H 			//021E 	0154

		//;rf-out-key.C: 422: if(RxBusy == 1) return;
		DECRSZ 	53H,0 		//021F 	0E53
		LJUMP 	222H 			//0220 	3A22
		RET		 					//0221 	0004

		//;rf-out-key.C: 423: RxBusy = 1;
		LDWI 	1H 			//0222 	2A01
		STR 	53H 			//0223 	01D3

		//;rf-out-key.C: 426: if(val >= 120 && val <= 140)
		LDWI 	78H 			//0224 	2A78
		SUBWR 	5DH,0 			//0225 	0C5D
		BTSS 	STATUS,0 		//0226 	1C03
		LJUMP 	242H 			//0227 	3A42
		LDWI 	8DH 			//0228 	2A8D
		SUBWR 	5DH,0 			//0229 	0C5D
		BTSC 	STATUS,0 		//022A 	1403
		LJUMP 	242H 			//022B 	3A42

		//;rf-out-key.C: 427: {
		//;rf-out-key.C: 428: if((lastKey >= 1) && (lastKey <= 4))
		LDR 	50H,0 			//022C 	0850
		BTSC 	STATUS,2 		//022D 	1503
		RET		 					//022E 	0004
		LDWI 	5H 			//022F 	2A05
		SUBWR 	50H,0 			//0230 	0C50
		BTSC 	STATUS,0 		//0231 	1403
		RET		 					//0232 	0004

		//;rf-out-key.C: 429: {
		//;rf-out-key.C: 432: if(lastLearnKey == lastKey)
		LDR 	4BH,0 			//0233 	084B
		XORWR 	50H,0 			//0234 	0450
		BTSS 	STATUS,2 		//0235 	1D03
		LJUMP 	240H 			//0236 	3A40

		//;rf-out-key.C: 433: {
		//;rf-out-key.C: 434: Clear_Key_Remotes(lastKey);
		LDR 	50H,0 			//0237 	0850
		LCALL 	375H 			//0238 	3375

		//;rf-out-key.C: 437: LernRF = 0;
		BCR 	70H,3 			//0239 	11F0

		//;rf-out-key.C: 438: LernRFKey = 0;
		BCR 	STATUS,5 		//023A 	1283
		CLRR 	4FH 			//023B 	014F

		//;rf-out-key.C: 441: lastLearnKey = 5;
		LDWI 	5H 			//023C 	2A05
		STR 	4BH 			//023D 	01CB

		//;rf-out-key.C: 444: LernRFblink = 1;
		BSR 	70H,4 			//023E 	1A70

		//;rf-out-key.C: 445: }
		RET		 					//023F 	0004

		//;rf-out-key.C: 446: else
		//;rf-out-key.C: 447: {
		//;rf-out-key.C: 449: lastLearnKey = lastKey;
		LDR 	50H,0 			//0240 	0850
		LJUMP 	23DH 			//0241 	3A3D

		//;rf-out-key.C: 455: else if(val >= 10 && val <= 20 && LernRFKey != 1)
		LDWI 	AH 			//0242 	2A0A
		SUBWR 	5DH,0 			//0243 	0C5D
		BTSS 	STATUS,0 		//0244 	1C03
		LJUMP 	25BH 			//0245 	3A5B
		LDWI 	15H 			//0246 	2A15
		SUBWR 	5DH,0 			//0247 	0C5D
		BTSC 	STATUS,0 		//0248 	1403
		LJUMP 	25BH 			//0249 	3A5B
		DECR 	4FH,0 			//024A 	0D4F
		BTSC 	STATUS,2 		//024B 	1503
		LJUMP 	25BH 			//024C 	3A5B

		//;rf-out-key.C: 456: {
		//;rf-out-key.C: 457: state1 = !state1;
		LDWI 	8H 			//024D 	2A08
		XORWR 	78H,1 			//024E 	04F8

		//;rf-out-key.C: 458: eerom = 1;
		LDWI 	1H 			//024F 	2A01
		STR 	51H 			//0250 	01D1

		//;rf-out-key.C: 459: PA5 = state1;
		BTSS 	78H,3 			//0251 	1DF8
		LJUMP 	256H 			//0252 	3A56
		BCR 	STATUS,5 		//0253 	1283
		BSR 	5H,5 			//0254 	1A85
		LJUMP 	258H 			//0255 	3A58
		BCR 	STATUS,5 		//0256 	1283
		BCR 	5H,5 			//0257 	1285

		//;rf-out-key.C: 460: lastKey = 1;
		LDWI 	1H 			//0258 	2A01
		STR 	50H 			//0259 	01D0

		//;rf-out-key.C: 461: }
		RET		 					//025A 	0004

		//;rf-out-key.C: 463: else if(val >= 30 && val <= 45 && LernRFKey != 2)
		LDWI 	1EH 			//025B 	2A1E
		SUBWR 	5DH,0 			//025C 	0C5D
		BTSS 	STATUS,0 		//025D 	1C03
		LJUMP 	275H 			//025E 	3A75
		LDWI 	2EH 			//025F 	2A2E
		SUBWR 	5DH,0 			//0260 	0C5D
		BTSC 	STATUS,0 		//0261 	1403
		LJUMP 	275H 			//0262 	3A75
		LDWI 	2H 			//0263 	2A02
		XORWR 	4FH,0 			//0264 	044F
		BTSC 	STATUS,2 		//0265 	1503
		LJUMP 	275H 			//0266 	3A75

		//;rf-out-key.C: 464: {
		//;rf-out-key.C: 465: state2 = !state2;
		LDWI 	4H 			//0267 	2A04
		XORWR 	78H,1 			//0268 	04F8

		//;rf-out-key.C: 466: eerom = 2;
		LDWI 	2H 			//0269 	2A02
		STR 	51H 			//026A 	01D1

		//;rf-out-key.C: 467: PA1 = state2;
		BTSS 	78H,2 			//026B 	1D78
		LJUMP 	270H 			//026C 	3A70
		BCR 	STATUS,5 		//026D 	1283
		BSR 	5H,1 			//026E 	1885
		LJUMP 	272H 			//026F 	3A72
		BCR 	STATUS,5 		//0270 	1283
		BCR 	5H,1 			//0271 	1085

		//;rf-out-key.C: 468: lastKey = 2;
		LDWI 	2H 			//0272 	2A02
		STR 	50H 			//0273 	01D0

		//;rf-out-key.C: 469: }
		RET		 					//0274 	0004

		//;rf-out-key.C: 471: else if(val >= 50 && val <= 70 && LernRFKey != 3)
		LDWI 	32H 			//0275 	2A32
		SUBWR 	5DH,0 			//0276 	0C5D
		BTSS 	STATUS,0 		//0277 	1C03
		LJUMP 	28FH 			//0278 	3A8F
		LDWI 	47H 			//0279 	2A47
		SUBWR 	5DH,0 			//027A 	0C5D
		BTSC 	STATUS,0 		//027B 	1403
		LJUMP 	28FH 			//027C 	3A8F
		LDWI 	3H 			//027D 	2A03
		XORWR 	4FH,0 			//027E 	044F
		BTSC 	STATUS,2 		//027F 	1503
		LJUMP 	28FH 			//0280 	3A8F

		//;rf-out-key.C: 472: {
		//;rf-out-key.C: 473: state3 = !state3;
		LDWI 	2H 			//0281 	2A02
		XORWR 	78H,1 			//0282 	04F8

		//;rf-out-key.C: 474: eerom = 3;
		LDWI 	3H 			//0283 	2A03
		STR 	51H 			//0284 	01D1

		//;rf-out-key.C: 475: PA0 = state3;
		BTSS 	78H,1 			//0285 	1CF8
		LJUMP 	28AH 			//0286 	3A8A
		BCR 	STATUS,5 		//0287 	1283
		BSR 	5H,0 			//0288 	1805
		LJUMP 	28CH 			//0289 	3A8C
		BCR 	STATUS,5 		//028A 	1283
		BCR 	5H,0 			//028B 	1005

		//;rf-out-key.C: 476: lastKey = 3;
		LDWI 	3H 			//028C 	2A03
		STR 	50H 			//028D 	01D0

		//;rf-out-key.C: 477: }
		RET		 					//028E 	0004

		//;rf-out-key.C: 479: else if(val >= 75 && val <= 95 && LernRFKey != 4)
		LDWI 	4BH 			//028F 	2A4B
		SUBWR 	5DH,0 			//0290 	0C5D
		BTSS 	STATUS,0 		//0291 	1C03
		RET		 					//0292 	0004
		LDWI 	60H 			//0293 	2A60
		SUBWR 	5DH,0 			//0294 	0C5D
		BTSC 	STATUS,0 		//0295 	1403
		RET		 					//0296 	0004
		LDWI 	4H 			//0297 	2A04
		XORWR 	4FH,0 			//0298 	044F
		BTSC 	STATUS,2 		//0299 	1503
		RET		 					//029A 	0004

		//;rf-out-key.C: 480: {
		//;rf-out-key.C: 481: state4 = !state4;
		LDWI 	1H 			//029B 	2A01
		XORWR 	78H,1 			//029C 	04F8

		//;rf-out-key.C: 482: eerom = 4;
		LDWI 	4H 			//029D 	2A04
		STR 	51H 			//029E 	01D1

		//;rf-out-key.C: 483: PA4 = state4;
		BTSS 	78H,0 			//029F 	1C78
		LJUMP 	2A4H 			//02A0 	3AA4
		BCR 	STATUS,5 		//02A1 	1283
		BSR 	5H,4 			//02A2 	1A05
		LJUMP 	2A6H 			//02A3 	3AA6
		BCR 	STATUS,5 		//02A4 	1283
		BCR 	5H,4 			//02A5 	1205

		//;rf-out-key.C: 484: lastKey = 4;
		LDWI 	4H 			//02A6 	2A04
		STR 	50H 			//02A7 	01D0
		RET		 					//02A8 	0004
		STR 	61H 			//02A9 	01E1

		//;rf-out-key.C: 320: unsigned char r;
		//;rf-out-key.C: 321: unsigned char k_idx;
		//;rf-out-key.C: 322: unsigned char base_addr;
		//;rf-out-key.C: 323: unsigned char fifo_ptr_addr;
		//;rf-out-key.C: 324: unsigned char current_ptr;
		//;rf-out-key.C: 325: unsigned char target_addr;
		//;rf-out-key.C: 327: if((key_num < 1) || (key_num > 4))
		LDR 	61H,0 			//02AA 	0861
		BTSC 	STATUS,2 		//02AB 	1503
		RET		 					//02AC 	0004
		LDWI 	5H 			//02AD 	2A05
		SUBWR 	61H,0 			//02AE 	0C61
		BTSC 	STATUS,0 		//02AF 	1403
		RET		 					//02B0 	0004

		//;rf-out-key.C: 330: k_idx = key_num - 1;
		LDR 	61H,0 			//02B1 	0861
		ADDWI 	FFH 			//02B2 	27FF
		STR 	5CH 			//02B3 	01DC

		//;rf-out-key.C: 333: for(r = 0; r < 5; r++)
		CLRR 	5FH 			//02B4 	015F

		//;rf-out-key.C: 334: {
		//;rf-out-key.C: 335: base_addr = (k_idx * 5 * 3) + (r * 3);
		LDWI 	FH 			//02B5 	2A0F
		STR 	76H 			//02B6 	01F6
		LDR 	5CH,0 			//02B7 	085C
		LCALL 	3AFH 			//02B8 	33AF
		STR 	5AH 			//02B9 	01DA
		LDR 	5FH,0 			//02BA 	085F
		ADDWR 	5FH,0 			//02BB 	0B5F
		ADDWR 	5FH,0 			//02BC 	0B5F
		ADDWR 	5AH,0 			//02BD 	0B5A
		STR 	5DH 			//02BE 	01DD

		//;rf-out-key.C: 337: if((DataM[0] == EEPROMread(base_addr)) &&
		//;rf-out-key.C: 338: (DataM[1] == EEPROMread(base_addr + 1)) &&
		//;rf-out-key.C: 339: (DataM[2] == EEPROMread(base_addr + 2)))
		LCALL 	3E4H 			//02BF 	33E4
		BCR 	STATUS,5 		//02C0 	1283
		XORWR 	43H,0 			//02C1 	0443
		BTSS 	STATUS,2 		//02C2 	1D03
		LJUMP 	2D2H 			//02C3 	3AD2
		LDR 	5DH,0 			//02C4 	085D
		ADDWI 	1H 			//02C5 	2701
		LCALL 	3E4H 			//02C6 	33E4
		BCR 	STATUS,5 		//02C7 	1283
		XORWR 	44H,0 			//02C8 	0444
		BTSS 	STATUS,2 		//02C9 	1D03
		LJUMP 	2D2H 			//02CA 	3AD2
		LDR 	5DH,0 			//02CB 	085D
		ADDWI 	2H 			//02CC 	2702
		LCALL 	3E4H 			//02CD 	33E4
		BCR 	STATUS,5 		//02CE 	1283
		XORWR 	45H,0 			//02CF 	0445
		BTSC 	STATUS,2 		//02D0 	1503
		RET		 					//02D1 	0004
		LDWI 	5H 			//02D2 	2A05
		INCR	5FH,1 			//02D3 	09DF
		SUBWR 	5FH,0 			//02D4 	0C5F
		BTSS 	STATUS,0 		//02D5 	1C03
		LJUMP 	2B5H 			//02D6 	3AB5

		//;rf-out-key.C: 342: }
		//;rf-out-key.C: 343: }
		//;rf-out-key.C: 346: fifo_ptr_addr = 60 + k_idx;
		LDR 	5CH,0 			//02D7 	085C
		ADDWI 	3CH 			//02D8 	273C
		STR 	5BH 			//02D9 	01DB

		//;rf-out-key.C: 347: current_ptr = EEPROMread(fifo_ptr_addr);
		LCALL 	3E4H 			//02DA 	33E4
		BCR 	STATUS,5 		//02DB 	1283
		STR 	60H 			//02DC 	01E0

		//;rf-out-key.C: 349: if(current_ptr >= 5)
		LDWI 	5H 			//02DD 	2A05
		SUBWR 	60H,0 			//02DE 	0C60
		BTSC 	STATUS,0 		//02DF 	1403

		//;rf-out-key.C: 350: current_ptr = 0;
		CLRR 	60H 			//02E0 	0160

		//;rf-out-key.C: 352: target_addr = (k_idx * 5 * 3) + (current_ptr * 3);
		LDWI 	FH 			//02E1 	2A0F
		STR 	76H 			//02E2 	01F6
		LDR 	5CH,0 			//02E3 	085C
		LCALL 	3AFH 			//02E4 	33AF
		STR 	5AH 			//02E5 	01DA
		LDR 	60H,0 			//02E6 	0860
		ADDWR 	60H,0 			//02E7 	0B60
		ADDWR 	60H,0 			//02E8 	0B60
		ADDWR 	5AH,0 			//02E9 	0B5A
		STR 	5EH 			//02EA 	01DE

		//;rf-out-key.C: 355: EEPROMwrite(target_addr, DataM[0]);
		LDR 	43H,0 			//02EB 	0843
		STR 	76H 			//02EC 	01F6
		LDR 	5EH,0 			//02ED 	085E
		LCALL 	38CH 			//02EE 	338C

		//;rf-out-key.C: 356: EEPROMwrite(target_addr + 1, DataM[1]);
		BCR 	STATUS,5 		//02EF 	1283
		LDR 	44H,0 			//02F0 	0844
		STR 	76H 			//02F1 	01F6
		LDR 	5EH,0 			//02F2 	085E
		ADDWI 	1H 			//02F3 	2701
		LCALL 	38CH 			//02F4 	338C

		//;rf-out-key.C: 357: EEPROMwrite(target_addr + 2, DataM[2]);
		BCR 	STATUS,5 		//02F5 	1283
		LDR 	45H,0 			//02F6 	0845
		STR 	76H 			//02F7 	01F6
		LDR 	5EH,0 			//02F8 	085E
		ADDWI 	2H 			//02F9 	2702
		LCALL 	38CH 			//02FA 	338C
		LDWI 	5H 			//02FB 	2A05

		//;rf-out-key.C: 360: current_ptr++;
		BCR 	STATUS,5 		//02FC 	1283
		INCR	60H,1 			//02FD 	09E0

		//;rf-out-key.C: 361: if(current_ptr >= 5)
		SUBWR 	60H,0 			//02FE 	0C60
		BTSC 	STATUS,0 		//02FF 	1403

		//;rf-out-key.C: 362: current_ptr = 0;
		CLRR 	60H 			//0300 	0160

		//;rf-out-key.C: 364: EEPROMwrite(fifo_ptr_addr, current_ptr);
		LDR 	60H,0 			//0301 	0860
		STR 	76H 			//0302 	01F6
		LDR 	5BH,0 			//0303 	085B
		LCALL 	38CH 			//0304 	338C

		//;rf-out-key.C: 399: if(key_num == 1) O1 = 1;
		BCR 	STATUS,5 		//0305 	1283
		DECRSZ 	61H,0 		//0306 	0E61
		LJUMP 	30AH 			//0307 	3B0A
		BSR 	71H,1 			//0308 	18F1
		LJUMP 	317H 			//0309 	3B17

		//;rf-out-key.C: 400: else if(key_num == 2) O2 = 1;
		LDWI 	2H 			//030A 	2A02
		XORWR 	61H,0 			//030B 	0461
		BTSS 	STATUS,2 		//030C 	1D03
		LJUMP 	310H 			//030D 	3B10
		BSR 	71H,0 			//030E 	1871
		LJUMP 	317H 			//030F 	3B17

		//;rf-out-key.C: 401: else if(key_num == 3) O3 = 1;
		LDWI 	3H 			//0310 	2A03
		XORWR 	61H,0 			//0311 	0461
		BTSS 	STATUS,2 		//0312 	1D03
		LJUMP 	316H 			//0313 	3B16
		BSR 	70H,7 			//0314 	1BF0
		LJUMP 	317H 			//0315 	3B17

		//;rf-out-key.C: 402: else O4 = 1;
		BSR 	70H,6 			//0316 	1B70

		//;rf-out-key.C: 408: lastLearnKey = 0;
		CLRR 	4BH 			//0317 	014B

		//;rf-out-key.C: 410: LernRFKey = 0;
		CLRR 	4FH 			//0318 	014F

		//;rf-out-key.C: 411: LernRF = 0;
		BCR 	70H,3 			//0319 	11F0
		RET		 					//031A 	0004

		//;rf-out-key.C: 293: unsigned char k, r, base_addr;
		//;rf-out-key.C: 295: for(k = 0; k < 4; k++)
		CLRR 	5CH 			//031B 	015C

		//;rf-out-key.C: 296: {
		//;rf-out-key.C: 297: for(r = 0; r < 5; r++)
		CLRR 	5BH 			//031C 	015B

		//;rf-out-key.C: 298: {
		//;rf-out-key.C: 299: base_addr = (k * 5 * 3) + (r * 3);
		LDWI 	FH 			//031D 	2A0F
		STR 	76H 			//031E 	01F6
		LDR 	5CH,0 			//031F 	085C
		LCALL 	3AFH 			//0320 	33AF
		STR 	77H 			//0321 	01F7
		LDR 	5BH,0 			//0322 	085B
		ADDWR 	5BH,0 			//0323 	0B5B
		ADDWR 	5BH,0 			//0324 	0B5B
		ADDWR 	77H,0 			//0325 	0B77
		STR 	5AH 			//0326 	01DA

		//;rf-out-key.C: 301: if(DataM[0] == EEPROMread(base_addr) &&
		//;rf-out-key.C: 302: DataM[1] == EEPROMread(base_addr + 1) &&
		//;rf-out-key.C: 303: DataM[2] == EEPROMread(base_addr + 2))
		LCALL 	3E4H 			//0327 	33E4
		BCR 	STATUS,5 		//0328 	1283
		XORWR 	43H,0 			//0329 	0443
		BTSS 	STATUS,2 		//032A 	1D03
		LJUMP 	34DH 			//032B 	3B4D
		LDR 	5AH,0 			//032C 	085A
		ADDWI 	1H 			//032D 	2701
		LCALL 	3E4H 			//032E 	33E4
		BCR 	STATUS,5 		//032F 	1283
		XORWR 	44H,0 			//0330 	0444
		BTSS 	STATUS,2 		//0331 	1D03
		LJUMP 	34DH 			//0332 	3B4D
		LDR 	5AH,0 			//0333 	085A
		ADDWI 	2H 			//0334 	2702
		LCALL 	3E4H 			//0335 	33E4
		BCR 	STATUS,5 		//0336 	1283
		XORWR 	45H,0 			//0337 	0445
		BTSS 	STATUS,2 		//0338 	1D03
		LJUMP 	34DH 			//0339 	3B4D

		//;rf-out-key.C: 304: {
		//;rf-out-key.C: 305: if(k == 0) O1 = 1;
		LDR 	5CH,0 			//033A 	085C
		BTSS 	STATUS,2 		//033B 	1D03
		LJUMP 	33FH 			//033C 	3B3F
		BSR 	71H,1 			//033D 	18F1
		LJUMP 	34DH 			//033E 	3B4D

		//;rf-out-key.C: 306: else if(k == 1) O2 = 1;
		DECRSZ 	5CH,0 		//033F 	0E5C
		LJUMP 	343H 			//0340 	3B43
		BSR 	71H,0 			//0341 	1871
		LJUMP 	34DH 			//0342 	3B4D

		//;rf-out-key.C: 307: else if(k == 2) O3 = 1;
		LDWI 	2H 			//0343 	2A02
		XORWR 	5CH,0 			//0344 	045C
		BTSS 	STATUS,2 		//0345 	1D03
		LJUMP 	349H 			//0346 	3B49
		BSR 	70H,7 			//0347 	1BF0
		LJUMP 	34DH 			//0348 	3B4D

		//;rf-out-key.C: 308: else if(k == 3) O4 = 1;
		LDWI 	3H 			//0349 	2A03
		XORWR 	5CH,0 			//034A 	045C
		BTSC 	STATUS,2 		//034B 	1503
		BSR 	70H,6 			//034C 	1B70
		LDWI 	5H 			//034D 	2A05
		INCR	5BH,1 			//034E 	09DB
		SUBWR 	5BH,0 			//034F 	0C5B
		BTSS 	STATUS,0 		//0350 	1C03
		LJUMP 	31DH 			//0351 	3B1D
		LDWI 	4H 			//0352 	2A04
		INCR	5CH,1 			//0353 	09DC
		SUBWR 	5CH,0 			//0354 	0C5C
		BTSC 	STATUS,0 		//0355 	1403
		RET		 					//0356 	0004
		LJUMP 	31CH 			//0357 	3B1C

		//;rf-out-key.C: 690: unsigned int a, b;
		//;rf-out-key.C: 691: for(a = 0; a < Time; a++)
		CLRR 	5AH 			//0358 	015A
		CLRR 	5BH 			//0359 	015B
		LDR 	59H,0 			//035A 	0859
		SUBWR 	5BH,0 			//035B 	0C5B
		BTSS 	STATUS,2 		//035C 	1D03
		LJUMP 	360H 			//035D 	3B60
		LDR 	58H,0 			//035E 	0858
		SUBWR 	5AH,0 			//035F 	0C5A
		BTSC 	STATUS,0 		//0360 	1403
		RET		 					//0361 	0004

		//;rf-out-key.C: 692: {
		//;rf-out-key.C: 693: for(b = 0; b < 5; b++)
		CLRR 	5CH 			//0362 	015C
		CLRR 	5DH 			//0363 	015D

		//;rf-out-key.C: 694: {
		//;rf-out-key.C: 695: DelayUs(197);
		LDWI 	C5H 			//0364 	2AC5
		LCALL 	3C9H 			//0365 	33C9
		BCR 	STATUS,5 		//0366 	1283
		INCR	5CH,1 			//0367 	09DC
		BTSC 	STATUS,2 		//0368 	1503
		INCR	5DH,1 			//0369 	09DD
		LDWI 	0H 			//036A 	2A00
		SUBWR 	5DH,0 			//036B 	0C5D
		LDWI 	5H 			//036C 	2A05
		BTSC 	STATUS,2 		//036D 	1503
		SUBWR 	5CH,0 			//036E 	0C5C
		BTSS 	STATUS,0 		//036F 	1C03
		LJUMP 	364H 			//0370 	3B64
		INCR	5AH,1 			//0371 	09DA
		BTSC 	STATUS,2 		//0372 	1503
		INCR	5BH,1 			//0373 	09DB
		LJUMP 	35AH 			//0374 	3B5A
		STR 	5BH 			//0375 	01DB

		//;rf-out-key.C: 269: unsigned char i;
		//;rf-out-key.C: 270: unsigned char addr;
		//;rf-out-key.C: 277: addr = (key_num - 1) * 15;
		LDWI 	FH 			//0376 	2A0F
		STR 	76H 			//0377 	01F6
		LDR 	5BH,0 			//0378 	085B
		ADDWI 	FFH 			//0379 	27FF
		LCALL 	3AFH 			//037A 	33AF
		STR 	5AH 			//037B 	01DA

		//;rf-out-key.C: 279: for(i = 0; i < 15; i++)
		CLRR 	5CH 			//037C 	015C

		//;rf-out-key.C: 280: {
		//;rf-out-key.C: 281: EEPROMwrite(addr++, 0xFF);
		LDWI 	FFH 			//037D 	2AFF
		STR 	76H 			//037E 	01F6
		LDR 	5AH,0 			//037F 	085A
		LCALL 	38CH 			//0380 	338C
		LDWI 	FH 			//0381 	2A0F
		BCR 	STATUS,5 		//0382 	1283
		INCR	5AH,1 			//0383 	09DA
		INCR	5CH,1 			//0384 	09DC
		SUBWR 	5CH,0 			//0385 	0C5C
		BTSS 	STATUS,0 		//0386 	1C03
		LJUMP 	37DH 			//0387 	3B7D

		//;rf-out-key.C: 282: }
		//;rf-out-key.C: 285: EEPROMwrite(59 + key_num, 0);
		CLRR 	76H 			//0388 	0176
		LDR 	5BH,0 			//0389 	085B
		ADDWI 	3BH 			//038A 	273B
		LJUMP 	38CH 			//038B 	3B8C
		STR 	77H 			//038C 	01F7

		//;rf-out-key.C: 667: GIE = 0;
		BCR 	INTCON,7 		//038D 	138B

		//;rf-out-key.C: 668: while(GIE);
		BTSC 	INTCON,7 		//038E 	178B
		LJUMP 	38EH 			//038F 	3B8E

		//;rf-out-key.C: 669: EEADR = EEAddr;
		LDR 	77H,0 			//0390 	0877
		BSR 	STATUS,5 		//0391 	1A83
		STR 	1BH 			//0392 	019B

		//;rf-out-key.C: 670: EEDAT = Data;
		LDR 	76H,0 			//0393 	0876
		STR 	1AH 			//0394 	019A

		//;rf-out-key.C: 671: EEIF = 0;
		BCR 	STATUS,5 		//0395 	1283
		BCR 	CH,7 			//0396 	138C

		//;rf-out-key.C: 672: EECON1 |= 0x34;
		LDWI 	34H 			//0397 	2A34
		BSR 	STATUS,5 		//0398 	1A83
		IORWR 	1CH,1 			//0399 	039C

		//;rf-out-key.C: 673: WR = 1;
		BSR 	1DH,0 			//039A 	181D

		//;rf-out-key.C: 674: while(WR);
		BTSC 	1DH,0 			//039B 	141D
		LJUMP 	39BH 			//039C 	3B9B

		//;rf-out-key.C: 675: GIE = 1;
		BSR 	INTCON,7 		//039D 	1B8B
		RET		 					//039E 	0004

		//;rf-out-key.C: 630: OSCCON = 0B01110000;
		LDWI 	70H 			//039F 	2A70
		BSR 	STATUS,5 		//03A0 	1A83
		STR 	FH 			//03A1 	018F

		//;rf-out-key.C: 631: INTCON = 0;
		CLRR 	INTCON 			//03A2 	010B

		//;rf-out-key.C: 632: OPTION = 0B00001000;
		LDWI 	8H 			//03A3 	2A08
		STR 	1H 			//03A4 	0181

		//;rf-out-key.C: 633: PORTA = 0B00000100;
		LDWI 	4H 			//03A5 	2A04
		BCR 	STATUS,5 		//03A6 	1283
		STR 	5H 			//03A7 	0185

		//;rf-out-key.C: 634: TRISA = 0B00001100;
		LDWI 	CH 			//03A8 	2A0C
		BSR 	STATUS,5 		//03A9 	1A83
		STR 	5H 			//03AA 	0185

		//;rf-out-key.C: 635: WPUA = 0B00001100;
		STR 	15H 			//03AB 	0195

		//;rf-out-key.C: 636: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//03AC 	1283
		CLRR 	1BH 			//03AD 	011B
		RET		 					//03AE 	0004
		STR 	59H 			//03AF 	01D9
		CLRR 	58H 			//03B0 	0158
		LDR 	76H,0 			//03B1 	0876
		BTSC 	59H,0 			//03B2 	1459
		ADDWR 	58H,1 			//03B3 	0BD8
		BCR 	STATUS,0 		//03B4 	1003
		RLR 	76H,1 			//03B5 	05F6
		BCR 	STATUS,0 		//03B6 	1003
		RRR	59H,1 			//03B7 	06D9
		LDR 	59H,0 			//03B8 	0859
		BTSS 	STATUS,2 		//03B9 	1D03
		LJUMP 	3B1H 			//03BA 	3BB1
		LDR 	58H,0 			//03BB 	0858
		RET		 					//03BC 	0004

		//;rf-out-key.C: 641: T2CON = 0B00000001;
		LDWI 	1H 			//03BD 	2A01
		STR 	12H 			//03BE 	0192

		//;rf-out-key.C: 642: TMR2 = 0;
		CLRR 	11H 			//03BF 	0111

		//;rf-out-key.C: 643: PR2 = 50;
		LDWI 	32H 			//03C0 	2A32
		BSR 	STATUS,5 		//03C1 	1A83
		STR 	12H 			//03C2 	0192

		//;rf-out-key.C: 644: TMR2IF = 0;
		BCR 	STATUS,5 		//03C3 	1283
		BCR 	CH,1 			//03C4 	108C

		//;rf-out-key.C: 645: TMR2ON = 1;
		BSR 	12H,2 			//03C5 	1912

		//;rf-out-key.C: 646: PEIE = 1;
		BSR 	INTCON,6 		//03C6 	1B0B

		//;rf-out-key.C: 647: GIE = 1;
		BSR 	INTCON,7 		//03C7 	1B8B
		RET		 					//03C8 	0004
		STR 	76H 			//03C9 	01F6

		//;rf-out-key.C: 680: unsigned char a;
		//;rf-out-key.C: 681: for(a = 0; a < Time; a++)
		CLRR 	77H 			//03CA 	0177
		LDR 	76H,0 			//03CB 	0876
		SUBWR 	77H,0 			//03CC 	0C77
		BTSC 	STATUS,0 		//03CD 	1403
		RET		 					//03CE 	0004

		//;rf-out-key.C: 682: {
		//;rf-out-key.C: 683: __nop();
		NOP		 					//03CF 	0000
		CLRWDT	 			//03D0 	0001
		INCR	77H,1 			//03D1 	09F7
		LJUMP 	3CBH 			//03D2 	3BCB

		//;rf-out-key.C: 652: OPTION = 0B00000110;
		LDWI 	6H 			//03D3 	2A06
		BSR 	STATUS,5 		//03D4 	1A83
		STR 	1H 			//03D5 	0181

		//;rf-out-key.C: 653: TMR0 = 239;
		LDWI 	EFH 			//03D6 	2AEF
		BCR 	STATUS,5 		//03D7 	1283
		STR 	1H 			//03D8 	0181

		//;rf-out-key.C: 654: T0IF = 0;
		BCR 	INTCON,2 		//03D9 	110B

		//;rf-out-key.C: 655: T0IE = 1;
		BSR 	INTCON,5 		//03DA 	1A8B
		RET		 					//03DB 	0004
		CLRWDT	 			//03DC 	0001
		CLRR 	INDF 			//03DD 	0100
		INCR	FSR,1 			//03DE 	0984
		XORWR 	FSR,0 			//03DF 	0404
		BTSC 	STATUS,2 		//03E0 	1503
		RETW 	0H 			//03E1 	2100
		XORWR 	FSR,0 			//03E2 	0404
		LJUMP 	3DDH 			//03E3 	3BDD
		STR 	76H 			//03E4 	01F6

		//;rf-out-key.C: 660: EEADR = EEAddr;
		BSR 	STATUS,5 		//03E5 	1A83
		STR 	1BH 			//03E6 	019B

		//;rf-out-key.C: 661: RD = 1;
		BSR 	1CH,0 			//03E7 	181C

		//;rf-out-key.C: 662: return EEDAT;
		LDR 	1AH,0 			//03E8 	081A
		RET		 					//03E9 	0004
			END
