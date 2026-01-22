#line 1 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Setup.c"
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
#line 13 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Setup.c"
sbit T6963C_ctrlce at LATJ2_bit;
sbit T6963C_ctrlfs at LATB5_bit;
sbit T6963C_ctrlmd at LATH2_bit;

sbit T6963C_ctrlce_Direction at TRISJ2_bit;
sbit T6963C_ctrlfs_Direction at TRISB5_bit;
sbit T6963C_ctrlmd_Direction at TRISH2_bit;

extern unsigned char panel;
extern unsigned char curs;
extern unsigned char cposx, cposy;

extern void Update_EEPROM_PwrFail(unsigned char Type);

unsigned rx char MODE=0;

unsigned int Picks4inchA,Picks4inchB,Picks4inchC,Picks4inchD,Picks4inchE,Picks4inchF,Picks4inchG;
unsigned int Picks4inchH,Picks4inchI,Picks4inchJ,Picks4inchK,Picks4inchL,Picks4inchM,Picks4inchN;
unsigned int Picks4inchO,Picks4inchP;

unsigned int Pulse_PickA,Pulse_PickB,Pulse_PickC,Pulse_PickD,Pulse_PickE,Pulse_PickF,Pulse_PickG;
unsigned int Pulse_PickH,Pulse_PickI,Pulse_PickJ,Pulse_PickK,Pulse_PickL,Pulse_PickM,Pulse_PickN;
unsigned int Pulse_PickO,Pulse_PickP;


unsigned int Disp_inch,Disp_Pulse_Pick,Disp_Picks4inch;
unsigned long Disp_Beam;

unsigned char Hour=0,Min=0,Sec=0,Date=0,Month=0,Year=0;

unsigned char ColourExit=0;
unsigned char menu_sec=0, exit2=1,exit1=1,menu_item=0;
unsigned char menushift_sec=0,menushift_item=0,exit3=1,exit4=1;





float inchA,inchB,inchC,inchD,inchE,inchF,inchG,inchH,inchI,inchJ,inchK,inchL,inchM,inchN,inchO,inchP;
float Inch[17];
extern unsigned int Picks4inch[17];


unsigned long Beam_inchA,Beam_inchB,Beam_inchC,Beam_inchD,Beam_inchE,Beam_inchF,Beam_inchG;
unsigned long Beam_inchH,Beam_inchI,Beam_inchJ,Beam_inchK,Beam_inchL,Beam_inchM,Beam_inchN;
unsigned long Beam_inchO,Beam_inchP;

unsigned int Fi_Xpos=0,Se_Xpos=0,Ypos=0;

unsigned char Shift_value=0;
unsigned char Loom_value=0;
unsigned char Loom_Starting_value=1;


unsigned int count=0,countA=0,countB=0;
bit ProductionA_bit,ProductionB_bit,ProductionC_bit,ProductionD_bit,ProductionE_bit,ProductionF_bit;
bit ProductionG_bit,ProductionH_bit,ProductionI_bit,ProductionJ_bit,ProductionK_bit,ProductionL_bit;
bit ProductionM_bit,ProductionN_bit,ProductionO_bit,ProductionP_bit;

extern float production,Beam_production;

short update_sec;
bit lcd_update;
bit Power_up_bit;

bit PowerFail_Enable_bit;

 char Text[16];

const code char NK_LOGO_BANNER[];


extern bit Power_up_bit;
extern bit PowerFail_Enable_bit;
extern bit PowerFail_Done_bit;

const char tem[]="VALUE";

volatile unsigned char Time_count = 0;
volatile bit one_sec_flag;
bit RST_BIT;

extern bit EEPROM_Reset_Attempt_Count_bit;

 bit EEPROM_RST_Check_bit;

unsigned char temp_value=5;


extern bit Meter_Or_Picks_Sel;
extern bit Inch_Or_Pay_Sel;

float Pay_Value=0.0;

unsigned int i=0;
float Value_float=0;


char TEMP_FLOAT[17];

extern Button_Hold_Bit;

void MCU_Config(void)
{
 if(Power_up_bit==0)
 {


 EEPROM_Reset_Attempt_Count_bit=0;

 IO_Config();

 LCD_Config();


  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("LCD CHECKED",76,60);
 delay_ms(5);

 EEPROM_AT24C32_Init();
 delay_ms(1000);



 EEPROM_Config();
 delay_ms(300);

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("MEMORY INTACT",68,60);
 delay_ms(500);

 Interrupt_Init();

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("EVENT INTIALIZED",56,60);
 delay_ms(500);

 Power_up_bit=1;
 PowerFail_Done_bit=0;
 PowerFail_Enable_bit=0;
 one_sec_flag=0;
 RST_BIT=0;
 EEPROM_RST_Check_bit=0;
 Button_Hold_Bit=0;

 }
}

void IO_Config(void)
{
 ADCON0 = 0X00;
 ADCON1 = 0X00;
 ADCON2 = 0X00;


 ANCON0 = 0X00;
 ANCON1 = 0X00;
 ANCON2 = 0X00;

 CM1CON=0;
 CM2CON=0;
 CM3CON=0;

 LCDCON=0X40;
 LCDPS =0x00;
 LCDREF=0x00;
 LCDRL =0x00;

 LCDSE0=0x00;
 LCDSE1=0x00;
 LCDSE2=0x00;
 LCDSE3=0x00;
 LCDSE4=0x00;
 LCDSE5=0x00;

 LCDDATA0=0x00;
 LCDDATA1=0x00;
 LCDDATA2=0x00;
 LCDDATA3=0x00;
 LCDDATA4=0x00;
 LCDDATA5=0x00;
 LCDDATA6=0x00;
 LCDDATA7=0x00;
 LCDDATA8=0x00;
 LCDDATA9=0x00;
 LCDDATA10=0x00;
 LCDDATA11=0x00;
 LCDDATA12=0x00;
 LCDDATA13=0x00;
 LCDDATA14=0x00;
 LCDDATA15=0x00;
 LCDDATA16=0x00;
 LCDDATA17=0x00;
 LCDDATA18=0x00;
 LCDDATA19=0x00;
 LCDDATA20=0x00;
 LCDDATA21=0x00;
 LCDDATA22=0x00;
 LCDDATA23=0x00;
 LCDDATA23=0x00;

 CTMUCONH=0x00;
 CTMUCONL=0x00;
 CTMUICON=0x00;


CMP1MD_bit=0;
CMP2MD_bit=0;
CMP3MD_bit=0;



PowerFail_Enable_bit=0;

 SSP1CON1=0;


 TRISA = 0B11111111;
 TRISB = 0B11000001;
 TRISC = 0B00100111;
 TRISD = 0B00000000;
 TRISE = 0B11111100;
 TRISF = 0B01111010;
 TRISG = 0B00001000;
 TRISH = 0B00010011;
 TRISJ = 0B11110000;

 PORTA=0x00;
 PORTB=0x00;
 PORTC=0x00;
 PORTD=0x00;
 PORTE=0X00;
 PORTF=0X00;
 PORTG=0X00;
 PORTH=0X00;
 PORTJ=0X00;
#line 260 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Setup.c"
ProductionA_bit=0;
ProductionB_bit=0;
ProductionC_bit=0;
ProductionD_bit=0;
ProductionE_bit=0;
ProductionF_bit=0;
ProductionG_bit=0;
ProductionH_bit=0;
ProductionI_bit=0;
ProductionJ_bit=0;
ProductionK_bit=0;
ProductionL_bit=0;
ProductionM_bit=0;
ProductionN_bit=0;
ProductionO_bit=0;
ProductionP_bit=0;

  LATB3_bit =0;
  LATB2_bit =0;
  LATG4_bit =1;
}

void LCD_Config(void)
{
 unsigned char block_count=0;

 T6963C_ctrlce_Direction = 0;
 T6963C_ctrlce = 0;
 T6963C_ctrlfs_Direction = 0;
 T6963C_ctrlfs = 0;
 T6963C_ctrlmd_Direction = 0;
 T6963C_ctrlmd = 0;

 panel = 0;
 curs = 0;
 cposx = cposy = 0;

 T6963C_init(240, 128, 8);
  T6963C_Display. F3  = 1; T6963C_WriteCommand(T6963C_Display) ;
  T6963C_Display. F2  = 1; T6963C_WriteCommand(T6963C_Display) ;
#line 307 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Setup.c"
  T6963C_SetPtr(0x0000, 0b10100111  & (0b11111000 + 7)) ;

  T6963C_Display. F1  = 0; T6963C_WriteCommand(T6963C_Display) ;


  T6963C_Display. F0  = 1; T6963C_WriteCommand(T6963C_Display) ;

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
  T6963C_GrHomeAddr = (T6963C_GrMemSize + T6963C_TxtMemSize)  * 1 ;

 T6963C_image(NK_LOGO_BANNER);
  T6963C_SetPtr( (T6963C_GrMemSize + T6963C_TxtMemSize)  * 1, 0b01000010 ) ;
 Delay_ms(3000);


  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;

 T6963C_Write_Text_Adv_ROM("NK",112,24);
 T6963C_Write_Text_Adv_ROM("AUTOMATION",80,40);
 T6963C_Write_Text_Adv_ROM("PH:9043043037",68,56);
 T6963C_Write_Text_Adv_ROM("MADE IN COIMBATORE",48,72);
 T6963C_Write_Text_Adv_ROM("TAMILNADU INDIA",60,88);

 delay_ms(3000);
#line 368 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Setup.c"
}




void Interrupt_Init(void)
{


 TMR1IF_bit = 0;
 T1CON = 0x11;
 TMR1H = 0x63;
 TMR1L = 0xC0;
 TMR1IE_bit = 1;
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("TIMER CHECKED",68,60);
 delay_ms(1000);


 TRISB.B0 = 1;
 INTCON2.INTEDG0 = 1;
 INTCON.INT0IF = 0;
 INTCON.INT0IE = 1;



 RCON.IPEN = 0;
 PEIE_bit = 1;
 GIE_bit = 1;
}



void EEPROM_Config(void)
{
 LOAD_EEPROM_Param();
}




void interrupt()
{





 if (TMR1IF_bit)
 {
 TMR1IF_bit = 0;
 TMR1H = 0x63;
 TMR1L = 0xC0;
 count++;
 countA++;
 countB++;






 if(count>=4000)
 {
 count=0;
 asm CLRWDT;
 Lcd_update=1;
 }

 if(countA>=250)
 {
 countA=0;
 asm CLRWDT;
 }
 if(countB>=1000)
 {
 countB=0;
 asm CLRWDT;
 }


 if(( RH4_bit ==0)&&(ProductionA_bit==0))
 {
 ProductionA_bit=1;
 }
 if(( RH4_bit ==1)&&(ProductionA_bit==1))
 {
 Pulse_PickA++;
 ProductionA_bit=0;
 if(Pulse_PickA>=Picks4inchA)
 {inchA=inchA+1;Pulse_PickA=0;}
 }

 if(( RF1_bit ==0)&&(ProductionB_bit==0))
 {
 ProductionB_bit=1;
 }
 if(( RF1_bit ==1)&&(ProductionB_bit==1))
 {
 Pulse_PickB++;
 ProductionB_bit=0;
 if(Pulse_PickB>=Picks4inchB)
 {inchB=inchB+1;Pulse_PickB=0;}
 }
 if(( RA3_bit ==0)&&(ProductionC_bit==0))
 {
 ProductionC_bit=1;
 }
 if(( RA3_bit ==1)&&(ProductionC_bit==1))
 {
 Pulse_PickC++;
 ProductionC_bit=0;
 if(Pulse_PickC>=Picks4inchC)
 {inchC=inchC+1;Pulse_PickC=0;}
 }
 if(( RA2_bit ==0)&&(ProductionD_bit==0))
 {
 ProductionD_bit=1;
 }
 if(( RA2_bit ==1)&&(ProductionD_bit==1))
 {
 Pulse_PickD++;
 ProductionD_bit=0;
 if(Pulse_PickD>=Picks4inchD)
 {inchD=inchD+1;Pulse_PickD=0;}
 }

 if(( RA1_bit ==0)&&(ProductionE_bit==0))
 {
 ProductionE_bit=1;
 }
 if(( RA1_bit ==1)&&(ProductionE_bit==1))
 {
 Pulse_PickE++;
 ProductionE_bit=0;
 if(Pulse_PickE>=Picks4inchE)
 {inchE=inchE+1;Pulse_PickE=0;}
 }

 if(( RA0_bit ==0)&&(ProductionF_bit==0))
 {
 ProductionF_bit=1;
 }
 if(( RA0_bit ==1)&&(ProductionF_bit==1))
 {
 Pulse_PickF++;
 ProductionF_bit=0;
 if(Pulse_PickF>=Picks4inchF)
 {inchF=inchF+1;Pulse_PickF=0;}
 }

 if(( RA5_bit ==0)&&(ProductionG_bit==0))
 {
 ProductionG_bit=1;
 }
 if(( RA5_bit ==1)&&(ProductionG_bit==1))
 {
 Pulse_PickG++;
 ProductionG_bit=0;
 if(Pulse_PickG>=Picks4inchG)
 {inchG=inchG+1;Pulse_PickG=0;}
 }

 if(( RA4_bit ==0)&&(ProductionH_bit==0))
 {
 ProductionH_bit=1;
 }
 if(( RA4_bit ==1)&&(ProductionH_bit==1))
 {
 Pulse_PickH++;
 ProductionH_bit=0;
 if(Pulse_PickH>=Picks4inchH)
 {inchH=inchH+1;Pulse_PickH=0;}
 }

 if(( RC1_bit ==0)&&(ProductionI_bit==0))
 {
 ProductionI_bit=1;
 }
 if(( RC1_bit ==1)&&(ProductionI_bit==1))
 {
 Pulse_PickI++;
 ProductionI_bit=0;
 if(Pulse_PickI>=Picks4inchI)
 {inchI=inchI+1;Pulse_PickI=0;}
 }

 if(( RC0_bit ==0)&&(ProductionJ_bit==0))
 {
 ProductionJ_bit=1;
 }
 if(( RC0_bit ==1)&&(ProductionJ_bit==1))
 {
 Pulse_PickJ++;
 ProductionJ_bit=0;
 if(Pulse_PickJ>=Picks4inchJ)
 {inchJ=inchJ+1;Pulse_PickJ=0;}
 }

 if(( RJ4_bit ==0)&&(ProductionK_bit==0))
 {
 ProductionK_bit=1;
 }
 if(( RJ4_bit ==1)&&(ProductionK_bit==1))
 {
 Pulse_PickK++;
 ProductionK_bit=0;
 if(Pulse_PickK>=Picks4inchK)
 {inchK=inchK+1;Pulse_PickK=0;}
 }

 if(( RJ5_bit ==0)&&(ProductionL_bit==0))
 {
 ProductionL_bit=1;
 }
 if(( RJ5_bit ==1)&&(ProductionL_bit==1))
 {
 Pulse_PickL++;
 ProductionL_bit=0;
 if(Pulse_PickL>=Picks4inchL)
 {inchL=inchL+1;Pulse_PickL=0;}
 }

 if(( RJ6_bit ==0)&&(ProductionM_bit==0))
 {
 ProductionM_bit=1;
 }
 if(( RJ6_bit ==1)&&(ProductionM_bit==1))
 {
 Pulse_PickM++;
 ProductionM_bit=0;
 if(Pulse_PickM>=Picks4inchM)
 {inchM=inchM+1;Pulse_PickM=0;}
 }

 if(( RJ7_bit ==0)&&(ProductionN_bit==0))
 {
 ProductionN_bit=1;
 }
 if(( RJ7_bit ==1)&&(ProductionN_bit==1))
 {
 Pulse_PickN++;
 ProductionN_bit=0;
 if(Pulse_PickN>=Picks4inchN)
 {inchN=inchN+1;Pulse_PickN=0;}
 }

 if(( RC2_bit ==0)&&(ProductionO_bit==0))
 {
 ProductionO_bit=1;
 }
 if(( RC2_bit ==1)&&(ProductionO_bit==1))
 {
 Pulse_PickO++;
 ProductionO_bit=0;
 if(Pulse_PickO>=Picks4inchO)
 {inchO=inchO+1;Pulse_PickO=0;}
 }

 if(( RC5_bit ==0)&&(ProductionP_bit==0))
 {
 ProductionP_bit=1;
 }
 if(( RC5_bit ==1)&&(ProductionP_bit==1))
 {
 Pulse_PickP++;
 ProductionP_bit=0;
 if(Pulse_PickP>=Picks4inchP)
 {inchP=inchP+1;Pulse_PickP=0;}
 }


 }


 if(INTCON.INT0IF)
 {
 if( (Power_up_bit == 1) && (PowerFail_Done_bit == 0) )
 {
 PowerFail_Enable_bit=1;
 }
 INTCON.INT0IF = 0;
 }
 }







 void Meter_Or_Picks_Method()
{
 unsigned char Meter_Or_Picks_Exit = 1;
 unsigned char Meter_Or_Picks_Option = 1;
 unsigned char Refresh_Screen = 1;

 while( RE6_bit  == 0);

 while(Meter_Or_Picks_Exit == 1)
 {

 if(Refresh_Screen == 1)
 {
 Refresh_Screen=0;

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("METER",11,8);
 T6963C_Write_Text_Adv_ROM("PICKS",11,24);

 if(Meter_Or_Picks_Option == 1)
 {
 T6963C_Write_char_adv(45,0,8);
 T6963C_Write_char_adv(45,2,8);
 T6963C_Write_char_adv(62,3,8);
 T6963C_set_cursor(7,1);
 }
 else if(Meter_Or_Picks_Option == 2)
 {
 T6963C_Write_char_adv(45,0,24);
 T6963C_Write_char_adv(45,2,24);
 T6963C_Write_char_adv(62,3,24);
 T6963C_set_cursor(7,3);
 }


 }


 if( RE4_bit  == 0)
 {

 Meter_Or_Picks_Option++;
 if(Meter_Or_Picks_Option > 2)
 {
 Meter_Or_Picks_Option = 1;
 }


 delay_ms(250);
 Refresh_Screen=1;
 }
 else if( RE5_bit  == 0)
 {
 if(Meter_Or_Picks_Option == 1)
 {
 Meter_Or_Picks_Option = 2;
 }
 else
 {
 Meter_Or_Picks_Option--;
 }

 delay_ms(250);
 Refresh_Screen=1;
 }
 if( RE6_bit  == 0)
 {
 if( Meter_Or_Picks_Option == 1)
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("METER MODE SETTED",60,64);
 T6963C_set_cursor(25,8);
 delay_ms(2000);

 Meter_Or_Picks_Sel=0;
 EEPROM_Write ( ( 0X41 ) ,Meter_Or_Picks_Sel);
 }
 if( Meter_Or_Picks_Option == 2)
 {
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("PICKS MODE SETTED",60,64);
 T6963C_set_cursor(25,8);
 delay_ms(2000);

 Meter_Or_Picks_Sel=1;
 EEPROM_Write ( ( 0X41 ) ,Meter_Or_Picks_Sel);
 }

 Meter_Or_Picks_Exit = 0;
 exit1 = 1;
 Refresh_Screen=1;
 }

 if( RE7_bit  == 0)
 {

 Meter_Or_Picks_Exit = 0;
 exit1 = 1;
 GIE_bit = 1;
 PEIE_bit = 1;
 delay_ms(250);
 return;
 }
 }
}



void Inch_Or_Pay_Method()
{

 unsigned char Inch_Or_Pay_Method_Exit=1,Refresh_Screen=1,Inch_Or_Pay_Method_Option=1;


 delay_ms(5);
 while( RE6_bit  == 0);

 while(Inch_Or_Pay_Method_Exit == 1)
 {

 if( Refresh_Screen == 1)
 {
#line 784 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Setup.c"
 Refresh_Screen=0;
  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("INCH",11,8);
 T6963C_Write_Text_Adv_ROM("PAY",11,24);
 if(Inch_Or_Pay_Method_Option == 1)
 {
 T6963C_Write_char_adv(45,0,8);
 T6963C_Write_char_adv(45,2,8);
 T6963C_Write_char_adv(62,3,8);
 T6963C_set_cursor(7,1);
 }
 else if(Inch_Or_Pay_Method_Option == 2)
 {
 T6963C_Write_char_adv(45,0,24);
 T6963C_Write_char_adv(45,2,24);
 T6963C_Write_char_adv(62,3,24);
 T6963C_set_cursor(7,3);
 }

 }

 if( RE4_bit  == 0)
 {
 Refresh_Screen=1;
 delay_ms(50);
 while( RE4_bit ==0);
 if(Inch_Or_Pay_Method_Option >=2 )
 {
 Inch_Or_Pay_Method_Option=1;
 }
 else
 {
 Inch_Or_Pay_Method_Option++;
 }
 }

 if ( RE5_bit  == 0)
 {
 Refresh_Screen=1;
 delay_ms(50);
 while( RE5_bit ==0);

 if(Inch_Or_Pay_Method_Option <= 1)
 {
 Inch_Or_Pay_Method_Option=2;
 }
 else
 {
 Inch_Or_Pay_Method_Option--;
 }
 }

 if( RE6_bit  == 0 )
 {
 Refresh_Screen=1;
 delay_ms(50);
 while( RE6_bit ==0);


 if( Inch_Or_Pay_Method_Option == 1 )
 {
 Inch_Or_Pay_Sel=0;

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;
 T6963C_Write_Text_Adv_ROM("INCH MODE SETTED",56,64);
 T6963C_set_cursor(24,8);
 EEPROM_Write ( ( 0X42 ) ,Inch_Or_Pay_Sel);

 delay_ms(2000);
 }
 else if ( Inch_Or_Pay_Method_Option == 2 )
 {

  T6963C_Fill(0, 0, (T6963C_GrMemSize + T6963C_TxtMemSize) ) ;

 Inch_Or_Pay_Sel=1;
#line 865 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Setup.c"
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
#line 900 "E:/EMBEDDED FILE/PROJECT FILES/OFFICE PROJECT/NEW/NK AUTOMATION/MICRO BRAIN V.2.0/VERSION/Micro_Brain_V32_TILL 30 OK NOW NEED TO CHANGE PICK IN TO LONG TYPE/Setup.c"
 delay_ms(2000);

 }

 }

 if( RE7_bit  == 0)
 {
 Refresh_Screen=1;
 delay_ms(150);
 while( RE7_bit ==0);
 delay_ms(150);

 Inch_Or_Pay_Method_Exit = 0;
 exit1 = 1;
 GIE_bit = 1;
 PEIE_bit = 1;
 delay_ms(250);
 return;
 }

 delay_ms(10);


 }

}
