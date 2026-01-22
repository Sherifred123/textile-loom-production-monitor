#line 1 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/DS3231_AT24C32.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/uses/p18/__t6963c.h"
#line 166 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/uses/p18/__t6963c.h"
void T6963C_Init(unsigned int w, unsigned char h, unsigned char fntW);
void T6963C_WriteData(unsigned char mydata);
void T6963C_WriteCommand(unsigned char mydata);
void T6963C_SetPtr(unsigned int addr, unsigned char t);
void T6963C_WaitReady(void);
void T6963C_Fill(unsigned char mydata, unsigned int start, unsigned int len);
void T6963C_Dot(int x, int y, unsigned char color);
void T6963C_Write_Char(unsigned char c, unsigned char x, unsigned char y, unsigned char mode);
void T6963C_Write_Text(unsigned char *str, unsigned char x, unsigned char y, unsigned char mode);
void T6963C_Line(int px0, int py0, int px1, int py1, unsigned char pcolor);
void T6963C_Rectangle(int x0, int y0, int x1, int y1, unsigned char pcolor);
void T6963C_Box(int x0, int y0, int x1, int y1, unsigned char pcolor);
void T6963C_Circle(int x, int y, long r, unsigned char pcolor);
void T6963C_Image(const char *pic);
void T6963C_Sprite(unsigned char px, unsigned char py, const char *pic, unsigned char sx, unsigned char sy);
void T6963C_Set_Cursor(unsigned char x, unsigned char y);
void T6963C_PartialImage(unsigned int x_left, unsigned int y_top, unsigned int width,
 unsigned int height, code const unsigned short * image);
void T6963C_Rectangle_Round_Edges(unsigned int x_upper_left, unsigned int y_upper_left,
 unsigned int x_bottom_right, unsigned int y_bottom_right,
 unsigned int round_radius, unsigned short color);
void T6963C_Rectangle_Round_Edges_Fill(unsigned int x_upper_left, unsigned int y_upper_left,
 unsigned int x_bottom_right, unsigned int y_bottom_right,
 unsigned int round_radius, unsigned short color);
void T6963C_Circle_Fill(int x_center, int y_center, int radius, unsigned short color);
#line 195 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/uses/p18/__t6963c.h"
extern sfr char T6963C_DataPort;
extern sfr char T6963C_CntlPort;

extern unsigned int T6963C_GrWidth;
extern unsigned int T6963C_GrHeight;
extern unsigned int T6963C_TxtCols;

extern unsigned int T6963C_FontWidth;
extern unsigned int T6963C_GrHomeAddr;
extern unsigned int T6963C_TextHomeAddr;
extern unsigned int T6963C_GrMemSize;
extern unsigned int T6963C_TxtMemSize;

extern sfr sbit T6963C_Cntlwr;
extern sfr sbit T6963C_Cntlrd;
extern sfr sbit T6963C_Cntlcd;
extern sfr sbit T6963C_Cntlrst;

extern unsigned char T6963C_Display;
#line 4 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/DS3231_AT24C32.c"
unsigned int idata,tmpdata,x;

void EEPROM_AT24C32_Init(void)
{
 I2C1_Init(100000);
 delay_ms(1000);
}

unsigned short Read_RTC(unsigned short rAddr)
{
 unsigned short reslt;

 I2C1_Start();
 I2C1_Wr(0xD0);
 I2C1_Wr(rAddr);
 I2C1_Start();
 I2C1_Wr(0xD1);
 reslt = I2C1_Rd(0u);
 while (!I2C1_Is_Idle())
 asm nop;
 I2C1_Stop();
 Delay_ms(10);
 return Bcd2Dec(reslt);
 delay_ms(10);
}

void Write_RTC(unsigned short wAddr, unsigned short wData)
{
 I2C1_Start();
 I2C1_Wr(0xD0);

 I2C1_Wr(wAddr);
 I2C1_Wr(Dec2Bcd(wData));
 I2C1_Stop();
 Delay_ms(10);
}



void EEPROM_AT24C32_WrByte(unsigned int wAddr, unsigned int wData)
{
 I2C1_Start();
 I2C1_Wr(0xAE);
 I2C1_Wr(wAddr>>8);
 I2C1_Wr(wAddr);
 I2C1_Wr(wData);
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


unsigned int EEPROM_AT24C32_RdByte(unsigned int rAddr)
{
 unsigned short reslt;

 I2C1_Start();
 I2C1_Wr(0xAE);
 I2C1_Wr(rAddr>>8);
 I2C1_Wr(rAddr);
 I2C1_Repeated_Start();
 I2C1_Wr(0xAF);
 reslt = I2C1_Rd(0u);
 while (!I2C1_Is_Idle())
 asm nop;
 I2C1_Stop();
 Delay_ms(10);
 return reslt;
}


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
