
_main:

;main.c,114 :: 		void main()
;main.c,116 :: 		Power_up_bit=0;
	BCF         _Power_up_bit+0, BitPos(_Power_up_bit+0) 
;main.c,117 :: 		MCU_Config();
	CALL        _MCU_Config+0, 0
;main.c,119 :: 		T6963C_PanelFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;main.c,120 :: 		T6963C_Write_Text_Adv_ROM("SETUP DONE",80,60);
	MOVLW       ?lstr_1_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_1_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_1_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;main.c,121 :: 		delay_ms(500);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
;main.c,123 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
;main.c,127 :: 		T6963C_PanelFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;main.c,128 :: 		Date=Read_RTC(4);
	MOVLW       4
	MOVWF       FARG_Read_RTC_rAddr+0 
	CALL        _Read_RTC+0, 0
	MOVF        R0, 0 
	MOVWF       _Date+0 
;main.c,129 :: 		Month=Read_RTC(5);
	MOVLW       5
	MOVWF       FARG_Read_RTC_rAddr+0 
	CALL        _Read_RTC+0, 0
	MOVF        R0, 0 
	MOVWF       _Month+0 
;main.c,130 :: 		Year=Read_RTC(6);
	MOVLW       6
	MOVWF       FARG_Read_RTC_rAddr+0 
	CALL        _Read_RTC+0, 0
	MOVF        R0, 0 
	MOVWF       _Year+0 
;main.c,132 :: 		Hour=Read_RTC(2);
	MOVLW       2
	MOVWF       FARG_Read_RTC_rAddr+0 
	CALL        _Read_RTC+0, 0
	MOVF        R0, 0 
	MOVWF       _Hour+0 
;main.c,133 :: 		Min=Read_RTC(1);
	MOVLW       1
	MOVWF       FARG_Read_RTC_rAddr+0 
	CALL        _Read_RTC+0, 0
	MOVF        R0, 0 
	MOVWF       _Min+0 
;main.c,134 :: 		Sec=Read_RTC(0);
	CLRF        FARG_Read_RTC_rAddr+0 
	CALL        _Read_RTC+0, 0
	MOVF        R0, 0 
	MOVWF       _Sec+0 
;main.c,137 :: 		T6963C_PanelFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;main.c,138 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	NOP
;main.c,139 :: 		T6963C_Write_Text_Adv_ROM("TIME RECEIVED",68,60);
	MOVLW       ?lstr_2_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_2_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_2_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       68
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;main.c,140 :: 		delay_ms(500);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
;main.c,145 :: 		T6963C_PanelFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;main.c,146 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	NOP
;main.c,147 :: 		T6963C_Write_Text_Adv_ROM("DATE:",56,36);
	MOVLW       ?lstr_3_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_3_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_3_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       36
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;main.c,148 :: 		GLCD_Print_Int_With_LeadingZero (Date ,63,52);
	MOVF        _Date+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       63
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       52
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;main.c,151 :: 		T6963C_Write_Text_Adv_ROM("MONTH:",104,36);
	MOVLW       ?lstr_4_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_4_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_4_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       104
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       36
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;main.c,152 :: 		GLCD_Print_Int_With_LeadingZero(Month ,112,52);
	MOVF        _Month+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       112
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       52
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;main.c,156 :: 		T6963C_Write_Text_Adv_ROM("YEAR:",160,36);
	MOVLW       ?lstr_5_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_5_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_5_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       160
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       36
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;main.c,157 :: 		GLCD_Print_Int_With_LeadingZero(Year ,168,52);
	MOVF        _Year+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       168
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       52
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;main.c,160 :: 		T6963C_Write_Text_Adv_ROM("HOURS:",56,64);
	MOVLW       ?lstr_6_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_6_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_6_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;main.c,161 :: 		GLCD_Print_Int_With_LeadingZero(Hour ,64,80);
	MOVF        _Hour+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       64
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       80
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;main.c,163 :: 		T6963C_Write_Text_Adv_ROM("MINUTES:",104,64);
	MOVLW       ?lstr_7_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_7_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_7_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       104
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;main.c,164 :: 		GLCD_Print_Int_With_LeadingZero(Min ,112,80);
	MOVF        _Min+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       112
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       80
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;main.c,166 :: 		T6963C_Write_Text_Adv_ROM("SECONDS:",168,64);
	MOVLW       ?lstr_8_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_8_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_8_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       168
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;main.c,167 :: 		GLCD_Print_Int_With_LeadingZero(Sec ,168,80);
	MOVF        _Sec+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       168
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       80
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;main.c,169 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
;main.c,170 :: 		lcd_update=1;
	BSF         _lcd_update+0, BitPos(_lcd_update+0) 
;main.c,180 :: 		while(1)
L_main6:
;main.c,183 :: 		if ( (PowerFail_Enable_bit == 1) && (PowerFail_Done_bit == 0) )
	BTFSS       _PowerFail_Enable_bit+0, BitPos(_PowerFail_Enable_bit+0) 
	GOTO        L_main10
	BTFSC       _PowerFail_Done_bit+0, BitPos(_PowerFail_Done_bit+0) 
	GOTO        L_main10
L__main121:
;main.c,185 :: 		PowerFail_Done_bit = 1;// TO AVOID ONE MORE EPPROM SAVING PURPOSE
	BSF         _PowerFail_Done_bit+0, BitPos(_PowerFail_Done_bit+0) 
;main.c,186 :: 		Update_EEPROM_PwrFail(0); //NEED TO CONVERT TO CALL IN INTERPUT
	CLRF        FARG_Update_EEPROM_PwrFail_Type+0 
	CALL        _Update_EEPROM_PwrFail+0, 0
;main.c,187 :: 		}
L_main10:
;main.c,190 :: 		if(MODE==0)
	MOVF        MODE+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
;main.c,193 :: 		LedR=1;
	BSF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;main.c,194 :: 		LedG=1;
	BSF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;main.c,195 :: 		LedB=1;
	BSF         LATB1_bit+0, BitPos(LATB1_bit+0) 
;main.c,196 :: 		Buzzer=1;
	BSF         LATG4_bit+0, BitPos(LATG4_bit+0) 
;main.c,198 :: 		if(Lcd_update==1)
	BTFSS       _lcd_update+0, BitPos(_lcd_update+0) 
	GOTO        L_main12
;main.c,200 :: 		LCD_Refresh();
	CALL        _LCD_Refresh+0, 0
;main.c,202 :: 		Display_variable_Update_Left_Pulse_picks();
	CALL        _Display_variable_Update_Left_Pulse_picks+0, 0
;main.c,203 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	NOP
	NOP
;main.c,207 :: 		if(Inch_Or_Pay_Sel == 0)//INCH
	BTFSC       _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
	GOTO        L_main14
;main.c,209 :: 		Display_variable_Update_Left_Inches();
	CALL        _Display_variable_Update_Left_Inches+0, 0
;main.c,210 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	NOP
	NOP
;main.c,211 :: 		Display_variable_Update_Right_Inches();
	CALL        _Display_variable_Update_Right_Inches+0, 0
;main.c,212 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main16:
	DECFSZ      R13, 1, 1
	BRA         L_main16
	DECFSZ      R12, 1, 1
	BRA         L_main16
	NOP
	NOP
;main.c,213 :: 		}
	GOTO        L_main17
L_main14:
;main.c,216 :: 		if(Meter_Or_Picks_Sel == 0)
	BTFSC       _Meter_Or_Picks_Sel+0, BitPos(_Meter_Or_Picks_Sel+0) 
	GOTO        L_main18
;main.c,219 :: 		Left_Side_Meter_PAY_Update();
	CALL        _Left_Side_Meter_PAY_Update+0, 0
;main.c,220 :: 		Right_Side_Meter_PAY_Update();
	CALL        _Right_Side_Meter_PAY_Update+0, 0
;main.c,221 :: 		}
	GOTO        L_main19
L_main18:
;main.c,225 :: 		Left_Side_Pick_Pay_Update();
	CALL        _Left_Side_Pick_Pay_Update+0, 0
;main.c,226 :: 		Right_Side_Pick_Pay_Update();
	CALL        _Right_Side_Pick_Pay_Update+0, 0
;main.c,227 :: 		}
L_main19:
;main.c,228 :: 		}
L_main17:
;main.c,230 :: 		Display_variable_Update_Right_Pulse_picks();
	CALL        _Display_variable_Update_Right_Pulse_picks+0, 0
;main.c,231 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main20:
	DECFSZ      R13, 1, 1
	BRA         L_main20
	DECFSZ      R12, 1, 1
	BRA         L_main20
	NOP
	NOP
;main.c,233 :: 		}
L_main12:
;main.c,235 :: 		if((Set==1)&&(Stop==1)&&(Start==1)&&(countA>=200))
	BTFSS       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_main23
	BTFSS       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_main23
	BTFSS       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_main23
	MOVLW       0
	SUBWF       _countA+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main123
	MOVLW       200
	SUBWF       _countA+0, 0 
L__main123:
	BTFSS       STATUS+0, 0 
	GOTO        L_main23
L__main120:
;main.c,237 :: 		Display_variable_Update_Left_Pulse_picks();
	CALL        _Display_variable_Update_Left_Pulse_picks+0, 0
;main.c,238 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main24:
	DECFSZ      R13, 1, 1
	BRA         L_main24
	DECFSZ      R12, 1, 1
	BRA         L_main24
	NOP
	NOP
;main.c,239 :: 		Display_variable_Update_Right_Pulse_picks();
	CALL        _Display_variable_Update_Right_Pulse_picks+0, 0
;main.c,240 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main25:
	DECFSZ      R13, 1, 1
	BRA         L_main25
	DECFSZ      R12, 1, 1
	BRA         L_main25
	NOP
	NOP
;main.c,241 :: 		}
L_main23:
;main.c,244 :: 		if((Set==1)&&(Stop==1)&&(Start==1)&&(countB>=900))
	BTFSS       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_main28
	BTFSS       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_main28
	BTFSS       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_main28
	MOVLW       3
	SUBWF       _countB+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main124
	MOVLW       132
	SUBWF       _countB+0, 0 
L__main124:
	BTFSS       STATUS+0, 0 
	GOTO        L_main28
L__main119:
;main.c,249 :: 		Inch[0]=InchA;
	MOVF        _inchA+0, 0 
	MOVWF       _Inch+0 
	MOVF        _inchA+1, 0 
	MOVWF       _Inch+1 
	MOVF        _inchA+2, 0 
	MOVWF       _Inch+2 
	MOVF        _inchA+3, 0 
	MOVWF       _Inch+3 
;main.c,250 :: 		Inch[1]=InchB;
	MOVF        _inchB+0, 0 
	MOVWF       _Inch+4 
	MOVF        _inchB+1, 0 
	MOVWF       _Inch+5 
	MOVF        _inchB+2, 0 
	MOVWF       _Inch+6 
	MOVF        _inchB+3, 0 
	MOVWF       _Inch+7 
;main.c,251 :: 		Inch[2]=InchC;
	MOVF        _inchC+0, 0 
	MOVWF       _Inch+8 
	MOVF        _inchC+1, 0 
	MOVWF       _Inch+9 
	MOVF        _inchC+2, 0 
	MOVWF       _Inch+10 
	MOVF        _inchC+3, 0 
	MOVWF       _Inch+11 
;main.c,252 :: 		Inch[3]=InchD;
	MOVF        _inchD+0, 0 
	MOVWF       _Inch+12 
	MOVF        _inchD+1, 0 
	MOVWF       _Inch+13 
	MOVF        _inchD+2, 0 
	MOVWF       _Inch+14 
	MOVF        _inchD+3, 0 
	MOVWF       _Inch+15 
;main.c,253 :: 		Inch[4]=InchE;
	MOVF        _inchE+0, 0 
	MOVWF       _Inch+16 
	MOVF        _inchE+1, 0 
	MOVWF       _Inch+17 
	MOVF        _inchE+2, 0 
	MOVWF       _Inch+18 
	MOVF        _inchE+3, 0 
	MOVWF       _Inch+19 
;main.c,254 :: 		Inch[5]=InchF;
	MOVF        _inchF+0, 0 
	MOVWF       _Inch+20 
	MOVF        _inchF+1, 0 
	MOVWF       _Inch+21 
	MOVF        _inchF+2, 0 
	MOVWF       _Inch+22 
	MOVF        _inchF+3, 0 
	MOVWF       _Inch+23 
;main.c,255 :: 		Inch[6]=InchG;
	MOVF        _inchG+0, 0 
	MOVWF       _Inch+24 
	MOVF        _inchG+1, 0 
	MOVWF       _Inch+25 
	MOVF        _inchG+2, 0 
	MOVWF       _Inch+26 
	MOVF        _inchG+3, 0 
	MOVWF       _Inch+27 
;main.c,256 :: 		Inch[7]=InchH;
	MOVF        _inchH+0, 0 
	MOVWF       _Inch+28 
	MOVF        _inchH+1, 0 
	MOVWF       _Inch+29 
	MOVF        _inchH+2, 0 
	MOVWF       _Inch+30 
	MOVF        _inchH+3, 0 
	MOVWF       _Inch+31 
;main.c,259 :: 		Inch[8]=InchI;
	MOVF        _inchI+0, 0 
	MOVWF       _Inch+32 
	MOVF        _inchI+1, 0 
	MOVWF       _Inch+33 
	MOVF        _inchI+2, 0 
	MOVWF       _Inch+34 
	MOVF        _inchI+3, 0 
	MOVWF       _Inch+35 
;main.c,260 :: 		Inch[9]=InchJ;
	MOVF        _inchJ+0, 0 
	MOVWF       _Inch+36 
	MOVF        _inchJ+1, 0 
	MOVWF       _Inch+37 
	MOVF        _inchJ+2, 0 
	MOVWF       _Inch+38 
	MOVF        _inchJ+3, 0 
	MOVWF       _Inch+39 
;main.c,261 :: 		Inch[10]=InchK;
	MOVF        _inchK+0, 0 
	MOVWF       _Inch+40 
	MOVF        _inchK+1, 0 
	MOVWF       _Inch+41 
	MOVF        _inchK+2, 0 
	MOVWF       _Inch+42 
	MOVF        _inchK+3, 0 
	MOVWF       _Inch+43 
;main.c,262 :: 		Inch[11]=InchL;
	MOVF        _inchL+0, 0 
	MOVWF       _Inch+44 
	MOVF        _inchL+1, 0 
	MOVWF       _Inch+45 
	MOVF        _inchL+2, 0 
	MOVWF       _Inch+46 
	MOVF        _inchL+3, 0 
	MOVWF       _Inch+47 
;main.c,263 :: 		Inch[12]=InchM;
	MOVF        _inchM+0, 0 
	MOVWF       _Inch+48 
	MOVF        _inchM+1, 0 
	MOVWF       _Inch+49 
	MOVF        _inchM+2, 0 
	MOVWF       _Inch+50 
	MOVF        _inchM+3, 0 
	MOVWF       _Inch+51 
;main.c,264 :: 		Inch[13]=InchN;
	MOVF        _inchN+0, 0 
	MOVWF       _Inch+52 
	MOVF        _inchN+1, 0 
	MOVWF       _Inch+53 
	MOVF        _inchN+2, 0 
	MOVWF       _Inch+54 
	MOVF        _inchN+3, 0 
	MOVWF       _Inch+55 
;main.c,265 :: 		Inch[14]=InchO;
	MOVF        _inchO+0, 0 
	MOVWF       _Inch+56 
	MOVF        _inchO+1, 0 
	MOVWF       _Inch+57 
	MOVF        _inchO+2, 0 
	MOVWF       _Inch+58 
	MOVF        _inchO+3, 0 
	MOVWF       _Inch+59 
;main.c,266 :: 		Inch[15]=InchP;
	MOVF        _inchP+0, 0 
	MOVWF       _Inch+60 
	MOVF        _inchP+1, 0 
	MOVWF       _Inch+61 
	MOVF        _inchP+2, 0 
	MOVWF       _Inch+62 
	MOVF        _inchP+3, 0 
	MOVWF       _Inch+63 
;main.c,268 :: 		if(Inch_Or_Pay_Sel == 0 )
	BTFSC       _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
	GOTO        L_main29
;main.c,270 :: 		Display_variable_Update_Left_Inches();
	CALL        _Display_variable_Update_Left_Inches+0, 0
;main.c,271 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main30:
	DECFSZ      R13, 1, 1
	BRA         L_main30
	DECFSZ      R12, 1, 1
	BRA         L_main30
	NOP
	NOP
;main.c,272 :: 		Display_variable_Update_Right_Inches();
	CALL        _Display_variable_Update_Right_Inches+0, 0
;main.c,273 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main31:
	DECFSZ      R13, 1, 1
	BRA         L_main31
	DECFSZ      R12, 1, 1
	BRA         L_main31
	NOP
	NOP
;main.c,274 :: 		}
L_main29:
;main.c,277 :: 		}
L_main28:
;main.c,279 :: 		if(Reverse == 0 && Start == 1 && Stop ==1 && Set == 1)  //SHORTCUT METHOD TO CHECK THE PAY [INCH OR PAY]
	BTFSC       RE7_bit+0, BitPos(RE7_bit+0) 
	GOTO        L_main34
	BTFSS       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_main34
	BTFSS       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_main34
	BTFSS       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_main34
L__main118:
;main.c,282 :: 		while ( (Reverse == 0) && Hold_Sec < 5)//0,1,2 [3 Sec plan]
L_main35:
	BTFSC       RE7_bit+0, BitPos(RE7_bit+0) 
	GOTO        L_main36
	MOVLW       5
	SUBWF       _Hold_Sec+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main36
L__main117:
;main.c,284 :: 		T6963C_PanelFill(0);  //LCD CLEAR
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;main.c,285 :: 		T6963C_Write_Text_Adv_ROM("PRESS AND HOLD BLACK BUTTON",8,40);
	MOVLW       ?lstr_9_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_9_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_9_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;main.c,286 :: 		IntToStr( (5 - Hold_Sec)  , Text); //INVERT LOGIC USED
	MOVF        _Hold_Sec+0, 0 
	SUBLW       5
	MOVWF       FARG_IntToStr_input+0 
	CLRF        FARG_IntToStr_input+1 
	MOVLW       0
	SUBWFB      FARG_IntToStr_input+1, 1 
	MOVLW       _Text+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;main.c,287 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;main.c,288 :: 		T6963C_Write_Text_Adv(Text ,112,56 );
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       112
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;main.c,289 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;main.c,290 :: 		T6963C_Write_Text_Adv_ROM("SECS LEFT",80,72);
	MOVLW       ?lstr_10_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_10_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_10_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;main.c,293 :: 		if( Reverse == 0 )
	BTFSC       RE7_bit+0, BitPos(RE7_bit+0) 
	GOTO        L_main39
;main.c,295 :: 		Hold_Sec++;
	INCF        _Hold_Sec+0, 1 
;main.c,296 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_main40:
	DECFSZ      R13, 1, 1
	BRA         L_main40
	DECFSZ      R12, 1, 1
	BRA         L_main40
	DECFSZ      R11, 1, 1
	BRA         L_main40
	NOP
;main.c,297 :: 		}
	GOTO        L_main41
L_main39:
;main.c,300 :: 		Hold_Sec=0;//RESET PURPOSE  [IF THE BUTTON IS TAKEN BEFORE 3 SECOND COUNT WILL BE 0]
	CLRF        _Hold_Sec+0 
;main.c,301 :: 		}
L_main41:
;main.c,302 :: 		}
	GOTO        L_main35
L_main36:
;main.c,303 :: 		if(Hold_Sec < 5 )
	MOVLW       5
	SUBWF       _Hold_Sec+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main42
;main.c,305 :: 		LCD_Refresh(); //IMMEDIATE REFRESH
	CALL        _LCD_Refresh+0, 0
;main.c,306 :: 		Hold_Sec=0;
	CLRF        _Hold_Sec+0 
;main.c,308 :: 		}
L_main42:
;main.c,311 :: 		if(hold_sec >= 4)
	MOVLW       4
	SUBWF       _Hold_Sec+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main43
;main.c,314 :: 		Inch_Or_Pay_Sel = ~ Inch_Or_Pay_Sel;//TOGGLE SELECTION BIT
	BTG         _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
;main.c,316 :: 		if ( Inch_Or_Pay_Sel == 0 ) //INCH
	BTFSC       _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
	GOTO        L_main44
;main.c,318 :: 		T6963C_PanelFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;main.c,319 :: 		T6963C_Write_Text_Adv_ROM("INCH MODE SETTED",60,60);
	MOVLW       ?lstr_11_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_11_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_11_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;main.c,320 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_main45:
	DECFSZ      R13, 1, 1
	BRA         L_main45
	DECFSZ      R12, 1, 1
	BRA         L_main45
	DECFSZ      R11, 1, 1
	BRA         L_main45
	NOP
;main.c,321 :: 		}
	GOTO        L_main46
L_main44:
;main.c,325 :: 		T6963C_PanelFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;main.c,326 :: 		if( Pay_Value == 0)//VALUE NOT ENTERED CASE
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        _Pay_Value+0, 0 
	MOVWF       R0 
	MOVF        _Pay_Value+1, 0 
	MOVWF       R1 
	MOVF        _Pay_Value+2, 0 
	MOVWF       R2 
	MOVF        _Pay_Value+3, 0 
	MOVWF       R3 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main47
;main.c,328 :: 		T6963C_set_cursor(28,8);
	MOVLW       28
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;main.c,329 :: 		Increment_Decerement_Float(&Pay_Value, 50.0 ,144, 64);
	MOVLW       _Pay_Value+0
	MOVWF       FARG_Increment_Decerement_Float_var+0 
	MOVLW       hi_addr(_Pay_Value+0)
	MOVWF       FARG_Increment_Decerement_Float_var+1 
	MOVLW       0
	MOVWF       FARG_Increment_Decerement_Float_limit+0 
	MOVLW       0
	MOVWF       FARG_Increment_Decerement_Float_limit+1 
	MOVLW       72
	MOVWF       FARG_Increment_Decerement_Float_limit+2 
	MOVLW       132
	MOVWF       FARG_Increment_Decerement_Float_limit+3 
	MOVLW       144
	MOVWF       FARG_Increment_Decerement_Float_Pos_x+0 
	MOVLW       64
	MOVWF       FARG_Increment_Decerement_Float_Pos_y+0 
	CALL        _Increment_Decerement_Float+0, 0
;main.c,330 :: 		delay_ms(15);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main48:
	DECFSZ      R13, 1, 1
	BRA         L_main48
	DECFSZ      R12, 1, 1
	BRA         L_main48
	DECFSZ      R11, 1, 1
	BRA         L_main48
;main.c,332 :: 		T6963C_PanelFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;main.c,333 :: 		T6963C_Write_Text_Adv_ROM("PAY MODE SETTED",60,64);
	MOVLW       ?lstr_12_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_12_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_12_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;main.c,334 :: 		T6963C_set_cursor(24,8);
	MOVLW       24
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;main.c,335 :: 		EEPROM_Write (  (Inch_Or_Pay_Sel_addr)  ,Inch_Or_Pay_Sel);//SELECTION BIT
	MOVLW       66
	MOVWF       FARG_Eeprom_Write_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Write_address+1 
	MOVLW       0
	BTFSC       _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
	MOVLW       1
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;main.c,336 :: 		EEPORM_Write_Float( (Pay_Value_Store_addr)  , Pay_Value );//RUPEES STORE PURPOSE
	MOVLW       67
	MOVWF       FARG_EEPORM_Write_Float_Addr+0 
	MOVLW       0
	MOVWF       FARG_EEPORM_Write_Float_Addr+1 
	MOVF        _Pay_Value+0, 0 
	MOVWF       FARG_EEPORM_Write_Float_Value+0 
	MOVF        _Pay_Value+1, 0 
	MOVWF       FARG_EEPORM_Write_Float_Value+1 
	MOVF        _Pay_Value+2, 0 
	MOVWF       FARG_EEPORM_Write_Float_Value+2 
	MOVF        _Pay_Value+3, 0 
	MOVWF       FARG_EEPORM_Write_Float_Value+3 
	CALL        _EEPORM_Write_Float+0, 0
;main.c,337 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_main49:
	DECFSZ      R13, 1, 1
	BRA         L_main49
	DECFSZ      R12, 1, 1
	BRA         L_main49
	DECFSZ      R11, 1, 1
	BRA         L_main49
	NOP
;main.c,340 :: 		T6963C_PanelFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;main.c,341 :: 		T6963C_set_cursor(25,8);
	MOVLW       25
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;main.c,342 :: 		T6963C_Write_Text_Adv_ROM("SETTED PAY VALUE=",44,64);
	MOVLW       ?lstr_13_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_13_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_13_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       44
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;main.c,343 :: 		Pay_Value = EEPORM_Read_Float(Pay_Value_Store_addr);
	MOVLW       67
	MOVWF       FARG_EEPORM_Read_Float_Addr+0 
	MOVLW       0
	MOVWF       FARG_EEPORM_Read_Float_Addr+1 
	CALL        _EEPORM_Read_Float+0, 0
	MOVF        R0, 0 
	MOVWF       _Pay_Value+0 
	MOVF        R1, 0 
	MOVWF       _Pay_Value+1 
	MOVF        R2, 0 
	MOVWF       _Pay_Value+2 
	MOVF        R3, 0 
	MOVWF       _Pay_Value+3 
;main.c,344 :: 		FloatToStr_SingleDecimal(Pay_Value, Text);
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+3 
	MOVLW       _Text+0
	MOVWF       FARG_FloatToStr_SingleDecimal_str+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_FloatToStr_SingleDecimal_str+1 
	CALL        _FloatToStr_SingleDecimal+0, 0
;main.c,345 :: 		T6963C_Write_Text_Adv(Text,180,64);
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       180
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;main.c,346 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_main50:
	DECFSZ      R13, 1, 1
	BRA         L_main50
	DECFSZ      R12, 1, 1
	BRA         L_main50
	DECFSZ      R11, 1, 1
	BRA         L_main50
	NOP
;main.c,348 :: 		}
	GOTO        L_main51
L_main47:
;main.c,351 :: 		T6963C_Write_Text_Adv_ROM("PAY MODE SETTED",60,60);
	MOVLW       ?lstr_14_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_14_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_14_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;main.c,352 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_main52:
	DECFSZ      R13, 1, 1
	BRA         L_main52
	DECFSZ      R12, 1, 1
	BRA         L_main52
	DECFSZ      R11, 1, 1
	BRA         L_main52
	NOP
;main.c,354 :: 		}
L_main51:
;main.c,355 :: 		T6963C_Cursor_Blink(0);
	BCF         _T6963C_display+0, 0 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;main.c,356 :: 		T6963C_Cursor(0);
	BCF         _T6963C_display+0, 1 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;main.c,357 :: 		T6963C_PanelFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;main.c,359 :: 		}
L_main46:
;main.c,361 :: 		hold_sec=0;
	CLRF        _Hold_Sec+0 
;main.c,362 :: 		LCD_Refresh(); //IMMEDIATE REFRESH
	CALL        _LCD_Refresh+0, 0
;main.c,363 :: 		EEPROM_Write (  (Inch_Or_Pay_Sel_addr)  ,Inch_Or_Pay_Sel);//SELECTION BIT
	MOVLW       66
	MOVWF       FARG_Eeprom_Write_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Write_address+1 
	MOVLW       0
	BTFSC       _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
	MOVLW       1
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;main.c,364 :: 		Inch_Or_Pay_Sel = EEPROM_Read ( Inch_Or_Pay_Sel_addr );//SELECTION BIT
	MOVLW       66
	MOVWF       FARG_Eeprom_Read_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Read_address+1 
	CALL        _Eeprom_Read+0, 0
	BTFSC       R0, 0 
	GOTO        L__main125
	BCF         _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
	GOTO        L__main126
L__main125:
	BSF         _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
L__main126:
;main.c,365 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main53:
	DECFSZ      R13, 1, 1
	BRA         L_main53
	DECFSZ      R12, 1, 1
	BRA         L_main53
	NOP
;main.c,366 :: 		}
L_main43:
;main.c,368 :: 		}
L_main34:
;main.c,372 :: 		if((Set==0)&&(Stop==1)&&(Start==1))
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_main56
	BTFSS       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_main56
	BTFSS       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_main56
L__main116:
;main.c,374 :: 		delay_ms(250);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main57:
	DECFSZ      R13, 1, 1
	BRA         L_main57
	DECFSZ      R12, 1, 1
	BRA         L_main57
	DECFSZ      R11, 1, 1
	BRA         L_main57
	NOP
;main.c,376 :: 		if((Set==0)&&(Stop==1)&&(Start==1))
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_main60
	BTFSS       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_main60
	BTFSS       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_main60
L__main115:
;main.c,378 :: 		Menulist();
	CALL        _Menulist+0, 0
;main.c,379 :: 		}
L_main60:
;main.c,380 :: 		}
L_main56:
;main.c,382 :: 		if((Stop==0)&&(Set==1)&&(Start==1))
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_main63
	BTFSS       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_main63
	BTFSS       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_main63
L__main114:
;main.c,384 :: 		delay_ms(250);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main64:
	DECFSZ      R13, 1, 1
	BRA         L_main64
	DECFSZ      R12, 1, 1
	BRA         L_main64
	DECFSZ      R11, 1, 1
	BRA         L_main64
	NOP
;main.c,385 :: 		if((Stop==0)&&(Set==1)&&(Start==1))
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_main67
	BTFSS       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_main67
	BTFSS       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_main67
L__main113:
;main.c,387 :: 		Reset_To_Next_Shift();
	CALL        _Reset_To_Next_Shift+0, 0
;main.c,388 :: 		}
L_main67:
;main.c,389 :: 		}
L_main63:
;main.c,391 :: 		if((Start==0)&&(Set==1)&&(Stop==1))
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_main70
	BTFSS       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_main70
	BTFSS       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_main70
L__main112:
;main.c,393 :: 		delay_ms(250);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main71:
	DECFSZ      R13, 1, 1
	BRA         L_main71
	DECFSZ      R12, 1, 1
	BRA         L_main71
	DECFSZ      R11, 1, 1
	BRA         L_main71
	NOP
;main.c,394 :: 		if((Start==0)&&(Set==1)&&(Stop==1))
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_main74
	BTFSS       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_main74
	BTFSS       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_main74
L__main111:
;main.c,396 :: 		Loom_value++;
	INCF        _Loom_value+0, 1 
;main.c,397 :: 		if(Loom_value>15)
	MOVF        _Loom_value+0, 0 
	SUBLW       15
	BTFSC       STATUS+0, 0 
	GOTO        L_main75
;main.c,399 :: 		Loom_value=0;
	CLRF        _Loom_value+0 
;main.c,400 :: 		}
L_main75:
;main.c,412 :: 		}
L_main74:
;main.c,413 :: 		}
L_main70:
;main.c,415 :: 		if((Start==0)&&(Stop==0)&&(Set==1))
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_main78
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_main78
	BTFSS       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_main78
L__main110:
;main.c,426 :: 		Save_shiftwise_External();
	CALL        _Save_shiftwise_External+0, 0
;main.c,427 :: 		delay_ms(100);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main79:
	DECFSZ      R13, 1, 1
	BRA         L_main79
	DECFSZ      R12, 1, 1
	BRA         L_main79
	DECFSZ      R11, 1, 1
	BRA         L_main79
	NOP
;main.c,428 :: 		Total_Beam_per_loom(); //NEED TO DEVELOPE LATER IN ORGANZIED WAY
	CALL        _Total_Beam_per_loom+0, 0
;main.c,429 :: 		Total_Beam_Per_Shift();
	CALL        _Total_Beam_Per_Shift+0, 0
;main.c,430 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_main80:
	DECFSZ      R13, 1, 1
	BRA         L_main80
	DECFSZ      R12, 1, 1
	BRA         L_main80
	DECFSZ      R11, 1, 1
	BRA         L_main80
;main.c,432 :: 		Lcd_update=1;
	BSF         _lcd_update+0, BitPos(_lcd_update+0) 
;main.c,435 :: 		}
L_main78:
;main.c,437 :: 		}
L_main11:
;main.c,440 :: 		if(MODE==1)
	MOVF        MODE+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main81
;main.c,442 :: 		T6963C_PanelFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;main.c,443 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_main82:
	DECFSZ      R13, 1, 1
	BRA         L_main82
	DECFSZ      R12, 1, 1
	BRA         L_main82
	DECFSZ      R11, 1, 1
	BRA         L_main82
	NOP
;main.c,444 :: 		T6963C_PanelFill(1);
	MOVLW       1
	MOVWF       FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;main.c,447 :: 		GIE_bit       = 0;
	BCF         GIE_bit+0, BitPos(GIE_bit+0) 
;main.c,448 :: 		PEIE_bit      = 0;
	BCF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;main.c,449 :: 		}
	GOTO        L_main83
L_main81:
;main.c,450 :: 		else if(MODE>1)
	MOVF        MODE+0, 0 
	SUBLW       1
	BTFSC       STATUS+0, 0 
	GOTO        L_main84
;main.c,452 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_main85:
	DECFSZ      R13, 1, 1
	BRA         L_main85
	DECFSZ      R12, 1, 1
	BRA         L_main85
	DECFSZ      R11, 1, 1
	BRA         L_main85
	NOP
;main.c,453 :: 		MODE=0;
	CLRF        MODE+0 
;main.c,454 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_main86:
	DECFSZ      R13, 1, 1
	BRA         L_main86
	DECFSZ      R12, 1, 1
	BRA         L_main86
	DECFSZ      R11, 1, 1
	BRA         L_main86
	NOP
;main.c,455 :: 		}
L_main84:
L_main83:
;main.c,457 :: 		}
	GOTO        L_main6
;main.c,461 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_LCD_Refresh:

;main.c,464 :: 		void LCD_Refresh(void)     // LCD Refresh
;main.c,480 :: 		T6963C_PanelFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;main.c,482 :: 		if(MODE==0)
	MOVF        MODE+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_LCD_Refresh87
;main.c,484 :: 		T6963C_rectangle(0, 0, 239, 127, T6963C_WHITE);
	CLRF        FARG_T6963C_rectangle_x0+0 
	CLRF        FARG_T6963C_rectangle_x0+1 
	CLRF        FARG_T6963C_rectangle_y0+0 
	CLRF        FARG_T6963C_rectangle_y0+1 
	MOVLW       239
	MOVWF       FARG_T6963C_rectangle_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_rectangle_x1+1 
	MOVLW       127
	MOVWF       FARG_T6963C_rectangle_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_rectangle_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_rectangle_pcolor+0 
	CALL        _T6963C_rectangle+0, 0
;main.c,486 :: 		T6963C_line(64,  0,64,12, T6963C_WHITE);
	MOVLW       64
	MOVWF       FARG_T6963C_Line_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x0+1 
	CLRF        FARG_T6963C_Line_y0+0 
	CLRF        FARG_T6963C_Line_y0+1 
	MOVLW       64
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       12
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,487 :: 		T6963C_line(168,  0,168,12, T6963C_WHITE);
	MOVLW       168
	MOVWF       FARG_T6963C_Line_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x0+1 
	CLRF        FARG_T6963C_Line_y0+0 
	CLRF        FARG_T6963C_Line_y0+1 
	MOVLW       168
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       12
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,489 :: 		T6963C_line(0 ,12,419,12, T6963C_WHITE);
	CLRF        FARG_T6963C_Line_x0+0 
	CLRF        FARG_T6963C_Line_x0+1 
	MOVLW       12
	MOVWF       FARG_T6963C_Line_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y0+1 
	MOVLW       163
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       1
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       12
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,490 :: 		T6963C_line(0, 24,419,24, T6963C_WHITE);
	CLRF        FARG_T6963C_Line_x0+0 
	CLRF        FARG_T6963C_Line_x0+1 
	MOVLW       24
	MOVWF       FARG_T6963C_Line_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y0+1 
	MOVLW       163
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       1
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       24
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,491 :: 		T6963C_line(0, 37,419,37, T6963C_WHITE);
	CLRF        FARG_T6963C_Line_x0+0 
	CLRF        FARG_T6963C_Line_x0+1 
	MOVLW       37
	MOVWF       FARG_T6963C_Line_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y0+1 
	MOVLW       163
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       1
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       37
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,492 :: 		T6963C_line(0, 50,419,50, T6963C_WHITE);
	CLRF        FARG_T6963C_Line_x0+0 
	CLRF        FARG_T6963C_Line_x0+1 
	MOVLW       50
	MOVWF       FARG_T6963C_Line_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y0+1 
	MOVLW       163
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       1
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       50
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,493 :: 		T6963C_line(0, 63,419,63, T6963C_WHITE);
	CLRF        FARG_T6963C_Line_x0+0 
	CLRF        FARG_T6963C_Line_x0+1 
	MOVLW       63
	MOVWF       FARG_T6963C_Line_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y0+1 
	MOVLW       163
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       1
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       63
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,494 :: 		T6963C_line(0, 76,419,76, T6963C_WHITE);       // X AXIX LINES
	CLRF        FARG_T6963C_Line_x0+0 
	CLRF        FARG_T6963C_Line_x0+1 
	MOVLW       76
	MOVWF       FARG_T6963C_Line_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y0+1 
	MOVLW       163
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       1
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       76
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,495 :: 		T6963C_line(0, 89,419,89, T6963C_WHITE);
	CLRF        FARG_T6963C_Line_x0+0 
	CLRF        FARG_T6963C_Line_x0+1 
	MOVLW       89
	MOVWF       FARG_T6963C_Line_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y0+1 
	MOVLW       163
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       1
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       89
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,496 :: 		T6963C_line(0, 102,419,102, T6963C_WHITE);
	CLRF        FARG_T6963C_Line_x0+0 
	CLRF        FARG_T6963C_Line_x0+1 
	MOVLW       102
	MOVWF       FARG_T6963C_Line_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y0+1 
	MOVLW       163
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       1
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       102
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,497 :: 		T6963C_line(0, 115,419,115, T6963C_WHITE);
	CLRF        FARG_T6963C_Line_x0+0 
	CLRF        FARG_T6963C_Line_x0+1 
	MOVLW       115
	MOVWF       FARG_T6963C_Line_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y0+1 
	MOVLW       163
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       1
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       115
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,500 :: 		T6963C_line(27, 12,27,239, T6963C_WHITE);
	MOVLW       27
	MOVWF       FARG_T6963C_Line_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x0+1 
	MOVLW       12
	MOVWF       FARG_T6963C_Line_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y0+1 
	MOVLW       27
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       239
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,501 :: 		T6963C_line(50, 12,50,239, T6963C_WHITE);
	MOVLW       50
	MOVWF       FARG_T6963C_Line_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x0+1 
	MOVLW       12
	MOVWF       FARG_T6963C_Line_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y0+1 
	MOVLW       50
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       239
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,502 :: 		T6963C_line(81, 12,81,239, T6963C_WHITE);     // Y AXIS LINES
	MOVLW       81
	MOVWF       FARG_T6963C_Line_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x0+1 
	MOVLW       12
	MOVWF       FARG_T6963C_Line_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y0+1 
	MOVLW       81
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       239
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,503 :: 		T6963C_line(120,12,120,239, T6963C_WHITE);
	MOVLW       120
	MOVWF       FARG_T6963C_Line_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x0+1 
	MOVLW       12
	MOVWF       FARG_T6963C_Line_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y0+1 
	MOVLW       120
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       239
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,504 :: 		T6963C_line(147,12,147,239, T6963C_WHITE);
	MOVLW       147
	MOVWF       FARG_T6963C_Line_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x0+1 
	MOVLW       12
	MOVWF       FARG_T6963C_Line_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y0+1 
	MOVLW       147
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       239
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,505 :: 		T6963C_line(170,12,170,239, T6963C_WHITE); //RIGHT SIDE INCHES
	MOVLW       170
	MOVWF       FARG_T6963C_Line_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x0+1 
	MOVLW       12
	MOVWF       FARG_T6963C_Line_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y0+1 
	MOVLW       170
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       239
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,506 :: 		T6963C_line(201,12,201,239, T6963C_WHITE);
	MOVLW       201
	MOVWF       FARG_T6963C_Line_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x0+1 
	MOVLW       12
	MOVWF       FARG_T6963C_Line_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y0+1 
	MOVLW       201
	MOVWF       FARG_T6963C_Line_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_x1+1 
	MOVLW       239
	MOVWF       FARG_T6963C_Line_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Line_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Line_pcolor+0 
	CALL        _T6963C_Line+0, 0
;main.c,511 :: 		T6963C_Write_Text_Adv("SHIFT:NO:       LOOM START:NO:          DT:",3,1);
	MOVLW       ?lstr15_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr15_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       1
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;main.c,512 :: 		GLCD_Print_Int_With_LeadingZero(Loom_Starting_value ,150,1); //IF VALUE 1 MEANS IT WILL SHOW 01, >9 VALUE SHOW AS PER THE MENTION VALUE ALONE
	MOVF        _Loom_Starting_value+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       150
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       1
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;main.c,514 :: 		IntToStr( (Shift_value+1) , Text);  //DUE TO SMALL SPACE USALL LOGIC USED INSTEAD OF  GLCD_Print_Int_With_LeadingZero FUNCTION
	MOVF        _Shift_value+0, 0 
	ADDLW       1
	MOVWF       FARG_IntToStr_input+0 
	CLRF        FARG_IntToStr_input+1 
	MOVLW       0
	ADDWFC      FARG_IntToStr_input+1, 1 
	MOVLW       _Text+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;main.c,515 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;main.c,516 :: 		T6963C_Write_Text_Adv(Text ,53,1);
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       53
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       1
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;main.c,517 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;main.c,519 :: 		GLCD_Print_Int_With_LeadingZero(Date ,188,1);
	MOVF        _Date+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       188
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       1
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;main.c,520 :: 		T6963C_Write_Char_Adv(':',202, 1);
	MOVLW       58
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       202
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       1
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;main.c,522 :: 		GLCD_Print_Int_With_LeadingZero(Month ,206,1);
	MOVF        _Month+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       206
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       1
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;main.c,523 :: 		T6963C_Write_Char_Adv(':', 220, 1);
	MOVLW       58
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       220
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       1
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;main.c,525 :: 		GLCD_Print_Int_With_LeadingZero(Year ,224,1);
	MOVF        _Year+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       224
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       1
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;main.c,529 :: 		Fi_Xpos=8;
	MOVLW       8
	MOVWF       _Fi_Xpos+0 
	MOVLW       0
	MOVWF       _Fi_Xpos+1 
;main.c,530 :: 		Se_Xpos=128;
	MOVLW       128
	MOVWF       _Se_Xpos+0 
	MOVLW       0
	MOVWF       _Se_Xpos+1 
;main.c,531 :: 		Ypos=25;
	MOVLW       25
	MOVWF       _Ypos+0 
	MOVLW       0
	MOVWF       _Ypos+1 
;main.c,537 :: 		Loom_Starting_value=EEPROM_Read(Loom_Starting_NO_addr);
	MOVLW       64
	MOVWF       FARG_Eeprom_Read_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Read_address+1 
	CALL        _Eeprom_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _Loom_Starting_value+0 
;main.c,538 :: 		delay_ms(15);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_LCD_Refresh88:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Refresh88
	DECFSZ      R12, 1, 1
	BRA         L_LCD_Refresh88
	DECFSZ      R11, 1, 1
	BRA         L_LCD_Refresh88
;main.c,540 :: 		for(i=0;i<8;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_LCD_Refresh89:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LCD_Refresh128
	MOVLW       8
	SUBWF       _i+0, 0 
L__LCD_Refresh128:
	BTFSC       STATUS+0, 0 
	GOTO        L_LCD_Refresh90
;main.c,542 :: 		asm CLRWDT;
	CLRWDT
;main.c,543 :: 		IntToStr(Loom_Starting_value+i , Text);
	MOVF        _Loom_Starting_value+0, 0 
	ADDWF       _i+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	ADDWFC      _i+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _Text+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;main.c,544 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;main.c,545 :: 		T6963C_Write_Text_Adv(Text,Fi_Xpos       ,Ypos+(13*i));
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVF        _Fi_Xpos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVF        _Fi_Xpos+1, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       13
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _i+0, 0 
	MOVWF       R4 
	MOVF        _i+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;main.c,546 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;main.c,547 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_LCD_Refresh92:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Refresh92
	DECFSZ      R12, 1, 1
	BRA         L_LCD_Refresh92
	NOP
;main.c,540 :: 		for(i=0;i<8;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;main.c,548 :: 		}
	GOTO        L_LCD_Refresh89
L_LCD_Refresh90:
;main.c,550 :: 		Loom_Starting_value=EEPROM_Read(Loom_Starting_NO_addr);
	MOVLW       64
	MOVWF       FARG_Eeprom_Read_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Read_address+1 
	CALL        _Eeprom_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _Loom_Starting_value+0 
;main.c,551 :: 		delay_ms(15);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_LCD_Refresh93:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Refresh93
	DECFSZ      R12, 1, 1
	BRA         L_LCD_Refresh93
	DECFSZ      R11, 1, 1
	BRA         L_LCD_Refresh93
;main.c,553 :: 		Loom_Starting_value=Loom_Starting_value+8;//TO START FROM 8 PLUS DONE
	MOVLW       8
	ADDWF       _Loom_Starting_value+0, 1 
;main.c,554 :: 		for(i=0;i<8;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_LCD_Refresh94:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__LCD_Refresh129
	MOVLW       8
	SUBWF       _i+0, 0 
L__LCD_Refresh129:
	BTFSC       STATUS+0, 0 
	GOTO        L_LCD_Refresh95
;main.c,556 :: 		asm CLRWDT;
	CLRWDT
;main.c,557 :: 		IntToStr(Loom_Starting_value+i , Text);
	MOVF        _Loom_Starting_value+0, 0 
	ADDWF       _i+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	ADDWFC      _i+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _Text+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;main.c,558 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;main.c,559 :: 		T6963C_Write_Text_Adv( Text ,Se_Xpos  ,Ypos+(13*i));
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVF        _Se_Xpos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVF        _Se_Xpos+1, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       13
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _i+0, 0 
	MOVWF       R4 
	MOVF        _i+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;main.c,560 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;main.c,561 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_LCD_Refresh97:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Refresh97
	DECFSZ      R12, 1, 1
	BRA         L_LCD_Refresh97
	NOP
;main.c,554 :: 		for(i=0;i<8;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;main.c,562 :: 		}
	GOTO        L_LCD_Refresh94
L_LCD_Refresh95:
;main.c,564 :: 		Loom_Starting_value=EEPROM_Read(Loom_Starting_NO_addr);
	MOVLW       64
	MOVWF       FARG_Eeprom_Read_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Read_address+1 
	CALL        _Eeprom_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _Loom_Starting_value+0 
;main.c,565 :: 		delay_ms(15);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_LCD_Refresh98:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Refresh98
	DECFSZ      R12, 1, 1
	BRA         L_LCD_Refresh98
	DECFSZ      R11, 1, 1
	BRA         L_LCD_Refresh98
;main.c,569 :: 		if(Meter_Or_Picks_Sel == 0)
	BTFSC       _Meter_Or_Picks_Sel+0, BitPos(_Meter_Or_Picks_Sel+0) 
	GOTO        L_LCD_Refresh99
;main.c,575 :: 		Inch[0]=InchA;
	MOVF        _inchA+0, 0 
	MOVWF       _Inch+0 
	MOVF        _inchA+1, 0 
	MOVWF       _Inch+1 
	MOVF        _inchA+2, 0 
	MOVWF       _Inch+2 
	MOVF        _inchA+3, 0 
	MOVWF       _Inch+3 
;main.c,576 :: 		Inch[1]=InchB;
	MOVF        _inchB+0, 0 
	MOVWF       _Inch+4 
	MOVF        _inchB+1, 0 
	MOVWF       _Inch+5 
	MOVF        _inchB+2, 0 
	MOVWF       _Inch+6 
	MOVF        _inchB+3, 0 
	MOVWF       _Inch+7 
;main.c,577 :: 		Inch[2]=InchC;
	MOVF        _inchC+0, 0 
	MOVWF       _Inch+8 
	MOVF        _inchC+1, 0 
	MOVWF       _Inch+9 
	MOVF        _inchC+2, 0 
	MOVWF       _Inch+10 
	MOVF        _inchC+3, 0 
	MOVWF       _Inch+11 
;main.c,578 :: 		Inch[3]=InchD;
	MOVF        _inchD+0, 0 
	MOVWF       _Inch+12 
	MOVF        _inchD+1, 0 
	MOVWF       _Inch+13 
	MOVF        _inchD+2, 0 
	MOVWF       _Inch+14 
	MOVF        _inchD+3, 0 
	MOVWF       _Inch+15 
;main.c,579 :: 		Inch[4]=InchE;
	MOVF        _inchE+0, 0 
	MOVWF       _Inch+16 
	MOVF        _inchE+1, 0 
	MOVWF       _Inch+17 
	MOVF        _inchE+2, 0 
	MOVWF       _Inch+18 
	MOVF        _inchE+3, 0 
	MOVWF       _Inch+19 
;main.c,580 :: 		Inch[5]=InchF;
	MOVF        _inchF+0, 0 
	MOVWF       _Inch+20 
	MOVF        _inchF+1, 0 
	MOVWF       _Inch+21 
	MOVF        _inchF+2, 0 
	MOVWF       _Inch+22 
	MOVF        _inchF+3, 0 
	MOVWF       _Inch+23 
;main.c,581 :: 		Inch[6]=InchG;
	MOVF        _inchG+0, 0 
	MOVWF       _Inch+24 
	MOVF        _inchG+1, 0 
	MOVWF       _Inch+25 
	MOVF        _inchG+2, 0 
	MOVWF       _Inch+26 
	MOVF        _inchG+3, 0 
	MOVWF       _Inch+27 
;main.c,582 :: 		Inch[7]=InchH;
	MOVF        _inchH+0, 0 
	MOVWF       _Inch+28 
	MOVF        _inchH+1, 0 
	MOVWF       _Inch+29 
	MOVF        _inchH+2, 0 
	MOVWF       _Inch+30 
	MOVF        _inchH+3, 0 
	MOVWF       _Inch+31 
;main.c,585 :: 		Inch[8]=InchI;
	MOVF        _inchI+0, 0 
	MOVWF       _Inch+32 
	MOVF        _inchI+1, 0 
	MOVWF       _Inch+33 
	MOVF        _inchI+2, 0 
	MOVWF       _Inch+34 
	MOVF        _inchI+3, 0 
	MOVWF       _Inch+35 
;main.c,586 :: 		Inch[9]=InchJ;
	MOVF        _inchJ+0, 0 
	MOVWF       _Inch+36 
	MOVF        _inchJ+1, 0 
	MOVWF       _Inch+37 
	MOVF        _inchJ+2, 0 
	MOVWF       _Inch+38 
	MOVF        _inchJ+3, 0 
	MOVWF       _Inch+39 
;main.c,587 :: 		Inch[10]=InchK;
	MOVF        _inchK+0, 0 
	MOVWF       _Inch+40 
	MOVF        _inchK+1, 0 
	MOVWF       _Inch+41 
	MOVF        _inchK+2, 0 
	MOVWF       _Inch+42 
	MOVF        _inchK+3, 0 
	MOVWF       _Inch+43 
;main.c,588 :: 		Inch[11]=InchL;
	MOVF        _inchL+0, 0 
	MOVWF       _Inch+44 
	MOVF        _inchL+1, 0 
	MOVWF       _Inch+45 
	MOVF        _inchL+2, 0 
	MOVWF       _Inch+46 
	MOVF        _inchL+3, 0 
	MOVWF       _Inch+47 
;main.c,589 :: 		Inch[12]=InchM;
	MOVF        _inchM+0, 0 
	MOVWF       _Inch+48 
	MOVF        _inchM+1, 0 
	MOVWF       _Inch+49 
	MOVF        _inchM+2, 0 
	MOVWF       _Inch+50 
	MOVF        _inchM+3, 0 
	MOVWF       _Inch+51 
;main.c,590 :: 		Inch[13]=InchN;
	MOVF        _inchN+0, 0 
	MOVWF       _Inch+52 
	MOVF        _inchN+1, 0 
	MOVWF       _Inch+53 
	MOVF        _inchN+2, 0 
	MOVWF       _Inch+54 
	MOVF        _inchN+3, 0 
	MOVWF       _Inch+55 
;main.c,591 :: 		Inch[14]=InchO;
	MOVF        _inchO+0, 0 
	MOVWF       _Inch+56 
	MOVF        _inchO+1, 0 
	MOVWF       _Inch+57 
	MOVF        _inchO+2, 0 
	MOVWF       _Inch+58 
	MOVF        _inchO+3, 0 
	MOVWF       _Inch+59 
;main.c,592 :: 		Inch[15]=InchP;
	MOVF        _inchP+0, 0 
	MOVWF       _Inch+60 
	MOVF        _inchP+1, 0 
	MOVWF       _Inch+61 
	MOVF        _inchP+2, 0 
	MOVWF       _Inch+62 
	MOVF        _inchP+3, 0 
	MOVWF       _Inch+63 
;main.c,595 :: 		if(Inch_Or_Pay_Sel == 0 )
	BTFSC       _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
	GOTO        L_LCD_Refresh100
;main.c,598 :: 		T6963C_Write_Text_Adv("L:NO   P/I    INCH    METER  L:NO   P/I    INCH   METER", 3, 13);
	MOVLW       ?lstr16_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr16_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       13
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;main.c,599 :: 		}
	GOTO        L_LCD_Refresh101
L_LCD_Refresh100:
;main.c,602 :: 		T6963C_Write_Text_Adv("L:NO   P/I     PAY     METER   L:NO   P/I     PAY     METER", 3, 13);
	MOVLW       ?lstr17_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr17_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       13
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;main.c,603 :: 		}
L_LCD_Refresh101:
;main.c,606 :: 		Left_Side_Meter_Update();
	CALL        _Left_Side_Meter_Update+0, 0
;main.c,607 :: 		if( Inch_Or_Pay_Sel == 1 ) //PAY BIT SLECTION    [LEFT SIDE])
	BTFSS       _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
	GOTO        L_LCD_Refresh102
;main.c,609 :: 		Left_Side_Meter_PAY_Update();
	CALL        _Left_Side_Meter_PAY_Update+0, 0
;main.c,610 :: 		}
L_LCD_Refresh102:
;main.c,613 :: 		Right_Side_Meter_Update();
	CALL        _Right_Side_Meter_Update+0, 0
;main.c,614 :: 		if( Inch_Or_Pay_Sel == 1 ) //PAY BIT SLECTION    [RIGHT SIDE])
	BTFSS       _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
	GOTO        L_LCD_Refresh103
;main.c,616 :: 		Right_Side_Meter_PAY_Update();
	CALL        _Right_Side_Meter_PAY_Update+0, 0
;main.c,617 :: 		}
L_LCD_Refresh103:
;main.c,618 :: 		}
	GOTO        L_LCD_Refresh104
L_LCD_Refresh99:
;main.c,625 :: 		Picks4inch[0]=Picks4inchA;
	MOVF        _Picks4inchA+0, 0 
	MOVWF       _Picks4inch+0 
	MOVF        _Picks4inchA+1, 0 
	MOVWF       _Picks4inch+1 
;main.c,626 :: 		Picks4inch[1]=Picks4inchB;
	MOVF        _Picks4inchB+0, 0 
	MOVWF       _Picks4inch+2 
	MOVF        _Picks4inchB+1, 0 
	MOVWF       _Picks4inch+3 
;main.c,627 :: 		Picks4inch[2]=Picks4inchC;
	MOVF        _Picks4inchC+0, 0 
	MOVWF       _Picks4inch+4 
	MOVF        _Picks4inchC+1, 0 
	MOVWF       _Picks4inch+5 
;main.c,628 :: 		Picks4inch[3]=Picks4inchD;
	MOVF        _Picks4inchD+0, 0 
	MOVWF       _Picks4inch+6 
	MOVF        _Picks4inchD+1, 0 
	MOVWF       _Picks4inch+7 
;main.c,629 :: 		Picks4inch[4]=Picks4inchE;
	MOVF        _Picks4inchE+0, 0 
	MOVWF       _Picks4inch+8 
	MOVF        _Picks4inchE+1, 0 
	MOVWF       _Picks4inch+9 
;main.c,630 :: 		Picks4inch[5]=Picks4inchF;
	MOVF        _Picks4inchF+0, 0 
	MOVWF       _Picks4inch+10 
	MOVF        _Picks4inchF+1, 0 
	MOVWF       _Picks4inch+11 
;main.c,631 :: 		Picks4inch[6]=Picks4inchG;
	MOVF        _Picks4inchG+0, 0 
	MOVWF       _Picks4inch+12 
	MOVF        _Picks4inchG+1, 0 
	MOVWF       _Picks4inch+13 
;main.c,632 :: 		Picks4inch[7]=Picks4inchH;
	MOVF        _Picks4inchH+0, 0 
	MOVWF       _Picks4inch+14 
	MOVF        _Picks4inchH+1, 0 
	MOVWF       _Picks4inch+15 
;main.c,635 :: 		Picks4inch[8]=Picks4inchI;
	MOVF        _Picks4inchI+0, 0 
	MOVWF       _Picks4inch+16 
	MOVF        _Picks4inchI+1, 0 
	MOVWF       _Picks4inch+17 
;main.c,636 :: 		Picks4inch[9]=Picks4inchJ;
	MOVF        _Picks4inchJ+0, 0 
	MOVWF       _Picks4inch+18 
	MOVF        _Picks4inchJ+1, 0 
	MOVWF       _Picks4inch+19 
;main.c,637 :: 		Picks4inch[10]=Picks4inchK;
	MOVF        _Picks4inchK+0, 0 
	MOVWF       _Picks4inch+20 
	MOVF        _Picks4inchK+1, 0 
	MOVWF       _Picks4inch+21 
;main.c,638 :: 		Picks4inch[11]=Picks4inchL;
	MOVF        _Picks4inchL+0, 0 
	MOVWF       _Picks4inch+22 
	MOVF        _Picks4inchL+1, 0 
	MOVWF       _Picks4inch+23 
;main.c,639 :: 		Picks4inch[12]=Picks4inchM;
	MOVF        _Picks4inchM+0, 0 
	MOVWF       _Picks4inch+24 
	MOVF        _Picks4inchM+1, 0 
	MOVWF       _Picks4inch+25 
;main.c,640 :: 		Picks4inch[13]=Picks4inchN;
	MOVF        _Picks4inchN+0, 0 
	MOVWF       _Picks4inch+26 
	MOVF        _Picks4inchN+1, 0 
	MOVWF       _Picks4inch+27 
;main.c,641 :: 		Picks4inch[14]=Picks4inchO;
	MOVF        _Picks4inchO+0, 0 
	MOVWF       _Picks4inch+28 
	MOVF        _Picks4inchO+1, 0 
	MOVWF       _Picks4inch+29 
;main.c,642 :: 		Picks4inch[15]=Picks4inchP;
	MOVF        _Picks4inchP+0, 0 
	MOVWF       _Picks4inch+30 
	MOVF        _Picks4inchP+1, 0 
	MOVWF       _Picks4inch+31 
;main.c,646 :: 		Inch[0]=InchA;
	MOVF        _inchA+0, 0 
	MOVWF       _Inch+0 
	MOVF        _inchA+1, 0 
	MOVWF       _Inch+1 
	MOVF        _inchA+2, 0 
	MOVWF       _Inch+2 
	MOVF        _inchA+3, 0 
	MOVWF       _Inch+3 
;main.c,647 :: 		Inch[1]=InchB;
	MOVF        _inchB+0, 0 
	MOVWF       _Inch+4 
	MOVF        _inchB+1, 0 
	MOVWF       _Inch+5 
	MOVF        _inchB+2, 0 
	MOVWF       _Inch+6 
	MOVF        _inchB+3, 0 
	MOVWF       _Inch+7 
;main.c,648 :: 		Inch[2]=InchC;
	MOVF        _inchC+0, 0 
	MOVWF       _Inch+8 
	MOVF        _inchC+1, 0 
	MOVWF       _Inch+9 
	MOVF        _inchC+2, 0 
	MOVWF       _Inch+10 
	MOVF        _inchC+3, 0 
	MOVWF       _Inch+11 
;main.c,649 :: 		Inch[3]=InchD;
	MOVF        _inchD+0, 0 
	MOVWF       _Inch+12 
	MOVF        _inchD+1, 0 
	MOVWF       _Inch+13 
	MOVF        _inchD+2, 0 
	MOVWF       _Inch+14 
	MOVF        _inchD+3, 0 
	MOVWF       _Inch+15 
;main.c,650 :: 		Inch[4]=InchE;
	MOVF        _inchE+0, 0 
	MOVWF       _Inch+16 
	MOVF        _inchE+1, 0 
	MOVWF       _Inch+17 
	MOVF        _inchE+2, 0 
	MOVWF       _Inch+18 
	MOVF        _inchE+3, 0 
	MOVWF       _Inch+19 
;main.c,651 :: 		Inch[5]=InchF;
	MOVF        _inchF+0, 0 
	MOVWF       _Inch+20 
	MOVF        _inchF+1, 0 
	MOVWF       _Inch+21 
	MOVF        _inchF+2, 0 
	MOVWF       _Inch+22 
	MOVF        _inchF+3, 0 
	MOVWF       _Inch+23 
;main.c,652 :: 		Inch[6]=InchG;
	MOVF        _inchG+0, 0 
	MOVWF       _Inch+24 
	MOVF        _inchG+1, 0 
	MOVWF       _Inch+25 
	MOVF        _inchG+2, 0 
	MOVWF       _Inch+26 
	MOVF        _inchG+3, 0 
	MOVWF       _Inch+27 
;main.c,653 :: 		Inch[7]=InchH;
	MOVF        _inchH+0, 0 
	MOVWF       _Inch+28 
	MOVF        _inchH+1, 0 
	MOVWF       _Inch+29 
	MOVF        _inchH+2, 0 
	MOVWF       _Inch+30 
	MOVF        _inchH+3, 0 
	MOVWF       _Inch+31 
;main.c,656 :: 		Inch[8]=InchI;
	MOVF        _inchI+0, 0 
	MOVWF       _Inch+32 
	MOVF        _inchI+1, 0 
	MOVWF       _Inch+33 
	MOVF        _inchI+2, 0 
	MOVWF       _Inch+34 
	MOVF        _inchI+3, 0 
	MOVWF       _Inch+35 
;main.c,657 :: 		Inch[9]=InchJ;
	MOVF        _inchJ+0, 0 
	MOVWF       _Inch+36 
	MOVF        _inchJ+1, 0 
	MOVWF       _Inch+37 
	MOVF        _inchJ+2, 0 
	MOVWF       _Inch+38 
	MOVF        _inchJ+3, 0 
	MOVWF       _Inch+39 
;main.c,658 :: 		Inch[10]=InchK;
	MOVF        _inchK+0, 0 
	MOVWF       _Inch+40 
	MOVF        _inchK+1, 0 
	MOVWF       _Inch+41 
	MOVF        _inchK+2, 0 
	MOVWF       _Inch+42 
	MOVF        _inchK+3, 0 
	MOVWF       _Inch+43 
;main.c,659 :: 		Inch[11]=InchL;
	MOVF        _inchL+0, 0 
	MOVWF       _Inch+44 
	MOVF        _inchL+1, 0 
	MOVWF       _Inch+45 
	MOVF        _inchL+2, 0 
	MOVWF       _Inch+46 
	MOVF        _inchL+3, 0 
	MOVWF       _Inch+47 
;main.c,660 :: 		Inch[12]=InchM;
	MOVF        _inchM+0, 0 
	MOVWF       _Inch+48 
	MOVF        _inchM+1, 0 
	MOVWF       _Inch+49 
	MOVF        _inchM+2, 0 
	MOVWF       _Inch+50 
	MOVF        _inchM+3, 0 
	MOVWF       _Inch+51 
;main.c,661 :: 		Inch[13]=InchN;
	MOVF        _inchN+0, 0 
	MOVWF       _Inch+52 
	MOVF        _inchN+1, 0 
	MOVWF       _Inch+53 
	MOVF        _inchN+2, 0 
	MOVWF       _Inch+54 
	MOVF        _inchN+3, 0 
	MOVWF       _Inch+55 
;main.c,662 :: 		Inch[14]=InchO;
	MOVF        _inchO+0, 0 
	MOVWF       _Inch+56 
	MOVF        _inchO+1, 0 
	MOVWF       _Inch+57 
	MOVF        _inchO+2, 0 
	MOVWF       _Inch+58 
	MOVF        _inchO+3, 0 
	MOVWF       _Inch+59 
;main.c,663 :: 		Inch[15]=InchP;
	MOVF        _inchP+0, 0 
	MOVWF       _Inch+60 
	MOVF        _inchP+1, 0 
	MOVWF       _Inch+61 
	MOVF        _inchP+2, 0 
	MOVWF       _Inch+62 
	MOVF        _inchP+3, 0 
	MOVWF       _Inch+63 
;main.c,665 :: 		if(Inch_Or_Pay_Sel == 0 )
	BTFSC       _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
	GOTO        L_LCD_Refresh105
;main.c,669 :: 		T6963C_Write_Text_Adv("L:NO  P/I     INCH    PICKS    L:NO  P/I    INCH     PICKS", 3, 13);
	MOVLW       ?lstr18_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr18_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       13
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;main.c,670 :: 		}
	GOTO        L_LCD_Refresh106
L_LCD_Refresh105:
;main.c,673 :: 		T6963C_Write_Text_Adv("L:NO   P/I     PAY      PICKS    L:NO   P/I    PAY      PICKS", 3, 13);
	MOVLW       ?lstr19_main+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr19_main+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       13
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;main.c,675 :: 		}
L_LCD_Refresh106:
;main.c,677 :: 		Left_Side_Pick_Update();
	CALL        _Left_Side_Pick_Update+0, 0
;main.c,678 :: 		if( Inch_Or_Pay_Sel == 1 ) //PAY BIT SELECTION    [LEFT SIDE])
	BTFSS       _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
	GOTO        L_LCD_Refresh107
;main.c,680 :: 		Left_Side_Pick_Pay_Update();
	CALL        _Left_Side_Pick_Pay_Update+0, 0
;main.c,681 :: 		}
L_LCD_Refresh107:
;main.c,682 :: 		Right_Side_Pick_Update();
	CALL        _Right_Side_Pick_Update+0, 0
;main.c,683 :: 		if( Inch_Or_Pay_Sel == 1 ) //PAY BIT SELECTION    [RIGHT SIDE])
	BTFSS       _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
	GOTO        L_LCD_Refresh108
;main.c,685 :: 		Right_Side_Pick_Pay_Update();
	CALL        _Right_Side_Pick_Pay_Update+0, 0
;main.c,686 :: 		}
L_LCD_Refresh108:
;main.c,689 :: 		}
L_LCD_Refresh104:
;main.c,691 :: 		}
L_LCD_Refresh87:
;main.c,696 :: 		Lcd_update=0;
	BCF         _lcd_update+0, BitPos(_lcd_update+0) 
;main.c,697 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_LCD_Refresh109:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Refresh109
	DECFSZ      R12, 1, 1
	BRA         L_LCD_Refresh109
	NOP
	NOP
;main.c,700 :: 		}
L_end_LCD_Refresh:
	RETURN      0
; end of _LCD_Refresh
