#pragma ReentrancyCheck OFF
#include "Setup.h"
#include "Control_Fn.h"
#include "EEPROM_Data.h"
#include "DC3231_AT24C32.h"
#include "__T6963C.h"



// T6963C module connections
char T6963C_dataPort at PORTD;                   // DATA port

sbit T6963C_ctrlwr  at LATJ0_bit;                // WR write signal
sbit T6963C_ctrlrd  at LATJ1_bit;                // RD read signal
sbit T6963C_ctrlcd  at LATJ3_bit;                // CD command/data signal
sbit T6963C_ctrlrst at LATB4_bit;                // RST reset signal
sbit T6963C_ctrlwr_Direction  at TRISJ0_bit;     // WR write signal
sbit T6963C_ctrlrd_Direction  at TRISJ1_bit;     // RD read signal
sbit T6963C_ctrlcd_Direction  at TRISJ3_bit;     // CD command/data signal
sbit T6963C_ctrlrst_Direction at TRISB4_bit;     // RST reset signal

// Signals not used by library, they are set in main function
sbit T6963C_ctrlce at LATJ2_bit;                 // CE signal
sbit T6963C_ctrlfs at LATB5_bit;                 // FS signal
sbit T6963C_ctrlmd at LATH2_bit;                 // MD signal

sbit T6963C_ctrlce_Direction  at TRISJ2_bit;     // CE signal direction
sbit T6963C_ctrlfs_Direction  at TRISB5_bit;     // FS signal direction
sbit T6963C_ctrlmd_Direction  at TRISH2_bit;     // MD signal direction

unsigned char  panel;         // Current panel
unsigned char  curs;          // Cursor visibility
unsigned char   cposx, cposy;  // Cursor x-y position

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

extern unsigned char   cposx, cposy;  // Cursor x-y position

extern unsigned char Hour,Min,Sec,Date,Month,Year;
extern bit Power_up_bit;

//===================================== for RB0 pin interupt purpose =====================================
extern bit PowerFail_Enable_bit;
bit PowerFail_Done_bit;

extern volatile bit one_sec_flag;


extern  char Text[16];

const code char NK_LOGO_BANNER[];


//================================== ADDITONAL SETTINGS =============================================
extern bit Meter_Or_Picks_Sel;
extern bit Inch_Or_Pay_Sel;

extern float Pay_Value;

extern  unsigned int i=0;
extern float Value_float=0;

unsigned char Hold_Sec=0;

bit Button_Hold_Bit;


void main()
{
  Power_up_bit=0;
   MCU_Config();

  T6963C_PanelFill(0);
  T6963C_Write_Text_Adv_ROM("SETUP DONE",80,60);
  delay_ms(500);

 delay_ms(200);



                 T6963C_PanelFill(0);
                 Date=Read_RTC(4);
                 Month=Read_RTC(5);
                 Year=Read_RTC(6);

                 Hour=Read_RTC(2);
                 Min=Read_RTC(1);
                 Sec=Read_RTC(0);


            T6963C_PanelFill(0);
            delay_ms(5);
            T6963C_Write_Text_Adv_ROM("TIME RECEIVED",68,60);
            delay_ms(500);




         T6963C_PanelFill(0);
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

/*//CHECKING PURPOSE ALONE
              LedR=0;
              delay_ms(1000);
              LedR=1;
              delay_ms(1000);*/



         while(1)
         {

                  if ( (PowerFail_Enable_bit == 1) && (PowerFail_Done_bit == 0) )
                  {
                      PowerFail_Done_bit = 1;// TO AVOID ONE MORE EPPROM SAVING PURPOSE
                      Update_EEPROM_PwrFail(0); //NEED TO CONVERT TO CALL IN INTERPUT
                  }
\

                if(MODE==0)
                {

                  LedR=1;
                  LedG=1;
                  LedB=1;
                  Buzzer=1;

                 if(Lcd_update==1)
                 {
                  LCD_Refresh();

                  Display_variable_Update_Left_Pulse_picks();
                  delay_ms(10);

                      

                      if(Inch_Or_Pay_Sel == 0)//INCH
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
                            //METER
                             Left_Side_Meter_PAY_Update();
                             Right_Side_Meter_PAY_Update();
                          }
                          else
                          {
                            //PICKS
                             Left_Side_Pick_Pay_Update();
                             Right_Side_Pick_Pay_Update();
                          }
                      }

                  Display_variable_Update_Right_Pulse_picks();
                  delay_ms(10);

                 }

                 if((Set==1)&&(Stop==1)&&(Start==1)&&(countA>=200))
                 {
                 Display_variable_Update_Left_Pulse_picks();
                 delay_ms(10);
                 Display_variable_Update_Right_Pulse_picks();
                 delay_ms(10);
                 }


                 if((Set==1)&&(Stop==1)&&(Start==1)&&(countB>=900))
                 {

//==================== VARIABLE ASSIGN TO THE ARRAY ===================
                 //LEFT SIDE
                 Inch[0]=InchA;
                 Inch[1]=InchB;
                 Inch[2]=InchC;
                 Inch[3]=InchD;
                 Inch[4]=InchE;
                 Inch[5]=InchF;
                 Inch[6]=InchG;
                 Inch[7]=InchH;

                 //RIGHT SIDE
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

                       if(Reverse == 0 && Start == 1 && Stop ==1 && Set == 1)  //SHORTCUT METHOD TO CHECK THE PAY [INCH OR PAY]
                      {

                           while ( (Reverse == 0) && Hold_Sec < 5)//0,1,2 [3 Sec plan]
                           {
                            T6963C_PanelFill(0);  //LCD CLEAR
                            T6963C_Write_Text_Adv_ROM("PRESS AND HOLD BLACK BUTTON",8,40);
                            IntToStr( (5 - Hold_Sec)  , Text); //INVERT LOGIC USED
                            Ltrim(Text);
                            T6963C_Write_Text_Adv(Text ,112,56 );
                            Glcd_Buffer_Clear();
                            T6963C_Write_Text_Adv_ROM("SECS LEFT",80,72);


                                if( Reverse == 0 )
                                {
                                Hold_Sec++;
                                delay_ms(1000);
                                }
                                else
                                {
                                  Hold_Sec=0;//RESET PURPOSE  [IF THE BUTTON IS TAKEN BEFORE 3 SECOND COUNT WILL BE 0]
                                }
                            }
                            if(Hold_Sec < 5 )
                            {
                              LCD_Refresh(); //IMMEDIATE REFRESH
                              Hold_Sec=0;
                            
                            }

                            //CHECKING SECTION
                            if(hold_sec >= 4)
                            {
                            
                             Inch_Or_Pay_Sel = ~ Inch_Or_Pay_Sel;//TOGGLE SELECTION BIT

                              if ( Inch_Or_Pay_Sel == 0 ) //INCH
                              {
                               T6963C_PanelFill(0);
                               T6963C_Write_Text_Adv_ROM("INCH MODE SETTED",60,60);
                               delay_ms(2000);
                              }
                              else //PAY
                              {

                                    T6963C_PanelFill(0);
                                   if( Pay_Value == 0)//VALUE NOT ENTERED CASE
                                   {
                                     T6963C_set_cursor(28,8);
                                     Increment_Decerement_Float(&Pay_Value, 50.0 ,144, 64);
                                     delay_ms(15);

                                     T6963C_PanelFill(0);
                                     T6963C_Write_Text_Adv_ROM("PAY MODE SETTED",60,64);
                                      T6963C_set_cursor(24,8);
                                     EEPROM_Write (  (Inch_Or_Pay_Sel_addr)  ,Inch_Or_Pay_Sel);//SELECTION BIT
                                     EEPORM_Write_Float( (Pay_Value_Store_addr)  , Pay_Value );//RUPEES STORE PURPOSE
                                     delay_ms(2000);

                                     //VERFICATION
                                     T6963C_PanelFill(0);
                                      T6963C_set_cursor(25,8);
                                     T6963C_Write_Text_Adv_ROM("SETTED PAY VALUE=",44,64);
                                     Pay_Value = EEPORM_Read_Float(Pay_Value_Store_addr);
                                     FloatToStr_SingleDecimal(Pay_Value, Text);
                                     T6963C_Write_Text_Adv(Text,180,64);
                                     delay_ms(2000);

                                   }
                                   else  //ALREADY VALUE ENTER STATE
                                   {
                                     T6963C_Write_Text_Adv_ROM("PAY MODE SETTED",60,60);
                                     delay_ms(2000);

                                   }
                                  T6963C_Cursor_Blink(0);
                                  T6963C_Cursor(0);
                                  T6963C_PanelFill(0);

                              }
                              /*Button_Hold_Bit = 1; //BIT SET*/
                               hold_sec=0;
                               LCD_Refresh(); //IMMEDIATE REFRESH
                               EEPROM_Write (  (Inch_Or_Pay_Sel_addr)  ,Inch_Or_Pay_Sel);//SELECTION BIT
                               Inch_Or_Pay_Sel = EEPROM_Read ( Inch_Or_Pay_Sel_addr );//SELECTION BIT
                               delay_ms(5);
                            }

                      }
                      


                 if((Set==0)&&(Stop==1)&&(Start==1))
                 {
                   delay_ms(250);

                   if((Set==0)&&(Stop==1)&&(Start==1))
                     {
                     Menulist();
                     }
                 }

                 if((Stop==0)&&(Set==1)&&(Start==1))
                 {
                 delay_ms(250);
                 if((Stop==0)&&(Set==1)&&(Start==1))
                   {
                   Reset_To_Next_Shift();
                   }
                 }

                 if((Start==0)&&(Set==1)&&(Stop==1))
                 {
                      delay_ms(250);
                     if((Start==0)&&(Set==1)&&(Stop==1))
                     {
                       Loom_value++;
                       if(Loom_value>15)
                       {
                       Loom_value=0;
                       }

                       //Display_variable_Update();
                       /*
                       lcd_goto1(5);
                       lcd_puts("L:");
                       lcd_putch(((char)((Loom_value+Loom_Starting_value)/10)%10)+48);
                       lcd_putch(((char)((Loom_value+Loom_Starting_value))%10)+48);
                       lcd_puts(":");
                       Lcd_update=1;
                       delay_ms(1000);
                      */
                     }
                 }

                 if((Start==0)&&(Stop==0)&&(Set==1))
                 {
                  /*
                   lcd_clear();
                   lcd_goto1(0);
                   lcd_puts("CALCULATING BEAM");
                   lcd_goto2(0);
                   lcd_puts("LOOM NO:");
                   lcd_putch(((char)((Loom_value+Loom_Starting_value)/10)%10)+48);
                   lcd_putch(((char)((Loom_value+Loom_Starting_value))%10)+48);
                   */
                   Save_shiftwise_External();
                   delay_ms(100);
                   Total_Beam_per_loom(); //NEED TO DEVELOPE LATER IN ORGANZIED WAY
                   Total_Beam_Per_Shift();
                   delay_ms(200);

                   Lcd_update=1;


                 }

                }


                if(MODE==1)
                {
                  T6963C_PanelFill(0);
                  delay_ms(1000);
                  T6963C_PanelFill(1);


                 GIE_bit       = 0;
                 PEIE_bit      = 0;
                }
                else if(MODE>1)
                {
                 delay_ms(1000);
                 MODE=0;
                 delay_ms(1000);
                }

          }



}


void LCD_Refresh(void)     // LCD Refresh
 {



    /*
     //GLCD INTIIALIZATION
    T6963C_init(240, 128, 8);
    T6963C_Graphics(1);
    T6963C_Text(1);
    T6963C_Cursor_Height(7);       // 8 pixel height
     //T6963C_set_cursor(28,15);       // Move cursor to top left
     T6963C_Cursor(0);              // Cursor off
     */


     T6963C_PanelFill(0);

  if(MODE==0)
   {
        T6963C_rectangle(0, 0, 239, 127, T6963C_WHITE);

        T6963C_line(64,  0,64,12, T6963C_WHITE);
        T6963C_line(168,  0,168,12, T6963C_WHITE);

        T6963C_line(0 ,12,419,12, T6963C_WHITE);
        T6963C_line(0, 24,419,24, T6963C_WHITE);
        T6963C_line(0, 37,419,37, T6963C_WHITE);
        T6963C_line(0, 50,419,50, T6963C_WHITE);
        T6963C_line(0, 63,419,63, T6963C_WHITE);
        T6963C_line(0, 76,419,76, T6963C_WHITE);       // X AXIX LINES
        T6963C_line(0, 89,419,89, T6963C_WHITE);
        T6963C_line(0, 102,419,102, T6963C_WHITE);
        T6963C_line(0, 115,419,115, T6963C_WHITE);
        //T6963C_line(0, 116,419,116, T6963C_WHITE);

        T6963C_line(27, 12,27,239, T6963C_WHITE);
        T6963C_line(50, 12,50,239, T6963C_WHITE);
        T6963C_line(81, 12,81,239, T6963C_WHITE);     // Y AXIS LINES
        T6963C_line(120,12,120,239, T6963C_WHITE);
        T6963C_line(147,12,147,239, T6963C_WHITE);
        T6963C_line(170,12,170,239, T6963C_WHITE); //RIGHT SIDE INCHES
        T6963C_line(201,12,201,239, T6963C_WHITE);




         T6963C_Write_Text_Adv("SHIFT:NO:       LOOM START:NO:          DT:",3,1);
         GLCD_Print_Int_With_LeadingZero(Loom_Starting_value ,150,1); //IF VALUE 1 MEANS IT WILL SHOW 01, >9 VALUE SHOW AS PER THE MENTION VALUE ALONE

         IntToStr( (Shift_value+1) , Text);  //DUE TO SMALL SPACE USALL LOGIC USED INSTEAD OF  GLCD_Print_Int_With_LeadingZero FUNCTION
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



//============================== DISPLAYING THE LOOM STARTING NO ======================================

          Loom_Starting_value=EEPROM_Read(Loom_Starting_NO_addr);
          delay_ms(15);

    for(i=0;i<8;i++)
    {
       asm CLRWDT;
       IntToStr(Loom_Starting_value+i , Text);
       Ltrim(Text);
       T6963C_Write_Text_Adv(Text,Fi_Xpos       ,Ypos+(13*i));
       Glcd_Buffer_Clear();
       delay_ms(5);
    }

    Loom_Starting_value=EEPROM_Read(Loom_Starting_NO_addr);
    delay_ms(15);

    Loom_Starting_value=Loom_Starting_value+8;//TO START FROM 8 PLUS DONE
    for(i=0;i<8;i++)
    {
     asm CLRWDT;
     IntToStr(Loom_Starting_value+i , Text);
     Ltrim(Text);
     T6963C_Write_Text_Adv( Text ,Se_Xpos  ,Ypos+(13*i));
     Glcd_Buffer_Clear();
      delay_ms(5);
    }

    Loom_Starting_value=EEPROM_Read(Loom_Starting_NO_addr);
    delay_ms(15);


//===============================  METER VALUE =====================================================
     if(Meter_Or_Picks_Sel == 0)
     {
//===================================== ASSIGN THE VALUES ===========================================

//==================== VARIABLE ASSIGN TO THE ARRAY ===================
     //LEFT SIDE
     Inch[0]=InchA;
     Inch[1]=InchB;
     Inch[2]=InchC;
     Inch[3]=InchD;
     Inch[4]=InchE;
     Inch[5]=InchF;
     Inch[6]=InchG;
     Inch[7]=InchH;

     //RIGHT SIDE
     Inch[8]=InchI;
     Inch[9]=InchJ;
     Inch[10]=InchK;
     Inch[11]=InchL;
     Inch[12]=InchM;
     Inch[13]=InchN;
     Inch[14]=InchO;
     Inch[15]=InchP;

//==NEW
            if(Inch_Or_Pay_Sel == 0 )
            {
              //METER
              T6963C_Write_Text_Adv("L:NO   P/I    INCH    METER  L:NO   P/I    INCH   METER", 3, 13);
            }
            else  //PAY
            {
              T6963C_Write_Text_Adv("L:NO   P/I     PAY     METER   L:NO   P/I     PAY     METER", 3, 13);
            }

             // LEFT METER PRODUCTON VALUES
              Left_Side_Meter_Update();
              if( Inch_Or_Pay_Sel == 1 ) //PAY BIT SLECTION    [LEFT SIDE])
              {
               Left_Side_Meter_PAY_Update();
              }
              
            // RIGHT METER PRODUCTON VALUES
              Right_Side_Meter_Update();
              if( Inch_Or_Pay_Sel == 1 ) //PAY BIT SLECTION    [RIGHT SIDE])
              {
               Right_Side_Meter_PAY_Update();
              }
     }
     
     else   //PICKS MODE SECTIONS
     {

//PICKS VALUE
             //LEFT SIDE
             Picks4inch[0]=Picks4inchA;
             Picks4inch[1]=Picks4inchB;
             Picks4inch[2]=Picks4inchC;
             Picks4inch[3]=Picks4inchD;
             Picks4inch[4]=Picks4inchE;
             Picks4inch[5]=Picks4inchF;
             Picks4inch[6]=Picks4inchG;
             Picks4inch[7]=Picks4inchH;

             //RIGHT SIDE
             Picks4inch[8]=Picks4inchI;
             Picks4inch[9]=Picks4inchJ;
             Picks4inch[10]=Picks4inchK;
             Picks4inch[11]=Picks4inchL;
             Picks4inch[12]=Picks4inchM;
             Picks4inch[13]=Picks4inchN;
             Picks4inch[14]=Picks4inchO;
             Picks4inch[15]=Picks4inchP;
//INCH VALUE
//==================== VARIABLE ASSIGN TO THE ARRAY ===================
             //LEFT SIDE
             Inch[0]=InchA;
             Inch[1]=InchB;
             Inch[2]=InchC;
             Inch[3]=InchD;
             Inch[4]=InchE;
             Inch[5]=InchF;
             Inch[6]=InchG;
             Inch[7]=InchH;

             //RIGHT SIDE
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
              //METER
//              T6963C_Write_Text_Adv("L:NO   P/I    INCH    METER   L:NO   P/I   INCH    METER", 3, 13);
              T6963C_Write_Text_Adv("L:NO  P/I     INCH    PICKS    L:NO  P/I    INCH     PICKS", 3, 13);
            }
            else  //PAY
            {
              T6963C_Write_Text_Adv("L:NO   P/I     PAY      PICKS    L:NO   P/I    PAY      PICKS", 3, 13);
//              T6963C_Write_Text_Adv("L:NO   P/I     PAY     METER   L:NO   P/I     PAY     METER", 3, 13);
            }

              Left_Side_Pick_Update();
              if( Inch_Or_Pay_Sel == 1 ) //PAY BIT SELECTION    [LEFT SIDE])
              {
               Left_Side_Pick_Pay_Update();
              }
              Right_Side_Pick_Update();
              if( Inch_Or_Pay_Sel == 1 ) //PAY BIT SELECTION    [RIGHT SIDE])
              {
               Right_Side_Pick_Pay_Update();
              }
            

     }

    }


       
       
       Lcd_update=0;
       delay_ms(10);


     }