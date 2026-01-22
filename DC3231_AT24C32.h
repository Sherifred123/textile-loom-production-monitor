void EEPROM_AT24C32_Init(void);
unsigned short Read_RTC(unsigned short rAddr);
void Write_RTC(unsigned short wAddr, unsigned short wData);
void EEPROM_AT24C32_WrByte(unsigned int wAddr, unsigned int wData) ;
void EEPROM_AT24C32_WrInt(unsigned int wAddr, unsigned int wData);
unsigned int EEPROM_AT24C32_RdByte(unsigned int rAddr);
unsigned int EEPROM_AT24C32_RdInt(unsigned int rAddr);