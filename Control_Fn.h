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

//=============================LCD REFERSH SECTION COMING FUCNTIONS ========================================
//METER
void Left_Side_Meter_Update();
void Left_Side_Meter_PAY_Update();
void Right_Side_Meter_Update();
void Right_Side_Meter_PAY_Update();

//PICKS
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


//============================== TO CLEAR BUFFER PURPOSE ==============================
void Glcd_Buffer_Clear();

//=============================== DEFAULT STRING CALLING PUPROSE [TO REDUCE RAM USAGE]=========================================
void Glcd_Out_ROM(const char *text, unsigned short X_pixel, unsigned short Y_pixel);


void GLCD_Print_Int_With_LeadingZero(unsigned short value,unsigned short x,unsigned short y);

unsigned char GLCD_CharWidth(unsigned char ch);


void T6963C_Write_Text_Adv_ROM(const code char *text,
                               unsigned char x,
                               unsigned char y);
                               
                               
void Loading_Fill(unsigned char percent);

void Verify_EEPROM_Data_Clear(void);