
;==========================================================================
W                EQU  H'0000' 
F                EQU  H'0001'
R                EQU  H'0001'				
;==========================================================================
// Register: INDF0
INDF0               EQU    0x000;
// bit and bitfield definitions

// Register: INDF1
INDF1               EQU    0x001;
// bit and bitfield definitions

// Register: PCL
PCL                 EQU    0x002;
// bit and bitfield definitions

// Register: STATUS
STATUS              EQU    0x003;
// bit and bitfield definitions
C                   EQU    H'0000';
DC                  EQU    H'0001';
Z                   EQU    H'0002';
nPD                 EQU    H'0003';
nTO                 EQU    H'0004';

// Register: FSR0L
FSR0L               EQU    0x004;
// bit and bitfield definitions

// Register: FSR0H
FSR0H               EQU    0x005;
// bit and bitfield definitions

// Register: FSR1L
FSR1L               EQU    0x006;
// bit and bitfield definitions

// Register: FSR1H
FSR1H               EQU    0x007;
// bit and bitfield definitions

// Register: BSR
BSREG                 EQU    0x008;
// bit and bitfield definitions
BSREG0                EQU    H'0000';
BSREG1                EQU    H'0001';
BSREG2                EQU    H'0002';
BSREG3                EQU    H'0003';
BSREG4                EQU    H'0004';

// Register: WREG
WREG                EQU    0x009;
// bit and bitfield definitions

// Register: PCLATH
PCLATH              EQU    0x00A;

// Register: INTCON
INTCON              EQU    0x00B;
// bit and bitfield definitions
OSFIF               EQU    H'0000';
LVDIF               EQU    H'0001';
EEIF                EQU    H'0002';
OSFIE               EQU    H'0003';
LVDIE               EQU    H'0004';
EEIE                EQU    H'0005';
PEIE                EQU    H'0006';
GIE                 EQU    H'0007';

// Register: PORTA
PORTA               EQU    0x00C;
// bit and bitfield definitions
RA0                 EQU    H'0000';
RA1                 EQU    H'0001';
RA2                 EQU    H'0002';
RA3                 EQU    H'0003';
RA4                 EQU    H'0004';
RA5                 EQU    H'0005';
RA6                 EQU    H'0006';
RA7                 EQU    H'0007';

PA0                 EQU    H'0000';
PA1                 EQU    H'0001';
PA2                 EQU    H'0002';
PA3                 EQU    H'0003';
PA4                 EQU    H'0004';
PA5                 EQU    H'0005';
PA6                 EQU    H'0006';
PA7                 EQU    H'0007';

// Register: PORTB
PORTB               EQU    0x00D;
// bit and bitfield definitions
RB0                 EQU    H'0000';
RB1                 EQU    H'0001';
RB2                 EQU    H'0002';
RB3                 EQU    H'0003';
RB4                 EQU    H'0004';
RB5                 EQU    H'0005';
RB6                 EQU    H'0006';
RB7                 EQU    H'0007';

PB0                 EQU    H'0000';
PB1                 EQU    H'0001';
PB2                 EQU    H'0002';
PB3                 EQU    H'0003';
PB4                 EQU    H'0004';
PB5                 EQU    H'0005';
PB6                 EQU    H'0006';
PB7                 EQU    H'0007';

// Register: PORTC
PORTC               EQU    0x00E;
// bit and bitfield definitions
RC0                 EQU    H'0000';
RC1                 EQU    H'0001';
RC2                 EQU    H'0002';
RC3                 EQU    H'0003';
RC4                 EQU    H'0004';
RC5                 EQU    H'0005';
RC6                 EQU    H'0006';
RC7                 EQU    H'0007';

PC0                 EQU    H'0000';
PC1                 EQU    H'0001';
PC2                 EQU    H'0002';
PC3                 EQU    H'0003';
PC4                 EQU    H'0004';
PC5                 EQU    H'0005';
PC6                 EQU    H'0006';
PC7                 EQU    H'0007';

// Register: PORTD
PORTD               EQU    0x00F;
// bit and bitfield definitions
RD0                 EQU    H'0000';
RD1                 EQU    H'0001';
RD2                 EQU    H'0002';
RD3                 EQU    H'0003';
RD4                 EQU    H'0004';
RD5                 EQU    H'0005';

PD0                 EQU    H'0000';
PD1                 EQU    H'0001';
PD2                 EQU    H'0002';
PD3                 EQU    H'0003';
PD4                 EQU    H'0004';
PD5                 EQU    H'0005';

// Register: PIR1
PIR1                  EQU    0x011;
// bit and bitfield definitions
ADCIF               EQU    H'0000';
CKMIF               EQU    H'0001';
TKIF                EQU    H'0002';


// Register: EPIF0
EPIF0               EQU    0x014;
// bit and bitfield definitions

// Register: SPIDATA
SPIDATA             EQU    0x015;
// bit and bitfield definitions
// bit and bitfield definitions

// Register: SPICTRL
SPICTRL             EQU    0x016;
// bit and bitfield definitions
SPIEN               EQU    H'0000';
TXBMT               EQU    H'0001';
NSSM0               EQU    H'0002';
NSSM1               EQU    H'0003';
RXOVRN              EQU    H'0004';
MODF                EQU    H'0005';
WCOL                EQU    H'0006';
SPIF                EQU    H'0007 ;

// Register: SPICFG
SPICFG             EQU    0x017;
// bit and bitfield definitions
RXBMT               EQU    H'0000';
SRMT                EQU    H'0001';
NSSVAL              EQU    H'0002';
SLAS                EQU    H'0003';
CPOL                EQU    H'0004';
CPHA                EQU    H'0005';
MSTEN               EQU    H'0006';
BUSY                EQU    H'0007 ;
// Register: SPISCR
SPISCR               EQU    0x018;
// bit and bitfield definitions

// Register: SPICRCPOL
SPICRCPOL            EQU    0x019;

// Register: SPIRXCRC
SPIRXCRC             EQU    0x01A;

// Register: SPIRXCRC
SPITXCRC             EQU    0x01B;

// Register: SPIIER
SPIIER               EQU    0x01C;
// bit and bitfield definitions
TXE                 EQU    H'0000';
RXNE                EQU    H'0001';
RXERR               EQU    H'0002';
WAKUP               EQU    H'0003';

// Register: SPICTRL2
SPICTRL2               EQU    0x01D;
// bit and bitfield definitions
LSBFIRST            EQU    H'0000';
CRCEN               EQU    H'0001';
CRCNXT              EQU    H'0002';
SSM                 EQU    H'0003';
SSI                 EQU    H'0004';
RXONLY              EQU    H'0005';
BDOE                EQU    H'0006';
BDM                 EQU    H'0007';

// Register: SPISTAT
SPISTAT             EQU    0x01E;
// bit and bitfield definitions
CRCERR                 EQU    H'0000';
WKF                    EQU    H'0001';
STXBMT                 EQU    H'0002';
SRXBMT                 EQU    H'0003';
SBUSY                  EQU    H'0004';
SRXOVRN                EQU    H'0005';
SMODF                  EQU    H'0006';

// Register: ADDLY
ADDLY             EQU    0x01F;

//
// Special function register definitions: Bank 1
//

//--------------------------------------------------------------------------------------
// Register: TRISA
// PORTA Data Direction Control Register
TRISA               EQU    0x08C;
// bit and bitfield definitions
TRISA0              EQU    H'0000';
TRISA1              EQU    H'0001';
TRISA2              EQU    H'0002';
TRISA3              EQU    H'0003';
TRISA4              EQU    H'0004';
TRISA5              EQU    H'0005';
TRISA6              EQU    H'0006';
TRISA7              EQU    H'0007';

// Register: TRISB
// PORTB Data Direction Control Register
TRISB               EQU    0x08D;
// bit and bitfield definitions
TRISB0              EQU    H'0000';
TRISB1              EQU    H'0001';
TRISB2              EQU    H'0002';
TRISB3              EQU    H'0003';
TRISB4              EQU    H'0004';
TRISB5              EQU    H'0005';
TRISB6              EQU    H'0006';
TRISB7              EQU    H'0007';

// Register: TRISC
// PORTC Data Direction Control Register
TRISC               EQU    0x08E;
// bit and bitfield definitions
TRISC0              EQU    H'0000';
TRISC1              EQU    H'0001';
TRISC2              EQU    H'0002';
TRISC3              EQU    H'0003';
TRISC4              EQU    H'0004';
TRISC5              EQU    H'0005';
TRISC6              EQU    H'0006';
TRISC7              EQU    H'0007';

// Register: TRISD
TRISD               EQU    0x08F;
// bit and bitfield definitions
TRISD0              EQU    H'0000';
TRISD1              EQU    H'0001';
TRISD2              EQU    H'0002';
TRISD3              EQU    H'0003';
TRISD4              EQU    H'0004';
TRISD5              EQU    H'0005';

// Register: PIE1
PIE1                EQU    0x091;
// bit and bitfield definitions
ADCIE              EQU    H'0000';
CKMIE              EQU    H'0001';
TKIE               EQU    H'0002';

// Register: EPIE0
// Peripheral LVDIErrupt Enable Register 3
EPIE0                EQU    0x094;

// Register: CKOCON
// Option Register
CKOCON          EQU    0x095;
// bit and bitfield definitions
CCOEN               EQU   H'0000';
CCOSEL0             EQU   H'0001';
CCOSEL1             EQU   H'0002';
CCOSEL2             EQU   H'0003';
DTYSEL0             EQU   H'0004';
DTYSEL1             EQU   H'0005';
CCORDY              EQU   H'0006';
SYSON               EQU   H'0007';

// Register: PCON
// Power Control Register
PCON                EQU    0x096;
// bit and bitfield definitions
nBORF                EQU    H'0000';
nPORF                EQU    H'0001';
nSRSTF               EQU    H'0002';
nMCLRF               EQU    H'0003';
IERRF                EQU    H'0004';
EMCF                 EQU    H'0005';
STKUNF               EQU    H'0006';
STKOVF               EQU    H'0007';

// Register: WDTCON
// Watchdog Timer Control Register
WDTCON              EQU    0x097;
// bit and bitfield definitions
SWDTEN              EQU    H'0000';
WDTPS0              EQU    H'0001';
WDTPS1              EQU    H'0002';
WDTPS2              EQU    H'0003';
WDTPS3              EQU    H'0004';
WDTPRE0             EQU    H'0005';
WDTPRE1             EQU    H'0006';
WDTPRE2             EQU    H'0007';

// Register: OSCTUNE
// Oscillator Tuning Register
OSCTUNE             EQU    0x098;
// bit and bitfield definitions
TUN0                EQU    H'0000';
TUN1                EQU    H'0001';
TUN2                EQU    H'0002';
TUN3                EQU    H'0003';
TUN4                EQU    H'0004';
TUN5                EQU    H'0005';
TUN6                EQU    H'0006';

// Register: OSCCON
// Oscillator Control Register
OSCCON              EQU    0x099;
// bit and bitfield definitions
SCS                 EQU    H'0000';
LTS                 EQU    H'0001';
HTS                 EQU    H'0002';
OSTS                EQU    H'0003';
MCKCF0              EQU    H'0004';
MCKCF1              EQU    H'0005';
MCKCF2              EQU    H'0006';
MCKCF3              EQU    H'0007';

// Register: PCKEN
// Oscillator Status Register
PCKEN             EQU    0x09A;
// bit and bitfield definitions
ADCEN               EQU    H'0000';
TIM1EN              EQU    H'0001';
TIM2EN              EQU    H'0002';
TIM4EN              EQU    H'0003';
SPICKEN             EQU    H'0004';
UARTEN              EQU    H'0005';
I2CEN               EQU    H'0006';
TKEN                EQU    H'0007';

// Register: ADRESL
// A/D Result Register LSB
ADRESL              EQU    0x09B;
// bit and bitfield definitions

// Register: ADRESH
// A/D Result Register MSB
ADRESH              EQU    0x09C;
// bit and bitfield definitions

// Register: ADCON0
// Analog-to-Digital Control Register 0
ADCON0              EQU    0x09D;
// bit and bitfield definitions
ADON                EQU    H'0000';
GO                  EQU    H'0001';
nDONE               EQU    H'0001';
ADEX                EQU    H'0002';
ADCAL               EQU    H'0003';
CHS0                EQU    H'0004';
CHS1                EQU    H'0005';
CHS2                EQU    H'0006';
CHS3                EQU    H'0007';

// Register: ADCON1
// Analog-to-Digital Control Register 1
ADCON1              EQU    0x09E;
// bit and bitfield definitions
ADPREF0             EQU    H'0000';
ADPREF1             EQU    H'0001';
ADNREF0             EQU    H'0002';
ADNREF1             EQU    H'0003';
ADCS0               EQU    H'0004';
ADCS1               EQU    H'0005';
ADCS2               EQU    H'0006';
ADFM                EQU    H'0007';

// Register: ADCON2
// Analog-to-Digital Control Register 1
ADCON2              EQU    0x09F;
// bit and bitfield definitions
ETGSEL0             EQU    H'0000';
ETGSEL1             EQU    H'0001';
ETGSEL2             EQU    H'0002';
ADDLY8              EQU    H'0003';
ETGTYP0             EQU    H'0004';
ETGTYP1             EQU    H'0005';
ADINTREF0           EQU    H'0006';
ADINTREF1           EQU    H'0007';

//
// Special function register definitions: Bank 2
//


// Register: LATA
LATA                EQU    0x10C;
// bit and bitfield definitions
LATA0               EQU    H'0000';
LATA1               EQU    H'0001';
LATA2               EQU    H'0002';
LATA3               EQU    H'0003';
LATA4               EQU    H'0004';
LATA5               EQU    H'0005';
LATA6               EQU    H'0006';
LATA7               EQU    H'0007';

// Register: LATB
LATB                EQU    0x10D;
// bit and bitfield definitions
LATB0               EQU    H'0000';
LATB1               EQU    H'0001';
LATB2               EQU    H'0002';
LATB3               EQU    H'0003';
LATB4               EQU    H'0004';
LATB5               EQU    H'0005';
LATB6               EQU    H'0006';
LATB7               EQU    H'0007';

// Register: LATC
LATC                EQU    0x10E;
// bit and bitfield definitions
LATC0               EQU    H'0000';
LATC1               EQU    H'0001';
LATC2               EQU    H'0002';
LATC3               EQU    H'0003';
LATC4               EQU    H'0004';
LATC5               EQU    H'0005';
LATC6               EQU    H'0006';
LATC7               EQU    H'0007';

// Register: LATD
LATD                EQU    0x10F;
// bit and bitfield definitions
LATD0               EQU    H'0000';
LATD1               EQU    H'0001';
LATD2               EQU    H'0002';
LATD3               EQU    H'0003';
LATD4               EQU    H'0004';
LATD5               EQU    H'0005';

// Register: TIM4CR1
TIM4CR1             EQU    0x111;
// bit and bitfield definitions
T4CEN                 EQU    H'0000';
T4UDIS                EQU    H'0001';
T4URS                 EQU    H'0002';
T4OPM                 EQU    H'0003';
T4CKS0                EQU    H'0004';
T4CKS1                EQU    H'0005';
T4ARPE                EQU    H'0007';

// Register: TIM4IER
TIM4IER             EQU    0x112;
// bit and bitfield definitions
T4UIE                EQU    H'0000';

// Register: TIM4SR
TIM4SR             EQU    0x113;
// bit and bitfield definitions
T4UIF              EQU    H'0000';

// Register: TIM4EGR
// Comparator Output Register
TIM4EGR               EQU    0x114;
// bit and bitfield definitions
T4UG              EQU    H'0000';

// Register: TIM4CNTR
// Brown-out Reset Control Register
TIM4CNTR              EQU    0x115;
// bit and bitfield definitions

// Register: TIM4PSCR 
// Voltage Reference Control Register 0
TIM4PSCR              EQU    0x116;
// bit and bitfield definitions
T4PSC0              EQU    H'0000';
T4PSC1              EQU    H'0001';
T4PSC2              EQU    H'0002';

// Register: TIM4ARR
// Brown-out Reset Control Register
TIM4ARR              EQU    0x117;
// bit and bitfield definitions

// Register: EPS0
// Voltage Reference Control Register 1
EPS0             EQU    0x118;
// bit and bitfield definitions

// Register: EPS1
// Voltage Reference Control Register 1
EPS1             EQU    0x119;
// bit and bitfield definitions

// Register: PSRC0
// SR Latch Control Register 0
PSRC0              EQU    0x11A;
// bit and bitfield definitions

// Register: PSRC1
// SR Latch Control Register 1
PSRC1              EQU    0x11B;
// bit and bitfield definitions

// Register: MISC0
// SR Latch Control Register 1
MISC0              EQU    0x11C;
// bit and bitfield definitions
WCKSEL0              EQU    H'0000';
WCKSEL1              EQU    H'0001';
// Register: AFP2
// SR Latch Control Register 0
AFP2              EQU    0x11D;

// Register: ITYPE0
// SR Latch Control Register 0
ITYPE0              EQU    0x11E;
// bit and bitfield definitions


// Register: PSRC1
// SR Latch Control Register 1
ITYPE1              EQU    0x11F;
// bit and bitfield definitions


//
// Special function register definitions: Bank 3
//


// Register: WPUA
WPUA              EQU    0x18C;
// bit and bitfield definitions
WPUA0               EQU    H'0000';
WPUA1               EQU    H'0001';
WPUA2               EQU    H'0002';
WPUA3               EQU    H'0003';
WPUA4               EQU    H'0004';
WPUA5               EQU    H'0005';
WPUA6               EQU    H'0006';
WPUA7               EQU    H'0007';

// Register: WPUB
WPUB              EQU    0x18D;
// bit and bitfield definitions
WPUB0               EQU    H'0000';
WPUB1               EQU    H'0001';
WPUB2               EQU    H'0002';
WPUB3               EQU    H'0003';
WPUB4               EQU    H'0004';
WPUB5               EQU    H'0005';
WPUB6               EQU    H'0006';
WPUB7               EQU    H'0007';

// Register: WPUC
WPUC              EQU    0x18E;
// bit and bitfield definitions
WPUC0               EQU    H'0000';
WPUC1               EQU    H'0001';
WPUC2               EQU    H'0002';
WPUC3               EQU    H'0003';
WPUC4               EQU    H'0004';
WPUC5               EQU    H'0005';
WPUC6               EQU    H'0006';
WPUC7               EQU    H'0007';

// Register: WPUD
WPUD              EQU    0x18F;
// bit and bitfield definitions
WPUD0               EQU    H'0000';
WPUD1               EQU    H'0001';
WPUD2               EQU    H'0002';
WPUD3               EQU    H'0003';
WPUD4               EQU    H'0004';
WPUD5               EQU    H'0005';

// Register: EEADRL
EEADRL              EQU    0x191;
// bit and bitfield definitions

// Register: EEADRH
EEADRH              EQU    0x192;
// bit and bitfield definitions
EEADRH0               EQU    H'0000';
EEADRH1               EQU    H'0001';
EEADRH2               EQU    H'0002';
EEADRH3               EQU    H'0003';
EEADRH4               EQU    H'0004';
EEADRH5               EQU    H'0005';
EEADRH6               EQU    H'0006';

// Register: EEDATL
EEDATL              EQU    0x193;

// Register: EEDATH
EEDATH              EQU    0x194;
// bit and bitfield definitions

// Register: EECON1
EECON1              EQU    0x195;
// bit and bitfield definitions
RD                  EQU    H'0000';
WR                  EQU    H'0001';
WREN                EQU    H'0002';
WRERR               EQU    H'0003';
FERAE               EQU    H'0004'; 
CFGS                EQU    H'0006';
EEPGD               EQU    H'0007';

// Register: EECON2
EECON2              EQU    0x196;
// bit and bitfield definitions

// Register: ANSELA
ANSELA              EQU    0x197;
// bit and bitfield definitions
// Register: EECON3
EECON3              EQU    0x198;
// bit and bitfield definitions
DRDEN               EQU    H'0000';

// Register: LVDCON
LVDCON               EQU    0x199;
// bit and bitfield definitions
LVDL0               EQU    H'0000';
LVDL1               EQU    H'0001';
LVDL2               EQU    H'0002';
LVDW                EQU    H'0003';
LVDEN               EQU    H'0004'; 
LVDM                EQU    H'0006';
SLVREN              EQU    H'0007';

// Register: PSINK0
PSINK0               EQU    0x19A;
// bit and bitfield definitions

// Register: PSINK1
PSINK1              EQU    0x19B;

// Register: PSINK2
PSINK2              EQU    0x19C;
// bit and bitfield definitions

// Register: PSINK3
// Receive Status and Control Register
PSINK3               EQU    0x19D;
// bit and bitfield definitions
PSINK30               EQU    H'0000';
PSINK31               EQU    H'0001';
PSINK32               EQU    H'0002';
PSINK33               EQU    H'0003';
PSINK34               EQU    H'0004';
PSINK35               EQU    H'0005';

// Register: AFP0
// Transmit Status and Control Register
AFP0               EQU    0x19E;
// bit and bitfield definitions

// Register: AFP1
// Baud Rate Control Register
AFP1               EQU    0x19F;
// bit and bitfield definitions

//
// Special function register definitions: Bank 4
//

// Register: WPDA
WPDA                EQU    0x20C;
// bit and bitfield definitions
WPDA0               EQU    H'0000';
WPDA1               EQU    H'0001';
WPDA2               EQU    H'0002';
WPDA3               EQU    H'0003';
WPDA4               EQU    H'0004';
WPDA5               EQU    H'0005';
WPDA6               EQU    H'0006';
WPDA7               EQU    H'0007';


// Register: WPDB
WPDB                EQU    0x20D;
// bit and bitfield definitions
WPDB0               EQU    H'0000';
WPDB1               EQU    H'0001';
WPDB2               EQU    H'0002';
WPDB3               EQU    H'0003';
WPDB4               EQU    H'0004';
WPDB5               EQU    H'0005';
WPDB6               EQU    H'0006';
WPDB7               EQU    H'0007';

// Register: WPDC
WPDC                EQU    0x20E;
// bit and bitfield definitions
WPDC0               EQU    H'0000';
WPDC1               EQU    H'0001';
WPDC2               EQU    H'0002';
WPDC3               EQU    H'0003';
WPDC4               EQU    H'0004';
WPDC5               EQU    H'0005';
WPDC6               EQU    H'0006';
WPDC7               EQU    H'0007';

// Register: WPDD
WPDD                EQU    0x20F;
// bit and bitfield definitions
WPDD0               EQU    H'0000';
WPDD1               EQU    H'0001';
WPDD2               EQU    H'0002';
WPDD3               EQU    H'0003';
WPDD4               EQU    H'0004';
WPDD5               EQU    H'0005';


// Register: TIM1CR1
TIM1CR1              EQU    0x211;
// bit and bitfield definitions
T1CEN                 EQU    H'0000';
T1UDIS                EQU    H'0001';
T1URS                 EQU    H'0002';
T1OPM                 EQU    H'0003';
T1DIR                 EQU    H'0004';
T1CMS0                EQU    H'0005';
T1CMS1                EQU    H'0006';
T1ARPE                EQU    H'0007';


// Register: TIM1SMCR
TIM1SMCR             EQU    0x213;
// bit and bitfield definitions
T1SMS0                EQU    H'0000';
T1SMS1                EQU    H'0001';
T1SMS2                EQU    H'0002';
T1TS0                 EQU    H'0004';
T1TS1                 EQU    H'0005';
T1TS2                 EQU    H'0006';


// Register: TIM1IER
TIM1IER             EQU    0x215;
// bit and bitfield definitions
T1UIE                 EQU    H'0000';
T1CC1IE               EQU    H'0001';
T1CC2IE               EQU    H'0002';
T1CC3IE               EQU    H'0003';
T1CC4IE               EQU    H'0004';
T1TIE                 EQU    H'0006';
T1BIE                 EQU    H'0007';

// Register: TIM1SR1
TIM1SR1             EQU    0x216;
// bit and bitfield definitions
T1UIF               EQU    H'0000';
T1CC1IF             EQU    H'0001';
T1CC2IF             EQU    H'0002';
T1CC3IF             EQU    H'0003';
T1CC4IF             EQU    H'0004';
T1TIF               EQU    H'0006';
T1BIF               EQU    H'0007';

// Register: TIM1SR2
TIM1SR2             EQU    0x217;
// bit and bitfield definitions
T1CC1OF               EQU    H'0001';
T1CC2OF               EQU    H'0002';
T1CC3OF               EQU    H'0003';
T1CC4OF               EQU    H'0004';

// Register: TIM1EGR
TIM1EGR             EQU    0x218;
// bit and bitfield definitions
T1CC1G               EQU    H'0001';
T1CC2G               EQU    H'0002';
T1CC3G               EQU    H'0003';
T1CC4G               EQU    H'0004';
T1BG                 EQU    H'0007';

// Register: TIM1CCMR1
TIM1CCMR1             EQU    0x219;
// bit and bitfield definitions
T1CC1S0              EQU    H'0000';
T1CC1S1              EQU    H'0001';
T1OC1PE              EQU    H'0003';
T1OC1M0              EQU    H'0004';
T1OC1M1              EQU    H'0005';
T1OC1M2              EQU    H'0006';

T1IC1PSC0            EQU    H'0002';
T1IC1PSC1            EQU    H'0003';
T1IC1F0              EQU    H'0004';
T1IC1F1              EQU    H'0005';
T1IC1F2              EQU    H'0006';
T1IC1F3              EQU    H'0007';

// Register: TIM1CCMR2
TIM1CCMR2             EQU    0x21A;
// bit and bitfield definitions
T1CC2S0                EQU    H'0000';
T1CC2S1                EQU    H'0001';
T1OC2PE                EQU    H'0003';
T1OC2M0                EQU    H'0004';
T1OC2M1                EQU    H'0005';
T1OC2M2                EQU    H'0006';

T1IC2PSC0              EQU    H'0002';
T1IC2PSC1              EQU    H'0003';
T1IC2F0                EQU    H'0004';
T1IC2F1                EQU    H'0005';
T1IC2F2                EQU    H'0006';
T1IC2F3                EQU    H'0007';


// Register: TIM1CCMR3
TIM1CCMR3             EQU    0x21B;
// bit and bitfield definitions
T1CC3S0                EQU    H'0000';
T1CC3S1                EQU    H'0001';
T1OC3PE                EQU    H'0003';
T1OC3M0                EQU    H'0004';
T1OC3M1                EQU    H'0005';
T1OC3M2                EQU    H'0006';

T1IC3PSC0              EQU    H'0002';
T1IC3PSC1              EQU    H'0003';
T1IC3F0                EQU    H'0004';
T1IC3F1                EQU    H'0005';
T1IC3F2                EQU    H'0006';
T1IC3F3                EQU    H'0007';

// Register: TIM1CCMR4
TIM1CCMR4             EQU    0x21C;
// bit and bitfield definitions
T1CC4S0                EQU    H'0000';
T1CC4S1                EQU    H'0001';
T1OC4PE                EQU    H'0003';
T1OC4M0                EQU    H'0004';
T1OC4M1                EQU    H'0005';
T1OC4M2                EQU    H'0006';

T1IC4PSC0              EQU    H'0002';
T1IC4PSC1              EQU    H'0003';
T1IC4F0                EQU    H'0004';
T1IC4F1                EQU    H'0005';
T1IC4F2                EQU    H'0006';
T1IC4F3                EQU    H'0007';


// Register: TIM1CCER1
TIM1CCER1             EQU    0x21D;
// bit and bitfield definitions
T1CC1E                 EQU    H'0000';
T1CC1P                 EQU    H'0001';
T1CC1NE                EQU    H'0002';
T1CC1NP                EQU    H'0003';
T1CC2E                 EQU    H'0004';
T1CC2P                 EQU    H'0005';
T1CC2NE                EQU    H'0006';
T1CC2NP                EQU    H'0007';

// Register: TIM1CCER2
TIM1CCER2             EQU    0x21E;
// bit and bitfield definitions
T1CC3E                 EQU    H'0000';
T1CC3P                 EQU    H'0001';
T1CC3NE                EQU    H'0002';
T1CC3NP                EQU    H'0003';
T1CC4E                 EQU    H'0004';
T1CC4P                 EQU    H'0005';
 
// Register: ODCON0
ODCON0             EQU    0x21F;
// bit and bitfield definitions
UROD                  EQU    H'0000';
I2COD                 EQU    H'0001';
SPIOD                 EQU    H'0002';
//
// Special function register definitions: Bank 5--------------------------------------------------------------
//

// Register: TIM1CNTRH
TIM1CNTRH             EQU    0x28C;
// bit and bitfield definitions
 
// Register: TIM1CNTRL
TIM1CNTRL             EQU    0x28D;
// bit and bitfield definitions

// Register: TIM1PSCRH
TIM1PSCRH             EQU    0x28E;
// bit and bitfield definitions 

// Register: TIM1PSCRL
TIM1PSCRL             EQU    0x28F;
// bit and bitfield definitions 

// Register: TIM1ARRH
TIM1ARRH              EQU    0x290;
// bit and bitfield definitions 

// Register: TIM1ARRL
TIM1ARRL              EQU    0x291;
// bit and bitfield definitions

// Register: TIM1RCR
TIM1RCR               EQU    0x292;
// bit and bitfield definitions

// Register: TIM1CCR1H
TIM1CCR1H             EQU    0x293;
// bit and bitfield definitions

// Register: TIM1CCR1L
TIM1CCR1L             EQU    0x294;
// bit and bitfield definitions

// Register: TIM1CCR2H
TIM1CCR2H             EQU    0x295;
// bit and bitfield definitions

// Register: TIM1CCR2L
TIM1CCR2L             EQU    0x296;
// bit and bitfield definitions

// Register: TIM1CCR3H
TIM1CCR3H             EQU    0x297;
// bit and bitfield definitions

// Register: TIM1CCR3L
TIM1CCR3L             EQU    0x298;
// bit and bitfield definitions

// Register: TIM1CCR4H
TIM1CCR4H             EQU    0x299;
// bit and bitfield definitions

// Register: TIM1CCR4L
TIM1CCR4L             EQU    0x29A;
// bit and bitfield definitions

// Register: TIM1BKR
TIM1BKR               EQU    0x29B;
// bit and bitfield definitions
T1LOCK0               EQU    H'0000';
T1LOCK1               EQU    H'0001';
T1OSSI                EQU    H'0002';
T1OSSR                EQU    H'0003';
T1BKE                 EQU    H'0004';
T1BKP                 EQU    H'0005';
T1AOE                 EQU    H'0006';
T1MOE                 EQU    H'0007';

// Register: TIM1DTR
TIM1DTR               EQU    0x29C;
// bit and bitfield definitions
T1DTG0                 EQU    H'0000';
T1DTG1                 EQU    H'0001';
T1DTG2                 EQU    H'0002';
T1DTG3                 EQU    H'0003';
T1DTG4                 EQU    H'0004';
T1DTG5                 EQU    H'0005';
T1DTG6                 EQU    H'0006';
T1DTG7                 EQU    H'0007';

// Register: TIM1OISR
TIM1OISR            EQU    0x29D;
// bit and bitfield definitions
T1OIS1                EQU    H'0000';
T1OIS1N               EQU    H'0001';
T1OIS2                EQU    H'0002';
T1OIS2N               EQU    H'0003';
T1OIS3                EQU    H'0004';
T1OIS3N               EQU    H'0005';
T1OIS4                EQU    H'0006';

// Register: TIM2CCR3H
TIM2CCR3H            EQU    0x29E;
// bit and bitfield definitions

// Register: TIM2CCR3L
TIM2CCR3L            EQU    0x29F;
// bit and bitfield definitions 
//
// Special function register definitions: Bank 6
//

// Register: TIM2CR1
TIM2CR1            EQU    0x30C;
// bit and bitfield definitions
T2CEN                 EQU    H'0000';
T2UDIS                EQU    H'0001';
T2URS                 EQU    H'0002';
T2OPM                 EQU    H'0003';
T2ARPE                EQU    H'0007';

// Register: TIM2IER
TIM2IER              EQU    0x30D;
// bit and bitfield definitions
T2UIE                 EQU    H'0000';
T2CC1IE               EQU    H'0001';
T2CC2IE               EQU    H'0002';
T2CC3IE               EQU    H'0003';


// Register: TIM2SR1
TIM2SR1              EQU    0x30E;
// bit and bitfield definitions
T2UIF                 EQU    H'0000';
T2CC1IF               EQU    H'0001';
T2CC2IF               EQU    H'0002';
T2CC3IF               EQU    H'0003';


// Register: TIM2SR2
TIM2SR2              EQU    0x30F;
// bit and bitfield definitions
T2CC1OF               EQU    H'0001';
T2CC2OF               EQU    H'0002';
T2CC3OF               EQU    H'0003';


// Register: TIM2EGR
TIM2EGR              EQU    0x310;
// bit and bitfield definitions
T2UG                 EQU    H'0000';
T2CC1G               EQU    H'0001';
T2CC2G               EQU    H'0002';
T2CC3G               EQU    H'0003';


// Register: TIM2CCMR1
TIM2CCMR1              EQU    0x311;
// bit and bitfield definitions
T2CC1S0               EQU    H'0000';
T2CC1S1               EQU    H'0001';
T2OC1PE               EQU    H'0003';
T2OC1M0               EQU    H'0004';
T2OC1M1               EQU    H'0005';
T2OC1M2               EQU    H'0006';

T2IC1PSC0             EQU    H'0002';
T2IC1PSC1             EQU    H'0003';
T2IC1F0               EQU    H'0004';
T2IC1F1               EQU    H'0005';
T2IC1F2               EQU    H'0006';
T2IC1F3               EQU    H'0007';



// Register: TIM2CCMR2
TIM2CCMR2              EQU    0x312;
// bit and bitfield definitions
T2CC2S0               EQU    H'0000';
T2CC2S1               EQU    H'0001';
T2OC2PE               EQU    H'0003';
T2OC2M0               EQU    H'0004';
T2OC2M1               EQU    H'0005';
T2OC2M2               EQU    H'0006';

T2IC2PSC0             EQU    H'0002';
T2IC2PSC1             EQU    H'0003';
T2IC2F0               EQU    H'0004';
T2IC2F1               EQU    H'0005';
T2IC2F2               EQU    H'0006';
T2IC2F3               EQU    H'0007';

// Register: TIM2CCMR3
TIM2CCMR3              EQU    0x313;
// bit and bitfield definitions
T2CC3S0               EQU    H'0000';
T2CC3S1               EQU    H'0001';
T2OC3PE               EQU    H'0003';
T2OC3M0               EQU    H'0004';
T2OC3M1               EQU    H'0005';
T2OC3M2               EQU    H'0006';

T2IC3PSC0             EQU    H'0002';
T2IC3PSC1             EQU    H'0003';
T2IC3F0               EQU    H'0004';
T2IC3F1               EQU    H'0005';
T2IC3F2               EQU    H'0006';
T2IC3F3               EQU    H'0007';


// Register: TIM2CCER1
TIM2CCER1             EQU    0x314;
// bit and bitfield definitions
T2CC1E               EQU    H'0000';
T2CC1P               EQU    H'0001';
T2CC2E               EQU    H'0004';
T2CC2P               EQU    H'0005';

// Register: TIM2CCER2
TIM2CCER2             EQU    0x315;
// bit and bitfield definitions
T2CC3E               EQU    H'0000';
T2CC3P               EQU    H'0001';

// Register: TIM2CNTRH
TIM2CNTRH             EQU    0x316;
// bit and bitfield definitions

// Register: TIM2CNTRL
TIM2CNTRL             EQU    0x317;
// bit and bitfield definitions

// Register: TIM2PSCR
TIM2PSCR              EQU    0x318;
// bit and bitfield definitions
T2PSC0              EQU    H'0000';
T2PSC1              EQU    H'0001';
T2PSC2              EQU    H'0002';
T2PSC3              EQU    H'0003';
// Register: TIM2ARRH
TIM2ARRH              EQU    0x319;
// bit and bitfield definitions

// Register: TIM2ARRL
TIM2ARRL              EQU    0x31A;
// bit and bitfield definitions

// Register: TIM2CCR1H
TIM2CCR1H              EQU    0x31B;
// bit and bitfield definitions

// Register: TIM2CCR1L
TIM2CCR1L              EQU    0x31C;
// bit and bitfield definitions

// Register: TIM2CCR2H
TIM2CCR2H              EQU    0x31D;
// bit and bitfield definitions

// Register: TIM2CCR2L
TIM2CCR2L              EQU    0x31E;
// bit and bitfield definitions

// Register: TCKSRC
TCKSRC         EQU    0x31F;
// bit and bitfield definitions
T1CKSRC0              EQU    H'0000';
T1CKSRC1              EQU    H'0001';
T1CKSRC2              EQU    H'0002';
T2CKSRC0              EQU    H'0004';
T2CKSRC1              EQU    H'0005';
T2CKSRC2              EQU    H'0006';
LFMOD                 EQU    H'0007';

// Register: WPROOF3
EECON4         EQU    0x391;
// bit and bitfield definitions
PONLY          EQU    H'0006';
//
// Special function register definitions: Bank 7
//

//
// Special function register definitions: Bank 8
//

// Register: I2CCR1
// LVDIErrupt-On-Change Flag Register
I2CCR1               EQU    0x40C;
// bit and bitfield definitions
MASTER               EQU    H'0000';
SPEED                EQU    H'0001';
SLV10B               EQU    H'0003';
MST10B               EQU    H'0004';

// Register: I2CCR2
// LVDIErrupt-On-Change Flag Register
I2CCR2               EQU    0x40D;
// bit and bitfield definitions
RXHLD                 EQU    H'0001';
SNACK                 EQU    H'0004';
AGCALL                EQU    H'0005';
SOFTRST               EQU    H'0006';
// Register: I2CCR3
// LVDIErrupt-On-Change Flag Register
I2CCR3               EQU    0x40E;
// bit and bitfield definitions
ENABLE                 EQU    H'0000';
EVSTRE                 EQU    H'0002';

// Register: I2COARL
// LVDIErrupt-On-Change Flag Register
I2COARL               EQU    0x40F;
// bit and bitfield definitions
ADD0                   EQU    H'0000';
ADD1                   EQU    H'0001';
ADD2                   EQU    H'0002';
ADD3                   EQU    H'0003';
ADD4                   EQU    H'0004';
ADD5                   EQU    H'0005';
ADD6                   EQU    H'0006';
ADD7                   EQU    H'0007';

// Register: I2COARH
// LVDIErrupt-On-Change Flag Register
I2COARH               EQU    0x410;
// bit and bitfield definitions
ADD8                   EQU    H'0000';
ADD9                   EQU    H'0001';

// Register: I2CFREQ
// LVDIErrupt-On-Change Flag Register
I2CFREQ               EQU    0x411;
// bit and bitfield definitions
FREQ0                   EQU    H'0000';
FREQ1                   EQU    H'0001';
FREQ2                   EQU    H'0002';
FREQ3                   EQU    H'0003';
FREQ4                   EQU    H'0004';
FREQ5                   EQU    H'0005';

// Register: I2CDR
// LVDIErrupt-On-Change Flag Register
I2CDR               EQU    0x412;
// bit and bitfield definitions

// Register: I2CCMD
// LVDIErrupt-On-Change Flag Register
I2CCMD               EQU    0x413;
// bit and bitfield definitions
MSTDIR                    EQU    H'0000';
STOP                      EQU    H'0001';
RESTART                   EQU    H'0002';

// Register: I2CCCRL
// LVDIErrupt-On-Change Flag Register
I2CCCRL               EQU    0x414;
// bit and bitfield definitions
CCR0                    EQU    H'0000';
CCR1                    EQU    H'0001';
CCR2                    EQU    H'0002';
CCR3                    EQU    H'0003';
CCR4                    EQU    H'0004';
CCR5                    EQU    H'0005';
CCR6                    EQU    H'0006';
CCR7                    EQU    H'0007';

// Register: I2CCCRH
// LVDIErrupt-On-Change Flag Register
I2CCCRH               EQU    0x415;
// bit and bitfield definitions
CCR8                    EQU    H'0000';
CCR9                    EQU    H'0001';
CCR10                   EQU    H'0002';
CCR11                   EQU    H'0003';
DUTY                    EQU    H'0006';

// Register: I2CITR
I2CITR               EQU    0x416;
// bit and bitfield definitions
ITERREN                 EQU    H'0000';
ITEVEN                  EQU    H'0001';
ITBUFEN                 EQU    H'0002';

// Register: I2CSR1
I2CSR1               EQU    0x417;
// bit and bitfield definitions
SBF                    EQU    H'0000';
ADDF                   EQU    H'0001';
ADD10F                 EQU    H'0003';
STOPF                  EQU    H'0004';
IICRXNE                EQU    H'0006';
IICTXE                 EQU    H'0007';

// Register: I2CSR2
// LVDIErrupt-On-Change Flag Register
I2CSR2               EQU    0x418;
// bit and bitfield definitions
BERR                   EQU    H'0000';
ARLO                   EQU    H'0001';
AF                     EQU    H'0002';
OVR                    EQU    H'0003';
TXARBT                 EQU    H'0004';

// Register: I2CSR3
// LVDIErrupt-On-Change Flag Register
I2CSR3               EQU    0x419;
// bit and bitfield definitions
RXHOLD                 EQU    H'0000';
ACTIVE                 EQU    H'0001';
RDREQ                  EQU    H'0002';
GCALL                  EQU    H'0005';


// Register: ADCON3
// LVDIErrupt-On-Change Flag Register
ADCON3               EQU    0x41A;
// bit and bitfield definitions
ELVDS0                 EQU    H'0000';
ELVDS1                 EQU    H'0001';
LEBADT                 EQU    H'0003';
ADCMPO                 EQU    H'0004';
ADCMPEN                EQU    H'0005';
ADCMPOP                EQU    H'0006';
ADFBEN                 EQU    H'0007';


// Register: ADCMPH
// LVDIErrupt-On-Change Flag Register
ADCMPH               EQU    0x41B;
// bit and bitfield definitions


// Register: LEBCON
// LVDIErrupt-On-Change Flag Register
LEBCON               EQU    0x41C;
// bit and bitfield definitions
BKS0                 EQU    H'0000';
BKS1                 EQU    H'0001';
BKS2                 EQU    H'0002';
EDGS                 EQU    H'0003';
LEBCH0               EQU    H'0005';
LEBCH1               EQU    H'0006';
LEBEN                EQU    H'0007';


// Register: MSCKCON
// LVDIErrupt-On-Change Flag Register
MSCKCON               EQU    0x41D;
// bit and bitfield definitions
CKCNTI                 EQU    H'0000';
CKMAVG                 EQU    H'0001';

// Register: SOSCPRL
// LVDIErrupt-On-Change Flag Register
SOSCPRL               EQU    0x41E;
// bit and bitfield definitions
SOSCPR0                 EQU    H'0000';
SOSCPR1                 EQU    H'0001';
SOSCPR2                 EQU    H'0002';
SOSCPR3                 EQU    H'0003';
SOSCPR4                 EQU    H'0004';
SOSCPR5                 EQU    H'0005';
SOSCPR6                 EQU    H'0006';
SOSCPR7                 EQU    H'0007';

// Register: SOSCPRH
// LVDIErrupt-On-Change Flag Register
SOSCPRH               EQU    0x41F;
// bit and bitfield definitions
SOSCPR8                  EQU    H'0000';
SOSCPR9                  EQU    H'0001';
SOSCPR10                 EQU    H'0002';
SOSCPR11                 EQU    H'0003';

//
// Special function register definitions: Bank 9
//
 
// Register: URDATAL
// LVDIErrupt-On-Change Flag Register
URDATAL               EQU    0x48C;
// bit and bitfield definitions
//

// Register: URDATAH
// LVDIErrupt-On-Change Flag Register
URDATAH               EQU    0x48D;
// bit and bitfield definitions
URDATA8                 EQU    H'0000';

// Register: URIER
// LVDIErrupt-On-Change Flag Register
URIER               EQU    0x48E;
// bit and bitfield definitions
URRXNE                 EQU    H'0000';
URTE                   EQU    H'0001';
RXSE                   EQU    H'0002';
IDELE                  EQU    H'0003';
TCEN                   EQU    H'0005';

// Register: URLCR
// LVDIErrupt-On-Change Flag Register
URLCR               EQU    0x48F;
// bit and bitfield definitions
LTH                    EQU    H'0000';
URSTOP                 EQU    H'0002';
PEN                    EQU    H'0003';
EVEN                   EQU    H'0004';
BKREQ                  EQU    H'0006';

// Register: URLCREXT
// LVDIErrupt-On-Change Flag Register
URLCREXT               EQU    0x490;
// bit and bitfield definitions
EXTEN                  EQU    H'0000';
RWU                    EQU    H'0001';

// Register: URMCR
// LVDIErrupt-On-Change Flag Register
URMCR               EQU    0x491;
// bit and bitfield definitions
SIREN                  EQU    H'0000';
HDSEL                  EQU    H'0001';
WAKE                   EQU    H'0002';
RXEN                   EQU    H'0003';
TXEN                   EQU    H'0004';
SIRLP                  EQU    H'0005';

// Register: URLSR
// LVDIErrupt-On-Change Flag Register
URLSR               EQU    0x492;
// bit and bitfield definitions
RXNEF                  EQU    H'0000';
OVERF                  EQU    H'0001';
PEF                    EQU    H'0002';
FEF                    EQU    H'0003';
BKF                    EQU    H'0004';
TXEF                   EQU    H'0005';
IDLEF                  EQU    H'0006';
ADDRF                  EQU    H'0007';

// Register: URRAR
// LVDIErrupt-On-Change Flag Register
URRAR               EQU    0x493;
// bit and bitfield definitions
RAR0                    EQU    H'0000';
RAR1                    EQU    H'0001';
RAR2                    EQU    H'0002';
RAR3                    EQU    H'0003';


// Register: URDLL
// LVDIErrupt-On-Change Flag Register
URDLL               EQU    0x494;
// bit and bitfield definitions

// Register: URDLH
// LVDIErrupt-On-Change Flag Register
URDLH               EQU    0x495;
// bit and bitfield definitions

// Register: URABCR
// LVDIErrupt-On-Change Flag Register
URABCR               EQU    0x496;
// bit and bitfield definitions
ABREN                  EQU    H'0000';
ABRF                   EQU    H'0001';
ABRM                   EQU    H'0002';
ABRE                   EQU    H'0003';

// Register: URSYNCR
// LVDIErrupt-On-Change Flag Register
URSYNCR               EQU    0x497;
// bit and bitfield definitions
SYNEN                  EQU    H'0000';
URCPOL                 EQU    H'0001';
URCPHA                 EQU    H'0002';
LBCL                   EQU    H'0003';

// Register: URLINCR
// LVDIErrupt-On-Change Flag Register
URLINCR               EQU    0x498;
// bit and bitfield definitions
BLTH0                  EQU    H'0000';
BLTH1                  EQU    H'0001';
BLTH2                  EQU    H'0002';
BLTH3                  EQU    H'0003';
LINEN                  EQU    H'0004';

// Register: URSDCR0
// LVDIErrupt-On-Change Flag Register
URSDCR0               EQU    0x499;
// bit and bitfield definitions
SDEN                   EQU    H'0004';
CKOE                   EQU    H'0005';
NACK                   EQU    H'0006';

// Register: URSDCR1
// LVDIErrupt-On-Change Flag Register
URSDCR1               EQU    0x49A;
// bit and bitfield definitions
GT0                   EQU    H'0000';
GT1                   EQU    H'0001';
GT2                   EQU    H'0002';
GT3                   EQU    H'0003';
GT4                   EQU    H'0004';
GT5                   EQU    H'0005';
GT6                   EQU    H'0006';
GT7                   EQU    H'0007';

// Register: URSDCR2
// LVDIErrupt-On-Change Flag Register
URSDCR2               EQU    0x49B;
// bit and bitfield definitions
PSC0                   EQU    H'0000';
PSC1                   EQU    H'0001';
PSC2                   EQU    H'0002';
PSC3                   EQU    H'0003';
PSC4                   EQU    H'0004';
PSC5                   EQU    H'0005';
PSC6                   EQU    H'0006';
PSC7                   EQU    H'0007';

// Register: URTC
// LVDIErrupt-On-Change Flag Register
URTC               EQU    0x49C;
// bit and bitfield definitions
TCF                   EQU    H'0000';

// Special function register definitions: Bank 10

//
// Special function register definitions: Bank 31
//


// Register: STATUS_SHAD
// LVDIErrupt-On-Change Flag Register
STATUS_SHAD           EQU    0xFE4;
// bit and bitfield definitions

// Register: WREG_SHAD
// LVDIErrupt-On-Change Flag Register
WREG_SHAD             EQU    0xFE5;
// bit and bitfield definitions

// Register: BSREG_SHAD
// LVDIErrupt-On-Change Flag Register
BSREG_SHAD            EQU    0xFE6;
// bit and bitfield definitions

// Register: PCLATH_SHAD
// LVDIErrupt-On-Change Flag Register
PCLATH_SHAD            EQU    0xFE7;
// bit and bitfield definitions

// Register: FSR0L_SHAD
// LVDIErrupt-On-Change Flag Register
FSR0L_SHAD            EQU    0xFE8;
// bit and bitfield definitions

// Register: FSR0L_SHAD
// LVDIErrupt-On-Change Flag Register
FSR0H_SHAD            EQU    0xFE9;
// bit and bitfield definitions

// Register: FSR0L_SHAD
// LVDIErrupt-On-Change Flag Register
FSR1L_SHAD            EQU    0xFEA;
// bit and bitfield definitions

// Register: FSR0L_SHAD
// LVDIErrupt-On-Change Flag Register
FSR1H_SHAD            EQU    0xFEB;
// bit and bitfield definitions

// Register: STKPTR
// LVDIErrupt-On-Change Flag Register
STKPTR                EQU    0xFED;
// bit and bitfield definitions

// Register: TOSL
// LVDIErrupt-On-Change Flag Register
TOSL                  EQU    0xFEE;
// bit and bitfield definitions

// Register: TOSH
// LVDIErrupt-On-Change Flag Register
TOSH                  EQU    0xFEF;