;==========================================================================
;
;       Register Definitions
;
;==========================================================================
W                EQU  H'0000' 
F                EQU  H'0001'
R                EQU  H'0001'			
;-----Bank0------------------
INDF             EQU  0x0000
TMR0             EQU  0x0001
PCL              EQU  0x0002
STATUS           EQU  0x0003
FSR              EQU  0x0004
PORTA            EQU  0x0005
P1DDTL			 		 EQU  0x0008
P1DDTH			     EQU  0x0009
PCLATH           EQU  0x000A
INTCON           EQU  0x000B
PIR1             EQU  0x000C
FOSCCAL			     EQU  0x000D
P1ADTL           EQU  0x000E
P1BDTL           EQU  0x000F
P1CDTL           EQU  0x0010
TMR2L            EQU  0x0011
T2CON0           EQU  0x0012
TMR2H			       EQU  0x0013
P1ADTH			     EQU  0x0014
P1BDTH			     EQU  0x0015
P1CON            EQU  0x0016
P1BR0            EQU  0x0017
WDTCON           EQU  0x0018
P1BR1            EQU  0x0019
P1CDTH           EQU  0x001A
MSCON            EQU  0x001B
SOSCPRL          EQU  0x001C
SOSCPRH          EQU  0x001D
P1AUX			       EQU  0x001E
T0CON0			     EQU  0x001F
;-----Bank1------------------
OPTION_REG       EQU  0x0081
OPTION      	   EQU  0x0081
TRISA            EQU  0x0085
TKCON			 			 EQU  0x0086
PSRCA            EQU  0x0088
PIE1             EQU  0x008C
LVDCON           EQU  0x008D
PCON             EQU  0x008E
OSCCON           EQU  0x008F
P1OE             EQU  0x0090
PR2L             EQU  0x0091
PR2H             EQU  0x0092
WPUA             EQU  0x0095
IOCA             EQU  0x0096
PSINKA			     EQU  0x0097
SCKCFG				   EQU  0x0098
P1POL            EQU  0x0099
EEDAT            EQU  0x009A
EEDATA           EQU  0x009A
EEADR            EQU  0x009B
EECON1           EQU  0x009C
EECON2           EQU  0x009D
T2CON1			     EQU  0x009E

;-----Bank0------------------
;----- STATUS Bits -----------------------------------------------------
C                EQU  H'0000'
DC               EQU  H'0001'
HC				       EQU  H'0001'
Z                EQU  H'0002'
PF               EQU  H'0003'
NOT_PD           EQU  H'0003'
TF               EQU  H'0004'
NOT_TO           EQU  H'0004'
PAGE			       EQU  H'0005'
RP0              EQU  H'0005'
;----- PORTA Bits -----------------------------------------------------
RA0              EQU  H'0000'
PA0              EQU  H'0000'
RA1              EQU  H'0001'
PA1              EQU  H'0001'
RA2              EQU  H'0002'
PA2              EQU  H'0002'
RA3              EQU  H'0003'
PA3              EQU  H'0003'
RA4              EQU  H'0004'
PA4              EQU  H'0004'
RA5              EQU  H'0005'
PA5              EQU  H'0005'

;----- INTCON Bits -----------------------------------------------------
RAIF             EQU  H'0000'
PAIF             EQU  H'0000'
INTF             EQU  H'0001'
T0IF             EQU  H'0002'
TMR0IF           EQU  H'0002'
RAIE             EQU  H'0003'
PAIE             EQU  H'0003'
INTE             EQU  H'0004'
T0IE             EQU  H'0005'
TMR0IE           EQU  H'0005'
PEIE             EQU  H'0006'
GIE              EQU  H'0007'
;----- PIR1 Bits -----------------------------------------------------
TMR2IF           EQU  H'0001'
T2IF             EQU  H'0001'
OSFIF			       EQU  H'0002'
LVDIF			       EQU  H'0005'
CKMIF            EQU  H'0006'
EEIF             EQU  H'0007'

;----- T2CON0 Bits -----------------------------------------------------
T2CKPS0          EQU  H'0000'
T2CKPS1          EQU  H'0001'
TMR2ON           EQU  H'0002'
TOUTPS0          EQU  H'0003'
TOUTPS1          EQU  H'0004'
TOUTPS2          EQU  H'0005'
TOUTPS3          EQU  H'0006'
PR2U             EQU  H'0007'
;----- P1CON Bits -----------------------------------------------------
P1DC0            EQU  H'0000'
P1DC1          	 EQU  H'0001'
P1DC2            EQU  H'0002'
P1DC3          	 EQU  H'0003'
P1DC4          	 EQU  H'0004'
P1DC5          	 EQU  H'0005'
P1DC6            EQU  H'0006'
P1AUE            EQU  H'0007'
;----- P1BR0 Bits -----------------------------------------------------
P1ASS0           EQU  H'0000'
P1ASS1           EQU  H'0001'
P1BSS0           EQU  H'0002'
P1BSS1           EQU  H'0003'    
P1BKS0           EQU  H'0004'
P1BKS1           EQU  H'0005'
P1BKS2           EQU  H'0006'
P1BEVT           EQU  H'0007'    
;----- MSCON Bits -----------------------------------------------------
T2CKRUN          EQU  H'0000'
CKCNTI           EQU  H'0001'
CKMAVG           EQU  H'0002'
SLVREN           EQU  H'0003'
LVROE            EQU  H'0006'
BGRBOE           EQU  H'0007'

;----- P1AUX Bits -----------------------------------------------------
P1DF2            EQU  H'0000'
P1DF2E           EQU  H'0001'
;----- T0CON0 Bits -----------------------------------------------------
T0CKSRC0         EQU  H'0000'
T0CKSRC1         EQU  H'0001'
T0CKRUN          EQU  H'0002'
T0ON             EQU  H'0003'
;----- TKCON Bits -----------------------------------------------------
TKCHE0           EQU  H'0000'
TKCHE1           EQU  H'0001'
TKCHE2           EQU  H'0002'
TKCHE3           EQU  H'0003'
TKEN             EQU  H'0004'
TKCHGS0          EQU  H'0005'
TKCHGS1          EQU  H'0006'
;----- LVDCON Bits -----------------------------------------------------
LVDM0            EQU  H'0000'
LVDM1            EQU  H'0001'
LVDDEB           EQU  H'0002'
;----- PCON Bits -----------------------------------------------------
BOR              EQU  H'0000'
NOT_BOR          EQU  H'0000'
POR              EQU  H'0001'
NOT_POR          EQU  H'0001'
LVDW             EQU  H'0002'
LVDEN            EQU  H'0003'
LVDL0            EQU  H'0004'
LVDL1            EQU  H'0005'
LVDL2            EQU  H'0006'
LVDL3            EQU  H'0007'
;----- OSCCON Bits -----------------------------------------------------
LTS              EQU  H'0001'
LFIOFR			     EQU  H'0001'
HTS              EQU  H'0002'
HFIOFR			     EQU  H'0002'
IRCF0            EQU  H'0004'
IRCF1            EQU  H'0005'
IRCF2            EQU  H'0006'
LFMOD			       EQU  H'0007'
LFOMOD			     EQU  H'0007'
;----- P1OE Bits -----------------------------------------------------
P1A0OE			     EQU  H'0000'
P1A0NOE          EQU  H'0001'
P1C2SS0			     EQU  H'0002'
P1C2SS1			     EQU  H'0003'
P1DOE            EQU  H'0005'
P1BOE            EQU  H'0006'
P1COE			       EQU  H'0007'
;----- WDTCON Bits -----------------------------------------------------
SWDTEN           EQU  H'0000'
WDTPS0           EQU  H'0001'
WDTPS1           EQU  H'0002'
WDTPS2           EQU  H'0003'
WDTPS3           EQU  H'0004' 
WCKSRC			 		 EQU  H'0005' 
LVDP			       EQU  H'0007'


;----- P1BR1 Bits -----------------------------------------------------
P1CSS0           EQU  H'0000'
P1CSS1           EQU  H'0001'
P1DALT           EQU  H'0002'
P1CALT           EQU  H'0003'
P1D2SS0          EQU  H'0004' 
P1D2SS1					 EQU  H'0005' 
P1DSS0				 	 EQU  H'0006' 
P1DSS1					 EQU  H'0007'

;----- P1POL Bits -----------------------------------------------------
P1A0P            EQU  H'0000'
P1A0NP           EQU  H'0001'
P1DP					   EQU  H'0005' 
P1BP				 	   EQU  H'0006' 
P1CP					   EQU  H'0007'

;----- EECON1 Bits -----------------------------------------------------
WREN3            EQU  H'0005'                                            
WREN2            EQU  H'0004'                                            
WRERR            EQU  H'0003'                                                   
WREN1            EQU  H'0002'                                          
RD               EQU  H'0000'  
;----- EECON2 Bits -----------------------------------------------------
WR               EQU  H'0000'   

;-----Bank1------------------
;----- OPTION_REG Bits -----------------------------------------------------
PS0              EQU  H'0000'
PS1              EQU  H'0001'
PS2              EQU  H'0002'
PSA              EQU  H'0003'
T0SE             EQU  H'0004'
T0CS             EQU  H'0005'
INTEDG           EQU  H'0006'
PAPU			       EQU  H'0007'
NOT_PAPU         EQU  H'0007'
NOT_RAPU         EQU  H'0007'
;----- TRISA Bits -----------------------------------------------------
TRISA0           EQU  H'0000'
TRISA1           EQU  H'0001'
TRISA2           EQU  H'0002'
TRISA3           EQU  H'0003'
TRISA4           EQU  H'0004'
TRISA5           EQU  H'0005'

;----- PIE1 Bits -----------------------------------------------------
TMR2IE           EQU  H'0001'
OSFIE            EQU  H'0002'
LVDIE            EQU  H'0005'
CKMIE            EQU  H'0006'
EEIE             EQU  H'0007'

;----- WPUA Bits -----------------------------------------------------
WPUA0            EQU  H'0000'
WPUA1            EQU  H'0001'
WPUA2            EQU  H'0002'
WPUA3            EQU  H'0003'
WPUA4            EQU  H'0004'
WPUA5            EQU  H'0005'
WPU0             EQU  H'0000'
WPU1             EQU  H'0001'
WPU2             EQU  H'0002'
WPU3             EQU  H'0003'
WPU4             EQU  H'0004'
WPU5             EQU  H'0005'
;----- IOCA Bits -----------------------------------------------------
IOCA0            EQU  H'0000'
IOCA1            EQU  H'0001'
IOCA2            EQU  H'0002'
IOCA3            EQU  H'0003'
IOCA4            EQU  H'0004'
IOCA5            EQU  H'0005'
IOC0             EQU  H'0000'
IOC1             EQU  H'0001'
IOC2             EQU  H'0002'
IOC3             EQU  H'0003'
IOC4             EQU  H'0004'
IOC5             EQU  H'0005'
;-----SCKCFG Bits-----------------------------------------------------  
SCKOE            EQU  H'0001'
SCKEN            EQU  H'0007'                             