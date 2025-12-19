//Deviec:FT62F21X
//-----------------------Variable---------------------------------
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	3FEH 			//0000 	3BFE
		ORG		03E2H

		//;test_ft62f21x_MSCK.C: 61: TMR2ON = 1;
		BCR 	STATUS,5 		//03E2 	1283
		BSR 	12H,2 			//03E3 	1912

		//;test_ft62f21x_MSCK.C: 63: CKMAVG = 0;
		BCR 	1BH,2 			//03E4 	111B
		RET		 					//03E5 	0004

		//;test_ft62f21x_MSCK.C: 75: POWER_INITIAL();
		LCALL 	3F1H 			//03E6 	33F1

		//;test_ft62f21x_MSCK.C: 77: MSCK_Init();
		LCALL 	3E2H 			//03E7 	33E2

		//;test_ft62f21x_MSCK.C: 79: CKCNTI = 1;
		BSR 	1BH,1 			//03E8 	189B

		//;test_ft62f21x_MSCK.C: 82: {
		//;test_ft62f21x_MSCK.C: 83: if(CKMIF)
		BCR 	STATUS,5 		//03E9 	1283
		ORG		03EAH
		BTSS 	CH,6 			//03EA 	1F0C
		LJUMP 	3EFH 			//03EB 	3BEF

		//;test_ft62f21x_MSCK.C: 84: {
		//;test_ft62f21x_MSCK.C: 85: temp = (SOSCPRH &0x0f)<<8;
		LDR 	1DH,0 			//03EC 	081D

		//;test_ft62f21x_MSCK.C: 86: temp |= SOSCPRL;
		LDR 	1CH,0 			//03ED 	081C

		//;test_ft62f21x_MSCK.C: 88: CKMIF = 0;
		BCR 	CH,6 			//03EE 	130C

		//;test_ft62f21x_MSCK.C: 89: }
		//;test_ft62f21x_MSCK.C: 90: __nop();
		NOP		 					//03EF 	0000
		LJUMP 	3E9H 			//03F0 	3BE9

		//;test_ft62f21x_MSCK.C: 46: OSCCON = 0X70;
		LDWI 	70H 			//03F1 	2A70
		ORG		03F2H
		BSR 	STATUS,5 		//03F2 	1A83
		STR 	FH 			//03F3 	018F

		//;test_ft62f21x_MSCK.C: 51: INTCON = 0;
		CLRR 	INTCON 			//03F4 	010B

		//;test_ft62f21x_MSCK.C: 52: OPTION = 0;
		CLRR 	1H 			//03F5 	0101

		//;test_ft62f21x_MSCK.C: 53: TRISA = 0;
		CLRR 	5H 			//03F6 	0105

		//;test_ft62f21x_MSCK.C: 54: PSRCA = 0;
		CLRR 	8H 			//03F7 	0108

		//;test_ft62f21x_MSCK.C: 55: PSINKA = 0;
		CLRR 	17H 			//03F8 	0117

		//;test_ft62f21x_MSCK.C: 56: PORTA = 0;
		BCR 	STATUS,5 		//03F9 	1283
		ORG		03FAH
		CLRR 	5H 			//03FA 	0105

		//;test_ft62f21x_MSCK.C: 57: WPUA = 0;
		BSR 	STATUS,5 		//03FB 	1A83
		CLRR 	15H 			//03FC 	0115
		RET		 					//03FD 	0004
		CLRR 	STATUS 			//03FE 	0103
		LJUMP 	3E6H 			//03FF 	3BE6
			END
