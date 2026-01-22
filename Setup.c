#include "Setup.h"
#include "Control_Fn.h"
#include "EEPROM_Data.h"
#include "DC3231_AT24C32.h"
#include "__T6963C.h"




//============================ DEFINE ============================================

// Signals not used by library, they are set in main function
sbit T6963C_ctrlce at LATJ2_bit;                 // CE signal
sbit T6963C_ctrlfs at LATB5_bit;                 // FS signal
sbit T6963C_ctrlmd at LATH2_bit;                 // MD signal

sbit T6963C_ctrlce_Direction  at TRISJ2_bit;     // CE signal direction
sbit T6963C_ctrlfs_Direction  at TRISB5_bit;     // FS signal direction
sbit T6963C_ctrlmd_Direction  at TRISH2_bit;     // MD signal direction

extern unsigned char  panel;         // Current panel
extern unsigned char  curs;          // Cursor visibility
extern unsigned char   cposx, cposy;  // Cursor x-y position

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




//================================ INCH ===========================================================
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

//======================= FOR INTERUPT ========================
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

//================================== ADDITONAL SETTINGS =============================================
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
    
    
    EEPROM_Reset_Attempt_Count_bit=0;// COUNT FOR NO OF TIMES EEPROM NEED TO RESET AND  RECHECK PURPOSE
//      delay_ms(200);
      IO_Config();
//      delay_ms(500);
      LCD_Config();
//      delay_ms(2000);
      
            T6963C_PanelFill(0);
            T6963C_Write_Text_Adv_ROM("LCD CHECKED",76,60);
            delay_ms(5);

          EEPROM_AT24C32_Init();
          delay_ms(1000);


     
      EEPROM_Config(); //KINLDY UNCOMMENT AFTER TEX CLEARING  WORK COMMLETED
      delay_ms(300);
            
            T6963C_PanelFill(0);
            T6963C_Write_Text_Adv_ROM("MEMORY INTACT",68,60);
            delay_ms(500);
            
            Interrupt_Init(); //RBO & TMR1 INTERUPT INTIALIZED

            T6963C_PanelFill(0);
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
 ADCON0   =   0X00;
 ADCON1   =   0X00;
 ADCON2   =   0X00;


 ANCON0   =   0X00;
 ANCON1   =   0X00;
 ANCON2   =   0X00;

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


//============================== INTERUPT PBIT INTILAIZE ======================
PowerFail_Enable_bit=0;//THIS BIT WILL SET WHEN THE RBO BIT SET

 SSP1CON1=0;


 TRISA        =        0B11111111;                //RA0 TO RA3 LCD DATA PINS
 TRISB        =        0B11000001;                //
 TRISC        =        0B00100111;                //
 TRISD        =        0B00000000;                //
 TRISE        =        0B11111100;
 TRISF        =        0B01111010;
 TRISG        =        0B00001000;
 TRISH        =        0B00010011;
 TRISJ        =        0B11110000;
 
 PORTA=0x00;
 PORTB=0x00;
 PORTC=0x00;
 PORTD=0x00;
 PORTE=0X00;
 PORTF=0X00;
 PORTG=0X00;
 PORTH=0X00;
 PORTJ=0X00;
 
 
/*INT0IE_BIT     = 1;
 INT0IF_BIT     = 0;
 INTEDG0_bit    = 1;
 IPEN_bit       =1;*/
 
 


 
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

  LedR=0;
  LedG=0;
  Buzzer=1;
}

void LCD_Config(void)
{
 unsigned char  block_count=0;
 
  T6963C_ctrlce_Direction = 0;
  T6963C_ctrlce = 0;            // Enable T6963C
  T6963C_ctrlfs_Direction = 0;
  T6963C_ctrlfs = 0;            // Font Select 8x8
  T6963C_ctrlmd_Direction = 0;
  T6963C_ctrlmd = 0;            // Column number select

  panel = 0;
  curs = 0;
  cposx = cposy = 0;

  T6963C_init(240, 128, 8);
  T6963C_Graphics(1);
  T6963C_Text(1);

  /*
   * Text messages
   */



  T6963C_Cursor_Height(7);       // 8 pixel height
  //T6963C_set_cursor(28,15);       // Move cursor to top left
   T6963C_Cursor(0);              // Cursor off

   //T6963C_Cursor(1);
   T6963C_Cursor_Blink(1);

   T6963C_PanelFill(0);
   T6963C_SetGrPanel(1);                            // Select other graphic panel
   
   T6963C_image(NK_LOGO_BANNER);   //NEED TO UNCOMMENT AFTER R&D
   T6963C_DisplayGrPanel(1);
   Delay_ms(3000);

   
   T6963C_PanelFill(0);
   
   T6963C_Write_Text_Adv_ROM("NK",112,24);
   T6963C_Write_Text_Adv_ROM("AUTOMATION",80,40);
   T6963C_Write_Text_Adv_ROM("PH:9043043037",68,56);
   T6963C_Write_Text_Adv_ROM("MADE IN COIMBATORE",48,72);
   T6963C_Write_Text_Adv_ROM("TAMILNADU INDIA",60,88);

   delay_ms(3000);
   
  

/*T6963C_Write_char_adv(65, 0, 0);   // 'A'

  T6963C_Write_char_adv(66, 2, 0);   // 'B'*/






  //=====================CHECKING PURPOSE ALONE ====================================
   /*T6963C_PanelFill(0);
         T6963C_Write_Text_Adv_ROM("abcdefghijklmnopqrstuvwxyz",0,0);
         T6963C_Write_Text_Adv_ROM("ABCDEFGHIJKLMNOPQRSTUVWXYZ",0,16);
         while(1);*/
         
         // Single line box outline (progress bar frame)
/*T6963C_Write_Text_Adv_ROM("LOADING...",80,88);
            T6963C_PanelFill(0);
            T6963C_rectangle(80,104, 160, 90 , T6963C_WHITE);
            for (  block_count=0 ; block_count <=100 ;block_count++  )
            {
               Loading_Fill(block_count);
               delay_ms(400);
            }*/




//=====================================================================================
/*T6963C_PanelFill(0);
             T6963C_Write_Text_Adv_ROM("COIMBATORE",80,48);
             T6963C_Write_Text_Adv_ROM("PH:9043043037",80,64);
             T6963C_Write_Text_Adv_ROM("PH:9842244167",80,80);
             delay_ms(2000);*/
}




void Interrupt_Init(void)
{

    /* ---------- TIMER1 INTERRUPT ---------- */
    TMR1IF_bit = 0;        // Clear Timer1 flag
    T1CON      = 0x11;     // Timer1 ON, prescaler config
    TMR1H      = 0x63;
    TMR1L      = 0xC0;
    TMR1IE_bit = 1;        // Enable Timer1 interrupt
    T6963C_PanelFill(0);
    T6963C_Write_Text_Adv_ROM("TIMER CHECKED",68,60);
    delay_ms(1000);

    /* ---------- RB0 (INT0) INTERRUPT ---------- */
    TRISB.B0 = 1;          // RB0 as input
    INTCON2.INTEDG0 = 1;   // Rising edge (power-fail signal)
    INTCON.INT0IF = 0;     // Clear INT0 flag
    INTCON.INT0IE = 1;     // Enable INT0 interrupt


    /* ---------- GLOBAL SETTINGS ---------- */
    RCON.IPEN = 0;         // Disable interrupt priority
    PEIE_bit  = 1;         // Enable peripheral interrupts
    GIE_bit   = 1;         // Enable global interrupts (LAST)
}



void EEPROM_Config(void)
{
 LOAD_EEPROM_Param();
}


//====================================== INTERUPT FUNCTION ==============================================
//void timer1() iv 0x0008 ics ICS_AUTO
void interrupt()
{



//============================================== TMR1 INTERUPT ======================================
//static unsigned int CntErr0=0,CntErr1=0;
  if (TMR1IF_bit)
  {
    TMR1IF_bit = 0;
    TMR1H         = 0x63;
    TMR1L         = 0xC0;
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
    
    
          if((Signal_A==0)&&(ProductionA_bit==0))
            {
              ProductionA_bit=1;
            }
          if((Signal_A==1)&&(ProductionA_bit==1))
            {
              Pulse_PickA++;
              ProductionA_bit=0;
              if(Pulse_PickA>=Picks4inchA)                  // 1
                  {inchA=inchA+1;Pulse_PickA=0;}
            }
            
          if((Signal_B==0)&&(ProductionB_bit==0))
            {
              ProductionB_bit=1;
            }
          if((Signal_B==1)&&(ProductionB_bit==1))
            {               
              Pulse_PickB++;
              ProductionB_bit=0;
              if(Pulse_PickB>=Picks4inchB)                  // 2
                  {inchB=inchB+1;Pulse_PickB=0;}
            }
          if((Signal_C==0)&&(ProductionC_bit==0))
            {
              ProductionC_bit=1;
            }
          if((Signal_C==1)&&(ProductionC_bit==1))
            {
              Pulse_PickC++;
              ProductionC_bit=0;
              if(Pulse_PickC>=Picks4inchC)                  // 3
                  {inchC=inchC+1;Pulse_PickC=0;}
            }
          if((Signal_D==0)&&(ProductionD_bit==0))
            {
              ProductionD_bit=1;
            }
          if((Signal_D==1)&&(ProductionD_bit==1))
            {
              Pulse_PickD++;
              ProductionD_bit=0;
              if(Pulse_PickD>=Picks4inchD)                  // 4
                  {inchD=inchD+1;Pulse_PickD=0;}
            }

          if((Signal_E==0)&&(ProductionE_bit==0))
            {
              ProductionE_bit=1;
            }
          if((Signal_E==1)&&(ProductionE_bit==1))
            {  
              Pulse_PickE++;
              ProductionE_bit=0;
              if(Pulse_PickE>=Picks4inchE)                  // 5
                  {inchE=inchE+1;Pulse_PickE=0;}
            }

          if((Signal_F==0)&&(ProductionF_bit==0))
            {
              ProductionF_bit=1;
            }
          if((Signal_F==1)&&(ProductionF_bit==1))
            {
              Pulse_PickF++;
              ProductionF_bit=0;
              if(Pulse_PickF>=Picks4inchF)                  // 6
              {inchF=inchF+1;Pulse_PickF=0;}
            }

          if((Signal_G==0)&&(ProductionG_bit==0))
            {
              ProductionG_bit=1;
            }
          if((Signal_G==1)&&(ProductionG_bit==1))
            {
              Pulse_PickG++;
              ProductionG_bit=0;
              if(Pulse_PickG>=Picks4inchG)                  // 7
              {inchG=inchG+1;Pulse_PickG=0;}
            }

          if((Signal_H==0)&&(ProductionH_bit==0))
            {
              ProductionH_bit=1;
            }
          if((Signal_H==1)&&(ProductionH_bit==1))
            {
              Pulse_PickH++;
              ProductionH_bit=0;
              if(Pulse_PickH>=Picks4inchH)                  // 8
              {inchH=inchH+1;Pulse_PickH=0;}
            }
            
          if((Signal_I==0)&&(ProductionI_bit==0))
            {
              ProductionI_bit=1;
            }
          if((Signal_I==1)&&(ProductionI_bit==1))
            {               
              Pulse_PickI++;
              ProductionI_bit=0;
              if(Pulse_PickI>=Picks4inchI)                  // 9
              {inchI=inchI+1;Pulse_PickI=0;}
            }

          if((Signal_J==0)&&(ProductionJ_bit==0))
            {
              ProductionJ_bit=1;
            }
          if((Signal_J==1)&&(ProductionJ_bit==1))
            {
              Pulse_PickJ++;
              ProductionJ_bit=0;
              if(Pulse_PickJ>=Picks4inchJ)                  // 10
              {inchJ=inchJ+1;Pulse_PickJ=0;}
            }

          if((Signal_K==0)&&(ProductionK_bit==0))
            {
              ProductionK_bit=1;
            }
          if((Signal_K==1)&&(ProductionK_bit==1))
            {
              Pulse_PickK++;
              ProductionK_bit=0;
              if(Pulse_PickK>=Picks4inchK)                  // 11
              {inchK=inchK+1;Pulse_PickK=0;}
            }

          if((Signal_L==0)&&(ProductionL_bit==0))
            {
              ProductionL_bit=1;
            }
          if((Signal_L==1)&&(ProductionL_bit==1))
            {
              Pulse_PickL++;
              ProductionL_bit=0;
              if(Pulse_PickL>=Picks4inchL)                  // 12
              {inchL=inchL+1;Pulse_PickL=0;}
            }

          if((Signal_M==0)&&(ProductionM_bit==0))
            {
              ProductionM_bit=1;
            }
          if((Signal_M==1)&&(ProductionM_bit==1))
            {
              Pulse_PickM++;
              ProductionM_bit=0;
              if(Pulse_PickM>=Picks4inchM)                  // 13
              {inchM=inchM+1;Pulse_PickM=0;}
            }

          if((Signal_N==0)&&(ProductionN_bit==0))
            {
              ProductionN_bit=1;
            }
          if((Signal_N==1)&&(ProductionN_bit==1))
            {
              Pulse_PickN++;
              ProductionN_bit=0;
              if(Pulse_PickN>=Picks4inchN)                  // 14
              {inchN=inchN+1;Pulse_PickN=0;}
            }

          if((Signal_O==0)&&(ProductionO_bit==0))
            {
              ProductionO_bit=1;
            }
          if((Signal_O==1)&&(ProductionO_bit==1))
            {
              Pulse_PickO++;
              ProductionO_bit=0;
              if(Pulse_PickO>=Picks4inchO)                  // 15
              {inchO=inchO+1;Pulse_PickO=0;}
            }

           if((Signal_P==0)&&(ProductionP_bit==0))
            {
              ProductionP_bit=1;
            }
          if((Signal_P==1)&&(ProductionP_bit==1))
            {
              Pulse_PickP++;
              ProductionP_bit=0;
              if(Pulse_PickP>=Picks4inchP)                  // 16
              {inchP=inchP+1;Pulse_PickP=0;}
            }


         }

//================================ RB0 INTERUPT ======================================
         if(INTCON.INT0IF)
        {
             if( (Power_up_bit == 1) && (PowerFail_Done_bit == 0)    )
             {
              PowerFail_Enable_bit=1;//BIT SETTED
             }
             INTCON.INT0IF = 0;
        }
  }
  
  





 void Meter_Or_Picks_Method()
{
    unsigned char Meter_Or_Picks_Exit = 1;
    unsigned char Meter_Or_Picks_Option = 1;
    unsigned char Refresh_Screen = 1;
    
    while(Set == 0);//NEED

    while(Meter_Or_Picks_Exit == 1)
    {
        // update display ONLY if option changed
        if(Refresh_Screen == 1)
        {
            Refresh_Screen=0;
            // clear only arrow area by rewriting menu (simple method)
            T6963C_PanelFill(0);
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

        // button handling (toggle option)
        if(Start == 0)
        {
               //WRAP LOGIC
                Meter_Or_Picks_Option++;
                if(Meter_Or_Picks_Option > 2)
                {
                    Meter_Or_Picks_Option = 1;
                }


            delay_ms(250);
            Refresh_Screen=1;
        }
        else if(Stop == 0)
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
        if(Set == 0)
        {
            if( Meter_Or_Picks_Option == 1)
            {
               T6963C_PanelFill(0);
               T6963C_Write_Text_Adv_ROM("METER MODE SETTED",60,64);
               T6963C_set_cursor(25,8);
               delay_ms(2000);

               Meter_Or_Picks_Sel=0; //SLECTION VALUE
               EEPROM_Write (  (Meter_Or_Picks_Sel_addr)  ,Meter_Or_Picks_Sel);//SELECTION BIT
            }
            if( Meter_Or_Picks_Option == 2)
            {
               T6963C_PanelFill(0);
               T6963C_Write_Text_Adv_ROM("PICKS MODE SETTED",60,64);
               T6963C_set_cursor(25,8);
               delay_ms(2000);
               
               Meter_Or_Picks_Sel=1; //SLECTION VALUE
               EEPROM_Write (  (Meter_Or_Picks_Sel_addr)  ,Meter_Or_Picks_Sel);//SELECTION BIT
            }
            //EXIT LOGIC
            Meter_Or_Picks_Exit = 0;
            exit1 = 1;
            Refresh_Screen=1;
        }

        if(Reverse == 0)
        {
            //EXIT LOGIC
            Meter_Or_Picks_Exit = 0;
            exit1 = 1;
            GIE_bit  = 1;
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
    while(Set == 0);//NEED TO WAIT TILL SET BUTTON FAIL

   while(Inch_Or_Pay_Method_Exit == 1)//TILL PRESSING BACK BUTTON TRUE STAGE
   {
             
              if( Refresh_Screen == 1)  //DISPLAYING SECTION
              {
                    /*//TEM PURPOSE ALONE
                    T6963C_Write_Text_Adv_ROM("ENTER LOOP ",60,90);
                    delay_ms(500);//*/
                    Refresh_Screen=0;
                    T6963C_PanelFill(0);
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
              
              if(Start == 0)
              {
                     Refresh_Screen=1;
                     delay_ms(50);
                     while(Start==0);
                  if(Inch_Or_Pay_Method_Option >=2 )
                  {
                       Inch_Or_Pay_Method_Option=1;
                  }
                  else
                  {
                      Inch_Or_Pay_Method_Option++;
                  }
              }
              
               if (Stop == 0)
              {
                    Refresh_Screen=1;
                     delay_ms(50);
                     while(Stop==0);
                     
                 if(Inch_Or_Pay_Method_Option <= 1)
                 {
                    Inch_Or_Pay_Method_Option=2;
                 }
                 else
                 {
                     Inch_Or_Pay_Method_Option--;
                 }
              }
              
              if(Set == 0 )
              {
                     Refresh_Screen=1;
                     delay_ms(50);
                     while(Set==0);


                  if( Inch_Or_Pay_Method_Option == 1 )  //INCH
                  {
                     Inch_Or_Pay_Sel=0; //SLECTION VALUE

                     T6963C_PanelFill(0);
                     T6963C_Write_Text_Adv_ROM("INCH MODE SETTED",56,64);
                     T6963C_set_cursor(24,8);
                     EEPROM_Write (  (Inch_Or_Pay_Sel_addr)  ,Inch_Or_Pay_Sel);//SELECTION BIT
                     
                     delay_ms(2000);
                  }
                  else if ( Inch_Or_Pay_Method_Option == 2 ) //PAY
                  {
                  
                     T6963C_PanelFill(0);

                     Inch_Or_Pay_Sel=1; //SLECTION VALUE
                     
                     /*T6963C_Write_Text_Adv_ROM("PAY SETTINGS REACHED",90,60);
                     delay_ms(500);
                     T6963C_PanelFill(0);*/

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
                   
                   
                   
                   delay_ms(2000);

                  }
              
              }

              if(Reverse == 0)
              {
                     Refresh_Screen=1;
                     delay_ms(150);
                     while(Reverse==0);
                     delay_ms(150);
                  //EXIT LOGIC
                  Inch_Or_Pay_Method_Exit = 0;
                  exit1 = 1;
                  GIE_bit  = 1;
                  PEIE_bit = 1;
                  delay_ms(250);
                  return;
              }
              
              delay_ms(10);
              

   }

}