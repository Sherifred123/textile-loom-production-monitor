#line 1 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/EEPROM_Data.c"
#line 1 "e:/embedded file/project files/office project/new/nk automation/micro brain v.2.0/version/micro_brain_v32_till 30 ok now need to change pick in to long type/eeprom_data.h"
#line 114 "e:/embedded file/project files/office project/new/nk automation/micro brain v.2.0/version/micro_brain_v32_till 30 ok now need to change pick in to long type/eeprom_data.h"
void LOAD_EEPROM_Param(void);
void FirstTime_EEPROM_Param(void);
void Update_EEPROM_PwrFail(unsigned char Type);
void ModeChange_EEPROM_update(void);
void EEPROM_Write_int(unsigned int Addr,unsigned int Data);
unsigned int EEPROM_Read_int(unsigned int Addr);
void EEPROM_Write_long(unsigned int Addr,unsigned long Data);
unsigned long EEPROM_Read_long(unsigned int Addr);

void EEPORM_Write_Float(int Addr, float Value);
float EEPORM_Read_Float(int Addr);


void load_data(void);
void load_Picks4inch(void);
void load_Pulse_Pick(void);

void load_inch(void);
void load_inch_External(void);
void Save_shiftwise(void);
void Save_shiftwise_External(void);
void Save_shiftwise_Date_time_External(void);
#line 1 "e:/embedded file/project files/office project/new/nk automation/micro brain v.2.0/version/micro_brain_v32_till 30 ok now need to change pick in to long type/control_fn.h"
void LCD_Refresh(void);

void Menulist(void);

void Beam_Setting(void);
void Beam_Loom_Shift(void);

void Select_Loom_Total_Beam_per_loom(void);
void Total_Beam_per_loom(void);

void Total_Beam_Per_Shift(void);

void UserColourSetting(void);
void Reset_color_Setting(void);

void Pick_Set_All(void);
void Pick_Set_One_one(void);

void Reset_To_Next_Shift(void);
void Reset_All_Loom(void);
void Reset_Loom_One_one(void);
void Reset_Shift_One_one(void);

void Shift_Jump(void);
void Loom_Starting_No(void);

void Display_Setting(void);
void Factory_Reset(void);



void Display_variable_Update_Left_Pulse_picks(void);
void Display_variable_Update_Right_Pulse_picks(void);
void Display_variable_Update_Left_Inches(void);
void Display_variable_Update_Right_Inches(void);



void Left_Side_Meter_Update();
void Left_Side_Meter_PAY_Update();
void Right_Side_Meter_Update();
void Right_Side_Meter_PAY_Update();


void Left_Side_Pick_Update();
void Left_Side_Pick_Pay_Update();
void Right_Side_Pick_Update();
void Right_Side_Pick_Pay_Update();



void Variable_Reset(void);

void Next_cyle(void);


void Set_Date_Time_Rtc(void);
void Read_Date_Time_Rtc(void);

void Read_Shift_Date_Time(unsigned char Shift_no);
void FloatToStr_SingleDecimal(float num, char *str);
void IntToDecimalStr(long value, unsigned char decimals, char *str);
void MulFloat_To1DecimalStr(float A, float B, char *out);



void Increment_Decerement(unsigned char *var,unsigned char limit,unsigned char Pos_x,unsigned char Pos_y);
void Increment_Decerement_Char(unsigned char *var,unsigned char limit,unsigned char Pos_x,unsigned char Pos_y);

void Increment_Decerement_Float(float *var, float limit,unsigned char Pos_x,unsigned char Pos_y);



void Glcd_Buffer_Clear();


void Glcd_Out_ROM(const char *text, unsigned short X_pixel, unsigned short Y_pixel);


void GLCD_Print_Int_With_LeadingZero(unsigned short value,unsigned short x,unsigned short y);

unsigned char GLCD_CharWidth(unsigned char ch);


void T6963C_Write_Text_Adv_ROM(const code char *text,
 unsigned char x,
 unsigned char y);


void Loading_Fill(unsigned char percent);

void Verify_EEPROM_Data_Clear(void);
#line 1 "e:/embedded file/project files/office project/new/nk automation/micro brain v.2.0/version/micro_brain_v32_till 30 ok now need to change pick in to long type/setup.h"


void Default_Config(void);
void MCU_Config(void);
void IO_Config(void);
void EEPROM_Config(void);
void LCD_Config(void);
void Interrupt_Init(void);



void Meter_Or_Picks_Method();
void Inch_Or_Pay_Method();
#line 1 "e:/embedded file/project files/office project/new/nk automation/micro brain v.2.0/version/micro_brain_v32_till 30 ok now need to change pick in to long type/dc3231_at24c32.h"
void EEPROM_AT24C32_Init(void);
unsigned short Read_RTC(unsigned short rAddr);
void Write_RTC(unsigned short wAddr, unsigned short wData);
void EEPROM_AT24C32_WrByte(unsigned int wAddr, unsigned int wData) ;
void EEPROM_AT24C32_WrInt(unsigned int wAddr, unsigned int wData);
unsigned int EEPROM_AT24C32_RdByte(unsigned int rAddr);
unsigned int EEPROM_AT24C32_RdInt(unsigned int rAddr);
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
#line 13 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/EEPROM_Data.c"
extern unsigned int Picks4inchA,Picks4inchB,Picks4inchC,Picks4inchD,Picks4inchE,Picks4inchF,Picks4inchG;
extern unsigned int Picks4inchH,Picks4inchI,Picks4inchJ,Picks4inchK,Picks4inchL,Picks4inchM,Picks4inchN;
extern unsigned int Picks4inchO,Picks4inchP;

extern unsigned int Pulse_PickA,Pulse_PickB,Pulse_PickC,Pulse_PickD,Pulse_PickE,Pulse_PickF,Pulse_PickG;
extern unsigned int Pulse_PickH,Pulse_PickI,Pulse_PickJ,Pulse_PickK,Pulse_PickL,Pulse_PickM,Pulse_PickN;
extern unsigned int Pulse_PickO,Pulse_PickP;

extern float inchA,inchB,inchC,inchD,inchE,inchF,inchG,inchH,inchI,inchJ,inchK,inchL,inchM,inchN,inchO,inchP;


extern float Inch[17];
extern unsigned int Picks4inch[17];


extern unsigned long Beam_inchA,Beam_inchB,Beam_inchC,Beam_inchD,Beam_inchE,Beam_inchF,Beam_inchG;
extern unsigned long Beam_inchH,Beam_inchI,Beam_inchJ,Beam_inchK,Beam_inchL,Beam_inchM,Beam_inchN;
extern unsigned long Beam_inchO,Beam_inchP;

extern unsigned int Disp_inch,Disp_Pulse_Pick,Disp_Picks4inch;
extern unsigned long Disp_Beam;

extern unsigned char Shift_value;
extern unsigned char Loom_value;
extern unsigned char Loom_Starting_value;



extern unsigned char cposx, cposy;

extern bit lcd_update;
extern float production,Beam_production;

extern unsigned rx char MODE;

extern unsigned char Hour,Min,Sec,Date,Month,Year;


extern char Text[16];

extern bit RST_BIT;


 bit Meter_Or_Picks_Sel;
 bit Inch_Or_Pay_Sel;

extern float Pay_Value;

extern unsigned int i=0;
extern float Value_float=0;


 bit CHECK_BIT;


void LOAD_EEPROM_Param(void)
{
 unsigned int temp=0,i;
 unsigned int temp16=0;

 temp = EEPROM_Read( 0x0F );
#line 113 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/EEPROM_Data.c"
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 if(temp != 0x88)
 {
 FirstTime_EEPROM_Param();
 }
 else
 {


 while(  RE6_bit  == 1 );
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("FACTORY",92,48);
 T6963C_Write_Text_Adv_ROM("SETTINGS",88,64);
 delay_ms(1500);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("MICRO BRAIN GLCD",56,40);
 T6963C_Write_Text_Adv_ROM("REVISED UPDATED",60,56);
 T6963C_Write_Text_Adv_ROM("VERSION 1.1_2026_JAN",40,72);
 T6963C_Write_Text_Adv_ROM("LOADING...",80,88);
 delay_ms(4000);



 }
 load_data();
 delay_ms(1000);
#line 167 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/EEPROM_Data.c"
 }




void FirstTime_EEPROM_Param(void)
{
 unsigned int temp=0,i=0;
 unsigned int Colour_Addr;
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 EEPROM_Write( 0x0F , 0x88);
 delay_ms(30);

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("FIRST TIME",80,56);
 delay_ms(2000);


 PEIE_bit = 0;
 GIE_bit = 0;



 T6963C_rectangle(80,104, 160, 90 ,  0b1000 );


 asm CLRWDT;

 Loading_Fill(1);
 EEPROM_Write( 0X08 ,0);
 delay_ms(5);
 Loading_Fill(2);
 EEPROM_Write( 0X09 ,0);
 delay_ms(5);

 for(i=0;i<16;i++)
 {

 Loading_Fill(i+3);
 EEPROM_Write(( 0x10 +i),(1*(i+1)));
 delay_ms(5);
 }
 asm CLRWDT;

 for(i=0;i<16;i++)
 {
 Loading_Fill(1+19);
 EEPROM_Write(( 0x3A0 +i),0);
 delay_ms(5);
 }
 asm CLRWDT;

 for(i=0;i<96;i++)
 {
 Loading_Fill(35+ ( (i*15) /95) ) ;
 EEPROM_AT24C32_WrInt(( 0X10 +(2*i)),0);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0XD0 +(2*i)),0);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X190 +(2*i)),0);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X250 +(2*i)),0);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X310 +(2*i)),0);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X3D0 +(2*i)),0);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X490 +(2*i)),0);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X550 +(2*i)),0);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X610 +(2*i)),0);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X6D0 +(2*i)),0);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X790 +(2*i)),0);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X850 +(2*i)),0);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X910 +(2*i)),0);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X9D0 +(2*i)),0);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0XA90 +(2*i)),0);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0XB50 +(2*i)),0);
 delay_ms(5);
 }
 Loading_Fill(50);

 asm CLRWDT;
 for(i=0;i<480;i++)
 {
 EEPROM_AT24C32_WrByte(( 0XD00 )+i,0);
 delay_ms(5);
 if(i >= 446)
 {
 Loading_Fill(50+ (i-446) );
 }
 }
 Loading_Fill(84);
 asm CLRWDT;
 EEPROM_Write_int(( 0X20 ),0);
 Loading_Fill(85);
 delay_ms(5);
 EEPROM_Write_int(( 0X22 ),0);
 Loading_Fill(86);
 delay_ms(5);
 EEPROM_Write_int(( 0x24 ),0);
 Loading_Fill(87);
 delay_ms(5);
 EEPROM_Write_int(( 0X26 ),0);
 Loading_Fill(88);
 delay_ms(5);
 EEPROM_Write_int(( 0X28 ),0);
 Loading_Fill(89);
 delay_ms(5);
 EEPROM_Write_int(( 0X2A ),0);
 Loading_Fill(90);
 delay_ms(5);
 EEPROM_Write_int(( 0X2C ),0);
 Loading_Fill(91);
 delay_ms(5);
 EEPROM_Write_int(( 0X2E ),0);
 Loading_Fill(92);
 delay_ms(5);
 EEPROM_Write_int(( 0X30 ),0);
 Loading_Fill(93);
 delay_ms(5);
 EEPROM_Write_int(( 0X32 ),0);
 Loading_Fill(94);
 delay_ms(5);
 EEPROM_Write_int(( 0X34 ),0);
 Loading_Fill(95);
 delay_ms(5);
 EEPROM_Write_int(( 0X36 ),0);
 Loading_Fill(96);
 delay_ms(5);
 EEPROM_Write_int(( 0X38 ),0);
 Loading_Fill(97);
 delay_ms(5);
 EEPROM_Write_int(( 0X3A ),0);
 Loading_Fill(98);
 delay_ms(5);
 EEPROM_Write_int(( 0X3C ),0);
 Loading_Fill(99);
 delay_ms(5);
 EEPROM_Write_int(( 0X3E ),0);
 delay_ms(5);
 EEPROM_Write(( 0X40 ),1);
 delay_ms(5);


 EEPROM_Write ( ( 0X41 ),0);
 delay_ms(5);
 EEPROM_Write ( ( 0X42 ) ,0);
 delay_ms(5);
 EEPORM_Write_Float( ( 0X43 ) ,0.0 );
 delay_ms(5);


 Loading_Fill(100);


 delay_ms(1000);


 PEIE_bit = 1;
 GIE_bit = 1;


 asm CLRWDT;
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("LOADING COMPLETED",52,60);
 delay_ms(3000);
 Set_Date_Time_Rtc();
 asm CLRWDT;
 Loom_Starting_No();
#line 368 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/EEPROM_Data.c"
}

void ModeChange_EEPROM_update(void)
{
 unsigned short temp=0;
 unsigned int temp16=0;
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("NK",108,48);
 T6963C_Write_Text_Adv_ROM("AUTOMATION",80,64);
 delay_ms(1000);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("Factory",88,48);
 T6963C_Write_Text_Adv_ROM("Setting",88,64);
 delay_ms(1000);


}

void Update_EEPROM_PwrFail(unsigned char Type)
{
 unsigned int temp;
 unsigned int temp16;
 GIE_bit = 0;
 PEIE_bit = 0;


 EEPROM_Write( 0X08 ,Shift_value);
 delay_ms(5);

 Save_shiftwise();

 EEPROM_Write( 0x3A0 ,Pulse_PickA);
 delay_ms(5);
 EEPROM_Write( 0x3A1 ,Pulse_PickB);
 delay_ms(5);
 EEPROM_Write( 0x3A2 ,Pulse_PickC);
 delay_ms(5);
 EEPROM_Write( 0x3A3 ,Pulse_PickD);
 delay_ms(5);
 EEPROM_Write( 0x3A4 ,Pulse_PickE);
 delay_ms(5);
 EEPROM_Write( 0x3A5 ,Pulse_PickF);
 delay_ms(5);
 EEPROM_Write( 0x3A6 ,Pulse_PickG);
 delay_ms(5);
 EEPROM_Write( 0x3A7 ,Pulse_PickH);
 delay_ms(100);


 EEPROM_Write( 0x3A8 ,Pulse_PickI);
 delay_ms(5);
 EEPROM_Write( 0x3A9 ,Pulse_PickJ);
 delay_ms(5);
 EEPROM_Write( 0x3AA ,Pulse_PickK);
 delay_ms(5);
 EEPROM_Write( 0x3AB ,Pulse_PickL);
 delay_ms(5);
 EEPROM_Write( 0x3AC ,Pulse_PickM);
 delay_ms(5);
 EEPROM_Write( 0x3AD ,Pulse_PickN);
 delay_ms(5);
 EEPROM_Write( 0x3AE ,Pulse_PickO);
 delay_ms(5);
 EEPROM_Write( 0x3AF ,Pulse_PickP);
 delay_ms(5);


 if(Type==0)
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("THANKING YOU",72,60);
 delay_ms(5000);


 SWDTEN_bit = 1;


 RI_bit=0;
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 while(1)
 {


 T6963C_Write_Text_Adv_ROM("PLEASE OFF MCB",64,60);

 }

 }
 else if(Type==1)
 {
 GIE_bit = 1;
 PEIE_bit = 1;
 return;
 }
}

void load_data(void)
{
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;


 T6963C_rectangle(80,104, 160, 90 ,  0b1000 );
 T6963C_Write_Text_Adv_ROM("UPDATING ALL",80,40);
 T6963C_Write_Text_Adv_ROM("LOOM  DATAS",80,56);

 Loading_Fill(2);
 Shift_value=EEPROM_Read( 0X08 );
 delay_ms(5);

 Loading_Fill(4);
 MODE = EEPROM_Read( 0X09 );
 delay_ms(5);

 Loading_Fill(6);
 Picks4inchA = EEPROM_Read( 0x10 );
 delay_ms(5);

 Loading_Fill(8);
 inchA = EEPROM_Read_int(( 0X20 ));
 delay_ms(5);

 Loading_Fill(10);
 Pulse_PickA = EEPROM_Read( 0x3A0 );
 delay_ms(5);
 Loading_Fill(12);
 Picks4inchB = EEPROM_Read( 0x11 );
 delay_ms(5);

 Loading_Fill(14);
 inchB = EEPROM_Read_int(( 0X22 ));
 delay_ms(5);

 Loading_Fill(16);
 Pulse_PickB = EEPROM_Read( 0x3A1 );
 delay_ms(5);

 Loading_Fill(18);
 Picks4inchC = EEPROM_Read( 0x12 );
 delay_ms(5);

 Loading_Fill(20);
 inchC = EEPROM_Read_int(( 0x24 ));
 delay_ms(5);

 Loading_Fill(22);
 Pulse_PickC = EEPROM_Read( 0x3A2 );
 delay_ms(5);

 Loading_Fill(24);
 Picks4inchD = EEPROM_Read( 0x13 );
 delay_ms(5);

 Loading_Fill(26);
 inchD = EEPROM_Read_int(( 0X26 ));
 delay_ms(5);

 Loading_Fill(28);
 Pulse_PickD = EEPROM_Read( 0x3A3 );
 delay_ms(5);

 Loading_Fill(30);
 Picks4inchE = EEPROM_Read( 0x14 );
 delay_ms(30);

 Loading_Fill(32);
 inchE = EEPROM_Read_int(( 0X28 ));
 delay_ms(30);

 Loading_Fill(34);
 Pulse_PickE = EEPROM_Read( 0x3A4 );
 delay_ms(30);

 Loading_Fill(36);
 Picks4inchF = EEPROM_Read( 0x15 );
 delay_ms(30);

 Loading_Fill(38);
 inchF = EEPROM_Read_int(( 0X2A ));
 delay_ms(30);

 Loading_Fill(40);
 Pulse_PickF = EEPROM_Read( 0x3A5 );
 delay_ms(30);

 Loading_Fill(42);
 Picks4inchG = EEPROM_Read( 0x16 );
 delay_ms(30);

 Loading_Fill(44);
 inchG = EEPROM_Read_int(( 0X2C ));
 delay_ms(30);

 Loading_Fill(46);
 Pulse_PickG = EEPROM_Read( 0x3A6 );
 delay_ms(30);

 Loading_Fill(48);
 Picks4inchH = EEPROM_Read( 0x17 );
 delay_ms(30);

 Loading_Fill(50);
 inchH = EEPROM_Read_int(( 0X2E ));
 delay_ms(30);

 Loading_Fill(52);
 Pulse_PickH = EEPROM_Read( 0x3A7 );
 delay_ms(30);

 Loading_Fill(54);
 Picks4inchI = EEPROM_Read( 0x18 );
 delay_ms(30);
 Loading_Fill(56);
 inchI = EEPROM_Read_int(( 0X30 ));
 delay_ms(30);

 Loading_Fill(58);
 Pulse_PickI = EEPROM_Read( 0x3A8 );
 delay_ms(30);

 Loading_Fill(60);
 Picks4inchJ = EEPROM_Read( 0x19 );
 delay_ms(30);

 Loading_Fill(62);
 inchJ = EEPROM_Read_int(( 0X32 ));
 delay_ms(30);

 Loading_Fill(64);
 Pulse_PickJ = EEPROM_Read( 0x3A9 );
 delay_ms(30);

 Loading_Fill(66);
 Picks4inchK = EEPROM_Read( 0x1A );
 delay_ms(30);

 Loading_Fill(68);
 inchK = EEPROM_Read_int(( 0X34 ));
 delay_ms(30);

 Loading_Fill(70);
 Pulse_PickK = EEPROM_Read( 0x3AA );
 delay_ms(30);

 Loading_Fill(72);
 Picks4inchL = EEPROM_Read( 0x1B );
 delay_ms(30);

 Loading_Fill(74);
 inchL = EEPROM_Read_int(( 0X36 ));
 delay_ms(30);

 Loading_Fill(76);
 Pulse_PickL = EEPROM_Read( 0x3AB );
 delay_ms(30);

 Loading_Fill(78);
 Picks4inchM = EEPROM_Read( 0x1C );
 delay_ms(30);

 Loading_Fill(80);
 inchM = EEPROM_Read_int(( 0X38 ));
 delay_ms(30);

 Loading_Fill(82);
 Pulse_PickM = EEPROM_Read( 0x3AC );
 delay_ms(30);

 Loading_Fill(84);
 Picks4inchN = EEPROM_Read( 0x1D );
 delay_ms(30);

 Loading_Fill(86);
 inchN = EEPROM_Read_int(( 0X3A ));
 delay_ms(30);

 Loading_Fill(88);
 Pulse_PickN = EEPROM_Read( 0x3AD );
 delay_ms(30);

 Loading_Fill(90);
 Picks4inchO = EEPROM_Read( 0x1E );
 delay_ms(30);

 Loading_Fill(92);
 inchO = EEPROM_Read_int(( 0X3C ));
 delay_ms(30);

 Loading_Fill(94);
 Pulse_PickO = EEPROM_Read( 0x3AE );
 delay_ms(30);

 Loading_Fill(96);
 Picks4inchP = EEPROM_Read( 0x1F );
 delay_ms(30);

 Loading_Fill(98);
 inchP = EEPROM_Read_int(( 0X3E ));
 delay_ms(30);
 Pulse_PickP = EEPROM_Read( 0x3AF );
 delay_ms(30);

 Loom_Starting_value=EEPROM_Read( 0X40 );
 delay_ms(30);


 Meter_Or_Picks_Sel=EEPROM_Read ( 0X41 );
 delay_ms(30);
 Inch_Or_Pay_Sel=EEPROM_Read ( 0X42 );
 delay_ms(30);

 Pay_Value = EEPORM_Read_Float( 0X43 );
 delay_ms(30);

 Loading_Fill(100);
#line 709 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/EEPROM_Data.c"
}
void load_Picks4inch(void)
{
 Picks4inchA = EEPROM_Read( 0x10 );
 delay_ms(5);
 Picks4inchB = EEPROM_Read( 0x11 );
 delay_ms(5);
 Picks4inchC = EEPROM_Read( 0x12 );
 delay_ms(5);
 Picks4inchD = EEPROM_Read( 0x13 );
 delay_ms(5);
 Picks4inchE = EEPROM_Read( 0x14 );
 delay_ms(5);
 Picks4inchF = EEPROM_Read( 0x15 );
 delay_ms(5);
 Picks4inchG = EEPROM_Read( 0x16 );
 delay_ms(5);
 Picks4inchH = EEPROM_Read( 0x17 );
 delay_ms(5);
 Picks4inchI = EEPROM_Read( 0x18 );
 delay_ms(5);
 Picks4inchJ = EEPROM_Read( 0x19 );
 delay_ms(5);
 Picks4inchK = EEPROM_Read( 0x1A );
 delay_ms(5);
 Picks4inchL = EEPROM_Read( 0x1B );
 delay_ms(5);
 Picks4inchM = EEPROM_Read( 0x1C );
 delay_ms(5);
 Picks4inchN = EEPROM_Read( 0x1D );
 delay_ms(5);
 Picks4inchO = EEPROM_Read( 0x1E );
 delay_ms(5);
 Picks4inchP = EEPROM_Read( 0x1F );
 delay_ms(5);

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("UPDATING PICKS",70,48);
 T6963C_Write_Text_Adv_ROM("FOR INCH",86,64);
 delay_ms(2500);
}
void load_inch(void)
{
 inchA = EEPROM_Read_int( 0X20 );
 delay_ms(5);
 inchB = EEPROM_Read_int( 0X22 );
 delay_ms(5);
 inchC = EEPROM_Read_int( 0x24 );
 delay_ms(5);
 inchD = EEPROM_Read_int( 0X26 );
 delay_ms(5);
 inchE = EEPROM_Read_int( 0X28 );
 delay_ms(5);
 inchF = EEPROM_Read_int( 0X2A );
 delay_ms(5);
 inchG = EEPROM_Read_int( 0X2C );
 delay_ms(5);
 inchH = EEPROM_Read_int( 0X2E );
 delay_ms(5);
 inchI = EEPROM_Read_int( 0X30 );
 delay_ms(5);
 inchJ = EEPROM_Read_int( 0X32 );
 delay_ms(5);
 inchK = EEPROM_Read_int( 0X34 );
 delay_ms(5);
 inchL = EEPROM_Read_int( 0X36 );
 delay_ms(5);
 inchM = EEPROM_Read_int( 0X38 );
 delay_ms(5);
 inchN = EEPROM_Read_int( 0X3A );
 delay_ms(5);
 inchO = EEPROM_Read_int( 0X3C );
 delay_ms(5);
 inchP = EEPROM_Read_int( 0X3E );
 delay_ms(5);

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("UPDATING METER",80,48);
 T6963C_Write_Text_Adv_ROM("FOR LOOMS",96,64);
 delay_ms(2500);
}
void load_Pulse_Pick(void)
{
 Pulse_PickA = EEPROM_Read( 0x3A0 );
 delay_ms(5);
 Pulse_PickB = EEPROM_Read( 0x3A1 );
 delay_ms(5);
 Pulse_PickC = EEPROM_Read( 0x3A2 );
 delay_ms(5);
 Pulse_PickD = EEPROM_Read( 0x3A3 );
 delay_ms(5);
 Pulse_PickE = EEPROM_Read( 0x3A4 );
 delay_ms(5);
 Pulse_PickF = EEPROM_Read( 0x3A5 );
 delay_ms(5);
 Pulse_PickG = EEPROM_Read( 0x3A6 );
 delay_ms(5);
 Pulse_PickH = EEPROM_Read( 0x3A7 );
 delay_ms(5);
 Pulse_PickI = EEPROM_Read( 0x3A8 );
 delay_ms(5);
 Pulse_PickJ = EEPROM_Read( 0x3A9 );
 delay_ms(5);
 Pulse_PickK = EEPROM_Read( 0x3AA );
 delay_ms(5);
 Pulse_PickL = EEPROM_Read( 0x3AB );
 delay_ms(5);
 Pulse_PickM = EEPROM_Read( 0x3AC );
 delay_ms(5);
 Pulse_PickN = EEPROM_Read( 0x3AD );
 delay_ms(5);
 Pulse_PickO = EEPROM_Read( 0x3AE );
 delay_ms(5);
 Pulse_PickP = EEPROM_Read( 0x3AF );
 delay_ms(5);

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("UPDATING PULSE",80,48);
 T6963C_Write_Text_Adv_ROM("FOR PICKS",96,64);
 delay_ms(2500);
}

void Save_shiftwise(void)
{


 EEPROM_Write_int(( 0X20 ),inchA);
 delay_ms(5);
 EEPROM_Write_int(( 0X22 ),inchB);
 delay_ms(5);
 EEPROM_Write_int(( 0x24 ),inchC);
 delay_ms(5);
 EEPROM_Write_int(( 0X26 ),inchD);
 delay_ms(5);
 EEPROM_Write_int(( 0X28 ),inchE);
 delay_ms(5);
 EEPROM_Write_int(( 0X2A ),inchF);
 delay_ms(5);
 EEPROM_Write_int(( 0X2C ),inchG);
 delay_ms(5);
 EEPROM_Write_int(( 0X2E ),inchH);
 delay_ms(5);
 EEPROM_Write_int(( 0X30 ),inchI);
 delay_ms(5);
 EEPROM_Write_int(( 0X32 ),inchJ);
 delay_ms(5);
 EEPROM_Write_int(( 0X34 ),inchK);
 delay_ms(5);
 EEPROM_Write_int(( 0X36 ),inchL);
 delay_ms(5);
 EEPROM_Write_int(( 0X38 ),inchM);
 delay_ms(5);
 EEPROM_Write_int(( 0X3A ),inchN);
 delay_ms(5);
 EEPROM_Write_int(( 0X3C ),inchO);
 delay_ms(5);
 EEPROM_Write_int(( 0X3E ),inchP);
 delay_ms(5);
}

void Save_shiftwise_External(void)
{


 EEPROM_AT24C32_WrInt(( 0X10 +(2*Shift_value)),inchA);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0XD0 +(2*Shift_value)),inchB);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X190 +(2*Shift_value)),inchC);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X250 +(2*Shift_value)),inchD);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X310 +(2*Shift_value)),inchE);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X3D0 +(2*Shift_value)),inchF);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X490 +(2*Shift_value)),inchG);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X550 +(2*Shift_value)),inchH);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X610 +(2*Shift_value)),inchI);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X6D0 +(2*Shift_value)),inchJ);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X790 +(2*Shift_value)),inchK);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X850 +(2*Shift_value)),inchL);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X910 +(2*Shift_value)),inchM);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0X9D0 +(2*Shift_value)),inchN);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0XA90 +(2*Shift_value)),inchO);
 delay_ms(5);
 EEPROM_AT24C32_WrInt(( 0XB50 +(2*Shift_value)),inchP);
 delay_ms(5);
}

void Save_shiftwise_Date_time_External(void)
{
 Read_Date_Time_Rtc();
 EEPROM_AT24C32_WrByte(( 0XD00 +(5*Shift_value)+0), Hour);
 EEPROM_AT24C32_WrByte(( 0XD00 +(5*Shift_value)+1), Min);
 EEPROM_AT24C32_WrByte(( 0XD00 +(5*Shift_value)+2), Date);
 EEPROM_AT24C32_WrByte(( 0XD00 +(5*Shift_value)+3), Month);
 EEPROM_AT24C32_WrByte(( 0XD00 +(5*Shift_value)+4), Year);
 delay_ms(400);
}

void EEPROM_Write_int(unsigned int Addr,unsigned int Data)
{
 EEPROM_Write(Addr,(Data>>8)&0x00FF);
 EEPROM_Write(Addr+1,Data&0x00FF);
}

unsigned int EEPROM_Read_int(unsigned int Addr)
{
 unsigned int Data=0,temp=0;
 temp = EEPROM_Read(Addr);
 Data = EEPROM_Read(Addr+1);
 delay_ms(5);
 return (((temp<<8)&0xFF00) | (Data&0x00FF));
}
#line 976 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/EEPROM_Data.c"
void EEPORM_Write_Float(int Addr, float Value)
 {

 int scaledValue = (int)(value * 10);


 EEPROM_Write(Addr, (unsigned char)(scaledValue & 0xFF));
 EEPROM_Write(Addr + 1, (unsigned char)((scaledValue >> 8) & 0xFF));
}

float EEPORM_Read_Float(int Addr)
{

 unsigned char lowByte = EEPROM_Read(Addr);
 unsigned char highByte = EEPROM_Read(Addr + 1);


 int scaledValue = (highByte << 8) | lowByte;


 return (float)scaledValue / 10.0;
}
