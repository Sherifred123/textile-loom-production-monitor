#line 1 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
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
#line 11 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
extern unsigned int Picks4inchA,Picks4inchB,Picks4inchC,Picks4inchD,Picks4inchE,Picks4inchF,Picks4inchG;
extern unsigned int Picks4inchH,Picks4inchI,Picks4inchJ,Picks4inchK,Picks4inchL,Picks4inchM,Picks4inchN;
extern unsigned int Picks4inchO,Picks4inchP;

extern unsigned int Pulse_PickA,Pulse_PickB,Pulse_PickC,Pulse_PickD,Pulse_PickE,Pulse_PickF,Pulse_PickG;
extern unsigned int Pulse_PickH,Pulse_PickI,Pulse_PickJ,Pulse_PickK,Pulse_PickL,Pulse_PickM,Pulse_PickN;
extern unsigned int Pulse_PickO,Pulse_PickP;

extern float inchA,inchB,inchC,inchD,inchE,inchF,inchG,inchH,inchI,inchJ,inchK,inchL,inchM,inchN,inchO,inchP;
extern float Inch[17];
extern unsigned int Picks4inch[17];
float Meter[17];
float Picks[17];




extern unsigned long Beam_inchA,Beam_inchB,Beam_inchC,Beam_inchD,Beam_inchE,Beam_inchF,Beam_inchG;
extern unsigned long Beam_inchH,Beam_inchI,Beam_inchJ,Beam_inchK,Beam_inchL,Beam_inchM,Beam_inchN;
extern unsigned long Beam_inchO,Beam_inchP;


extern unsigned int Disp_inch,Disp_Pulse_Pick,Disp_Picks4inch;
extern unsigned long Disp_Beam;

extern float production,Beam_production;

extern unsigned int Fi_Xpos,Se_Xpos,Ypos;

extern unsigned char Shift_value;
extern unsigned char Loom_value;
extern unsigned char Loom_Starting_value;

extern unsigned rx char MODE;
extern unsigned int count,countA;

extern unsigned char ColourExit;
extern unsigned char menu_sec, exit2,exit1,menu_item;
extern unsigned char menushift_sec,menushift_item,exit3,exit4;

extern unsigned char cposx, cposy;

extern unsigned char Hour,Min,Sec,Date,Month,Year;



extern char Text[16];


extern bit Power_up_bit;
extern bit PowerFail_Enable_bit;
extern bit PowerFail_Done_bit;


extern bit EEPROM_RST_Check_bit;
unsigned int EEPROM_Value_Read_Check=0;
bit EEPROM_Reset_Attempt_Count_bit;




extern bit Meter_Or_Picks_Sel;
extern bit Inch_Or_Pay_Sel;

extern float Pay_Value;

extern unsigned int i=0;
extern float Value_float=0;
extern float Production_L,Production_R;

extern Button_Hold_Bit;


void Menulist(void)
{
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("PRESS AND HOLD YELLOW BUTTON",8,40);
 IntToStr( (5-menu_sec) , Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text ,112,56 );
 Glcd_Buffer_Clear();

 T6963C_Write_Text_Adv_ROM("SECS LEFT",80,72);
 menu_sec++;
 delay_ms(1000);
 count=0;

 if(menu_sec>=5)
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("NK",108,48);
 T6963C_Write_Text_Adv_ROM("AUTOMATION",80,64);
 delay_ms(2000);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;

 exit2=0;

 menu_item=1;



 while(exit2==0)
 {
  T6963C_Display. F1  = 0; T6963C_WriteCommand(T6963C_Display) ;
  T6963C_Display. F1  = 1; T6963C_WriteCommand(T6963C_Display) ;
  T6963C_Display. F0  = 1; T6963C_WriteCommand(T6963C_Display) ;


 if(menu_item==1)
 {
 T6963C_Write_char_adv(45,0,8 );
 T6963C_Write_char_adv(45,2,8 );
 T6963C_Write_char_adv(62,3,8 );
 T6963C_Write_Text_Adv_ROM("MENU MODE           ", 11, 8);
 T6963C_Write_Text_Adv_ROM("BEAM METER          ", 11, 24);
 T6963C_Write_Text_Adv_ROM("RESET COLOR         ", 11, 40);
 T6963C_Write_Text_Adv_ROM("CLOCK               ", 11, 56);
 T6963C_Write_Text_Adv_ROM("FACTORY SETTING     ", 11, 72);

 T6963C_set_cursor(12,1);
 if( RE4_bit ==0)
 {menu_item=2;delay_ms(250); T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;}
 if( RE5_bit ==0)
 {menu_item=5;delay_ms(250); T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;}

 if( RE6_bit ==0)
 {
 delay_ms(200);
 while( RE6_bit ==0);
 delay_ms(200);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 UserColourSetting();
 delay_ms(200);
 ColourExit=0;
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 delay_ms(200);
 }
 }

 if(menu_item==2)
 {
 T6963C_Write_char_adv(45,0,24 );
 T6963C_Write_char_adv(45,2,24 );
 T6963C_Write_char_adv(62,3,24 );
 T6963C_Write_Text_Adv_ROM("MENU MODE           ", 11, 8);
 T6963C_Write_Text_Adv_ROM("BEAM METER          ", 11, 24);
 T6963C_Write_Text_Adv_ROM("RESET COLOR         ", 11, 40);
 T6963C_Write_Text_Adv_ROM("CLOCK               ", 11, 56);
 T6963C_Write_Text_Adv_ROM("FACTORY SETTING     ", 11, 72);

 T6963C_set_cursor(12,3);
 if( RE4_bit ==0)
 {menu_item=3;delay_ms(250); T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;}

 if( RE5_bit ==0)
 {menu_item=1;delay_ms(250); T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;}

 if( RE6_bit ==0)
 {
 while( RE6_bit ==0)
 delay_ms(200);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 Beam_Setting(void);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 delay_ms(200);
 }
 }
 if(menu_item==3)
 {
 T6963C_Write_char_adv(45,0,40 );
 T6963C_Write_char_adv(45,2,40 );
 T6963C_Write_char_adv(62,3,40 );
 T6963C_Write_Text_Adv_ROM("MENU MODE           ", 11, 8);
 T6963C_Write_Text_Adv_ROM("BEAM METER          ", 11, 24);
 T6963C_Write_Text_Adv_ROM("RESET COLOR         ", 11, 40);
 T6963C_Write_Text_Adv_ROM("CLOCK               ", 11, 56);
 T6963C_Write_Text_Adv_ROM("FACTORY SETTING     ", 11, 72);
 T6963C_set_cursor(13,5);

 if( RE4_bit ==0)
 {menu_item=4;delay_ms(250); T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;}

 if( RE5_bit ==0)
 {menu_item=2;delay_ms(250); T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;}

 if( RE6_bit ==0)
 {
 while( RE6_bit ==0)
 delay_ms(200);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 Reset_color_Setting();
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 delay_ms(200);
 }
 }

 if(menu_item==4)
 {
 T6963C_Write_char_adv(45,0,56 );
 T6963C_Write_char_adv(45,2,56 );
 T6963C_Write_char_adv(62,3,56 );
 T6963C_Write_Text_Adv_ROM("MENU MODE           ", 11, 8);
 T6963C_Write_Text_Adv_ROM("BEAM METER          ", 11, 24);
 T6963C_Write_Text_Adv_ROM("RESET COLOR         ", 11, 40);
 T6963C_Write_Text_Adv_ROM("CLOCK               ", 11, 56);
 T6963C_Write_Text_Adv_ROM("FACTORY SETTING     ", 11, 72);
 T6963C_set_cursor(9,7);

 if( RE4_bit ==0)
 {menu_item=5;delay_ms(250); T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;}

 if( RE5_bit ==0)
 {menu_item=3;delay_ms(250); T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;}

 if( RE6_bit ==0)
 {
 while( RE6_bit ==0)
 delay_ms(200);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 Set_Date_Time_Rtc();
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 delay_ms(200);
 }
 }
 if(menu_item==5)
 {
 T6963C_Write_char_adv(45,0,72 );
 T6963C_Write_char_adv(45,2,72 );
 T6963C_Write_char_adv(62,3,72 );
 T6963C_Write_Text_Adv_ROM("MENU MODE           ", 11, 8);
 T6963C_Write_Text_Adv_ROM("BEAM METER          ", 11, 24);
 T6963C_Write_Text_Adv_ROM("RESET COLOR         ", 11, 40);
 T6963C_Write_Text_Adv_ROM("CLOCK               ", 11, 56);
 T6963C_Write_Text_Adv_ROM("FACTORY SETTING     ", 11, 72);
 T6963C_set_cursor(18,22);
 if( RE4_bit ==0)
 {menu_item=1;delay_ms(250); T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;}

 if( RE5_bit ==0)
 {menu_item=4;delay_ms(250); T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;}

 if( RE6_bit ==0)
 {
 while( RE6_bit ==0)
 delay_ms(200);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 Factory_Reset();
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 delay_ms(200);
 }
 }



 if( RE7_bit ==0)
 {
  T6963C_Display. F1  = 0; T6963C_WriteCommand(T6963C_Display) ;
 exit2=1;
 LCD_Refresh();
 delay_ms(250);
 }


 }
 }
 if( RE6_bit !=0)
 {
 menu_sec=0;LCD_Refresh();
 }
}



void Beam_Setting(void)
{
unsigned char Reset_loop=0,Exit_loop=0,SplFlag=0,SplFlag1=0;
unsigned char Hold_mode=0;
unsigned int temp16=0;

Exit_loop=0;


 while(Exit_loop==0)
 {
 while(Hold_mode==0)
 {
 if((SplFlag==0)&&(Reset_loop==0))
 {

 T6963C_Write_char_adv(45,0,8 );
 T6963C_Write_char_adv(45,2,8 );
 T6963C_Write_char_adv(62,3,8 );
 T6963C_Write_Text_Adv_ROM("TOTAL:BEAM/LOOM", 11, 8);
 T6963C_Write_Text_Adv_ROM("BEAM:LOOM/SHIFT", 11, 24);
 T6963C_set_cursor(20,1);
 Reset_loop=1;
 delay_ms(100);
 }

 if((SplFlag==1)&&(Reset_loop==0))
 {
 T6963C_Write_char_adv(45,0,24 );
 T6963C_Write_char_adv(45,2,24 );
 T6963C_Write_char_adv(62,3,24 );
 T6963C_Write_Text_Adv_ROM("TOTAL:BEAM/LOOM", 11, 8);
 T6963C_Write_Text_Adv_ROM("BEAM:LOOM/SHIFT", 11, 24);
 T6963C_set_cursor(20,3);
 Reset_loop=1;
 delay_ms(100);
 }

 if( RE4_bit ==0)
 {
 if(SplFlag==0)
 {SplFlag=1;Reset_loop=0; T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;delay_ms(100); }
 else if(SplFlag==1)
 {SplFlag=0;Reset_loop=0; T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;delay_ms(100); }
 }



 if( RE6_bit ==0)
 {

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 if(SplFlag==0)
 {
 Beam_Loom_Shift();
 delay_ms(200);
 return;
 }

 if(SplFlag==1)
 {
 Select_Loom_Total_Beam_per_loom();
 delay_ms(200);
 return;
 }
 }

 if( RE7_bit ==0)
 {
 Exit_loop=1;
 Hold_mode=1;
 Reset_loop=0;
 exit1=1;
 GIE_bit = 1;
 PEIE_bit = 1;
 delay_ms(250);
 return;
 }

 }


 }
}


void Reset_To_Next_Shift(void)
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("PRESS AND HOLD RED BUTTON",20,40);
 IntToStr( (5-menushift_sec) , Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text ,112,56 );
 Glcd_Buffer_Clear();



 T6963C_Write_Text_Adv_ROM("SECONDS LEFT",72,72);
 T6963C_Write_Text_Adv_ROM("TO RESET SHIFT",64,88);
 delay_ms(1000);
 menushift_sec++;
 count=0;

 if(menushift_sec>=5)
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("NK", 108, 48);
 T6963C_Write_Text_Adv_ROM("AUTOMATION", 80, 64);
 Save_shiftwise_External();
 Save_shiftwise_Date_time_External();
 delay_ms(1000);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 exit3=0;
 menushift_item=1;




 if(Shift_value<95)
 {
 Shift_value++;
 Variable_Reset();
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("SHIFT CHANGED", 80, 48);
 IntToStr( (Shift_value+1) , Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text ,116,64 );
 Glcd_Buffer_Clear();

 delay_ms(2000);
 }
 else
 {
 Next_cyle();
 }


 }
 if( RE5_bit !=0)
 {
 menushift_sec=0;LCD_Refresh();
 }

 }

void Shift_Jump(void)
{
 Save_shiftwise_External();
 Save_shiftwise_Date_time_External();

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("SHIFT:NO:", 90, 48);
 delay_ms(500);
 Increment_Decerement(&Shift_value,96,104,64);
 delay_ms(500);

 if(Shift_value<=0){Shift_value=0;}
 if(Shift_value>=1){Shift_value=(Shift_value-1); }


 {
 delay_ms(1000);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;

 if(Shift_value<95)
 {
 Variable_Reset();
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;

 T6963C_Write_Text_Adv_ROM("SHIFT CHANGED", 80, 48);
 IntToStr( (Shift_value+1) , Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text ,116,64 );
 Glcd_Buffer_Clear();
#line 462 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 delay_ms(2000);
 }
 else
 {
 Next_cyle();
 }


 }

}


void Beam_Loom_Shift(void)
{
unsigned char Reset_loop=0,ColourExit2=0,item=0,SplFlag=0;
unsigned char Loom_no=1,Shift_no=1;
static unsigned int Colour_Addr,LoomStartAddr,i=0,j=0,k=0,Loom_noA=0;
unsigned int Shift_beam_Inch;
float Shift_Beam_meter;


 while(ColourExit2==0)
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("LOOM:NO      SHIFT:NO", 30, 48);
 delay_ms(1500);
 Loom_no=Loom_Starting_value;

 Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),38,64);

 while(Loom_no<Loom_Starting_value)
 {
 Loom_no=Loom_Starting_value;
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("INVALD VALUE FOR THIS BOX", 21, 8);
 delay_ms(1500);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("LOOM:NO      SHIFT:NO", 30, 48);
 delay_ms(1500);


 Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),38,64);


 }



 delay_ms(1000);
 Increment_Decerement(&Shift_no,96,160,64);
 delay_ms(1000);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;

 T6963C_Write_Text_Adv_ROM("PLEASE NOTE:", 72, 32);
 T6963C_Write_Text_Adv_ROM("DATE SHIFT AND TIME READINGS",8, 48);
 delay_ms(3000);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("L00M   DATE   MONTH   YEAR", 11, 8);
 IntToStr( Loom_no , Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text ,16,23 );
 Glcd_Buffer_Clear();

 T6963C_Write_Text_Adv_ROM(" ", 32, 23);

 Read_Shift_Date_Time(Shift_no);


 GLCD_Print_Int_With_LeadingZero(Date ,72,23 );

 T6963C_Write_Text_Adv_ROM("-", 98, 23);


 GLCD_Print_Int_With_LeadingZero(Month ,130,23 );


 T6963C_Write_Text_Adv_ROM("-",180,23);
 GLCD_Print_Int_With_LeadingZero(Year ,198,23 );


 T6963C_Write_Text_Adv_ROM("SHIFT NO:", 11, 45);
 GLCD_Print_Int_With_LeadingZero(Shift_no ,86,45 );
#line 551 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 T6963C_Write_Text_Adv_ROM("TIME:", 11, 64);
 GLCD_Print_Int_With_LeadingZero(Hour ,48,64 );
#line 557 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 T6963C_Write_Text_Adv_ROM(":", 64, 64);
 GLCD_Print_Int_With_LeadingZero(Min ,72,64);
#line 564 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 T6963C_Write_Text_Adv_ROM(":", 88, 64);;
 GLCD_Print_Int_With_LeadingZero(Sec ,96,64 );
#line 571 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 delay_ms(5000);

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("CALCULATING BEAM METER", 42, 45);
 delay_ms(2000);
 Reset_loop=0;

 Loom_no=(Loom_no-(Loom_Starting_value-1));

 Loom_noA = Loom_no;
 j=(Loom_noA-1)*192;
 LoomStartAddr=j+ 0X10 ;
 k = ((Shift_no-1)*2);
 Shift_beam_Inch =EEPROM_AT24C32_RdInt(LoomStartAddr+k);
 delay_ms(500);
 Shift_Beam_meter=((float)(0.0254*Shift_beam_Inch));

 delay_ms(100);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("L00M:", 8, 24);

 IntToStr( (Loom_no+(Loom_Starting_value-1) ) , Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text ,56,24);
#line 600 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 T6963C_Write_Text_Adv_ROM("SHIFT:", 8, 48);
 GLCD_Print_Int_With_LeadingZero(Shift_no,60,48 );
#line 606 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 T6963C_Write_Text_Adv_ROM("INCH:", 90, 48);
 GLCD_Print_Int_With_LeadingZero ( Shift_beam_Inch,140,48 );
#line 616 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 T6963C_Write_Text_Adv_ROM("M:", 8, 72);
 FloatToStr_SingleDecimal(Shift_Beam_meter,Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text,34,72);
 Glcd_Buffer_Clear();
#line 629 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 while(Reset_loop==0)
 {

 if( RE5_bit ==0)
 {
 Reset_loop=1;
 delay_ms(1000);
 }


 if( RE7_bit ==0)
 {
 ColourExit2=1;
 return;
 }
 }
 }

 delay_ms(1000);
}


void Total_Beam_per_loom(void)
{
unsigned int j=0,k=0,x=0;
unsigned int temp_data=0;

 j=Loom_value*192;
 x=j+ 0X10 ;
 Beam_production=0;
 Disp_Beam=0;
 for(k=x;k<(96+x);k++)
 {
 temp_data=EEPROM_AT24C32_RdInt(x+(2*(k-x)));
 Disp_Beam+=temp_data;
 }
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 delay_ms(200);
 Beam_production = ((float)(0.0254*Disp_Beam)+((float)((1/Disp_Picks4inch)*Disp_Pulse_Pick)));

 delay_ms(200);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("L", 42, 80);



 GLCD_Print_Int_With_LeadingZero ( (Loom_value+Loom_Starting_value) ,50,80 );
#line 680 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 T6963C_Write_Text_Adv_ROM(":M:",66,80);

 FloatToStr_SingleDecimal(Beam_production,Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text,74,80);
 Glcd_Buffer_Clear();
#line 694 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 T6963C_Write_Text_Adv_ROM("I:",122,80);
 GLCD_Print_Int_With_LeadingZero(Disp_Beam,130,80 );
#line 704 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 delay_ms(12000);
}

void Total_Beam_Per_Shift(void)
{
unsigned long int Current_Total_Beam_Per_Shift;
float Current_Shift_Meter;

 Current_Total_Beam_Per_Shift=(inchA+inchB+inchC+inchD+inchE+inchF+inchG+inchH+inchI+inchJ+inchK+inchL+inchM+inchN+inchO+inchP);

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;

 T6963C_Write_Text_Adv_ROM("BEAM/SHIFT:",20,23);
 GLCD_Print_Int_With_LeadingZero( (Shift_value+1) ,28,23);
#line 724 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 T6963C_Write_Text_Adv_ROM("I:",44,23);
 GLCD_Print_Int_With_LeadingZero( Current_Total_Beam_Per_Shift ,52,23);
#line 734 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 Current_Shift_Meter=((float)(0.025*Current_Total_Beam_Per_Shift));


 T6963C_Write_Text_Adv_ROM(":M:",44,31);
 FloatToStr_SingleDecimal(Current_Shift_Meter,Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text,52,31);
 Glcd_Buffer_Clear();
#line 751 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 delay_ms(6000);
}

void Select_Loom_Total_Beam_per_loom(void)
{
unsigned int j=0,k=0,x=0;
unsigned int temp_data=0;
unsigned int Loom_no=1;


  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("LOOM:NO:",80,48);
 delay_ms(500);

 Loom_no=Loom_Starting_value;
 Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),144,48);

 while(Loom_no<Loom_Starting_value)
 {
 Loom_no=Loom_Starting_value;

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("INVALD VALUE",80,48);

 T6963C_Write_Text_Adv_ROM("FOR THIS BOX LOOM NO",64,64);
 delay_ms(2000);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("LOOM:NO:",80,48);
 Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),144,48);
 }

 delay_ms(500);
 Loom_no=(Loom_no-(Loom_Starting_value-1));

 Loom_no=(Loom_no-1);


 j=Loom_No*192;
 x=j+ 0X10 ;
 Beam_production=0;
 Disp_Beam=0;
 for(k=x;k<(96+x);k++)
 {
 temp_data=EEPROM_AT24C32_RdInt(x+(2*(k-x)));
 Disp_Beam+=temp_data;
 }
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 delay_ms(200);
 Beam_production = ((float)(0.025*Disp_Beam)+((float)((1/Disp_Picks4inch)*Disp_Pulse_Pick)));

 delay_ms(200);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;


 T6963C_Write_Text_Adv_ROM("LOOM NO:",4,16);
 GLCD_Print_Int_With_LeadingZero( (Loom_No+Loom_Starting_value) ,64,16);

 T6963C_Write_Text_Adv_ROM("M:",96,16);
 FloatToStr_SingleDecimal(Beam_production,Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text,112,16);
 Glcd_Buffer_Clear();
#line 821 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 T6963C_Write_Text_Adv_ROM("I:",4,32);
 GLCD_Print_Int_With_LeadingZero(Disp_Beam ,16,32);
#line 831 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 delay_ms(12000);

}

void UserColourSetting()
{
unsigned char Reset_loop=0,ColourExit2=0,item=0,i=0,SplFlag=0;
unsigned int Colour_Addr;



 while(ColourExit==0)
 {
 while(ColourExit2==0)
 {
 if((SplFlag==0) &&(Reset_loop==0))
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_char_adv(45,0,8 );
 T6963C_Write_char_adv(45,2,8 );
 T6963C_Write_char_adv(62,3,8 );
 T6963C_Write_Text_Adv_ROM("SET PICK:ALL",11,8);
 T6963C_Write_Text_Adv_ROM("SET PICK:1/1",11,24);
 T6963C_Write_Text_Adv_ROM("LOOM STARTING NO",11,40);
 T6963C_Write_Text_Adv_ROM("METER/PICKS METHOD  ", 11, 56);
 T6963C_Write_Text_Adv_ROM("INCH/PAY            ", 11, 72);
 T6963C_set_cursor(14,1);
 Reset_loop=1;
 delay_ms(150);
 }

 if((SplFlag==1) &&(Reset_loop==0))
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_char_adv(45,0,24 );
 T6963C_Write_char_adv(45,2,24 );
 T6963C_Write_char_adv(62,3,24 );
 T6963C_Write_Text_Adv_ROM("SET PICK:ALL",11,8);
 T6963C_Write_Text_Adv_ROM("SET PICK:1/1",11,24);
 T6963C_Write_Text_Adv_ROM("LOOM STARTING NO",11,40);
 T6963C_Write_Text_Adv_ROM("METER/PICKS METHOD  ", 11, 56);
 T6963C_Write_Text_Adv_ROM("INCH/PAY            ", 11, 72);

 T6963C_set_cursor(14,3);
 Reset_loop=1;
 delay_ms(150);
 }
 if((SplFlag==2) &&(Reset_loop==0))
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_char_adv(45,0,40 );
 T6963C_Write_char_adv(45,2,40 );
 T6963C_Write_char_adv(62,3,40 );
 T6963C_Write_Text_Adv_ROM("SET PICK:ALL",11,8);
 T6963C_Write_Text_Adv_ROM("SET PICK:1/1",11,24);
 T6963C_Write_Text_Adv_ROM("LOOM STARTING NO",11,40);
 T6963C_Write_Text_Adv_ROM("METER/PICKS METHOD  ", 11, 56);
 T6963C_Write_Text_Adv_ROM("INCH/PAY            ", 11, 72);

 T6963C_set_cursor(19,5);
 Reset_loop=1;
 delay_ms(150);
 }

 if((SplFlag==3) &&(Reset_loop==0))
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_char_adv(45,0,56 );
 T6963C_Write_char_adv(45,2,56 );
 T6963C_Write_char_adv(62,3,56 );
 T6963C_Write_Text_Adv_ROM("SET PICK:ALL",11,8);
 T6963C_Write_Text_Adv_ROM("SET PICK:1/1",11,24);
 T6963C_Write_Text_Adv_ROM("LOOM STARTING NO",11,40);
 T6963C_Write_Text_Adv_ROM("METER/PICKS METHOD", 11, 56);
 T6963C_Write_Text_Adv_ROM("INCH/PAY", 11, 72);

 T6963C_set_cursor(20,7);
 Reset_loop=1;
 delay_ms(150);
 }

 if((SplFlag==4) &&(Reset_loop==0))
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_char_adv(45,0,72 );
 T6963C_Write_char_adv(45,2,72 );
 T6963C_Write_char_adv(62,3,72 );
 T6963C_Write_Text_Adv_ROM("SET PICK:ALL",11,8);
 T6963C_Write_Text_Adv_ROM("SET PICK:1/1",11,24);
 T6963C_Write_Text_Adv_ROM("LOOM STARTING NO",11,40);
 T6963C_Write_Text_Adv_ROM("METER/PICKS METHOD", 11, 56);
 T6963C_Write_Text_Adv_ROM("INCH/PAY", 11, 72);

 T6963C_set_cursor(10,9);
 Reset_loop=1;
 delay_ms(150);
 }


 if( RE4_bit ==0)
 {
 if(SplFlag==0)
 {SplFlag=1;Reset_loop=0;delay_ms(250); }
 else if(SplFlag==1)
 {SplFlag=2;Reset_loop=0;delay_ms(250); }
 else if(SplFlag==2)
 {SplFlag=3;Reset_loop=0;delay_ms(250); }
 else if(SplFlag==3)
 {SplFlag=4;Reset_loop=0;delay_ms(250); }
 else if(SplFlag==4)
 {SplFlag=0;Reset_loop=0;delay_ms(250); }

 }

 if( RE5_bit ==0)
 {
 if(SplFlag==0)
 {SplFlag=4;Reset_loop=0;delay_ms(250); }
 else if(SplFlag==1)
 {SplFlag=0;Reset_loop=0;delay_ms(250); }
 else if(SplFlag==2)
 {SplFlag=1;Reset_loop=0;delay_ms(250); }
 else if(SplFlag==3)
 {SplFlag=2;Reset_loop=0;delay_ms(250); }
 else if(SplFlag==4)
 {SplFlag=3;Reset_loop=0;delay_ms(250); }

 }
 if( RE6_bit ==0)
 {

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 if(SplFlag==0)
 {
 Pick_Set_All();
 delay_ms(200);
 return;
 }

 if(SplFlag==1)
 {
 Pick_Set_One_one();
 delay_ms(200);
 return;
 }

 if(SplFlag==2)
 {
 Loom_Starting_No();
 delay_ms(200);
 return;
 }
 if(SplFlag==3)
 {
 Meter_Or_Picks_Method();
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;


 delay_ms(200);
 return;
 }
 if(SplFlag==4)
 {
 Inch_Or_Pay_Method();
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;


 delay_ms(200);
 return;
 }
 }

 if( RE7_bit ==0)
 {
 ColourExit=0;
 ColourExit2=1;
 exit1=1;
 GIE_bit = 1;
 PEIE_bit = 1;
 delay_ms(250);
 return;
 }

 }

 }



}

void Loom_Starting_No(void)
{
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("LOOM STARTING NO",56,56);
 Loom_Starting_value=EEPROM_Read( 0X40 );
 delay_ms(5);


 GLCD_Print_Int_With_LeadingZero( Loom_Starting_value,112,72);
#line 1035 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 delay_ms(250);

 Increment_Decerement_Char(&Loom_Starting_value,81,112,72);

 EEPROM_Write(( 0X40 ),Loom_Starting_value);
 delay_ms(5);
}


void Pick_Set_All(void)
{
unsigned char i=0;

 T6963C_Write_Text_Adv_ROM(" SET PICK / INCH ",50,48);

 GLCD_Print_Int_With_LeadingZero( Picks4inchA,102,72);
#line 1055 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
  T6963C_Display. F1  = 0; T6963C_WriteCommand(T6963C_Display) ;
  T6963C_Display. F1  = 1; T6963C_WriteCommand(T6963C_Display) ;
  T6963C_Display. F0  = 1; T6963C_WriteCommand(T6963C_Display) ;

 delay_ms(250);
 Increment_Decerement_Char(&Picks4inchA,250,102,72);
 for(i=0;i<=15;i++)
 {
 EEPROM_Write( 0x10 +i,Picks4inchA);
 delay_ms(30);
 }
 load_Picks4inch(void);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("SAVING FOR ALL LOOMS",44,48);
 delay_ms(1500);
  T6963C_Display. F1  = 0; T6963C_WriteCommand(T6963C_Display) ;
 return;

}
void Pick_Set_One_one(void)
{
unsigned char i=0;
 for(i=0;i<=15;i++)
 {


  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("SET PICK/INCH:",50,16);
 T6963C_Write_Text_Adv_ROM("LOOM NUMBER:",8,40);
 GLCD_Print_Int_With_LeadingZero ( (Loom_Starting_value+i) , 104,40);
#line 1091 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 Picks4inchA = EEPROM_Read( 0x10 +i);
 T6963C_Write_Text_Adv_ROM("SET PICK FOR INCH:",8,64);
 GLCD_Print_Int_With_LeadingZero (Picks4inchA,158,64);
#line 1099 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 delay_ms(250);
 Increment_Decerement_Char(&Picks4inchA,250,158,64);
 EEPROM_Write( 0x10 +i,Picks4inchA);
 delay_ms(30);

 if( RE5_bit ==0)
 {
 load_Picks4inch(void);
 delay_ms(500);
 return;
 }
 }
 load_Picks4inch(void);

}


void Reset_color_Setting(void)
{
unsigned char Reset_loop=0,Exit_loop=0,SplFlag=0,SplFlag1=0;
unsigned char Hold_mode=0;
unsigned int temp16=0;

Exit_loop=0;


 while(Exit_loop==0)
 {
 while(Hold_mode==0)
 {
 if((SplFlag==0)&&(Reset_loop==0))
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_char_adv(45,0,8 );
 T6963C_Write_char_adv(45,2,8 );
 T6963C_Write_char_adv(62,3,8 );
 T6963C_Write_Text_Adv_ROM("RESET:ALL LOOMS",11,8);
 T6963C_Write_Text_Adv_ROM("RESET:LOOM ONE BY ONE",11,24);
 T6963C_Write_Text_Adv_ROM("RESET:SHIFT:ONE BY ONE",11,40);
 T6963C_Write_Text_Adv_ROM("RESET:SHIFT:NO  ",11,56);
 T6963C_set_cursor(18,1);
 Reset_loop=1;
 delay_ms(100);
 }

 if((SplFlag==1)&&(Reset_loop==0))
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_char_adv(45,0,24 );
 T6963C_Write_char_adv(45,2,24);
 T6963C_Write_char_adv(62,3,24);
 T6963C_Write_Text_Adv_ROM("RESET:ALL LOOMS",11,8);
 T6963C_Write_Text_Adv_ROM("RESET:LOOM ONE BY ONE",11,24);
 T6963C_Write_Text_Adv_ROM("RESET:SHIFT:ONE BY ONE",11,40);
 T6963C_Write_Text_Adv_ROM("RESET:SHIFT:NO  ",11,56);
 T6963C_set_cursor(18,23);
 Reset_loop=1;
 delay_ms(100);
 }

 if((SplFlag==2)&&(Reset_loop==0))
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_char_adv(45,0,40);
 T6963C_Write_char_adv(45,2,40);
 T6963C_Write_char_adv(62,3,40);
 T6963C_Write_Text_Adv_ROM("RESET:ALL LOOMS",11,8);
 T6963C_Write_Text_Adv_ROM("RESET:LOOM ONE BY ONE",11,24);
 T6963C_Write_Text_Adv_ROM("RESET:SHIFT:ONE BY ONE",11,40);
 T6963C_Write_Text_Adv_ROM("RESET:SHIFT:NO  ",11,56);
 T6963C_set_cursor(18,5);
 Reset_loop=1;
 delay_ms(100);
 }

 if((SplFlag==3)&&(Reset_loop==0))
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_char_adv(45,0,56);
 T6963C_Write_char_adv(45,2,56);
 T6963C_Write_char_adv(62,3,56);
 T6963C_Write_Text_Adv_ROM("RESET:ALL LOOMS",11,8);
 T6963C_Write_Text_Adv_ROM("RESET:LOOM ONE BY ONE",11,24);
 T6963C_Write_Text_Adv_ROM("RESET:SHIFT:ONE BY ONE",11,40);
 T6963C_Write_Text_Adv_ROM("RESET:SHIFT:NO  ",11,56);
 T6963C_set_cursor(18,7);
 Reset_loop=1;
 delay_ms(100);
 }


 if( RE4_bit ==0)
 {
 if(SplFlag==0)
 {SplFlag=1;Reset_loop=0;delay_ms(100); }
 else if(SplFlag==1)
 {SplFlag=2;Reset_loop=0;delay_ms(100); }
 else if(SplFlag==2)
 {SplFlag=3;Reset_loop=0;delay_ms(100); }
 else if(SplFlag==3)
 {SplFlag=0;Reset_loop=0;delay_ms(100); }

 }

 if( RE5_bit ==0)
 {
 if(SplFlag==0)
 {SplFlag=3;Reset_loop=0;delay_ms(100); }
 else if(SplFlag==1)
 {SplFlag=0;Reset_loop=0;delay_ms(100); }
 else if(SplFlag==2)
 {SplFlag=1;Reset_loop=0;delay_ms(100); }
 else if(SplFlag==3)
 {SplFlag=2;Reset_loop=0;delay_ms(100); }

 }

 if( RE6_bit ==0)
 {

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 if(SplFlag==0)
 {
 Reset_All_Loom();
 delay_ms(200);
 return;
 }

 if(SplFlag==1)
 {
 Reset_Loom_One_one();
 delay_ms(200);
 return;
 }
 if(SplFlag==2)
 {
 Reset_Shift_One_one();
 delay_ms(200);
 return;
 }
 if(SplFlag==3)
 {
 Shift_Jump();
 delay_ms(200);
 return;
 }
 }

 if( RE7_bit ==0)
 {
 Exit_loop=1;
 Hold_mode=1;
 Reset_loop=0;
 exit1=1;
 GIE_bit = 1;
 PEIE_bit = 1;
 delay_ms(250);
 return;
 }

 }


 }
}

void Reset_All_Loom(void)
 {
unsigned int i=0,j=0,k=0;



 while (EEPROM_Reset_Attempt_Count_bit <= 1 )
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;


 T6963C_Write_Text_Adv_ROM("UPDATING...",78,32);
 T6963C_Write_Text_Adv_ROM("PLEASE WAIT",78,48);


 PEIE_bit = 0;
 GIE_bit = 0;


 T6963C_rectangle(80,104, 160, 90 ,  0b1000 );


 for(i=0;i<16;i++)
 {
 Loading_Fill(i);
 j=i*96;
 for(k=j;k<(96+j);k++)
 {
 EEPROM_AT24C32_WrInt( 0X10 +(2*k),0);
 delay_ms(10);

 }
 }
 for(i=0;i<16;i++)
 {
 Loading_Fill(i+25);
 EEPROM_Write_int(( 0X20 +(2*i)),0);
 delay_ms(10);
 }


 Verify_EEPROM_Data_Clear();


 if( (EEPROM_RST_Check_bit == 1) && (EEPROM_Reset_Attempt_Count_bit == 1) )
 {
 EEPROM_RST_Check_bit = 0;
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("EEPROM RESET FAIL",52,60);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;




 }
 else if( (EEPROM_RST_Check_bit == 1) && ( EEPROM_Reset_Attempt_Count_bit == 2) )
 {
 EEPROM_RST_Check_bit = 0;
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("AGAIN EEPROM RESET FAIL",4,60);
 delay_ms(2000);

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 while( RE7_bit  == 1)
 {
 T6963C_Write_Text_Adv_ROM("PRESS BLACK BUTTON",48,46);
 T6963C_Write_Text_Adv_ROM("PLEASE KINLDY CONTACT", 36, 62);
 T6963C_Write_Text_Adv_ROM("NK AUTOMATION",68,78);
 T6963C_Write_Text_Adv_ROM("PH:9043043037",68,94);
 T6963C_Write_Text_Adv_ROM("MADE IN COIMBATORE",48,110);
 T6963C_Write_Text_Adv_ROM("TAMILNADU INDIA",60,126);
 EEPROM_Reset_Attempt_Count_bit=0;

 }
 break;
 }
 else
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("EEPROM RESET SUCCESS",40,60);
 delay_ms(2000);
 break;
 }

 }



 PEIE_bit = 1;
 GIE_bit = 1;



 Pulse_PickA=0;
 Pulse_PickB=0;
 Pulse_PickC=0;
 Pulse_PickD=0;
 Pulse_PickE=0;
 Pulse_PickF=0;
 Pulse_PickG=0;
 Pulse_PickH=0;
 Pulse_PickI=0;
 Pulse_PickJ=0;
 Pulse_PickK=0;
 Pulse_PickL=0;
 Pulse_PickM=0;
 Pulse_PickN=0;
 Pulse_PickO=0;
 Pulse_PickP=0;

 load_inch(void);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;

 T6963C_Write_Text_Adv_ROM("ALL LOOM METER",64,48);
 T6963C_Write_Text_Adv_ROM("RESETTING DONE",64,64);
 delay_ms(2500);
 return;

 }



void Reset_Loom_One_one(void)
 {

 unsigned int i=0,j=0,k=0;
 unsigned char Inc_Reset=0;

 Save_shiftwise();
 for(i=0;i<=15;i++)
 {
 Inc_Reset=0;
 T6963C_Write_Text_Adv_ROM("RESET LOOM:",76,48);

 T6963C_box(104,64,136,73,  0 );
 GLCD_Print_Int_With_LeadingZero ( (i+Loom_Starting_value) ,112,64);
#line 1407 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 T6963C_Write_Text_Adv_ROM("IF YES PRESS INCH",52,80);
 delay_ms(250);
 j=i*96;


 while(Inc_Reset==0)
 {
 if( RE7_bit ==0)
 {
 load_inch(void);
 delay_ms(500);
 return;
 }
 if( RE4_bit ==0)
 {
 Inc_Reset=1;
 delay_ms(1000);

 }
 if( RE6_bit ==0)
 {
 for(k=j;k<(96+j);k++)
 {
 EEPROM_AT24C32_WrInt( 0X10 +(2*k),0);
 delay_ms(10);
 }
 EEPROM_Write_int(( 0X20 +(2*i)),0);
 delay_ms(100);
 while( RE6_bit ==0)
 delay_ms(100);
 Inc_Reset=1;
 }
 }



 }
 load_inch(void);

 }

void Reset_Shift_One_one(void)
{

unsigned char Reset_loop=0,ColourExit2=0,item=0,SplFlag=0;
static unsigned char Loom_no=1,Shift_no=1;
static unsigned int Colour_Addr,LoomStartAddr,i=0,j=0,k=0,Loom_noA=0;


 Save_shiftwise();
 while(ColourExit2==0)
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("LOOM:NO    SHIFT:NO",30,8);
 delay_ms(1500);

 Loom_no=Loom_Starting_value;
 Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),20,24);

 while(Loom_no<Loom_Starting_value)
 {
 Loom_no=Loom_Starting_value;
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("INVALD VALUE",11,8);
 T6963C_Write_Text_Adv_ROM("FOR THIS BOX",11,24);
 delay_ms(1500);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("LOOM:NO    SHIFT:NO",30,8);
 delay_ms(1500);
 Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),32,24);
 }

 Increment_Decerement(&Shift_no,96,100,24);
 delay_ms(1000);


 Loom_no=(Loom_no-(Loom_Starting_value-1));

 Loom_noA = Loom_no;
 j=(Loom_noA-1)*192;
 LoomStartAddr=j+ 0X10 ;
 k = ((Shift_no-1)*2);

 EEPROM_AT24C32_WrInt((LoomStartAddr+k),0);
 delay_ms(500);

 EEPROM_Write_int(( 0X20 +(2*(Loom_noA-1))),0);
 delay_ms(10);


  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("RESETTING DONE",64,8);
 T6963C_Write_Text_Adv_ROM("PRESS & HOLD BLACK BUTTON",20,24);
 T6963C_Write_Text_Adv_ROM("IF YOU WANT TO EXIT",44,40);
 delay_ms(4000);

 if( RE7_bit ==0)
 {
 ColourExit2=1;
 }

 }

 delay_ms(1000);
 load_inch();

}



void Display_variable_Update_Left_Pulse_picks(void)
{

 unsigned char Inch_Order_Count=0;
 unsigned int Pulse_Pick_Left_Order[8];

 Pulse_Pick_Left_Order[0]=Pulse_PickA;
 Pulse_Pick_Left_Order[1]=Pulse_PickB;
 Pulse_Pick_Left_Order[2]=Pulse_PickC;
 Pulse_Pick_Left_Order[3]=Pulse_PickD;
 Pulse_Pick_Left_Order[4]=Pulse_PickE;
 Pulse_Pick_Left_Order[5]=Pulse_PickF;
 Pulse_Pick_Left_Order[6]=Pulse_PickG;
 Pulse_Pick_Left_Order[7]=Pulse_PickH;

 for(Inch_Order_Count=0 ; Inch_Order_Count < 8; Inch_Order_Count++ )
 {
 T6963C_box(21+Fi_Xpos, 1+Ypos+(13*Inch_Order_Count), 21+Fi_Xpos+19, Ypos+(13*Inch_Order_Count)+10,  0 );
 IntToStr(Pulse_Pick_Left_Order[Inch_Order_Count], Text);
 T6963C_Write_Text_Adv(Text,20+Fi_Xpos ,Ypos+(13*Inch_Order_Count));
 delay_ms(5);
 }


return;
}


void Display_variable_Update_Left_Inches(void)
{
 int Value_int=0;
 unsigned char Inch_Order_Count=0;


 for(Inch_Order_Count=0 ; Inch_Order_Count < 8; Inch_Order_Count++ )
 {
 Value_int= (int)Inch[Inch_Order_Count];
 T6963C_box(44+Fi_Xpos, 1+Ypos+(13*Inch_Order_Count), 44+Fi_Xpos+27, Ypos+(13*Inch_Order_Count)+10,  0 );
 IntToStr(Value_int, Text);
 T6963C_Write_Text_Adv(Text,43+Fi_Xpos ,Ypos+(13*Inch_Order_Count));
 delay_ms(5);

 }


return;
}

void Display_variable_Update_Right_Pulse_picks(void)
{

 unsigned char Inch_Order_Count=0;
 unsigned int Pulse_Pick_Right_Order[8];

 Pulse_Pick_Right_Order[0]=Pulse_PickI;
 Pulse_Pick_Right_Order[1]=Pulse_PickJ;
 Pulse_Pick_Right_Order[2]=Pulse_PickK;
 Pulse_Pick_Right_Order[3]=Pulse_PickL;
 Pulse_Pick_Right_Order[4]=Pulse_PickM;
 Pulse_Pick_Right_Order[5]=Pulse_PickN;
 Pulse_Pick_Right_Order[6]=Pulse_PickO;
 Pulse_Pick_Right_Order[7]=Pulse_PickP;




 for(Inch_Order_Count=0 ; Inch_Order_Count < 8; Inch_Order_Count++ )
 {
 T6963C_box(141+Fi_Xpos, 1+Ypos+(13*Inch_Order_Count), 141+Fi_Xpos+19, Ypos+(13*Inch_Order_Count)+10,  0 );
 IntToStr(Pulse_Pick_Right_Order[Inch_Order_Count], Text);
 T6963C_Write_Text_Adv(Text,138+Fi_Xpos ,Ypos+(13*Inch_Order_Count));
 delay_ms(5);
 }


return;
}

void Display_variable_Update_Right_Inches(void)
{


 int Value_int=0;
 unsigned char Inch_Order_Count=0;

 for(Inch_Order_Count=0 ; Inch_Order_Count < 8; Inch_Order_Count++ )
 {
 Value_int= (int)Inch[Inch_Order_Count + 8];
 T6963C_box(164+Fi_Xpos, 1+Ypos+(13*Inch_Order_Count), 164+Fi_Xpos+27, Ypos+(13*Inch_Order_Count)+10,  0 );
 IntToStr(Value_int, Text);
 T6963C_Write_Text_Adv(Text,163+Fi_Xpos ,Ypos+(13*Inch_Order_Count));
 delay_ms(5);
 }

return;
}


void Variable_Reset(void)
{
 inchA = EEPROM_AT24C32_RdInt(( 0X10 +(2*Shift_value)));
 delay_ms(30);
 inchB = EEPROM_AT24C32_RdInt(( 0XD0 +(2*Shift_value)));
 delay_ms(30);
 inchC = EEPROM_AT24C32_RdInt(( 0X190 +(2*Shift_value)));
 delay_ms(30);
 inchD = EEPROM_AT24C32_RdInt(( 0X250 +(2*Shift_value)));
 delay_ms(30);
 inchE = EEPROM_AT24C32_RdInt(( 0X310 +(2*Shift_value)));
 delay_ms(30);
 inchF = EEPROM_AT24C32_RdInt(( 0X3D0 +(2*Shift_value)));
 delay_ms(30);
 inchG = EEPROM_AT24C32_RdInt(( 0X490 +(2*Shift_value)));
 delay_ms(30);
 inchH = EEPROM_AT24C32_RdInt(( 0X550 +(2*Shift_value)));
 delay_ms(30);
 inchI = EEPROM_AT24C32_RdInt(( 0X610 +(2*Shift_value)));
 delay_ms(30);
 inchJ = EEPROM_AT24C32_RdInt(( 0X6D0 +(2*Shift_value)));
 delay_ms(30);
 inchK = EEPROM_AT24C32_RdInt(( 0X790 +(2*Shift_value)));
 delay_ms(30);
 inchL = EEPROM_AT24C32_RdInt(( 0X850 +(2*Shift_value)));
 delay_ms(30);
 inchM = EEPROM_AT24C32_RdInt(( 0X910 +(2*Shift_value)));
 delay_ms(30);
 inchN = EEPROM_AT24C32_RdInt(( 0X9D0 +(2*Shift_value)));
 delay_ms(30);
 inchO = EEPROM_AT24C32_RdInt(( 0XA90 +(2*Shift_value)));
 delay_ms(30);
 inchP = EEPROM_AT24C32_RdInt(( 0XB50 +(2*Shift_value)));
 delay_ms(30);

 Pulse_PickA=0;
 Pulse_PickB=0;
 Pulse_PickC=0;
 Pulse_PickD=0;
 Pulse_PickE=0;
 Pulse_PickF=0;
 Pulse_PickG=0;
 Pulse_PickH=0;
 Pulse_PickI=0;
 Pulse_PickJ=0;
 Pulse_PickK=0;
 Pulse_PickL=0;
 Pulse_PickM=0;
 Pulse_PickN=0;
 Pulse_PickO=0;
 Pulse_PickP=0;


}

void Next_cyle(void)
{
unsigned char Cycle_exit=0,i=0,j=0;

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 while (Cycle_exit==0)
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;

 T6963C_Write_Text_Adv_ROM("SHIFT CYCLE OVER",56,8);


 T6963C_Write_char_adv(45,1,24 );
 T6963C_Write_char_adv(45,3,24 );
 T6963C_Write_char_adv(62,4,24 );
 T6963C_Write_Text_Adv_ROM("IF OK PRESS[START]",14,24);


 T6963C_Write_Text_Adv_ROM("OR",30,40);


 T6963C_Write_char_adv(45,1,56 );
 T6963C_Write_char_adv(45,3,56 );
 T6963C_Write_char_adv(62,4,56 );
 T6963C_Write_Text_Adv_ROM("PRESS STOP", 14, 56);
 T6963C_Write_Text_Adv_ROM("NOTE: 96th SHIFT", 14, 72);
 T6963C_Write_Text_Adv_ROM("NOTE METER & RESET SHIFT", 14, 88);


 T6963C_Write_char_adv(45,1, 104 );
 T6963C_Write_char_adv(45,3,104 );
 T6963C_Write_char_adv(62,4,104 );
 T6963C_Write_Text_Adv_ROM("PRESS INCH TO RESET ALL LOOM", 14, 104);

 delay_ms(1000);

 if ( RE4_bit ==0)
 {

 Cycle_exit=1;
 Shift_value=0;
 delay_ms(150);
 Variable_Reset();
 delay_ms(150);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("SHIFT CHANGED",80,48);
 GLCD_Print_Int_With_LeadingZero ( (Shift_value+1),112,64);


 delay_ms(2000);
 }

 if ( RE5_bit ==0)
 {
 menushift_sec=0;
 delay_ms(150);
 while( RE5_bit ==0);
 delay_ms(150);
 return;
 }
 if ( RE6_bit  == 0)
 {


  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 Reset_All_Loom();
 delay_ms(200);


 Cycle_exit=1;
 Shift_value=0;
 delay_ms(150);

 delay_ms(150);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("ALL LOOMS RESET DONE",80,32);
 T6963C_Write_Text_Adv_ROM("SHIFT CHANGED",80,48);
 GLCD_Print_Int_With_LeadingZero ( (Shift_value+1),112,64);
 delay_ms(2000);

 }

 }
}


void Set_Date_Time_Rtc(void)
{

unsigned char Reset_loop=0,ColourExit2=0,item=0,SplFlag=0;
static unsigned int i=0,j=0,k=0;


 while(ColourExit2==0)
 {




  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("DATE MONTHS YEAR",56,36);
 delay_ms(500);

 Date=Read_RTC(4);
 Month=Read_RTC(5);
 Year=Read_RTC(6);

 GLCD_Print_Int_With_LeadingZero (Date,64,64);
#line 1782 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 GLCD_Print_Int_With_LeadingZero (Month,112,64);
#line 1787 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 GLCD_Print_Int_With_LeadingZero (Year,156,64);
#line 1791 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 delay_ms(1500);


 Increment_Decerement(&Date,31,64,64);
 delay_ms(1000);
 Increment_Decerement(&Month,12,112,64);
 delay_ms(1000);
 Increment_Decerement(&Year,99,156,64);
 delay_ms(1000);

 Write_RTC(4,Date);
 Write_RTC(5,Month);
 Write_RTC(6,Year);

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("HOUR MINUTES SECONDS",56,36);
 delay_ms(1500);

 Hour=Read_RTC(2);
 Min=Read_RTC(1);
 Sec=Read_RTC(0);

 GLCD_Print_Int_With_LeadingZero (Hour,64,64);
#line 1816 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 GLCD_Print_Int_With_LeadingZero(Min,112,64);
#line 1821 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 GLCD_Print_Int_With_LeadingZero(Sec,168,64);
#line 1826 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 Increment_Decerement(&Hour,24,64,64);
 delay_ms(1000);
 Increment_Decerement(&Min,59,112,64);
 delay_ms(1000);
 Increment_Decerement(&Sec,59,168,64);
 delay_ms(1000);

 Write_RTC(2,Hour);
 Write_RTC(1,Min);
 Write_RTC(0,Sec);

 ColourExit2=1;

 }

 delay_ms(1000);
}

void Read_Date_Time_Rtc(void)
{
 Hour =Read_RTC(2);
 Min =Read_RTC(1);
 Date =Read_RTC(4);
 Month =Read_RTC(5);
 Year =Read_RTC(6);
 delay_ms(400);

}
void Read_Shift_Date_Time(unsigned char Shift_no )
{

 Hour =EEPROM_AT24C32_RdByte(( 0XD00 +(5*(Shift_no-1))+0));
 Min =EEPROM_AT24C32_RdByte(( 0XD00 +(5*(Shift_no-1)+1)));
 Date =EEPROM_AT24C32_RdByte(( 0XD00 +(5*(Shift_no-1)+2)));
 Month =EEPROM_AT24C32_RdByte(( 0XD00 +(5*(Shift_no-1)+3)));
 Year =EEPROM_AT24C32_RdByte(( 0XD00 +(5*(Shift_no-1)+4)));
 delay_ms(400);
}

void Factory_Reset(void)
{
 Power_up_bit=0;
 if(Power_up_bit==0)
 {
 EEPROM_Write( 0x0F ,0xFF);
 LOAD_EEPROM_Param(void);
 Power_up_bit=1;
 }
}


void Increment_Decerement(unsigned char *var,unsigned char limit,unsigned char Pos_x,unsigned char Pos_y)
{

unsigned char dummy=0,dummy1=0xFF;
unsigned char list=0;
unsigned char increment_exit=0;



 T6963C_Display. F1  = 1; T6963C_WriteCommand(T6963C_Display) ;
 T6963C_Display. F0  = 1; T6963C_WriteCommand(T6963C_Display) ;

cposx= (Pos_x/8)+3;
cposy= (Pos_y/8);
T6963C_set_cursor(cposx,cposy);

while((list==0)&&(increment_exit==0))
{
 asm CLRWDT;

 if(( RE4_bit ==0) && (*var<limit))
 {
 delay_ms(150);
 if(*var<=240)
 {

 *var=*var+10;
 T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9,  0 );
 GLCD_Print_Int_With_LeadingZero(dummy,Pos_x,Pos_y);
#line 1911 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 dummy1=dummy;
 }
 else
 {
 *var=limit;
 T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9,  0 );
 GLCD_Print_Int_With_LeadingZero(dummy ,Pos_x,Pos_y);
#line 1922 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 dummy1=dummy;
 }

 if(*var>=limit)
 *var=limit;
 }

 if(( RE5_bit ==0)&&(*var>0)&&( RE4_bit ==1))
 {
 {
 delay_ms(150);
 *var=*var-1;
 }

 T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9,  0 );
 GLCD_Print_Int_With_LeadingZero(dummy,Pos_x,Pos_y);
#line 1943 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 dummy1=dummy;
 }

 if(( RE7_bit ==0)&&(*var>0)&&( RE4_bit ==1))
 {
 {
 delay_ms(150);
 *var=0;
 }

 T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9,  0 );
 GLCD_Print_Int_With_LeadingZero(dummy,Pos_x,Pos_y);
#line 1960 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 dummy1=dummy;

 }
 if( RE6_bit ==0)
 {
  T6963C_Display. F1  = 0; T6963C_WriteCommand(T6963C_Display) ;
 ColourExit++;
 list=1;
 increment_exit=1;
 delay_ms(350);
 while( RE6_bit ==0);
 delay_ms(350);
 return;
 }

 dummy=*var;

 if((dummy!=dummy1) || (dummy1==0xFFFF))
 {
 T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9,  0 );
 GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);
#line 1985 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 dummy1=dummy;
 }
 }
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
}


void Increment_Decerement_Char(unsigned char *var,unsigned char limit,unsigned char Pos_x,unsigned char Pos_y)
{

unsigned char dummy=0,dummy1=0xFF;
unsigned char list=0;
unsigned char increment_exit=0;


 T6963C_Display. F1  = 1; T6963C_WriteCommand(T6963C_Display) ;
 T6963C_Display. F0  = 1; T6963C_WriteCommand(T6963C_Display) ;

cposx= (Pos_x/8)+3;
cposy= (Pos_y/8);
T6963C_set_cursor(cposx,cposy);


while((list==0)&&(increment_exit==0))
{
 asm CLRWDT;
 if(( RE4_bit ==0) && (*var<limit))
 {
 delay_ms(150);

 if(*var<=240)
 {
 *var=*var+10;

 T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9,  0 );
 GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);
#line 2026 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 }
 else
 {
 *var=limit;
 GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);
#line 2035 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 }

 if(*var>=limit)
 *var=limit;
 }
 if(( RE5_bit ==0)&&(*var>0)&&( RE4_bit ==1))
 {
 {
 delay_ms(150);
 *var=*var-1;
 }
 T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9,  0 );
 GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);
#line 2052 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 }


 if(( RE7_bit ==0)&&(*var>0)&&( RE4_bit ==1))
 {
 {
 delay_ms(150);
 *var=0;
 }

 T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9,  0 );
 GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);
#line 2068 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 dummy1=dummy;

 }
 if( RE6_bit ==0)
 {
  T6963C_Display. F1  = 0; T6963C_WriteCommand(T6963C_Display) ;
 ColourExit++;
 list=1;
 increment_exit=1;
 delay_ms(350);
 while( RE6_bit ==0);
 delay_ms(350);
 return;
 }


 dummy=*var;

 if((dummy!=dummy1) || (dummy1==0xFFFF))
 {

 T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9,  0 );
 GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);
#line 2096 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 dummy1=dummy;
 }

 }
 T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
}



void Increment_Decerement_Float(float *var, float limit,unsigned char Pos_x,unsigned char Pos_y)
{
bit first_time;
float dummy=0,dummy1=-9999.0;
unsigned char list=0;
unsigned char increment_exit=0;


 T6963C_Display. F1  = 1; T6963C_WriteCommand(T6963C_Display) ;
 T6963C_Display. F0  = 1; T6963C_WriteCommand(T6963C_Display) ;

cposx= (Pos_x/8)+3;
cposy= (Pos_y/8);
T6963C_set_cursor(cposx,cposy);
#line 2125 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 first_time=1;

while( (list == 0 ) && (increment_exit == 0) )
{
 asm CLRWDT;
 T6963C_Write_Text_Adv_ROM("RUPEES=",80, 64);
 T6963C_set_cursor(23,8);

 if( ( RE4_bit ==0) && (*var < limit) )
 {
 delay_ms(150);

 if(*var <= 240.0)
 {
 *var=*var + 0.5;
 dummy = *var;

 T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9,  0 );

 FloatToStr_SingleDecimal(dummy,Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text,Pos_x,Pos_y);
 Glcd_Buffer_Clear();

 }
 else
 {
#line 2156 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 *var=limit;
 dummy = *var;
 T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9,  0 );

 FloatToStr_SingleDecimal(dummy,Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text,Pos_x,Pos_y);
 Glcd_Buffer_Clear();
 }

 if(*var>=limit)
 *var=limit;
 }


 if(( RE5_bit ==0)&&(*var > 0.0 )&&( RE4_bit ==1))
 {
 delay_ms(150);
 *var=*var-0.1;
 dummy = *var;

 T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9,  0 );

 FloatToStr_SingleDecimal(dummy,Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text,Pos_x,Pos_y);
 Glcd_Buffer_Clear();

 if(*var < 0.0)
 {
 *var=0.0;
 }
 }



 if(( RE7_bit ==0)&&(*var>0)&&( RE4_bit ==1))
 {

 delay_ms(150);
 *var=0;
 dummy = *var;
 T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9,  0 );

 FloatToStr_SingleDecimal(dummy,Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text,Pos_x,Pos_y);
 Glcd_Buffer_Clear();

 dummy1=dummy;

 }


 if( RE6_bit ==0)
 {
 if( *var <= 0)
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("INVALID VALUE",60,60);
 T6963C_set_cursor(23,8);
 delay_ms(2000);
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;


 dummy =*var;
 T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9,  0 );
 FloatToStr_SingleDecimal(dummy, Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text, Pos_x, Pos_y);
 Glcd_Buffer_Clear();
 }
 else
 {
 ColourExit++;
 list=1;
 increment_exit=1;
 delay_ms(350);
 while( RE6_bit ==0);
 delay_ms(350);
 return;
 }
 }


 dummy=*var;


 if(first_time == 1 || (dummy != dummy1))
 {
 T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9,  0 );
 FloatToStr_SingleDecimal(dummy, Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text, Pos_x, Pos_y);
 Glcd_Buffer_Clear();

 dummy1 = dummy;
 first_time = 0;
 }

 }

 T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
}
#line 2324 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
void FloatToStr_SingleDecimal(float num, char *str)
{
 long value10;
 long intPart;
 int decPart;
 int idx = 0;


 if(num < 0)
 {
 str[idx++] = '-';
 num = -num;
 }


 value10 = (long)(num * 10.0);

 intPart = value10 / 10;
 decPart = value10 % 10;


 if(intPart >= 1000)
 {
 str[idx++] = (intPart / 1000) + '0';
 str[idx++] = ((intPart / 100) % 10) + '0';
 str[idx++] = ((intPart / 10) % 10) + '0';
 str[idx++] = (intPart % 10) + '0';
 }
 else if(intPart >= 100)
 {
 str[idx++] = (intPart / 100) + '0';
 str[idx++] = ((intPart / 10) % 10) + '0';
 str[idx++] = (intPart % 10) + '0';
 }
 else if(intPart >= 10)
 {
 str[idx++] = (intPart / 10) + '0';
 str[idx++] = (intPart % 10) + '0';
 }
 else
 {
 str[idx++] = intPart + '0';
 }


 str[idx++] = '.';


 str[idx++] = decPart + '0';


 str[idx] = '\0';
}



void MulFloat_To1DecimalStr(float A, float B, char *out)
{
 long A10, B10;
 long result100;
 long result10;
 long intPart;
 int decPart;
 char buf[12];



 A10 = (long)(A * 10.0f + 0.0001f);
 B10 = (long)(B * 10.0f + 0.0001f);


 result100 = A10 * B10;


 result10 = result100 / 10;


 if(result10 < 0)
 {
 *out++ = '-';
 result10 = -result10;
 }


 intPart = result10 / 10;
 decPart = result10 % 10;


 LongToStr(intPart, buf);
 Ltrim(buf);
 strcpy(out, buf);


 strcat(out, ".");
 out = out + strlen(out);
 *out++ = decPart + '0';
 *out = '\0';
}



void Glcd_Buffer_Clear()
{
 unsigned char Clear_Count=0;

 for(Clear_Count=0 ; Clear_Count < sizeof(Text); Clear_Count++)
 {
 Text[Clear_Count]='\0';
 }

}






void Glcd_Out_ROM(const char *text, unsigned short X_pixel, unsigned short Y_pixel)
{
 char temp;



 while ((temp = *text++) != '\0')
 {


 T6963C_Write_char_Adv(temp ,X_pixel,Y_pixel);
 X_pixel= X_pixel+8;

 if (X_pixel > 240)
 {
 break;
 }
 }
}
#line 2465 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
void GLCD_Print_Int_With_LeadingZero(unsigned short value,unsigned short x,unsigned short y)
{

 IntToStr(value, text);
 Ltrim(text);

 if(value < 10)
 {
 T6963C_Write_Text_Adv_ROM("0", x, y);
 T6963C_Write_Text_Adv(text, x + 8, y);
 }
 else if(value >= 10)
 {
 T6963C_Write_Text_Adv(text, x, y);
 }
 Glcd_Buffer_Clear();
}

unsigned char GLCD_CharWidth(unsigned char ch)
{

 if(ch < 32) return 0;
 if(ch > 127) return 6;

 switch(ch)
 {

 case ' ': return 8;


 case '!': return 2;
 case '"': return 4;
 case '#': return 6;
 case '$': return 6;
 case '%': return 8;
 case '&': return 7;
 case '\'': return 2;
 case '(': return 3;
 case ')': return 3;
 case '*': return 4;
 case '+': return 6;
 case ',': return 2;
 case '-': return 4;
 case '.': return 2;
 case '/': return 4;


 case '0': return 6;
 case '1': return 4;
 case '2': return 6;
 case '3': return 6;
 case '4': return 6;
 case '5': return 6;
 case '6': return 6;
 case '7': return 6;
 case '8': return 6;
 case '9': return 6;


 case ':': return 2;
 case ';': return 2;
 case '<': return 6;
 case '=': return 6;
 case '>': return 6;
 case '?': return 6;
 case '@': return 8;


 case 'A': return 7;
 case 'B': return 7;
 case 'C': return 7;
 case 'D': return 7;
 case 'E': return 7;
 case 'F': return 7;
 case 'G': return 7;
 case 'H': return 6;
 case 'I': return 2;
 case 'J': return 5;
 case 'K': return 8;
 case 'L': return 7;
 case 'M': return 10;
 case 'N': return 8;
 case 'O': return 9;
 case 'P': return 7;
 case 'Q': return 9;
 case 'R': return 8;
 case 'S': return 5;
 case 'T': return 8;
 case 'U': return 8;
 case 'V': return 8;
 case 'W': return 9;
 case 'X': return 7;
 case 'Y': return 7;
 case 'Z': return 7;


 case '[': return 3;
 case '\\': return 4;
 case ']': return 3;
 case '^': return 4;
 case '_': return 6;
 case '`': return 3;


 case 'a': return 6;
 case 'b': return 6;
 case 'c': return 6;
 case 'd': return 7;
 case 'e': return 6;
 case 'f': return 4;
 case 'g': return 6;
 case 'h': return 6;
 case 'i': return 1;
 case 'j': return 3;
 case 'k': return 6;
 case 'l': return 1;
 case 'm': return 10;
 case 'n': return 8;
 case 'o': return 6;
 case 'p': return 6;
 case 'q': return 6;
 case 'r': return 4;
 case 's': return 6;
 case 't': return 4;
 case 'u': return 6;
 case 'v': return 6;
 case 'w': return 9;
 case 'x': return 6;
 case 'y': return 6;
 case 'z': return 6;


 case '{': return 4;
 case '|': return 2;
 case '}': return 4;
 case '~': return 6;


 case 127: return 0;

 default:
 return 6;
 }
}






void T6963C_Write_Text_Adv_ROM(const code char *text,
 unsigned char x,
 unsigned char y)
{


 unsigned char ch;
 unsigned char col = x;



 while (*text)
 {
 ch =*text;
 T6963C_write_char_adv(ch, col, y);
 text++;

 col +=8;
 delay_us(10);

 if (col >= 240)
 {
 break;
 }
 }
}




void Loading_Fill(unsigned char percent)
{
 int x0 = 81;
 int y0 = 104;
 int x1 = 160;
 int y1 = 90;

 int fillX = x0 + ((x1 - x0) * percent) / 100;



 T6963C_box(108, 72, 132,80,  0 );

 GLCD_Print_Int_With_LeadingZero(percent , 108 , 72 );
 T6963C_Write_Text_Adv_ROM("%",123,72);
 delay_ms(10);


 T6963C_box(x0, y0, fillX, y1,  0b1000 );


}



void Verify_EEPROM_Data_Clear()
{

 unsigned int i=0,j=0,k=0;

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("CHECKING DATA..",60,60);








 T6963C_rectangle(80,104, 160, 90 ,  0b1000 );

 for (i=0 ;i<16 ;i++)
 {
 j=i*96;

 for(k=j ; k< (96+j) ; k++)
 {
 Loading_Fill(i+50);
 EEPROM_Value_Read_Check = EEPROM_AT24C32_RdInt( 0X10 +(2*k));
 delay_ms(10);
 if( 0 != EEPROM_Value_Read_Check )
 {
 EEPROM_RST_Check_bit=1;
 break;
 }

 }
 }

 for(i=0;i<16;i++)
 {

 Loading_Fill(i+84);
 EEPROM_Value_Read_Check=EEPROM_Read_int(( 0X20 +(2*i)));
 delay_ms(10);
 if( 0 != EEPROM_Value_Read_Check )
 {
 EEPROM_RST_Check_bit=1;
 break;
 }
 }
#line 2744 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 if(EEPROM_RST_Check_bit == 1 && EEPROM_Reset_Attempt_Count_bit == 0 )
 {
 EEPROM_Reset_Attempt_Count_bit=1;
 }
 else if(EEPROM_RST_Check_bit == 1 && EEPROM_Reset_Attempt_Count_bit == 1)
 {

 EEPROM_Reset_Attempt_Count_bit=2;

 }





}


void Left_Side_Meter_Update()
{


 for( i=0 ;i < 8 ; i++)
 {
 asm CLRWDT;
 Meter[i]=( (float)(0.0254*Inch[i] ));
 T6963C_box(75+Fi_Xpos, 1+Ypos+(13*i), 75+Fi_Xpos+35, Ypos+(13*i)+10,  0 );
 FloatToStr_SingleDecimal(Meter[i],Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text,82+Fi_Xpos ,Ypos+(13*i));
 Glcd_Buffer_Clear();
 delay_ms(5);
 }

 delay_ms(5);
}


void Left_Side_Meter_PAY_Update()
{
#line 2799 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Control_Fn.c"
 for( i=0 ;i < 8 ; i++)
 {
 asm CLRWDT;


 T6963C_box(44+Fi_Xpos, 1+Ypos+(13*i), 44+Fi_Xpos+27, Ypos+(13*i)+10,  0 );
 MulFloat_To1DecimalStr(Meter[i] , Pay_Value , Text);

 T6963C_Write_Text_Adv(Text,52+Fi_Xpos ,Ypos+(13*i));
 delay_ms(5);
 }

 delay_ms(5);
}


void Right_Side_Meter_Update()
{

 for( i= 0 ;i < 8 ; i++)
 {
 asm CLRWDT;


 Meter [i+8]=( (float)(0.0254*Inch[i+8] ));
 T6963C_box(195+Fi_Xpos, 1+Ypos+(13*i), 195+Fi_Xpos+35, Ypos+(13*i)+10,  0 );
 FloatToStr_SingleDecimal(Meter [i+8],Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text,204+Fi_Xpos ,Ypos+(13*i));
 Glcd_Buffer_Clear();
 delay_ms(5);
 }
 delay_ms(5);
}


void Right_Side_Meter_PAY_Update()
{

 for( i= 0 ;i < 8 ; i++)
 {
 asm CLRWDT;

 Value_float= (float)Meter [i+8] * (float) Pay_Value;
 T6963C_box(164+Fi_Xpos, 1+Ypos+(13*i), 164+Fi_Xpos+27, Ypos+(13*i)+10,  0 );
 MulFloat_To1DecimalStr(Meter[i+8] , Pay_Value , Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text,173+Fi_Xpos ,Ypos+(13*i));
 Glcd_Buffer_Clear();
 Value_float=0;
 delay_ms(5);
 }
 delay_ms(5);
}




void Left_Side_Pick_Update()
{

 for( i=0 ;i < 8 ; i++)
 {
 asm CLRWDT;
 Picks[i]= (float) ( Picks4inch [i] * Inch[i] );

 T6963C_box(75+Fi_Xpos, 1+Ypos+(13*i), 75+Fi_Xpos+35, Ypos+(13*i)+10,  0 );
 LongToStr( (long)Picks[i],Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text,78+Fi_Xpos ,Ypos+(13*i));
 Glcd_Buffer_Clear();
 delay_ms(5);
 }
 delay_ms(5);
}


void Left_Side_Pick_Pay_Update()
{

 for( i=0 ;i < 8 ; i++)
 {
 asm CLRWDT;
 T6963C_box(44+Fi_Xpos, 1+Ypos+(13*i), 44+Fi_Xpos+27, Ypos+(13*i)+10,  0 );
 MulFloat_To1DecimalStr( Picks[i] , Pay_Value , Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text,50+Fi_Xpos ,Ypos+(13*i));
 delay_ms(5);
 }
 delay_ms(5);
}




void Right_Side_Pick_Update()
{


 for( i= 0 ;i < 8 ; i++)
 {
 asm CLRWDT;

 Picks[i+8]= (float) (Picks4inch [i+8] * Inch[i+8] );
 T6963C_box(195+Fi_Xpos, 1+Ypos+(13*i), 195+Fi_Xpos+35, Ypos+(13*i)+10,  0 );
 LongToStr( (long)Picks[i+8],Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text, 196+Fi_Xpos ,Ypos+(13*i));
 Glcd_Buffer_Clear();
 delay_ms(5);
 }
 delay_ms(5);
}


void Right_Side_Pick_Pay_Update()
{


 for( i= 0 ;i < 8 ; i++)
 {
 asm CLRWDT;
 T6963C_box(164+Fi_Xpos, 1+Ypos+(13*i), 164+Fi_Xpos+27, Ypos+(13*i)+10,  0 );

 MulFloat_To1DecimalStr( Picks[i+8] , Pay_Value , Text);
 Ltrim(Text);
 T6963C_Write_Text_Adv(Text,170+Fi_Xpos ,Ypos+(13*i));
 Glcd_Buffer_Clear();
 delay_ms(5);
 }

 delay_ms(5);
}
