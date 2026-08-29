//Project: RF-car.prj
// Device: FT60F01X
// Memory: Flash 1KX14b, EEPROM 256X8b, SRAM 64X8b
// Author: 
//Company: 
//Version:
//   Date: 


/*                  FT60F011A  SOP8 
*                 ----------------
*  VDD-----------|1(VDD)    (GND)8|------------GND     
*  data_touch----|2(PA2)    (PA4)7|------------out1
*  out3----------|3(PA1)    (PA5)6|------------out4
*  RF------------|4(PA3)    (PA0)5|------------out2
*			      ----------------
*/


// FMD-HT



//===========================================================
//===========================================================
// Project: RF-car-touch.prj
// Device: FT60F01X (FT60F011A SOP8)
// Memory: Flash 1KX14b, EEPROM 256X8b, SRAM 64X8b

#include "SYSCFG.h"

#define RF          PA3
#define data_touch  PA2
#define out1        PA5
#define out2        PA1
#define out3        PA0
#define out4        PA4

#define REMOTES_PER_KEY 5




// --- „ €Ì—Â«Ì Å—Ê ò·  «ç (Â„êÌ 1 »«Ì Ì ÃÂ  »ÂÌ‰Âù”«“Ì RAM) ---
volatile unsigned char rx_state = 0;      
volatile unsigned char pulse_counter = 0;  
volatile unsigned char high_counter = 0;   
volatile unsigned char payload_val = 0;    
volatile unsigned char RxBusy = 0;        
volatile unsigned char frame_ready = 0;

// --- „ €Ì—Â«Ì —Ì„Ê  RF ---
volatile unsigned int  conternotRF = 0;
volatile unsigned char Timedown = 0;
volatile unsigned char Data[3], DataM[3], RFData[3];
volatile unsigned char eerom = 0, lastKey = 0, LernRFKey = 0;
volatile unsigned char Count = 0, Buffer = 0, Bit = 0;
volatile unsigned char lastLearnKey = 0;

// --- »Ì ùÂ«Ì ò‰ —·Ì ---
volatile bit O1 = 0, O2 = 0, O3 = 0, O4 = 0;
volatile bit Start = 0, state1 = 0, state2 = 0, state3 = 0, state4 = 0;
volatile bit LernRFblink = 0, LernRF = 0, Frist = 0, Finish = 0, Lock = 0;

// ---  Ê«»⁄ ---
void POWER_INITIAL(void);
void TIMER2_INITIAL(void);
void TIMER0_INITIAL(void);
unsigned char EEPROMread(unsigned char EEAddr);
void EEPROMwrite(unsigned char EEAddr, unsigned char Data);
void DelayUs(unsigned char Time);
void DelayMs(unsigned int Time);
void Check_RF_Match(void);
void Learn_Current_Remote(unsigned char key_num);
void Process_Touch_Payload(void);
void Clear_Key_Remotes(unsigned char key_num);

//===========================================================
// —Ê Ì‰ Êﬁ›Â (”»ò Ê ”—Ì⁄)
//===========================================================
void interrupt ISR(void)
{
    // -----------  «Ì„— ’›— (œÌòÊœ— Å—Ê ò·  «ç ÂÊ· ò) -----------
    if(T0IE && T0IF)					
    {
        TMR0 = 239;					
        T0IF = 0;    
        
        if(LernRF == 1)
        {
            conternotRF++;
            if(conternotRF >= 15000) // Œ—ÊÃ «“ ·—‰ »⁄œ «“  «Ì„ù«Ê 
            {
                conternotRF = 0;
                LernRF = 0;
                LernRFKey = 0;
            }
        }
        
        // --- „«‘Ì‰ Õ«·  œ—Ì«›  Âœ— Ê ÅÌ·Êœ ---
        if(data_touch == 0) // Œÿ LOW «” 
        {
            high_counter = 0;
            if(pulse_counter < 250) pulse_counter++;

            if(rx_state == 1) //  ‘ŒÌ’ ·»Â Å«ÌÌ‰ù—Ê‰œÂ œÌ «Ì ò·Ìœ »⁄œ «“ Âœ—
            {
                rx_state = 2; // Ê—Êœ »Â «‰œ«“ÂùêÌ—Ì ÅÌ·Êœ
                pulse_counter = 1;
            }
        }
        else // Œÿ HIGH «” 
        {
            if(high_counter < 250) high_counter++;

            if(rx_state == 0) // Å«Ì«‰ Å«·” Âœ—
            {
                if(pulse_counter >= 20 && pulse_counter <= 30) // Âœ— 10ms
                {
                    rx_state = 1; // „‰ Ÿ— Êﬁ›Â HIGH
                }
                pulse_counter = 0;
            }
            else if(rx_state == 1)
            {
                if(high_counter > 80) //  «Ì„ù«Ê  Ãœ«ò‰‰œÂ
                {
                    rx_state = 0;
                    pulse_counter = 0;
                }
            }
            else if(rx_state == 2) // Å«Ì«‰ Å«·” LOW ÅÌ·Êœ
            {
                payload_val = pulse_counter; // –ŒÌ—Â œﬁÌﬁ „ﬁœ«— ò·Ìœ
                rx_state = 3;
                pulse_counter = 0;
                high_counter = 1;
            }
            else if(rx_state == 3) // Å«Ì«‰ ›—Ì„ Ê  √ÌÌœ
            {
                if(high_counter >= 15)
                {
                    frame_ready = 1;
                    rx_state = 0;
                }
            }
        }

        // »«“ ò—œ‰ ﬁ›· Œÿ  «ç Å” «“ —Â« ‘œ‰ ò«„·
        if(RxBusy == 1 && data_touch == 1 && high_counter >= 60)
        {
            RxBusy = 0;
        }
    }

    // -----------  «Ì„— œÊ (œÌòÊœ— ”Ìê‰«· —Ì„Ê  RF) -----------
	
    if(TMR2IE && TMR2IF)			
{
    TMR2IF = 0;
    CLRWDT();
    
    if(RF == 0)
    {
        if(Timedown < 250)
        {
            Timedown++;
        }
        Frist = 1;
    }
    else
    {
        // 1. «ê— Å«·” »Ì‘ «“ Õœ ÿÊ·«‰Ì ‘œ (”òÊ  Ì« ‰ÊÌ“ ÿÊ·«‰Ì)° Â„ÂùçÌ“ —« —Ì”  ò‰ Ê Œ«—Ã ‘Ê
        if(Timedown >= 250)
        {
            Timedown = 0;
            Frist = 0;
            Start = 0;
            Bit = 8;
            Buffer = 0;
            Count = 0;
            Finish = 0;
            return;
        }
        
        // 2. Å—œ«“‘ Å«·” „⁄ »— œ—Ì«›  ‘œÂ
        if((Frist == 1) && (Finish == 0))
        {
            // «·›) ¬Ì« Å«·” ‘—Ê⁄ ›—Ì„ (Sync) «” ø
            if(Timedown >= 180 && Timedown <= 245)
            { 
                Start = 1;
                Bit = 8;
                Count = 0;
                Buffer = 0;
            }
            // ») ¬Ì« ﬁ»·« ”‰ò  «ÌÌœ ‘œÂ Ê «ò‰Ê‰ œ— Õ«· œ—Ì«›  »Ì ùÂ«Ì œ«œÂ Â” Ì„ø
            else if(Start == 1)
            {
                Bit--;

                // Å«·” »·‰œ (»Ì  0 „‰ÿﬁÌ)
                if(Timedown >= 14 && Timedown <= 32)
                {
                    Buffer = Buffer << 1;  
                }
                // Å«·” òÊ «Â (»Ì  1 „‰ÿﬁÌ)
                else if(Timedown >= 4 && Timedown <= 13)
                {
                    Buffer = (Buffer << 1) | 1;
                }
                // Œÿ«Ì “„«‰Ì œ— »Ì  -> —Ì”  Ê÷⁄Ì  œÌòÊœ
                else
                {
                    Count = 0;
                    Bit = 8;
                    Buffer = 0;
                    Start = 0;
                }
                
                // Êﬁ Ì ? »Ì  Ìò »«Ì  ò«„· ‘œ
                if(Bit == 0)
                {
                    Bit = 8;
                    Data[Count] = RFData[Count];
                    RFData[Count] = Buffer;
                    Count++;
                    
                    // œ—Ì«›  ò«„· ? »«Ì  (?? »Ì  —Ì„Ê  EV1527)
                    if(Count >= 3)
                    {
                        Count = 0;
                        Start = 0;

                        //  «ÌÌœ «⁄ »«— »« œ—Ì«›  ? ›—Ì„ „ Ê«·Ì Ìò”«‰
                        if(Data[0] == RFData[0] && 
                           Data[1] == RFData[1] && 
                           Data[2] == RFData[2]) 
                        {
                            DataM[0] = RFData[0];
                            DataM[1] = RFData[1];
                            DataM[2] = RFData[2];
                            Finish = 1;
                            Lock = 1;
                        }
                    } 
                    Buffer = 0;
                }
            }

            Frist = 0;
        }

        Timedown = 0;
    }
}

    
}




//===========================================================
// Å«ò ò—œ‰ 5 —Ì„Ê  „—»Êÿ »Â Ìò ò·Ìœ + —Ì”  FIFO Â„«‰ ò·Ìœ
//===========================================================
void Clear_Key_Remotes(unsigned char key_num)
{
    unsigned char i;
    unsigned char addr;

    // Â— ò·Ìœ: 5 —Ì„Ê  ◊ 3 »«Ì  = 15 »«Ì 
    // ò·Ìœ 1: 0..14
    // ò·Ìœ 2: 15..29
    // ò·Ìœ 3: 30..44
    // ò·Ìœ 4: 45..59
    addr = (key_num - 1) * 15;

    for(i = 0; i < 15; i++)
    {
        EEPROMwrite(addr++, 0xFF);
    }

    // FIFO ò·ÌœÂ«: 60  « 63
    EEPROMwrite(59 + key_num, 0);
}

//===========================================================
//  «»⁄ »——”Ì  ÿ«»ﬁ —Ì„Ê  »« EEPROM
//===========================================================
void Check_RF_Match(void)
{
    unsigned char k, r, base_addr;
    
    for(k = 0; k < 4; k++)
    {
        for(r = 0; r < REMOTES_PER_KEY; r++)
        {
            base_addr = (k * REMOTES_PER_KEY * 3) + (r * 3);
            
            if(DataM[0] == EEPROMread(base_addr) &&
               DataM[1] == EEPROMread(base_addr + 1) &&
               DataM[2] == EEPROMread(base_addr + 2))
            {
                if(k == 0) O1 = 1;
                else if(k == 1) O2 = 1;
                else if(k == 2) O3 = 1;
                else if(k == 3) O4 = 1;
                //return;
            }
        }
    }
}

//===========================================================
//  «»⁄ ÂÊ‘„‰œ ·—‰ ò—œ‰ (»——”Ì  ò—«—Ì + Ã«Ìê“Ì‰Ì FIFO)
//===========================================================
void Learn_Current_Remote(unsigned char key_num)
{
    unsigned char r;
    unsigned char k_idx;
    unsigned char base_addr;
    unsigned char fifo_ptr_addr;
    unsigned char current_ptr;
    unsigned char target_addr;

    if((key_num < 1) || (key_num > 4))
        return;

    k_idx = key_num - 1;

    // ?. Ã·ÊêÌ—Ì «“ –ŒÌ—Â —Ì„Ê   ò—«—Ì
    for(r = 0; r < REMOTES_PER_KEY; r++)
    {
        base_addr = (k_idx * REMOTES_PER_KEY * 3) + (r * 3);

        if((DataM[0] == EEPROMread(base_addr)) &&
           (DataM[1] == EEPROMread(base_addr + 1)) &&
           (DataM[2] == EEPROMread(base_addr + 2)))
        {
            return;
        }
    }

    // ?. «‘«—Âùê— FIFO „—»Êÿ »Â ò·Ìœ
    fifo_ptr_addr = 60 + k_idx;
    current_ptr = EEPROMread(fifo_ptr_addr);

    if(current_ptr >= REMOTES_PER_KEY)
        current_ptr = 0;

    target_addr = (k_idx * REMOTES_PER_KEY * 3) + (current_ptr * 3);

    // ?. –ŒÌ—Â —Ì„Ê  œ— EEPROM
    EEPROMwrite(target_addr, DataM[0]);
	EEPROMwrite(target_addr + 1, DataM[1]);
	EEPROMwrite(target_addr + 2, DataM[2]);

    // ?. »Âù—Ê“—”«‰Ì Ê –ŒÌ—Â «‘«—Âùê— FIFO
    current_ptr++;
    if(current_ptr >= REMOTES_PER_KEY)
        current_ptr = 0;

    EEPROMwrite(fifo_ptr_addr, current_ptr);
    
    // ?. ç‘„ò —·Â ÃÂ  «⁄·«„ „Ê›ﬁÌ  Learn
    //if(key_num == 1)
//    {
//        DelayMs(100);
//        out1 = !out1;
//        DelayMs(100);
//        out1 = !out1;
//    }
//    else if(key_num == 2)
//    {
//        DelayMs(100);
//        out2 = !out2;
//        DelayMs(100);
//        out2 = !out2;
//    }
//    else if(key_num == 3)
//    {
//        DelayMs(100);
//        out3 = !out3;
//        DelayMs(100);
//        out3 = !out3;
//    }
//    else if(key_num == 4)
//    {
//        DelayMs(100);
//        out4 = !out4;
//        DelayMs(100);
//        out4 = !out4;
//    }


	// «⁄·«„ „Ê›ﬁÌ  Learn:
    // Œ—ÊÃÌ Â„«‰ ò·Ìœ Ìò »«— „«‰‰œ ›‘—œ‰ Â„«‰ ò·Ìœ ⁄„· „Ìùò‰œ.
    if(key_num == 1) O1 = 1;
    else if(key_num == 2) O2 = 1;
    else if(key_num == 3) O3 = 1;
    else O4 = 1;
    
    
    // Å«Ì«‰ Ê÷⁄Ì  Learn
    // Ì«œêÌ—Ì »« „Ê›ﬁÌ  «‰Ã«„ ‘œ.
    // Å” Learn »⁄œÌ »—«Ì «›“Êœ‰ Ìò —Ì„Ê  ÃœÌœ° Õ«›ŸÂ ﬁ»·Ì —« Å«ò ‰ò‰œ.
    lastLearnKey = 0;

    LernRFKey = 0;
    LernRF = 0;
}

//===========================================================
// Å—œ«“‘ ÅÌ·Êœ œ—Ì«› Ì «“  «ç
//===========================================================
void Process_Touch_Payload(void)
{
    unsigned char val = payload_val;
    payload_val = 0;

    if(RxBusy == 1) return;
    RxBusy = 1;

    // 1. Õ«·  Learn (Å«·” »·‰œ)
    if(val >= 120 && val <= 140)
	{
		if((lastKey >= 1) && (lastKey <= 4))
		{
			// «ê— œÊ»«—Â Learn Â„«‰ ò·Ìœ ¬„œ:
			// ›ﬁÿ Õ«›ŸÂ —« Å«ò ò‰ Ê Ê«—œ Learn ‰‘Ê.
			if(lastLearnKey == lastKey)
			{
				Clear_Key_Remotes(lastKey);

				// Œ—ÊÃ ﬁÿ⁄Ì «“ Learn ›⁄·Ì
				LernRF = 0;
				LernRFKey = 0;

				// ⁄œœ 5 ›ﬁÿ ⁄·«„  ç‘„ò œÊ„ »—«Ì «⁄·«„ Å«òù”«“Ì «” 
				lastLearnKey = 5;

				// ›ﬁÿ «⁄·«„ Å«òù‘œ‰ Õ«›ŸÂ »« Ìò ç‘„ò
				LernRFblink = 1;
			}
			else
			{
				// »«— «Ê· Learn: Ê«—œ Õ«·  Learn ‘Ê
				lastLearnKey = lastKey;
				LernRFblink = 1;
			}
		}
	}
    // 2. ò·Ìœ 1 (ÕœÊœ 5ms)
    else if(val >= 10 && val <= 20 && LernRFKey != 1)
    {
        state1 = !state1;
        eerom = 1;
        out1 = state1;
        lastKey = 1;
    }
    // 3. ò·Ìœ 2 (ÕœÊœ 15ms)
    else if(val >= 30 && val <= 45 && LernRFKey != 2)
    {
        state2 = !state2;
        eerom = 2;
        out2 = state2;
        lastKey = 2;
    }
    // 4. ò·Ìœ 3 (ÕœÊœ 25ms)
    else if(val >= 50 && val <= 70 && LernRFKey != 3)
    {
        state3 = !state3;
        eerom = 3;
        out3 = state3;
        lastKey = 3;
    }
    // 5. ò·Ìœ 4 (ÕœÊœ 35ms)
    else if(val >= 75 && val <= 95 && LernRFKey != 4)
    {
        state4 = !state4;
        eerom = 4;
        out4 = state4;
        lastKey = 4;
    }
}

//===========================================================
//  «»⁄ «’·Ì »—‰«„Â
//===========================================================
void main(void)
{
	
    POWER_INITIAL();
    TIMER2_INITIAL();
    TIMER0_INITIAL();       
    TMR2IE = 1;   

    Finish = 0;
    Start = 0;
	lastLearnKey = 0;
    
    // »«“Ì«»Ì Ê÷⁄Ì  —·ÂùÂ« «“ Õ«›ŸÂ
    state1 = EEPROMread(70);
    state2 = EEPROMread(71);
    state3 = EEPROMread(72);
    state4 = EEPROMread(73);

    out1 = state1;
    out2 = state2;
    out3 = state3;
    out4 = state4;

    while(1)
    {
        CLRWDT();
        
        // Å—œ«“‘  «ç œ—Ì«› Ì
        if(frame_ready == 1)
        {
            frame_ready = 0;
            Process_Touch_Payload();
        }


		// Å—œ«“‘ ›—Ì„ „⁄ »— RF
		if(Lock == 1)
		{
			Lock = 0;

			if(LernRF == 1)
			{
				if((LernRFKey >= 1) && (LernRFKey <= 4))
				{
					Learn_Current_Remote(LernRFKey);
				}
			}
			else
			{
				Check_RF_Match();
			}
		}



        // Å—œ«“‘ ›—„«‰ ò·ÌœÂ«  Ê”ÿ —Ì„Ê 
        if(O1 == 1) { O1 = 0; state1 = !state1; eerom = 1; out1 = state1; lastKey = 1; }
        if(O2 == 1) { O2 = 0; state2 = !state2; eerom = 2; out2 = state2; lastKey = 2; }
        if(O3 == 1) { O3 = 0; state3 = !state3; eerom = 3; out3 = state3; lastKey = 3; }
        if(O4 == 1) { O4 = 0; state4 = !state4; eerom = 4; out4 = state4; lastKey = 4; }

        // –ŒÌ—Â Ê÷⁄Ì  —·ÂùÂ« œ— ’Ê—   €ÌÌ—
        if(eerom != 0)
        {
            if(eerom == 1) EEPROMwrite(70, state1);
            else if(eerom == 2) EEPROMwrite(71, state2);
            else if(eerom == 3) EEPROMwrite(72, state3);
            else if(eerom == 4) EEPROMwrite(73, state4);
            eerom = 0;
        }
       
        // ç‘„ò “œ‰ —·Â ÃÂ  «⁄·«„ Ê—Êœ »Â „Êœ Learn
        if(LernRFblink == 1)
		{
			// Ìò ç‘„ò »—«Ì «⁄·«„ Ê—Êœ »Â Learn Ì« Å«òù‘œ‰ Õ«›ŸÂ
			if(lastKey == 1)
			{
				DelayMs(200);
				out1 = !out1;
				DelayMs(200);
				out1 = !out1;
			}
			else if(lastKey == 2)
			{
				DelayMs(200);
				out2 = !out2;
				DelayMs(200);
				out2 = !out2;
			}
			else if(lastKey == 3)
			{
				DelayMs(200);
				out3 = !out3;
				DelayMs(200);
				out3 = !out3;
			}
			else if(lastKey == 4)
			{
				DelayMs(200);
				out4 = !out4;
				DelayMs(200);
				out4 = !out4;
			}

			LernRFblink = 0;
			conternotRF = 0;

			// „ﬁœ«— 5 Ì⁄‰Ì Å«òù”«“Ì «‰Ã«„ ‘œÂ «” .
			// Ìò »«— œÌê— Â„«‰ ç‘„ò —« «Ã—« ò‰° Ê·Ì Ê«—œ Learn ‰‘Ê.
			if(lastLearnKey == 5)
			{
				lastLearnKey = 0;
				LernRFblink = 1;   // «Ã—«Ì ç‘„ò œÊ„ œ— œÊ— »⁄œÌ while
				LernRFKey = 0;
				LernRF = 0;
			}
			else if(lastLearnKey != 0)
			{
				// Learn ⁄«œÌ: ›ﬁÿ Ìò ç‘„ò Ê Ê—Êœ »Â Learn
				LernRFKey = lastLearnKey;
				LernRF = 1;
			}
			else
			{
				// Å” «“ ç‘„ò œÊ„ Å«òù”«“Ì: Œ«—Ã «“ Learn »„«‰
				LernRFKey = 0;
				LernRF = 0;
			}
		}

    }
}


//===========================================================
//  Ê«»⁄ —«Âù«‰œ«“Ì Ê ”Œ ù«›“«—
//===========================================================
void POWER_INITIAL(void) 
{ 
    OSCCON = 0B01110000; 
    INTCON = 0;
    OPTION = 0B00001000;    
    PORTA = 0B00000100;     
    TRISA = 0B00001100;
    WPUA  = 0B00001100;
    MSCKCON = 0B00000000;   
}

void TIMER2_INITIAL(void) 
{
    T2CON = 0B00000001; 
    TMR2 = 0;               
    PR2 = 50; 
    TMR2IF = 0; 
    TMR2ON = 1; 
    PEIE = 1;
    GIE = 1;
}

void TIMER0_INITIAL(void)  
{
    OPTION = 0B00000110; 
    TMR0 = 239; 
    T0IF = 0;   
    T0IE = 1;   
}

unsigned char EEPROMread(unsigned char EEAddr)
{
    EEADR = EEAddr;    
    RD = 1;
    return EEDAT;
}

void EEPROMwrite(unsigned char EEAddr, unsigned char Data)
{
    GIE = 0;                        
    while(GIE);                     
    EEADR = EEAddr;                 
    EEDAT = Data;                   
    EEIF = 0;
    EECON1 |= 0x34;                 
    WR = 1;                         
    while(WR);                      
    GIE = 1;
}

void DelayUs(unsigned char Time)
{
    unsigned char a;
    for(a = 0; a < Time; a++)
    {
        NOP();
        CLRWDT(); 
    }
}                  

void DelayMs(unsigned int Time)
{
    unsigned int a, b;
    for(a = 0; a < Time; a++)
    {
        for(b = 0; b < 5; b++)
        {
            DelayUs(197);
        }
    }
}
