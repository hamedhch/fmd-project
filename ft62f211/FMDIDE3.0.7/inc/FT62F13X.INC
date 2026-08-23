
;==========================================================================
;
;       Register Definitions
;
;==========================================================================
W     EQU  H'0000' 
F     EQU  H'0001'
R     EQU  H'0001'				
;----- Register Files -----------------------------------------------------
;-----Bank0------------------
// Register: INDF
INDF     EQU     0x000;


// Register: TMR0
TMR0     EQU     0x001;


// Register: PCL
PCL      EQU     0x002;


// Register: STATUS
STATUS   EQU     0x003;

    CARRY    EQU     H'0000';
    DC       EQU     H'0001';
    ZERO     EQU     H'0002';
    nPD      EQU     H'0003';
    nTO      EQU     H'0004';
    RP0      EQU     H'0005';
    RP1      EQU     H'0006';
    FSRB8    EQU     H'0007';

    C        EQU     H'0000';
    HC       EQU     H'0001';
    Z        EQU     H'0002';
    nPF      EQU     H'0003';
    nTF      EQU     H'0004';
    PAGE0    EQU     H'0005';
    PAGE1    EQU     H'0006';
// Register: FSR
FSR      EQU     0x004;


// Register: PORTA
PORTA    EQU     0x005;

    RA0      EQU     H'0000';
    RA1      EQU     H'0001';
    RA2      EQU     H'0002';
    RA3      EQU     H'0003';
    RA4      EQU     H'0004';
    RA5      EQU     H'0005';
    RA6      EQU     H'0006';
    RA7      EQU     H'0007';

    PA0      EQU     H'0000';
    PA1      EQU     H'0001';
    PA2      EQU     H'0002';
    PA3      EQU     H'0003';
    PA4      EQU     H'0004';
    PA5      EQU     H'0005';
    PA6      EQU     H'0006';
    PA7      EQU     H'0007';

// Register: PORTB
PORTB    EQU     0x006;

    RB0      EQU     H'0000';
    RB1      EQU     H'0001';
    RB2      EQU     H'0002';
    RB3      EQU     H'0003';
    RB4      EQU     H'0004';
    RB5      EQU     H'0005';
    RB6      EQU     H'0006';
    RB7      EQU     H'0007';

    PB0      EQU     H'0000';
    PB1      EQU     H'0001';
    PB2      EQU     H'0002';
    PB3      EQU     H'0003';
    PB4      EQU     H'0004';
    PB5      EQU     H'0005';
    PB6      EQU     H'0006';
    PB7      EQU     H'0007';
// Register: PORTC
PORTC    EQU     0x007;

    RC0      EQU     H'0000';
    RC1      EQU     H'0001';

    PC0      EQU     H'0000';
    PC1      EQU     H'0001';

// Register: P1DDTL
P1DDTL   EQU     0x008;
// Register: P1DDTL
P1DDTH   EQU     0x009;

// Register: PCLATH
PCLATH   EQU     0x00A;


// Register: INTCON
INTCON   EQU     0x00B;

    PAIF     EQU     H'0000';
    INTF     EQU     H'0001';
    T0IF     EQU     H'0002';
    PAIE     EQU     H'0003';
    INTE     EQU     H'0004';
    T0IE     EQU     H'0005';
    PEIE     EQU     H'0006';
    GIE      EQU     H'0007';


// Register: PIR1
PIR1     EQU     0x00C;

    ADCIF     EQU     H'0000';
    TMR2IF    EQU     H'0001';
    OSFIF     EQU     H'0002';
    TMR1IF    EQU     H'0003';
    ACMPIF    EQU     H'0004';
    LVDIF     EQU     H'0005';
    CKMIF     EQU     H'0006';
    EEIF      EQU     H'0007';


// Register: FOSCCAL
FOSCCAL     EQU     0x00D;

    CCP1IF   EQU     H'0000';
    ADIF     EQU     H'0001';


// Register: P1ADTL
P1ADTL   EQU     0x00E;


// Register: P1BDTL
P1BDTL   EQU     0x00F;


// Register: P1CDTL
P1CDTL   EQU     0x0010;

// Register: TMR2L
TMR2L    EQU     0x011;


// Register: T2CON
T2CON0    EQU     0x012;

    T2CKPS0  EQU     H'0000';
    T2CKPS1  EQU     H'0001';
    TMR2ON   EQU     H'0002';
    TOUTPS0  EQU     H'0003';
    TOUTPS1  EQU     H'0004';
    TOUTPS2  EQU     H'0005';
    TOUTPS3  EQU     H'0006';
    PR2U     EQU     H'0007';



// Register: TMR2H
TMR2H      EQU     0x013;


// Register: P1ADTH
P1ADTH     EQU     0x014;


// Register: P1BDTH
P1BDTH     EQU     0x015;


// Register: P1CON
P1CON    EQU     0x016;

    P1DC0      EQU     H'0000';
    P1DC1      EQU     H'0001';
    P1DC2      EQU     H'0002';
    P1DC3      EQU     H'0003';
    P1DC4      EQU     H'0004';
    P1DC5      EQU     H'0005';
    P1DC6      EQU     H'0006';
    P1AUE      EQU     H'0007';



// Register: P1BR0
P1BR0    EQU     0x017;

    P1ASS0      EQU     H'0000';
    P1ASS1      EQU     H'0001';
    P1BSS0      EQU     H'0002';
    P1BSS1      EQU     H'0003';
    P1BKS0      EQU     H'0004';
    P1BKS1      EQU     H'0005';
    P1BKS2      EQU     H'0006';
    P1BEVT      EQU     H'0007';


// Register: WDTCON
WDTCON  EQU     0x018;

    SWDTEN     EQU     H'0000';
    WDTPS0     EQU     H'0001';
    WDTPS1     EQU     H'0002';
    WDTPS2     EQU     H'0003';
    WDTPS3     EQU     H'0004';
    WCKSRC0    EQU     H'0005';
    WCKSRC1    EQU     H'0006';



// Register: P1BR1
P1BR1  EQU     0x019;

    P1CSS0     EQU     H'0000';
    P1CSS1     EQU     H'0001';
    P1C2SS0    EQU     H'0002';
    P1C2SS1    EQU     H'0003';
    P1DSS0     EQU     H'0004';
    P1DSS1     EQU     H'0005';
    P1D2SS0    EQU     H'0006';
    P1D2SS1    EQU     H'0007';



// Register: P1CDTH
P1CDTH  EQU     0x01A;

// Register: MSCON0
MSCON0         EQU     0x01B;

    T2CKRUN       EQU     H'0000';
    CKCNTI        EQU     H'0001';
    CKMAVG        EQU     H'0002';
    SLVREN        EQU     H'0003';
    CLKOS         EQU     H'0004';
    ROMLPE        EQU     H'0005';
    LVROE         EQU     H'0006';
    BGRBOE        EQU     H'0007';



// Register: SOSCPRL
SOSCPRL  EQU     0x01C;


// Register: SOSCPRH
SOSCPRH   EQU     0x01D;


// Register: P1AUX
P1AUX    EQU     0x01E;

    P1DF2         EQU     H'0000';
    P1DF2E        EQU     H'0001';
    P1CF2         EQU     H'0002';
    P1CF2E        EQU     H'0003';
    P1B2SS0       EQU     H'0004';
    P1B2SS1       EQU     H'0005';

//
// Register: T0CON0
T0CON0  EQU     0x01F;

    T0CKSRC0       EQU     H'0000';
    T0CKSRC1       EQU     H'0001';
    T0CKRUN        EQU     H'0002';
    T0ON					 EQU     H'0003';


// Special function register definitions: Bank 1
//


// Register: OPTION_REG
OPTION          EQU     0x081;

    PS0      EQU     H'0000';
    PS1      EQU     H'0001';
    PS2      EQU     H'0002';
    PSA      EQU     H'0003';
    T0SE     EQU     H'0004';
    T0CS     EQU     H'0005';
    INTEDG   EQU     H'0006';
    nPAPU    EQU     H'0007';


// Register: TRISA
TRISA    EQU     0x085;

    TRISA0   EQU     H'0000';
    TRISA1   EQU     H'0001';
    TRISA2   EQU     H'0002';
    TRISA3   EQU     H'0003';
    TRISA4   EQU     H'0004';
    TRISA5   EQU     H'0005';
    TRISA6   EQU     H'0006';
    TRISA7   EQU     H'0007';


// Register: TRISB
TRISB    EQU     0x086;

    TRISB0   EQU     H'0000';
    TRISB1   EQU     H'0001';
    TRISB2   EQU     H'0002';
    TRISB3   EQU     H'0003';
    TRISB4   EQU     H'0004';
    TRISB5   EQU     H'0005';
    TRISB6   EQU     H'0006';
    TRISB7   EQU     H'0007';


// Register: TRISC
TRISC    EQU     0x087;

    TRISC0   EQU     H'0000';
    TRISC1   EQU     H'0001';


// Register: PSRCB1
PSRCB1    EQU     0x088;


// Register: WPDA
WPDA    EQU     0x089;

    WPDA0   EQU     H'0000';
    WPDA1   EQU     H'0001';
    WPDA2   EQU     H'0002';
    WPDA3   EQU     H'0003';
    WPDA4   EQU     H'0004';
    WPDA5   EQU     H'0005';
    WPDA6   EQU     H'0006';
    WPDA7   EQU     H'0007';


// Register: PIE1
PIE1     EQU     0x08C;

    ADCIE    EQU     H'0000';
    TMR2IE   EQU     H'0001';
    OSFIE    EQU     H'0002';
    TMR1IE   EQU     H'0003';
    ACMPIE   EQU     H'0004';
    LVDIE    EQU     H'0005';
    CKMIE    EQU     H'0006';
    EEIE     EQU     H'0007';


// Register: WPDC
WPDC     EQU     0x08D;

    WPDC0   EQU     H'0000';
    WPDC1   EQU     H'0001';


// Register: PCON
PCON     EQU     0x08E;

    nBOR     EQU     H'0000';
    nPOR     EQU     H'0001';
    LVDW     EQU     H'0002';
    LVDEN    EQU     H'0003';
    LVDL0    EQU     H'0004';
    LVDL1    EQU     H'0005';
    LVDL2    EQU     H'0006';
    LVDL3    EQU     H'0007';


// Register: OSCCON
OSCCON   EQU     0x08F;

    SCS         EQU    H'0000';
    LTS         EQU    H'0001';
    HTS         EQU    H'0002';
    OSTS        EQU    H'0003';
    IRCF0       EQU    H'0004';
    IRCF1       EQU    H'0005';
    IRCF2       EQU    H'0006';
    LFMOD       EQU    H'0007';


// Register: P1OE
P1OE   EQU     0x090;

    P1A0OE        EQU     H'0000';
    P1A0NOE       EQU     H'0001';
    P1A1OE        EQU     H'0002';
    P1A1NOE       EQU     H'0003';
    P1A2OE        EQU     H'0004';
    P1A2NOE       EQU     H'0005';
    P1B0OE        EQU     H'0006';
    P1C0OE        EQU     H'0007';


// Register: PR2L
PR2L     EQU     0x091;


// Register: PR2H
PR2H     EQU     0x092;


// Register: WPUC
WPUC     EQU     0x093;

    WPUC0    EQU     H'0000';
    WPUC1    EQU     H'0001';

// Register: PSRCC
PSRCC     EQU     0x094;
    PSRCC0    EQU     H'0000';
    PSRCC1    EQU     H'0001';
    PSRCC2    EQU     H'0002';
    PSRCC3    EQU     H'0003';
    
// Register: PSRCC
WPUA     EQU     0x095;
    WPUA0    EQU     H'0000';
    WPUA1    EQU     H'0001';
    WPUA2    EQU     H'0002';
    WPUA3    EQU     H'0003';
    WPUA4    EQU     H'0004';
    WPUA5    EQU     H'0005';
    WPUA6    EQU     H'0006';
    WPUA7    EQU     H'0007';
    
// Register: IOCA
IOCA     EQU     0x096;
IOC      EQU     0x096;

    IOCA0    EQU     H'0000';
    IOCA1    EQU     H'0001';
    IOCA2    EQU     H'0002';
    IOCA3    EQU     H'0003';
    IOCA4    EQU     H'0004';
    IOCA5    EQU     H'0005';
    IOCA6    EQU     H'0006';
    IOCA7    EQU     H'0007';

    IOC0     EQU     H'0000';
    IOC1     EQU     H'0001';
    IOC2     EQU     H'0002';
    IOC3     EQU     H'0003';
    IOC4     EQU     H'0004';
    IOC5     EQU     H'0005';
    IOC6     EQU     H'0006';
    IOC7     EQU     H'0007';


// Register: VRP5VCAL
VRP5VCAL EQU     0x097;


// Register: P1POL
P1POL   		EQU     0x099;

    P1A0P    EQU     H'0000';
    P1A0NP  EQU     H'0001';
    P1A1P   EQU     H'0002';
    P1A1NP  EQU     H'0003';
    P1A2P   EQU     H'0004';
    P1A2NP  EQU     H'0005';
    P1BOP   EQU     H'0006';
    P1C0P   EQU     H'0007';


// Register: EEDAT
EEDAT   EQU     0x09A;
EEDATA  EQU     0x09A;


// Register: EEADR
EEADR   EQU     0x09B;



// Register: EECON1
EECON1   EQU     0x09C;

    RD       EQU     H'0000';
    PONLY    EQU     H'0001';
    WREN1    EQU     H'0002';
    WRERR    EQU     H'0003';
    WREN2    EQU     H'0004';
    WREN3    EQU     H'0005';


// Register: EECON2
EECON2  EQU     0x09D;

    WR       EQU     H'0000';


// Register: T2CON1
T2CON1  EQU     0x09E;

    T2CKSRC0     EQU     H'0000';
    T2CKSRC1     EQU     H'0001';
    T2CKSRC2     EQU     H'0002';
    P1BZM        EQU     H'0003';
    P1OS         EQU     H'0004';


// Register: PSINKC
PSINKC  EQU     0x09F;

    PSINKC0       EQU     H'0000';
    PSINKC1       EQU     H'0001';


// Special function register definitions: Bank 2
//
// Register: RXRSM
RXRSM          EQU     0x0101;

    RSDATA  EQU     H'0000';
    REB     EQU     H'0001';
    RSBST   EQU     H'0002';
    RSAST   EQU     H'0003';
    RSVH1X  EQU     H'0004';
    RSVH1   EQU     H'0005';


// Register: ODCONA
ODCONA          EQU     0x0105;


// Register: ODCONA
ODCONB          EQU     0x0106;


// Register: ODCONA
ODCONC          EQU     0x0107;

    ODCONC0  EQU     H'0000';
    ODCONC1  EQU     H'0001';


// Register: VR2VCAL
VR2VCAL          EQU     0x0108;


// Register: P1POL2
P1POL2          EQU     0x0109;

    P1B1P  EQU     H'0001';
    P1C1P  EQU     H'0002';
    P1D0P  EQU     H'0005';
    P1D1P  EQU     H'0006';
    P1D2P  EQU     H'0007';


// Register: PSRCB2
PSRCB2          EQU     0x010C;

    PSRCB20  EQU     H'0000';
    PSRCB21  EQU     H'0001';
    PSRCB22  EQU     H'0002';
    PSRCB23  EQU     H'0003';


// Register: WPUB
WPUB          EQU     0x010D;

    WPUB0   EQU     H'0000';
    WPUB1   EQU     H'0001';
    WPUB2   EQU     H'0002';
    WPUB3   EQU     H'0003';
    WPUB4   EQU     H'0004';
    WPUB5   EQU     H'0005';
    WPUB6   EQU     H'0006';
    WPUB7   EQU     H'0007';


// Register: WPDB
WPDB          EQU     0x010E;

    WPDB0   EQU     H'0000';
    WPDB1   EQU     H'0001';
    WPDB2   EQU     H'0002';
    WPDB3   EQU     H'0003';
    WPDB4   EQU     H'0004';
    WPDB5   EQU     H'0005';
    WPDB6   EQU     H'0006';
    WPDB7   EQU     H'0007';


// Register: PSINKB
PSINKB       EQU     0x010F;

    PSINKB2  EQU     H'0002';
    PSINKB3  EQU     H'0003';
    PSINKB4  EQU     H'0004';
    PSINKB5  EQU     H'0005';
    PSINKB6  EQU     H'0006';
    PSINKB7  EQU     H'0007';


// Register: LVDCON
LVDCON       EQU     0x0110;

    LVDM0   EQU     H'0000';
    LVDM1   EQU     H'0001';
    LVDM2   EQU     H'0002';
    LVDDEB  EQU     H'0003';
    LVDP    EQU     H'0004';


// Register: T3CKDIV
ADRESL         EQU     0x0111;



// Register: TMR4L
ADRESH         EQU     0x0112;


// Register: ADCON0
ADCON0          EQU     0x0113;

    ADON    EQU     H'0000';
    GO_DONE EQU     H'0001';
    ADEX    EQU     H'0002';
    CHS0    EQU     H'0003';
    CHS1    EQU     H'0004';
    CHS2    EQU     H'0005';
    CHS3    EQU     H'0006';


// Register: ADCON1
ADCON1          EQU     0x0114;

    ADPREF0   EQU     H'0000';
    ADPREF1   EQU     H'0001';
    ADNREF0   EQU     H'0002';
    ADNREF1   EQU     H'0003';
    ADCS0     EQU     H'0004';
    ADCS1     EQU     H'0005';
    ADCS2     EQU     H'0006';
    ADFM      EQU     H'0007';


// Register: ADCON2
ADCON2       EQU     0x0115;

    ETGSEL0    EQU     H'0000';
    ETGSEL1    EQU     H'0001';
    ETGSEL2    EQU     H'0002';
    ADDLY8     EQU     H'0003';
    ETGTYP0    EQU     H'0004';
    ETGTYP1    EQU     H'0005';
    ADINTREF0  EQU     H'0006';
    ADINTREF1  EQU     H'0007';


// Register: PR1L
PR1L           EQU     0x0116;


// Register: PR1H
PR1H 	      EQU     0x0117;


// Register: TMR1L
TMR1L          EQU     0x0118;


// Register: TMR1H
TMR1H          EQU     0x0119;


// Register: T1CON0
T1CON0       EQU     0x011A;

    T1CKSRC0   EQU     H'0000';
    T1CKSRC1   EQU     H'0001';
    T1ON       EQU     H'0002';
    T1CKRUN    EQU     H'0003';
    T1CKPSA    EQU     H'0004';


// Register: P1OE2
P1OE2       EQU     0x011B;

    P1B1OE    EQU     H'0001';
    P1C1OE    EQU     H'0002';
    P1D0OE    EQU     H'0005';
    P1D1OE    EQU     H'0006';
    P1D2OE    EQU     H'0007';


// Register: TKCON0
TKCON0       EQU     0x011C;

    TKCAPEN   EQU     H'0000';
    TKEN      EQU     H'0000';
    TKCHGS0   EQU     H'0001';
    TKCHGS1   EQU     H'0002';
    TKMODE    EQU     H'0003';
    TKCAPM    EQU     H'0004';
    VREFM     EQU     H'0005';
    TKRSEL0   EQU     H'0006';
    TKRSEL1   EQU     H'0007';


// Register: TKCON1
TKCON1       EQU     0x011D;

    TKCHE0     EQU     H'0000';
    TKCHE1     EQU     H'0001';
    TKCHE2     EQU     H'0002';
    TKCHE3     EQU     H'0003';
    TKCHE4     EQU     H'0004';
    TKCHE5     EQU     H'0005';
    TKCHE6     EQU     H'0006';
    TKCHE7     EQU     H'0007';


// Register: ANSEL0
ANSEL0       EQU     0x011E;


// Register: VR3VCAL
VR3VCAL      EQU     0x011F;

// Register: CRYPEN
CRYPEN       EQU     0x0181;
// Register: SECCODE
SECCODE      EQU     0x0181;

// Register: LEBCON
LEBCON       EQU     0x0185;
// bit and bitfield definitions
    EDGS                  EQU     H'0003';
    LEBCH0                EQU     H'0005';
    LEBCH1                EQU     H'0006';
    LEBEN                 EQU     H'0007';


// Register: ADCON3
ADCON3       EQU     0x0186;
// bit and bitfield definitions
    LEBADT                EQU     H'0003';
    ADCMPEN               EQU     H'0005';
    ADCMPOP               EQU     H'0006';
    ADFBEN                EQU     H'0007';

// Register: ADCMPH
ADCMPH       EQU     0x0187;
// bit and bitfield definitions

// Register: ADDLY
ADDLY        EQU     0x0188;
// bit and bitfield definitions
    ADDLY0                 EQU     H'0000';
    ADDLY1                 EQU     H'0001';
    ADDLY2                 EQU     H'0002';
    ADDLY3                 EQU     H'0003';
    ADDLY4                 EQU     H'0004';
    ADDLY5                 EQU     H'0005';
    ADDLY6                 EQU     H'0006';
    ADDLY7                 EQU     H'0007';


    LEBPRL0                 EQU     H'0000';
    LEBPRL1                 EQU     H'0001';
    LEBPRL2                 EQU     H'0002';
    LEBPRL3                 EQU     H'0003';
    LEBPRL4                 EQU     H'0004';
    LEBPRL5                 EQU     H'0005';
    LEBPRL6                 EQU     H'0006';
    LEBPRL7                 EQU     H'0007';
// Register: T0DUTY
T0DUTY       EQU     0x018C;

// Register: PR0
PR0         EQU     0x018D;

// Register: MSCON1
MSCON1       EQU     0x018E;
// bit and bitfield definitions
    HIRCM                EQU    H'0000';
    
// Register: LVDTRIM
LVDTRIM       EQU     0x019F;
// bit and bitfield definitions
    LVRADJ0                EQU     H'0000';
    LVRADJ1                EQU     H'0001';
    LVRADJ2                EQU     H'0002';
    LVDADJ0                EQU     H'0003';
    LVDADJ1                EQU     H'0004';
    LVDADJ2                EQU     H'0005';
    LVDADJ3                EQU     H'0006';