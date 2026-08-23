opt subtitle "GNU C Code Generator                                                 "

opt pagewidth 120

	opt pm

	processor	FT62F21X
opt include "C:\Users\DATA\Desktop\FMDIDE3.0.7\data\include\ft62f21x.cgen.inc"
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
	FNCALL	_main,_POWER_INITIAL
	FNCALL	_main,_SendDataToPC
	FNCALL	_main,_TIMER0_INITIAL
	FNCALL	_SendDataToPC,_ReadCapCharge
	FNCALL	_SendDataToPC,_ReadCapDisCharge
	FNCALL	_ReadCapDisCharge,_DelayMs
	FNCALL	_ReadCapDisCharge,_ReadCap1
	FNCALL	_ReadCapDisCharge,_SendHead
	FNCALL	_ReadCapDisCharge,_uart_tx
	FNCALL	_SendHead,_uart_tx
	FNCALL	_uart_tx,_uart_delay
	FNCALL	_ReadCap1,_DelayUsz
	FNCALL	_ReadCap1,_Touch_end
	FNCALL	_ReadCap1,_Touch_init
	FNCALL	_DelayMs,_DelayUs
	FNCALL	_ReadCapCharge,_ReadCap
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_SendTouch_Number2
	global	_SendTouch_Number1
	global	_Touch_Number1_sum
	global	_Touch_Number_sum
	global	_Touch_Number1
	global	_Touch_Number
	global	_ChargeCount
	global	_temp2
	global	_TCount
	global	_TreCount
	global	_ReadCom
	global	_TestCount
	global	_Touch_Buff
psect	text0,local,class=CODE,delta=2,merge=1
global __ptext0
__ptext0:
	DABS	1,115,2,_Touch_Buff

	global	_Touch_C0
	DABS	1,115,1,_Touch_C0

	global	_INTCON
_INTCON	set	11
	global	_PORTA
_PORTA	set	5
	global	_STATUS
_STATUS	set	3
	global	_TMR0
_TMR0	set	1
	global	_GIE
_GIE	set	95
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_PA5
_PA5	set	45
	global	_PA1
_PA1	set	41
	global	_WPUA
_WPUA	set	149
	global	_OSCCON
_OSCCON	set	143
	global	_PCON
_PCON	set	142
	global	_LVDCON
_LVDCON	set	141
	global	_TKCON
_TKCON	set	134
	global	_TRISA
_TRISA	set	133
	global	_OPTION
_OPTION	set	129
	global	_LVDEN
_LVDEN	set	1139
	global	_TKCHGS1
_TKCHGS1	set	1078
	global	_TKCHGS0
_TKCHGS0	set	1077
	global	_TKEN
_TKEN	set	1076
	global	_TKCHE3
_TKCHE3	set	1075
	global	_chbuff
	DABS	1,118,1,_chbuff

	global	_NowKey
	DABS	1,117,1,_NowKey

	global	_Touch_C1
	DABS	1,116,1,_Touch_C1

; #config settings
	file	"6021test.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_SendTouch_Number2:
       ds      8

_SendTouch_Number1:
       ds      8

_Touch_Number1_sum:
       ds      2

_Touch_Number_sum:
       ds      2

_Touch_Number1:
       ds      2

_Touch_Number:
       ds      2

_ChargeCount:
       ds      2

_temp2:
       ds      1

_TCount:
       ds      1

_TreCount:
       ds      1

_ReadCom:
       ds      1

_TestCount:
       ds      1

	file	"6021test.as"
	line	#
psect clrtext,class=CODE,delta=2
global clear_ram0
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram0:
	clrwdt			;clear the watchdog before getting into this loop
clrloop0:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop0		;do the next byte

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+01Fh)
	fcall	clear_ram0
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMONh,class=COMMON,space=1,noexec
global __pcstackCOMMONh
__pcstackCOMMONh:
?_ISR:	; 1 bytes @ 0x0
??_ISR:	; 1 bytes @ 0x0
?_TIMER0_INITIAL:	; 1 bytes @ 0x0
?_POWER_INITIAL:	; 1 bytes @ 0x0
?_uart_delay:	; 1 bytes @ 0x0
?_uart_tx:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_SendHead:	; 1 bytes @ 0x0
?_DelayUsz:	; 1 bytes @ 0x0
?_DelayUs:	; 1 bytes @ 0x0
?_DelayMs:	; 1 bytes @ 0x0
?_ReadCap:	; 1 bytes @ 0x0
?_Touch_init:	; 1 bytes @ 0x0
?_Touch_end:	; 1 bytes @ 0x0
?_ReadCap1:	; 1 bytes @ 0x0
?_ReadCapCharge:	; 1 bytes @ 0x0
?_ReadCapDisCharge:	; 1 bytes @ 0x0
	ds	2
??_TIMER0_INITIAL:	; 1 bytes @ 0x2
??_POWER_INITIAL:	; 1 bytes @ 0x2
??_uart_delay:	; 1 bytes @ 0x2
??_uart_tx:	; 1 bytes @ 0x2
??_DelayUsz:	; 1 bytes @ 0x2
??_DelayUs:	; 1 bytes @ 0x2
??_ReadCap:	; 1 bytes @ 0x2
??_Touch_init:	; 1 bytes @ 0x2
??_Touch_end:	; 1 bytes @ 0x2
	global	uart_tx@data
uart_tx@data:	; 1 bytes @ 0x2
	global	DelayUsz@a
DelayUsz@a:	; 1 bytes @ 0x2
	global	DelayUs@Time
DelayUs@Time:	; 1 bytes @ 0x2
	ds	1
??_SendHead:	; 1 bytes @ 0x3
??_ReadCap1:	; 1 bytes @ 0x3
	global	DelayUs@a
DelayUs@a:	; 1 bytes @ 0x3
	ds	1
??_DelayMs:	; 1 bytes @ 0x4
	ds	1
??_SendDataToPC:	; 1 bytes @ 0x5
??_main:	; 1 bytes @ 0x5
psect	cstackCOMMONl,class=COMMON,space=1,noexec
global __pcstackCOMMONl
__pcstackCOMMONl:
?_SendDataToPC:	; 1 bytes @ 0x0
??_ReadCapCharge:	; 1 bytes @ 0x0
	global	DelayMs@Time
DelayMs@Time:	; 1 bytes @ 0x0
	ds	1
	global	DelayMs@a
DelayMs@a:	; 1 bytes @ 0x1
	ds	1
	global	DelayMs@b
DelayMs@b:	; 1 bytes @ 0x2
	ds	1
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
	global	ReadCap1@ch
ReadCap1@ch:	; 1 bytes @ 0x0
	global	ReadCap@sum
ReadCap@sum:	; 2 bytes @ 0x0
	ds	1
	global	ReadCap1@sum
ReadCap1@sum:	; 2 bytes @ 0x1
	ds	1
	global	ReadCap@ch
ReadCap@ch:	; 1 bytes @ 0x2
	ds	1
	global	ReadCap@Count
ReadCap@Count:	; 1 bytes @ 0x3
	global	ReadCap1@Count
ReadCap1@Count:	; 1 bytes @ 0x3
	ds	1
??_ReadCapDisCharge:	; 1 bytes @ 0x4
	ds	2
	global	ReadCapDisCharge@Count
ReadCapDisCharge@Count:	; 1 bytes @ 0x6
	ds	1
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         31
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMONh           7      5       5
;!    COMMONl           3      3       3
;!    BANK0            48      7      38

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMMONh
;!
;!    _ReadCapDisCharge->_ReadCap1
;!    _SendHead->_uart_tx
;!    _ReadCap1->_DelayUsz
;!    _DelayMs->_DelayUs
;!    _ReadCapCharge->_ReadCap
;!
;!Critical Paths under _ISR in COMMONh
;!
;!    None.
;!
;!Critical Paths under _main in COMMONl
;!
;!    _ReadCapDisCharge->_DelayMs
;!
;!Critical Paths under _ISR in COMMONl
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    _SendDataToPC->_ReadCapDisCharge
;!    _ReadCapDisCharge->_ReadCap1
;!    _ReadCapCharge->_ReadCap
;!
;!Critical Paths under _ISR in BANK0
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 0     0      0    1200
;!                      _POWER_INITIAL
;!                       _SendDataToPC
;!                     _TIMER0_INITIAL
;! ---------------------------------------------------------------------------------
;! (1) _TIMER0_INITIAL                                       0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _SendDataToPC                                         0     0      0    1200
;!                      _ReadCapCharge
;!                   _ReadCapDisCharge
;! ---------------------------------------------------------------------------------
;! (2) _ReadCapDisCharge                                     3     3      0    1085
;!                                              4 BANK0      3     3      0
;!                            _DelayMs
;!                           _ReadCap1
;!                           _SendHead
;!                            _uart_tx
;! ---------------------------------------------------------------------------------
;! (3) _SendHead                                             0     0      0     176
;!                            _uart_tx
;! ---------------------------------------------------------------------------------
;! (3) _uart_tx                                              1     1      0     176
;!                                              2 COMMONh    1     1      0
;!                         _uart_delay
;! ---------------------------------------------------------------------------------
;! (4) _uart_delay                                           0     0      0       0
;! ---------------------------------------------------------------------------------
;! (3) _ReadCap1                                             6     6      0     139
;!                                              3 COMMONh    2     2      0
;!                                              0 BANK0      4     4      0
;!                           _DelayUsz
;!                          _Touch_end
;!                         _Touch_init
;! ---------------------------------------------------------------------------------
;! (4) _Touch_init                                           0     0      0       0
;! ---------------------------------------------------------------------------------
;! (4) _Touch_end                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (4) _DelayUsz                                             1     1      0      46
;!                                              2 COMMONh    1     1      0
;! ---------------------------------------------------------------------------------
;! (3) _DelayMs                                              3     3      0     138
;!                                              0 COMMONl    3     3      0
;!                            _DelayUs
;! ---------------------------------------------------------------------------------
;! (4) _DelayUs                                              2     2      0      46
;!                                              2 COMMONh    2     2      0
;! ---------------------------------------------------------------------------------
;! (2) _ReadCapCharge                                        2     2      0     115
;!                                              0 COMMONl    2     2      0
;!                            _ReadCap
;! ---------------------------------------------------------------------------------
;! (3) _ReadCap                                              6     6      0     115
;!                                              2 COMMONh    2     2      0
;!                                              0 BANK0      4     4      0
;! ---------------------------------------------------------------------------------
;! (1) _POWER_INITIAL                                        0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 4
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (6) _ISR                                                  2     2      0       0
;!                                              0 COMMONh    2     2      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 6
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _POWER_INITIAL
;!   _SendDataToPC
;!     _ReadCapCharge
;!       _ReadCap
;!     _ReadCapDisCharge
;!       _DelayMs
;!         _DelayUs
;!       _ReadCap1
;!         _DelayUsz
;!         _Touch_end
;!         _Touch_init
;!       _SendHead
;!         _uart_tx
;!           _uart_delay
;!       _uart_tx
;!         _uart_delay
;!   _TIMER0_INITIAL
;!
;! _ISR (ROOT)
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMMONh           7      0       0       0        0.0%
;!EEDATA              80      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!BITCOMMONl           3      0       0       1        0.0%
;!BITSFR0              0      0       0       1        0.0%
;!SFR0                 0      0       0       1        0.0%
;!COMMONh              7      5       5       2       71.4%
;!BITSFR1              0      0       0       2        0.0%
;!SFR1                 0      0       0       2        0.0%
;!COMMONl              3      3       3       3      100.0%
;!STACK                0      0       0       4        0.0%
;!DATA                 0      0      2E       5        0.0%
;!BITBANK0            30      0       0       6        0.0%
;!BANK0               30      7      26       7       79.2%
;!ABS                  0      0      2E       8        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 201 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMMONh COMMONl   BANK0
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_POWER_INITIAL
;;		_SendDataToPC
;;		_TIMER0_INITIAL
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"main.c"
	line	201
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"main.c"
	line	201
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 2
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	203
	
l2715:	
;main.c: 203: POWER_INITIAL();
	fcall	_POWER_INITIAL
	line	204
;main.c: 204: TIMER0_INITIAL();
	fcall	_TIMER0_INITIAL
	line	208
	
l2717:	
;main.c: 208: GIE = 1;
	bsf	(95/8),(95)&7	;volatile
	line	209
	
l2719:	
;main.c: 209: T0IE = 1;
	bsf	(93/8),(93)&7	;volatile
	line	210
	
l2721:	
;main.c: 210: TCount = 0;
	clrf	(_TCount)	;volatile
	line	214
	
l2723:	
;main.c: 212: {
;main.c: 214: SendDataToPC();
	fcall	_SendDataToPC
	goto	l2723
	global	start
	ljmp	start
	opt stack 0
	line	216
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_TIMER0_INITIAL

;; *************** function _TIMER0_INITIAL *****************
;; Defined at:
;;		line 60 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : B00/100
;;		On exit  : B00/0
;;		Unchanged: A00/0
;; Data sizes:    COMMONh COMMONl   BANK0
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	line	60
global __ptext1
__ptext1:	;psect for function _TIMER0_INITIAL
psect	text1
	file	"main.c"
	line	60
	global	__size_of_TIMER0_INITIAL
	__size_of_TIMER0_INITIAL	equ	__end_of_TIMER0_INITIAL-_TIMER0_INITIAL
	
_TIMER0_INITIAL:	
;incstack = 0
	opt	stack 6
; Regs used in _TIMER0_INITIAL: [wreg]
	line	62
	
l2685:	
;main.c: 62: OPTION = 0B00000100;
	movlw	low(04h)
	movwf	(129)^080h	;volatile
	line	67
;main.c: 67: TMR0 = 7;
	movlw	low(07h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	68
	
l2687:	
;main.c: 68: T0IF = 0;
	bcf	(90/8),(90)&7	;volatile
	line	69
	
l698:	
	return
	opt stack 0
GLOBAL	__end_of_TIMER0_INITIAL
	__end_of_TIMER0_INITIAL:
	signat	_TIMER0_INITIAL,89
	global	_SendDataToPC

;; *************** function _SendDataToPC *****************
;; Defined at:
;;		line 375 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMMONh COMMONl   BANK0
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_ReadCapCharge
;;		_ReadCapDisCharge
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=1
	file	"TOUCH.C"
	line	375
global __ptext2
__ptext2:	;psect for function _SendDataToPC
psect	text2
	file	"TOUCH.C"
	line	375
	global	__size_of_SendDataToPC
	__size_of_SendDataToPC	equ	__end_of_SendDataToPC-_SendDataToPC
	
_SendDataToPC:	
;incstack = 0
	opt	stack 2
; Regs used in _SendDataToPC: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	377
	
l2703:	
;TOUCH.C: 377: ReadCapCharge( );
	fcall	_ReadCapCharge
	line	378
	
l2705:	
;TOUCH.C: 378: ReadCapDisCharge();
	fcall	_ReadCapDisCharge
	line	380
	
l1509:	
	return
	opt stack 0
GLOBAL	__end_of_SendDataToPC
	__end_of_SendDataToPC:
	signat	_SendDataToPC,89
	global	_ReadCapDisCharge

;; *************** function _ReadCapDisCharge *****************
;; Defined at:
;;		line 273 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  Count           1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMMONh COMMONl   BANK0
;;      Params:         0       0       0
;;      Locals:         0       0       1
;;      Temps:          0       0       2
;;      Totals:         0       0       3
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_DelayMs
;;		_ReadCap1
;;		_SendHead
;;		_uart_tx
;; This function is called by:
;;		_SendDataToPC
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=1
	line	273
global __ptext3
__ptext3:	;psect for function _ReadCapDisCharge
psect	text3
	file	"TOUCH.C"
	line	273
	global	__size_of_ReadCapDisCharge
	__size_of_ReadCapDisCharge	equ	__end_of_ReadCapDisCharge-_ReadCapDisCharge
	
_ReadCapDisCharge:	
;incstack = 0
	opt	stack 2
; Regs used in _ReadCapDisCharge: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	file	"touch.h"
	line	14
	
l2543:	
	movlw	low(08h)
	movwf	(117)	;volatile
	file	"TOUCH.C"
	line	279
	
l2545:	
;TOUCH.C: 279: ReadCap1(1);
	movlw	low(01h)
	fcall	_ReadCap1
	line	281
	
l2547:	
;TOUCH.C: 281: Touch_Number1_sum=Touch_Number1;
	movf	(_Touch_Number1+1),w	;volatile
	movwf	(_Touch_Number1_sum+1)	;volatile
	movf	(_Touch_Number1),w	;volatile
	movwf	(_Touch_Number1_sum)	;volatile
	line	282
	
l2549:	
;TOUCH.C: 282: SendTouch_Number2[0] = Touch_Number1;
	movf	(_Touch_Number1+1),w	;volatile
	movwf	(_SendTouch_Number2+1)	;volatile
	movf	(_Touch_Number1),w	;volatile
	movwf	(_SendTouch_Number2)	;volatile
	line	284
	
l2551:	
;TOUCH.C: 284: Touch_Number1=0;
	clrf	(_Touch_Number1)	;volatile
	clrf	(_Touch_Number1+1)	;volatile
	line	285
	
l2553:	
;TOUCH.C: 285: ReadCap1(2);
	movlw	low(02h)
	fcall	_ReadCap1
	line	288
	
l2555:	
;TOUCH.C: 288: Touch_Number1_sum=Touch_Number1+Touch_Number1_sum;
	movf	(_Touch_Number1),w	;volatile
	addwf	(_Touch_Number1_sum),f	;volatile
	skipnc
	incf	(_Touch_Number1_sum+1),f	;volatile
	movf	(_Touch_Number1+1),w	;volatile
	addwf	(_Touch_Number1_sum+1),f	;volatile
	line	289
	
l2557:	
;TOUCH.C: 289: SendTouch_Number2[1] = Touch_Number1;
	movf	(_Touch_Number1+1),w	;volatile
	movwf	1+(_SendTouch_Number2)+02h	;volatile
	movf	(_Touch_Number1),w	;volatile
	movwf	0+(_SendTouch_Number2)+02h	;volatile
	line	292
	
l2559:	
;TOUCH.C: 292: ReadCap1(4);
	movlw	low(04h)
	fcall	_ReadCap1
	line	293
	
l2561:	
;TOUCH.C: 293: Touch_Number1_sum=Touch_Number1+Touch_Number1_sum;
	movf	(_Touch_Number1),w	;volatile
	addwf	(_Touch_Number1_sum),f	;volatile
	skipnc
	incf	(_Touch_Number1_sum+1),f	;volatile
	movf	(_Touch_Number1+1),w	;volatile
	addwf	(_Touch_Number1_sum+1),f	;volatile
	line	294
	
l2563:	
;TOUCH.C: 294: SendTouch_Number2[2] = Touch_Number1;
	movf	(_Touch_Number1+1),w	;volatile
	movwf	1+(_SendTouch_Number2)+04h	;volatile
	movf	(_Touch_Number1),w	;volatile
	movwf	0+(_SendTouch_Number2)+04h	;volatile
	line	296
	
l2565:	
;TOUCH.C: 296: ReadCap1(8);
	movlw	low(08h)
	fcall	_ReadCap1
	line	297
	
l2567:	
;TOUCH.C: 297: Touch_Number1_sum=Touch_Number1+Touch_Number1_sum+2;
	movf	(_Touch_Number1_sum),w	;volatile
	addwf	(_Touch_Number1),w	;volatile
	movwf	(??_ReadCapDisCharge+0)+0
	movf	(_Touch_Number1_sum+1),w	;volatile
	skipnc
	incf	(_Touch_Number1_sum+1),w	;volatile
	addwf	(_Touch_Number1+1),w	;volatile
	movwf	1+(??_ReadCapDisCharge+0)+0
	movf	0+(??_ReadCapDisCharge+0)+0,w
	addlw	low(02h)
	movwf	(_Touch_Number1_sum)	;volatile
	movf	1+(??_ReadCapDisCharge+0)+0,w
	skipnc
	addlw	1
	addlw	high(02h)
	movwf	1+(_Touch_Number1_sum)	;volatile
	line	298
	
l2569:	
;TOUCH.C: 298: SendTouch_Number2[3] = Touch_Number1;
	movf	(_Touch_Number1+1),w	;volatile
	movwf	1+(_SendTouch_Number2)+06h	;volatile
	movf	(_Touch_Number1),w	;volatile
	movwf	0+(_SendTouch_Number2)+06h	;volatile
	line	300
	
l2571:	
;TOUCH.C: 300: SendHead();
	fcall	_SendHead
	line	301
	
l2573:	
;TOUCH.C: 301: uart_tx(1);
	movlw	low(01h)
	fcall	_uart_tx
	line	302
	
l2575:	
;TOUCH.C: 302: uart_tx(0xfe);
	movlw	low(0FEh)
	fcall	_uart_tx
	line	303
	
l2577:	
;TOUCH.C: 303: for(Count = 0;Count<=3;Count++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ReadCapDisCharge@Count)
	line	305
	
l2583:	
;TOUCH.C: 304: {
;TOUCH.C: 305: uart_tx(SendTouch_Number1[Count]>>8);
	clrc
	rlf	(ReadCapDisCharge@Count),w
	addlw	low(_SendTouch_Number1|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_ReadCapDisCharge+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ReadCapDisCharge+0)+0+1
	movf	1+(??_ReadCapDisCharge+0)+0,w
	fcall	_uart_tx
	line	306
;TOUCH.C: 306: uart_tx(SendTouch_Number1[Count]);
	bcf	status, 5	;RP0=0, select bank0
	clrc
	rlf	(ReadCapDisCharge@Count),w
	addlw	low(_SendTouch_Number1|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_uart_tx
	line	303
	
l2585:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(ReadCapDisCharge@Count),f
	
l2587:	
	movlw	low(04h)
	subwf	(ReadCapDisCharge@Count),w
	skipc
	goto	u411
	goto	u410
u411:
	goto	l2583
u410:
	line	308
	
l2589:	
;TOUCH.C: 307: }
;TOUCH.C: 308: for(Count = 0;Count<=11;Count++)
	clrf	(ReadCapDisCharge@Count)
	line	310
	
l2595:	
;TOUCH.C: 309: {
;TOUCH.C: 310: uart_tx(0);
	movlw	low(0)
	fcall	_uart_tx
	line	311
;TOUCH.C: 311: uart_tx(0);
	movlw	low(0)
	fcall	_uart_tx
	line	308
	
l2597:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(ReadCapDisCharge@Count),f
	
l2599:	
	movlw	low(0Ch)
	subwf	(ReadCapDisCharge@Count),w
	skipc
	goto	u421
	goto	u420
u421:
	goto	l2595
u420:
	line	313
	
l2601:	
;TOUCH.C: 312: }
;TOUCH.C: 313: uart_tx(Touch_Number_sum>>8);
	movf	0+(_Touch_Number_sum)+01h,w	;volatile
	fcall	_uart_tx
	line	314
;TOUCH.C: 314: uart_tx(Touch_Number_sum);
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Touch_Number_sum),w	;volatile
	fcall	_uart_tx
	line	316
;TOUCH.C: 316: SendHead();
	fcall	_SendHead
	line	317
;TOUCH.C: 317: uart_tx(2);
	movlw	low(02h)
	fcall	_uart_tx
	line	318
;TOUCH.C: 318: uart_tx(0xfd);
	movlw	low(0FDh)
	fcall	_uart_tx
	line	319
	
l2603:	
;TOUCH.C: 319: for(Count = 0;Count<=3;Count++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ReadCapDisCharge@Count)
	line	321
	
l2609:	
;TOUCH.C: 320: {
;TOUCH.C: 321: uart_tx(SendTouch_Number2[Count]>>8);
	clrc
	rlf	(ReadCapDisCharge@Count),w
	addlw	low(_SendTouch_Number2|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_ReadCapDisCharge+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_ReadCapDisCharge+0)+0+1
	movf	1+(??_ReadCapDisCharge+0)+0,w
	fcall	_uart_tx
	line	322
;TOUCH.C: 322: uart_tx(SendTouch_Number2[Count]);
	bcf	status, 5	;RP0=0, select bank0
	clrc
	rlf	(ReadCapDisCharge@Count),w
	addlw	low(_SendTouch_Number2|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_uart_tx
	line	319
	
l2611:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(ReadCapDisCharge@Count),f
	
l2613:	
	movlw	low(04h)
	subwf	(ReadCapDisCharge@Count),w
	skipc
	goto	u431
	goto	u430
u431:
	goto	l2609
u430:
	line	324
	
l2615:	
;TOUCH.C: 323: }
;TOUCH.C: 324: for(Count = 0;Count<=11;Count++)
	clrf	(ReadCapDisCharge@Count)
	line	326
	
l2621:	
;TOUCH.C: 325: {
;TOUCH.C: 326: uart_tx(0);
	movlw	low(0)
	fcall	_uart_tx
	line	327
;TOUCH.C: 327: uart_tx(0);
	movlw	low(0)
	fcall	_uart_tx
	line	324
	
l2623:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(ReadCapDisCharge@Count),f
	
l2625:	
	movlw	low(0Ch)
	subwf	(ReadCapDisCharge@Count),w
	skipc
	goto	u441
	goto	u440
u441:
	goto	l2621
u440:
	line	329
	
l2627:	
;TOUCH.C: 328: }
;TOUCH.C: 329: uart_tx(Touch_Number1_sum>>8);
	movf	0+(_Touch_Number1_sum)+01h,w	;volatile
	fcall	_uart_tx
	line	330
;TOUCH.C: 330: uart_tx(Touch_Number1_sum);
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Touch_Number1_sum),w	;volatile
	fcall	_uart_tx
	line	332
;TOUCH.C: 332: SendHead();
	fcall	_SendHead
	line	333
;TOUCH.C: 333: uart_tx(3);
	movlw	low(03h)
	fcall	_uart_tx
	line	334
;TOUCH.C: 334: uart_tx(0xfc);
	movlw	low(0FCh)
	fcall	_uart_tx
	line	335
	
l2629:	
;TOUCH.C: 335: for(Count = 0;Count<=15;Count++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ReadCapDisCharge@Count)
	line	337
	
l2635:	
;TOUCH.C: 336: {
;TOUCH.C: 337: uart_tx(0);
	movlw	low(0)
	fcall	_uart_tx
	line	338
;TOUCH.C: 338: uart_tx(0);
	movlw	low(0)
	fcall	_uart_tx
	line	335
	
l2637:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(ReadCapDisCharge@Count),f
	
l2639:	
	movlw	low(010h)
	subwf	(ReadCapDisCharge@Count),w
	skipc
	goto	u451
	goto	u450
u451:
	goto	l2635
u450:
	line	340
	
l2641:	
;TOUCH.C: 339: }
;TOUCH.C: 340: uart_tx(0);
	movlw	low(0)
	fcall	_uart_tx
	line	341
;TOUCH.C: 341: uart_tx(3);
	movlw	low(03h)
	fcall	_uart_tx
	line	342
;TOUCH.C: 342: SendHead();
	fcall	_SendHead
	line	343
;TOUCH.C: 343: uart_tx(4);
	movlw	low(04h)
	fcall	_uart_tx
	line	344
;TOUCH.C: 344: uart_tx(0xfb);
	movlw	low(0FBh)
	fcall	_uart_tx
	line	345
	
l2643:	
;TOUCH.C: 345: for(Count = 0;Count<=15;Count++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ReadCapDisCharge@Count)
	line	347
	
l2649:	
;TOUCH.C: 346: {
;TOUCH.C: 347: uart_tx(0);
	movlw	low(0)
	fcall	_uart_tx
	line	348
;TOUCH.C: 348: uart_tx(0);
	movlw	low(0)
	fcall	_uart_tx
	line	345
	
l2651:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(ReadCapDisCharge@Count),f
	
l2653:	
	movlw	low(010h)
	subwf	(ReadCapDisCharge@Count),w
	skipc
	goto	u461
	goto	u460
u461:
	goto	l2649
u460:
	line	350
	
l2655:	
;TOUCH.C: 349: }
;TOUCH.C: 350: uart_tx(0);
	movlw	low(0)
	fcall	_uart_tx
	line	351
;TOUCH.C: 351: uart_tx(4);
	movlw	low(04h)
	fcall	_uart_tx
	line	352
;TOUCH.C: 352: SendHead();
	fcall	_SendHead
	line	353
;TOUCH.C: 353: uart_tx(5);
	movlw	low(05h)
	fcall	_uart_tx
	line	354
;TOUCH.C: 354: uart_tx(0xfa);
	movlw	low(0FAh)
	fcall	_uart_tx
	line	355
	
l2657:	
;TOUCH.C: 355: for(Count = 0;Count<=15;Count++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ReadCapDisCharge@Count)
	line	357
	
l2663:	
;TOUCH.C: 356: {
;TOUCH.C: 357: uart_tx(0);
	movlw	low(0)
	fcall	_uart_tx
	line	358
;TOUCH.C: 358: uart_tx(0);
	movlw	low(0)
	fcall	_uart_tx
	line	355
	
l2665:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(ReadCapDisCharge@Count),f
	
l2667:	
	movlw	low(010h)
	subwf	(ReadCapDisCharge@Count),w
	skipc
	goto	u471
	goto	u470
u471:
	goto	l2663
u470:
	line	360
	
l2669:	
;TOUCH.C: 359: }
;TOUCH.C: 360: uart_tx(0);
	movlw	low(0)
	fcall	_uart_tx
	line	361
;TOUCH.C: 361: uart_tx(5);
	movlw	low(05h)
	fcall	_uart_tx
	line	362
;TOUCH.C: 362: SendHead();
	fcall	_SendHead
	line	363
;TOUCH.C: 363: uart_tx(6);
	movlw	low(06h)
	fcall	_uart_tx
	line	364
;TOUCH.C: 364: uart_tx(0xf9);
	movlw	low(0F9h)
	fcall	_uart_tx
	line	365
	
l2671:	
;TOUCH.C: 365: for(Count = 0;Count<=15;Count++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ReadCapDisCharge@Count)
	line	367
	
l2677:	
;TOUCH.C: 366: {
;TOUCH.C: 367: uart_tx(0);
	movlw	low(0)
	fcall	_uart_tx
	line	368
;TOUCH.C: 368: uart_tx(0);
	movlw	low(0)
	fcall	_uart_tx
	line	365
	
l2679:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(ReadCapDisCharge@Count),f
	
l2681:	
	movlw	low(010h)
	subwf	(ReadCapDisCharge@Count),w
	skipc
	goto	u481
	goto	u480
u481:
	goto	l2677
u480:
	line	370
	
l2683:	
;TOUCH.C: 369: }
;TOUCH.C: 370: uart_tx(0);
	movlw	low(0)
	fcall	_uart_tx
	line	371
;TOUCH.C: 371: uart_tx(6);
	movlw	low(06h)
	fcall	_uart_tx
	line	372
;TOUCH.C: 372: DelayMs(10);
	movlw	low(0Ah)
	fcall	_DelayMs
	line	373
	
l1506:	
	return
	opt stack 0
GLOBAL	__end_of_ReadCapDisCharge
	__end_of_ReadCapDisCharge:
	signat	_ReadCapDisCharge,89
	global	_SendHead

;; *************** function _SendHead *****************
;; Defined at:
;;		line 36 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMMONh COMMONl   BANK0
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_uart_tx
;; This function is called by:
;;		_ReadCapDisCharge
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=1
	line	36
global __ptext4
__ptext4:	;psect for function _SendHead
psect	text4
	file	"TOUCH.C"
	line	36
	global	__size_of_SendHead
	__size_of_SendHead	equ	__end_of_SendHead-_SendHead
	
_SendHead:	
;incstack = 0
	opt	stack 2
; Regs used in _SendHead: [wreg+status,2+status,0+pclath+cstack]
	line	38
	
l2407:	
;TOUCH.C: 38: uart_tx(0x00);
	movlw	low(0)
	fcall	_uart_tx
	line	39
;TOUCH.C: 39: uart_tx(0x55);
	movlw	low(055h)
	fcall	_uart_tx
	line	40
;TOUCH.C: 40: uart_tx(0xaa);
	movlw	low(0AAh)
	fcall	_uart_tx
	line	41
	
l1439:	
	return
	opt stack 0
GLOBAL	__end_of_SendHead
	__end_of_SendHead:
	signat	_SendHead,89
	global	_uart_tx

;; *************** function _uart_tx *****************
;; Defined at:
;;		line 97 in file "main.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMMONh COMMONl   BANK0
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_uart_delay
;; This function is called by:
;;		_SendHead
;;		_ReadCapDisCharge
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	file	"main.c"
	line	97
global __ptext5
__ptext5:	;psect for function _uart_tx
psect	text5
	file	"main.c"
	line	97
	global	__size_of_uart_tx
	__size_of_uart_tx	equ	__end_of_uart_tx-_uart_tx
	
_uart_tx:	
;incstack = 0
	opt	stack 3
; Regs used in _uart_tx: [wreg+status,2+status,0+pclath+cstack]
;uart_tx@data stored from wreg
	movwf	(uart_tx@data)
	line	99
	
l2309:	
;main.c: 99: GIE = 0;
	bcf	(95/8),(95)&7	;volatile
	line	100
;main.c: 100: PA1 =0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7	;volatile
	line	101
	
l2311:	
;main.c: 101: uart_delay();
	fcall	_uart_delay
	line	102
	
l2313:	
;main.c: 102: if(data & 0x01)
	btfss	(uart_tx@data),(0)&7
	goto	u251
	goto	u250
u251:
	goto	l707
u250:
	line	104
	
l2315:	
;main.c: 103: {
;main.c: 104: PA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7	;volatile
	line	105
	
l2317:	
;main.c: 105: uart_delay();
	fcall	_uart_delay
	line	106
;main.c: 106: }
	goto	l2321
	line	107
	
l707:	
	line	109
;main.c: 107: else
;main.c: 108: {
;main.c: 109: PA1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7	;volatile
	line	110
;main.c: 110: __nop();__nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	goto	l2317
	line	113
	
l2321:	
;main.c: 112: }
;main.c: 113: if(data & 0x02)
	btfss	(uart_tx@data),(1)&7
	goto	u261
	goto	u260
u261:
	goto	l709
u260:
	line	115
	
l2323:	
;main.c: 114: {
;main.c: 115: PA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7	;volatile
	line	116
	
l2325:	
;main.c: 116: uart_delay();
	fcall	_uart_delay
	line	117
;main.c: 117: }
	goto	l2329
	line	118
	
l709:	
	line	120
;main.c: 118: else
;main.c: 119: {
;main.c: 120: PA1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7	;volatile
	line	121
;main.c: 121: __nop();__nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	goto	l2325
	line	124
	
l2329:	
;main.c: 123: }
;main.c: 124: if(data & 0x04)
	btfss	(uart_tx@data),(2)&7
	goto	u271
	goto	u270
u271:
	goto	l711
u270:
	line	126
	
l2331:	
;main.c: 125: {
;main.c: 126: PA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7	;volatile
	line	127
	
l2333:	
;main.c: 127: uart_delay();
	fcall	_uart_delay
	line	128
;main.c: 128: }
	goto	l2337
	line	129
	
l711:	
	line	131
;main.c: 129: else
;main.c: 130: {
;main.c: 131: PA1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7	;volatile
	line	132
;main.c: 132: __nop();__nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	goto	l2333
	line	135
	
l2337:	
;main.c: 134: }
;main.c: 135: if(data & 0x08)
	btfss	(uart_tx@data),(3)&7
	goto	u281
	goto	u280
u281:
	goto	l713
u280:
	line	137
	
l2339:	
;main.c: 136: {
;main.c: 137: PA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7	;volatile
	line	138
	
l2341:	
;main.c: 138: uart_delay();
	fcall	_uart_delay
	line	139
;main.c: 139: }
	goto	l2345
	line	140
	
l713:	
	line	142
;main.c: 140: else
;main.c: 141: {
;main.c: 142: PA1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7	;volatile
	line	143
;main.c: 143: __nop();__nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	goto	l2341
	line	146
	
l2345:	
;main.c: 145: }
;main.c: 146: if(data & 0x10)
	btfss	(uart_tx@data),(4)&7
	goto	u291
	goto	u290
u291:
	goto	l715
u290:
	line	148
	
l2347:	
;main.c: 147: {
;main.c: 148: PA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7	;volatile
	line	149
	
l2349:	
;main.c: 149: uart_delay();
	fcall	_uart_delay
	line	150
;main.c: 150: }
	goto	l2353
	line	151
	
l715:	
	line	153
;main.c: 151: else
;main.c: 152: {
;main.c: 153: PA1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7	;volatile
	line	154
;main.c: 154: __nop();__nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	goto	l2349
	line	157
	
l2353:	
;main.c: 156: }
;main.c: 157: if(data & 0x20)
	btfss	(uart_tx@data),(5)&7
	goto	u301
	goto	u300
u301:
	goto	l717
u300:
	line	159
	
l2355:	
;main.c: 158: {
;main.c: 159: PA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7	;volatile
	line	160
	
l2357:	
;main.c: 160: uart_delay();
	fcall	_uart_delay
	line	161
;main.c: 161: }
	goto	l2361
	line	162
	
l717:	
	line	164
;main.c: 162: else
;main.c: 163: {
;main.c: 164: PA1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7	;volatile
	line	165
;main.c: 165: __nop();__nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	goto	l2357
	line	168
	
l2361:	
;main.c: 167: }
;main.c: 168: if(data & 0x40)
	btfss	(uart_tx@data),(6)&7
	goto	u311
	goto	u310
u311:
	goto	l719
u310:
	line	170
	
l2363:	
;main.c: 169: {
;main.c: 170: PA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7	;volatile
	line	171
	
l2365:	
;main.c: 171: uart_delay();
	fcall	_uart_delay
	line	172
;main.c: 172: }
	goto	l2369
	line	173
	
l719:	
	line	175
;main.c: 173: else
;main.c: 174: {
;main.c: 175: PA1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7	;volatile
	line	176
;main.c: 176: __nop();__nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	goto	l2365
	line	179
	
l2369:	
;main.c: 178: }
;main.c: 179: if(data & 0x80)
	btfss	(uart_tx@data),(7)&7
	goto	u321
	goto	u320
u321:
	goto	l721
u320:
	line	181
	
l2371:	
;main.c: 180: {
;main.c: 181: PA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7	;volatile
	line	182
	
l2373:	
;main.c: 182: uart_delay();
	fcall	_uart_delay
	line	183
;main.c: 183: }
	goto	l2377
	line	184
	
l721:	
	line	186
;main.c: 184: else
;main.c: 185: {
;main.c: 186: PA1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7	;volatile
	line	187
;main.c: 187: __nop();__nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	goto	l2373
	line	190
	
l2377:	
;main.c: 189: }
;main.c: 190: PA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(41/8),(41)&7	;volatile
	line	191
;main.c: 191: uart_delay ();
	fcall	_uart_delay
	line	192
	
l2379:	
;main.c: 192: GIE =1;
	bsf	(95/8),(95)&7	;volatile
	line	193
	
l723:	
	return
	opt stack 0
GLOBAL	__end_of_uart_tx
	__end_of_uart_tx:
	signat	_uart_tx,4217
	global	_uart_delay

;; *************** function _uart_delay *****************
;; Defined at:
;;		line 89 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMMONh COMMONl   BANK0
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_tx
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1,group=0
	line	89
global __ptext6
__ptext6:	;psect for function _uart_delay
psect	text6
	file	"main.c"
	line	89
	global	__size_of_uart_delay
	__size_of_uart_delay	equ	__end_of_uart_delay-_uart_delay
	
_uart_delay:	
;incstack = 0
	opt	stack 3
; Regs used in _uart_delay: []
	line	92
	
l2307:	
;main.c: 92: __nop();__nop();__nop();__nop();__nop();__nop();__nop();__nop();__nop();__nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	line	93
;main.c: 93: __nop();__nop();__nop();__nop();__nop();__nop();__nop();__nop();__nop();__nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	line	94
;main.c: 94: __nop();__nop();__nop();__nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	line	95
	
l704:	
	return
	opt stack 0
GLOBAL	__end_of_uart_delay
	__end_of_uart_delay:
	signat	_uart_delay,89
	global	_ReadCap1

;; *************** function _ReadCap1 *****************
;; Defined at:
;;		line 186 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;  ch              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ch              1    0[BANK0 ] unsigned char 
;;  sum             2    1[BANK0 ] unsigned int 
;;  Count           1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:    COMMONh COMMONl   BANK0
;;      Params:         0       0       0
;;      Locals:         0       0       4
;;      Temps:          2       0       0
;;      Totals:         2       0       4
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DelayUsz
;;		_Touch_end
;;		_Touch_init
;; This function is called by:
;;		_ReadCapDisCharge
;; This function uses a non-reentrant model
;;
psect	text7,local,class=CODE,delta=2,merge=1,group=1
	file	"TOUCH.C"
	line	186
global __ptext7
__ptext7:	;psect for function _ReadCap1
psect	text7
	file	"TOUCH.C"
	line	186
	global	__size_of_ReadCap1
	__size_of_ReadCap1	equ	__end_of_ReadCap1-_ReadCap1
	
_ReadCap1:	
;incstack = 0
	opt	stack 3
; Regs used in _ReadCap1: [wreg+status,2+status,0+pclath+cstack]
;ReadCap1@ch stored from wreg
	movwf	(ReadCap1@ch)
	line	188
	
l2477:	
;TOUCH.C: 188: unsigned int sum=0;
	clrf	(ReadCap1@sum)
	clrf	(ReadCap1@sum+1)
	line	190
;TOUCH.C: 190: Touch_Number1=0;
	clrf	(_Touch_Number1)	;volatile
	clrf	(_Touch_Number1+1)	;volatile
	line	191
	
l2479:	
;TOUCH.C: 191: chbuff=NowKey&ch;
	movf	(117),w	;volatile
	andwf	(ReadCap1@ch),w
	movwf	(118)	;volatile
	line	192
	
l2481:	
;TOUCH.C: 192: if(chbuff==0)
	movf	((118)),w	;volatile
	btfss	status,2
	goto	u391
	goto	u390
u391:
	goto	l2485
u390:
	goto	l1482
	line	195
	
l2485:	
;TOUCH.C: 195: for(Count=0;Count<=3;Count++)
	clrf	(ReadCap1@Count)
	line	197
	
l2491:	
;TOUCH.C: 196: {
;TOUCH.C: 197: Touch_init();
	fcall	_Touch_init
	line	199
	
l2493:	
;TOUCH.C: 199: TKCHGS1=0;
	bcf	(1078/8)^080h,(1078)&7	;volatile
	line	200
	
l2495:	
;TOUCH.C: 200: TKCHGS0=1;
	bsf	(1077/8)^080h,(1077)&7	;volatile
	line	201
	
l2497:	
;TOUCH.C: 201: TKEN = 1;
	bsf	(1076/8)^080h,(1076)&7	;volatile
	line	202
	
l2499:	
;TOUCH.C: 202: DelayUsz();
	fcall	_DelayUsz
	line	203
	
l2501:	
;TOUCH.C: 203: TKEN = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7	;volatile
	line	205
	
l2503:	
;TOUCH.C: 205: TKCHGS0=0;
	bcf	(1077/8)^080h,(1077)&7	;volatile
	line	206
	
l2505:	
;TOUCH.C: 206: TKCHGS1=0;
	bcf	(1078/8)^080h,(1078)&7	;volatile
	line	210
# 210 "TOUCH.C"
banksel _TKCON ;# 
	line	211
# 211 "TOUCH.C"
touch_loop1: ;# 
	line	213
# 213 "TOUCH.C"
movf _chbuff,w ;# 
	line	214
# 214 "TOUCH.C"
iorlw 0x60 ;# 
	line	215
# 215 "TOUCH.C"
bsf 3,5 ;# 
	line	216
# 216 "TOUCH.C"
movwf 6 ;# 
	line	218
# 218 "TOUCH.C"
bsf 6,4 ;# 
	line	219
# 219 "TOUCH.C"
incf _Touch_C0,f ;# 
	line	220
# 220 "TOUCH.C"
btfsc _STATUS,2 ;# 
	line	221
# 221 "TOUCH.C"
incf _Touch_C1,f ;# 
	line	222
# 222 "TOUCH.C"
bcf 6,4 ;# 
	line	224
# 224 "TOUCH.C"
movf _chbuff,w ;# 
	line	225
# 225 "TOUCH.C"
bsf 3,5 ;# 
	line	226
# 226 "TOUCH.C"
movwf 6 ;# 
	line	228
# 228 "TOUCH.C"
btfss 0x0e,2 ;# 
	line	229
# 229 "TOUCH.C"
goto touch_loop1 ;# 
	line	231
# 231 "TOUCH.C"
breakloop1: ;# 
psect	text7
	line	234
	
l2507:	
;TOUCH.C: 234: Touch_end();
	fcall	_Touch_end
	line	235
	
l2509:	
;TOUCH.C: 235: Touch_Number1=Touch_C1*256+Touch_C0;
	bcf	status, 5	;RP0=0, select bank0
	movf	(116),w	;volatile
	movwf	(_Touch_Number1+1)	;volatile
	clrf	(_Touch_Number1)	;volatile
	
l2511:	
	movf	(115),w	;volatile
	addwf	(_Touch_Number1),f	;volatile
	skipnc
	incf	(_Touch_Number1+1),f	;volatile
	line	236
	
l2513:	
;TOUCH.C: 236: sum= Touch_Number1+sum;
	movf	(_Touch_Number1),w	;volatile
	addwf	(ReadCap1@sum),f
	skipnc
	incf	(ReadCap1@sum+1),f
	movf	(_Touch_Number1+1),w	;volatile
	addwf	(ReadCap1@sum+1),f
	line	195
	
l2515:	
	incf	(ReadCap1@Count),f
	
l2517:	
	movlw	low(04h)
	subwf	(ReadCap1@Count),w
	skipc
	goto	u401
	goto	u400
u401:
	goto	l2491
u400:
	line	238
	
l2519:	
;TOUCH.C: 237: }
;TOUCH.C: 238: Touch_Number1 = sum >> 2;
	movf	(ReadCap1@sum+1),w
	movwf	(??_ReadCap1+0)+0+1
	movf	(ReadCap1@sum),w
	movwf	(??_ReadCap1+0)+0
	clrc
	rrf	(??_ReadCap1+0)+1,f
	rrf	(??_ReadCap1+0)+0,f
	clrc
	rrf	(??_ReadCap1+0)+1,f
	rrf	(??_ReadCap1+0)+0,f
	movf	0+(??_ReadCap1+0)+0,w
	movwf	(_Touch_Number1)	;volatile
	movf	1+(??_ReadCap1+0)+0,w
	movwf	(_Touch_Number1+1)	;volatile
	line	240
	
l1482:	
	return
	opt stack 0
GLOBAL	__end_of_ReadCap1
	__end_of_ReadCap1:
	signat	_ReadCap1,4217
	global	_Touch_init

;; *************** function _Touch_init *****************
;; Defined at:
;;		line 168 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/100
;;		Unchanged: 0/0
;; Data sizes:    COMMONh COMMONl   BANK0
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ReadCap1
;; This function uses a non-reentrant model
;;
psect	text8,local,class=CODE,delta=2,merge=1,group=1
	line	168
global __ptext8
__ptext8:	;psect for function _Touch_init
psect	text8
	file	"TOUCH.C"
	line	168
	global	__size_of_Touch_init
	__size_of_Touch_init	equ	__end_of_Touch_init-_Touch_init
	
_Touch_init:	
;incstack = 0
	opt	stack 3
; Regs used in _Touch_init: [status,2]
	line	170
	
l2397:	
;TOUCH.C: 170: Touch_C0= 0;
	clrf	(115)	;volatile
	line	171
;TOUCH.C: 171: Touch_C1= 0;
	clrf	(116)	;volatile
	line	173
	
l2399:	
;TOUCH.C: 173: LVDEN =1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1139/8)^080h,(1139)&7	;volatile
	line	175
;TOUCH.C: 175: TKCON = 0;
	clrf	(134)^080h	;volatile
	line	176
	
l1475:	
	return
	opt stack 0
GLOBAL	__end_of_Touch_init
	__end_of_Touch_init:
	signat	_Touch_init,89
	global	_Touch_end

;; *************** function _Touch_end *****************
;; Defined at:
;;		line 177 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 0/100
;;		On exit  : 100/100
;;		Unchanged: 0/0
;; Data sizes:    COMMONh COMMONl   BANK0
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ReadCap1
;; This function uses a non-reentrant model
;;
psect	text9,local,class=CODE,delta=2,merge=1,group=1
	line	177
global __ptext9
__ptext9:	;psect for function _Touch_end
psect	text9
	file	"TOUCH.C"
	line	177
	global	__size_of_Touch_end
	__size_of_Touch_end	equ	__end_of_Touch_end-_Touch_end
	
_Touch_end:	
;incstack = 0
	opt	stack 3
; Regs used in _Touch_end: [status,2]
	line	179
	
l2401:	
;TOUCH.C: 179: TKCON = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(134)^080h	;volatile
	line	180
	
l2403:	
;TOUCH.C: 180: TKEN = 1;
	bsf	(1076/8)^080h,(1076)&7	;volatile
	line	182
	
l2405:	
;TOUCH.C: 182: LVDEN=0;
	bcf	(1139/8)^080h,(1139)&7	;volatile
	line	183
	
l1478:	
	return
	opt stack 0
GLOBAL	__end_of_Touch_end
	__end_of_Touch_end:
	signat	_Touch_end,89
	global	_DelayUsz

;; *************** function _DelayUsz *****************
;; Defined at:
;;		line 43 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/100
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMMONh COMMONl   BANK0
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ReadCap1
;; This function uses a non-reentrant model
;;
psect	text10,local,class=CODE,delta=2,merge=1,group=1
	line	43
global __ptext10
__ptext10:	;psect for function _DelayUsz
psect	text10
	file	"TOUCH.C"
	line	43
	global	__size_of_DelayUsz
	__size_of_DelayUsz	equ	__end_of_DelayUsz-_DelayUsz
	
_DelayUsz:	
;incstack = 0
	opt	stack 3
; Regs used in _DelayUsz: [wreg+status,2+status,0]
	line	46
	
l2381:	
;TOUCH.C: 45: unsigned char a;
;TOUCH.C: 46: for(a=0;a<250;a++)
	clrf	(DelayUsz@a)
	line	47
	
l1442:	
	line	48
;TOUCH.C: 47: {
;TOUCH.C: 48: __nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	line	46
	
l2387:	
	incf	(DelayUsz@a),f
	
l2389:	
	movlw	low(0FAh)
	subwf	(DelayUsz@a),w
	skipc
	goto	u331
	goto	u330
u331:
	goto	l1442
u330:
	line	50
	
l1444:	
	return
	opt stack 0
GLOBAL	__end_of_DelayUsz
	__end_of_DelayUsz:
	signat	_DelayUsz,89
	global	_DelayMs

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 72 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;  Time            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Time            1    0[COMMON] unsigned char 
;;  b               1    2[COMMON] unsigned char 
;;  a               1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMMONh COMMONl   BANK0
;;      Params:         0       0       0
;;      Locals:         0       3       0
;;      Temps:          0       0       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DelayUs
;; This function is called by:
;;		_ReadCapDisCharge
;; This function uses a non-reentrant model
;;
psect	text11,local,class=CODE,delta=2,merge=1,group=1
	line	72
global __ptext11
__ptext11:	;psect for function _DelayMs
psect	text11
	file	"TOUCH.C"
	line	72
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
;incstack = 0
	opt	stack 3
; Regs used in _DelayMs: [wreg+status,2+status,0+pclath+cstack]
;DelayMs@Time stored from wreg
	movwf	(DelayMs@Time)
	line	75
	
l2409:	
;TOUCH.C: 74: unsigned char a,b;
;TOUCH.C: 75: for(a=0;a<Time;a++)
	clrf	(DelayMs@a)
	goto	l2425
	line	77
	
l2411:	
;TOUCH.C: 76: {
;TOUCH.C: 77: for(b=0;b<5;b++)
	clrf	(DelayMs@b)
	line	79
	
l2417:	
;TOUCH.C: 78: {
;TOUCH.C: 79: DelayUs(197);
	movlw	low(0C5h)
	fcall	_DelayUs
	line	77
	
l2419:	
	incf	(DelayMs@b),f
	
l2421:	
	movlw	low(05h)
	subwf	(DelayMs@b),w
	skipc
	goto	u351
	goto	u350
u351:
	goto	l2417
u350:
	line	75
	
l2423:	
	incf	(DelayMs@a),f
	
l2425:	
	movf	(DelayMs@Time),w
	subwf	(DelayMs@a),w
	skipc
	goto	u361
	goto	u360
u361:
	goto	l2411
u360:
	line	82
	
l1458:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
	signat	_DelayMs,4217
	global	_DelayUs

;; *************** function _DelayUs *****************
;; Defined at:
;;		line 58 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;  Time            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Time            1    2[COMMON] unsigned char 
;;  a               1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMMONh COMMONl   BANK0
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DelayMs
;; This function uses a non-reentrant model
;;
psect	text12,local,class=CODE,delta=2,merge=1,group=1
	line	58
global __ptext12
__ptext12:	;psect for function _DelayUs
psect	text12
	file	"TOUCH.C"
	line	58
	global	__size_of_DelayUs
	__size_of_DelayUs	equ	__end_of_DelayUs-_DelayUs
	
_DelayUs:	
;incstack = 0
	opt	stack 3
; Regs used in _DelayUs: [wreg+status,2+status,0]
;DelayUs@Time stored from wreg
	movwf	(DelayUs@Time)
	line	61
	
l2391:	
;TOUCH.C: 60: unsigned char a;
;TOUCH.C: 61: for(a=0;a<Time;a++)
	clrf	(DelayUs@a)
	goto	l2395
	line	62
	
l1448:	
	line	63
;TOUCH.C: 62: {
;TOUCH.C: 63: __nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	line	61
	
l2393:	
	incf	(DelayUs@a),f
	
l2395:	
	movf	(DelayUs@Time),w
	subwf	(DelayUs@a),w
	skipc
	goto	u341
	goto	u340
u341:
	goto	l1448
u340:
	line	65
	
l1450:	
	return
	opt stack 0
GLOBAL	__end_of_DelayUs
	__end_of_DelayUs:
	signat	_DelayUs,4217
	global	_ReadCapCharge

;; *************** function _ReadCapCharge *****************
;; Defined at:
;;		line 244 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:    COMMONh COMMONl   BANK0
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       2       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_ReadCap
;; This function is called by:
;;		_SendDataToPC
;; This function uses a non-reentrant model
;;
psect	text13,local,class=CODE,delta=2,merge=1,group=1
	line	244
global __ptext13
__ptext13:	;psect for function _ReadCapCharge
psect	text13
	file	"TOUCH.C"
	line	244
	global	__size_of_ReadCapCharge
	__size_of_ReadCapCharge	equ	__end_of_ReadCapCharge-_ReadCapCharge
	
_ReadCapCharge:	
;incstack = 0
	opt	stack 4
; Regs used in _ReadCapCharge: [wreg+status,2+status,0+pclath+cstack]
	file	"touch.h"
	line	14
	
l2521:	
	movlw	low(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(117)	;volatile
	file	"TOUCH.C"
	line	248
	
l2523:	
;TOUCH.C: 248: ReadCap(1);
	movlw	low(01h)
	fcall	_ReadCap
	line	250
	
l2525:	
;TOUCH.C: 250: Touch_Number_sum=Touch_Number;
	movf	(_Touch_Number+1),w	;volatile
	movwf	(_Touch_Number_sum+1)	;volatile
	movf	(_Touch_Number),w	;volatile
	movwf	(_Touch_Number_sum)	;volatile
	line	251
	
l2527:	
;TOUCH.C: 251: SendTouch_Number1[0] = Touch_Number;
	movf	(_Touch_Number+1),w	;volatile
	movwf	(_SendTouch_Number1+1)	;volatile
	movf	(_Touch_Number),w	;volatile
	movwf	(_SendTouch_Number1)	;volatile
	line	254
	
l2529:	
;TOUCH.C: 254: ReadCap(2);
	movlw	low(02h)
	fcall	_ReadCap
	line	257
;TOUCH.C: 257: Touch_Number_sum=Touch_Number+Touch_Number_sum;
	movf	(_Touch_Number),w	;volatile
	addwf	(_Touch_Number_sum),f	;volatile
	skipnc
	incf	(_Touch_Number_sum+1),f	;volatile
	movf	(_Touch_Number+1),w	;volatile
	addwf	(_Touch_Number_sum+1),f	;volatile
	line	258
;TOUCH.C: 258: SendTouch_Number1[1] = Touch_Number;
	movf	(_Touch_Number+1),w	;volatile
	movwf	1+(_SendTouch_Number1)+02h	;volatile
	movf	(_Touch_Number),w	;volatile
	movwf	0+(_SendTouch_Number1)+02h	;volatile
	line	260
	
l2531:	
;TOUCH.C: 260: ReadCap(4);
	movlw	low(04h)
	fcall	_ReadCap
	line	262
	
l2533:	
;TOUCH.C: 262: Touch_Number_sum=Touch_Number+Touch_Number_sum;
	movf	(_Touch_Number),w	;volatile
	addwf	(_Touch_Number_sum),f	;volatile
	skipnc
	incf	(_Touch_Number_sum+1),f	;volatile
	movf	(_Touch_Number+1),w	;volatile
	addwf	(_Touch_Number_sum+1),f	;volatile
	line	264
	
l2535:	
;TOUCH.C: 264: SendTouch_Number1[2] = Touch_Number;
	movf	(_Touch_Number+1),w	;volatile
	movwf	1+(_SendTouch_Number1)+04h	;volatile
	movf	(_Touch_Number),w	;volatile
	movwf	0+(_SendTouch_Number1)+04h	;volatile
	line	266
	
l2537:	
;TOUCH.C: 266: ReadCap(8);
	movlw	low(08h)
	fcall	_ReadCap
	line	268
	
l2539:	
;TOUCH.C: 268: Touch_Number_sum=Touch_Number+Touch_Number_sum+1;
	movf	(_Touch_Number_sum),w	;volatile
	addwf	(_Touch_Number),w	;volatile
	movwf	(??_ReadCapCharge+0)+0
	movf	(_Touch_Number_sum+1),w	;volatile
	skipnc
	incf	(_Touch_Number_sum+1),w	;volatile
	addwf	(_Touch_Number+1),w	;volatile
	movwf	1+(??_ReadCapCharge+0)+0
	movf	0+(??_ReadCapCharge+0)+0,w
	addlw	low(01h)
	movwf	(_Touch_Number_sum)	;volatile
	movf	1+(??_ReadCapCharge+0)+0,w
	skipnc
	addlw	1
	addlw	high(01h)
	movwf	1+(_Touch_Number_sum)	;volatile
	line	269
	
l2541:	
;TOUCH.C: 269: SendTouch_Number1[3] = Touch_Number;
	movf	(_Touch_Number+1),w	;volatile
	movwf	1+(_SendTouch_Number1)+06h	;volatile
	movf	(_Touch_Number),w	;volatile
	movwf	0+(_SendTouch_Number1)+06h	;volatile
	line	271
	
l1487:	
	return
	opt stack 0
GLOBAL	__end_of_ReadCapCharge
	__end_of_ReadCapCharge:
	signat	_ReadCapCharge,89
	global	_ReadCap

;; *************** function _ReadCap *****************
;; Defined at:
;;		line 103 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;  ch              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ch              1    2[BANK0 ] unsigned char 
;;  sum             2    0[BANK0 ] unsigned int 
;;  Count           1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:    COMMONh COMMONl   BANK0
;;      Params:         0       0       0
;;      Locals:         0       0       4
;;      Temps:          2       0       0
;;      Totals:         2       0       4
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ReadCapCharge
;; This function uses a non-reentrant model
;;
psect	text14,local,class=CODE,delta=2,merge=1,group=1
	line	103
global __ptext14
__ptext14:	;psect for function _ReadCap
psect	text14
	file	"TOUCH.C"
	line	103
	global	__size_of_ReadCap
	__size_of_ReadCap	equ	__end_of_ReadCap-_ReadCap
	
_ReadCap:	
;incstack = 0
	opt	stack 4
; Regs used in _ReadCap: [wreg+status,2+status,0]
;ReadCap@ch stored from wreg
	movwf	(ReadCap@ch)
	line	105
	
l2427:	
;TOUCH.C: 105: unsigned int sum=0;
	clrf	(ReadCap@sum)
	clrf	(ReadCap@sum+1)
	line	106
;TOUCH.C: 106: Touch_Number=0;
	clrf	(_Touch_Number)	;volatile
	clrf	(_Touch_Number+1)	;volatile
	line	107
	
l2429:	
;TOUCH.C: 107: ch=NowKey&ch;
	movf	(117),w	;volatile
	andwf	(ReadCap@ch),f
	line	108
	
l2431:	
;TOUCH.C: 108: if(ch==0)
	movf	((ReadCap@ch)),w
	btfss	status,2
	goto	u371
	goto	u370
u371:
	goto	l2435
u370:
	goto	l1470
	line	112
	
l2435:	
;TOUCH.C: 110: unsigned char Count;
;TOUCH.C: 112: for(Count=0;Count<=3;Count++)
	clrf	(ReadCap@Count)
	line	113
	
l1471:	
	line	115
# 115 "TOUCH.C"
start_touch: ;# 
psect	text14
	line	118
	
l2441:	
;TOUCH.C: 118: Touch_C0= 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(115)	;volatile
	line	119
;TOUCH.C: 119: Touch_C1= 0;
	clrf	(116)	;volatile
	line	120
	
l2443:	
;TOUCH.C: 120: LVDCON = 0x03;
	movlw	low(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(141)^080h	;volatile
	line	121
	
l2445:	
;TOUCH.C: 121: PCON = 0x88;
	movlw	low(088h)
	movwf	(142)^080h	;volatile
	line	123
;TOUCH.C: 123: TKCON = 0;
	clrf	(134)^080h	;volatile
	line	124
	
l2447:	
;TOUCH.C: 124: TKEN = 1;
	bsf	(1076/8)^080h,(1076)&7	;volatile
	line	125
	
l2449:	
;TOUCH.C: 125: __nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	line	126
	
l2451:	
;TOUCH.C: 126: __nop();
	opt	asmopt_push
	opt	asmopt_off
	nop
	opt	asmopt_pop
	line	127
	
l2453:	
;TOUCH.C: 127: TKEN = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7	;volatile
	line	129
	
l2455:	
;TOUCH.C: 129: TKCHGS0=1;
	bsf	(1077/8)^080h,(1077)&7	;volatile
	line	130
	
l2457:	
;TOUCH.C: 130: TKCHGS1=1;
	bsf	(1078/8)^080h,(1078)&7	;volatile
	line	134
	
l2459:	
;TOUCH.C: 134: TKCON=TKCON|ch;
	bcf	status, 5	;RP0=0, select bank0
	movf	(ReadCap@ch),w
	bsf	status, 5	;RP0=1, select bank1
	iorwf	(134)^080h,f	;volatile
	line	136
# 136 "TOUCH.C"
banksel _TKCON ;# 
	line	137
# 137 "TOUCH.C"
touch_loop: ;# 
	line	139
# 139 "TOUCH.C"
incf _Touch_C0,f ;# 
	line	140
# 140 "TOUCH.C"
btfsc _STATUS,2 ;# 
	line	141
# 141 "TOUCH.C"
incf _Touch_C1,f ;# 
	line	142
# 142 "TOUCH.C"
bsf 6,6 ;# 
	line	145
# 145 "TOUCH.C"
bsf 6,4 ;# 
	line	147
# 147 "TOUCH.C"
bcf 6,4 ;# 
	line	148
# 148 "TOUCH.C"
bcf 6,6 ;# 
	line	149
# 149 "TOUCH.C"
btfsc 0x0e,2 ;# 
	line	150
# 150 "TOUCH.C"
goto touch_loop ;# 
	line	152
# 152 "TOUCH.C"
breakloop: ;# 
psect	text14
	line	155
	
l2461:	
;TOUCH.C: 155: TKCON = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(134)^080h	;volatile
	line	156
	
l2463:	
;TOUCH.C: 156: TKEN = 1;
	bsf	(1076/8)^080h,(1076)&7	;volatile
	line	157
	
l2465:	
;TOUCH.C: 157: TKCHE3=1;
	bsf	(1075/8)^080h,(1075)&7	;volatile
	line	160
	
l2467:	
;TOUCH.C: 160: Touch_Number=Touch_C1*256+Touch_C0;
	bcf	status, 5	;RP0=0, select bank0
	movf	(116),w	;volatile
	movwf	(_Touch_Number+1)	;volatile
	clrf	(_Touch_Number)	;volatile
	
l2469:	
	movf	(115),w	;volatile
	addwf	(_Touch_Number),f	;volatile
	skipnc
	incf	(_Touch_Number+1),f	;volatile
	line	161
	
l2471:	
;TOUCH.C: 161: sum= Touch_Number+sum;
	movf	(_Touch_Number),w	;volatile
	addwf	(ReadCap@sum),f
	skipnc
	incf	(ReadCap@sum+1),f
	movf	(_Touch_Number+1),w	;volatile
	addwf	(ReadCap@sum+1),f
	line	112
	incf	(ReadCap@Count),f
	
l2473:	
	movlw	low(04h)
	subwf	(ReadCap@Count),w
	skipc
	goto	u381
	goto	u380
u381:
	goto	l1471
u380:
	line	163
	
l2475:	
;TOUCH.C: 162: }
;TOUCH.C: 163: Touch_Number = sum >> 2;
	movf	(ReadCap@sum+1),w
	movwf	(??_ReadCap+0)+0+1
	movf	(ReadCap@sum),w
	movwf	(??_ReadCap+0)+0
	clrc
	rrf	(??_ReadCap+0)+1,f
	rrf	(??_ReadCap+0)+0,f
	clrc
	rrf	(??_ReadCap+0)+1,f
	rrf	(??_ReadCap+0)+0,f
	movf	0+(??_ReadCap+0)+0,w
	movwf	(_Touch_Number)	;volatile
	movf	1+(??_ReadCap+0)+0,w
	movwf	(_Touch_Number+1)	;volatile
	line	164
	
l1470:	
	return
	opt stack 0
GLOBAL	__end_of_ReadCap
	__end_of_ReadCap:
	signat	_ReadCap,4217
	global	_POWER_INITIAL

;; *************** function _POWER_INITIAL *****************
;; Defined at:
;;		line 76 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : B00/100
;;		Unchanged: A00/0
;; Data sizes:    COMMONh COMMONl   BANK0
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text15,local,class=CODE,delta=2,merge=1,group=0
	file	"main.c"
	line	76
global __ptext15
__ptext15:	;psect for function _POWER_INITIAL
psect	text15
	file	"main.c"
	line	76
	global	__size_of_POWER_INITIAL
	__size_of_POWER_INITIAL	equ	__end_of_POWER_INITIAL-_POWER_INITIAL
	
_POWER_INITIAL:	
;incstack = 0
	opt	stack 6
; Regs used in _POWER_INITIAL: [wreg+status,2]
	line	78
	
l2689:	
;main.c: 78: OSCCON = 0B01110000;
	movlw	low(070h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	79
	
l2691:	
;main.c: 79: INTCON = 0;
	clrf	(11)	;volatile
	line	80
	
l2693:	
;main.c: 80: PORTA = 0B00110000;
	movlw	low(030h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	81
	
l2695:	
;main.c: 81: TRISA = 0B00001111;
	movlw	low(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	82
	
l2697:	
;main.c: 82: WPUA = 0B00000000;
	clrf	(149)^080h	;volatile
	line	83
	
l2699:	
;main.c: 83: OPTION = 0B00000000;
	clrf	(129)^080h	;volatile
	line	85
	
l2701:	
;main.c: 85: TRISA &= ~0x2;
	bcf	(133)^080h+(1/8),(1)&7	;volatile
	line	86
	
l701:	
	return
	opt stack 0
GLOBAL	__end_of_POWER_INITIAL
	__end_of_POWER_INITIAL:
	signat	_POWER_INITIAL,89
	global	_ISR

;; *************** function _ISR *****************
;; Defined at:
;;		line 45 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:    COMMONh COMMONl   BANK0
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text16,local,class=CODE,delta=2,merge=1,group=0
	line	45
global __ptext16
__ptext16:	;psect for function _ISR
psect	text16
	file	"main.c"
	line	45
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
;incstack = 0
	opt	stack 2
; Regs used in _ISR: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text16
	line	47
	
i1l2707:	
;main.c: 47: T0IF = 0;
	bcf	(90/8),(90)&7	;volatile
	line	48
	
i1l2709:	
;main.c: 48: TMR0 = 7;
	movlw	low(07h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	49
	
i1l2711:	
;main.c: 49: TCount++;
	incf	(_TCount),f	;volatile
	line	50
	
i1l2713:	
;main.c: 50: PA5 = ~PA5;
	movlw	1<<((45)&7)
	xorwf	((45)/8),f
	line	51
	
i1l695:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
	signat	_ISR,89
global	___latbits
___latbits	equ	0
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
