

void Default_Config(void);
void MCU_Config(void);
void IO_Config(void);
void EEPROM_Config(void);
void LCD_Config(void);
void Interrupt_Init(void);


//========================================== logic based functions ======================================
void  Meter_Or_Picks_Method();
void Inch_Or_Pay_Method();

// 12 INPUTS
#define Signal_A                 RH4_bit
#define Signal_B                 RF1_bit
#define Signal_C                 RA3_bit
#define Signal_D                 RA2_bit
#define Signal_E                 RA1_bit
#define Signal_F                 RA0_bit
#define Signal_G                 RA5_bit
#define Signal_H                 RA4_bit
#define Signal_I                 RC1_bit
#define Signal_J                 RC0_bit
#define Signal_K                 RJ4_bit
#define Signal_L                 RJ5_bit
#define Signal_M                 RJ6_bit
#define Signal_N                 RJ7_bit
#define Signal_O                 RC2_bit
#define Signal_P                 RC5_bit

#define Start                    RE4_bit
#define Stop                     RE5_bit
#define Set                      RE6_bit
#define Reverse                  RE7_bit




// 2 OUTPUTS

#define Buzzer                  LATG4_bit

#define LedR                    LATB3_bit
#define LedG                    LATB2_bit
#define LedB                    LATB1_bit