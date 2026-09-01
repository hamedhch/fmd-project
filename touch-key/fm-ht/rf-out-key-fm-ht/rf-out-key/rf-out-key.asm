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
		LCALL 	3DEH 			//0014 	33DE
		CLRR 	STATUS 			//0015 	0103
		LJUMP 	17H 			//0016 	3817

		//;rf-out-key.C: 496: POWER_INITIAL();
		LCALL 	3A1H 			//0017 	33A1

		//;rf-out-key.C: 497: TIMER2_INITIAL();
		LCALL 	3BFH 			//0018 	33BF

		//;rf-out-key.C: 498: TIMER0_INITIAL();
		LCALL 	3D5H 			//0019 	33D5

		//;rf-out-key.C: 499: TMR2IE = 1;
		BSR 	STATUS,5 		//001A 	1A83
		BSR 	CH,1 			//001B 	188C

		//;rf-out-key.C: 501: Finish = 0;
		BCR 	70H,1 			//001C 	10F0

		//;rf-out-key.C: 502: Start = 0;
		BCR 	70H,5 			//001D 	12F0

		//;rf-out-key.C: 503: lastLearnKey = 0;
		BCR 	STATUS,5 		//001E 	1283
		CLRR 	4BH 			//001F 	014B

		//;rf-out-key.C: 506: state1 = EEPROMread(70);
		LDWI 	46H 			//0020 	2A46
		LCALL 	3E6H 			//0021 	33E6
		BCR 	STATUS,5 		//0022 	1283
		STR 	62H 			//0023 	01E2
		RRR	62H,0 			//0024 	0662
		BTSS 	STATUS,0 		//0025 	1C03
		LJUMP 	29H 			//0026 	3829
		BSR 	78H,3 			//0027 	19F8
		LJUMP 	2AH 			//0028 	382A
		BCR 	78H,3 			//0029 	11F8

		//;rf-out-key.C: 507: state2 = EEPROMread(71);
		LDWI 	47H 			//002A 	2A47
		LCALL 	3E6H 			//002B 	33E6
		BCR 	STATUS,5 		//002C 	1283
		STR 	62H 			//002D 	01E2
		RRR	62H,0 			//002E 	0662
		BTSS 	STATUS,0 		//002F 	1C03
		LJUMP 	33H 			//0030 	3833
		BSR 	78H,2 			//0031 	1978
		LJUMP 	34H 			//0032 	3834
		BCR 	78H,2 			//0033 	1178

		//;rf-out-key.C: 508: state3 = EEPROMread(72);
		LDWI 	48H 			//0034 	2A48
		LCALL 	3E6H 			//0035 	33E6
		BCR 	STATUS,5 		//0036 	1283
		STR 	62H 			//0037 	01E2
		RRR	62H,0 			//0038 	0662
		BTSS 	STATUS,0 		//0039 	1C03
		LJUMP 	3DH 			//003A 	383D
		BSR 	78H,1 			//003B 	18F8
		LJUMP 	3EH 			//003C 	383E
		BCR 	78H,1 			//003D 	10F8

		//;rf-out-key.C: 509: state4 = EEPROMread(73);
		LDWI 	49H 			//003E 	2A49
		LCALL 	3E6H 			//003F 	33E6
		BCR 	STATUS,5 		//0040 	1283
		STR 	62H 			//0041 	01E2
		RRR	62H,0 			//0042 	0662
		BTSS 	STATUS,0 		//0043 	1C03
		LJUMP 	47H 			//0044 	3847
		BSR 	78H,0 			//0045 	1878
		LJUMP 	48H 			//0046 	3848
		BCR 	78H,0 			//0047 	1078

		//;rf-out-key.C: 511: PA5 = state1;
		BTSS 	78H,3 			//0048 	1DF8
		LJUMP 	4DH 			//0049 	384D
		BCR 	STATUS,5 		//004A 	1283
		BSR 	5H,5 			//004B 	1A85
		LJUMP 	4FH 			//004C 	384F
		BCR 	STATUS,5 		//004D 	1283
		BCR 	5H,5 			//004E 	1285

		//;rf-out-key.C: 512: PA1 = state2;
		BTSS 	78H,2 			//004F 	1D78
		LJUMP 	54H 			//0050 	3854
		BCR 	STATUS,5 		//0051 	1283
		BSR 	5H,1 			//0052 	1885
		LJUMP 	56H 			//0053 	3856
		BCR 	STATUS,5 		//0054 	1283
		BCR 	5H,1 			//0055 	1085

		//;rf-out-key.C: 513: PA0 = state3;
		BTSS 	78H,1 			//0056 	1CF8
		LJUMP 	5BH 			//0057 	385B
		BCR 	STATUS,5 		//0058 	1283
		BSR 	5H,0 			//0059 	1805
		LJUMP 	5DH 			//005A 	385D
		BCR 	STATUS,5 		//005B 	1283
		BCR 	5H,0 			//005C 	1005

		//;rf-out-key.C: 514: PA4 = state4;
		BTSS 	78H,0 			//005D 	1C78
		LJUMP 	62H 			//005E 	3862
		BCR 	STATUS,5 		//005F 	1283
		BSR 	5H,4 			//0060 	1A05
		LJUMP 	64H 			//0061 	3864
		BCR 	STATUS,5 		//0062 	1283
		BCR 	5H,4 			//0063 	1205

		//;rf-out-key.C: 516: while(1)
		CLRWDT	 			//0064 	0001

		//;rf-out-key.C: 521: if(frame_ready == 1)
		BCR 	STATUS,5 		//0065 	1283
		DECRSZ 	52H,0 		//0066 	0E52
		LJUMP 	6AH 			//0067 	386A

		//;rf-out-key.C: 522: {
		//;rf-out-key.C: 523: frame_ready = 0;
		CLRR 	52H 			//0068 	0152

		//;rf-out-key.C: 524: Process_Touch_Payload();
		LCALL 	21EH 			//0069 	321E

		//;rf-out-key.C: 525: }
		//;rf-out-key.C: 529: if(Lock == 1)
		BTSS 	70H,0 			//006A 	1C70
		LJUMP 	7AH 			//006B 	387A

		//;rf-out-key.C: 530: {
		//;rf-out-key.C: 531: Lock = 0;
		BCR 	70H,0 			//006C 	1070

		//;rf-out-key.C: 533: if(LernRF == 1)
		BTSS 	70H,3 			//006D 	1DF0
		LJUMP 	79H 			//006E 	3879

		//;rf-out-key.C: 534: {
		//;rf-out-key.C: 535: if((LernRFKey >= 1) && (LernRFKey <= 4))
		LDR 	4FH,0 			//006F 	084F
		BTSC 	STATUS,2 		//0070 	1503
		LJUMP 	7AH 			//0071 	387A
		LDWI 	5H 			//0072 	2A05
		SUBWR 	4FH,0 			//0073 	0C4F
		BTSC 	STATUS,0 		//0074 	1403
		LJUMP 	7AH 			//0075 	387A

		//;rf-out-key.C: 536: {
		//;rf-out-key.C: 537: Learn_Current_Remote(LernRFKey);
		LDR 	4FH,0 			//0076 	084F
		LCALL 	2ABH 			//0077 	32AB
		LJUMP 	7AH 			//0078 	387A

		//;rf-out-key.C: 540: else
		//;rf-out-key.C: 541: {
		//;rf-out-key.C: 542: Check_RF_Match();
		LCALL 	31DH 			//0079 	331D

		//;rf-out-key.C: 543: }
		//;rf-out-key.C: 544: }
		//;rf-out-key.C: 549: if(O1 == 1) { O1 = 0; state1 = !state1; eerom = 1; PA5 = state1; las
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

		//;rf-out-key.C: 550: if(O2 == 1) { O2 = 0; state2 = !state2; eerom = 2; PA1 = state2; las
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

		//;rf-out-key.C: 551: if(O3 == 1) { O3 = 0; state3 = !state3; eerom = 3; PA0 = state3; las
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

		//;rf-out-key.C: 552: if(O4 == 1) { O4 = 0; state4 = !state4; eerom = 4; PA4 = state4; las
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

		//;rf-out-key.C: 555: if(eerom != 0)
		LDR 	51H,0 			//00BA 	0851
		BTSC 	STATUS,2 		//00BB 	1503
		LJUMP 	E6H 			//00BC 	38E6

		//;rf-out-key.C: 556: {
		//;rf-out-key.C: 557: if(eerom == 1) EEPROMwrite(70, state1);
		DECR 	51H,0 			//00BD 	0D51
		BTSS 	STATUS,2 		//00BE 	1D03
		LJUMP 	C6H 			//00BF 	38C6
		LDWI 	0H 			//00C0 	2A00
		BTSC 	78H,3 			//00C1 	15F8
		LDWI 	1H 			//00C2 	2A01
		STR 	76H 			//00C3 	01F6
		LDWI 	46H 			//00C4 	2A46
		LJUMP 	E3H 			//00C5 	38E3

		//;rf-out-key.C: 558: else if(eerom == 2) EEPROMwrite(71, state2);
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

		//;rf-out-key.C: 559: else if(eerom == 3) EEPROMwrite(72, state3);
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

		//;rf-out-key.C: 560: else if(eerom == 4) EEPROMwrite(73, state4);
		LDWI 	4H 			//00DA 	2A04
		XORWR 	51H,0 			//00DB 	0451
		BTSS 	STATUS,2 		//00DC 	1D03
		LJUMP 	E4H 			//00DD 	38E4
		LDWI 	0H 			//00DE 	2A00
		BTSC 	78H,0 			//00DF 	1478
		LDWI 	1H 			//00E0 	2A01
		STR 	76H 			//00E1 	01F6
		LDWI 	49H 			//00E2 	2A49
		LCALL 	38EH 			//00E3 	338E

		//;rf-out-key.C: 561: eerom = 0;
		BCR 	STATUS,5 		//00E4 	1283
		CLRR 	51H 			//00E5 	0151

		//;rf-out-key.C: 562: }
		//;rf-out-key.C: 565: if(LernRFblink == 1)
		BTSS 	70H,4 			//00E6 	1E70
		LJUMP 	64H 			//00E7 	3864

		//;rf-out-key.C: 566: {
		//;rf-out-key.C: 568: if(lastKey == 1)
		DECRSZ 	50H,0 		//00E8 	0E50
		LJUMP 	F3H 			//00E9 	38F3

		//;rf-out-key.C: 569: {
		//;rf-out-key.C: 570: DelayMs(200);
		LDWI 	C8H 			//00EA 	2AC8
		STR 	58H 			//00EB 	01D8
		CLRR 	59H 			//00EC 	0159
		LCALL 	35AH 			//00ED 	335A

		//;rf-out-key.C: 571: PA5 = !PA5;
		LDWI 	20H 			//00EE 	2A20

		//;rf-out-key.C: 572: DelayMs(200);
		LCALL 	12DH 			//00EF 	312D
		LCALL 	35AH 			//00F0 	335A

		//;rf-out-key.C: 573: PA5 = !PA5;
		LDWI 	20H 			//00F1 	2A20
		LJUMP 	119H 			//00F2 	3919

		//;rf-out-key.C: 574: }
		//;rf-out-key.C: 575: else if(lastKey == 2)
		LDWI 	2H 			//00F3 	2A02
		XORWR 	50H,0 			//00F4 	0450
		BTSS 	STATUS,2 		//00F5 	1D03
		LJUMP 	100H 			//00F6 	3900

		//;rf-out-key.C: 576: {
		//;rf-out-key.C: 577: DelayMs(200);
		LDWI 	C8H 			//00F7 	2AC8
		STR 	58H 			//00F8 	01D8
		CLRR 	59H 			//00F9 	0159
		LCALL 	35AH 			//00FA 	335A

		//;rf-out-key.C: 578: PA1 = !PA1;
		LDWI 	2H 			//00FB 	2A02

		//;rf-out-key.C: 579: DelayMs(200);
		LCALL 	12DH 			//00FC 	312D
		LCALL 	35AH 			//00FD 	335A

		//;rf-out-key.C: 580: PA1 = !PA1;
		LDWI 	2H 			//00FE 	2A02
		LJUMP 	119H 			//00FF 	3919

		//;rf-out-key.C: 581: }
		//;rf-out-key.C: 582: else if(lastKey == 3)
		LDWI 	3H 			//0100 	2A03
		XORWR 	50H,0 			//0101 	0450
		BTSS 	STATUS,2 		//0102 	1D03
		LJUMP 	10DH 			//0103 	390D

		//;rf-out-key.C: 583: {
		//;rf-out-key.C: 584: DelayMs(200);
		LDWI 	C8H 			//0104 	2AC8
		STR 	58H 			//0105 	01D8
		CLRR 	59H 			//0106 	0159
		LCALL 	35AH 			//0107 	335A

		//;rf-out-key.C: 585: PA0 = !PA0;
		LDWI 	1H 			//0108 	2A01

		//;rf-out-key.C: 586: DelayMs(200);
		LCALL 	12DH 			//0109 	312D
		LCALL 	35AH 			//010A 	335A

		//;rf-out-key.C: 587: PA0 = !PA0;
		LDWI 	1H 			//010B 	2A01
		LJUMP 	119H 			//010C 	3919

		//;rf-out-key.C: 588: }
		//;rf-out-key.C: 589: else if(lastKey == 4)
		LDWI 	4H 			//010D 	2A04
		XORWR 	50H,0 			//010E 	0450
		BTSS 	STATUS,2 		//010F 	1D03
		LJUMP 	11AH 			//0110 	391A

		//;rf-out-key.C: 590: {
		//;rf-out-key.C: 591: DelayMs(200);
		LDWI 	C8H 			//0111 	2AC8
		STR 	58H 			//0112 	01D8
		CLRR 	59H 			//0113 	0159
		LCALL 	35AH 			//0114 	335A

		//;rf-out-key.C: 592: PA4 = !PA4;
		LDWI 	10H 			//0115 	2A10

		//;rf-out-key.C: 593: DelayMs(200);
		LCALL 	12DH 			//0116 	312D
		LCALL 	35AH 			//0117 	335A

		//;rf-out-key.C: 594: PA4 = !PA4;
		LDWI 	10H 			//0118 	2A10
		XORWR 	5H,1 			//0119 	0485

		//;rf-out-key.C: 595: }
		//;rf-out-key.C: 597: LernRFblink = 0;
		BCR 	70H,4 			//011A 	1270

		//;rf-out-key.C: 598: conternotRF = 0;
		CLRR 	49H 			//011B 	0149
		CLRR 	4AH 			//011C 	014A

		//;rf-out-key.C: 602: if(lastLearnKey == 5)
		LDWI 	5H 			//011D 	2A05
		XORWR 	4BH,0 			//011E 	044B
		BTSS 	STATUS,2 		//011F 	1D03
		LJUMP 	126H 			//0120 	3926

		//;rf-out-key.C: 603: {
		//;rf-out-key.C: 604: lastLearnKey = 0;
		CLRR 	4BH 			//0121 	014B

		//;rf-out-key.C: 605: LernRFblink = 1;
		BSR 	70H,4 			//0122 	1A70

		//;rf-out-key.C: 606: LernRFKey = 0;
		CLRR 	4FH 			//0123 	014F

		//;rf-out-key.C: 607: LernRF = 0;
		BCR 	70H,3 			//0124 	11F0

		//;rf-out-key.C: 608: }
		LJUMP 	64H 			//0125 	3864

		//;rf-out-key.C: 609: else if(lastLearnKey != 0)
		LDR 	4BH,0 			//0126 	084B
		BTSC 	STATUS,2 		//0127 	1503
		LJUMP 	123H 			//0128 	3923

		//;rf-out-key.C: 610: {
		//;rf-out-key.C: 612: LernRFKey = lastLearnKey;
		LDR 	4BH,0 			//0129 	084B
		STR 	4FH 			//012A 	01CF

		//;rf-out-key.C: 613: LernRF = 1;
		BSR 	70H,3 			//012B 	19F0

		//;rf-out-key.C: 614: }
		LJUMP 	64H 			//012C 	3864

		//;rf-out-key.C: 615: else
		//;rf-out-key.C: 616: {
		//;rf-out-key.C: 618: LernRFKey = 0;
		XORWR 	5H,1 			//012D 	0485
		LDWI 	C8H 			//012E 	2AC8
		STR 	58H 			//012F 	01D8
		CLRR 	59H 			//0130 	0159
		RET		 					//0131 	0004

		//;rf-out-key.C: 84: if(T0IE && T0IF)
		BTSC 	INTCON,5 		//0132 	168B
		BTSS 	INTCON,2 		//0133 	1D0B
		LJUMP 	194H 			//0134 	3994

		//;rf-out-key.C: 85: {
		//;rf-out-key.C: 86: TMR0 = 239;
		LDWI 	EFH 			//0135 	2AEF
		BCR 	STATUS,5 		//0136 	1283
		STR 	1H 			//0137 	0181

		//;rf-out-key.C: 87: T0IF = 0;
		BCR 	INTCON,2 		//0138 	110B

		//;rf-out-key.C: 89: if(LernRF == 1)
		BTSS 	70H,3 			//0139 	1DF0
		LJUMP 	14BH 			//013A 	394B

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
		LJUMP 	14BH 			//0144 	394B

		//;rf-out-key.C: 93: {
		//;rf-out-key.C: 94: conternotRF = 0;
		CLRR 	49H 			//0145 	0149
		CLRR 	4AH 			//0146 	014A

		//;rf-out-key.C: 95: LernRF = 0;
		BCR 	70H,3 			//0147 	11F0

		//;rf-out-key.C: 96: LernRFKey = 0;
		CLRR 	4FH 			//0148 	014F

		//;rf-out-key.C: 97: lastLearnKey = 0;
		CLRR 	4BH 			//0149 	014B

		//;rf-out-key.C: 98: LernRFblink = 0;
		BCR 	70H,4 			//014A 	1270

		//;rf-out-key.C: 99: }
		//;rf-out-key.C: 100: }
		//;rf-out-key.C: 103: if(PA2 == 0)
		BTSC 	5H,2 			//014B 	1505
		LJUMP 	159H 			//014C 	3959

		//;rf-out-key.C: 104: {
		//;rf-out-key.C: 105: high_counter = 0;
		CLRR 	55H 			//014D 	0155

		//;rf-out-key.C: 106: if(pulse_counter < 250) pulse_counter++;
		LDWI 	FAH 			//014E 	2AFA
		SUBWR 	56H,0 			//014F 	0C56
		BTSS 	STATUS,0 		//0150 	1C03
		INCR	56H,1 			//0151 	09D6

		//;rf-out-key.C: 108: if(rx_state == 1)
		DECRSZ 	57H,0 		//0152 	0E57
		LJUMP 	18BH 			//0153 	398B

		//;rf-out-key.C: 109: {
		//;rf-out-key.C: 110: rx_state = 2;
		LDWI 	2H 			//0154 	2A02
		STR 	57H 			//0155 	01D7

		//;rf-out-key.C: 111: pulse_counter = 1;
		LDWI 	1H 			//0156 	2A01
		STR 	56H 			//0157 	01D6
		LJUMP 	18BH 			//0158 	398B

		//;rf-out-key.C: 114: else
		//;rf-out-key.C: 115: {
		//;rf-out-key.C: 116: if(high_counter < 250) high_counter++;
		LDWI 	FAH 			//0159 	2AFA
		SUBWR 	55H,0 			//015A 	0C55
		BTSS 	STATUS,0 		//015B 	1C03
		INCR	55H,1 			//015C 	09D5

		//;rf-out-key.C: 118: if(rx_state == 0)
		LDR 	57H,0 			//015D 	0857
		BTSS 	STATUS,2 		//015E 	1D03
		LJUMP 	16BH 			//015F 	396B

		//;rf-out-key.C: 119: {
		//;rf-out-key.C: 120: if(pulse_counter >= 20 && pulse_counter <= 30)
		LDWI 	14H 			//0160 	2A14
		SUBWR 	56H,0 			//0161 	0C56
		BTSS 	STATUS,0 		//0162 	1C03
		LJUMP 	172H 			//0163 	3972
		LDWI 	1FH 			//0164 	2A1F
		SUBWR 	56H,0 			//0165 	0C56
		BTSC 	STATUS,0 		//0166 	1403
		LJUMP 	172H 			//0167 	3972

		//;rf-out-key.C: 121: {
		//;rf-out-key.C: 122: rx_state = 1;
		LDWI 	1H 			//0168 	2A01
		STR 	57H 			//0169 	01D7
		LJUMP 	172H 			//016A 	3972

		//;rf-out-key.C: 125: }
		//;rf-out-key.C: 123: }
		//;rf-out-key.C: 124: pulse_counter = 0;
		//;rf-out-key.C: 126: else if(rx_state == 1)
		DECRSZ 	57H,0 		//016B 	0E57
		LJUMP 	174H 			//016C 	3974

		//;rf-out-key.C: 127: {
		//;rf-out-key.C: 128: if(high_counter > 80)
		LDWI 	51H 			//016D 	2A51
		SUBWR 	55H,0 			//016E 	0C55
		BTSS 	STATUS,0 		//016F 	1C03
		LJUMP 	18BH 			//0170 	398B

		//;rf-out-key.C: 129: {
		//;rf-out-key.C: 130: rx_state = 0;
		CLRR 	57H 			//0171 	0157

		//;rf-out-key.C: 131: pulse_counter = 0;
		CLRR 	56H 			//0172 	0156
		LJUMP 	18BH 			//0173 	398B

		//;rf-out-key.C: 134: else if(rx_state == 2)
		LDWI 	2H 			//0174 	2A02
		XORWR 	57H,0 			//0175 	0457
		BTSS 	STATUS,2 		//0176 	1D03
		LJUMP 	180H 			//0177 	3980

		//;rf-out-key.C: 135: {
		//;rf-out-key.C: 136: payload_val = pulse_counter;
		LDR 	56H,0 			//0178 	0856
		STR 	54H 			//0179 	01D4

		//;rf-out-key.C: 137: rx_state = 3;
		LDWI 	3H 			//017A 	2A03
		STR 	57H 			//017B 	01D7

		//;rf-out-key.C: 138: pulse_counter = 0;
		CLRR 	56H 			//017C 	0156

		//;rf-out-key.C: 139: high_counter = 1;
		LDWI 	1H 			//017D 	2A01
		STR 	55H 			//017E 	01D5

		//;rf-out-key.C: 140: }
		LJUMP 	18BH 			//017F 	398B

		//;rf-out-key.C: 141: else if(rx_state == 3)
		LDWI 	3H 			//0180 	2A03
		XORWR 	57H,0 			//0181 	0457
		BTSS 	STATUS,2 		//0182 	1D03
		LJUMP 	18BH 			//0183 	398B

		//;rf-out-key.C: 142: {
		//;rf-out-key.C: 143: if(high_counter >= 15)
		LDWI 	FH 			//0184 	2A0F
		SUBWR 	55H,0 			//0185 	0C55
		BTSS 	STATUS,0 		//0186 	1C03
		LJUMP 	18BH 			//0187 	398B

		//;rf-out-key.C: 144: {
		//;rf-out-key.C: 145: frame_ready = 1;
		LDWI 	1H 			//0188 	2A01
		STR 	52H 			//0189 	01D2

		//;rf-out-key.C: 146: rx_state = 0;
		CLRR 	57H 			//018A 	0157

		//;rf-out-key.C: 147: }
		//;rf-out-key.C: 148: }
		//;rf-out-key.C: 149: }
		//;rf-out-key.C: 152: if(RxBusy == 1 && PA2 == 1 && high_counter >= 60)
		DECRSZ 	53H,0 		//018B 	0E53
		LJUMP 	194H 			//018C 	3994
		BTSS 	5H,2 			//018D 	1D05
		LJUMP 	194H 			//018E 	3994
		LDWI 	3CH 			//018F 	2A3C
		SUBWR 	55H,0 			//0190 	0C55
		BTSS 	STATUS,0 		//0191 	1C03
		LJUMP 	194H 			//0192 	3994

		//;rf-out-key.C: 153: {
		//;rf-out-key.C: 154: RxBusy = 0;
		CLRR 	53H 			//0193 	0153

		//;rf-out-key.C: 155: }
		//;rf-out-key.C: 156: }
		//;rf-out-key.C: 160: if(TMR2IE && TMR2IF)
		BSR 	STATUS,5 		//0194 	1A83
		BTSS 	CH,1 			//0195 	1C8C
		LJUMP 	215H 			//0196 	3A15
		BCR 	STATUS,5 		//0197 	1283
		BTSS 	CH,1 			//0198 	1C8C
		LJUMP 	215H 			//0199 	3A15

		//;rf-out-key.C: 161: {
		//;rf-out-key.C: 162: TMR2IF = 0;
		BCR 	CH,1 			//019A 	108C
		CLRWDT	 			//019B 	0001

		//;rf-out-key.C: 165: if(PA3 == 0)
		BCR 	STATUS,5 		//019C 	1283
		BTSC 	5H,3 			//019D 	1585
		LJUMP 	1A6H 			//019E 	39A6

		//;rf-out-key.C: 166: {
		//;rf-out-key.C: 167: if(Timedown < 250)
		LDWI 	FAH 			//019F 	2AFA
		SUBWR 	79H,0 			//01A0 	0C79
		BTSC 	STATUS,0 		//01A1 	1403
		LJUMP 	1A4H 			//01A2 	39A4

		//;rf-out-key.C: 168: {
		//;rf-out-key.C: 169: Timedown++;
		INCR	79H,1 			//01A3 	09F9

		//;rf-out-key.C: 170: }
		//;rf-out-key.C: 171: Frist = 1;
		BSR 	70H,2 			//01A4 	1970

		//;rf-out-key.C: 172: }
		LJUMP 	215H 			//01A5 	3A15

		//;rf-out-key.C: 173: else
		//;rf-out-key.C: 174: {
		//;rf-out-key.C: 176: if(Timedown >= 250)
		LDWI 	FAH 			//01A6 	2AFA
		SUBWR 	79H,0 			//01A7 	0C79
		BTSS 	STATUS,0 		//01A8 	1C03
		LJUMP 	1B3H 			//01A9 	39B3

		//;rf-out-key.C: 177: {
		//;rf-out-key.C: 178: Timedown = 0;
		CLRR 	79H 			//01AA 	0179

		//;rf-out-key.C: 179: Frist = 0;
		BCR 	70H,2 			//01AB 	1170

		//;rf-out-key.C: 180: Start = 0;
		BCR 	70H,5 			//01AC 	12F0

		//;rf-out-key.C: 181: Bit = 8;
		LDWI 	8H 			//01AD 	2A08
		STR 	4CH 			//01AE 	01CC

		//;rf-out-key.C: 182: Buffer = 0;
		CLRR 	4DH 			//01AF 	014D

		//;rf-out-key.C: 183: Count = 0;
		CLRR 	4EH 			//01B0 	014E

		//;rf-out-key.C: 184: Finish = 0;
		BCR 	70H,1 			//01B1 	10F0
		LJUMP 	215H 			//01B2 	3A15

		//;rf-out-key.C: 186: }
		//;rf-out-key.C: 189: if((Frist == 1) && (Finish == 0))
		BTSC 	70H,2 			//01B3 	1570
		BTSC 	70H,1 			//01B4 	14F0
		LJUMP 	214H 			//01B5 	3A14

		//;rf-out-key.C: 190: {
		//;rf-out-key.C: 192: if(Timedown >= 180 && Timedown <= 245)
		LDWI 	B4H 			//01B6 	2AB4
		SUBWR 	79H,0 			//01B7 	0C79
		BTSS 	STATUS,0 		//01B8 	1C03
		LJUMP 	1C3H 			//01B9 	39C3
		LDWI 	F6H 			//01BA 	2AF6
		SUBWR 	79H,0 			//01BB 	0C79
		BTSC 	STATUS,0 		//01BC 	1403
		LJUMP 	1C3H 			//01BD 	39C3

		//;rf-out-key.C: 193: {
		//;rf-out-key.C: 194: Start = 1;
		BSR 	70H,5 			//01BE 	1AF0

		//;rf-out-key.C: 195: Bit = 8;
		LDWI 	8H 			//01BF 	2A08
		STR 	4CH 			//01C0 	01CC

		//;rf-out-key.C: 196: Count = 0;
		CLRR 	4EH 			//01C1 	014E

		//;rf-out-key.C: 198: }
		LJUMP 	212H 			//01C2 	3A12

		//;rf-out-key.C: 200: else if(Start == 1)
		BTSS 	70H,5 			//01C3 	1EF0
		LJUMP 	213H 			//01C4 	3A13

		//;rf-out-key.C: 201: {
		//;rf-out-key.C: 202: Bit--;
		DECR 	4CH,1 			//01C5 	0DCC

		//;rf-out-key.C: 205: if(Timedown >= 14 && Timedown <= 32)
		LDWI 	EH 			//01C6 	2A0E
		SUBWR 	79H,0 			//01C7 	0C79
		BTSS 	STATUS,0 		//01C8 	1C03
		LJUMP 	1D2H 			//01C9 	39D2
		LDWI 	21H 			//01CA 	2A21
		SUBWR 	79H,0 			//01CB 	0C79
		BTSC 	STATUS,0 		//01CC 	1403
		LJUMP 	1D2H 			//01CD 	39D2

		//;rf-out-key.C: 206: {
		//;rf-out-key.C: 207: Buffer = Buffer << 1;
		BCR 	STATUS,0 		//01CE 	1003
		RLR 	4DH,0 			//01CF 	054D
		STR 	4DH 			//01D0 	01CD

		//;rf-out-key.C: 208: }
		LJUMP 	1E2H 			//01D1 	39E2

		//;rf-out-key.C: 210: else if(Timedown >= 4 && Timedown <= 13)
		LDWI 	4H 			//01D2 	2A04
		SUBWR 	79H,0 			//01D3 	0C79
		BTSS 	STATUS,0 		//01D4 	1C03
		LJUMP 	1DDH 			//01D5 	39DD
		LDWI 	EH 			//01D6 	2A0E
		SUBWR 	79H,0 			//01D7 	0C79
		BTSC 	STATUS,0 		//01D8 	1403
		LJUMP 	1DDH 			//01D9 	39DD

		//;rf-out-key.C: 211: {
		//;rf-out-key.C: 212: Buffer = (Buffer << 1) | 1;
		BSR 	STATUS,0 		//01DA 	1803
		RLR 	4DH,1 			//01DB 	05CD

		//;rf-out-key.C: 213: }
		LJUMP 	1E2H 			//01DC 	39E2

		//;rf-out-key.C: 215: else
		//;rf-out-key.C: 216: {
		//;rf-out-key.C: 217: Count = 0;
		CLRR 	4EH 			//01DD 	014E

		//;rf-out-key.C: 218: Bit = 8;
		LDWI 	8H 			//01DE 	2A08
		STR 	4CH 			//01DF 	01CC

		//;rf-out-key.C: 219: Buffer = 0;
		CLRR 	4DH 			//01E0 	014D

		//;rf-out-key.C: 220: Start = 0;
		BCR 	70H,5 			//01E1 	12F0

		//;rf-out-key.C: 221: }
		//;rf-out-key.C: 224: if(Bit == 0)
		LDR 	4CH,0 			//01E2 	084C
		BTSS 	STATUS,2 		//01E3 	1D03
		LJUMP 	213H 			//01E4 	3A13

		//;rf-out-key.C: 225: {
		//;rf-out-key.C: 226: Bit = 8;
		LDWI 	8H 			//01E5 	2A08
		STR 	4CH 			//01E6 	01CC

		//;rf-out-key.C: 227: Data[Count] = RFData[Count];
		LDR 	4EH,0 			//01E7 	084E
		ADDWI 	40H 			//01E8 	2740
		STR 	FSR 			//01E9 	0184
		BCR 	STATUS,7 		//01EA 	1383
		LDR 	INDF,0 			//01EB 	0800
		STR 	72H 			//01EC 	01F2
		LDR 	4EH,0 			//01ED 	084E
		ADDWI 	46H 			//01EE 	2746
		STR 	FSR 			//01EF 	0184
		LDR 	72H,0 			//01F0 	0872
		STR 	INDF 			//01F1 	0180

		//;rf-out-key.C: 228: RFData[Count] = Buffer;
		LDR 	4EH,0 			//01F2 	084E
		ADDWI 	40H 			//01F3 	2740
		STR 	FSR 			//01F4 	0184
		LDR 	4DH,0 			//01F5 	084D
		STR 	INDF 			//01F6 	0180

		//;rf-out-key.C: 229: Count++;
		INCR	4EH,1 			//01F7 	09CE

		//;rf-out-key.C: 232: if(Count >= 3)
		LDWI 	3H 			//01F8 	2A03
		SUBWR 	4EH,0 			//01F9 	0C4E
		BTSS 	STATUS,0 		//01FA 	1C03
		LJUMP 	212H 			//01FB 	3A12

		//;rf-out-key.C: 233: {
		//;rf-out-key.C: 234: Count = 0;
		CLRR 	4EH 			//01FC 	014E

		//;rf-out-key.C: 235: Start = 0;
		BCR 	70H,5 			//01FD 	12F0

		//;rf-out-key.C: 238: if(Data[0] == RFData[0] &&
		//;rf-out-key.C: 239: Data[1] == RFData[1] &&
		//;rf-out-key.C: 240: Data[2] == RFData[2])
		LDR 	46H,0 			//01FE 	0846
		XORWR 	40H,0 			//01FF 	0440
		BTSS 	STATUS,2 		//0200 	1D03
		LJUMP 	212H 			//0201 	3A12
		LDR 	47H,0 			//0202 	0847
		XORWR 	41H,0 			//0203 	0441
		BTSS 	STATUS,2 		//0204 	1D03
		LJUMP 	212H 			//0205 	3A12
		LDR 	48H,0 			//0206 	0848
		XORWR 	42H,0 			//0207 	0442
		BTSS 	STATUS,2 		//0208 	1D03
		LJUMP 	212H 			//0209 	3A12

		//;rf-out-key.C: 241: {
		//;rf-out-key.C: 242: DataM[0] = RFData[0];
		LDR 	40H,0 			//020A 	0840
		STR 	43H 			//020B 	01C3

		//;rf-out-key.C: 243: DataM[1] = RFData[1];
		LDR 	41H,0 			//020C 	0841
		STR 	44H 			//020D 	01C4

		//;rf-out-key.C: 244: DataM[2] = RFData[2];
		LDR 	42H,0 			//020E 	0842
		STR 	45H 			//020F 	01C5

		//;rf-out-key.C: 245: Finish = 1;
		BSR 	70H,1 			//0210 	18F0

		//;rf-out-key.C: 246: Lock = 1;
		BSR 	70H,0 			//0211 	1870

		//;rf-out-key.C: 197: Buffer = 0;
		CLRR 	4DH 			//0212 	014D

		//;rf-out-key.C: 250: }
		//;rf-out-key.C: 251: }
		//;rf-out-key.C: 253: Frist = 0;
		BCR 	70H,2 			//0213 	1170

		//;rf-out-key.C: 254: }
		//;rf-out-key.C: 256: Timedown = 0;
		CLRR 	79H 			//0214 	0179
		LDR 	75H,0 			//0215 	0875
		STR 	PCLATH 			//0216 	018A
		LDR 	74H,0 			//0217 	0874
		STR 	FSR 			//0218 	0184
		SWAPR 	73H,0 			//0219 	0773
		STR 	STATUS 			//021A 	0183
		SWAPR 	7EH,1 			//021B 	07FE
		SWAPR 	7EH,0 			//021C 	077E
		RETI		 			//021D 	0009

		//;rf-out-key.C: 421: unsigned char val = payload_val;
		LDR 	54H,0 			//021E 	0854
		STR 	5DH 			//021F 	01DD

		//;rf-out-key.C: 422: payload_val = 0;
		CLRR 	54H 			//0220 	0154

		//;rf-out-key.C: 424: if(RxBusy == 1) return;
		DECRSZ 	53H,0 		//0221 	0E53
		LJUMP 	224H 			//0222 	3A24
		RET		 					//0223 	0004

		//;rf-out-key.C: 425: RxBusy = 1;
		LDWI 	1H 			//0224 	2A01
		STR 	53H 			//0225 	01D3

		//;rf-out-key.C: 428: if(val >= 120 && val <= 140)
		LDWI 	78H 			//0226 	2A78
		SUBWR 	5DH,0 			//0227 	0C5D
		BTSS 	STATUS,0 		//0228 	1C03
		LJUMP 	244H 			//0229 	3A44
		LDWI 	8DH 			//022A 	2A8D
		SUBWR 	5DH,0 			//022B 	0C5D
		BTSC 	STATUS,0 		//022C 	1403
		LJUMP 	244H 			//022D 	3A44

		//;rf-out-key.C: 429: {
		//;rf-out-key.C: 430: if((lastKey >= 1) && (lastKey <= 4))
		LDR 	50H,0 			//022E 	0850
		BTSC 	STATUS,2 		//022F 	1503
		RET		 					//0230 	0004
		LDWI 	5H 			//0231 	2A05
		SUBWR 	50H,0 			//0232 	0C50
		BTSC 	STATUS,0 		//0233 	1403
		RET		 					//0234 	0004

		//;rf-out-key.C: 431: {
		//;rf-out-key.C: 434: if(lastLearnKey == lastKey)
		LDR 	4BH,0 			//0235 	084B
		XORWR 	50H,0 			//0236 	0450
		BTSS 	STATUS,2 		//0237 	1D03
		LJUMP 	242H 			//0238 	3A42

		//;rf-out-key.C: 435: {
		//;rf-out-key.C: 436: Clear_Key_Remotes(lastKey);
		LDR 	50H,0 			//0239 	0850
		LCALL 	377H 			//023A 	3377

		//;rf-out-key.C: 439: LernRF = 0;
		BCR 	70H,3 			//023B 	11F0

		//;rf-out-key.C: 440: LernRFKey = 0;
		BCR 	STATUS,5 		//023C 	1283
		CLRR 	4FH 			//023D 	014F

		//;rf-out-key.C: 443: lastLearnKey = 5;
		LDWI 	5H 			//023E 	2A05
		STR 	4BH 			//023F 	01CB

		//;rf-out-key.C: 446: LernRFblink = 1;
		BSR 	70H,4 			//0240 	1A70

		//;rf-out-key.C: 447: }
		RET		 					//0241 	0004

		//;rf-out-key.C: 448: else
		//;rf-out-key.C: 449: {
		//;rf-out-key.C: 451: lastLearnKey = lastKey;
		LDR 	50H,0 			//0242 	0850
		LJUMP 	23FH 			//0243 	3A3F

		//;rf-out-key.C: 457: else if(val >= 10 && val <= 20 && LernRFKey != 1)
		LDWI 	AH 			//0244 	2A0A
		SUBWR 	5DH,0 			//0245 	0C5D
		BTSS 	STATUS,0 		//0246 	1C03
		LJUMP 	25DH 			//0247 	3A5D
		LDWI 	15H 			//0248 	2A15
		SUBWR 	5DH,0 			//0249 	0C5D
		BTSC 	STATUS,0 		//024A 	1403
		LJUMP 	25DH 			//024B 	3A5D
		DECR 	4FH,0 			//024C 	0D4F
		BTSC 	STATUS,2 		//024D 	1503
		LJUMP 	25DH 			//024E 	3A5D

		//;rf-out-key.C: 458: {
		//;rf-out-key.C: 459: state1 = !state1;
		LDWI 	8H 			//024F 	2A08
		XORWR 	78H,1 			//0250 	04F8

		//;rf-out-key.C: 460: eerom = 1;
		LDWI 	1H 			//0251 	2A01
		STR 	51H 			//0252 	01D1

		//;rf-out-key.C: 461: PA5 = state1;
		BTSS 	78H,3 			//0253 	1DF8
		LJUMP 	258H 			//0254 	3A58
		BCR 	STATUS,5 		//0255 	1283
		BSR 	5H,5 			//0256 	1A85
		LJUMP 	25AH 			//0257 	3A5A
		BCR 	STATUS,5 		//0258 	1283
		BCR 	5H,5 			//0259 	1285

		//;rf-out-key.C: 462: lastKey = 1;
		LDWI 	1H 			//025A 	2A01
		STR 	50H 			//025B 	01D0

		//;rf-out-key.C: 463: }
		RET		 					//025C 	0004

		//;rf-out-key.C: 465: else if(val >= 30 && val <= 45 && LernRFKey != 2)
		LDWI 	1EH 			//025D 	2A1E
		SUBWR 	5DH,0 			//025E 	0C5D
		BTSS 	STATUS,0 		//025F 	1C03
		LJUMP 	277H 			//0260 	3A77
		LDWI 	2EH 			//0261 	2A2E
		SUBWR 	5DH,0 			//0262 	0C5D
		BTSC 	STATUS,0 		//0263 	1403
		LJUMP 	277H 			//0264 	3A77
		LDWI 	2H 			//0265 	2A02
		XORWR 	4FH,0 			//0266 	044F
		BTSC 	STATUS,2 		//0267 	1503
		LJUMP 	277H 			//0268 	3A77

		//;rf-out-key.C: 466: {
		//;rf-out-key.C: 467: state2 = !state2;
		LDWI 	4H 			//0269 	2A04
		XORWR 	78H,1 			//026A 	04F8

		//;rf-out-key.C: 468: eerom = 2;
		LDWI 	2H 			//026B 	2A02
		STR 	51H 			//026C 	01D1

		//;rf-out-key.C: 469: PA1 = state2;
		BTSS 	78H,2 			//026D 	1D78
		LJUMP 	272H 			//026E 	3A72
		BCR 	STATUS,5 		//026F 	1283
		BSR 	5H,1 			//0270 	1885
		LJUMP 	274H 			//0271 	3A74
		BCR 	STATUS,5 		//0272 	1283
		BCR 	5H,1 			//0273 	1085

		//;rf-out-key.C: 470: lastKey = 2;
		LDWI 	2H 			//0274 	2A02
		STR 	50H 			//0275 	01D0

		//;rf-out-key.C: 471: }
		RET		 					//0276 	0004

		//;rf-out-key.C: 473: else if(val >= 50 && val <= 70 && LernRFKey != 3)
		LDWI 	32H 			//0277 	2A32
		SUBWR 	5DH,0 			//0278 	0C5D
		BTSS 	STATUS,0 		//0279 	1C03
		LJUMP 	291H 			//027A 	3A91
		LDWI 	47H 			//027B 	2A47
		SUBWR 	5DH,0 			//027C 	0C5D
		BTSC 	STATUS,0 		//027D 	1403
		LJUMP 	291H 			//027E 	3A91
		LDWI 	3H 			//027F 	2A03
		XORWR 	4FH,0 			//0280 	044F
		BTSC 	STATUS,2 		//0281 	1503
		LJUMP 	291H 			//0282 	3A91

		//;rf-out-key.C: 474: {
		//;rf-out-key.C: 475: state3 = !state3;
		LDWI 	2H 			//0283 	2A02
		XORWR 	78H,1 			//0284 	04F8

		//;rf-out-key.C: 476: eerom = 3;
		LDWI 	3H 			//0285 	2A03
		STR 	51H 			//0286 	01D1

		//;rf-out-key.C: 477: PA0 = state3;
		BTSS 	78H,1 			//0287 	1CF8
		LJUMP 	28CH 			//0288 	3A8C
		BCR 	STATUS,5 		//0289 	1283
		BSR 	5H,0 			//028A 	1805
		LJUMP 	28EH 			//028B 	3A8E
		BCR 	STATUS,5 		//028C 	1283
		BCR 	5H,0 			//028D 	1005

		//;rf-out-key.C: 478: lastKey = 3;
		LDWI 	3H 			//028E 	2A03
		STR 	50H 			//028F 	01D0

		//;rf-out-key.C: 479: }
		RET		 					//0290 	0004

		//;rf-out-key.C: 481: else if(val >= 75 && val <= 95 && LernRFKey != 4)
		LDWI 	4BH 			//0291 	2A4B
		SUBWR 	5DH,0 			//0292 	0C5D
		BTSS 	STATUS,0 		//0293 	1C03
		RET		 					//0294 	0004
		LDWI 	60H 			//0295 	2A60
		SUBWR 	5DH,0 			//0296 	0C5D
		BTSC 	STATUS,0 		//0297 	1403
		RET		 					//0298 	0004
		LDWI 	4H 			//0299 	2A04
		XORWR 	4FH,0 			//029A 	044F
		BTSC 	STATUS,2 		//029B 	1503
		RET		 					//029C 	0004

		//;rf-out-key.C: 482: {
		//;rf-out-key.C: 483: state4 = !state4;
		LDWI 	1H 			//029D 	2A01
		XORWR 	78H,1 			//029E 	04F8

		//;rf-out-key.C: 484: eerom = 4;
		LDWI 	4H 			//029F 	2A04
		STR 	51H 			//02A0 	01D1

		//;rf-out-key.C: 485: PA4 = state4;
		BTSS 	78H,0 			//02A1 	1C78
		LJUMP 	2A6H 			//02A2 	3AA6
		BCR 	STATUS,5 		//02A3 	1283
		BSR 	5H,4 			//02A4 	1A05
		LJUMP 	2A8H 			//02A5 	3AA8
		BCR 	STATUS,5 		//02A6 	1283
		BCR 	5H,4 			//02A7 	1205

		//;rf-out-key.C: 486: lastKey = 4;
		LDWI 	4H 			//02A8 	2A04
		STR 	50H 			//02A9 	01D0
		RET		 					//02AA 	0004
		STR 	61H 			//02AB 	01E1

		//;rf-out-key.C: 322: unsigned char r;
		//;rf-out-key.C: 323: unsigned char k_idx;
		//;rf-out-key.C: 324: unsigned char base_addr;
		//;rf-out-key.C: 325: unsigned char fifo_ptr_addr;
		//;rf-out-key.C: 326: unsigned char current_ptr;
		//;rf-out-key.C: 327: unsigned char target_addr;
		//;rf-out-key.C: 329: if((key_num < 1) || (key_num > 4))
		LDR 	61H,0 			//02AC 	0861
		BTSC 	STATUS,2 		//02AD 	1503
		RET		 					//02AE 	0004
		LDWI 	5H 			//02AF 	2A05
		SUBWR 	61H,0 			//02B0 	0C61
		BTSC 	STATUS,0 		//02B1 	1403
		RET		 					//02B2 	0004

		//;rf-out-key.C: 332: k_idx = key_num - 1;
		LDR 	61H,0 			//02B3 	0861
		ADDWI 	FFH 			//02B4 	27FF
		STR 	5CH 			//02B5 	01DC

		//;rf-out-key.C: 335: for(r = 0; r < 5; r++)
		CLRR 	5FH 			//02B6 	015F

		//;rf-out-key.C: 336: {
		//;rf-out-key.C: 337: base_addr = (k_idx * 5 * 3) + (r * 3);
		LDWI 	FH 			//02B7 	2A0F
		STR 	76H 			//02B8 	01F6
		LDR 	5CH,0 			//02B9 	085C
		LCALL 	3B1H 			//02BA 	33B1
		STR 	5AH 			//02BB 	01DA
		LDR 	5FH,0 			//02BC 	085F
		ADDWR 	5FH,0 			//02BD 	0B5F
		ADDWR 	5FH,0 			//02BE 	0B5F
		ADDWR 	5AH,0 			//02BF 	0B5A
		STR 	5DH 			//02C0 	01DD

		//;rf-out-key.C: 339: if((DataM[0] == EEPROMread(base_addr)) &&
		//;rf-out-key.C: 340: (DataM[1] == EEPROMread(base_addr + 1)) &&
		//;rf-out-key.C: 341: (DataM[2] == EEPROMread(base_addr + 2)))
		LCALL 	3E6H 			//02C1 	33E6
		BCR 	STATUS,5 		//02C2 	1283
		XORWR 	43H,0 			//02C3 	0443
		BTSS 	STATUS,2 		//02C4 	1D03
		LJUMP 	2D4H 			//02C5 	3AD4
		LDR 	5DH,0 			//02C6 	085D
		ADDWI 	1H 			//02C7 	2701
		LCALL 	3E6H 			//02C8 	33E6
		BCR 	STATUS,5 		//02C9 	1283
		XORWR 	44H,0 			//02CA 	0444
		BTSS 	STATUS,2 		//02CB 	1D03
		LJUMP 	2D4H 			//02CC 	3AD4
		LDR 	5DH,0 			//02CD 	085D
		ADDWI 	2H 			//02CE 	2702
		LCALL 	3E6H 			//02CF 	33E6
		BCR 	STATUS,5 		//02D0 	1283
		XORWR 	45H,0 			//02D1 	0445
		BTSC 	STATUS,2 		//02D2 	1503
		RET		 					//02D3 	0004
		LDWI 	5H 			//02D4 	2A05
		INCR	5FH,1 			//02D5 	09DF
		SUBWR 	5FH,0 			//02D6 	0C5F
		BTSS 	STATUS,0 		//02D7 	1C03
		LJUMP 	2B7H 			//02D8 	3AB7

		//;rf-out-key.C: 344: }
		//;rf-out-key.C: 345: }
		//;rf-out-key.C: 348: fifo_ptr_addr = 60 + k_idx;
		LDR 	5CH,0 			//02D9 	085C
		ADDWI 	3CH 			//02DA 	273C
		STR 	5BH 			//02DB 	01DB

		//;rf-out-key.C: 349: current_ptr = EEPROMread(fifo_ptr_addr);
		LCALL 	3E6H 			//02DC 	33E6
		BCR 	STATUS,5 		//02DD 	1283
		STR 	60H 			//02DE 	01E0

		//;rf-out-key.C: 351: if(current_ptr >= 5)
		LDWI 	5H 			//02DF 	2A05
		SUBWR 	60H,0 			//02E0 	0C60
		BTSC 	STATUS,0 		//02E1 	1403

		//;rf-out-key.C: 352: current_ptr = 0;
		CLRR 	60H 			//02E2 	0160

		//;rf-out-key.C: 354: target_addr = (k_idx * 5 * 3) + (current_ptr * 3);
		LDWI 	FH 			//02E3 	2A0F
		STR 	76H 			//02E4 	01F6
		LDR 	5CH,0 			//02E5 	085C
		LCALL 	3B1H 			//02E6 	33B1
		STR 	5AH 			//02E7 	01DA
		LDR 	60H,0 			//02E8 	0860
		ADDWR 	60H,0 			//02E9 	0B60
		ADDWR 	60H,0 			//02EA 	0B60
		ADDWR 	5AH,0 			//02EB 	0B5A
		STR 	5EH 			//02EC 	01DE

		//;rf-out-key.C: 357: EEPROMwrite(target_addr, DataM[0]);
		LDR 	43H,0 			//02ED 	0843
		STR 	76H 			//02EE 	01F6
		LDR 	5EH,0 			//02EF 	085E
		LCALL 	38EH 			//02F0 	338E

		//;rf-out-key.C: 358: EEPROMwrite(target_addr + 1, DataM[1]);
		BCR 	STATUS,5 		//02F1 	1283
		LDR 	44H,0 			//02F2 	0844
		STR 	76H 			//02F3 	01F6
		LDR 	5EH,0 			//02F4 	085E
		ADDWI 	1H 			//02F5 	2701
		LCALL 	38EH 			//02F6 	338E

		//;rf-out-key.C: 359: EEPROMwrite(target_addr + 2, DataM[2]);
		BCR 	STATUS,5 		//02F7 	1283
		LDR 	45H,0 			//02F8 	0845
		STR 	76H 			//02F9 	01F6
		LDR 	5EH,0 			//02FA 	085E
		ADDWI 	2H 			//02FB 	2702
		LCALL 	38EH 			//02FC 	338E
		LDWI 	5H 			//02FD 	2A05

		//;rf-out-key.C: 362: current_ptr++;
		BCR 	STATUS,5 		//02FE 	1283
		INCR	60H,1 			//02FF 	09E0

		//;rf-out-key.C: 363: if(current_ptr >= 5)
		SUBWR 	60H,0 			//0300 	0C60
		BTSC 	STATUS,0 		//0301 	1403

		//;rf-out-key.C: 364: current_ptr = 0;
		CLRR 	60H 			//0302 	0160

		//;rf-out-key.C: 366: EEPROMwrite(fifo_ptr_addr, current_ptr);
		LDR 	60H,0 			//0303 	0860
		STR 	76H 			//0304 	01F6
		LDR 	5BH,0 			//0305 	085B
		LCALL 	38EH 			//0306 	338E

		//;rf-out-key.C: 401: if(key_num == 1) O1 = 1;
		BCR 	STATUS,5 		//0307 	1283
		DECRSZ 	61H,0 		//0308 	0E61
		LJUMP 	30CH 			//0309 	3B0C
		BSR 	71H,1 			//030A 	18F1
		LJUMP 	319H 			//030B 	3B19

		//;rf-out-key.C: 402: else if(key_num == 2) O2 = 1;
		LDWI 	2H 			//030C 	2A02
		XORWR 	61H,0 			//030D 	0461
		BTSS 	STATUS,2 		//030E 	1D03
		LJUMP 	312H 			//030F 	3B12
		BSR 	71H,0 			//0310 	1871
		LJUMP 	319H 			//0311 	3B19

		//;rf-out-key.C: 403: else if(key_num == 3) O3 = 1;
		LDWI 	3H 			//0312 	2A03
		XORWR 	61H,0 			//0313 	0461
		BTSS 	STATUS,2 		//0314 	1D03
		LJUMP 	318H 			//0315 	3B18
		BSR 	70H,7 			//0316 	1BF0
		LJUMP 	319H 			//0317 	3B19

		//;rf-out-key.C: 404: else O4 = 1;
		BSR 	70H,6 			//0318 	1B70

		//;rf-out-key.C: 410: lastLearnKey = 0;
		CLRR 	4BH 			//0319 	014B

		//;rf-out-key.C: 412: LernRFKey = 0;
		CLRR 	4FH 			//031A 	014F

		//;rf-out-key.C: 413: LernRF = 0;
		BCR 	70H,3 			//031B 	11F0
		RET		 					//031C 	0004

		//;rf-out-key.C: 295: unsigned char k, r, base_addr;
		//;rf-out-key.C: 297: for(k = 0; k < 4; k++)
		CLRR 	5CH 			//031D 	015C

		//;rf-out-key.C: 298: {
		//;rf-out-key.C: 299: for(r = 0; r < 5; r++)
		CLRR 	5BH 			//031E 	015B

		//;rf-out-key.C: 300: {
		//;rf-out-key.C: 301: base_addr = (k * 5 * 3) + (r * 3);
		LDWI 	FH 			//031F 	2A0F
		STR 	76H 			//0320 	01F6
		LDR 	5CH,0 			//0321 	085C
		LCALL 	3B1H 			//0322 	33B1
		STR 	77H 			//0323 	01F7
		LDR 	5BH,0 			//0324 	085B
		ADDWR 	5BH,0 			//0325 	0B5B
		ADDWR 	5BH,0 			//0326 	0B5B
		ADDWR 	77H,0 			//0327 	0B77
		STR 	5AH 			//0328 	01DA

		//;rf-out-key.C: 303: if(DataM[0] == EEPROMread(base_addr) &&
		//;rf-out-key.C: 304: DataM[1] == EEPROMread(base_addr + 1) &&
		//;rf-out-key.C: 305: DataM[2] == EEPROMread(base_addr + 2))
		LCALL 	3E6H 			//0329 	33E6
		BCR 	STATUS,5 		//032A 	1283
		XORWR 	43H,0 			//032B 	0443
		BTSS 	STATUS,2 		//032C 	1D03
		LJUMP 	34FH 			//032D 	3B4F
		LDR 	5AH,0 			//032E 	085A
		ADDWI 	1H 			//032F 	2701
		LCALL 	3E6H 			//0330 	33E6
		BCR 	STATUS,5 		//0331 	1283
		XORWR 	44H,0 			//0332 	0444
		BTSS 	STATUS,2 		//0333 	1D03
		LJUMP 	34FH 			//0334 	3B4F
		LDR 	5AH,0 			//0335 	085A
		ADDWI 	2H 			//0336 	2702
		LCALL 	3E6H 			//0337 	33E6
		BCR 	STATUS,5 		//0338 	1283
		XORWR 	45H,0 			//0339 	0445
		BTSS 	STATUS,2 		//033A 	1D03
		LJUMP 	34FH 			//033B 	3B4F

		//;rf-out-key.C: 306: {
		//;rf-out-key.C: 307: if(k == 0) O1 = 1;
		LDR 	5CH,0 			//033C 	085C
		BTSS 	STATUS,2 		//033D 	1D03
		LJUMP 	341H 			//033E 	3B41
		BSR 	71H,1 			//033F 	18F1
		LJUMP 	34FH 			//0340 	3B4F

		//;rf-out-key.C: 308: else if(k == 1) O2 = 1;
		DECRSZ 	5CH,0 		//0341 	0E5C
		LJUMP 	345H 			//0342 	3B45
		BSR 	71H,0 			//0343 	1871
		LJUMP 	34FH 			//0344 	3B4F

		//;rf-out-key.C: 309: else if(k == 2) O3 = 1;
		LDWI 	2H 			//0345 	2A02
		XORWR 	5CH,0 			//0346 	045C
		BTSS 	STATUS,2 		//0347 	1D03
		LJUMP 	34BH 			//0348 	3B4B
		BSR 	70H,7 			//0349 	1BF0
		LJUMP 	34FH 			//034A 	3B4F

		//;rf-out-key.C: 310: else if(k == 3) O4 = 1;
		LDWI 	3H 			//034B 	2A03
		XORWR 	5CH,0 			//034C 	045C
		BTSC 	STATUS,2 		//034D 	1503
		BSR 	70H,6 			//034E 	1B70
		LDWI 	5H 			//034F 	2A05
		INCR	5BH,1 			//0350 	09DB
		SUBWR 	5BH,0 			//0351 	0C5B
		BTSS 	STATUS,0 		//0352 	1C03
		LJUMP 	31FH 			//0353 	3B1F
		LDWI 	4H 			//0354 	2A04
		INCR	5CH,1 			//0355 	09DC
		SUBWR 	5CH,0 			//0356 	0C5C
		BTSC 	STATUS,0 		//0357 	1403
		RET		 					//0358 	0004
		LJUMP 	31EH 			//0359 	3B1E

		//;rf-out-key.C: 692: unsigned int a, b;
		//;rf-out-key.C: 693: for(a = 0; a < Time; a++)
		CLRR 	5AH 			//035A 	015A
		CLRR 	5BH 			//035B 	015B
		LDR 	59H,0 			//035C 	0859
		SUBWR 	5BH,0 			//035D 	0C5B
		BTSS 	STATUS,2 		//035E 	1D03
		LJUMP 	362H 			//035F 	3B62
		LDR 	58H,0 			//0360 	0858
		SUBWR 	5AH,0 			//0361 	0C5A
		BTSC 	STATUS,0 		//0362 	1403
		RET		 					//0363 	0004

		//;rf-out-key.C: 694: {
		//;rf-out-key.C: 695: for(b = 0; b < 5; b++)
		CLRR 	5CH 			//0364 	015C
		CLRR 	5DH 			//0365 	015D

		//;rf-out-key.C: 696: {
		//;rf-out-key.C: 697: DelayUs(197);
		LDWI 	C5H 			//0366 	2AC5
		LCALL 	3CBH 			//0367 	33CB
		BCR 	STATUS,5 		//0368 	1283
		INCR	5CH,1 			//0369 	09DC
		BTSC 	STATUS,2 		//036A 	1503
		INCR	5DH,1 			//036B 	09DD
		LDWI 	0H 			//036C 	2A00
		SUBWR 	5DH,0 			//036D 	0C5D
		LDWI 	5H 			//036E 	2A05
		BTSC 	STATUS,2 		//036F 	1503
		SUBWR 	5CH,0 			//0370 	0C5C
		BTSS 	STATUS,0 		//0371 	1C03
		LJUMP 	366H 			//0372 	3B66
		INCR	5AH,1 			//0373 	09DA
		BTSC 	STATUS,2 		//0374 	1503
		INCR	5BH,1 			//0375 	09DB
		LJUMP 	35CH 			//0376 	3B5C
		STR 	5BH 			//0377 	01DB

		//;rf-out-key.C: 271: unsigned char i;
		//;rf-out-key.C: 272: unsigned char addr;
		//;rf-out-key.C: 279: addr = (key_num - 1) * 15;
		LDWI 	FH 			//0378 	2A0F
		STR 	76H 			//0379 	01F6
		LDR 	5BH,0 			//037A 	085B
		ADDWI 	FFH 			//037B 	27FF
		LCALL 	3B1H 			//037C 	33B1
		STR 	5AH 			//037D 	01DA

		//;rf-out-key.C: 281: for(i = 0; i < 15; i++)
		CLRR 	5CH 			//037E 	015C

		//;rf-out-key.C: 282: {
		//;rf-out-key.C: 283: EEPROMwrite(addr++, 0xFF);
		LDWI 	FFH 			//037F 	2AFF
		STR 	76H 			//0380 	01F6
		LDR 	5AH,0 			//0381 	085A
		LCALL 	38EH 			//0382 	338E
		LDWI 	FH 			//0383 	2A0F
		BCR 	STATUS,5 		//0384 	1283
		INCR	5AH,1 			//0385 	09DA
		INCR	5CH,1 			//0386 	09DC
		SUBWR 	5CH,0 			//0387 	0C5C
		BTSS 	STATUS,0 		//0388 	1C03
		LJUMP 	37FH 			//0389 	3B7F

		//;rf-out-key.C: 284: }
		//;rf-out-key.C: 287: EEPROMwrite(59 + key_num, 0);
		CLRR 	76H 			//038A 	0176
		LDR 	5BH,0 			//038B 	085B
		ADDWI 	3BH 			//038C 	273B
		LJUMP 	38EH 			//038D 	3B8E
		STR 	77H 			//038E 	01F7

		//;rf-out-key.C: 669: GIE = 0;
		BCR 	INTCON,7 		//038F 	138B

		//;rf-out-key.C: 670: while(GIE);
		BTSC 	INTCON,7 		//0390 	178B
		LJUMP 	390H 			//0391 	3B90

		//;rf-out-key.C: 671: EEADR = EEAddr;
		LDR 	77H,0 			//0392 	0877
		BSR 	STATUS,5 		//0393 	1A83
		STR 	1BH 			//0394 	019B

		//;rf-out-key.C: 672: EEDAT = Data;
		LDR 	76H,0 			//0395 	0876
		STR 	1AH 			//0396 	019A

		//;rf-out-key.C: 673: EEIF = 0;
		BCR 	STATUS,5 		//0397 	1283
		BCR 	CH,7 			//0398 	138C

		//;rf-out-key.C: 674: EECON1 |= 0x34;
		LDWI 	34H 			//0399 	2A34
		BSR 	STATUS,5 		//039A 	1A83
		IORWR 	1CH,1 			//039B 	039C

		//;rf-out-key.C: 675: WR = 1;
		BSR 	1DH,0 			//039C 	181D

		//;rf-out-key.C: 676: while(WR);
		BTSC 	1DH,0 			//039D 	141D
		LJUMP 	39DH 			//039E 	3B9D

		//;rf-out-key.C: 677: GIE = 1;
		BSR 	INTCON,7 		//039F 	1B8B
		RET		 					//03A0 	0004

		//;rf-out-key.C: 632: OSCCON = 0B01110000;
		LDWI 	70H 			//03A1 	2A70
		BSR 	STATUS,5 		//03A2 	1A83
		STR 	FH 			//03A3 	018F

		//;rf-out-key.C: 633: INTCON = 0;
		CLRR 	INTCON 			//03A4 	010B

		//;rf-out-key.C: 634: OPTION = 0B00001000;
		LDWI 	8H 			//03A5 	2A08
		STR 	1H 			//03A6 	0181

		//;rf-out-key.C: 635: PORTA = 0B00000100;
		LDWI 	4H 			//03A7 	2A04
		BCR 	STATUS,5 		//03A8 	1283
		STR 	5H 			//03A9 	0185

		//;rf-out-key.C: 636: TRISA = 0B00001100;
		LDWI 	CH 			//03AA 	2A0C
		BSR 	STATUS,5 		//03AB 	1A83
		STR 	5H 			//03AC 	0185

		//;rf-out-key.C: 637: WPUA = 0B00001100;
		STR 	15H 			//03AD 	0195

		//;rf-out-key.C: 638: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//03AE 	1283
		CLRR 	1BH 			//03AF 	011B
		RET		 					//03B0 	0004
		STR 	59H 			//03B1 	01D9
		CLRR 	58H 			//03B2 	0158
		LDR 	76H,0 			//03B3 	0876
		BTSC 	59H,0 			//03B4 	1459
		ADDWR 	58H,1 			//03B5 	0BD8
		BCR 	STATUS,0 		//03B6 	1003
		RLR 	76H,1 			//03B7 	05F6
		BCR 	STATUS,0 		//03B8 	1003
		RRR	59H,1 			//03B9 	06D9
		LDR 	59H,0 			//03BA 	0859
		BTSS 	STATUS,2 		//03BB 	1D03
		LJUMP 	3B3H 			//03BC 	3BB3
		LDR 	58H,0 			//03BD 	0858
		RET		 					//03BE 	0004

		//;rf-out-key.C: 643: T2CON = 0B00000001;
		LDWI 	1H 			//03BF 	2A01
		STR 	12H 			//03C0 	0192

		//;rf-out-key.C: 644: TMR2 = 0;
		CLRR 	11H 			//03C1 	0111

		//;rf-out-key.C: 645: PR2 = 50;
		LDWI 	32H 			//03C2 	2A32
		BSR 	STATUS,5 		//03C3 	1A83
		STR 	12H 			//03C4 	0192

		//;rf-out-key.C: 646: TMR2IF = 0;
		BCR 	STATUS,5 		//03C5 	1283
		BCR 	CH,1 			//03C6 	108C

		//;rf-out-key.C: 647: TMR2ON = 1;
		BSR 	12H,2 			//03C7 	1912

		//;rf-out-key.C: 648: PEIE = 1;
		BSR 	INTCON,6 		//03C8 	1B0B

		//;rf-out-key.C: 649: GIE = 1;
		BSR 	INTCON,7 		//03C9 	1B8B
		RET		 					//03CA 	0004
		STR 	76H 			//03CB 	01F6

		//;rf-out-key.C: 682: unsigned char a;
		//;rf-out-key.C: 683: for(a = 0; a < Time; a++)
		CLRR 	77H 			//03CC 	0177
		LDR 	76H,0 			//03CD 	0876
		SUBWR 	77H,0 			//03CE 	0C77
		BTSC 	STATUS,0 		//03CF 	1403
		RET		 					//03D0 	0004

		//;rf-out-key.C: 684: {
		//;rf-out-key.C: 685: __nop();
		NOP		 					//03D1 	0000
		CLRWDT	 			//03D2 	0001
		INCR	77H,1 			//03D3 	09F7
		LJUMP 	3CDH 			//03D4 	3BCD

		//;rf-out-key.C: 654: OPTION = 0B00000110;
		LDWI 	6H 			//03D5 	2A06
		BSR 	STATUS,5 		//03D6 	1A83
		STR 	1H 			//03D7 	0181

		//;rf-out-key.C: 655: TMR0 = 239;
		LDWI 	EFH 			//03D8 	2AEF
		BCR 	STATUS,5 		//03D9 	1283
		STR 	1H 			//03DA 	0181

		//;rf-out-key.C: 656: T0IF = 0;
		BCR 	INTCON,2 		//03DB 	110B

		//;rf-out-key.C: 657: T0IE = 1;
		BSR 	INTCON,5 		//03DC 	1A8B
		RET		 					//03DD 	0004
		CLRWDT	 			//03DE 	0001
		CLRR 	INDF 			//03DF 	0100
		INCR	FSR,1 			//03E0 	0984
		XORWR 	FSR,0 			//03E1 	0404
		BTSC 	STATUS,2 		//03E2 	1503
		RETW 	0H 			//03E3 	2100
		XORWR 	FSR,0 			//03E4 	0404
		LJUMP 	3DFH 			//03E5 	3BDF
		STR 	76H 			//03E6 	01F6

		//;rf-out-key.C: 662: EEADR = EEAddr;
		BSR 	STATUS,5 		//03E7 	1A83
		STR 	1BH 			//03E8 	019B

		//;rf-out-key.C: 663: RD = 1;
		BSR 	1CH,0 			//03E9 	181C

		//;rf-out-key.C: 664: return EEDAT;
		LDR 	1AH,0 			//03EA 	081A
		RET		 					//03EB 	0004
			END
