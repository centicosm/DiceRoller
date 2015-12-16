/*
 * File:   DiceRollerMain.c
 * Author: centicosm
 */


#include <xc.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include "DiceRollerConfig.h"

enum DiceType {
    D2 = 0,
    D2D2,
    D4,
    D4D4,
    D6,
    D6D6,
    D8,
    D8D8,
    D10,
    D10D10,
    D12,
    D20,
    DICE_END
};

#define NO_DIE                  10

#define BUTTON_TYPE_BUTTON      0b00000001
#define BUTTON_ROLL_BUTTON      0b00000010


#define LED_A  0b00000001
#define LED_B  0b00000010
#define LED_C  0b00000100
#define LED_D  0b00001000
#define LED_E  0b00010000
#define LED_F  0b10000000
#define LED_G  0b01000000



enum DiceType _CurDiceType;
uint16_t _DebounceCntDiceType;
uint16_t _DebounceRollDice;
uint8_t _LastButtons;
uint8_t _TimeOutCnt = 0;



void Init_System(void) {
    OSCCON |= 0b01110000;
    
    __delay_ms(1000);
    ANSEL = 0x00;
    TRISA = 0x00;
    TRISB = 0x00;

    // the roll button and the switch dice button are inputs
    TRISAbits.TRISA5 = 1;
    TRISBbits.TRISB5 = 1;
    OPTION_REG &= 0b01111111;
    
    _CurDiceType = D6;
    
    // set up the timers for doing the random numbers
    T2CON = 0x00;
    T2CONbits.TMR2ON = 1;
    OPTION_REGbits.T0CS = 0;
    
    // and a timer for debouncing and screen deactivation
    T1CON = 0b00000001;  // Timer 1 is based on system clock and enabled
    PIR1bits.TMR1IF = 0;
    _DebounceCntDiceType = 0;
    _LastButtons = 0x00;
    
    uint16_t timer;
    timer = TMR1;
    srand((unsigned)timer);         
    
}


void Set_Led1(uint8_t val) {

    uint8_t outPort;
    switch (val) {

        case 0:
            outPort = (LED_A | LED_B | LED_C | LED_D | LED_E | LED_F);
            break;

        case 1:
            outPort = (LED_B | LED_C);
            break;

        case 2:
            outPort = (LED_A | LED_B | LED_G | LED_D | LED_E);
            break;

        case 3:
            outPort = (LED_A | LED_B | LED_C | LED_D | LED_G);
            break;

        case 4:
            outPort = (LED_F | LED_G | LED_B | LED_C);
            break;

        case 5:
            outPort = (LED_A | LED_F | LED_G | LED_C | LED_D);
            break;

        case 6:
            outPort = (LED_A | LED_C | LED_D | LED_E | LED_F | LED_G);
            break;

        case 7:
            outPort = (LED_A | LED_B | LED_C);
            break;

        case 8:
            outPort = (LED_A | LED_B | LED_C | LED_D | LED_E | LED_F | LED_G);
            break;

        case 9:
            outPort = (LED_A | LED_B | LED_C | LED_D | LED_F | LED_G);
            break;


        default:
            outPort = 0x00;
    }

    outPort = ~outPort;
    PORTA = outPort;
}

void Set_Led2(uint8_t val) {

    uint8_t outPort;
    switch (val) {

        case 0:
            outPort = (LED_A | LED_B | LED_C | LED_D | LED_E | LED_F);
            break;

        case 1:
            outPort = (LED_B | LED_C);
            break;

        case 2:
            outPort = (LED_A | LED_B | LED_G | LED_D | LED_E);
            break;

        case 3:
            outPort = (LED_A | LED_B | LED_C | LED_D | LED_G);
            break;

        case 4:
            outPort = (LED_F | LED_G | LED_B | LED_C);
            break;

        case 5:
            outPort = (LED_A | LED_F | LED_G | LED_C | LED_D);
            break;

        case 6:
            outPort = (LED_A | LED_C | LED_D | LED_E | LED_F | LED_G);
            break;

        case 7:
            outPort = (LED_A | LED_B | LED_C);
            break;

        case 8:
            outPort = (LED_A | LED_B | LED_C | LED_D | LED_E | LED_F | LED_G);
            break;

        case 9:
            outPort = (LED_A | LED_B | LED_C | LED_D | LED_F | LED_G);
            break;


        default:
            outPort = 0x00;
    }

    outPort = ~outPort;
    PORTB = outPort;
}

void Display_DiceType(void) {
    switch (_CurDiceType) {

        case D2:
            Set_Led2(2);
            Set_Led1(NO_DIE);
            break;

        case D2D2:
            Set_Led2(2);
            Set_Led1(2);
            break;

        case D4:
            Set_Led2(4);
            Set_Led1(NO_DIE);
            break;

        case D4D4:
            Set_Led2(4);
            Set_Led1(4);
            break;

        case D6:
            Set_Led2(6);
            Set_Led1(NO_DIE);
            break;

        case D6D6:
            Set_Led2(6);
            Set_Led1(6);
            break;

        case D8:
            Set_Led2(8);
            Set_Led1(NO_DIE);
            break;

        case D8D8:
            Set_Led2(8);
            Set_Led1(8);
            break;

        case D10:
            Set_Led2(0);
            Set_Led1(1);
            break;

        case D10D10:
            Set_Led2(9);
            Set_Led1(9);
            break;

        case D12:
            Set_Led2(2);
            Set_Led1(1);
            break;

        case D20:
            Set_Led2(0);
            Set_Led1(2);
            break;

        default:
            Set_Led1(NO_DIE);
            Set_Led2(NO_DIE);
            break;
    }
}

void Increment_DiceType(void) {
    ++_CurDiceType;
    if (_CurDiceType == DICE_END) {
        _CurDiceType = 0;
    }
    Display_DiceType();
    _TimeOutCnt = 0;
}


void Get_Dice1(uint8_t val) {
    
    uint8_t roll = rand() % val;
    Set_Led1(roll + 1);
}


void Get_Dice2(uint8_t val) {
    
    uint8_t roll = rand() % val;
    ++roll;
      
    uint8_t tens = 0;
    while(roll >= 10) {
        ++tens;
        roll -= 10;
    }
    
    if (tens == 10) {
        Set_Led2(0);
        Set_Led1(0);    
    }
    else {
        if (tens > 0) {
            Set_Led1(tens);
        }
        else {
            Set_Led1(10);
        }
        Set_Led2(roll);    
    }
    
}


void Roll_Dice(void) {
    switch (_CurDiceType) {

        case D2:
            Get_Dice2(2);
            Set_Led1(NO_DIE);
            break;

        case D2D2:
            Get_Dice2(2);
            Get_Dice1(2);
            break;

        case D4:
            Get_Dice2(4);
            Set_Led1(NO_DIE);
            break;

        case D4D4:
            Get_Dice2(4);
            Get_Dice1(4);
            break;

        case D6:
            Get_Dice2(6);
            Set_Led1(NO_DIE);
            break;

        case D6D6:
            Get_Dice2(6);
            Get_Dice1(6);
            break;

        case D8:
            Get_Dice2(8);
            Set_Led1(NO_DIE);
            break;

        case D8D8:
            Get_Dice2(8);
            Get_Dice1(8);
            break;

        case D10:
            Get_Dice2(10);
            break;

        case D10D10:
            Get_Dice2(100);
            break;

        case D12:
            Get_Dice2(12);
            break;

        case D20:
            Get_Dice2(20);
            break;

        default:
            Set_Led1(NO_DIE);
            Set_Led2(NO_DIE);
            break;
    }
    
    _TimeOutCnt = 0;
}


void Handle_Buttons(void) {
    
    uint8_t but = 0x00;
    
    // turn off the display after around 10 sec
    if (PIR1bits.TMR1IF == 0x01) {
        PIR1bits.TMR1IF = 0;
        if (_TimeOutCnt < 254) {
            _TimeOutCnt++;
            if (_TimeOutCnt >= 254) {
                Set_Led1(NO_DIE);
                Set_Led2(NO_DIE); 
            }            
        }
    }
    
    //  The change dice type button was pressed
    if (!PORTBbits.RB5) {
        if (0 == (_LastButtons & BUTTON_TYPE_BUTTON)) {
            _DebounceCntDiceType++;
            if (_DebounceCntDiceType == 1200) {
                _LastButtons |= BUTTON_TYPE_BUTTON;
                Increment_DiceType();
                uint16_t timer;
                timer = TMR1;
                srand((unsigned)timer); 
            }
        }
    }
    else {
        _DebounceCntDiceType = 0;
        _LastButtons &= ~BUTTON_TYPE_BUTTON;
    }
     
    // the roll dice button was pressed
    if (PORTAbits.RA5) { 
        if (0 == (_LastButtons & BUTTON_ROLL_BUTTON)) {
            _DebounceRollDice++;
            if (_DebounceRollDice == 1200) {
                _LastButtons |= BUTTON_ROLL_BUTTON;    
                _DebounceRollDice = 0;
            }
        }
        else {
            Roll_Dice();
        }
    }
    else {
        if (_LastButtons & BUTTON_ROLL_BUTTON) {
            _DebounceRollDice++;
            if (_DebounceRollDice == 1200) {
                _LastButtons &= ~BUTTON_ROLL_BUTTON;
                Roll_Dice();
                _DebounceRollDice = 0;
            }
        }
        else {
            _DebounceRollDice = 0;
        }
    }
}


void main(void) {

    Init_System();
    
    Display_DiceType();

    while (1) {
        Handle_Buttons();
    }

}
