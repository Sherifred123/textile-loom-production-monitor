#line 1 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/main.c"
#pragma ReentrancyCheck OFF
#line 1 "e:/embedded file/project files/office project/new/nk automation/micro brain v.2.0/version/micro_brain_v32_till 30 ok now need to change pick in to long type/setup.h"


void Default_Config(void);
void MCU_Config(void);
void IO_Config(void);
void EEPROM_Config(void);
void LCD_Config(void);
void Interrupt_Init(void);



void Meter_Or_Picks_Method();
void Inch_Or_Pay_Method();
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
#line 11 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/main.c"
char T6963C_dataPort at PORTD;

sbit T6963C_ctrlwr at LATJ0_bit;
sbit T6963C_ctrlrd at LATJ1_bit;
sbit T6963C_ctrlcd at LATJ3_bit;
sbit T6963C_ctrlrst at LATB4_bit;
sbit T6963C_ctrlwr_Direction at TRISJ0_bit;
sbit T6963C_ctrlrd_Direction at TRISJ1_bit;
sbit T6963C_ctrlcd_Direction at TRISJ3_bit;
sbit T6963C_ctrlrst_Direction at TRISB4_bit;


sbit T6963C_ctrlce at LATJ2_bit;
sbit T6963C_ctrlfs at LATB5_bit;
sbit T6963C_ctrlmd at LATH2_bit;

sbit T6963C_ctrlce_Direction at TRISJ2_bit;
sbit T6963C_ctrlfs_Direction at TRISB5_bit;
sbit T6963C_ctrlmd_Direction at TRISH2_bit;

unsigned char panel;
unsigned char curs;
unsigned char cposx, cposy;

extern void EEPROM_AT24C32_Init(void);
extern unsigned short Read_RTC(unsigned short rAddr);
extern void Write_RTC(unsigned short wAddr, unsigned short wData);
extern void EEPROM_AT24C32_WrByte(unsigned int wAddr, unsigned int wData) ;
extern void EEPROM_AT24C32_WrInt(unsigned int wAddr, unsigned int wData);
extern unsigned int EEPROM_AT24C32_RdByte(unsigned int rAddr);
extern unsigned int EEPROM_AT24C32_RdInt(unsigned int rAddr);

extern void LCD_Refresh(void);

extern void ModeChange_EEPROM_update(void);

extern unsigned rx char MODE;

extern unsigned int Disp_inch,Disp_Pulse_Pick,Disp_Picks4inch;
extern unsigned long Disp_Beam;

extern unsigned int Picks4inchA,Picks4inchB,Picks4inchC,Picks4inchD,Picks4inchE,Picks4inchF,Picks4inchG;
extern unsigned int Picks4inchH,Picks4inchI,Picks4inchJ,Picks4inchK,Picks4inchL,Picks4inchM,Picks4inchN;
extern unsigned int Picks4inchO,Picks4inchP;

extern unsigned int Pulse_PickA,Pulse_PickB,Pulse_PickC,Pulse_PickD,Pulse_PickE,Pulse_PickF,Pulse_PickG;
extern unsigned int Pulse_PickH,Pulse_PickI,Pulse_PickJ,Pulse_PickK,Pulse_PickL,Pulse_PickM,Pulse_PickN;
extern unsigned int Pulse_PickO,Pulse_PickP;

extern float inchA,inchB,inchC,inchD,inchE,inchF,inchG,inchH,inchI,inchJ,inchK,inchL,inchM,inchN,inchO,inchP;
extern float Inch[17];
unsigned int Picks4inch[17];
extern float Meter[17];
extern float Picks[17];


extern unsigned long Beam_inchA,Beam_inchB,Beam_inchC,Beam_inchD,Beam_inchE,Beam_inchF,Beam_inchG;
extern unsigned long Beam_inchH,Beam_inchI,Beam_inchJ,Beam_inchK,Beam_inchL,Beam_inchM,Beam_inchN;
extern unsigned long Beam_inchO,Beam_inchP;

extern unsigned int count,countA,countB;

extern bit lcd_update;
extern unsigned int Fi_Xpos,Se_Xpos,Ypos;
float Production_L=0,Production_R=0,Beam_production=0;

extern unsigned char Shift_value;
extern unsigned char Loom_value;
extern unsigned char Loom_Starting_value;

extern unsigned int idata,tmpdata,x;

extern unsigned char cposx, cposy;

extern unsigned char Hour,Min,Sec,Date,Month,Year;
extern bit Power_up_bit;


extern bit PowerFail_Enable_bit;
bit PowerFail_Done_bit;

extern volatile bit one_sec_flag;


extern char Text[16];

const code char NK_LOGO_BANNER[];



extern bit Meter_Or_Picks_Sel;
extern bit Inch_Or_Pay_Sel;

extern float Pay_Value;

extern unsigned int i=0;
extern float Value_float=0;

unsigned char Hold_Sec=0;

bit Button_Hold_Bit;


void main()
{
 Power_up_bit=0;
 MCU_Config();

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("SETUP DONE",80,60);
 delay_ms(500);

 delay_ms(200);



  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 Date=Read_RTC(4);
 Month=Read_RTC(5);
 Year=Read_RTC(6);

 Hour=Read_RTC(2);
 Min=Read_RTC(1);
 Sec=Read_RTC(0);


  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 delay_ms(5);
 T6963C_Write_Text_Adv_ROM("TIME RECEIVED",68,60);
 delay_ms(500);




  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 delay_ms(5);
 T6963C_Write_Text_Adv_ROM("DATE:",56,36);
 GLCD_Print_Int_With_LeadingZero (Date ,63,52);


 T6963C_Write_Text_Adv_ROM("MONTH:",104,36);
 GLCD_Print_Int_With_LeadingZero(Month ,112,52);



 T6963C_Write_Text_Adv_ROM("YEAR:",160,36);
 GLCD_Print_Int_With_LeadingZero(Year ,168,52);


 T6963C_Write_Text_Adv_ROM("HOURS:",56,64);
 GLCD_Print_Int_With_LeadingZero(Hour ,64,80);

 T6963C_Write_Text_Adv_ROM("MINUTES:",104,64);
 GLCD_Print_Int_With_LeadingZero(Min ,112,80);

 T6963C_Write_Text_Adv_ROM("SECONDS:",168,64);
 GLCD_Print_Int_With_LeadingZero(Sec ,168,80);

 delay_ms(2000);
 lcd_update=1;
#line 180 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/main.c"
 while(1)
 {

 if ( (PowerFail_Enable_bit == 1) && (PowerFail_Done_bit == 0) )
 {
 PowerFail_Done_bit = 1;
 Update_EEPROM_PwrFail(0);
 }
#line 190 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/main.c"
 if(MODE==0)
 {

  LATB3_bit =1;
  LATB2_bit =1;
  LATB1_bit =1;
  LATG4_bit =1;

 if(Lcd_update==1)
 {
 LCD_Refresh();

 Display_variable_Update_Left_Pulse_picks();
 delay_ms(10);



 if(Inch_Or_Pay_Sel == 0)
 {
 Display_variable_Update_Left_Inches();
 delay_ms(10);
 Display_variable_Update_Right_Inches();
 delay_ms(10);
 }
 else
 {
 if(Meter_Or_Picks_Sel == 0)
 {

 Left_Side_Meter_PAY_Update();
 Right_Side_Meter_PAY_Update();
 }
 else
 {

 Left_Side_Pick_Pay_Update();
 Right_Side_Pick_Pay_Update();
 }
 }

 Display_variable_Update_Right_Pulse_picks();
 delay_ms(10);

 }

 if(( RE6_bit ==1)&&( RE5_bit ==1)&&( RE4_bit ==1)&&(countA>=200))
 {
 Display_variable_Update_Left_Pulse_picks();
 delay_ms(10);
 Display_variable_Update_Right_Pulse_picks();
 delay_ms(10);
 }


 if(( RE6_bit ==1)&&( RE5_bit ==1)&&( RE4_bit ==1)&&(countB>=900))
 {



 Inch[0]=InchA;
 Inch[1]=InchB;
 Inch[2]=InchC;
 Inch[3]=InchD;
 Inch[4]=InchE;
 Inch[5]=InchF;
 Inch[6]=InchG;
 Inch[7]=InchH;


 Inch[8]=InchI;
 Inch[9]=InchJ;
 Inch[10]=InchK;
 Inch[11]=InchL;
 Inch[12]=InchM;
 Inch[13]=InchN;
 Inch[14]=InchO;
 Inch[15]=InchP;

 if(Inch_Or_Pay_Sel == 0 )
 {
 Display_variable_Update_Left_Inches();
 delay_ms(10);
 Display_variable_Update_Right_Inches();
 delay_ms(10);
 }


 }

 if( RE7_bit  == 0 &&  RE4_bit  == 1 &&  RE5_bit  ==1 &&  RE6_bit  == 1)
 {

 while ( ( RE7_bit  == 0) && Hold_Sec < 5)
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("PRESS AND HOLD BLACK BUTTON",8,40);
 IntToStr( (5 - Hold_Sec) , Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text ,112,56 );
 Glcd_Buffer_Clear();
 T6963C_Write_Text_Adv_ROM("SECS LEFT",80,72);


 if(  RE7_bit  == 0 )
 {
 Hold_Sec++;
 delay_ms(1000);
 }
 else
 {
 Hold_Sec=0;
 }
 }
 if(Hold_Sec < 5 )
 {
 LCD_Refresh();
 Hold_Sec=0;

 }


 if(hold_sec >= 4)
 {

 Inch_Or_Pay_Sel = ~ Inch_Or_Pay_Sel;

 if ( Inch_Or_Pay_Sel == 0 )
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("INCH MODE SETTED",60,60);
 delay_ms(2000);
 }
 else
 {

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 if( Pay_Value == 0)
 {
 T6963C_set_cursor(28,8);
 Increment_Decerement_Float(&Pay_Value, 50.0 ,144, 64);
 delay_ms(15);

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("PAY MODE SETTED",60,64);
 T6963C_set_cursor(24,8);
 EEPROM_Write ( ( 0X42 ) ,Inch_Or_Pay_Sel);
 EEPORM_Write_Float( ( 0X43 ) , Pay_Value );
 delay_ms(2000);


  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_set_cursor(25,8);
 T6963C_Write_Text_Adv_ROM("SETTED PAY VALUE=",44,64);
 Pay_Value = EEPORM_Read_Float( 0X43 );
 FloatToStr_SingleDecimal(Pay_Value, Text);
 T6963C_Write_Text_Adv(Text,180,64);
 delay_ms(2000);

 }
 else
 {
 T6963C_Write_Text_Adv_ROM("PAY MODE SETTED",60,60);
 delay_ms(2000);

 }
  T6963C_Display. F0  = 0; T6963C_WriteCommand(T6963C_Display) ;
  T6963C_Display. F1  = 0; T6963C_WriteCommand(T6963C_Display) ;
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;

 }

 hold_sec=0;
 LCD_Refresh();
 EEPROM_Write ( ( 0X42 ) ,Inch_Or_Pay_Sel);
 Inch_Or_Pay_Sel = EEPROM_Read (  0X42  );
 delay_ms(5);
 }

 }



 if(( RE6_bit ==0)&&( RE5_bit ==1)&&( RE4_bit ==1))
 {
 delay_ms(250);

 if(( RE6_bit ==0)&&( RE5_bit ==1)&&( RE4_bit ==1))
 {
 Menulist();
 }
 }

 if(( RE5_bit ==0)&&( RE6_bit ==1)&&( RE4_bit ==1))
 {
 delay_ms(250);
 if(( RE5_bit ==0)&&( RE6_bit ==1)&&( RE4_bit ==1))
 {
 Reset_To_Next_Shift();
 }
 }

 if(( RE4_bit ==0)&&( RE6_bit ==1)&&( RE5_bit ==1))
 {
 delay_ms(250);
 if(( RE4_bit ==0)&&( RE6_bit ==1)&&( RE5_bit ==1))
 {
 Loom_value++;
 if(Loom_value>15)
 {
 Loom_value=0;
 }
#line 412 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/main.c"
 }
 }

 if(( RE4_bit ==0)&&( RE5_bit ==0)&&( RE6_bit ==1))
 {
#line 426 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/main.c"
 Save_shiftwise_External();
 delay_ms(100);
 Total_Beam_per_loom();
 Total_Beam_Per_Shift();
 delay_ms(200);

 Lcd_update=1;


 }

 }


 if(MODE==1)
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 delay_ms(1000);
  T6963C_Fill(1, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;


 GIE_bit = 0;
 PEIE_bit = 0;
 }
 else if(MODE>1)
 {
 delay_ms(1000);
 MODE=0;
 delay_ms(1000);
 }

 }



}


void LCD_Refresh(void)
 {
#line 480 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/main.c"
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;

 if(MODE==0)
 {
 T6963C_rectangle(0, 0, 239, 127,  0b1000 );

 T6963C_line(64, 0,64,12,  0b1000 );
 T6963C_line(168, 0,168,12,  0b1000 );

 T6963C_line(0 ,12,419,12,  0b1000 );
 T6963C_line(0, 24,419,24,  0b1000 );
 T6963C_line(0, 37,419,37,  0b1000 );
 T6963C_line(0, 50,419,50,  0b1000 );
 T6963C_line(0, 63,419,63,  0b1000 );
 T6963C_line(0, 76,419,76,  0b1000 );
 T6963C_line(0, 89,419,89,  0b1000 );
 T6963C_line(0, 102,419,102,  0b1000 );
 T6963C_line(0, 115,419,115,  0b1000 );


 T6963C_line(27, 12,27,239,  0b1000 );
 T6963C_line(50, 12,50,239,  0b1000 );
 T6963C_line(81, 12,81,239,  0b1000 );
 T6963C_line(120,12,120,239,  0b1000 );
 T6963C_line(147,12,147,239,  0b1000 );
 T6963C_line(170,12,170,239,  0b1000 );
 T6963C_line(201,12,201,239,  0b1000 );




 T6963C_Write_Text_Adv("SHIFT:NO:       LOOM START:NO:          DT:",3,1);
 GLCD_Print_Int_With_LeadingZero(Loom_Starting_value ,150,1);

 IntToStr( (Shift_value+1) , Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text ,53,1);
 Glcd_Buffer_Clear();

 GLCD_Print_Int_With_LeadingZero(Date ,188,1);
 T6963C_Write_Char_Adv(':',202, 1);

 GLCD_Print_Int_With_LeadingZero(Month ,206,1);
 T6963C_Write_Char_Adv(':', 220, 1);

 GLCD_Print_Int_With_LeadingZero(Year ,224,1);



 Fi_Xpos=8;
 Se_Xpos=128;
 Ypos=25;





 Loom_Starting_value=EEPROM_Read( 0X40 );
 delay_ms(15);

 for(i=0;i<8;i++)
 {
 asm CLRWDT;
 IntToStr(Loom_Starting_value+i , Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text,Fi_Xpos ,Ypos+(13*i));
 Glcd_Buffer_Clear();
 delay_ms(5);
 }

 Loom_Starting_value=EEPROM_Read( 0X40 );
 delay_ms(15);

 Loom_Starting_value=Loom_Starting_value+8;
 for(i=0;i<8;i++)
 {
 asm CLRWDT;
 IntToStr(Loom_Starting_value+i , Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv( Text ,Se_Xpos ,Ypos+(13*i));
 Glcd_Buffer_Clear();
 delay_ms(5);
 }

 Loom_Starting_value=EEPROM_Read( 0X40 );
 delay_ms(15);



 if(Meter_Or_Picks_Sel == 0)
 {




 Inch[0]=InchA;
 Inch[1]=InchB;
 Inch[2]=InchC;
 Inch[3]=InchD;
 Inch[4]=InchE;
 Inch[5]=InchF;
 Inch[6]=InchG;
 Inch[7]=InchH;


 Inch[8]=InchI;
 Inch[9]=InchJ;
 Inch[10]=InchK;
 Inch[11]=InchL;
 Inch[12]=InchM;
 Inch[13]=InchN;
 Inch[14]=InchO;
 Inch[15]=InchP;


 if(Inch_Or_Pay_Sel == 0 )
 {

 T6963C_Write_Text_Adv("L:NO   P/I    INCH    METER  L:NO   P/I    INCH   METER", 3, 13);
 }
 else
 {
 T6963C_Write_Text_Adv("L:NO   P/I     PAY     METER   L:NO   P/I     PAY     METER", 3, 13);
 }


 Left_Side_Meter_Update();
 if( Inch_Or_Pay_Sel == 1 )
 {
 Left_Side_Meter_PAY_Update();
 }


 Right_Side_Meter_Update();
 if( Inch_Or_Pay_Sel == 1 )
 {
 Right_Side_Meter_PAY_Update();
 }
 }

 else
 {



 Picks4inch[0]=Picks4inchA;
 Picks4inch[1]=Picks4inchB;
 Picks4inch[2]=Picks4inchC;
 Picks4inch[3]=Picks4inchD;
 Picks4inch[4]=Picks4inchE;
 Picks4inch[5]=Picks4inchF;
 Picks4inch[6]=Picks4inchG;
 Picks4inch[7]=Picks4inchH;


 Picks4inch[8]=Picks4inchI;
 Picks4inch[9]=Picks4inchJ;
 Picks4inch[10]=Picks4inchK;
 Picks4inch[11]=Picks4inchL;
 Picks4inch[12]=Picks4inchM;
 Picks4inch[13]=Picks4inchN;
 Picks4inch[14]=Picks4inchO;
 Picks4inch[15]=Picks4inchP;



 Inch[0]=InchA;
 Inch[1]=InchB;
 Inch[2]=InchC;
 Inch[3]=InchD;
 Inch[4]=InchE;
 Inch[5]=InchF;
 Inch[6]=InchG;
 Inch[7]=InchH;


 Inch[8]=InchI;
 Inch[9]=InchJ;
 Inch[10]=InchK;
 Inch[11]=InchL;
 Inch[12]=InchM;
 Inch[13]=InchN;
 Inch[14]=InchO;
 Inch[15]=InchP;

 if(Inch_Or_Pay_Sel == 0 )
 {


 T6963C_Write_Text_Adv("L:NO  P/I     INCH    PICKS    L:NO  P/I    INCH     PICKS", 3, 13);
 }
 else
 {
 T6963C_Write_Text_Adv("L:NO   P/I     PAY      PICKS    L:NO   P/I    PAY      PICKS", 3, 13);

 }

 Left_Side_Pick_Update();
 if( Inch_Or_Pay_Sel == 1 )
 {
 Left_Side_Pick_Pay_Update();
 }
 Right_Side_Pick_Update();
 if( Inch_Or_Pay_Sel == 1 )
 {
 Right_Side_Pick_Pay_Update();
 }


 }

 }




 Lcd_update=0;
 delay_ms(10);


 }
