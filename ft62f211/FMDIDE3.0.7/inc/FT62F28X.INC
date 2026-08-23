
INDF               EQU          0x00;
// bit and bitfield definitions  	

TMR0               EQU          0x01;
// bit and bitfield definitions  	

PCL                EQU          0x02;
// bit and bitfield definitions  
						
STATUS             EQU          0x03;
// bit and bitfield definitions
CARRY              EQU        H'0000';
DC                 EQU        H'0001';
ZERO               EQU        H'0002';
nPD                EQU        H'0003';
nTO                EQU        H'0004';
RP0                EQU        H'0005';
RP1                EQU        H'0006';
FSRB8              EQU        H'0007';

C                  EQU        H'0000';
HC                 EQU        H'0001';
Z                  EQU        H'0002';
nPF                EQU        H'0003';
nTF                EQU        H'0004';
PAGE0              EQU        H'0005';
PAGE1              EQU        H'0006';

						
FSR                EQU          0x04;
// bit and bitfield definitions

PORTA              EQU          0x05
// bit and bitfield definitions
RA0                EQU        H'0000';
RA1                EQU        H'0001';
RA2                EQU        H'0002';
RA3                EQU        H'0003';
RA4                EQU        H'0004';
RA5                EQU        H'0005';
RA6                EQU        H'0006';
RA7                EQU        H'0007';

PA0                EQU        H'0000';
PA1                EQU        H'0001';
PA2                EQU        H'0002';
PA3                EQU        H'0003';
PA4                EQU        H'0004';
PA5                EQU        H'0005';
PA6                EQU        H'0006';
PA7                EQU        H'0007';

PORTB              EQU          0x06
// bit and bitfield definitions
RB0                EQU        H'0000';
RB1                EQU        H'0001';
RB2                EQU        H'0002';
RB3                EQU        H'0003';
RB4                EQU        H'0004';
RB5                EQU        H'0005';
RB6                EQU        H'0006';
RB7                EQU        H'0007';

PB0                EQU        H'0000';
PB1                EQU        H'0001';
PB2                EQU        H'0002';
PB3                EQU        H'0003';
PB4                EQU        H'0004';
PB5                EQU        H'0005';
PB6                EQU        H'0006';
PB7                EQU        H'0007';

PORTC              EQU          0x07;
// bit and bitfield definitions
RC0                EQU        H'0000';
RC1                EQU        H'0001';
RC2                EQU        H'0002';
RC3                EQU        H'0003';
RC4                EQU        H'0004';
RC5                EQU        H'0005';
RC6                EQU        H'0006';
RC7                EQU        H'0007';

PC0                EQU        H'0000';
PC1                EQU        H'0001';
PC2                EQU        H'0002';
PC3                EQU        H'0003';
PC4                EQU        H'0004';
PC5                EQU        H'0005';
PC6                EQU        H'0006';
PC7                EQU        H'0007';

PORTD              EQU          0x08;
// bit and bitfield definitions
RD0                EQU        H'0000';
RD1                EQU        H'0001';
RD2                EQU        H'0002';
RD3                EQU        H'0003';
RD4                EQU        H'0004';
RD5                EQU        H'0005';

PD0                EQU        H'0000';
PD1                EQU        H'0001';
PD2                EQU        H'0002';
PD3                EQU        H'0003';
PD4                EQU        H'0004';
PD5                EQU        H'0005';

PIR2               EQU          0x09;
// bit and bitfield definitions
C0IF               EQU        H'0000';
C1IF               EQU        H'0001';

PCLATH             EQU          0x0A;
// bit and bitfield definitions

INTCON             EQU          0x0B;
// bit and bitfield definitions
PAIF               EQU        H'0000';
INTF               EQU        H'0001';
T0IF               EQU        H'0002';
PAIE               EQU        H'0003';
INTE               EQU        H'0004';
T0IE               EQU        H'0005';
PEIE               EQU        H'0006';
GIE                EQU        H'0007';

PIR1               EQU          0x0C;
// bit and bitfield definitions
ADCIF              EQU        H'0000';
TMR2IF             EQU        H'0001';
OSFIF              EQU        H'0002';
TMR1IF             EQU        H'0003';
ACMPIF             EQU        H'0004';
LVDIF              EQU        H'0005';
CKMIF              EQU        H'0006';
EEIF               EQU        H'0007';


P1ADTL             EQU          0x0D;
// bit and bitfield definitions 
P1ADTH             EQU          0x0E;
// bit and bitfield definitions
P1BDTL             EQU          0x0F;
// bit and bitfield definitions
P1BDTH             EQU          0x10;
// bit and bitfield definitions 
P1CDTL             EQU          0x11;
// bit and bitfield definitions
P1CDTH             EQU          0x12;
// bit and bitfield definitions
P1DDTL             EQU          0x13;
// bit and bitfield definitions
P1DDTH             EQU          0x14;
// bit and bitfield definitions
TMR2L              EQU          0x15;
// bit and bitfield definitions
TMR2H              EQU          0x16;
// bit and bitfield definitions
PR2L               EQU          0x17;
// bit and bitfield definitions
PR2H               EQU          0x18;
// bit and bitfield definitions

P1BR0              EQU          0x19;
// bit and bitfield definitions
P1ASS0             EQU        H'0000';
P1ASS1             EQU        H'0001';
P1BSS0             EQU        H'0002';
P1BSS1             EQU        H'0003';
P1BKS0             EQU        H'0004';
P1BKS1             EQU        H'0005';
P1BKS2             EQU        H'0006';
P1BEVT             EQU        H'0007';


P1BR1              EQU          0x1A;
// bit and bitfield definitions
P1CSS0             EQU        H'0000';
P1CSS1             EQU        H'0001';
P1C2SS0            EQU        H'0002';
P1C2SS1            EQU        H'0003';
P1DSS0             EQU        H'0004';
P1DSS1             EQU        H'0005';
P1D2SS0            EQU        H'0006';
P1D2SS1            EQU        H'0007';


P1POL0             EQU          0x1B;
// bit and bitfield definitions
P1A0P              EQU        H'0000';
P1A0NP             EQU        H'0001';
P1A1P              EQU        H'0002';
P1A1NP             EQU        H'0003';
P1A2P              EQU        H'0004';
P1A2NP             EQU        H'0005';
P1B0P              EQU        H'0006';
P1C0P              EQU        H'0007';


P1POL1             EQU          0x1C;
// bit and bitfield definitions
P1B1P              EQU        H'0001';
P1C1P              EQU        H'0002';
P1D0P              EQU        H'0005';
P1D1P              EQU        H'0006';
P1D2P              EQU        H'0007';


P1CON              EQU          0x1D;
// bit and bitfield definitions
P1DC0              EQU        H'0000';
P1DC1              EQU        H'0001';
P1DC2              EQU        H'0002';
P1DC3              EQU        H'0003';
P1DC4              EQU        H'0004';
P1DC5              EQU        H'0005';
P1DC6              EQU        H'0006';
P1AUE              EQU        H'0007';

T2CON0             EQU          0x1E;
// bit and bitfield definitions
T2CKPS0            EQU        H'0000';
T2CKPS1            EQU        H'0001';
TMR2ON             EQU        H'0002';
TOUTPS0            EQU        H'0003';
TOUTPS1            EQU        H'0004';
TOUTPS2            EQU        H'0005';
TOUTPS3            EQU        H'0006';
PR2U               EQU        H'0007';


T2CON1             EQU          0x1F;	
// bit and bitfield definitions
T2CKSRC0           EQU        H'0000';
T2CKSRC1           EQU        H'0001';
T2CKSRC2           EQU        H'0002';
P1BZM              EQU        H'0003';
P1OS               EQU        H'0004';


//BANK 1
OPTION             EQU          0x81
// bit and bitfield definitions
PS0                EQU        H'0000';
PS1                EQU        H'0001';
PS2                EQU        H'0002';
PSA                EQU        H'0003';
T0SE               EQU        H'0004';
T0CS               EQU        H'0005';
INTEDG             EQU        H'0006';
nPAPU              EQU        H'0007';


TRISA              EQU          0x85;
// bit and bitfield definitions
TRISA0             EQU        H'0000';
TRISA1             EQU        H'0001';
TRISA2             EQU        H'0002';
TRISA3             EQU        H'0003';
TRISA4             EQU        H'0004';
TRISA5             EQU        H'0005';
TRISA6             EQU        H'0006';
TRISA7             EQU        H'0007';

TRISB              EQU          0x86;
// bit and bitfield definitions
TRISB0             EQU        H'0000';
TRISB1             EQU        H'0001';
TRISB2             EQU        H'0002';
TRISB3             EQU        H'0003';
TRISB4             EQU        H'0004';
TRISB5             EQU        H'0005';
TRISB6             EQU        H'0006';
TRISB7             EQU        H'0007';

TRISC              EQU          0x87;
// bit and bitfield definitions
TRISC0             EQU        H'0000';
TRISC1             EQU        H'0001';
TRISC2             EQU        H'0002';
TRISC3             EQU        H'0003';
TRISC4             EQU        H'0004';
TRISC5             EQU        H'0005';
TRISC6             EQU        H'0006';
TRISC7             EQU        H'0007';

TRISD              EQU          0x88;
// bit and bitfield definitions
TRISD0             EQU        H'0000';
TRISD1             EQU        H'0001';
TRISD2             EQU        H'0002';
TRISD3             EQU        H'0003';
TRISD4             EQU        H'0004';
TRISD5             EQU        H'0005';

PIE2               EQU          0x89;
// bit and bitfield definitions
C0IE              EQU        H'0000';
C1IE              EQU        H'0001';


PIE1               EQU          0x8C;
// bit and bitfield definitions
ADCIE              EQU        H'0000';
TMR2IE             EQU        H'0001';
OSFIE              EQU        H'0002';
TMR1IE             EQU        H'0003';
ACMPIE             EQU        H'0004';
LVDIE              EQU        H'0005';
CKMIE              EQU        H'0006';
EEIE               EQU        H'0007';

	
P1AUX              EQU          0x8D;
// bit and bitfield definitions
P1DF2              EQU        H'0000';
P1DF2E             EQU        H'0001';
P1CF2              EQU        H'0002';
P1CF2E             EQU        H'0003';
P1B2SS0            EQU        H'0004';
P1B2SS1            EQU        H'0005';
P1BKM              EQU        H'0007';


PCON               EQU          0x8E;
// bit and bitfield definitions
nBOR               EQU        H'0000';
nPOR               EQU        H'0001';
LVDW               EQU        H'0002';
LVDEN              EQU        H'0003';
LVDL0              EQU        H'0004';
LVDL1              EQU        H'0005';
LVDL2              EQU        H'0006';
LVDL3              EQU        H'0007';


OSCCON             EQU          0x8F;
// bit and bitfield definitions
SCS                EQU        H'0000';
LTS                EQU        H'0001';
HTS                EQU        H'0002';
OSTS               EQU        H'0003';
IRCF0              EQU        H'0004';
IRCF1              EQU        H'0005';
IRCF2              EQU        H'0006';
LFMOD              EQU        H'0007';


UR1DATL            EQU          0x90;
// bit and bitfield definitions
UR1DATL0           EQU        H'0000';
UR1DATL1           EQU        H'0001';
UR1DATL2           EQU        H'0002';
UR1DATL3           EQU        H'0003';
UR1DATL4           EQU        H'0004';
UR1DATL5           EQU        H'0005';
UR1DATL6           EQU        H'0006';
UR1DATL7           EQU        H'0007';


UR1DATH            EQU          0x91;
// bit and bitfield definitions


UR1CR1             EQU          0x92;
// bit and bitfield definitions
UR1EN              EQU        H'0000';
UR1TXEN            EQU        H'0001';
UR1RXEN            EQU        H'0002';
UR1PCEN            EQU        H'0003';
UR1EVEN            EQU        H'0004';
UR1MODE            EQU        H'0005';
UR1STOP            EQU        H'0006';
UR1HDSEL           EQU        H'0007';


UR1CR2             EQU          0x93;
// bit and bitfield definitions
UR1TXEIE           EQU        H'0000';
UR1RXNEIE          EQU              H'0001';
UR1ERRIE           EQU              H'0002';
UR1BRRH0           EQU              H'0004';
UR1BRRH1           EQU              H'0005';
UR1BRRH2           EQU              H'0006';
UR1BRRH3           EQU              H'0007';
                             

UR1BRRL            EQU          0x94;
// bit and bitfield definitions 

UR1STAT            EQU          0x95;
// bit and bitfield definitions
UR1TXEF            EQU        H'0000';
UR1RXNEF           EQU        H'0001';
UR1FEF             EQU        H'0002';
UR1RXFULL          EQU        H'0003';
UR1PEF             EQU        H'0004';
UR1OVF             EQU        H'0005';
UR1TXBSY           EQU        H'0006';

OP0CR0             EQU          0x96;
// bit and bitfield definitions
OP0ON              EQU        H'0000';
OP0FR0             EQU        H'0001';
OP0FR1             EQU        H'0002';
OP0FR2             EQU        H'0003';
OP0NSEL0           EQU        H'0004';
OP0NSEL1           EQU        H'0005';
OP0PSEL            EQU        H'0006';
OP0OUT             EQU        H'0007';


OP0CR1             EQU          0x97;
// bit and bitfield definitions
OPTOIO             EQU        H'0000';
OPTODIG            EQU        H'0001';
OP0FCAPE           EQU        H'0003';
IPINSW             EQU        H'0004';
OPINSW             EQU        H'0005';

IOCA               EQU          0x98;// bit and bitfield definitions  ,

WDTCON             EQU          0x99;
// bit and bitfield definitions
SWDTEN             EQU        H'0000';
WDTPS0             EQU        H'0001';
WDTPS1             EQU        H'0002';
WDTPS2             EQU        H'0003';
WDTPS3             EQU        H'0004';
WCKSRC0            EQU        H'0005';
WCKSRC1            EQU        H'0006';


EEDAT              EQU          0x9A;
// bit and bitfield definitions	

EEADR              EQU          0x9B;
// bit and bitfield definitions

EECON1             EQU          0x9C;
// bit and bitfield definitions
RD                 EQU        H'0000';
PONLY              EQU        H'0001';
WREN1              EQU        H'0002';
WRERR              EQU        H'0003';
WREN2              EQU        H'0004';
WREN3              EQU        H'0005';

	
EECON2             EQU          0x9D;
// bit and bitfield definitions
WR                 EQU        H'0000';


P1OE0              EQU          0x9E;
// bit and bitfield definitions
P1A0OE             EQU        H'0000';
P1A0NOE            EQU        H'0001';
P1A1OE             EQU        H'0002';
P1A1NOE            EQU        H'0003';
P1A2OE             EQU        H'0004';
P1A2NOE            EQU        H'0005';
P1B0OE             EQU        H'0006';
P1C0OE             EQU        H'0007';


P1OE1              EQU          0x9F;
// bit and bitfield definitions
P1B1OE             EQU        H'0001';
P1C1OE             EQU        H'0002';
P1D0OE             EQU        H'0005';
P1D1OE             EQU        H'0006';
P1D2OE             EQU        H'0007';


//BANK2
MSCON1             EQU          0x101;
// bit and bitfield definitions
HIRCM              EQU        H'0000';
AUXPGE             EQU        H'0001';
LVRCKS             EQU        H'0002';
LVRDEB             EQU        H'0003';


T0CON0             EQU          0x105;
// bit and bitfield definitions
T0CKSRC0           EQU        H'0000';
T0CKSRC1           EQU        H'0001';
T0CKRUN            EQU        H'0002';
T0ON               EQU        H'0003';
P0AOE              EQU        H'0004';
P0ANOE             EQU        H'0005';
T0DZ0              EQU        H'0006';
T0DZ1              EQU        H'0007';


T1CON0             EQU          0x106;
// bit and bitfield definitions
T1CKSRC0           EQU        H'0000';
T1CKSRC1           EQU        H'0001';
T1ON               EQU        H'0002';
T1CKRUN            EQU        H'0003';
T1CKPSA            EQU        H'0004';
T1ECKE             EQU        H'0005';
T1AUSTP            EQU        H'0006';

PR0                EQU          0x107;
// bit and bitfield definitions
T0DUTY             EQU          0x108;
// bit and bitfield definitions
FOSCCALL           EQU          0x109;
// bit and bitfield definitions

	
MSCON0             EQU          0x10C;
// bit and bitfield definitions
T2CKRUN            EQU        H'0000';
CKCNTI             EQU        H'0001';
CKMAVG             EQU        H'0002';
SLVREN             EQU        H'0003';
CLKOS              EQU        H'0004';
ROMLPE             EQU        H'0005';


MSCON2             EQU          0x10D;
// bit and bitfield definitions
T1EVTS0            EQU        H'0000';
T1EVTS1            EQU        H'0001';
T1EVTS2            EQU        H'0002';
STRTYP0            EQU        H'0003';
STRTYP1            EQU        H'0004';
CMAUSTR            EQU        H'0005';
P0AP               EQU        H'0006';
P0ANP              EQU        H'0007';


LEBCON             EQU          0x10E;
// bit and bitfield definitions
EDGS               EQU        H'0003';
LEBCH0             EQU        H'0005';
LEBCH1             EQU        H'0006';
LEBEN              EQU        H'0007';


ADCMPH             EQU          0x10F;
// bit and bitfield definitions 

ADDLY              EQU          0x110;
// bit and bitfield definitions
ADDLY0              EQU        H'0000';
ADDLY1              EQU        H'0001';
ADDLY2              EQU        H'0002';
ADDLY3              EQU        H'0003';
ADDLY4              EQU        H'0004';
ADDLY5              EQU        H'0005';
ADDLY6              EQU        H'0006';
ADDLY7              EQU        H'0007';



ADRESL             EQU          0x111;
// bit and bitfield definitions 

ADRESH             EQU          0x112;
// bit and bitfield definitions

ADCON0             EQU          0x113;
// bit and bitfield definitions
ADON               EQU        H'0000';
GO_DONE            EQU        H'0001';
ADEX               EQU        H'0002';
CHS0               EQU        H'0003';
CHS1               EQU        H'0004';
CHS2               EQU        H'0005';
CHS3               EQU        H'0006';
CHS4               EQU        H'0007';


ADCON1             EQU          0x114;
// bit and bitfield definitions
ADPREF0            EQU        H'0000';
ADPREF1            EQU        H'0001';
ADNREF0            EQU        H'0002';
ADNREF1            EQU        H'0003';
ADCS0              EQU        H'0004';
ADCS1              EQU        H'0005';
ADCS2              EQU        H'0006';
ADFM               EQU        H'0007';


ADCON2             EQU          0x115;
// bit and bitfield definitions
ETGSEL0            EQU        H'0000';
ETGSEL1            EQU        H'0001';
ETGSEL2            EQU        H'0002';
ADDLY8             EQU        H'0003';
ETGTYP0            EQU        H'0004';
ETGTYP1            EQU        H'0005';
ADINTREF0          EQU        H'0006';
ADINTREF1          EQU        H'0007';


ADCON3             EQU          0x116;
// bit and bitfield definitions
LEBADT             EQU        H'0003';
ADCMPE             EQU        H'0005';
ADCMPP             EQU        H'0006';
ADFBEN             EQU        H'0007';


PR1L               EQU          0x117;
// bit and bitfield definitions

PR1H               EQU          0x118;	
// bit and bitfield definitions


TMR1L              EQU          0x119;//{_T("TMR17"),_T("TMR16"),_T("TMR15"),_T("TMR14"),_T("TMR13"),_T("TMR12"),_T("TMR11"),_T("TMR10")}},	
// bit and bitfield definitions
TMR1H              EQU          0x11A;//{_T("-"),_T("-"),_T("-"),_T("-"),_T("TMR111"),_T("TMR110"),_T("TMR19"),_T("TMR18")}},
// bit and bitfield definitions

TKCON0             EQU          0x11B;
// bit and bitfield definitions
TKON               EQU        H'0000';
TKCHGS0            EQU        H'0001';
TKCHGS1            EQU        H'0002';
TKMOD              EQU        H'0003';
TKRSEL0            EQU        H'0004';
TKRSEL1            EQU        H'0005';


TKEN0              EQU          0x11C;
// bit and bitfield definitions  


TKEN1              EQU          0x11D;
// bit and bitfield definitions  
TKREN              EQU      H'0007';


ANSEL0             EQU          0x11E;
// bit and bitfield definitions  

ANSEL1             EQU          0x11F;
// bit and bitfield definitions  

//BANK3	
UR0DATL            EQU          0x185;
// bit and bitfield definitions 
    
UR0DATH            EQU          0x186;

	
UR0CR1             EQU          0x187;
// bit and bitfield definitions
UR0EN              EQU        H'0000';
UR0TXEN            EQU        H'0001';
UR0RXEN            EQU        H'0002';
UR0PCEN            EQU        H'0003';
UR0EVEN            EQU        H'0004';
UR0MODE            EQU        H'0005';
UR0STOP            EQU        H'0006';
UR0HDSEL           EQU        H'0007';


UR0CR2             EQU          0x188;
// bit and bitfield definitions
UR0TXEIE           EQU        H'0000';
UR0RXNEIE          EQU        H'0001';
UR0ERRIE           EQU        H'0002';
UR0BRRH0           EQU        H'0004';
UR0BRRH1           EQU        H'0005';
UR0BRRH2           EQU        H'0006';
UR0BRRH3           EQU        H'0007';


UR0BRRL            EQU          0x189;
// bit and bitfield definitions 

SPIDAT             EQU          0x18C;
// bit and bitfield definitions

SPICR0             EQU          0x18D;
// bit and bitfield definitions
SPIEN              EQU        H'0000';
TXBMT              EQU        H'0001';
NSSM0              EQU        H'0002';
NSSM1              EQU        H'0003';


SPICFG             EQU          0x18E;
// bit and bitfield definitions
RXBMT              EQU        H'0000';
SRMT               EQU        H'0001';
NSSVAL             EQU        H'0002';
SLAS               EQU        H'0003';
CPOL               EQU        H'0004';
CPHA               EQU        H'0005';
MSTEN              EQU        H'0006';
SPIBUSY            EQU        H'0007';


SPISCR             EQU          0x18F;
// bit and bitfield definitions

SPICRCP            EQU          0x190;
// bit and bitfield definitions 

SPIRXCRC           EQU          0x191;
// bit and bitfield definitions

SPITXCRC           EQU          0x192;
// bit and bitfield definitions 

SPIIER             EQU          0x193;
// bit and bitfield definitions
TXE                EQU        H'0000';
RXNE               EQU        H'0001';
RXERR              EQU        H'0002';
WAKUP              EQU        H'0003';


SPICR1             EQU          0x194;
// bit and bitfield definitions
LSBFIRST           EQU        H'0000';
CRCEN              EQU        H'0001';
CRCNXT             EQU        H'0002';
SSM                EQU        H'0003';
SSI                EQU        H'0004';
RXONLY             EQU        H'0005';
BDOE               EQU        H'0006';
BDM                EQU        H'0007';


SPISTAT            EQU          0x195;
// bit and bitfield definitions
CRCERR             EQU        H'0000';
WKF                EQU        H'0001';
RXOVRN             EQU        H'0004';
MODF               EQU        H'0005';
WCOL               EQU        H'0006';
SPIF               EQU        H'0007';


I2CCR1             EQU          0x196;
// bit and bitfield definitions
I2CEN              EQU        H'0000';
MASTER             EQU        H'0001';
START              EQU        H'0002';
WRN                EQU        H'0003';
STOP               EQU        H'0004';
ADDRM              EQU        H'0005';
STRET              EQU        H'0007';


I2CCR2             EQU          0x197;
// bit and bitfield definitions
I2CIE              EQU        H'0000';
DUTY               EQU        H'0004';
NACK               EQU        H'0005';
I2CADDRH0          EQU        H'0006';
I2CADDRH1          EQU        H'0007';


I2CADDR            EQU          0x198;
// bit and bitfield definitions  

I2CCCR             EQU          0x199;
// bit and bitfield definitions  

I2CDAT             EQU          0x19A;
// bit and bitfield definitions  

TKEN2              EQU          0x19C;
// bit and bitfield definitions  

TKEN3              EQU          0x19D;
// bit and bitfield definitions
TKCAPM             EQU        H'0006';
VREFM              EQU        H'0007';


I2CISR             EQU          0x19E;
// bit and bitfield definitions
IICTXEF            EQU        H'0000';
IICRXNEF           EQU        H'0001';
DIRF               EQU        H'0002';
BUSERR             EQU        H'0002';
I2CBUSY            EQU        H'0003';
NACKF              EQU        H'0004';
ADDRF              EQU        H'0005';
STOPF              EQU        H'0006';
HOLDF              EQU        H'0007';


UR0STAT            EQU          0x19F;
// bit and bitfield definitions
UR0TXEF            EQU        H'0000';
UR0RXNEF           EQU        H'0001';
UR0FEF             EQU        H'0002';
UR0RXFULL          EQU        H'0003';
UR0PEF             EQU        H'0004';
UR0OVF             EQU        H'0005';
UR0TXBSY           EQU        H'0006';


//BANK 4
ODCONA             EQU          0x205;
// bit and bitfield definitions  
   
ODCONB             EQU          0x206;
// bit and bitfield definitions  
   
ODCONC             EQU          0x207;
// bit and bitfield definitions  
   
ODCOND             EQU          0x208;
// bit and bitfield definitions
ODCOND0            EQU        H'0000';
ODCOND1            EQU        H'0001';
ODCOND2            EQU        H'0002';
ODCOND3            EQU        H'0003';
ODCOND4            EQU        H'0004';
ODCOND5            EQU        H'0005';

   
SCKCFG            EQU          0x209;
// bit and bitfield definitions
SCKOE             EQU        H'0001';
SCKEN             EQU        H'0007';


PSRCAL             EQU          0x20C;
// bit and bitfield definitions  

PSRCAH             EQU          0x20D;
// bit and bitfield definitions  
 
PSRCBL             EQU          0x20E;
// bit and bitfield definitions  
 
PSRCBH             EQU          0x20F;
// bit and bitfield definitions  
 
PSRCCL             EQU          0x210;
// bit and bitfield definitions  
 
PSRCCH             EQU          0x211;
// bit and bitfield definitions  

PSRCDL             EQU          0x212;
// bit and bitfield definitions  
 
PSRCDH             EQU          0x213;
// bit and bitfield definitions
PSRCDH0            EQU        H'0000';
PSRCDH1            EQU        H'0001';
PSRCDH2            EQU        H'0002';
PSRCDH3            EQU        H'0003';


PSINKA             EQU          0x214;
// bit and bitfield definitions  
 
PSINKB             EQU          0x215;
// bit and bitfield definitions  
 
PSINKC             EQU          0x216;
// bit and bitfield definitions  
 
PSINKD             EQU          0x217;
// bit and bitfield definitions
PSINKD0            EQU        H'0000';
PSINKD1            EQU        H'0001';
PSINKD2            EQU        H'0002';
PSINKD3            EQU        H'0003';
PSINKD4            EQU        H'0004';
PSINKD5            EQU        H'0005';


SOSCPRL            EQU          0x218;
// bit and bitfield definitions  
 
SOSCPRH            EQU          0x219;
// bit and bitfield definitions  


LVDCON             EQU          0x21A;
// bit and bitfield definitions
LVDM0              EQU        H'0000';
LVDM1              EQU        H'0001';
LVDM2              EQU        H'0002';
LVDDEB             EQU        H'0003';
LVDP               EQU        H'0004';
LVDCKS0            EQU        H'0005';
LVDCKS1            EQU        H'0006';
SYSON              EQU        H'0007';


SECCODE            EQU          0x21B;
// bit and bitfield definitions 

LVDTRIM            EQU          0x21C; 
// bit and bitfield definitions
LVRADJ0            EQU        H'0000';
LVRADJ1            EQU        H'0001';
LVRADJ2            EQU        H'0002';
LVDADJ0            EQU        H'0003';
LVDADJ1            EQU        H'0004';
LVDADJ2            EQU        H'0005';
LVDADJ3            EQU        H'0006';


VRP5VCAL           EQU          0x21D;
// bit and bitfield definitions  
 
VR2VCAL            EQU          0x21E;
// bit and bitfield definitions  
 
VR3VCAL            EQU          0x21F;
// bit and bitfield definitions  

//BANK5

COMAF0             EQU          0x285;
// bit and bitfield definitions
SCLPO0             EQU        H'0000';
SCLPO1             EQU        H'0001';
SDAPO0             EQU        H'0002';
SDAPO1             EQU        H'0003';
MISOPO             EQU        H'0004';
MOSIPO             EQU        H'0005';
NSSPO              EQU        H'0006';
SCKPO              EQU        H'0007';

 
COMAF1             EQU          0x286;
// bit and bitfield definitions
RX0PO0             EQU        H'0000';
RX0PO1             EQU        H'0001';
RX0PO2             EQU        H'0002';
TX0PO0             EQU        H'0003';
TX0PO1             EQU        H'0004';
TX0PO2             EQU        H'0005';
INTPO0             EQU        H'0006';
INTPO1             EQU        H'0007';


COMAF2             EQU          0x287;
// bit and bitfield definitions
RX1PO0             EQU        H'0000';
RX1PO1             EQU        H'0001';
INTFIXB            EQU        H'0002';
TX1PO0             EQU        H'0003';
TX1PO1             EQU        H'0004';
UR0SW              EQU        H'0006';
UR1SW              EQU        H'0007';

	
ANSEL2             EQU          0x28C;
// bit and bitfield definitions

ANSEL3             EQU          0x28D;
// bit and bitfield definitions

TKCTRIM            EQU          0x28E;
// bit and bitfield definitions
TKCTRIM0           EQU        H'0000';
TKCTRIM1           EQU        H'0001';
TKCTRIM2           EQU        H'0002';
TKCTRIM3           EQU        H'0003';


WPDA              EQU          0x290;
// bit and bitfield definitions  

WPDB              EQU          0x291;
// bit and bitfield definitions  

WPDC              EQU          0x292;
// bit and bitfield definitions  

WPDD              EQU          0x293;
// bit and bitfield definitions
WPDD0             EQU        H'0000';
WPDD1             EQU        H'0001';
WPDD2             EQU        H'0002';
WPDD3             EQU        H'0003';
WPDD4             EQU        H'0004';
WPDD5             EQU        H'0005';


WPUA              EQU          0x294;
// bit and bitfield definitions
WPUA0             EQU        H'0000';
WPUA1             EQU        H'0001';
WPUA2             EQU        H'0002';
WPUA3             EQU        H'0003';
WPUA4             EQU        H'0004';
WPUA5             EQU        H'0005';
WPUA6             EQU        H'0006';
WPUA7             EQU        H'0007';


WPUB              EQU          0x295;
// bit and bitfield definitions
WPUB0             EQU        H'0000';
WPUB1             EQU        H'0001';
WPUB2             EQU        H'0002';
WPUB3             EQU        H'0003';
WPUB4             EQU        H'0004';
WPUB5             EQU        H'0005';
WPUB6             EQU        H'0006';
WPUB7             EQU        H'0007';

WPUC              EQU          0x296;
// bit and bitfield definitions
WPUC0             EQU        H'0000';
WPUC1             EQU        H'0001';
WPUC2             EQU        H'0002';
WPUC3             EQU        H'0003';
WPUC4             EQU        H'0004';
WPUC5             EQU        H'0005';
WPUC6             EQU        H'0006';
WPUC7             EQU        H'0007';


WPUD              EQU          0x297;
// bit and bitfield definitions
WPUD0             EQU        H'0000';
WPUD1             EQU        H'0001';
WPUD2             EQU        H'0002';
WPUD3             EQU        H'0003';
WPUD4             EQU        H'0004';
WPUD5             EQU        H'0005';


DAC1DAT           EQU          0x29A;
// bit and bitfield definitions 

DAC2DAT           EQU          0x29B;
// bit and bitfield definitions 

DACCON0           EQU          0x29C;
// bit and bitfield definitions
DACVREF0          EQU        H'0000';
DACVREF1          EQU        H'0001';
DACEN             EQU        H'0002';
WNDEN             EQU        H'0003';
DEBPR0            EQU        H'0005';
DEBPR1            EQU        H'0006';
CMDEBS            EQU        H'0007';


CM0CON0           EQU          0x29D;
// bit and bitfield definitions
CM0NSEL0          EQU        H'0000';
CM0NSEL1          EQU        H'0001';
CM0PSEL0          EQU        H'0002';
CM0PSEL1          EQU        H'0003';
C0OUT             EQU        H'0004';
CM0OE             EQU        H'0005';
CM0POL            EQU        H'0006';
CM0EN             EQU        H'0007';


CM1CON0           EQU          0x29E;
// bit and bitfield definitions
CM1NSEL0          EQU        H'0000';
CM1NSEL1          EQU        H'0001';
CM1PSEL0          EQU        H'0002';
CM1PSEL1          EQU        H'0003';
C1OUT             EQU        H'0004';
CM1OE             EQU        H'0005';
CM1POL            EQU        H'0006';
CM1EN             EQU        H'0007';

//BANK6
;MSCON1          EQU          0x301;
;// bit and bitfield definitions
;HIRCM           EQU        H'0000';
;AUXPGE          EQU        H'0001';
;LVRCKS          EQU        H'0002';
;LVRDEB          EQU        H'0003';


FOSCCALH        EQU          0x309; 
// bit and bitfield definitions
FOSCCAL8        EQU        H'0000';
FOSCCAL9        EQU        H'0001';

//BANK7