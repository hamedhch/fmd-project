;==========================================================================
;
;       Register Definitions
;
;==========================================================================
//==========================================================================
W            EQU  H'0000' 
F            EQU  H'0001'
R            EQU  H'0001'				
//BANK0==========================================================================
INDF0        EQU	 0x000
INDF1        EQU   0x001
PCL          EQU   0x002 

STATUS       EQU   0x003 
// STATUS Bits 
C            EQU 		H'0000'
DC           EQU 		H'0001'
Z            EQU 		H'0002'
nPD          EQU 		H'0003'
nTO          EQU 		H'0004'

FSR0L        EQU   0x004 
FSR0H        EQU   0x005 
FSR1L        EQU   0x006 
FSR1H        EQU   0x007 

BSREG        EQU   0x008 
//BSREG Bits
BSREG0       EQU    H'0000'
BSREG1       EQU    H'0001'
BSREG2       EQU    H'0002'
BSREG3       EQU    H'0003'
BSREG4       EQU    H'0004'

WREG         EQU   0x009 
PCLATH       EQU   0x00A 

INTCON       EQU   0x00B 
//Register: INTCON Bits
 OSFIF       EQU    H'0000'
 LVDIF       EQU    H'0001'
 EEIF        EQU    H'0002'
 OSFIE       EQU    H'0003'
 LVDIE       EQU    H'0004'
 EEIE        EQU    H'0005'
 PEIE        EQU    H'0006'
 GIE         EQU    H'0007'
 
PORTA        EQU   0x00C 
//Register: PORTA Bits
 RA0         EQU    H'0000'
 RA1         EQU    H'0001'
 RA2         EQU    H'0002'
 RA3         EQU    H'0003'
 RA4         EQU    H'0004'
 RA5         EQU    H'0005'
 RA6         EQU    H'0006'
 RA7         EQU    H'0007'
 
PORTB        EQU   0x00D 
//Register: PORTB Bits
 RB0         EQU    H'0000'
 RB1         EQU    H'0001'
 RB2         EQU    H'0002'
 RB3         EQU    H'0003'
 RB4         EQU    H'0004'
 RB5         EQU    H'0005'
 RB6         EQU    H'0006'
 RB7         EQU    H'0007'
 
PORTC        EQU   0x00E 
//Register: PORTC Bits
 RC0         EQU    H'0000'
 RC1         EQU    H'0001'
 
PIR1         EQU   0x011 
//Register: PIR1 Bits
 ADCIF       EQU    H'0000'
 CKMIF       EQU    H'0001'
 
EPIF0        EQU   0x014 
ADDLY        EQU   0x01F 

//BANK1

TRISA        EQU   0x08C 
//Register: TRISA Bits
 TRISA0                EQU    H'0000'
 TRISA1                EQU    H'0001'
 TRISA2                EQU    H'0002'
 TRISA3                EQU    H'0003'
 TRISA4                EQU    H'0004'
 TRISA5                EQU    H'0005'
 TRISA6                EQU    H'0006'
 TRISA7                EQU    H'0007'
 
TRISB        EQU   0x08D 
//Register: TRISB Bits
 TRISB0                EQU    H'0000'
 TRISB1                EQU    H'0001'
 TRISB2                EQU    H'0002'
 TRISB3                EQU    H'0003'
 TRISB4                EQU    H'0004'
 TRISB5                EQU    H'0005'
 TRISB6                EQU    H'0006'
 TRISB7                EQU    H'0007'
 
TRISC        EQU   0x08E 
//Register: TRISC Bits
 TRISC0                EQU    H'0000'
 TRISC1                EQU    H'0001'
 
PIE1         EQU   0x091 
//Register: PIE1 Bits
 ADCIE                 EQU    H'0000'
 CKMIE                 EQU    H'0001'
 
EPIE0        EQU   0x094 

CKOCON       EQU   0x095 
//Register: CKOCON Bits
 CCOEN       					 EQU    H'0000'
 CCOSEL0               EQU    H'0001'
 CCOSEL1               EQU    H'0002'
 CCOSEL2               EQU    H'0003'
 DTYSEL0               EQU    H'0004'
 DTYSEL1               EQU    H'0005'
 CCORDY                EQU    H'0006'
 SYSON       					 EQU    H'0007'
 
PCON         EQU   0x096 
//Register: PCON Bits
 nBORF        EQU    H'0000'
 nPORF        EQU    H'0001'
 nSRSTF       EQU    H'0002'
 nMCLRR       EQU    H'0003'
 IERRR        EQU    H'0004'
 EMCF         EQU    H'0005'
 STKUNF       EQU    H'0006'
 STKOVF       EQU    H'0007'
 
WDTCON       EQU   0x097 
//Register: WDTCON Bits
 SWDTEN                EQU    H'0000'
 WDTPS0                EQU    H'0001'
 WDTPS1                EQU    H'0002'
 WDTPS2                EQU    H'0003'
 WDTPS3                EQU    H'0004'
 WDTPRE0               EQU    H'0005'
 WDTPRE1               EQU    H'0006'
 WDTPRE2               EQU    H'0007'
 
OSCTUNE      EQU   0x098 
//Register: OSCTUNE Bits
 TUN0        EQU    H'0000'
 TUN1        EQU    H'0001'
 TUN2        EQU    H'0002'
 TUN3        EQU    H'0003'
 TUN4        EQU    H'0004'
 TUN5        EQU    H'0005'
 TUN6        EQU    H'0006'
 TUN7        EQU    H'0007'
 
OSCCON       EQU   0x099 
//Register: OSCCON Bits
 SCS         EQU    H'0000'
 LTS         EQU    H'0001'
 HTS         EQU    H'0002'
 OSTS        EQU    H'0003'
 MCKCF0      EQU    H'0004'
 MCKCF1      EQU    H'0005'
 MCKCF2      EQU    H'0006'
 MCKCF3      EQU    H'0007'
 
PCKEN        EQU   0x09A 
//Register: PCKEN Bits
 ADCEN       EQU    H'0000'
 TIM1EN      EQU    H'0001'
 TIM2EN      EQU    H'0002'
 TIM4EN      EQU    H'0003'
 UARTEN      EQU    H'0005'
 
ADRESL       EQU   0x09B 
ADRESH       EQU   0x09C 
ADCON0       EQU   0x09D 
//Register: ADCON0 Bits
 ADON        EQU    H'0000'
 GO          EQU    H'0001'
 nDONE       EQU    H'0001'
 ADEX        EQU    H'0002'
 CHS0        EQU    H'0004'
 CHS1        EQU    H'0005'
 CHS2        EQU    H'0006'
 
ADCON1       EQU   0x09E 
//Register: ADCON1 Bits
 ADPREF0     EQU    H'0000'
 ADPREF1     EQU    H'0001'
 ADNREF0     EQU    H'0002'
 ADNREF1     EQU    H'0003'
 ADCS0       EQU    H'0004'
 ADCS1       EQU    H'0005'
 ADCS2       EQU    H'0006'
 ADFM        EQU    H'0007'
 
ADCON2       EQU   0x09F 
//Register: ADCON2 Bits
 ETGSEL0     EQU    H'0000'
 ETGSEL1     EQU    H'0001'
 ETGSEL2     EQU    H'0002'
 ADDLY8      EQU    H'0003'
 ETGTYP0     EQU    H'0004'
 ETGTYP1     EQU    H'0005'
 ADINTREF0   EQU    H'0006'
 ADINTREF1   EQU    H'0007'
 
//BANK2
LATA         EQU   0x10C 
//Register: LATA Bits
 LATA0       EQU    H'0000'
 LATA1       EQU    H'0001'
 LATA2       EQU    H'0002'
 LATA3       EQU    H'0003'
 LATA4       EQU    H'0004'
 LATA5       EQU    H'0005'
 LATA6       EQU    H'0006'
 LATA7       EQU    H'0007'
 
LATB         EQU   0x10D 
//Register: LATB Bits
 LATB0       EQU    H'0000'
 LATB1       EQU    H'0001'
 LATB2       EQU    H'0002'
 LATB3       EQU    H'0003'
 LATB4       EQU    H'0004'
 LATB5       EQU    H'0005'
 LATB6       EQU    H'0006'
 LATB7       EQU    H'0007'
 
LATC         EQU   0x10E  
//Register: LATC Bits
 LATC0       EQU    H'0000'
 LATC1       EQU    H'0001'
 
TIM4CR1      EQU   0x111 
//Register: TIM4CR1 Bits
T4CEN        EQU	 H'0000'
T4UDIS       EQU	 H'0001'
T4URS				 EQU	 H'0002'
T4OPM        EQU	 H'0003'
T4CKS0       EQU	 H'0004'
T4CKS1       EQU	 H'0005'
T4ARPE       EQU	 H'0007'

TIM4IER      EQU   0x112 
//Register: TIM4IER Bits
 T4UIE       EQU    H'0000'
 
TIM4SR       EQU   0x113 
//Register: TIM4SR Bits
 T4UIF       EQU    H'0000' 
 
TIM4EGR      EQU   0x114  
//Register: TIM4EGR Bits
 T4UG        EQU    H'0000' 
 
TIM4CNTR     EQU   0x115 
TIM4PSCR     EQU   0x116
//Register: TIM4PSCR Bits
 T4PSC0                EQU    H'0000'
 T4PSC1                EQU    H'0001'
 T4PSC2                EQU    H'0002' 
 
TIM4ARR      EQU   0x117 
EPS0         EQU   0x118 
EPS1         EQU   0x119 
PSRC0        EQU   0x11A 
PSRC1        EQU   0x11B 
PSRC2        EQU   0x11C 
PSRC20              EQU 		 H'0000';
PSRC21              EQU 		 H'0001';
PSRC22              EQU 		 H'0002';
PSRC23              EQU 		 H'0003';

ITYPE0       EQU   0x11E 
ITYPE1       EQU   0x11F 
//BANK3

WPUA         EQU   0x18C 
WPUB         EQU   0x18D 
WPUC         EQU   0x18E 
//Register: WPUC Bits
WPUC0        EQU    H'0000'
WPUC1        EQU    H'0001'

EEADRL       EQU   0x191 
EEADRH       EQU   0x192 
//Register: EEADRH Bits
 EEADRH0       EQU    H'0000'
 EEADRH1       EQU    H'0001'
 EEADRH2       EQU    H'0002'
 EEADRH3       EQU    H'0003'
 
EEDATL       EQU   0x193 
EEDATH       EQU   0x194 
//Register: EEDATH Bits
 EEDATH0       EQU    H'0000'
 EEDATH1       EQU    H'0001'
 EEDATH2       EQU    H'0002'
 EEDATH3       EQU    H'0003'
 EEDATH4       EQU    H'0004'
 EEDATH5       EQU    H'0005'
 
EECON1       EQU   0x195 
//Register: EECON1 Bits
 RD          EQU    H'0000'
 WR          EQU    H'0001'
 WREN        EQU    H'0002'
 WRERR       EQU    H'0003'
 FERAE       EQU    H'0004' 
 LWLO        EQU    H'0005'
 CFGS        EQU    H'0006'
 EEPGD       EQU    H'0007'
 
EECON2       EQU   0x196 
ANSELA       EQU   0x197 
LVDCON0      EQU   0x199 
// bit and bitfield definitions
LVDL0               EQU 		 H'0000';
LVDL1               EQU 		 H'0001';
LVDL2               EQU 		 H'0002';
LVDW                EQU 		 H'0003';
LVDEN               EQU 		 H'0004'; 
LVROE               EQU 		 H'0005'; 
LVDM                EQU 		 H'0006';
SLVREN              EQU 		 H'0007';

PSINK0       EQU   0x19A 
PSINK1       EQU   0x19B 
PSINK2       EQU   0x19C 
MISC0        EQU   0x19D 
//Register: MISC0 Bits
 WCKSEL0                EQU    H'0000'
 WCKSEL1                EQU    H'0001'
 
AFP0         EQU   0x19E 
AFP1         EQU   0x19F 
//BANK4
WPDA         EQU   0x20C 
//Register: WPDA Bits
 WPDA0       EQU    H'0000'
 WPDA1       EQU    H'0001'
 WPDA2       EQU    H'0002'
 WPDA3       EQU    H'0003'
 WPDA4       EQU    H'0004'
 WPDA5       EQU    H'0005'
 WPDA6       EQU    H'0006'
 WPDA7       EQU    H'0007'
 
WPDB         EQU   0x20D 
//Register: WPDB Bits
 WPDB0       EQU    H'0000'
 WPDB1       EQU    H'0001'
 WPDB2       EQU    H'0002'
 WPDB3       EQU    H'0003'
 WPDB4       EQU    H'0004'
 WPDB5       EQU    H'0005'
 WPDB6       EQU    H'0006'
 WPDB7       EQU    H'0007'
 
WPDC         EQU   0x20E  
//Register: WPDC Bits
 WPDC0       EQU    H'0000'
 WPDC1       EQU    H'0001'
 
TIM1CR1      EQU   0x211 
//Register: TIM1CR1 Bits
 T1CEN         EQU    H'0000'
 T1UDIS        EQU    H'0001'
 T1URS         EQU    H'0002'
 T1OPM         EQU    H'0003'
 T1DIR         EQU    H'0004'
 T1CMS0        EQU    H'0005'
 T1CMS1        EQU    H'0006'
 T1ARPE        EQU    H'0007'
 
TIM1CR2      EQU   0x212 
//Register: TIM1CR2 Bits
 T1CCPC        EQU    H'0000'
 T1COMS        EQU    H'0002'
 T1ENCTRL      EQU    H'0007'
 
TIM1SMCR     EQU   0x213 
//Register: TIM1SMCR Bits
 T1SMS0        EQU    H'0000'
 T1SMS1        EQU    H'0001'
 T1SMS2        EQU    H'0002'
 T1TS0         EQU    H'0004'
 T1TS1         EQU    H'0005'
 T1TS2         EQU    H'0006'
 
TIM1ETR      EQU   0x214 
//Register: TIM1ETR Bits
 T1ETF0        EQU    H'0000'
 T1ETF1        EQU    H'0001'
 T1ETF2        EQU    H'0002'
 T1ETF3        EQU    H'0003'
 T1ETPS0       EQU    H'0004'
 T1ETPS1       EQU    H'0005'
 T1ECE         EQU    H'0006'
 T1ETP         EQU    H'0007'
 
TIM1IER      EQU   0x215 
// bit and bitfield definitions
T1UIE          EQU 		 H'0000';
T1CC1IE        EQU 		 H'0001';
T1CC2IE        EQU 		 H'0002';
T1CC3IE        EQU 		 H'0003';
T1CC4IE        EQU 		 H'0004';
T1TIE          EQU 		 H'0006';
T1BIE          EQU 		 H'0007';

TIM1SR1      EQU   0x216 
//Register: TIM1SR1 Bits
 T1UIF       EQU    H'0000'
 T1CC1IF     EQU    H'0001'
 T1CC2IF     EQU    H'0002'
 T1CC3IF     EQU    H'0003'
 T1CC4IF     EQU    H'0004'
 T1COMIF     EQU    H'0005'
 T1TIF       EQU    H'0006'
 T1BIF       EQU    H'0007'
 
TIM1SR2      EQU   0x217 
//Register: TIM1SR2 Bits 
 T1CC1OF     EQU    H'0001'
 T1CC2OF     EQU    H'0002'
 T1CC3OF     EQU    H'0003'
 T1CC4OF     EQU    H'0004'   
 
TIM1EGR      EQU   0x218 
//Register: TIM1EGR Bits
 T1UG        EQU    H'0000'
 T1CC1G      EQU    H'0001'
 T1CC2G      EQU    H'0002'
 T1CC3G      EQU    H'0003'
 T1CC4G      EQU    H'0004'
 T1COMG      EQU    H'0005'
 T1TG        EQU    H'0006'
 T1BG        EQU    H'0007'  
 
TIM1CCMR1    EQU   0x219 
//Register: TIM1CCMR1 Bits
 T1CC1S0     EQU    H'0000'
 T1CC1S1     EQU    H'0001'
 T1OC1FE     EQU    H'0002'
 T1OC1PE     EQU    H'0003'
 T1OC1M0     EQU    H'0004'
 T1OC1M1     EQU    H'0005'
 T1OC1M2     EQU    H'0006'
 T1OC1CE     EQU    H'0007'

 T1IC1PSC0   EQU    H'0002'
 T1IC1PSC1   EQU    H'0003'
 T1IC1F0     EQU    H'0004'
 T1IC1F1     EQU    H'0005'
 T1IC1F2     EQU    H'0006'
 T1IC1F3     EQU    H'0007'
 
TIM1CCMR2    EQU   0x21A 
//Register: TIM1CCMR2 Bits
 T1CC2S0     EQU    H'0000'
 T1CC2S1     EQU    H'0001'
 T1OC2FE     EQU    H'0002'
 T1OC2PE     EQU    H'0003'
 T1OC2M0     EQU    H'0004'
 T1OC2M1     EQU    H'0005'
 T1OC2M2     EQU    H'0006'
 T1OC2CE     EQU    H'0007'

 T1IC2PSC0   EQU    H'0002'
 T1IC2PSC1   EQU    H'0003'
 T1IC2F0     EQU    H'0004'
 T1IC2F1     EQU    H'0005'
 T1IC2F2     EQU    H'0006'
 T1IC2F3     EQU    H'0007'
 
TIM1CCMR3    EQU   0x21B 
//Register: TIM1CCMR3 Bits
 T1CC3S0     EQU    H'0000'
 T1CC3S1     EQU    H'0001'
 T1OC3FE     EQU    H'0002'
 T1OC3PE     EQU    H'0003'
 T1OC3M0     EQU    H'0004'
 T1OC3M1     EQU    H'0005'
 T1OC3M2     EQU    H'0006'
 T1OC3CE     EQU    H'0007'

 T1IC3PSC0   EQU    H'0002'
 T1IC3PSC1   EQU    H'0003'
 T1IC3F0     EQU    H'0004'
 T1IC3F1     EQU    H'0005'
 T1IC3F2     EQU    H'0006'
 T1IC3F3     EQU    H'0007'
 
TIM1CCMR4    EQU   0x21C 
//Register: TIM1CCMR4 Bits
 T1CC4S0       EQU    H'0000'
 T1CC4S1       EQU    H'0001'
 T1OC4FE       EQU    H'0002'
 T1OC4PE       EQU    H'0003'
 T1OC4M0       EQU    H'0004'
 T1OC4M1       EQU    H'0005'
 T1OC4M2       EQU    H'0006'
 T1OC4CE       EQU    H'0007'

 T1IC4PSC0     EQU    H'0002'
 T1IC4PSC1     EQU    H'0003'
 T1IC4F0       EQU    H'0004'
 T1IC4F1       EQU    H'0005'
 T1IC4F2       EQU    H'0006'
 T1IC4F3       EQU    H'0007' 
 
TIM1CCER1    EQU   0x21D 
//Register: TIM1CCER1 Bits
 T1CC1E        EQU    H'0000'
 T1CC1P        EQU    H'0001'
 T1CC1NE       EQU    H'0002'
 T1CC1NP       EQU    H'0003'
 T1CC2E        EQU    H'0004'
 T1CC2P        EQU    H'0005'
 T1CC2NE       EQU    H'0006'
 T1CC2NP       EQU    H'0007'
 
TIM1CCER2    EQU   0x21E 
//Register: TIM1CCER2 Bits
 T1CC3E        EQU    H'0000'
 T1CC3P        EQU    H'0001'
 T1CC3NE       EQU    H'0002'
 T1CC3NP       EQU    H'0003'
 T1CC4E        EQU    H'0004'
 T1CC4P        EQU    H'0005' 
 T1SMOD        EQU    H'0006'
 T1GP          EQU    H'0007'   
 
ODCON0		   EQU   0x21F 
//Register: ODCON0 Bits
 UROD         EQU    H'0000'
//Bank 5
//

TIM1CNTRH    EQU   0x28C 
TIM1CNTRL    EQU   0x28D 
TIM1PSCRH    EQU   0x28E 
TIM1PSCRL    EQU   0x28F 
TIM1ARRH     EQU   0x290 
TIM1ARRL     EQU   0x291 
TIM1RCR      EQU   0x292 
TIM1CCR1H    EQU   0x293 
TIM1CCR1L    EQU   0x294 
TIM1CCR2H    EQU   0x295 
TIM1CCR2L    EQU   0x296 
TIM1CCR3H    EQU   0x297 
TIM1CCR3L    EQU   0x298 
TIM1CCR4H    EQU   0x299 
TIM1CCR4L    EQU   0x29A 
TIM1BKR      EQU   0x29B 
//Register: TIM1BKR Bits
 T1LOCK0       EQU    H'0000'
 T1LOCK1       EQU    H'0001'
 T1OSSI        EQU    H'0002'
 T1OSSR        EQU    H'0003'
 T1BKE         EQU    H'0004'
 T1BKP         EQU    H'0005'
 T1AOE         EQU    H'0006'
 T1MOE         EQU    H'0007'
 
TIM1DTR      EQU   0x29C 
// Register: TIM1DTR Bits
 T1DTG0        EQU    H'0000'
 T1DTG1        EQU    H'0001'
 T1DTG2        EQU    H'0002'
 T1DTG3        EQU    H'0003'
 T1DTG4        EQU    H'0004'
 T1DTG5        EQU    H'0005'
 T1DTG6        EQU    H'0006'
 T1DTG7        EQU    H'0007'
 
TIM1OISR     EQU   0x29D 
//Register: TIM1OISR Bits
 T1OIS1        EQU    H'0000'
 T1OIS1N       EQU    H'0001'
 T1OIS2        EQU    H'0002'
 T1OIS2N       EQU    H'0003'
 T1OIS3        EQU    H'0004'
 T1OIS3N       EQU    H'0005'
 T1OIS4        EQU    H'0006'
 
TIM2CCR3H    EQU   0x29E 
TIM2CCR3L    EQU   0x29F 
// Bank 6
//

TIM2CR1      EQU   0x30C 
//Register: TIM2CR1 Bits
 T2CEN       EQU    H'0000'
 T2UDIS      EQU    H'0001'
 T2URS       EQU    H'0002'
 T2OPM       EQU    H'0003'
 T2ARPE      EQU    H'0007'
 
TIM2IER      EQU   0x30D 
//Register: TIM2IER Bits
 T2UIE         EQU    H'0000'
 T2CC1IE       EQU    H'0001'
 T2CC2IE       EQU    H'0002'
 T2CC3IE       EQU    H'0003'
 
TIM2SR1      EQU   0x30E 
//Register: TIM2SR1 Bits
 T2UIF       EQU    H'0000'
 T2CC1IF     EQU    H'0001'
 T2CC2IF     EQU    H'0002'
 T2CC3IF     EQU    H'0003' 
 
TIM2SR2      EQU   0x30F 
//Register: TIM2SR2 Bits
 T2CC1OF       EQU    H'0001'
 T2CC2OF       EQU    H'0002'
 T2CC3OF       EQU    H'0003'
 
TIM2EGR      EQU   0x310 
//Register: TIM2EGR Bits
 T2UG         EQU    H'0000'
 T2CC1G       EQU    H'0001'
 T2CC2G       EQU    H'0002'
 T2CC3G       EQU    H'0003'
 
TIM2CCMR1    EQU   0x311 
//Register: TIM2CCMR1 Bits
 T2CC1S0       EQU    H'0000'
 T2CC1S1       EQU    H'0001'
 T2OC1PE       EQU    H'0003'
 T2OC1M0       EQU    H'0004'
 T2OC1M1       EQU    H'0005'
 T2OC1M2       EQU    H'0006'

 T2IC1PSC0     EQU    H'0002'
 T2IC1PSC1     EQU    H'0003'
 T2IC1F0       EQU    H'0004'
 T2IC1F1       EQU    H'0005'
 T2IC1F2       EQU    H'0006'
 T2IC1F3       EQU    H'0007'
 
TIM2CCMR2    EQU   0x312
//Register: TIM2CCMR2 Bits
 T2CC2S0       EQU    H'0000'
 T2CC2S1       EQU    H'0001'
 T2OC2PE       EQU    H'0003'
 T2OC2M0       EQU    H'0004'
 T2OC2M1       EQU    H'0005'
 T2OC2M2       EQU    H'0006'

 T2IC2PSC0     EQU    H'0002'
 T2IC2PSC1     EQU    H'0003'
 T2IC2F0       EQU    H'0004'
 T2IC2F1       EQU    H'0005'
 T2IC2F2       EQU    H'0006'
 T2IC2F3       EQU    H'0007' 
 
TIM2CCMR3    EQU   0x313 
//Register: TIM2CCMR3 Bits
 T2CC3S0      EQU   H'0000'
 T2CC3S1      EQU   H'0001'
 T2OC3PE      EQU   H'0003'
 T2OC3M0      EQU   H'0004'
 T2OC3M1      EQU   H'0005'
 T2OC3M2      EQU   H'0006'
          
 T2IC3PSC0    EQU   H'0002'
 T2IC3PSC1    EQU   H'0003'
 T2IC3F0      EQU   H'0004'
 T2IC3F1      EQU   H'0005'
 T2IC3F2      EQU   H'0006'
 T2IC3F3      EQU   H'0007'
 
TIM2CCER1    EQU   0x314 
//Register: TIM2CCER1 Bits
 T2CC1E       EQU    H'0000'
 T2CC1P       EQU    H'0001'
 T2CC2E       EQU    H'0004'
 T2CC2P       EQU    H'0005'
 
TIM2CCER2    EQU   0x315 
//Register: TIM2CCER2 Bits
 T2CC3E       EQU    H'0000'
 T2CC3P       EQU    H'0001'
 
TIM2CNTRH    EQU   0x316 
TIM2CNTRL    EQU   0x317 
TIM2PSCR     EQU   0x318 
//Register: TIM2PSCR Bits
 T2PSC0       EQU    H'0000'
 T2PSC1       EQU    H'0001'
 T2PSC2       EQU    H'0002'
 T2PSC3       EQU    H'0003'
 
TIM2ARRH     EQU   0x319 
TIM2ARRL     EQU   0x31A 
TIM2CCR1H    EQU   0x31B 
TIM2CCR1L    EQU   0x31C 
TIM2CCR2H    EQU   0x31D 
TIM2CCR2L    EQU   0x31E 
TCKSRC       EQU   0x31F 
//Register: TCKSRC Bits
 T1CKSRC0              EQU    H'0000';
 T1CKSRC1              EQU    H'0001';
 T1CKSRC2              EQU    H'0002';
 T2CKSRC0              EQU    H'0004';
 T2CKSRC1              EQU    H'0005';
 T2CKSRC2              EQU    H'0006';
 LFMOD                 EQU    H'0007';
;BANK7

;BANK8
ADCON3       EQU   0x41A 
//Register: ADCON3 Bits
 ELVDS0         EQU    H'0000'
 ELVDS1         EQU    H'0001'
 LEBADT         EQU    H'0003'
 ADCMPO         EQU    H'0004'
 ADCMPEN        EQU    H'0005'
 ADCMPOP        EQU    H'0006'
 ADFBEN         EQU    H'0007'
 
ADCMPH       EQU   0x41B 
LEBCON       EQU   0x41C
//Register: LEBCON Bits
 BKS0          EQU    H'0000'
 BKS1          EQU    H'0001'
 BKS2          EQU    H'0002'
 EDGS          EQU    H'0003'
 LEBCH0        EQU    H'0005'
 LEBCH1        EQU    H'0006'
 LEBEN         EQU    H'0007'
 
MSCKCON      EQU   0x41D
//Register: MSCKCON Bits
 CKCNTI        EQU    H'0000'
 CKMAVG        EQU    H'0001'
 
SOSCPRL      EQU   0x41E
SOSCPRH      EQU   0x41F
;BANK9
URDATAL      EQU   0x48C 
URDATAH      EQU   0x48D 
 //Register: URDATAH Bits
 DATAH         EQU    H'0000'
 
URIER        EQU   0x48E 
//Register: URIER  Bits
 URRXNE         EQU    H'0000'
 URTE           EQU    H'0001'
 RXSE           EQU    H'0002'
 IDELE          EQU    H'0003'
 TCEN           EQU    H'0005'
 
URLCR        EQU   0x48F 
//Register: URLCR Bits
 LTH            EQU    H'0000'
 STOP           EQU    H'0002'
 PEN            EQU    H'0003'
 EVEN           EQU    H'0004'
 BKREQ          EQU    H'0006'
 
URLCREXT     EQU   0x490 
//Register: URLCREXT Bits
 EXTEN          EQU    H'0000'
 RWU            EQU    H'0001'
 
URMCR        EQU   0x491 
//Register: URMCR Bits
 SIREN          EQU    H'0000'
 HDSEL          EQU    H'0001'
 WAKE           EQU    H'0002'
 RXEN           EQU    H'0003'
 TXEN           EQU    H'0004'
 SIRLP          EQU    H'0005' 
 
URLSR        EQU   0x492 
//Register: URLSR Bits
 RXNEF          EQU    H'0000'
 OVERF          EQU    H'0001'
 PEF            EQU    H'0002'
 FEF            EQU    H'0003'
 BKF            EQU    H'0004'
 TXEF           EQU    H'0005'
 IDLEF          EQU    H'0006'
 ADDRF          EQU    H'0007'
 
URRAR        EQU   0x493 
// bit and bitfield definitions
URRAR0          EQU 		 H'0000';
URRAR1          EQU 		 H'0001';
URRAR2          EQU 		 H'0002';
URRAR3          EQU 		 H'0003';

URDLL        EQU   0x494 
URDLH        EQU   0x495 
URABCR       EQU   0x496;
// bit and bitfield definitions
ABREN                  EQU 		 H'0000';
ABRF                   EQU 		 H'0001';
ABRM                   EQU 		 H'0002';
ABRE                   EQU 		 H'0003';

URSYNCR      EQU   0x497 
//Register: URSYNCR Bits
 SYNEN          EQU    H'0000'
 CPOL           EQU    H'0001'
 CPHA           EQU    H'0002'
 LBCL           EQU    H'0003'
 
URLINCR      EQU   0x498 
//Register: URLINCR Bits
 BLTH0          EQU    H'0000'
 BLTH1          EQU    H'0001'
 BLTH2          EQU    H'0002'
 BLTH3          EQU    H'0003'
 LINEN          EQU    H'0004' 
 
URSDCR0      EQU   0x499 
//Register: URSDCR0 Bits
 SDEN           EQU    H'0004'
 CKOE           EQU    H'0005'
 NACK           EQU    H'0006'
 
URSDCR1      EQU   0x49A 
//Register: URSDCR1 Bits
 GT0           EQU    H'0000'
 GT1           EQU    H'0001'
 GT2           EQU    H'0002'
 GT3           EQU    H'0003'
 GT4           EQU    H'0004'
 GT5           EQU    H'0005'
 GT6           EQU    H'0006'
 GT7           EQU    H'0007'
 
URSDCR2      EQU   0x49B 
//Register: URSDCR2 Bits
 PSC0           EQU    H'0000'
 PSC1           EQU    H'0001'
 PSC2           EQU    H'0002'
 PSC3           EQU    H'0003'
 PSC4           EQU    H'0004'
 PSC5           EQU    H'0005'
 PSC6           EQU    H'0006'
 PSC7           EQU    H'0007'
 
URTC           EQU   0x49C 
//Register: URTC Bits
 TCF           EQU    H'0000'

//Bank 10
//
//
// Bank 31

CKAUX        EQU    0xF8D;
CLKOS        EQU 		H'0001'

LVDCON1      EQU    0xF8E;
// bit and bitfield definitions
LVDOS0       EQU 		H'0000';
LVDOS1       EQU 		H'0001';
LVDOE        EQU 		H'0002';
LVDDEB       EQU 		H'0003';
LVDP         EQU 		H'0004';

LVDTUNE      EQU    0xF92;
// bit and bitfield definitions
LVDCAL0      EQU 		H'0004';
LVDCAL1      EQU 		H'0005';
LVDCAL2      EQU 		H'0006';
LVDCAL3      EQU 		H'0007';

STATUS_SHAD           EQU    0xFE4;
WREG_SHAD             EQU    0xFE5;
BSREG_SHAD            EQU    0xFE6;
PCLATH_SHAD           EQU    0xFE7;
FSR0L_SHAD            EQU    0xFE8;
FSR0H_SHAD            EQU    0xFE9;
FSR1L_SHAD            EQU    0xFEA;
FSR1H_SHAD            EQU    0xFEB;
STKPTR                EQU    0xFED;
TOSL                  EQU    0xFEE;
TOSH                  EQU    0xFEF;
// bit and bitfield definitions

