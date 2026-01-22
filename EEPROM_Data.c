#include "EEPROM_Data.h"
#include "Control_Fn.h"
#include "Setup.h"
#include "DC3231_AT24C32.h"
#include "__T6963C.h"



//#define ENABLE_LOCK
#define DEMO_VAL 2


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



extern unsigned char   cposx, cposy;  // Cursor x-y position

extern bit lcd_update;
extern float production,Beam_production;

extern unsigned rx char MODE;

extern unsigned char Hour,Min,Sec,Date,Month,Year;


extern  char Text[16];//variable used to store the value from int to str

extern bit RST_BIT;

//================================== ADDITONAL SETTINGS =============================================
 bit Meter_Or_Picks_Sel;
 bit Inch_Or_Pay_Sel;

extern float Pay_Value;

extern  unsigned int i=0;
extern float Value_float=0;


 bit CHECK_BIT;

 
void LOAD_EEPROM_Param(void)
{
  unsigned int temp=0,i;
  unsigned int temp16=0;
  
  temp = EEPROM_Read(First_Time_addr);
  

/*//CHECK TEMP ======================================================================================
      T6963C_PanelFill(0);
     if(temp != 0x88)
     {
     Meter_Or_Picks_Sel=1;
        T6963C_PanelFill(0);
     T6963C_Write_Text_Adv_ROM("FIRST_TIME",60,60);
        EEPROM_Write ( (Meter_Or_Picks_Sel_addr),Meter_Or_Picks_Sel); //DEFAULT 0       Meter_Or_Picks_Sel
       while( Set == 1 );
        delay_ms(100);
     }
     else
     {
          T6963C_Write_Text_Adv_ROM("SECOND_TIME",60,60);
       while( Set == 1 );
        delay_ms(100);
     }


   T6963C_Write_Text_Adv_ROM("2_V=",78,48);
   CHECK_BIT=EEPROM_Read( Meter_Or_Picks_Sel_addr);
   if(CHECK_BIT)
   {
   T6963C_Write_Text_Adv_ROM("1",116,48);
   }
   else
   {
   T6963C_Write_Text_Adv_ROM("0",116,48);
   }
    delay_ms(100);
   while( Set == 1 );


//===================================================================================================*/


  
  T6963C_PanelFill(0);
  if(temp != 0x88)
   {
    FirstTime_EEPROM_Param();//INITIAL RUN
   }
   else
   {


       while( Set == 1 );
         T6963C_PanelFill(0);
         T6963C_Write_Text_Adv_ROM("FACTORY",92,48);
         T6963C_Write_Text_Adv_ROM("SETTINGS",88,64);
         delay_ms(1500);
         T6963C_PanelFill(0);
         T6963C_Write_Text_Adv_ROM("MICRO BRAIN GLCD",56,40);
         T6963C_Write_Text_Adv_ROM("REVISED UPDATED",60,56);
         T6963C_Write_Text_Adv_ROM("VERSION 1.1_2026_JAN",40,72);
         T6963C_Write_Text_Adv_ROM("LOADING...",80,88);
         delay_ms(4000);
         


   }
    load_data();
     delay_ms(1000);
    
     /*

     //DemoVal = EEPROM_Read_int(DEMO_VAL_ADDR);
  #ifdef ENABLE_LOCK
     //if(DemoVal != 0XFFFF)
     {
      DemoCnt = EEPROM_Read_int(DEMO_CNT_ADDR);
      if(DemoCnt<DEMO_VAL)
      {
        DemoCnt++;
        EEPROM_Write_int(DEMO_CNT_ADDR,DemoCnt);
      }
      else
      {
       MODE = 3;
       //EEPROM_Write(Mode_addr,MODE);
      }
     }
#endif
      */







       }
     



void FirstTime_EEPROM_Param(void)
{
   unsigned int temp=0,i=0;
   unsigned int Colour_Addr;
   T6963C_PanelFill(0);
   EEPROM_Write(First_Time_addr, 0x88);
   delay_ms(30);
   
   T6963C_PanelFill(0);
   T6963C_Write_Text_Adv_ROM("FIRST TIME",80,56);
   delay_ms(2000);

//========================================= DISABLE INTERUPT [TILL EEPROM COMPLETE]========================================================
   PEIE_bit  = 0;
   GIE_bit   = 0;
   
//==================================== ANIMATION =====================================================

    T6963C_rectangle(80,104, 160, 90 , T6963C_WHITE); //FOR ANMIATION OUTER BOX
            
            
   asm CLRWDT;
   
   Loading_Fill(1);
   EEPROM_Write(Shift_addr,0);
   delay_ms(5);
   Loading_Fill(2);
   EEPROM_Write(Mode_addr,0);
   delay_ms(5);

    for(i=0;i<16;i++)
   {
//    EEPROM_Write((Picks4inchA_addr+i),(10*(i+1)));//ACTUAL LOGIC
   Loading_Fill(i+3);//from 3 to 18
   EEPROM_Write((Picks4inchA_addr+i),(1*(i+1)));// CHECKING PURPOSE LOGIC SETTED
   delay_ms(5);                             //NAVEEN CHANGED
   }
   asm CLRWDT;

    for(i=0;i<16;i++)
   {
   Loading_Fill(1+19);//from 19 to 35
   EEPROM_Write((Pulse_PickA_addr+i),0);
   delay_ms(5);                            //NAVEEN CHANGED
   }
   asm CLRWDT;

   for(i=0;i<96;i++)
   {
    Loading_Fill(35+ ( (i*15) /95) )  ;
   EEPROM_AT24C32_WrInt((InchA_addr+(2*i)),0);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchB_addr+(2*i)),0);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchC_addr+(2*i)),0);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchD_addr+(2*i)),0);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchE_addr+(2*i)),0);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchF_addr+(2*i)),0);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchG_addr+(2*i)),0);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchH_addr+(2*i)),0);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchI_addr+(2*i)),0);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchJ_addr+(2*i)),0);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchK_addr+(2*i)),0);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchL_addr+(2*i)),0);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchM_addr+(2*i)),0);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchN_addr+(2*i)),0);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchO_addr+(2*i)),0);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchP_addr+(2*i)),0);
   delay_ms(5);
   }
   Loading_Fill(50);
   
   asm CLRWDT;
   for(i=0;i<480;i++)
   {
    EEPROM_AT24C32_WrByte((Date_Time_addr)+i,0);
    delay_ms(5);
    if(i >= 446)
    {
       Loading_Fill(50+ (i-446) );
    }
   }
   Loading_Fill(84);
   asm CLRWDT;
   EEPROM_Write_int((InchA_addr_Temp),0);
   Loading_Fill(85);
   delay_ms(5);
   EEPROM_Write_int((InchB_addr_Temp),0);
    Loading_Fill(86);
   delay_ms(5);
   EEPROM_Write_int((InchC_addr_Temp),0);
    Loading_Fill(87);
   delay_ms(5);
   EEPROM_Write_int((InchD_addr_Temp),0);
    Loading_Fill(88);
   delay_ms(5);
   EEPROM_Write_int((InchE_addr_Temp),0);
    Loading_Fill(89);
   delay_ms(5);
   EEPROM_Write_int((InchF_addr_Temp),0);
    Loading_Fill(90);
   delay_ms(5);
   EEPROM_Write_int((InchG_addr_Temp),0);
   Loading_Fill(91);
   delay_ms(5);
   EEPROM_Write_int((InchH_addr_Temp),0);
   Loading_Fill(92);
   delay_ms(5);
   EEPROM_Write_int((InchI_addr_Temp),0);
   Loading_Fill(93);
   delay_ms(5);
   EEPROM_Write_int((InchJ_addr_Temp),0);
   Loading_Fill(94);
   delay_ms(5);
   EEPROM_Write_int((InchK_addr_Temp),0);
   Loading_Fill(95);
   delay_ms(5);
   EEPROM_Write_int((InchL_addr_Temp),0);
   Loading_Fill(96);
   delay_ms(5);
   EEPROM_Write_int((InchM_addr_Temp),0);
   Loading_Fill(97);
   delay_ms(5);
   EEPROM_Write_int((InchN_addr_Temp),0);
   Loading_Fill(98);
   delay_ms(5);
   EEPROM_Write_int((InchO_addr_Temp),0);
   Loading_Fill(99);
   delay_ms(5);
   EEPROM_Write_int((InchP_addr_Temp),0);
   delay_ms(5);
   EEPROM_Write((Loom_Starting_NO_addr),1);
   delay_ms(5);
   
//================================== ADDITONAL SETTINGS =============================================
   EEPROM_Write ( (Meter_Or_Picks_Sel_addr),0); //DEFAULT 0
   delay_ms(5);
   EEPROM_Write (  (Inch_Or_Pay_Sel_addr)  ,0); //DEFAULT 0
   delay_ms(5);
   EEPORM_Write_Float( (Pay_Value_Store_addr)  ,0.0 );//RUPEES STORE PURPOSE
   delay_ms(5);

   
   Loading_Fill(100);


   delay_ms(1000);

//========================================= RE-ENABLE INTERUPT ========================================================
   PEIE_bit  = 1;
   GIE_bit   = 1;
   
   
   asm CLRWDT;
   T6963C_PanelFill(0);
   T6963C_Write_Text_Adv_ROM("LOADING COMPLETED",52,60);
   delay_ms(3000);
    Set_Date_Time_Rtc();
    asm CLRWDT;
    Loom_Starting_No();
    
   
   
   
   /*
   for(i=0;i<16;i++)
   {
   EEPROM_Write_int((Beam_InchA_addr+2),0);       // ONLY ONE LOOM IS ENOUGHT TO RESET ALL BEAMS
   delay_ms(30);                                  // considered later
   }
   */


   
   



#ifdef ENABLE_LOCK

        EEPROM_Write_int(DEMO_CNT_ADDR,0);

#endif
}

void ModeChange_EEPROM_update(void)
{
   unsigned short temp=0;
   unsigned int temp16=0;
   T6963C_PanelFill(0);
   T6963C_Write_Text_Adv_ROM("NK",108,48);
   T6963C_Write_Text_Adv_ROM("AUTOMATION",80,64);
   delay_ms(1000);
   T6963C_PanelFill(0);
   T6963C_Write_Text_Adv_ROM("Factory",88,48);
   T6963C_Write_Text_Adv_ROM("Setting",88,64);
   delay_ms(1000);
   

}

void Update_EEPROM_PwrFail(unsigned char Type)
{
   unsigned int temp;
   unsigned int temp16;
   GIE_bit       = 0;
   PEIE_bit      = 0;
   

   EEPROM_Write(Shift_addr,Shift_value);
   delay_ms(5);

    Save_shiftwise();
    
   EEPROM_Write(Pulse_PickA_addr,Pulse_PickA);
   delay_ms(5);
   EEPROM_Write(Pulse_PickB_addr,Pulse_PickB);
   delay_ms(5);
   EEPROM_Write(Pulse_PickC_addr,Pulse_PickC);
   delay_ms(5);
   EEPROM_Write(Pulse_PickD_addr,Pulse_PickD);
   delay_ms(5);
   EEPROM_Write(Pulse_PickE_addr,Pulse_PickE);
   delay_ms(5);
   EEPROM_Write(Pulse_PickF_addr,Pulse_PickF);
   delay_ms(5);
   EEPROM_Write(Pulse_PickG_addr,Pulse_PickG);
   delay_ms(5);
   EEPROM_Write(Pulse_PickH_addr,Pulse_PickH);
   delay_ms(100);
   
   
   EEPROM_Write(Pulse_PickI_addr,Pulse_PickI);
   delay_ms(5);
   EEPROM_Write(Pulse_PickJ_addr,Pulse_PickJ);
   delay_ms(5);
   EEPROM_Write(Pulse_PickK_addr,Pulse_PickK);
   delay_ms(5);
   EEPROM_Write(Pulse_PickL_addr,Pulse_PickL);
   delay_ms(5);
   EEPROM_Write(Pulse_PickM_addr,Pulse_PickM);
   delay_ms(5);
   EEPROM_Write(Pulse_PickN_addr,Pulse_PickN);
   delay_ms(5);
   EEPROM_Write(Pulse_PickO_addr,Pulse_PickO);
   delay_ms(5);
   EEPROM_Write(Pulse_PickP_addr,Pulse_PickP);
   delay_ms(5);
   
   
   if(Type==0)
   {
   T6963C_PanelFill(0);
   T6963C_Write_Text_Adv_ROM("THANKING YOU",72,60);
   delay_ms(5000);
   

   SWDTEN_bit = 1;//WDT SET
   

   RI_bit=0;
    T6963C_PanelFill(0);
   while(1) // TO APPLY WDT LOOP ADDED
   {


     T6963C_Write_Text_Adv_ROM("PLEASE OFF MCB",64,60);
   
   }
   
   }
   else if(Type==1)
   {
     GIE_bit       = 1;
     PEIE_bit      = 1;
     return;
   }
}

void load_data(void)
{
    T6963C_PanelFill(0);

//==================================== ANIMATION =====================================================
    T6963C_rectangle(80,104, 160, 90 , T6963C_WHITE); //FOR ANMIATION OUTER BOX
    T6963C_Write_Text_Adv_ROM("UPDATING ALL",80,40);
    T6963C_Write_Text_Adv_ROM("LOOM  DATAS",80,56);
    
    Loading_Fill(2);
    Shift_value=EEPROM_Read(Shift_addr);
    delay_ms(5);
    
     Loading_Fill(4);
    MODE = EEPROM_Read(Mode_addr);
    delay_ms(5);

      Loading_Fill(6);
    Picks4inchA = EEPROM_Read(Picks4inchA_addr);
    delay_ms(5);
    
     Loading_Fill(8);
    inchA     = EEPROM_Read_int((InchA_addr_Temp));         //1
    delay_ms(5);
    
    Loading_Fill(10);
    Pulse_PickA = EEPROM_Read(Pulse_PickA_addr);
    delay_ms(5);
    Loading_Fill(12);
    Picks4inchB = EEPROM_Read(Picks4inchB_addr);
    delay_ms(5);
    
    Loading_Fill(14);
    inchB     = EEPROM_Read_int((InchB_addr_Temp));        //2
    delay_ms(5);
    
    Loading_Fill(16);
    Pulse_PickB = EEPROM_Read(Pulse_PickB_addr);
    delay_ms(5);

    Loading_Fill(18);
    Picks4inchC = EEPROM_Read(Picks4inchC_addr);
    delay_ms(5);
    
    Loading_Fill(20);
    inchC     = EEPROM_Read_int((InchC_addr_Temp));        //3
    delay_ms(5);
    
    Loading_Fill(22);
    Pulse_PickC = EEPROM_Read(Pulse_PickC_addr);
    delay_ms(5);

    Loading_Fill(24);
    Picks4inchD = EEPROM_Read(Picks4inchD_addr);
    delay_ms(5);
    
    Loading_Fill(26);
    inchD     = EEPROM_Read_int((InchD_addr_Temp));         //4
    delay_ms(5);
    
    Loading_Fill(28);
    Pulse_PickD = EEPROM_Read(Pulse_PickD_addr);
    delay_ms(5);

     Loading_Fill(30);
    Picks4inchE = EEPROM_Read(Picks4inchE_addr);
    delay_ms(30);
    
    Loading_Fill(32);
    inchE     = EEPROM_Read_int((InchE_addr_Temp));         //5
    delay_ms(30);
    
    Loading_Fill(34);
    Pulse_PickE = EEPROM_Read(Pulse_PickE_addr);
    delay_ms(30);

    Loading_Fill(36);
    Picks4inchF = EEPROM_Read(Picks4inchF_addr);
    delay_ms(30);
    
    Loading_Fill(38);
    inchF     = EEPROM_Read_int((InchF_addr_Temp));
    delay_ms(30);
    
    Loading_Fill(40);                                                      //6
    Pulse_PickF = EEPROM_Read(Pulse_PickF_addr);
    delay_ms(30);

    Loading_Fill(42);
    Picks4inchG = EEPROM_Read(Picks4inchG_addr);
    delay_ms(30);
    
    Loading_Fill(44);
    inchG     = EEPROM_Read_int((InchG_addr_Temp));
    delay_ms(30);
    
    Loading_Fill(46);                                                      //7
    Pulse_PickG = EEPROM_Read(Pulse_PickG_addr);
    delay_ms(30);

    Loading_Fill(48);
    Picks4inchH = EEPROM_Read(Picks4inchH_addr);
    delay_ms(30);
    
    Loading_Fill(50);
    inchH     = EEPROM_Read_int((InchH_addr_Temp));         //8
    delay_ms(30);
    
    Loading_Fill(52);
    Pulse_PickH = EEPROM_Read(Pulse_PickH_addr);
    delay_ms(30);

     Loading_Fill(54);
    Picks4inchI = EEPROM_Read(Picks4inchI_addr);
    delay_ms(30);
    Loading_Fill(56);
    inchI     = EEPROM_Read_int((InchI_addr_Temp));          //9
    delay_ms(30);
    
    Loading_Fill(58);
    Pulse_PickI = EEPROM_Read(Pulse_PickI_addr);
    delay_ms(30);

    Loading_Fill(60);
    Picks4inchJ = EEPROM_Read(Picks4inchJ_addr);
    delay_ms(30);
    
    Loading_Fill(62);
    inchJ     = EEPROM_Read_int((InchJ_addr_Temp));         //10
    delay_ms(30);
    
    Loading_Fill(64);
    Pulse_PickJ = EEPROM_Read(Pulse_PickJ_addr);
    delay_ms(30);

    Loading_Fill(66);
    Picks4inchK = EEPROM_Read(Picks4inchK_addr);
    delay_ms(30);
    
    Loading_Fill(68);
    inchK     = EEPROM_Read_int((InchK_addr_Temp));          //11
    delay_ms(30);
    
    Loading_Fill(70);
    Pulse_PickK = EEPROM_Read(Pulse_PickK_addr);
    delay_ms(30);

    Loading_Fill(72);
    Picks4inchL = EEPROM_Read(Picks4inchL_addr);
    delay_ms(30); 
    
    Loading_Fill(74);                                                      //12
    inchL     = EEPROM_Read_int((InchL_addr_Temp));
    delay_ms(30);
    
    Loading_Fill(76);
    Pulse_PickL = EEPROM_Read(Pulse_PickL_addr);
    delay_ms(30);

    Loading_Fill(78);
    Picks4inchM = EEPROM_Read(Picks4inchM_addr);
    delay_ms(30);
    
    Loading_Fill(80);                                                       //13
    inchM     = EEPROM_Read_int((InchM_addr_Temp));
    delay_ms(30);
    
    Loading_Fill(82);
    Pulse_PickM = EEPROM_Read(Pulse_PickM_addr);
    delay_ms(30);

    Loading_Fill(84);
    Picks4inchN = EEPROM_Read(Picks4inchN_addr);
    delay_ms(30);
    
    Loading_Fill(86);
    inchN     = EEPROM_Read_int((InchN_addr_Temp));          //14
    delay_ms(30);
    
    Loading_Fill(88);
    Pulse_PickN = EEPROM_Read(Pulse_PickN_addr);
    delay_ms(30);

    Loading_Fill(90);
    Picks4inchO = EEPROM_Read(Picks4inchO_addr);
    delay_ms(30);
    
    Loading_Fill(92);
    inchO     = EEPROM_Read_int((InchO_addr_Temp));           //15
    delay_ms(30);
    
    Loading_Fill(94);
    Pulse_PickO = EEPROM_Read(Pulse_PickO_addr);
    delay_ms(30);

    Loading_Fill(96);
    Picks4inchP = EEPROM_Read(Picks4inchP_addr);
    delay_ms(30);
    
    Loading_Fill(98);
    inchP     = EEPROM_Read_int((InchP_addr_Temp));            //16
    delay_ms(30);
    Pulse_PickP = EEPROM_Read(Pulse_PickP_addr);
    delay_ms(30);
    
    Loom_Starting_value=EEPROM_Read(Loom_Starting_NO_addr);
    delay_ms(30);
    
//================================== ADDITONAL SETTINGS [MODE SLECTION BIT]=============================================
    Meter_Or_Picks_Sel=EEPROM_Read (Meter_Or_Picks_Sel_addr); //read
    delay_ms(30);
    Inch_Or_Pay_Sel=EEPROM_Read (Inch_Or_Pay_Sel_addr); //read
    delay_ms(30);
    //VALUE =25.4RS
    Pay_Value = EEPORM_Read_Float(Pay_Value_Store_addr);
    delay_ms(30);

    Loading_Fill(100);
    
    
    
  /*//TEMP============================================================================================
    T6963C_PanelFill(0);
    if(Meter_Or_Picks_Sel)
    { T6963C_Write_Text_Adv_ROM("M_P=1",116,48);}
    else
    { T6963C_Write_Text_Adv_ROM("M_P=0",116,48);}

    if(Inch_Or_Pay_Sel)
    { T6963C_Write_Text_Adv_ROM("I_P=1",116,64);}
    else
    { T6963C_Write_Text_Adv_ROM("I_P=0",116,64);}

   T6963C_Write_Text_Adv_ROM("PAY=",40,80);

     FloatToStr_SingleDecimal(Pay_Value,Text);
      Ltrim(Text);
      T6963C_Write_Text_Adv(Text,88, 80);// VALUE [METER]
      Glcd_Buffer_Clear();

    delay_ms(100);
    while(Set == 1);

//TEMP============================================================================================*/

}
void load_Picks4inch(void)
{
    Picks4inchA = EEPROM_Read(Picks4inchA_addr);
    delay_ms(5);                                      //1
    Picks4inchB = EEPROM_Read(Picks4inchB_addr);
    delay_ms(5);                                      //2
    Picks4inchC = EEPROM_Read(Picks4inchC_addr);
    delay_ms(5);                                      //3
    Picks4inchD = EEPROM_Read(Picks4inchD_addr);
    delay_ms(5);                                      //4
    Picks4inchE = EEPROM_Read(Picks4inchE_addr);
    delay_ms(5);                                      //5
    Picks4inchF = EEPROM_Read(Picks4inchF_addr);
    delay_ms(5);                                      //6
    Picks4inchG = EEPROM_Read(Picks4inchG_addr);
    delay_ms(5);                                      //7
    Picks4inchH = EEPROM_Read(Picks4inchH_addr);
    delay_ms(5);                                      //8
    Picks4inchI = EEPROM_Read(Picks4inchI_addr);
    delay_ms(5);                                      //9
    Picks4inchJ = EEPROM_Read(Picks4inchJ_addr);
    delay_ms(5);                                      //10
    Picks4inchK = EEPROM_Read(Picks4inchK_addr);
    delay_ms(5);                                      //11
    Picks4inchL = EEPROM_Read(Picks4inchL_addr);
    delay_ms(5);                                      //12
    Picks4inchM = EEPROM_Read(Picks4inchM_addr);
    delay_ms(5);                                      //13
    Picks4inchN = EEPROM_Read(Picks4inchN_addr);
    delay_ms(5);                                      //14
    Picks4inchO = EEPROM_Read(Picks4inchO_addr);
    delay_ms(5);                                      //15
    Picks4inchP = EEPROM_Read(Picks4inchP_addr);
    delay_ms(5);                                      //16

    T6963C_PanelFill(0);
    T6963C_Write_Text_Adv_ROM("UPDATING PICKS",70,48);
    T6963C_Write_Text_Adv_ROM("FOR INCH",86,64);
    delay_ms(2500);
}
void load_inch(void)
{
    inchA     = EEPROM_Read_int(InchA_addr_Temp);   //1
   delay_ms(5);
    inchB     = EEPROM_Read_int(InchB_addr_Temp);   //2
   delay_ms(5);
    inchC     = EEPROM_Read_int(InchC_addr_Temp);   //3
   delay_ms(5);
    inchD     = EEPROM_Read_int(InchD_addr_Temp);   //4
   delay_ms(5);
    inchE     = EEPROM_Read_int(InchE_addr_Temp);   //5
   delay_ms(5);
    inchF     = EEPROM_Read_int(InchF_addr_Temp);   //6
   delay_ms(5);
    inchG     = EEPROM_Read_int(InchG_addr_Temp);   //7
   delay_ms(5);
    inchH     = EEPROM_Read_int(InchH_addr_Temp);   //8
   delay_ms(5);
    inchI     = EEPROM_Read_int(InchI_addr_Temp);   //9
   delay_ms(5);
    inchJ     = EEPROM_Read_int(InchJ_addr_Temp);   //10
   delay_ms(5);
    inchK     = EEPROM_Read_int(InchK_addr_Temp);   //11
   delay_ms(5);
    inchL     = EEPROM_Read_int(InchL_addr_Temp);   //12
   delay_ms(5);
    inchM     = EEPROM_Read_int(InchM_addr_Temp);   //13
   delay_ms(5);
    inchN     = EEPROM_Read_int(InchN_addr_Temp);   //14
   delay_ms(5);
    inchO     = EEPROM_Read_int(InchO_addr_Temp);   //15
   delay_ms(5);
    inchP     = EEPROM_Read_int(InchP_addr_Temp);   //16
   delay_ms(5);
    
    T6963C_PanelFill(0);
    T6963C_Write_Text_Adv_ROM("UPDATING METER",80,48);
    T6963C_Write_Text_Adv_ROM("FOR LOOMS",96,64);
    delay_ms(2500);
}
void load_Pulse_Pick(void)
{
    Pulse_PickA = EEPROM_Read(Pulse_PickA_addr); //1
   delay_ms(5);
    Pulse_PickB = EEPROM_Read(Pulse_PickB_addr); //2
   delay_ms(5);
    Pulse_PickC = EEPROM_Read(Pulse_PickC_addr); //3
   delay_ms(5);
    Pulse_PickD = EEPROM_Read(Pulse_PickD_addr); //4
   delay_ms(5);
    Pulse_PickE = EEPROM_Read(Pulse_PickE_addr); //5
   delay_ms(5);
    Pulse_PickF = EEPROM_Read(Pulse_PickF_addr); //6
   delay_ms(5);
    Pulse_PickG = EEPROM_Read(Pulse_PickG_addr); //7
   delay_ms(5);
    Pulse_PickH = EEPROM_Read(Pulse_PickH_addr); //8
   delay_ms(5);
    Pulse_PickI = EEPROM_Read(Pulse_PickI_addr); //9
   delay_ms(5);
    Pulse_PickJ = EEPROM_Read(Pulse_PickJ_addr); //10
   delay_ms(5);
    Pulse_PickK = EEPROM_Read(Pulse_PickK_addr); //11
   delay_ms(5);
    Pulse_PickL = EEPROM_Read(Pulse_PickL_addr); //12
   delay_ms(5);
    Pulse_PickM = EEPROM_Read(Pulse_PickM_addr); //13
   delay_ms(5);
    Pulse_PickN = EEPROM_Read(Pulse_PickN_addr); //14
   delay_ms(5);
    Pulse_PickO = EEPROM_Read(Pulse_PickO_addr); //15
   delay_ms(5);
    Pulse_PickP = EEPROM_Read(Pulse_PickP_addr); //16
   delay_ms(5);
    
    T6963C_PanelFill(0);
    T6963C_Write_Text_Adv_ROM("UPDATING PULSE",80,48);
    T6963C_Write_Text_Adv_ROM("FOR PICKS",96,64);
    delay_ms(2500);
}

void Save_shiftwise(void)
{


   EEPROM_Write_int((InchA_addr_Temp),inchA);
   delay_ms(5);
   EEPROM_Write_int((InchB_addr_Temp),inchB);
   delay_ms(5);
   EEPROM_Write_int((InchC_addr_Temp),inchC);
   delay_ms(5);
   EEPROM_Write_int((InchD_addr_Temp),inchD);
   delay_ms(5);
   EEPROM_Write_int((InchE_addr_Temp),inchE);
   delay_ms(5);
   EEPROM_Write_int((InchF_addr_Temp),inchF);
   delay_ms(5);
   EEPROM_Write_int((InchG_addr_Temp),inchG);
   delay_ms(5);
   EEPROM_Write_int((InchH_addr_Temp),inchH);
   delay_ms(5);
   EEPROM_Write_int((InchI_addr_Temp),inchI);
   delay_ms(5);
   EEPROM_Write_int((InchJ_addr_Temp),inchJ);
   delay_ms(5);
   EEPROM_Write_int((InchK_addr_Temp),inchK);
   delay_ms(5);
   EEPROM_Write_int((InchL_addr_Temp),inchL);
   delay_ms(5);
   EEPROM_Write_int((InchM_addr_Temp),inchM);
   delay_ms(5);
   EEPROM_Write_int((InchN_addr_Temp),inchN);
   delay_ms(5);
   EEPROM_Write_int((InchO_addr_Temp),inchO);
   delay_ms(5);
   EEPROM_Write_int((InchP_addr_Temp),inchP);
   delay_ms(5);
}

void Save_shiftwise_External(void)
{


   EEPROM_AT24C32_WrInt((InchA_addr+(2*Shift_value)),inchA);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchB_addr+(2*Shift_value)),inchB);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchC_addr+(2*Shift_value)),inchC);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchD_addr+(2*Shift_value)),inchD);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchE_addr+(2*Shift_value)),inchE);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchF_addr+(2*Shift_value)),inchF);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchG_addr+(2*Shift_value)),inchG);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchH_addr+(2*Shift_value)),inchH);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchI_addr+(2*Shift_value)),inchI);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchJ_addr+(2*Shift_value)),inchJ);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchK_addr+(2*Shift_value)),inchK);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchL_addr+(2*Shift_value)),inchL);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchM_addr+(2*Shift_value)),inchM);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchN_addr+(2*Shift_value)),inchN);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchO_addr+(2*Shift_value)),inchO);
   delay_ms(5);
   EEPROM_AT24C32_WrInt((InchP_addr+(2*Shift_value)),inchP);
   delay_ms(5);
}

void Save_shiftwise_Date_time_External(void)
{
 Read_Date_Time_Rtc();
 EEPROM_AT24C32_WrByte((Date_Time_addr+(5*Shift_value)+0), Hour);
 EEPROM_AT24C32_WrByte((Date_Time_addr+(5*Shift_value)+1), Min);
 EEPROM_AT24C32_WrByte((Date_Time_addr+(5*Shift_value)+2), Date);
 EEPROM_AT24C32_WrByte((Date_Time_addr+(5*Shift_value)+3), Month);
 EEPROM_AT24C32_WrByte((Date_Time_addr+(5*Shift_value)+4), Year);
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
/*
void EEPROM_Write_long(unsigned int Addr,unsigned long Data)
{
   EEPROM_Write(Addr,(Data>>24)&0x000000FF);
   EEPROM_Write(Addr+1,(Data>>16)&0x000000FF);
   EEPROM_Write(Addr+2,(Data>>8)&0x000000FF);
   EEPROM_Write(Addr+3,Data&0x000000FF);
}

unsigned long EEPROM_Read_long(unsigned int Addr)
{
   unsigned long temp4=0,temp1=0, temp2=0, temp3=0;
   temp1 = EEPROM_Read(Addr);
   temp2 = EEPROM_Read(Addr+1);
   temp3 = EEPROM_Read(Addr+2);
   temp4 = EEPROM_Read(Addr+3);
   return (((temp1<<24)&0xFF000000) | ((temp2<<16)&0x00FF0000) | ((temp3<<8)&0x0000FF00) | ((temp4)&0x000000FF));
}
*/



/*void EEPORM_Write_Float(unsigned int Addr , float Value) //THIS FUCNTION SUIT FOR THE VLAUE WITHIN THE LIMIT [0 TO 65535]
{
   unsigned int  EEPROM_float_to_int=0;//4 byte it take

   EEPROM_float_to_int=(unsigned int) (Value * 10); //ex-123.4->1234

   EEPROM_Write_int(Addr ,EEPROM_float_to_int );
   delay_ms(5);

}


float EEPORM_Read_Float(unsigned int Addr) //THIS FUCNTION SUIT FOR THE VLAUE WITHIN THE LIMIT [0 TO 65535]
{
   unsigned int  EEPROM_int_Value=0;

   EEPROM_int_Value = EEPROM_Read_int(Addr);//1234
   delay_ms(5);
   return (float) (EEPROM_int_Value/10.0) ;//123.4
}*/


void EEPORM_Write_Float(int Addr, float Value)
 {
    // Scale the float by 10 and convert it to signed integer (to store with 1 decimal place)
    int scaledValue = (int)(value * 10);  // Integer representation of scaled float

    // Store the scaled signed integer (two bytes) in EEPROM
    EEPROM_Write(Addr, (unsigned char)(scaledValue & 0xFF));  // Low byte
    EEPROM_Write(Addr + 1, (unsigned char)((scaledValue >> 8) & 0xFF));  // High byte
}

float EEPORM_Read_Float(int Addr)
{
    // Read the low byte and high byte from EEPROM
    unsigned char lowByte = EEPROM_Read(Addr);
    unsigned char highByte = EEPROM_Read(Addr + 1);

    // Combine the bytes into a signed integer
    int scaledValue = (highByte << 8) | lowByte;  // Reassemble the signed integer

    // Return the scaled float by dividing by 10
    return (float)scaledValue / 10.0;  // Convert back to float
}