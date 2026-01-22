#include "__T6963C.h"


unsigned int idata,tmpdata,x;

void EEPROM_AT24C32_Init(void)
{
  I2C1_Init(100000);
   delay_ms(1000);
}

unsigned short Read_RTC(unsigned short rAddr)
{
    unsigned short reslt;

    I2C1_Start();             // issue I2C1 start signal
    I2C1_Wr(0xD0);            // send byte via I2C1  (device address + W)
    I2C1_Wr(rAddr);           // send byte (data address)
    I2C1_Start();             // issue I2C1 signal repeated start
    I2C1_Wr(0xD1);            // send byte (device address + R)
    reslt = I2C1_Rd(0u);      // Read the data (NO acknowledge)
    while (!I2C1_Is_Idle())
      asm nop;                // Wait for the read cycle to finish
    I2C1_Stop();
    Delay_ms(10);
    return Bcd2Dec(reslt);
    delay_ms(10);
}

void Write_RTC(unsigned short wAddr, unsigned short wData) 
{
    I2C1_Start();             // issue I2C1 start signal
    I2C1_Wr(0xD0);            // send byte via I2C1  (command to 24c32)

    I2C1_Wr(wAddr);           // send byte (Low address of EEPROM location)
    I2C1_Wr(Dec2Bcd(wData));           // send data (data to be written)
    I2C1_Stop();
    Delay_ms(10);
}


//--------------- Writes data to AT24C32 EEPROM - single location
void EEPROM_AT24C32_WrByte(unsigned int wAddr, unsigned int wData)
{
    I2C1_Start();             // issue I2C1 start signal
    I2C1_Wr(0xAE);            // send byte via I2C1  (command to 24c32)
    I2C1_Wr(wAddr>>8);           // send byte (High address of EEPROM location)
    I2C1_Wr(wAddr);           // send byte (Low address of EEPROM location)
    I2C1_Wr(wData);           // send data (data to be written)
    I2C1_Stop();
    Delay_ms(10);
}

void EEPROM_AT24C32_WrInt(unsigned int wAddr, unsigned int wData)
 {
    unsigned char temp=0;

    temp = wData>>8;
    EEPROM_AT24C32_WrByte(wAddr, temp);
    temp = wData&0x00FF;
    EEPROM_AT24C32_WrByte(wAddr+1, temp);
    Delay_ms(10);
}

//--------------- Reads data from AT24C32 EEPROM - single location (random)
unsigned int EEPROM_AT24C32_RdByte(unsigned int rAddr)
{
    unsigned short reslt;

    I2C1_Start();             // issue I2C1 start signal
    I2C1_Wr(0xAE);            // send byte via I2C1  (device address + W)
    I2C1_Wr(rAddr>>8);           // send byte (data address)
    I2C1_Wr(rAddr);           // send byte (data address)
    I2C1_Repeated_Start();    // issue I2C1 signal repeated start
    I2C1_Wr(0xAF);            // send byte (device address + R)
    reslt = I2C1_Rd(0u);      // Read the data (NO acknowledge)
    while (!I2C1_Is_Idle())
      asm nop;                // Wait for the read cycle to finish
    I2C1_Stop();
    Delay_ms(10);
    return reslt;
}

//--------------- Reads data from AT24C32 EEPROM - single location (random)
unsigned int EEPROM_AT24C32_RdInt(unsigned int rAddr)
{
    unsigned int reslt;
    unsigned char L_temp=0, H_temp=0;

    H_temp = EEPROM_AT24C32_RdByte(rAddr);
    L_temp = EEPROM_AT24C32_RdByte(rAddr+1);
    reslt = H_temp;
    reslt = ((reslt<<8) & 0xff00);
    reslt += L_temp;
    return reslt;
    delay_ms(10);
}