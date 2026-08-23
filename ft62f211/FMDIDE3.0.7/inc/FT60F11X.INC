;==========================================================================
;
;       Register Definitions
;
;==========================================================================
W                EQU  H'0000' 
F                EQU  H'0001'
R                EQU  H'0001'			
;----- Register Files -----------------------------------------------------
;-----Bank0------------------
 INDF     EQU	 		H'0000'
 TMR0     EQU	 		H'0001'
 PCL      EQU	 		H'0002'
 STATUS   EQU	 		H'0003'
;-----------------STATUS bits------------------------------------------------------------
CARRY     EQU			H'0000'
DC        EQU			H'0001'
ZERO      EQU			H'0002'
nPD       EQU			H'0003'
nTO       EQU			H'0004'
RP        EQU			H'0005'

C         EQU     H'0000'
HC        EQU     H'0001'
Z         EQU     H'0002'
nPF       EQU     H'0003'
nTF       EQU     H'0004'
PAGE      EQU     H'0005'
;------------------------------------------------------------------------

FSR       EQU     H'0004'
PORTA     EQU     H'0005'
PORTC     EQU     H'0007'
PCLATH    EQU     H'000A'
INTCON    EQU     H'000B'
;-------------INTCON-----------------------------------------------------------
PAIF      EQU			H'0000'
INTF      EQU			H'0001'
T0IF      EQU			H'0002'
PAIE      EQU			H'0003'
INTE      EQU			H'0004'
T0IE      EQU			H'0005'
PEIE      EQU			H'0006'
GIE       EQU			H'0007'
;-----------------------------------------------------------------------------
// Register: PIR1
PIR1      EQU       H'000C'
;-------------PIR1-----------------------------------------------------------
TMR2IF    EQU       H'0001'
OSFIF     EQU       H'0002'
LVDIF     EQU       H'0005'
CKMIF     EQU       H'0006'
EEIF      EQU       H'0007'
;------------------------------------------------------------------------------

// Register: FOSCCAL
FOSCCAL     EQU       H'000D'
// bit and bitfield definitions
FOSCCAL0    EQU       H'0000'
FOSCCAL1    EQU       H'0001'
FOSCCAL2    EQU       H'0002'
FOSCCAL3    EQU       H'0003'
FOSCCAL4    EQU       H'0004'
FOSCCAL5    EQU       H'0005'


// Register: TMR2
P1ADTL      EQU       H'000E'

// Register: TMR2
P1BDTL      EQU       H'000F'
// bit and bitfield definitions

// Register: TMR2
P1CDTL      EQU       H'0010'
// bit and bitfield definitions

// Register: TMR2
TMR2L      EQU       H'0011'
// bit and bitfield definitions

// Register: T2CON
T2CON0     EQU       H'0012'
// bit and bitfield definitions
T2CKPS0   EQU       H'0000'
T2CKPS1   EQU       H'0001'
TMR2ON    EQU       H'0002'
TOUTPS0   EQU       H'0003'
TOUTPS1   EQU       H'0004'
TOUTPS2   EQU       H'0005'
TOUTPS3   EQU       H'0006'
PR2U      EQU       H'0007'

// Register: TMR2
TMR2H      EQU       H'0013'
// bit and bitfield definitions

// Register: TMR2
P1ADTH     EQU       H'0014'
// bit and bitfield definitions

// Register: P1BDTH
P1BDTH     EQU       H'0015'
// bit and bitfield definitions

// Register: P1CON
P1CON    EQU       H'0016'
// bit and bitfield definitions
P1DC0      EQU       H'0000'
P1DC1      EQU       H'0001'
P1DC2      EQU       H'0002'
P1DC3      EQU       H'0003'
P1DC4      EQU       H'0004'
P1DC5      EQU       H'0005'
P1DC6      EQU       H'0006'
P1AUE      EQU       H'0007'



// Register: P1BR0
P1BR0    EQU       H'0017'
// bit and bitfield definitions
P1ASS0      EQU       H'0000'
P1ASS1      EQU       H'0001'
P1BSS0      EQU       H'0002'
P1BSS1      EQU       H'0003'
P1BK2       EQU       H'0004'
P1BK1       EQU       H'0005'
P1BK0       EQU       H'0006'
P1BEVT      EQU       H'0007'


// Register: WDTCON
WDTCON   EQU       H'0018'
// bit and bitfield definitions
SWDTEN       EQU       H'0000'
WDTPS0       EQU       H'0001'
WDTPS1       EQU       H'0002'
WDTPS2       EQU       H'0003'
WDTPS3       EQU       H'0004'
WCKSRC0      EQU       H'0005'
WCKSRC1      EQU       H'0006'


// Register: CMCON0
P1BR1   EQU       H'0019'
// bit and bitfield definitions
P1CSS0         EQU       H'0000'
P1CSS1         EQU       H'0001'
P1BALT         EQU       H'0002'
P1CALT         EQU       H'0003'
P1B2SS0        EQU       H'0004'
P1B2SS1        EQU       H'0005'
P1C2SS0        EQU       H'0006'
P1C2SS1        EQU       H'0007'

// Register: PR0
P1CDTH   EQU       H'001A'
// bit and bitfield definitions

// Register: MSCKCON
MSCON        	EQU 	  H'001B'
// bit and bitfield definitions
T2CKRUN         EQU       H'0000'
CKCNTI          EQU       H'0001'
CKMAVG          EQU       H'0002'
SLVREN          EQU       H'0003'
PSRCAH3         EQU       H'0004'
PSRCAH4         EQU       H'0005'


// Register: SOSCPRL
SOSCPRL   EQU       H'001C'
// bit and bitfield definitions

// Register: SOSCPRH
SOSCPRH    EQU       H'001D'
// bit and bitfield definitions
SOSCPRH0         EQU       H'0000'
SOSCPRH1         EQU       H'0001'
SOSCPRH2         EQU       H'0002'
SOSCPRH3         EQU       H'0003'

// Register: P1AUX
P1AUX    EQU       H'001E'
// bit and bitfield definitions
P1BF2         EQU        H'0000'
P1BF2E         EQU       H'0001'
P1CF2         EQU        H'0002'
P1CF2E         EQU       H'0003'


// Register: T0CON0
T0CON0    EQU       H'001F'
// bit and bitfield definitions
T0CKSRC0        EQU       H'0000'
T0CKSRC1        EQU       H'0001'
T0CKRUN         EQU       H'0002'
T0ON            EQU       H'0003'
//
// Special function register definitions: Bank 1
//


// Register: OPTION_REG
OPTION_REG	  EQU       H'0081'
OPTION	  EQU       H'0081'
// bit and bitfield definitions
PS0       EQU       H'0000'
PS1       EQU       H'0001'
PS2       EQU       H'0002'
PSA       EQU       H'0003'
T0SE      EQU       H'0004'
T0CS      EQU       H'0005'
INTEDG    EQU       H'0006'
nPAPU     EQU       H'0007'

// Register: TRISA
TRISA     EQU       H'0085'
// bit and bitfield definitions
TRISA0    EQU       H'0000'
TRISA1    EQU       H'0001'
TRISA2    EQU       H'0002'
TRISA3    EQU       H'0003'
TRISA4    EQU       H'0004'
TRISA5    EQU       H'0005'
TRISA6    EQU       H'0006'
TRISA7    EQU       H'0007'


// Register: TRISC
TRISC     EQU       H'0087'
// bit and bitfield definitions
TRISC0    EQU       H'0000'
TRISC1    EQU       H'0001'
TRISC2    EQU       H'0002'
TRISC3    EQU       H'0003'
TRISC4    EQU       H'0004'
TRISC5    EQU       H'0005'

// Register: PSRCA
PSRCA     EQU       H'0088'
// Register: WPDA
WPDA     EQU       H'0089'
// Register: PIE1
PIE1      EQU       H'008C'
// bit and bitfield definitions
TMR2IE    EQU       H'0001'
OSFIE     EQU       H'0002'
LVDIE     EQU       H'0005'
CKMIE     EQU       H'0006'
EEIE      EQU       H'0007'

// Register: PIE1
WPDC      EQU       H'008D'
// bit and bitfield definitions
WPDC0     EQU        H'0000'
WPDC1     EQU    	 	 H'0001'
WPDC2     EQU     	 H'0002'
WPDC3     EQU     	 H'0003'
WPDC4     EQU     	 H'0004'
WPDC5     EQU     	 H'0005'
// Register: PCON
PCON      EQU       H'008E'
// bit and bitfield definitions
nBOR      EQU       H'0000'
nPOR      EQU       H'0001'
LVDW      EQU       H'0002'
LVDEN     EQU       H'0003'
LVD0      EQU       H'0004'
LVD1      EQU       H'0005'
LVD2      EQU       H'0006'
LVDM      EQU       H'0007'

// Register: OSCCON
OSCCON    EQU       H'008F'
// bit and bitfield definitions
SCS          EQU       H'0000'
LTS          EQU       H'0001'
HTS          EQU       H'0002'
OSTS         EQU       H'0003'
IRCF0        EQU       H'0004'
IRCF1        EQU       H'0005'
IRCF2        EQU       H'0006'
LFMOD        EQU       H'0007'

// Register: P1OE
P1OE         EQU       H'0090'
// bit and bitfield definitions
P1A0OE       EQU		   H'0000'
P1A0NOE      EQU       H'0001'
P1A1OE       EQU       H'0002'
P1A1NOE      EQU       H'0003'
P1A2OE       EQU       H'0004'
P1A2NOE      EQU       H'0005'
P1BOE        EQU       H'0006'
P1COE        EQU       H'0007'
// Register: PR2L
PR2L    EQU       H'0091'
// bit and bitfield definitions
// Register: PR2H
PR2H    EQU       H'0092'
// bit and bitfield definitions

// Register: WPUC
WPUC    EQU       H'0093'
// bit and bitfield definitions
WPUC0        EQU       H'0000'
WPUC1        EQU       H'0001'
WPUC2        EQU       H'0002'
WPUC3        EQU       H'0003'
WPUC4        EQU       H'0004'
WPUC5        EQU       H'0005'

// Register: WPUC
PSRCC    EQU       H'0094'
// bit and bitfield definitions
PSRCC0        EQU       H'0000'
PSRCC1        EQU       H'0001'
PSRCC2        EQU       H'0002'
PSRCC3        EQU       H'0003'
PSRCC4        EQU       H'0004'
PSRCC5        EQU       H'0005'
// Register: WPUA
WPUA      EQU       H'0095'
WPU       EQU       H'0095'
// bit and bitfield definitions
WPUA0     EQU       H'0000'
WPUA1     EQU       H'0001'
WPUA2     EQU       H'0002'
WPUA3     EQU       H'0003'
WPUA4     EQU       H'0004'
WPUA5     EQU       H'0005'
WPUA6     EQU       H'0006'
WPUA7     EQU       H'0007'

WPU0      EQU       H'0000'
WPU1      EQU       H'0001'
WPU2      EQU       H'0002'
WPU3      EQU       H'0003'
WPU4      EQU       H'0004'
WPU5      EQU       H'0005'
WPU6      EQU       H'0006'
WPU7      EQU       H'0007'

// Register: IOCA
IOCA      EQU       H'0096'
IOC       EQU       H'0096'
// bit and bitfield definitions
IOCA0     EQU       H'0000'
IOCA1     EQU       H'0001'
IOCA2     EQU       H'0002'
IOCA3     EQU       H'0003'
IOCA4     EQU       H'0004'
IOCA5     EQU       H'0005'
IOCA6     EQU       H'0006'
IOCA7     EQU       H'0007'

IOC0      EQU       H'0000'
IOC1      EQU       H'0001'
IOC2      EQU       H'0002'
IOC3      EQU       H'0003'
IOC4      EQU       H'0004'
IOC5      EQU       H'0005'
IOC6      EQU       H'0006'
IOC7      EQU       H'0007'

// Register: PSINKA
PSINKA      EQU       H'0097'

// Register: VRCON
P1POL    EQU       H'0099'
// bit and bitfield definitions
P1A0P    EQU       H'0000'
P1A1P    EQU       H'0001'
P1A2P    EQU       H'0002'
P1A3P    EQU       H'0003'
P1A4P    EQU       H'0004'
P1A5P    EQU       H'0005'
P1BP     EQU       H'0006'
P1CP     EQU       H'0007'

// Register: EEDAT
EEDAT    EQU       H'009A'
EEDATA   EQU       H'009A'
// bit and bitfield definitions

// Register: EEADR
EEADR    EQU       H'009B'
// bit and bitfield definitions


// Register: EECON1
EECON1    EQU       H'009C'
// bit and bitfield definitions
RD        EQU       H'0000'
WREN1     EQU       H'0002'
WRERR     EQU       H'0003'
WREN2     EQU       H'0004'
WREN3     EQU       H'0005'

// Register: EECON2
EECON2   EQU       H'009D'
// bit and bitfield definitions
WR        EQU       H'0000'


// Register: T2CON1
T2CON1   EQU       H'009E'
// bit and bitfield definitions
T2CKRC0       EQU       H'0000'
T2CKRC1       EQU       H'0001'
T2CKRC2       EQU       H'0002'
P1BZM         EQU       H'0003'
P1OS          EQU       H'0004'

// Register: PSINKC
PSINKC   EQU       H'009F'
// bit and bitfield definitions
PSINKC0       EQU       H'0000'
PSINKC1       EQU       H'0001'
PSINKC2       EQU       H'0002'
PSINKC3       EQU       H'0003'
PSINKC4       EQU       H'0004'
PSINKC5       EQU       H'0005'
//---------------------------------------------------------------------------
//#endif
