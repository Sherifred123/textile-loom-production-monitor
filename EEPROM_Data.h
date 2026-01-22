#define Shift_addr               0X08
#define Mode_addr                0X09
#define First_Time_addr          0x0F


//PRESCALER
#define Picks4inchA_addr         0x10    ///INCREMNET VALUE SET
#define Picks4inchB_addr         0x11   //0x12
#define Picks4inchC_addr         0x12
#define Picks4inchD_addr         0x13
#define Picks4inchE_addr         0x14
#define Picks4inchF_addr         0x15
#define Picks4inchG_addr         0x16
#define Picks4inchH_addr         0x17
#define Picks4inchI_addr         0x18
#define Picks4inchJ_addr         0x19
#define Picks4inchK_addr         0x1A
#define Picks4inchL_addr         0x1B
#define Picks4inchM_addr         0x1C
#define Picks4inchN_addr         0x1D
#define Picks4inchO_addr         0x1E
#define Picks4inchP_addr         0x1F

//CURRENT CUT SAVE LOCATION [INTERNAL]
#define InchA_addr_Temp               0X20
#define InchB_addr_Temp               0X22
#define InchC_addr_Temp               0x24
#define InchD_addr_Temp               0X26
#define InchE_addr_Temp               0X28
#define InchF_addr_Temp               0X2A
#define InchG_addr_Temp               0X2C
#define InchH_addr_Temp               0X2E
#define InchI_addr_Temp               0X30
#define InchJ_addr_Temp               0X32
#define InchK_addr_Temp               0X34
#define InchL_addr_Temp               0X36
#define InchM_addr_Temp               0X38
#define InchN_addr_Temp               0X3A
#define InchO_addr_Temp               0X3C
#define InchP_addr_Temp               0X3E

//BOX ID
#define Loom_Starting_NO_addr         0X40


//================================== ADDITONAL SETTINGS =============================================
#define Meter_Or_Picks_Sel_addr       0X41
#define Inch_Or_Pay_Sel_addr          0X42 

#define Pay_Value_Store_addr          0X43 //44,45,46,47   [EX=123.4-< WILL BE STORE IN THIS]-> INT 4 BYTE



#define Pulse_PickA_addr          0x3A0
#define Pulse_PickB_addr          0x3A1
#define Pulse_PickC_addr          0x3A2
#define Pulse_PickD_addr          0x3A3
#define Pulse_PickE_addr          0x3A4
#define Pulse_PickF_addr          0x3A5
#define Pulse_PickG_addr          0x3A6
#define Pulse_PickH_addr          0x3A7
#define Pulse_PickI_addr          0x3A8
#define Pulse_PickJ_addr          0x3A9
#define Pulse_PickK_addr          0x3AA
#define Pulse_PickL_addr          0x3AB
#define Pulse_PickM_addr          0x3AC
#define Pulse_PickN_addr          0x3AD
#define Pulse_PickO_addr          0x3AE
#define Pulse_PickP_addr          0x3AF

//
#define InchA_addr                    0X10
#define InchB_addr                    0XD0
#define InchC_addr                    0X190
#define InchD_addr                    0X250
#define InchE_addr                    0X310
#define InchF_addr                    0X3D0
#define InchG_addr                    0X490
#define InchH_addr                    0X550
#define InchI_addr                    0X610
#define InchJ_addr                    0X6D0
#define InchK_addr                    0X790
#define InchL_addr                    0X850
#define InchM_addr                    0X910
#define InchN_addr                    0X9D0
#define InchO_addr                    0XA90
#define InchP_addr                    0XB50

#define Date_Time_addr                0XD00


/*
#define Beam_InchA_addr           0X3B0
#define Beam_InchB_addr           0X3B2
#define Beam_InchC_addr           0X3B4
#define Beam_InchD_addr           0X3B6
#define Beam_InchE_addr           0X3B8
#define Beam_InchF_addr           0X3BA
#define Beam_InchG_addr           0X3BC         //considered later
#define Beam_InchH_addr           0X3BE
#define Beam_InchI_addr           0X3C0
#define Beam_InchJ_addr           0X3C2
#define Beam_InchK_addr           0X3C4
#define Beam_InchL_addr           0X3C6
#define Beam_InchM_addr           0X3C8
#define Beam_InchN_addr           0X3CA
#define Beam_InchO_addr           0X3CC
#define Beam_InchP_addr           0X3CE
 */

#define NO    0
#define YES   1

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