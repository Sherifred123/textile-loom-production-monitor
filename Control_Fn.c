#include "Setup.h"
#include "Control_Fn.h"
#include "EEPROM_Data.h"
#include "DC3231_AT24C32.h"
#include "__T6963C.h"



#define GLCD_GAP 0

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

extern unsigned char   cposx, cposy;  // Cursor x-y position

extern unsigned char Hour,Min,Sec,Date,Month,Year;



extern  char Text[16];//variable used to store the value from int to str

//======================= FOR INTERUPT ========================
extern bit Power_up_bit;
extern bit PowerFail_Enable_bit;
extern bit PowerFail_Done_bit;


extern bit EEPROM_RST_Check_bit;
unsigned int EEPROM_Value_Read_Check=0;
bit EEPROM_Reset_Attempt_Count_bit;



//================================== ADDITONAL SETTINGS =============================================
extern bit Meter_Or_Picks_Sel;
extern bit Inch_Or_Pay_Sel;

extern float Pay_Value;

extern  unsigned int i=0;
extern float Value_float=0;
extern float Production_L,Production_R;

extern Button_Hold_Bit;


void Menulist(void)
{
  T6963C_PanelFill(0);  //LCD CLEAR
  T6963C_Write_Text_Adv_ROM("PRESS AND HOLD YELLOW BUTTON",8,40);
  IntToStr( (5-menu_sec)  , Text); //INVERT LOGIC USED
  Ltrim(Text);
  T6963C_Write_Text_Adv(Text ,112,56 );
  Glcd_Buffer_Clear();
  
  T6963C_Write_Text_Adv_ROM("SECS LEFT",80,72);
  menu_sec++;
  delay_ms(1000);
  count=0;

 if(menu_sec>=5) //COUNTING VALUE
 {
   T6963C_PanelFill(0);  //LCD CLEAR
   T6963C_Write_Text_Adv_ROM("NK",108,48);
   T6963C_Write_Text_Adv_ROM("AUTOMATION",80,64);
   delay_ms(2000);
   T6963C_PanelFill(0);  //LCD CLEAR
   
   exit2=0;//BIT SET
   
   menu_item=1;//DEFAULT POSITION



   while(exit2==0)
   {
       T6963C_Cursor(0);              // Cursor off
       T6963C_Cursor(1);
       T6963C_Cursor_Blink(1);

             
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
           if(Start==0)
           {menu_item=2;delay_ms(250);T6963C_PanelFill(0);}
           if(Stop==0)
           {menu_item=5;delay_ms(250);T6963C_PanelFill(0);}

           if(Set==0)
           {
                     delay_ms(200);
                     while(Set==0);
                     delay_ms(200);
                     T6963C_PanelFill(0);
                     UserColourSetting(); //MENU BLOCK SETTINGS
                     delay_ms(200);
                     ColourExit=0;// only for testing 1 machine
                     T6963C_PanelFill(0);
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
                  if(Start==0)
                  {menu_item=3;delay_ms(250);T6963C_PanelFill(0);}

                  if(Stop==0)
                  {menu_item=1;delay_ms(250);T6963C_PanelFill(0);}

                  if(Set==0)
                    {
                     while(Set==0)
                     delay_ms(200);
                     T6963C_PanelFill(0);
                     Beam_Setting(void);
                     T6963C_PanelFill(0);
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

                   if(Start==0)
                    {menu_item=4;delay_ms(250);T6963C_PanelFill(0);}

                   if(Stop==0)
                   {menu_item=2;delay_ms(250);T6963C_PanelFill(0);}

                    if(Set==0)
                    {
                     while(Set==0)
                     delay_ms(200);
                     T6963C_PanelFill(0);
                     Reset_color_Setting();
                     T6963C_PanelFill(0);
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

                    if(Start==0)
                    {menu_item=5;delay_ms(250);T6963C_PanelFill(0);}

                    if(Stop==0)
                    {menu_item=3;delay_ms(250);T6963C_PanelFill(0);}

                    if(Set==0)
                    {
                     while(Set==0)
                     delay_ms(200);
                     T6963C_PanelFill(0);
                     Set_Date_Time_Rtc();
                     T6963C_PanelFill(0);
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
                    if(Start==0)
                    {menu_item=1;delay_ms(250);T6963C_PanelFill(0);}

                    if(Stop==0)
                    {menu_item=4;delay_ms(250);T6963C_PanelFill(0);}

                    if(Set==0)
                    {
                     while(Set==0)
                     delay_ms(200);
                     T6963C_PanelFill(0);
                     Factory_Reset();
                     T6963C_PanelFill(0);
                     delay_ms(200);
                    }
                }

                

     if(Reverse==0)
      {
       T6963C_Cursor(0);
       exit2=1;
       LCD_Refresh();
       delay_ms(250);
      }


    }
 }
     if(Set!=0)
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

                         if(Start==0)
                         {
                            if(SplFlag==0)
                            {SplFlag=1;Reset_loop=0;T6963C_PanelFill(0);delay_ms(100); }
                            else if(SplFlag==1)
                            {SplFlag=0;Reset_loop=0;T6963C_PanelFill(0);delay_ms(100); }
                         }



                         if(Set==0)
                           {

                           T6963C_PanelFill(0);
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

                         if(Reverse==0)
                          {
                           Exit_loop=1;
                           Hold_mode=1;
                           Reset_loop=0;
                           exit1=1;
                           GIE_bit       = 1;
                           PEIE_bit      = 1;
                           delay_ms(250);
                           return;
                          }

                     }


             }
}


void Reset_To_Next_Shift(void)
    {
     T6963C_PanelFill(0);  //LCD CLEAR
     T6963C_Write_Text_Adv_ROM("PRESS AND HOLD RED BUTTON",20,40);
     IntToStr( (5-menushift_sec)  , Text);
     Ltrim(Text);
     T6963C_Write_Text_Adv(Text ,112,56 );
     Glcd_Buffer_Clear();
     
//     T6963C_Write_char_adv( (char) ((((5-menushift_sec))%10)+48),72,56 );
     
     T6963C_Write_Text_Adv_ROM("SECONDS LEFT",72,72);
     T6963C_Write_Text_Adv_ROM("TO RESET SHIFT",64,88);
     delay_ms(1000);
     menushift_sec++;
     count=0;

         if(menushift_sec>=5)
         {
           T6963C_PanelFill(0);
           T6963C_Write_Text_Adv_ROM("NK", 108, 48);
           T6963C_Write_Text_Adv_ROM("AUTOMATION", 80, 64);
           Save_shiftwise_External();
           Save_shiftwise_Date_time_External();
           delay_ms(1000);
           T6963C_PanelFill(0);
           exit3=0;
           menushift_item=1;




           if(Shift_value<95)
           {
           Shift_value++;
           Variable_Reset();
           T6963C_PanelFill(0);
           T6963C_Write_Text_Adv_ROM("SHIFT CHANGED", 80, 48);
           IntToStr( (Shift_value+1)  , Text);
           Ltrim(Text);
           T6963C_Write_Text_Adv(Text ,116,64 );
           Glcd_Buffer_Clear();

           delay_ms(2000);
           }
           else  // check with sir for equal to
           {
           Next_cyle();
           }


        }
     if(Stop!=0)
     {
      menushift_sec=0;LCD_Refresh();
     }

    }

void Shift_Jump(void)
{
           Save_shiftwise_External();
           Save_shiftwise_Date_time_External();

           T6963C_PanelFill(0);
           T6963C_Write_Text_Adv_ROM("SHIFT:NO:", 90, 48);
           delay_ms(500);
           Increment_Decerement(&Shift_value,96,104,64);
           delay_ms(500);

           if(Shift_value<=0){Shift_value=0;}
           if(Shift_value>=1){Shift_value=(Shift_value-1); }


           {
           delay_ms(1000);
           T6963C_PanelFill(0);

           if(Shift_value<95)
           {
           Variable_Reset();
           T6963C_PanelFill(0);

           T6963C_Write_Text_Adv_ROM("SHIFT CHANGED", 80, 48);
           IntToStr( (Shift_value+1)  , Text);
           Ltrim(Text);
           T6963C_Write_Text_Adv(Text ,116,64 );
           Glcd_Buffer_Clear();

           /*T6963C_Write_char_adv( (char) ((((Shift_value+1)/10)%10)   +48),116,64  );
           T6963C_Write_char_adv( (char) ((((Shift_value+1))%10)      +48),124,64 );*/

           delay_ms(2000);
           }
           else  // check with sir for equal to
           {
           Next_cyle();
           }


        }

}

//NEED TO CORRECT THIS LATER  [TEXT ALIGNMENT AND LOGIC ERROR]
void Beam_Loom_Shift(void)
{
unsigned char Reset_loop=0,ColourExit2=0,item=0,SplFlag=0;
unsigned char Loom_no=1,Shift_no=1;
static unsigned int Colour_Addr,LoomStartAddr,i=0,j=0,k=0,Loom_noA=0;
unsigned int Shift_beam_Inch;
float Shift_Beam_meter;


             while(ColourExit2==0)
             {
                 T6963C_PanelFill(0);
                 T6963C_Write_Text_Adv_ROM("LOOM:NO      SHIFT:NO", 30, 48);
                 delay_ms(1500);
                 Loom_no=Loom_Starting_value;
                 
                 Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),38,64);// [DECREMENT PORBLEM] WHILE DECREMENT STARTING MAKE THE VLAUE GOES ABOVE THE LIMIT

                 while(Loom_no<Loom_Starting_value)
                 {
                   Loom_no=Loom_Starting_value;
                   T6963C_PanelFill(0);
                   T6963C_Write_Text_Adv_ROM("INVALD VALUE FOR THIS BOX", 21, 8);
                   delay_ms(1500);
                   T6963C_PanelFill(0);
                   T6963C_Write_Text_Adv_ROM("LOOM:NO      SHIFT:NO", 30, 48);
                   delay_ms(1500);
//                   if(Loom_no <=16 && Loom_no > 0 )
//                   {
                    Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),38,64);
//                   }

                 }



                 delay_ms(1000);
                 Increment_Decerement(&Shift_no,96,160,64);
                 delay_ms(1000);
                 T6963C_PanelFill(0);

                 T6963C_Write_Text_Adv_ROM("PLEASE NOTE:", 72, 32);
                 T6963C_Write_Text_Adv_ROM("DATE SHIFT AND TIME READINGS",8, 48);
                 delay_ms(3000);
                 T6963C_PanelFill(0);
                 T6963C_Write_Text_Adv_ROM("L00M   DATE   MONTH   YEAR", 11, 8);
                 IntToStr( Loom_no  , Text);
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

                 
/*T6963C_Write_char_adv( (char) (((Shift_no/10)%10)   +48),64,45  );
                 T6963C_Write_char_adv( (char) (((Shift_no)%10)      +48),72,45 );*/


                 T6963C_Write_Text_Adv_ROM("TIME:", 11, 64);
                  GLCD_Print_Int_With_LeadingZero(Hour ,48,64 );

/*T6963C_Write_char_adv( (char) (((Hour/10)%10)   +48),48,64  );
                 T6963C_Write_char_adv( (char) (((Hour)%10)      +48),56,64 );*/

                 T6963C_Write_Text_Adv_ROM(":", 64, 64);
                  GLCD_Print_Int_With_LeadingZero(Min ,72,64);


/*T6963C_Write_char_adv( (char) (((Min/10)%10)   +48),72,64);
                 T6963C_Write_char_adv( (char) (((Min)%10)      +48),80,64 );*/
                 
                 T6963C_Write_Text_Adv_ROM(":", 88, 64);;
                  GLCD_Print_Int_With_LeadingZero(Sec ,96,64 );


                 /*T6963C_Write_char_adv( (char) (((Sec/10)%10)   +48),96,64  );
                 T6963C_Write_char_adv( (char) (((Sec)%10)      +48),104,64 );*/

                 delay_ms(5000);

                 T6963C_PanelFill(0);
                 T6963C_Write_Text_Adv_ROM("CALCULATING BEAM METER", 42, 45);
                 delay_ms(2000);
                 Reset_loop=0;

                 Loom_no=(Loom_no-(Loom_Starting_value-1));

                 Loom_noA = Loom_no;
                 j=(Loom_noA-1)*192;
                 LoomStartAddr=j+InchA_addr;
                 k = ((Shift_no-1)*2);
                Shift_beam_Inch =EEPROM_AT24C32_RdInt(LoomStartAddr+k);
                 delay_ms(500);
                Shift_Beam_meter=((float)(0.0254*Shift_beam_Inch));

                  delay_ms(100);
                  T6963C_PanelFill(0);
                  T6963C_Write_Text_Adv_ROM("L00M:", 8, 24);
                  
                  IntToStr( (Loom_no+(Loom_Starting_value-1) )  , Text);
                  Ltrim(Text);
                  T6963C_Write_Text_Adv(Text ,56,24);
                  
              /*T6963C_Write_char_adv((((char)((Loom_no+(Loom_Starting_value-1))/10)%10)+48),40,40  );
                  T6963C_Write_char_adv((((char)((Loom_no+(Loom_Starting_value-1)))%10)+48),48,40 );*/
                  
                  
                  T6963C_Write_Text_Adv_ROM("SHIFT:", 8, 48);
                   GLCD_Print_Int_With_LeadingZero(Shift_no,60,48  );
                  
                 /*T6963C_Write_char_adv((((char)((Shift_no)/10)%10)+48),108,40  );
                  T6963C_Write_char_adv((((char)((Shift_no))%10)+48),116,40 );*/

                  T6963C_Write_Text_Adv_ROM("INCH:", 90, 48);
                   GLCD_Print_Int_With_LeadingZero ( Shift_beam_Inch,140,48 );
                  
                  /*T6963C_Write_char_adv( (char) (((Shift_beam_Inch/100000)%10)+48),172,40 );
                  T6963C_Write_char_adv( (char) (((Shift_beam_Inch/10000)%10)+48) ,180,40 );
                  T6963C_Write_char_adv( (char) (((Shift_beam_Inch/1000)%10)+48)  ,188,40 );
                  T6963C_Write_char_adv( (char) (((Shift_beam_Inch/100)%10)+48)   ,196,40 );
                  T6963C_Write_char_adv( (char) (((Shift_beam_Inch/10)%10)+48)    ,204,40 );
                  T6963C_Write_char_adv( (char) (((Shift_beam_Inch)%10)+48)       ,212,40 );*/

                  T6963C_Write_Text_Adv_ROM("M:", 8, 72);
                  FloatToStr_SingleDecimal(Shift_Beam_meter,Text);
                  Ltrim(Text);
                  T6963C_Write_Text_Adv(Text,34,72);// VALUE [METER]
                  Glcd_Buffer_Clear();

                  /*T6963C_Write_char_adv((char)(Shift_Beam_meter/1000)+48      ,84,64 );
                  T6963C_Write_char_adv(((char)(Shift_Beam_meter/100)%10)+48  ,92,64 );
                  T6963C_Write_char_adv(((char)(Shift_Beam_meter/10)%10)+48   ,100,64 );
                  T6963C_Write_char_adv(((char)(Shift_Beam_meter)%10)+48      ,108,64 );
                  T6963C_Write_Text_Adv(".", 116, 64);
                  T6963C_Write_char_adv(((char)(Shift_Beam_meter*10)%10)+48   ,124,64 );*/

                  while(Reset_loop==0)
                 {

                    if(Stop==0)
                    {
                    Reset_loop=1;
                    delay_ms(1000);
                    }


                    if(Reverse==0)
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
           x=j+InchA_addr;
           Beam_production=0;
           Disp_Beam=0;
           for(k=x;k<(96+x);k++)
           {
           temp_data=EEPROM_AT24C32_RdInt(x+(2*(k-x)));
           Disp_Beam+=temp_data;
           }
           T6963C_PanelFill(0);
           delay_ms(200);
           Beam_production = ((float)(0.0254*Disp_Beam)+((float)((1/Disp_Picks4inch)*Disp_Pulse_Pick)));

           delay_ms(200);
           T6963C_PanelFill(0);
           T6963C_Write_Text_Adv_ROM("L", 42, 80);
           


            GLCD_Print_Int_With_LeadingZero ( (Loom_value+Loom_Starting_value) ,50,80 );
           
           /*T6963C_Write_char_adv( (((char)((Loom_value+Loom_Starting_value)/10)%10)+48),50,80);
           T6963C_Write_char_adv( (((char)((Loom_value+Loom_Starting_value))%10)+48),58,80);*/

           T6963C_Write_Text_Adv_ROM(":M:",66,80);

            FloatToStr_SingleDecimal(Beam_production,Text);
            Ltrim(Text);
            T6963C_Write_Text_Adv(Text,74,80);// VALUE [METER]
            Glcd_Buffer_Clear();
           
/*T6963C_Write_char_adv(((char) (Beam_production/1000)+48),74,80);
           T6963C_Write_char_adv((((char)(Beam_production/100)%10)+48),82,80);
           T6963C_Write_char_adv((((char)(Beam_production/10)%10)+48),90,80);
           T6963C_Write_char_adv((((char)(Beam_production)%10)+48),98,80);
           T6963C_Write_Text_Adv(".",106,80);
           T6963C_Write_char_adv((((char)(Beam_production*10)%10)+48),114,80);*/

           T6963C_Write_Text_Adv_ROM("I:",122,80);
            GLCD_Print_Int_With_LeadingZero(Disp_Beam,130,80  );
           
/*T6963C_Write_char_adv(( (char) (((Disp_Beam/100000)%10)+48)),130,80);
           T6963C_Write_char_adv(( (char) (((Disp_Beam/10000)%10)+48)) ,138,80);
           T6963C_Write_char_adv(((char) (((Disp_Beam/1000)%10)+48))   ,146,80);
           T6963C_Write_char_adv(((char) (((Disp_Beam/100)%10)+48))    ,154,80);
           T6963C_Write_char_adv(((char) (((Disp_Beam/10)%10)+48))     ,162,80);
           T6963C_Write_char_adv(((char) (((Disp_Beam)%10)+48))        ,170,80);*/

           delay_ms(12000);
}

void Total_Beam_Per_Shift(void)
{
unsigned long int Current_Total_Beam_Per_Shift;
float Current_Shift_Meter;

            Current_Total_Beam_Per_Shift=(inchA+inchB+inchC+inchD+inchE+inchF+inchG+inchH+inchI+inchJ+inchK+inchL+inchM+inchN+inchO+inchP);

           T6963C_PanelFill(0);

           T6963C_Write_Text_Adv_ROM("BEAM/SHIFT:",20,23);
            GLCD_Print_Int_With_LeadingZero( (Shift_value+1) ,28,23);
           
/*T6963C_Write_char_adv((((char)((Shift_value+1)/10)%10)+48),28,23);
           T6963C_Write_char_adv((((char)((Shift_value+1))%10)+48),36,23);*/



           T6963C_Write_Text_Adv_ROM("I:",44,23);
            GLCD_Print_Int_With_LeadingZero( Current_Total_Beam_Per_Shift ,52,23);
           
/*T6963C_Write_char_adv(((char) (((Current_Total_Beam_Per_Shift/100000)%10)+48) ),52,23);
           T6963C_Write_char_adv(((char) (((Current_Total_Beam_Per_Shift/10000)%10)+48) ) ,60,23);
           T6963C_Write_char_adv(((char) (((Current_Total_Beam_Per_Shift/1000)%10)+48) )  ,68,23);
           T6963C_Write_char_adv(((char) (((Current_Total_Beam_Per_Shift/100)%10)+48) )   ,76,23);
           T6963C_Write_char_adv(((char) (((Current_Total_Beam_Per_Shift/10)%10)+48) )    ,84,23);
           T6963C_Write_char_adv(((char) (((Current_Total_Beam_Per_Shift)%10)+48) )       ,92,23);*/

           Current_Shift_Meter=((float)(0.025*Current_Total_Beam_Per_Shift));


           T6963C_Write_Text_Adv_ROM(":M:",44,31);
            FloatToStr_SingleDecimal(Current_Shift_Meter,Text);
            Ltrim(Text);
            T6963C_Write_Text_Adv(Text,52,31);// VALUE [METER]
            Glcd_Buffer_Clear();
           
           /*T6963C_Write_char_adv(((char) (Current_Shift_Meter/1000)+48),52,31);
           T6963C_Write_char_adv((((char)(Current_Shift_Meter/100)%10)+48),60,31);
           T6963C_Write_char_adv((((char)(Current_Shift_Meter/10)%10)+48),68,31);
           T6963C_Write_char_adv((((char)(Current_Shift_Meter)%10)+48),76,31);
           T6963C_Write_Text_Adv(".",84,31);
           T6963C_Write_char_adv((((char)(Current_Shift_Meter*10)%10)+48),92,31);*/
           
           
           delay_ms(6000);
}

void Select_Loom_Total_Beam_per_loom(void)
{
unsigned int j=0,k=0,x=0;
unsigned int temp_data=0;
unsigned int Loom_no=1;


           T6963C_PanelFill(0);
           T6963C_Write_Text_Adv_ROM("LOOM:NO:",80,48);
           delay_ms(500);

           Loom_no=Loom_Starting_value;
           Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),144,48);

                 while(Loom_no<Loom_Starting_value)
                 {
                   Loom_no=Loom_Starting_value;

                   T6963C_PanelFill(0);
                   T6963C_Write_Text_Adv_ROM("INVALD VALUE",80,48);

                   T6963C_Write_Text_Adv_ROM("FOR THIS BOX LOOM NO",64,64);
                   delay_ms(2000);
                   T6963C_PanelFill(0);
                   T6963C_Write_Text_Adv_ROM("LOOM:NO:",80,48);
                   Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),144,48);
                 }

           delay_ms(500);
           Loom_no=(Loom_no-(Loom_Starting_value-1));

           Loom_no=(Loom_no-1);


           j=Loom_No*192;
           x=j+InchA_addr;
           Beam_production=0;
           Disp_Beam=0;
           for(k=x;k<(96+x);k++)
           {
           temp_data=EEPROM_AT24C32_RdInt(x+(2*(k-x)));
           Disp_Beam+=temp_data;
           }
           T6963C_PanelFill(0);
           delay_ms(200);
           Beam_production = ((float)(0.025*Disp_Beam)+((float)((1/Disp_Picks4inch)*Disp_Pulse_Pick)));

           delay_ms(200);
           T6963C_PanelFill(0);
           

           T6963C_Write_Text_Adv_ROM("LOOM NO:",4,16);
            GLCD_Print_Int_With_LeadingZero( (Loom_No+Loom_Starting_value) ,64,16);

            T6963C_Write_Text_Adv_ROM("M:",96,16);
            FloatToStr_SingleDecimal(Beam_production,Text);
            Ltrim(Text);
            T6963C_Write_Text_Adv(Text,112,16);// VALUE [METER]
            Glcd_Buffer_Clear();
           
/*T6963C_Write_char_adv(((char) (Beam_production/1000)+48),112,16);
           T6963C_Write_char_adv((((char)(Beam_production/100)%10)+48),120,16);
           T6963C_Write_char_adv((((char)(Beam_production/10)%10)+48),128,16);
           T6963C_Write_char_adv((((char)(Beam_production)%10)+48),136,16);
           T6963C_Write_Text_Adv(".",144,16);
           T6963C_Write_char_adv((((char)(Beam_production*10)%10)+48),152,16);*/

           T6963C_Write_Text_Adv_ROM("I:",4,32);
           GLCD_Print_Int_With_LeadingZero(Disp_Beam ,16,32);
           
           /*T6963C_Write_char_adv(((char) (((Disp_Beam/100000)%10)+48)),16,32);
           T6963C_Write_char_adv(((char) (((Disp_Beam/10000)%10)+48)),24,32);
           T6963C_Write_char_adv(((char) (((Disp_Beam/1000)%10)+48)),32,32);
           T6963C_Write_char_adv(((char) (((Disp_Beam/100)%10)+48)),40,32);
           T6963C_Write_char_adv(((char) (((Disp_Beam/10)%10)+48)),48,32);
           T6963C_Write_char_adv(((char) (((Disp_Beam)%10)+48)),56,32);*/
           
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
                           T6963C_PanelFill(0);
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
                            T6963C_PanelFill(0);
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
                           T6963C_PanelFill(0);
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
                           T6963C_PanelFill(0);
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
                           T6963C_PanelFill(0);
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
                         
                         
                         if(Start==0)
                         {
                            if(SplFlag==0)   //OPTION 1
                            {SplFlag=1;Reset_loop=0;delay_ms(250); }
                            else if(SplFlag==1)    //OPTION 2
                            {SplFlag=2;Reset_loop=0;delay_ms(250); }
                            else if(SplFlag==2)    //OPTION 3
                            {SplFlag=3;Reset_loop=0;delay_ms(250); }
                            else if(SplFlag==3)    //OPTION 4
                            {SplFlag=4;Reset_loop=0;delay_ms(250); }
                            else if(SplFlag==4)    //OPTION 5
                            {SplFlag=0;Reset_loop=0;delay_ms(250); }

                         }

                         if(Stop==0)
                         {
                            if(SplFlag==0)      //OPTION 5
                            {SplFlag=4;Reset_loop=0;delay_ms(250); }
                            else if(SplFlag==1) //OPTION 1
                            {SplFlag=0;Reset_loop=0;delay_ms(250); }
                            else if(SplFlag==2) //OPTION 2
                            {SplFlag=1;Reset_loop=0;delay_ms(250); }
                            else if(SplFlag==3)    //OPTION 3
                            {SplFlag=2;Reset_loop=0;delay_ms(250); }
                            else if(SplFlag==4)    //OPTION 4
                            {SplFlag=3;Reset_loop=0;delay_ms(250); }

                         }
                         if(Set==0)
                           {

                                 T6963C_PanelFill(0);
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
                                   T6963C_PanelFill(0);


                                    delay_ms(200);
                                    return;
                                 }
                                 if(SplFlag==4)
                                 {
                                   Inch_Or_Pay_Method();
                                   T6963C_PanelFill(0);

                                   
                                    delay_ms(200);
                                    return;
                                 }
                           }

                         if(Reverse==0)
                          {
                           ColourExit=0;
                           ColourExit2=1;
                           exit1=1;
                           GIE_bit       = 1;
                           PEIE_bit      = 1;
                           delay_ms(250);
                           return;
                          }

                     }

             }



}

void Loom_Starting_No(void)
{
                  T6963C_PanelFill(0);
                  T6963C_Write_Text_Adv_ROM("LOOM STARTING NO",56,56);
                  Loom_Starting_value=EEPROM_Read(Loom_Starting_NO_addr);
                  delay_ms(5);


                 GLCD_Print_Int_With_LeadingZero( Loom_Starting_value,112,72);
                 
                 /*T6963C_Write_char_adv( (char) (((Loom_Starting_value/100)%10)  +48),112,72);
                 T6963C_Write_char_adv( (char) (((Loom_Starting_value/10)%10)   +48),120,72);
                 T6963C_Write_char_adv( (char) (((Loom_Starting_value)%10)      +48),128,72);*/
                  delay_ms(250);

                  Increment_Decerement_Char(&Loom_Starting_value,81,112,72);

                  EEPROM_Write((Loom_Starting_NO_addr),Loom_Starting_value);
                  delay_ms(5);
}


void Pick_Set_All(void)
{
unsigned char i=0;

                  T6963C_Write_Text_Adv_ROM(" SET PICK / INCH ",50,48);

                  GLCD_Print_Int_With_LeadingZero( Picks4inchA,102,72);
                  
                  /*T6963C_Write_char_adv(((char) (((Picks4inchA/10)%10)+48)),112,72);
                  T6963C_Write_char_adv(((char) (((Picks4inchA)%10)+48)),120,72);*/

                  T6963C_Cursor(0);              // Cursor off
                  T6963C_Cursor(1);
                  T6963C_Cursor_Blink(1);

                  delay_ms(250);
                  Increment_Decerement_Char(&Picks4inchA,250,102,72);
                  for(i=0;i<=15;i++)
                  {
                    EEPROM_Write(Picks4inchA_addr+i,Picks4inchA);
                    delay_ms(30);
                  }
                           load_Picks4inch(void);//EEPORM SAVE PURPOSE
                           T6963C_PanelFill(0);
                           T6963C_Write_Text_Adv_ROM("SAVING FOR ALL LOOMS",44,48);
                           delay_ms(1500);
                           T6963C_Cursor(0);
                           return;

}
void Pick_Set_One_one(void)
{
unsigned char i=0;
                  for(i=0;i<=15;i++)
                  {


                    T6963C_PanelFill(0);
                    T6963C_Write_Text_Adv_ROM("SET PICK/INCH:",50,16);
                    T6963C_Write_Text_Adv_ROM("LOOM NUMBER:",8,40);
                    GLCD_Print_Int_With_LeadingZero ( (Loom_Starting_value+i) , 104,40);
                    
                    /*T6963C_Write_char_adv(  (  (char) (((unsigned int)((Loom_Starting_value+i)/10)%10)  +48)), 88,40);
                    T6963C_Write_char_adv(  (  (char) (((unsigned int)((Loom_Starting_value+i))%10)     +48)), 96,40);*/



                    Picks4inchA = EEPROM_Read(Picks4inchA_addr+i);
                    T6963C_Write_Text_Adv_ROM("SET PICK FOR INCH:",8,64);
                    GLCD_Print_Int_With_LeadingZero (Picks4inchA,158,64);
                    
/*T6963C_Write_char_adv(((char) (((Picks4inchA/100)%10)+48)),128,64);
                    T6963C_Write_char_adv(((char) (((Picks4inchA/10)%10)+48)) ,136,64);
                    T6963C_Write_char_adv(((char) (((Picks4inchA)%10)+48))    ,144,64);*/

                    delay_ms(250);
                    Increment_Decerement_Char(&Picks4inchA,250,158,64);
                    EEPROM_Write(Picks4inchA_addr+i,Picks4inchA);
                    delay_ms(30);

                    if(Stop==0)
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
                           T6963C_PanelFill(0);
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
                           T6963C_PanelFill(0);
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
                           T6963C_PanelFill(0);
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
                           T6963C_PanelFill(0);
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


                         if(Start==0)
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

                         if(Stop==0)
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

                         if(Set==0)
                           {

                             T6963C_PanelFill(0);
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

                         if(Reverse==0)
                          {
                           Exit_loop=1;
                           Hold_mode=1;
                           Reset_loop=0;
                           exit1=1;
                           GIE_bit       = 1;
                           PEIE_bit      = 1;
                           delay_ms(250);
                           return;
                          }

                     }


             }
}

void Reset_All_Loom(void)
   {
unsigned int i=0,j=0,k=0;



         while (EEPROM_Reset_Attempt_Count_bit  <= 1 )
        {
           T6963C_PanelFill(0);
//==================================== ANIMATION =====================================================

     T6963C_Write_Text_Adv_ROM("UPDATING...",78,32);
     T6963C_Write_Text_Adv_ROM("PLEASE WAIT",78,48);
     
//========================================= DISABLE INTERUPT [TILL EEPROM COMPLETE]========================================================
   PEIE_bit  = 0;
   GIE_bit   = 0;

//                   X0  Y0   X1  Y1
    T6963C_rectangle(80,104, 160, 90 , T6963C_WHITE); //FOR ANMIATION OUTER BOX

//======================================== WRITE SECTION ========================================
          for(i=0;i<16;i++)
             {
              Loading_Fill(i);//0 TO 16
              j=i*96;
                 for(k=j;k<(96+j);k++)
                 {
                 EEPROM_AT24C32_WrInt(InchA_addr+(2*k),0);
                 delay_ms(10);

                 }
             }
            for(i=0;i<16;i++)
            {
                 Loading_Fill(i+25);// from 25 to  41
                 EEPROM_Write_int((InchA_addr_Temp+(2*i)),0);
                 delay_ms(10);
            }

//============================================ [READ] VERIFY EEPROM RESET [LOGIC]  =================================================
            Verify_EEPROM_Data_Clear();

//============================================  EEPROM STATUS DSIPLAY  =================================================
                if( (EEPROM_RST_Check_bit == 1) && (EEPROM_Reset_Attempt_Count_bit == 1) )  //FIRST TIME
                {
                   EEPROM_RST_Check_bit = 0;//CLEAR RST STATE
                   T6963C_PanelFill(0);
                   T6963C_Write_Text_Adv_ROM("EEPROM RESET FAIL",52,60);
                   T6963C_PanelFill(0);
                   T6963C_PanelFill(0);
                    



                }
                else if( (EEPROM_RST_Check_bit == 1) && ( EEPROM_Reset_Attempt_Count_bit == 2) ) //SECOND TIME
                {
                  EEPROM_RST_Check_bit = 0;//CLEAR RST STATE
                  T6963C_PanelFill(0);
                  T6963C_Write_Text_Adv_ROM("AGAIN EEPROM RESET FAIL",4,60);
                  delay_ms(2000);

                    T6963C_PanelFill(0);
                    while(Reverse == 1)
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
                else  //IF OK STAGE
                {
                   T6963C_PanelFill(0);
                   T6963C_Write_Text_Adv_ROM("EEPROM RESET SUCCESS",40,60);
                   delay_ms(2000);
                   break;
                }
                
        }


//========================================= RE-ENABLE INTERUPT ========================================================
   PEIE_bit  = 1;
   GIE_bit   = 1;


//========================================== VARIABLE RESETING STAGE ==========================================
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
                    T6963C_PanelFill(0);

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

                    T6963C_box(104,64,136,73, T6963C_BLACK);
                    GLCD_Print_Int_With_LeadingZero ( (i+Loom_Starting_value) ,112,64);
                    
                    /*T6963C_Write_char_adv((((char)((i+Loom_Starting_value)/10)%10)+48),112,64);
                    T6963C_Write_char_adv((((char)((i+Loom_Starting_value))%10)+48),120,64);*/


                    T6963C_Write_Text_Adv_ROM("IF YES PRESS INCH",52,80);
                    delay_ms(250);
                     j=i*96;


                    while(Inc_Reset==0)
                    {
                      if(Reverse==0)
                      {
                      load_inch(void);
                      delay_ms(500);
                      return;
                      }
                      if(Start==0)
                      {
                      Inc_Reset=1;
                      delay_ms(1000);

                      }
                      if(Set==0)
                      {
                          for(k=j;k<(96+j);k++)
                           {
                             EEPROM_AT24C32_WrInt(InchA_addr+(2*k),0);
                             delay_ms(10);
                           }
                         EEPROM_Write_int((InchA_addr_Temp+(2*i)),0);
                         delay_ms(100);
                         while(Set==0)
                         delay_ms(100);
                          Inc_Reset=1;
                       }
                    }



                  }
                  load_inch(void);
                  //load_inch_External(void);
   }

void Reset_Shift_One_one(void)
{

unsigned char Reset_loop=0,ColourExit2=0,item=0,SplFlag=0;
static unsigned char Loom_no=1,Shift_no=1;
static unsigned int Colour_Addr,LoomStartAddr,i=0,j=0,k=0,Loom_noA=0;


              Save_shiftwise();
             while(ColourExit2==0)
             {
                 T6963C_PanelFill(0);
                 T6963C_Write_Text_Adv_ROM("LOOM:NO    SHIFT:NO",30,8);
                 delay_ms(1500);

                 Loom_no=Loom_Starting_value;
                 Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),20,24);

                 while(Loom_no<Loom_Starting_value)
                 {
                   Loom_no=Loom_Starting_value;
                   T6963C_PanelFill(0);
                   T6963C_Write_Text_Adv_ROM("INVALD VALUE",11,8);
                   T6963C_Write_Text_Adv_ROM("FOR THIS BOX",11,24);
                   delay_ms(1500);
                   T6963C_PanelFill(0);
                   T6963C_Write_Text_Adv_ROM("LOOM:NO    SHIFT:NO",30,8);
                   delay_ms(1500);
                   Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),32,24);
                 }

                 Increment_Decerement(&Shift_no,96,100,24);
                 delay_ms(1000);


                 Loom_no=(Loom_no-(Loom_Starting_value-1));

                 Loom_noA = Loom_no;
                 j=(Loom_noA-1)*192;
                 LoomStartAddr=j+InchA_addr;
                 k = ((Shift_no-1)*2);

                 EEPROM_AT24C32_WrInt((LoomStartAddr+k),0);
                 delay_ms(500);

                 EEPROM_Write_int((InchA_addr_Temp+(2*(Loom_noA-1))),0);
                 delay_ms(10);


                 T6963C_PanelFill(0);
                 T6963C_Write_Text_Adv_ROM("RESETTING DONE",64,8);
                 T6963C_Write_Text_Adv_ROM("PRESS & HOLD BLACK BUTTON",20,24);
                 T6963C_Write_Text_Adv_ROM("IF YOU WANT TO EXIT",44,40);
                 delay_ms(4000);

                  if(Reverse==0)
                  {
                  ColourExit2=1;
                  }

             }

             delay_ms(1000);
             load_inch();

}



void Display_variable_Update_Left_Pulse_picks(void)
{
       // LEFT HALF PULSE PICKS
        unsigned char Inch_Order_Count=0;
        unsigned int  Pulse_Pick_Left_Order[8];

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
      T6963C_box(21+Fi_Xpos, 1+Ypos+(13*Inch_Order_Count), 21+Fi_Xpos+19, Ypos+(13*Inch_Order_Count)+10, T6963C_BLACK);
      IntToStr(Pulse_Pick_Left_Order[Inch_Order_Count], Text);
      T6963C_Write_Text_Adv(Text,20+Fi_Xpos       ,Ypos+(13*Inch_Order_Count));
      delay_ms(5);
    }


return;
}


void Display_variable_Update_Left_Inches(void)
{
   int Value_int=0;
   unsigned char Inch_Order_Count=0;

// LEFT HALF INCHES
    for(Inch_Order_Count=0 ; Inch_Order_Count < 8; Inch_Order_Count++ )
    {
      Value_int= (int)Inch[Inch_Order_Count];
      T6963C_box(44+Fi_Xpos, 1+Ypos+(13*Inch_Order_Count), 44+Fi_Xpos+27, Ypos+(13*Inch_Order_Count)+10, T6963C_BLACK);//CLEAR PURPOSE
      IntToStr(Value_int, Text);
      T6963C_Write_Text_Adv(Text,43+Fi_Xpos       ,Ypos+(13*Inch_Order_Count));//PREV 45
      delay_ms(5);

    }


return;
}

void Display_variable_Update_Right_Pulse_picks(void)
{
 //RIGHT HALF PULSE PICKS
     unsigned char Inch_Order_Count=0;
     unsigned int  Pulse_Pick_Right_Order[8];
 
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
      T6963C_box(141+Fi_Xpos, 1+Ypos+(13*Inch_Order_Count), 141+Fi_Xpos+19, Ypos+(13*Inch_Order_Count)+10, T6963C_BLACK);
      IntToStr(Pulse_Pick_Right_Order[Inch_Order_Count], Text);
      T6963C_Write_Text_Adv(Text,138+Fi_Xpos       ,Ypos+(13*Inch_Order_Count));
      delay_ms(5);
    }


return;
}

void Display_variable_Update_Right_Inches(void)
{

    // RIGHT HALF INCHES   InchI
   int Value_int=0;
   unsigned char Inch_Order_Count=0;
   
    for(Inch_Order_Count=0 ; Inch_Order_Count < 8; Inch_Order_Count++ )
    {
      Value_int= (int)Inch[Inch_Order_Count + 8];
      T6963C_box(164+Fi_Xpos, 1+Ypos+(13*Inch_Order_Count), 164+Fi_Xpos+27, Ypos+(13*Inch_Order_Count)+10, T6963C_BLACK);//CLEAR PURPOSE
      IntToStr(Value_int, Text);
      T6963C_Write_Text_Adv(Text,163+Fi_Xpos       ,Ypos+(13*Inch_Order_Count));
      delay_ms(5);
    }

return;
}


void Variable_Reset(void)
{
   inchA = EEPROM_AT24C32_RdInt((InchA_addr+(2*Shift_value)));
   delay_ms(30);
   inchB = EEPROM_AT24C32_RdInt((InchB_addr+(2*Shift_value)));
   delay_ms(30);
   inchC = EEPROM_AT24C32_RdInt((InchC_addr+(2*Shift_value)));
   delay_ms(30);
   inchD = EEPROM_AT24C32_RdInt((InchD_addr+(2*Shift_value)));
   delay_ms(30);
   inchE = EEPROM_AT24C32_RdInt((InchE_addr+(2*Shift_value)));
   delay_ms(30);
   inchF = EEPROM_AT24C32_RdInt((InchF_addr+(2*Shift_value)));
   delay_ms(30);
   inchG = EEPROM_AT24C32_RdInt((InchG_addr+(2*Shift_value)));
   delay_ms(30);
   inchH = EEPROM_AT24C32_RdInt((InchH_addr+(2*Shift_value)));
   delay_ms(30);
   inchI = EEPROM_AT24C32_RdInt((InchI_addr+(2*Shift_value)));
   delay_ms(30);
   inchJ = EEPROM_AT24C32_RdInt((InchJ_addr+(2*Shift_value)));
   delay_ms(30);
   inchK = EEPROM_AT24C32_RdInt((InchK_addr+(2*Shift_value)));
   delay_ms(30);
   inchL = EEPROM_AT24C32_RdInt((InchL_addr+(2*Shift_value)));
   delay_ms(30);
   inchM = EEPROM_AT24C32_RdInt((InchM_addr+(2*Shift_value)));
   delay_ms(30);
   inchN = EEPROM_AT24C32_RdInt((InchN_addr+(2*Shift_value)));
   delay_ms(30);
   inchO = EEPROM_AT24C32_RdInt((InchO_addr+(2*Shift_value)));
   delay_ms(30);
   inchP = EEPROM_AT24C32_RdInt((InchP_addr+(2*Shift_value)));
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

                   T6963C_PanelFill(0);
                   while (Cycle_exit==0)
                   {
                      T6963C_PanelFill(0);
                   
                    T6963C_Write_Text_Adv_ROM("SHIFT CYCLE OVER",56,8);
                    
                    //ARROW
                    T6963C_Write_char_adv(45,1,24 );
                    T6963C_Write_char_adv(45,3,24 );
                    T6963C_Write_char_adv(62,4,24 );
                    T6963C_Write_Text_Adv_ROM("IF OK PRESS[START]",14,24);


                    T6963C_Write_Text_Adv_ROM("OR",30,40);

                    //ARROW
                    T6963C_Write_char_adv(45,1,56 );
                    T6963C_Write_char_adv(45,3,56 );
                    T6963C_Write_char_adv(62,4,56 );
                    T6963C_Write_Text_Adv_ROM("PRESS STOP",   14, 56);
                    T6963C_Write_Text_Adv_ROM("NOTE: 96th SHIFT", 14, 72);
                    T6963C_Write_Text_Adv_ROM("NOTE METER & RESET SHIFT",   14, 88);
                    
                    //ARROW
                    T6963C_Write_char_adv(45,1, 104 );
                    T6963C_Write_char_adv(45,3,104 );
                    T6963C_Write_char_adv(62,4,104 );
                    T6963C_Write_Text_Adv_ROM("PRESS INCH TO RESET ALL LOOM",  14, 104);

                    delay_ms(1000);
                    
                        if (Start==0)
                        {

                              Cycle_exit=1;
                              Shift_value=0;
                              delay_ms(150);
                              Variable_Reset();
                              delay_ms(150);
                              T6963C_PanelFill(0);
                              T6963C_Write_Text_Adv_ROM("SHIFT CHANGED",80,48);
                              GLCD_Print_Int_With_LeadingZero ( (Shift_value+1),112,64);


                              delay_ms(2000);
                        }

                        if (Stop==0)
                          {
                          menushift_sec=0;
                          delay_ms(150);
                          while(Stop==0);
                          delay_ms(150);
                          return;
                          }
                        if (Set == 0)//T O RESET ALL LOOMS PURPOSE
                        {
                        
//================================= TO RESET ALL LOOMS =====================================================
                               T6963C_PanelFill(0);
                               Reset_All_Loom();
                               delay_ms(200);
                               
//================================= SHIFT CHANGING TO 1 LOGIC =====================================================
                              Cycle_exit=1;
                              Shift_value=0;
                              delay_ms(150);
          //                    Variable_Reset();
                              delay_ms(150);
                              T6963C_PanelFill(0);
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


//=================================================================================

                 T6963C_PanelFill(0);
                 T6963C_Write_Text_Adv_ROM("DATE MONTHS YEAR",56,36);
                 delay_ms(500);

                 Date=Read_RTC(4);
                 Month=Read_RTC(5);
                 Year=Read_RTC(6);

                 GLCD_Print_Int_With_LeadingZero (Date,64,64);

                 /*T6963C_Write_char_adv((((char)((Date)/10)%10)+48),64,64);
                 T6963C_Write_char_adv((((char)((Date))%10)+48)   ,72,64);*/

                 GLCD_Print_Int_With_LeadingZero (Month,112,64);

                 /*T6963C_Write_char_adv((((char)((Month)/10)%10)+48),112,64);
                 T6963C_Write_char_adv((((char)((Month))%10)+48)   ,120,64);*/

                 GLCD_Print_Int_With_LeadingZero (Year,156,64);

                 /*T6963C_Write_char_adv((((char)((Year)/10)%10)+48),156,64);
                 T6963C_Write_char_adv((((char)((Year))%10)+48)   ,164,64);*/
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

                 T6963C_PanelFill(0);
                 T6963C_Write_Text_Adv_ROM("HOUR MINUTES SECONDS",56,36);
                 delay_ms(1500);

                 Hour=Read_RTC(2);
                 Min=Read_RTC(1);
                 Sec=Read_RTC(0);

                 GLCD_Print_Int_With_LeadingZero (Hour,64,64);
                 /*T6963C_Write_char_adv((((char)((Hour)/10)%10)+48),64,64);
                 T6963C_Write_char_adv((((char)((Hour))%10)+48),72,64);*/
                 GLCD_Print_Int_With_LeadingZero(Min,112,64);

                 /*T6963C_Write_char_adv((((char)((Min)/10)%10)+48),112,64);
                 T6963C_Write_char_adv((((char)((Min))%10)+48),120,64);*/

                 GLCD_Print_Int_With_LeadingZero(Sec,168,64);
                 /*T6963C_Write_char_adv((((char)((Sec)/10)%10)+48),168,64);
                 T6963C_Write_char_adv((((char)((Sec))%10)+48),176,64);*/


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
                 Hour  =Read_RTC(2);
                 Min   =Read_RTC(1);
                 Date  =Read_RTC(4);
                 Month =Read_RTC(5);
                 Year  =Read_RTC(6);
                 delay_ms(400);

}
void Read_Shift_Date_Time(unsigned char Shift_no )
{

                 Hour  =EEPROM_AT24C32_RdByte((Date_Time_addr+(5*(Shift_no-1))+0));
                 Min   =EEPROM_AT24C32_RdByte((Date_Time_addr+(5*(Shift_no-1)+1)));
                 Date  =EEPROM_AT24C32_RdByte((Date_Time_addr+(5*(Shift_no-1)+2)));
                 Month =EEPROM_AT24C32_RdByte((Date_Time_addr+(5*(Shift_no-1)+3)));
                 Year  =EEPROM_AT24C32_RdByte((Date_Time_addr+(5*(Shift_no-1)+4)));
                 delay_ms(400);
}

void Factory_Reset(void)
{
    Power_up_bit=0;
    if(Power_up_bit==0)
    {
      EEPROM_Write(First_Time_addr,0xFF);
      LOAD_EEPROM_Param(void);
      Power_up_bit=1;
    }
}


void Increment_Decerement(unsigned char *var,unsigned char limit,unsigned char Pos_x,unsigned char Pos_y)
{

unsigned char dummy=0,dummy1=0xFF;
unsigned char list=0;
unsigned char increment_exit=0;
//lcd_cmd(0x0F);


T6963C_Cursor(1);
T6963C_Cursor_Blink(1);

cposx= (Pos_x/8)+3;
cposy= (Pos_y/8);
T6963C_set_cursor(cposx,cposy);

while((list==0)&&(increment_exit==0))
{
    asm CLRWDT;

    if((Start==0) && (*var<limit))
    {
      delay_ms(150);
      if(*var<=240)
       {
//===================================== FROM THIS LINE WE NEED TO CHECK IT =====================================
                  *var=*var+10;
                  T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
                  GLCD_Print_Int_With_LeadingZero(dummy,Pos_x,Pos_y);
                   
                  /*T6963C_Write_char_adv(((char) (((dummy/100)%10)+48)),Pos_x,Pos_y);
                  T6963C_Write_char_adv(((char) (((dummy/10)%10)+48)) ,Pos_x+8,Pos_y);
                  T6963C_Write_char_adv(((char) (((dummy)%10)+48))    ,Pos_x+16,Pos_y);*/
                  
                  dummy1=dummy;
       }
       else
       {
                 *var=limit;
                  T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
                  GLCD_Print_Int_With_LeadingZero(dummy ,Pos_x,Pos_y);
                  
                  /*T6963C_Write_char_adv(((char) (((dummy/100)%10)+48)) ,Pos_x,Pos_y);
                  T6963C_Write_char_adv(((char) (((dummy/10)%10)+48))  ,Pos_x+8,Pos_y);
                  T6963C_Write_char_adv(((char) (((dummy)%10)+48))     ,Pos_x+16,Pos_y);*/
                  dummy1=dummy;
       }

      if(*var>=limit)
         *var=limit;
    }

    if((Stop==0)&&(*var>0)&&(Start==1))
    {
      {
          delay_ms(150);
          *var=*var-1;
      }

                  T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
                  GLCD_Print_Int_With_LeadingZero(dummy,Pos_x,Pos_y);
                  
                  /*T6963C_Write_char_adv(((char) (((dummy/100)%10)+48)),Pos_x,Pos_y);
                  T6963C_Write_char_adv(((char) (((dummy/10)%10)+48)) ,(Pos_x+8),Pos_y);
                  T6963C_Write_char_adv(((char) (((dummy)%10)+48))    ,(Pos_x+16),Pos_y);*/
                  
                  dummy1=dummy;
    }

    if((Reverse==0)&&(*var>0)&&(Start==1))
    {
      {
          delay_ms(150);
          *var=0;
      }

                  T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
                  GLCD_Print_Int_With_LeadingZero(dummy,Pos_x,Pos_y);
                  
                  /*T6963C_Write_char_adv(((char) (((dummy/100)%10)+48)),Pos_x,Pos_y);
                  T6963C_Write_char_adv(((char) (((dummy/10)%10)+48)) ,(Pos_x+8),Pos_y);
                  T6963C_Write_char_adv(((char) (((dummy)%10)+48))    ,(Pos_x+16),Pos_y);*/
                  
                  dummy1=dummy;

    }
    if(Set==0)
    {
    T6963C_Cursor(0);
    ColourExit++;
    list=1;
    increment_exit=1;
    delay_ms(350);
    while(Set==0);
    delay_ms(350);
    return;
    }

    dummy=*var;

    if((dummy!=dummy1) || (dummy1==0xFFFF))
    {
                  T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
                  GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);
                  
                  /*T6963C_Write_char_adv(((char) (((dummy/100)%10)+48)),Pos_x,Pos_y);
                  T6963C_Write_char_adv(((char) (((dummy/10)%10)+48)) ,(Pos_x+8),Pos_y);
                  T6963C_Write_char_adv(((char) (((dummy)%10)+48))    ,(Pos_x+16),Pos_y);*/
                  dummy1=dummy;
    }
   }
            T6963C_PanelFill(0);
}


void Increment_Decerement_Char(unsigned char *var,unsigned char limit,unsigned char Pos_x,unsigned char Pos_y)
{

unsigned char dummy=0,dummy1=0xFF;
unsigned char list=0;
unsigned char increment_exit=0;
//lcd_cmd(0x0F);

T6963C_Cursor(1);
T6963C_Cursor_Blink(1);

cposx= (Pos_x/8)+3;
cposy= (Pos_y/8);
T6963C_set_cursor(cposx,cposy);


while((list==0)&&(increment_exit==0))
{
    asm CLRWDT;
    if((Start==0) && (*var<limit))
    {
      delay_ms(150);

      if(*var<=240)
       {
          *var=*var+10;

          T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
          GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);

          /*T6963C_Write_char_adv(((char) (((dummy/100)%10)+48)),Pos_x,Pos_y);
          T6963C_Write_char_adv(((char) (((dummy/10)%10)+48)) ,(Pos_x+8),Pos_y);
          T6963C_Write_char_adv(((char) (((dummy)%10)+48))    ,(Pos_x+16),Pos_y);*/

       }
       else
       {
          *var=limit;
           GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);
           
           /*T6963C_Write_char_adv(((char) (((dummy/100)%10)+48)),Pos_x,Pos_y);
           T6963C_Write_char_adv(((char) (((dummy/10)%10)+48)) ,(Pos_x+8),Pos_y);
           T6963C_Write_char_adv(((char) (((dummy)%10)+48))    ,(Pos_x+16),Pos_y);*/
       }

      if(*var>=limit)
         *var=limit;
    }
    if((Stop==0)&&(*var>0)&&(Start==1))
    {
      {
          delay_ms(150);
          *var=*var-1;
      }
                  T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
                  GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);

                  /*T6963C_Write_char_adv(((char) (((dummy/100)%10)+48)),Pos_x,Pos_y);
                  T6963C_Write_char_adv(((char) (((dummy/10)%10)+48)) ,(Pos_x+8),Pos_y);
                  T6963C_Write_char_adv(((char) (((dummy)%10)+48))    ,(Pos_x+16),Pos_y);*/
    }


    if((Reverse==0)&&(*var>0)&&(Start==1))
    {
      {
          delay_ms(150);
          *var=0;
      }

                  T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
                  GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);
                  
                 /*T6963C_Write_char_adv(((char) (((dummy/100)%10)+48)),Pos_x,Pos_y);
                  T6963C_Write_char_adv(((char) (((dummy/10)%10)+48)) ,(Pos_x+8),Pos_y);
                  T6963C_Write_char_adv(((char) (((dummy)%10)+48))    ,(Pos_x+16),Pos_y);*/
                  dummy1=dummy;

    }
    if(Set==0)
    {
    T6963C_Cursor(0);
    ColourExit++;
    list=1;
    increment_exit=1;
    delay_ms(350);
    while(Set==0);
    delay_ms(350);
    return;
    }


    dummy=*var;

    if((dummy!=dummy1) || (dummy1==0xFFFF))
    {

       T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
       GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);

      /*T6963C_Write_char_adv(((char) (((dummy/100)%10)+48)),Pos_x,Pos_y);
       T6963C_Write_char_adv(((char) (((dummy/10)%10)+48)) ,(Pos_x+8),Pos_y);
       T6963C_Write_char_adv(((char) (((dummy)%10)+48))    ,(Pos_x+16),Pos_y);*/

       dummy1=dummy;
    }

   }
T6963C_PanelFill(0);
}


// INC_DEC_FLOAT
void Increment_Decerement_Float(float *var, float limit,unsigned char Pos_x,unsigned char Pos_y)
{
bit first_time;
float dummy=0,dummy1=-9999.0;
unsigned char list=0;
unsigned char increment_exit=0;
//lcd_cmd(0x0F);

T6963C_Cursor(1);
T6963C_Cursor_Blink(1);

cposx= (Pos_x/8)+3;
cposy= (Pos_y/8);
T6963C_set_cursor(cposx,cposy);

/*T6963C_PanelFill(0);
     T6963C_Write_Text_Adv_ROM("PAY SETTINGS ENTER",90,80);
     delay_ms(2000);*/

 //RESET STATE [BIT]
 first_time=1;

while( (list == 0 ) && (increment_exit == 0) )
{
    asm CLRWDT;
     T6963C_Write_Text_Adv_ROM("RUPEES=",80, 64);
     T6963C_set_cursor(23,8);
    
    if( (Start==0) && (*var < limit) )
    {
      delay_ms(150);
//======================================== START ====================================================
      if(*var <= 240.0)  //MAX LIMIT
       {
          *var=*var + 0.5;
          dummy = *var;

                  T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);//CLEARING THE TEXT  PURPOSE
                          //EX-12.346574
                  FloatToStr_SingleDecimal(dummy,Text);//12.34
                  Ltrim(Text);//  12.34->12.34
                  T6963C_Write_Text_Adv(Text,Pos_x,Pos_y);
                  Glcd_Buffer_Clear();

       }
       else
       {
/**var=limit;//TO AVOID EXCEED PURPOSE
           T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
           GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);*/

                  *var=limit;//TO AVOID EXCEED PURPOSE
                   dummy = *var;
                  T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);//CLEARING THE TEXT  PURPOSE
                          //EX-12.346574
                  FloatToStr_SingleDecimal(dummy,Text);//12.34
                  Ltrim(Text);//  12.34->12.34
                  T6963C_Write_Text_Adv(Text,Pos_x,Pos_y);
                  Glcd_Buffer_Clear();
       }

      if(*var>=limit)
         *var=limit;
    }

//======================================== STOP ====================================================
    if((Stop==0)&&(*var > 0.0 )&&(Start==1))
    {
          delay_ms(150);
          *var=*var-0.1;
          dummy = *var;
          
          T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);//CLEARING THE TEXT  PURPOSE
         //EX-12.346574
          FloatToStr_SingleDecimal(dummy,Text);//12.34
          Ltrim(Text);//  12.34->12.34
          T6963C_Write_Text_Adv(Text,Pos_x,Pos_y);
          Glcd_Buffer_Clear();

          if(*var < 0.0)
          {
            *var=0.0;
          }
    }


//======================================== REVERSE ====================================================
    if((Reverse==0)&&(*var>0)&&(Start==1))
    {

                  delay_ms(150);
                  *var=0;//RESET PURPOSE
                   dummy = *var;
                  T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);//CLEARING THE TEXT  PURPOSE
                          //EX-12.346574
                  FloatToStr_SingleDecimal(dummy,Text);//12.34
                  Ltrim(Text);//  12.34->12.34
                  T6963C_Write_Text_Adv(Text,Pos_x,Pos_y);
                  Glcd_Buffer_Clear();

                  dummy1=dummy;

    }

//======================================== SET ====================================================
    if(Set==0)
    {
         if( *var <= 0)  //INVALID STATE
         {
           T6963C_PanelFill(0);
           T6963C_Write_Text_Adv_ROM("INVALID VALUE",60,60);
            T6963C_set_cursor(23,8);
           delay_ms(2000);
           T6963C_PanelFill(0);
           
           //PRINTING VALUE
           dummy =*var;
            T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK); // clear
            FloatToStr_SingleDecimal(dummy, Text);
            Ltrim(Text);
            T6963C_Write_Text_Adv(Text, Pos_x, Pos_y);
            Glcd_Buffer_Clear();
         }
         else  //VALID STATE
         {
            ColourExit++;
            list=1;
            increment_exit=1;
            delay_ms(350);
            while(Set==0);
            delay_ms(350);
            return;
         }
    }


    dummy=*var;


      if(first_time == 1 || (dummy != dummy1)) //PRINT IN FIRST TIME AND VLAUE CHANGES ALONE
      {
          T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK); // clear
          FloatToStr_SingleDecimal(dummy, Text);
          Ltrim(Text);
          T6963C_Write_Text_Adv(Text, Pos_x, Pos_y);
          Glcd_Buffer_Clear();

          dummy1 = dummy;
          first_time = 0;//BIT RESET
      }

   }

T6963C_PanelFill(0);
}



/*// this one works smooth and fine as of now for minus and 3 digts too
void FloatToStr_SingleDecimal(float num, char *str)
{
     //12345.67
    int integerPart = (int)num;  // Get the integer part        [1234]
    float decimalPart = num - integerPart;  // Get the decimal part
    int decimalDigit;
    int idx = 0;

    // Handle the decimal part (take the first digit after the decimal point)
    if (decimalPart < 0)
    {
        decimalPart = -decimalPart;  // Make decimal part positive for easy calculation
    }

    // Multiply decimal part by 10 and cast to int to get the first decimal digit
    decimalDigit = (int)(decimalPart * 10);



    // Handle negative numbers
    if (num < 0)
     {
        str[idx++] = '-';  // Add minus sign for negative numbers
        integerPart = -integerPart;  // Work with the positive part of the number for formatting
    }

    // Handle the integer part (Multiple digits for larger numbers)
    if (integerPart >= 1000)
    {
        str[idx++] = (integerPart / 1000) + '0';  // Thousands place
        str[idx++] = ((integerPart / 100)%10) + '0';  // Hundreds place
        str[idx++] = ((integerPart / 10) % 10) + '0';  // Tens place
        str[idx++] = (integerPart % 10) + '0';  // Ones place
    }
    else if (integerPart >= 100)
    {
        str[idx++] = (integerPart / 100) + '0';  // Hundreds place
        str[idx++] = ((integerPart / 10) % 10) + '0';  // Tens place
        str[idx++] = (integerPart % 10) + '0';  // Ones place
    }
    else if (integerPart >= 10)
    {
        str[idx++] = (integerPart / 10) + '0';  // Tens place
        str[idx++] = (integerPart % 10) + '0';  // Ones place
    } else
    {
        str[idx++] = integerPart + '0';  // Single digit
    }

    // Add the decimal point
    str[idx++] = '.';

    // Handle the decimal part
    str[idx++] = decimalDigit + '0';  // Add the first decimal digit to string

    // Null-terminate the string
    str[idx] = '\0';
}*/


void FloatToStr_SingleDecimal(float num, char *str)
{
    long value10;
    long intPart;
    int decPart;
    int idx = 0;

    // Handle negative numbers
    if(num < 0)
    {
        str[idx++] = '-';
        num = -num;
    }

    // Convert to 1-decimal integer form (TRUNCATE)
    value10 = (long)(num * 10.0);

    intPart = value10 / 10;
    decPart = value10 % 10;

    // ---- convert intPart to string manually ----
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

    // Add decimal point
    str[idx++] = '.';

    // Add decimal digit
    str[idx++] = decPart + '0';

    // Null terminate
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

    // 1) Convert float -> scaled integer (x10)
    // TRUNCATE (not round)
    A10 = (long)(A * 10.0f + 0.0001f);
    B10 = (long)(B * 10.0f + 0.0001f);

    // 2) Multiply -> result is x100
    result100 = A10 * B10;//261 *12 =3132

    // 3) Convert to x10 (1 decimal) -> TRUNCATE
    result10 = result100 / 10;//313

    // 4) Handle negative
    if(result10 < 0)
    {
        *out++ = '-';
        result10 = -result10;
    }

    // 5) Split integer and decimal
    intPart = result10 / 10;//31
    decPart = result10 % 10;//3

    // 6) Convert integer part to string
    LongToStr(intPart, buf);//31
    Ltrim(buf);
    strcpy(out, buf);        //31

    // 7) Add decimal point + digit
    strcat(out, ".");//31.
    out = out + strlen(out);//POINTER ARITHMETIC CONCEPT USED
    *out++ = decPart + '0';//POST INCREMENT [POSITION NULL CHARACTER]
    *out = '\0';
}


//============================== TO CLEAR BUFFER PURPOSE ==============================
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
    char temp;                     // Temporary character holder
//    unsigned short position = Y_pixel; // Keep track of LCD position

    // Write each character to the LCD until the end of the string
    while ((temp = *text++) != '\0')
     {
//     Lcd_Chr(row, position++, temp); //FOR LCD
//       T6963C_Write_Text_Adv(Text ,206,1);
         T6963C_Write_char_Adv(temp ,X_pixel,Y_pixel);
         X_pixel= X_pixel+8;

        if (X_pixel > 240)
        {
         break; // Prevent overflow on GLCD lines
        }
     }
}


  /*NOTE-
   unsigned short RANGE 255*/
   
void GLCD_Print_Int_With_LeadingZero(unsigned short value,unsigned short x,unsigned short y)
{

    IntToStr(value, text);
    Ltrim(text);
//================ WHEN BELOW TWO DIGIT NEED TO PRINT 0 IN LEFT SIDE ========================
    if(value < 10)
    {
        T6963C_Write_Text_Adv_ROM("0", x, y);// 0 NEED TO PRINT
        T6963C_Write_Text_Adv(text, x + 8, y);   // 8 = char width
    }
    else if(value >= 10)
    {
        T6963C_Write_Text_Adv(text, x, y);//ABOVE 9 VALUE WILL PRINT IN THIS CONDITION
    }
     Glcd_Buffer_Clear();
}

unsigned char GLCD_CharWidth(unsigned char ch)
{
    // control characters
    if(ch < 32) return 0;
    if(ch > 127) return 6;   // default safety

    switch(ch)
    {
        // SPACE
        case ' ': return 8;

        // Punctuation / Symbols
        case '!': return 2;
        case '"': return 4;
        case '#': return 6;
        case '$': return 6;
        case '%': return 8;
        case '&': return 7;
        case '\'': return 2;//TO PRINT ['] PUPROSE LIKE THIS MENTION
        case '(': return 3;
        case ')': return 3;
        case '*': return 4;
        case '+': return 6;
        case ',': return 2;
        case '-': return 4;
        case '.': return 2;
        case '/': return 4;

        // Digits
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

        // More punctuation
        case ':': return 2;
        case ';': return 2;
        case '<': return 6;
        case '=': return 6;
        case '>': return 6;
        case '?': return 6;
        case '@': return 8;

        // Uppercase letters
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

        // Brackets / Backslash / etc.
        case '[': return 3;
        case '\\': return 4;
        case ']': return 3;
        case '^': return 4;
        case '_': return 6;
        case '`': return 3;

        // Lowercase letters
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

        // Remaining symbols
        case '{': return 4;
        case '|': return 2;
        case '}': return 4;
        case '~': return 6;

        // DEL
        case 127: return 0;

        default:
            return 6;
    }
}





//============================== PRINTING TEXT [RAM REDUCED VERSION] ===================================
void T6963C_Write_Text_Adv_ROM(const code char *text,
                               unsigned char x,
                               unsigned char y)
{

//OK STAGE
    unsigned char ch;
    unsigned char col = x;



    while (*text)
    {
        ch =*text;
        T6963C_write_char_adv(ch, col, y);
        text++;
//        col += GLCD_CharWidth(ch) + GLCD_GAP;
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
    int x0 = 81;   // inside start
    int y0 = 104;
    int x1 = 160;  // inside end
    int y1 = 90;
              //80,104, 160, 90
    int fillX = x0 + ((x1 - x0) * percent) / 100;

//====================== to print percentage above animation box ====================================
    //CLEAR THE SECTION
    T6963C_box(108, 72, 132,80, T6963C_BLACK);
    //WRITE THE VALUE
    GLCD_Print_Int_With_LeadingZero(percent , 108 , 72 );
    T6963C_Write_Text_Adv_ROM("%",123,72);
    delay_ms(10);

    // fill from left to fillX
    T6963C_box(x0, y0, fillX, y1, T6963C_WHITE);


}



void Verify_EEPROM_Data_Clear()
{
 //============================================ VERIFY EEPROM RESET [LOGIC]  =================================================
    unsigned int i=0,j=0,k=0;

     T6963C_PanelFill(0);
     T6963C_Write_Text_Adv_ROM("CHECKING DATA..",60,60);
     
     


//============================================ RESET ALL LOOMS CHECK LOGIC ======================================================
//==================================== ANIMATION =====================================================

//                   X0  Y0   X1  Y1
    T6963C_rectangle(80,104, 160, 90 , T6963C_WHITE); //FOR ANMIATION OUTER BOX

    for (i=0 ;i<16 ;i++)
    {
         j=i*96;

         for(k=j ; k< (96+j) ; k++)   //EXTERNAL
         {
            Loading_Fill(i+50);// from 50 to  66
            EEPROM_Value_Read_Check = EEPROM_AT24C32_RdInt(InchA_addr+(2*k));
             delay_ms(10);
            if( 0  != EEPROM_Value_Read_Check  )
            {
               EEPROM_RST_Check_bit=1;
               break;
            }

         }
    }

    for(i=0;i<16;i++)   //INTERNAL
    {

         Loading_Fill(i+84);// from 84 to  100
         EEPROM_Value_Read_Check=EEPROM_Read_int((InchA_addr_Temp+(2*i)));
         delay_ms(10);
         if( 0  != EEPROM_Value_Read_Check  )
          {
             EEPROM_RST_Check_bit=1;
             break;
          }
    }

//=============================== RND PURPOSE ALONE  ============================================================
//T6963C_PanelFill(0);
/*T6963C_Write_Text_Adv_ROM("CLEAR FOR LOOP DONE",8,60);  //TEMP PURPOSE ALONE
     delay_ms(3000);*/

/*T6963C_PanelFill(0);
     T6963C_Write_Text_Adv_ROM("MANUALLY WRITE DATA",8,60);   //TEMP PURPOSE ALONE
     delay_ms(3000);


     //TEMPORARY CHECKING PURPOSE
     if( EEPROM_Reset_Attempt_Count_bit == 0)
     {
      // EEPROM_Write_int((InchA_addr_Temp+(2*0)),2);//MANUALLY WRITE
       EEPROM_Value_Read_Check = EEPROM_Read_int(  (InchA_addr_Temp+(2*0) ) );

          if( 0  != EEPROM_Value_Read_Check  )
          {
             T6963C_PanelFill(0);
             T6963C_Write_Text_Adv_ROM("MANUALLY CORRUPT SET",8,60);  //TEMP PURPOSE ALONE
             delay_ms(3000);
            // EEPROM_RST_Check_bit=1;
          }
     }*/
//========================================================================================================================*/

        if(EEPROM_RST_Check_bit == 1 && EEPROM_Reset_Attempt_Count_bit == 0 )  //FIRST TIME
        {
           EEPROM_Reset_Attempt_Count_bit=1;
        }
        else if(EEPROM_RST_Check_bit == 1 && EEPROM_Reset_Attempt_Count_bit == 1) //SECOND TIME
        {
                //Reset_All_Loom();//AGIN EEPROM GET RESET
                EEPROM_Reset_Attempt_Count_bit=2;//TO AVOID ENDLESS RESET PURPOSE
                
        }



//============================================ RESET FIRST TIME[MAIN] CHECK LOGIC ======================================================

}


void Left_Side_Meter_Update()
{

          //LEFT METER PRODUCTON
            for( i=0 ;i < 8 ; i++)
            {
                asm CLRWDT;
                Meter[i]=( (float)(0.0254*Inch[i] ));
                T6963C_box(75+Fi_Xpos, 1+Ypos+(13*i), 75+Fi_Xpos+35, Ypos+(13*i)+10, T6963C_BLACK);//BOX
                FloatToStr_SingleDecimal(Meter[i],Text);
                Ltrim(Text);
                T6963C_Write_Text_Adv(Text,82+Fi_Xpos       ,Ypos+(13*i));// VALUE [METER]
                Glcd_Buffer_Clear();
                 delay_ms(5);
            }

             delay_ms(5);
}


void Left_Side_Meter_PAY_Update()
{

          //LEFT PAY
               /*if(Pay_Value == 1.5 )
                   {
                     T6963C_PanelFill(0);
                     T6963C_Write_Text_Adv_ROM("value ok",60,60);
                     delay_ms(2000);
                   }
                   else
                   {
                     T6963C_PanelFill(0);
                     T6963C_Write_Text_Adv_ROM("value not ok",60,60);
                     delay_ms(2000);
                   }*/
          
            for( i=0 ;i < 8 ; i++)
            {
                 asm CLRWDT;
                //  Value_float= (  ( (float)  (Meter[i] ) )  * ( (float) (Pay_Value) )   );

                  T6963C_box(44+Fi_Xpos, 1+Ypos+(13*i), 44+Fi_Xpos+27, Ypos+(13*i)+10, T6963C_BLACK);//CLEAR PURPOSE
                  MulFloat_To1DecimalStr(Meter[i] , Pay_Value , Text);
//                  FloatToStr_SingleDecimal(Value_float, Text);
                  T6963C_Write_Text_Adv(Text,52+Fi_Xpos       ,Ypos+(13*i));
                  delay_ms(5);
            }

             delay_ms(5);
}


void Right_Side_Meter_Update()
{
          //right METER PRODUCTON
                  for( i= 0 ;i < 8 ; i++)
                {
                    asm CLRWDT;
                    //METER
//                    Production_R=0;
                    Meter [i+8]=( (float)(0.0254*Inch[i+8] ));
                    T6963C_box(195+Fi_Xpos, 1+Ypos+(13*i), 195+Fi_Xpos+35, Ypos+(13*i)+10, T6963C_BLACK);
                    FloatToStr_SingleDecimal(Meter [i+8],Text);
                    Ltrim(Text);
                    T6963C_Write_Text_Adv(Text,204+Fi_Xpos       ,Ypos+(13*i));// VALUE [METER]
                    Glcd_Buffer_Clear();
                    delay_ms(5);
                }
                 delay_ms(5);
}


void Right_Side_Meter_PAY_Update()
{
          //right PAY PRODUCTON
                 for( i= 0 ;i < 8 ; i++)
                {
                    asm CLRWDT;

                          Value_float= (float)Meter [i+8]  * (float) Pay_Value;
                          T6963C_box(164+Fi_Xpos, 1+Ypos+(13*i), 164+Fi_Xpos+27, Ypos+(13*i)+10, T6963C_BLACK);//CLEAR PURPOSE
                          MulFloat_To1DecimalStr(Meter[i+8] , Pay_Value , Text);
                          Ltrim(Text);
                          T6963C_Write_Text_Adv(Text,173+Fi_Xpos       ,Ypos+(13*i));//PAY VALUE
                          Glcd_Buffer_Clear();
                          Value_float=0;
                          delay_ms(5);
                }
                 delay_ms(5);
}



//==================================== PICKS ============================================
void Left_Side_Pick_Update()
{
          //LEFT Picks PRODUCTON
            for( i=0 ;i < 8 ; i++)
            {
                asm CLRWDT;
                Picks[i]= (float) ( Picks4inch [i] * Inch[i] );

                T6963C_box(75+Fi_Xpos, 1+Ypos+(13*i), 75+Fi_Xpos+35, Ypos+(13*i)+10, T6963C_BLACK);//BOX
                LongToStr( (long)Picks[i],Text);
                Ltrim(Text);
                T6963C_Write_Text_Adv(Text,78+Fi_Xpos       ,Ypos+(13*i));//  VALUE [PICKS]
                Glcd_Buffer_Clear();
                 delay_ms(5);
            }
            delay_ms(5);
}


void Left_Side_Pick_Pay_Update()
{
          //LEFT Picks PRODUCTON
            for( i=0 ;i < 8 ; i++)
            {
                  asm CLRWDT;
                  T6963C_box(44+Fi_Xpos, 1+Ypos+(13*i), 44+Fi_Xpos+27, Ypos+(13*i)+10, T6963C_BLACK);//CLEAR PURPOSE
                  MulFloat_To1DecimalStr( Picks[i] , Pay_Value , Text);
                  Ltrim(Text);
                  T6963C_Write_Text_Adv(Text,50+Fi_Xpos       ,Ypos+(13*i));
                  delay_ms(5);
            }
            delay_ms(5);
}




void Right_Side_Pick_Update()
{

            // RIGHT PICKS PRODUCTON VALUES
                for( i= 0 ;i < 8 ; i++)
                {
                    asm CLRWDT;
                    //METER
                    Picks[i+8]= (float) (Picks4inch [i+8] * Inch[i+8] );
                    T6963C_box(195+Fi_Xpos, 1+Ypos+(13*i), 195+Fi_Xpos+35, Ypos+(13*i)+10, T6963C_BLACK);
                    LongToStr( (long)Picks[i+8],Text);
                    Ltrim(Text);
                    T6963C_Write_Text_Adv(Text, 196+Fi_Xpos       ,Ypos+(13*i));// VALUE [PICKS]
                    Glcd_Buffer_Clear();
                    delay_ms(5);
                 }
                 delay_ms(5);
}


void Right_Side_Pick_Pay_Update()
{

            // RIGHT PICKS PRODUCTON VALUES
                for( i= 0 ;i < 8 ; i++)
                {
                  asm CLRWDT;
                  T6963C_box(164+Fi_Xpos, 1+Ypos+(13*i), 164+Fi_Xpos+27, Ypos+(13*i)+10, T6963C_BLACK);//CLEAR PURPOSE
                  
                  MulFloat_To1DecimalStr( Picks[i+8] , Pay_Value , Text);
                  Ltrim(Text);
                  T6963C_Write_Text_Adv(Text,170+Fi_Xpos       ,Ypos+(13*i));//PAY VALUE
                  Glcd_Buffer_Clear();
                  delay_ms(5);
                }

                delay_ms(5);
}