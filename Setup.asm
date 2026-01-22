
_MCU_Config:

;Setup.c,115 :: 		void MCU_Config(void)
;Setup.c,117 :: 		if(Power_up_bit==0)
	BTFSC       _Power_up_bit+0, BitPos(_Power_up_bit+0) 
	GOTO        L_MCU_Config0
;Setup.c,121 :: 		EEPROM_Reset_Attempt_Count_bit=0;// COUNT FOR NO OF TIMES EEPROM NEED TO RESET AND  RECHECK PURPOSE
	BCF         _EEPROM_Reset_Attempt_Count_bit+0, BitPos(_EEPROM_Reset_Attempt_Count_bit+0) 
;Setup.c,123 :: 		IO_Config();
	CALL        _IO_Config+0, 0
;Setup.c,125 :: 		LCD_Config();
	CALL        _LCD_Config+0, 0
;Setup.c,128 :: 		T6963C_PanelFill(0);
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
;Setup.c,129 :: 		T6963C_Write_Text_Adv_ROM("LCD CHECKED",76,60);
	MOVLW       ?lstr_1_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_1_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_1_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       76
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,130 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_MCU_Config1:
	DECFSZ      R13, 1, 1
	BRA         L_MCU_Config1
	DECFSZ      R12, 1, 1
	BRA         L_MCU_Config1
	NOP
;Setup.c,132 :: 		EEPROM_AT24C32_Init();
	CALL        _EEPROM_AT24C32_Init+0, 0
;Setup.c,133 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_MCU_Config2:
	DECFSZ      R13, 1, 1
	BRA         L_MCU_Config2
	DECFSZ      R12, 1, 1
	BRA         L_MCU_Config2
	DECFSZ      R11, 1, 1
	BRA         L_MCU_Config2
	NOP
;Setup.c,137 :: 		EEPROM_Config(); //KINLDY UNCOMMENT AFTER TEX CLEARING  WORK COMMLETED
	CALL        _EEPROM_Config+0, 0
;Setup.c,138 :: 		delay_ms(300);
	MOVLW       25
	MOVWF       R11, 0
	MOVLW       90
	MOVWF       R12, 0
	MOVLW       177
	MOVWF       R13, 0
L_MCU_Config3:
	DECFSZ      R13, 1, 1
	BRA         L_MCU_Config3
	DECFSZ      R12, 1, 1
	BRA         L_MCU_Config3
	DECFSZ      R11, 1, 1
	BRA         L_MCU_Config3
	NOP
	NOP
;Setup.c,140 :: 		T6963C_PanelFill(0);
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
;Setup.c,141 :: 		T6963C_Write_Text_Adv_ROM("MEMORY INTACT",68,60);
	MOVLW       ?lstr_2_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_2_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_2_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       68
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,142 :: 		delay_ms(500);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_MCU_Config4:
	DECFSZ      R13, 1, 1
	BRA         L_MCU_Config4
	DECFSZ      R12, 1, 1
	BRA         L_MCU_Config4
	DECFSZ      R11, 1, 1
	BRA         L_MCU_Config4
;Setup.c,144 :: 		Interrupt_Init(); //RBO & TMR1 INTERUPT INTIALIZED
	CALL        _Interrupt_Init+0, 0
;Setup.c,146 :: 		T6963C_PanelFill(0);
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
;Setup.c,147 :: 		T6963C_Write_Text_Adv_ROM("EVENT INTIALIZED",56,60);
	MOVLW       ?lstr_3_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_3_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_3_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,148 :: 		delay_ms(500);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_MCU_Config5:
	DECFSZ      R13, 1, 1
	BRA         L_MCU_Config5
	DECFSZ      R12, 1, 1
	BRA         L_MCU_Config5
	DECFSZ      R11, 1, 1
	BRA         L_MCU_Config5
;Setup.c,150 :: 		Power_up_bit=1;
	BSF         _Power_up_bit+0, BitPos(_Power_up_bit+0) 
;Setup.c,151 :: 		PowerFail_Done_bit=0;
	BCF         _PowerFail_Done_bit+0, BitPos(_PowerFail_Done_bit+0) 
;Setup.c,152 :: 		PowerFail_Enable_bit=0;
	BCF         _PowerFail_Enable_bit+0, BitPos(_PowerFail_Enable_bit+0) 
;Setup.c,153 :: 		one_sec_flag=0;
	BCF         _one_sec_flag+0, BitPos(_one_sec_flag+0) 
;Setup.c,154 :: 		RST_BIT=0;
	BCF         _RST_BIT+0, BitPos(_RST_BIT+0) 
;Setup.c,155 :: 		EEPROM_RST_Check_bit=0;
	BCF         _EEPROM_RST_Check_bit+0, BitPos(_EEPROM_RST_Check_bit+0) 
;Setup.c,156 :: 		Button_Hold_Bit=0;
	CLRF        _Button_Hold_Bit+0 
	CLRF        _Button_Hold_Bit+1 
;Setup.c,158 :: 		}
L_MCU_Config0:
;Setup.c,159 :: 		}
L_end_MCU_Config:
	RETURN      0
; end of _MCU_Config

_IO_Config:

;Setup.c,161 :: 		void IO_Config(void)
;Setup.c,163 :: 		ADCON0   =   0X00;
	CLRF        ADCON0+0 
;Setup.c,164 :: 		ADCON1   =   0X00;
	CLRF        ADCON1+0 
;Setup.c,165 :: 		ADCON2   =   0X00;
	CLRF        ADCON2+0 
;Setup.c,168 :: 		ANCON0   =   0X00;
	CLRF        ANCON0+0 
;Setup.c,169 :: 		ANCON1   =   0X00;
	CLRF        ANCON1+0 
;Setup.c,170 :: 		ANCON2   =   0X00;
	CLRF        ANCON2+0 
;Setup.c,172 :: 		CM1CON=0;
	CLRF        CM1CON+0 
;Setup.c,173 :: 		CM2CON=0;
	CLRF        CM2CON+0 
;Setup.c,174 :: 		CM3CON=0;
	CLRF        CM3CON+0 
;Setup.c,176 :: 		LCDCON=0X40;
	MOVLW       64
	MOVWF       LCDCON+0 
;Setup.c,177 :: 		LCDPS =0x00;
	CLRF        LCDPS+0 
;Setup.c,178 :: 		LCDREF=0x00;
	CLRF        LCDREF+0 
;Setup.c,179 :: 		LCDRL =0x00;
	CLRF        LCDRL+0 
;Setup.c,181 :: 		LCDSE0=0x00;
	CLRF        LCDSE0+0 
;Setup.c,182 :: 		LCDSE1=0x00;
	CLRF        LCDSE1+0 
;Setup.c,183 :: 		LCDSE2=0x00;
	CLRF        LCDSE2+0 
;Setup.c,184 :: 		LCDSE3=0x00;
	CLRF        LCDSE3+0 
;Setup.c,185 :: 		LCDSE4=0x00;
	CLRF        LCDSE4+0 
;Setup.c,186 :: 		LCDSE5=0x00;
	CLRF        LCDSE5+0 
;Setup.c,188 :: 		LCDDATA0=0x00;
	CLRF        LCDDATA0+0 
;Setup.c,189 :: 		LCDDATA1=0x00;
	CLRF        LCDDATA1+0 
;Setup.c,190 :: 		LCDDATA2=0x00;
	CLRF        LCDDATA2+0 
;Setup.c,191 :: 		LCDDATA3=0x00;
	CLRF        LCDDATA3+0 
;Setup.c,192 :: 		LCDDATA4=0x00;
	CLRF        LCDDATA4+0 
;Setup.c,193 :: 		LCDDATA5=0x00;
	CLRF        LCDDATA5+0 
;Setup.c,194 :: 		LCDDATA6=0x00;
	CLRF        LCDDATA6+0 
;Setup.c,195 :: 		LCDDATA7=0x00;
	CLRF        LCDDATA7+0 
;Setup.c,196 :: 		LCDDATA8=0x00;
	CLRF        LCDDATA8+0 
;Setup.c,197 :: 		LCDDATA9=0x00;
	CLRF        LCDDATA9+0 
;Setup.c,198 :: 		LCDDATA10=0x00;
	CLRF        LCDDATA10+0 
;Setup.c,199 :: 		LCDDATA11=0x00;
	CLRF        LCDDATA11+0 
;Setup.c,200 :: 		LCDDATA12=0x00;
	CLRF        LCDDATA12+0 
;Setup.c,201 :: 		LCDDATA13=0x00;
	CLRF        LCDDATA13+0 
;Setup.c,202 :: 		LCDDATA14=0x00;
	CLRF        LCDDATA14+0 
;Setup.c,203 :: 		LCDDATA15=0x00;
	CLRF        LCDDATA15+0 
;Setup.c,204 :: 		LCDDATA16=0x00;
	CLRF        LCDDATA16+0 
;Setup.c,205 :: 		LCDDATA17=0x00;
	CLRF        LCDDATA17+0 
;Setup.c,206 :: 		LCDDATA18=0x00;
	CLRF        LCDDATA18+0 
;Setup.c,207 :: 		LCDDATA19=0x00;
	CLRF        LCDDATA19+0 
;Setup.c,208 :: 		LCDDATA20=0x00;
	CLRF        LCDDATA20+0 
;Setup.c,209 :: 		LCDDATA21=0x00;
	CLRF        LCDDATA21+0 
;Setup.c,210 :: 		LCDDATA22=0x00;
	CLRF        LCDDATA22+0 
;Setup.c,211 :: 		LCDDATA23=0x00;
	CLRF        LCDDATA23+0 
;Setup.c,212 :: 		LCDDATA23=0x00;
	CLRF        LCDDATA23+0 
;Setup.c,214 :: 		CTMUCONH=0x00;
	CLRF        CTMUCONH+0 
;Setup.c,215 :: 		CTMUCONL=0x00;
	CLRF        CTMUCONL+0 
;Setup.c,216 :: 		CTMUICON=0x00;
	CLRF        CTMUICON+0 
;Setup.c,219 :: 		CMP1MD_bit=0;
	BCF         CMP1MD_bit+0, BitPos(CMP1MD_bit+0) 
;Setup.c,220 :: 		CMP2MD_bit=0;
	BCF         CMP2MD_bit+0, BitPos(CMP2MD_bit+0) 
;Setup.c,221 :: 		CMP3MD_bit=0;
	BCF         CMP3MD_bit+0, BitPos(CMP3MD_bit+0) 
;Setup.c,225 :: 		PowerFail_Enable_bit=0;//THIS BIT WILL SET WHEN THE RBO BIT SET
	BCF         _PowerFail_Enable_bit+0, BitPos(_PowerFail_Enable_bit+0) 
;Setup.c,227 :: 		SSP1CON1=0;
	CLRF        SSP1CON1+0 
;Setup.c,230 :: 		TRISA        =        0B11111111;                //RA0 TO RA3 LCD DATA PINS
	MOVLW       255
	MOVWF       TRISA+0 
;Setup.c,231 :: 		TRISB        =        0B11000001;                //
	MOVLW       193
	MOVWF       TRISB+0 
;Setup.c,232 :: 		TRISC        =        0B00100111;                //
	MOVLW       39
	MOVWF       TRISC+0 
;Setup.c,233 :: 		TRISD        =        0B00000000;                //
	CLRF        TRISD+0 
;Setup.c,234 :: 		TRISE        =        0B11111100;
	MOVLW       252
	MOVWF       TRISE+0 
;Setup.c,235 :: 		TRISF        =        0B01111010;
	MOVLW       122
	MOVWF       TRISF+0 
;Setup.c,236 :: 		TRISG        =        0B00001000;
	MOVLW       8
	MOVWF       TRISG+0 
;Setup.c,237 :: 		TRISH        =        0B00010011;
	MOVLW       19
	MOVWF       TRISH+0 
;Setup.c,238 :: 		TRISJ        =        0B11110000;
	MOVLW       240
	MOVWF       TRISJ+0 
;Setup.c,240 :: 		PORTA=0x00;
	CLRF        PORTA+0 
;Setup.c,241 :: 		PORTB=0x00;
	CLRF        PORTB+0 
;Setup.c,242 :: 		PORTC=0x00;
	CLRF        PORTC+0 
;Setup.c,243 :: 		PORTD=0x00;
	CLRF        PORTD+0 
;Setup.c,244 :: 		PORTE=0X00;
	CLRF        PORTE+0 
;Setup.c,245 :: 		PORTF=0X00;
	CLRF        PORTF+0 
;Setup.c,246 :: 		PORTG=0X00;
	CLRF        PORTG+0 
;Setup.c,247 :: 		PORTH=0X00;
	CLRF        PORTH+0 
;Setup.c,248 :: 		PORTJ=0X00;
	CLRF        PORTJ+0 
;Setup.c,260 :: 		ProductionA_bit=0;
	BCF         _ProductionA_bit+0, BitPos(_ProductionA_bit+0) 
;Setup.c,261 :: 		ProductionB_bit=0;
	BCF         _ProductionB_bit+0, BitPos(_ProductionB_bit+0) 
;Setup.c,262 :: 		ProductionC_bit=0;
	BCF         _ProductionC_bit+0, BitPos(_ProductionC_bit+0) 
;Setup.c,263 :: 		ProductionD_bit=0;
	BCF         _ProductionD_bit+0, BitPos(_ProductionD_bit+0) 
;Setup.c,264 :: 		ProductionE_bit=0;
	BCF         _ProductionE_bit+0, BitPos(_ProductionE_bit+0) 
;Setup.c,265 :: 		ProductionF_bit=0;
	BCF         _ProductionF_bit+0, BitPos(_ProductionF_bit+0) 
;Setup.c,266 :: 		ProductionG_bit=0;
	BCF         _ProductionG_bit+0, BitPos(_ProductionG_bit+0) 
;Setup.c,267 :: 		ProductionH_bit=0;
	BCF         _ProductionH_bit+0, BitPos(_ProductionH_bit+0) 
;Setup.c,268 :: 		ProductionI_bit=0;
	BCF         _ProductionI_bit+0, BitPos(_ProductionI_bit+0) 
;Setup.c,269 :: 		ProductionJ_bit=0;
	BCF         _ProductionJ_bit+0, BitPos(_ProductionJ_bit+0) 
;Setup.c,270 :: 		ProductionK_bit=0;
	BCF         _ProductionK_bit+0, BitPos(_ProductionK_bit+0) 
;Setup.c,271 :: 		ProductionL_bit=0;
	BCF         _ProductionL_bit+0, BitPos(_ProductionL_bit+0) 
;Setup.c,272 :: 		ProductionM_bit=0;
	BCF         _ProductionM_bit+0, BitPos(_ProductionM_bit+0) 
;Setup.c,273 :: 		ProductionN_bit=0;
	BCF         _ProductionN_bit+0, BitPos(_ProductionN_bit+0) 
;Setup.c,274 :: 		ProductionO_bit=0;
	BCF         _ProductionO_bit+0, BitPos(_ProductionO_bit+0) 
;Setup.c,275 :: 		ProductionP_bit=0;
	BCF         _ProductionP_bit+0, BitPos(_ProductionP_bit+0) 
;Setup.c,277 :: 		LedR=0;
	BCF         LATB3_bit+0, BitPos(LATB3_bit+0) 
;Setup.c,278 :: 		LedG=0;
	BCF         LATB2_bit+0, BitPos(LATB2_bit+0) 
;Setup.c,279 :: 		Buzzer=1;
	BSF         LATG4_bit+0, BitPos(LATG4_bit+0) 
;Setup.c,280 :: 		}
L_end_IO_Config:
	RETURN      0
; end of _IO_Config

_LCD_Config:

;Setup.c,282 :: 		void LCD_Config(void)
;Setup.c,284 :: 		unsigned char  block_count=0;
;Setup.c,286 :: 		T6963C_ctrlce_Direction = 0;
	BCF         TRISJ2_bit+0, BitPos(TRISJ2_bit+0) 
;Setup.c,287 :: 		T6963C_ctrlce = 0;            // Enable T6963C
	BCF         LATJ2_bit+0, BitPos(LATJ2_bit+0) 
;Setup.c,288 :: 		T6963C_ctrlfs_Direction = 0;
	BCF         TRISB5_bit+0, BitPos(TRISB5_bit+0) 
;Setup.c,289 :: 		T6963C_ctrlfs = 0;            // Font Select 8x8
	BCF         LATB5_bit+0, BitPos(LATB5_bit+0) 
;Setup.c,290 :: 		T6963C_ctrlmd_Direction = 0;
	BCF         TRISH2_bit+0, BitPos(TRISH2_bit+0) 
;Setup.c,291 :: 		T6963C_ctrlmd = 0;            // Column number select
	BCF         LATH2_bit+0, BitPos(LATH2_bit+0) 
;Setup.c,293 :: 		panel = 0;
	CLRF        _panel+0 
;Setup.c,294 :: 		curs = 0;
	CLRF        _curs+0 
;Setup.c,295 :: 		cposx = cposy = 0;
	CLRF        _cposy+0 
	CLRF        _cposx+0 
;Setup.c,297 :: 		T6963C_init(240, 128, 8);
	MOVLW       240
	MOVWF       FARG_T6963C_init_width+0 
	MOVLW       0
	MOVWF       FARG_T6963C_init_width+1 
	MOVLW       128
	MOVWF       FARG_T6963C_init_height+0 
	MOVLW       8
	MOVWF       FARG_T6963C_init_fntW+0 
	CALL        _T6963C_init+0, 0
;Setup.c,298 :: 		T6963C_Graphics(1);
	BSF         _T6963C_display+0, 3 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Setup.c,299 :: 		T6963C_Text(1);
	BSF         _T6963C_display+0, 2 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Setup.c,307 :: 		T6963C_Cursor_Height(7);       // 8 pixel height
	CLRF        FARG_T6963C_SetPtr_p+0 
	CLRF        FARG_T6963C_SetPtr_p+1 
	MOVLW       167
	MOVWF       FARG_T6963C_SetPtr_c+0 
	CALL        _T6963C_SetPtr+0, 0
;Setup.c,309 :: 		T6963C_Cursor(0);              // Cursor off
	BCF         _T6963C_display+0, 1 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Setup.c,312 :: 		T6963C_Cursor_Blink(1);
	BSF         _T6963C_display+0, 0 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Setup.c,314 :: 		T6963C_PanelFill(0);
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
;Setup.c,315 :: 		T6963C_SetGrPanel(1);                            // Select other graphic panel
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       _T6963C_grHomeAddr+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       _T6963C_grHomeAddr+1 
;Setup.c,317 :: 		T6963C_image(NK_LOGO_BANNER);   //NEED TO UNCOMMENT AFTER R&D
	MOVLW       _NK_LOGO_BANNER+0
	MOVWF       FARG_T6963C_image_pic+0 
	MOVLW       hi_addr(_NK_LOGO_BANNER+0)
	MOVWF       FARG_T6963C_image_pic+1 
	MOVLW       higher_addr(_NK_LOGO_BANNER+0)
	MOVWF       FARG_T6963C_image_pic+2 
	CALL        _T6963C_image+0, 0
;Setup.c,318 :: 		T6963C_DisplayGrPanel(1);
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_SetPtr_p+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_SetPtr_p+1 
	MOVLW       66
	MOVWF       FARG_T6963C_SetPtr_c+0 
	CALL        _T6963C_SetPtr+0, 0
;Setup.c,319 :: 		Delay_ms(3000);
	MOVLW       244
	MOVWF       R11, 0
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_LCD_Config6:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Config6
	DECFSZ      R12, 1, 1
	BRA         L_LCD_Config6
	DECFSZ      R11, 1, 1
	BRA         L_LCD_Config6
;Setup.c,322 :: 		T6963C_PanelFill(0);
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
;Setup.c,324 :: 		T6963C_Write_Text_Adv_ROM("NK",112,24);
	MOVLW       ?lstr_4_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_4_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_4_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       112
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,325 :: 		T6963C_Write_Text_Adv_ROM("AUTOMATION",80,40);
	MOVLW       ?lstr_5_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_5_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_5_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,326 :: 		T6963C_Write_Text_Adv_ROM("PH:9043043037",68,56);
	MOVLW       ?lstr_6_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_6_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_6_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       68
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,327 :: 		T6963C_Write_Text_Adv_ROM("MADE IN COIMBATORE",48,72);
	MOVLW       ?lstr_7_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_7_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_7_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,328 :: 		T6963C_Write_Text_Adv_ROM("TAMILNADU INDIA",60,88);
	MOVLW       ?lstr_8_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_8_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_8_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       88
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,330 :: 		delay_ms(3000);
	MOVLW       244
	MOVWF       R11, 0
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_LCD_Config7:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_Config7
	DECFSZ      R12, 1, 1
	BRA         L_LCD_Config7
	DECFSZ      R11, 1, 1
	BRA         L_LCD_Config7
;Setup.c,368 :: 		}
L_end_LCD_Config:
	RETURN      0
; end of _LCD_Config

_Interrupt_Init:

;Setup.c,373 :: 		void Interrupt_Init(void)
;Setup.c,377 :: 		TMR1IF_bit = 0;        // Clear Timer1 flag
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;Setup.c,378 :: 		T1CON      = 0x11;     // Timer1 ON, prescaler config
	MOVLW       17
	MOVWF       T1CON+0 
;Setup.c,379 :: 		TMR1H      = 0x63;
	MOVLW       99
	MOVWF       TMR1H+0 
;Setup.c,380 :: 		TMR1L      = 0xC0;
	MOVLW       192
	MOVWF       TMR1L+0 
;Setup.c,381 :: 		TMR1IE_bit = 1;        // Enable Timer1 interrupt
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;Setup.c,382 :: 		T6963C_PanelFill(0);
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
;Setup.c,383 :: 		T6963C_Write_Text_Adv_ROM("TIMER CHECKED",68,60);
	MOVLW       ?lstr_9_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_9_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_9_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       68
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,384 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Interrupt_Init8:
	DECFSZ      R13, 1, 1
	BRA         L_Interrupt_Init8
	DECFSZ      R12, 1, 1
	BRA         L_Interrupt_Init8
	DECFSZ      R11, 1, 1
	BRA         L_Interrupt_Init8
	NOP
;Setup.c,387 :: 		TRISB.B0 = 1;          // RB0 as input
	BSF         TRISB+0, 0 
;Setup.c,388 :: 		INTCON2.INTEDG0 = 1;   // Rising edge (power-fail signal)
	BSF         INTCON2+0, 6 
;Setup.c,389 :: 		INTCON.INT0IF = 0;     // Clear INT0 flag
	BCF         INTCON+0, 1 
;Setup.c,390 :: 		INTCON.INT0IE = 1;     // Enable INT0 interrupt
	BSF         INTCON+0, 4 
;Setup.c,394 :: 		RCON.IPEN = 0;         // Disable interrupt priority
	BCF         RCON+0, 7 
;Setup.c,395 :: 		PEIE_bit  = 1;         // Enable peripheral interrupts
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;Setup.c,396 :: 		GIE_bit   = 1;         // Enable global interrupts (LAST)
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;Setup.c,397 :: 		}
L_end_Interrupt_Init:
	RETURN      0
; end of _Interrupt_Init

_EEPROM_Config:

;Setup.c,401 :: 		void EEPROM_Config(void)
;Setup.c,403 :: 		LOAD_EEPROM_Param();
	CALL        _LOAD_EEPROM_Param+0, 0
;Setup.c,404 :: 		}
L_end_EEPROM_Config:
	RETURN      0
; end of _EEPROM_Config

_interrupt:

;Setup.c,409 :: 		void interrupt()
;Setup.c,416 :: 		if (TMR1IF_bit)
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_interrupt9
;Setup.c,418 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;Setup.c,419 :: 		TMR1H         = 0x63;
	MOVLW       99
	MOVWF       TMR1H+0 
;Setup.c,420 :: 		TMR1L         = 0xC0;
	MOVLW       192
	MOVWF       TMR1L+0 
;Setup.c,421 :: 		count++;
	INFSNZ      _count+0, 1 
	INCF        _count+1, 1 
;Setup.c,422 :: 		countA++;
	INFSNZ      _countA+0, 1 
	INCF        _countA+1, 1 
;Setup.c,423 :: 		countB++;
	INFSNZ      _countB+0, 1 
	INCF        _countB+1, 1 
;Setup.c,430 :: 		if(count>=4000)
	MOVLW       15
	SUBWF       _count+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt231
	MOVLW       160
	SUBWF       _count+0, 0 
L__interrupt231:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt10
;Setup.c,432 :: 		count=0;
	CLRF        _count+0 
	CLRF        _count+1 
;Setup.c,433 :: 		asm CLRWDT;
	CLRWDT
;Setup.c,434 :: 		Lcd_update=1;
	BSF         _lcd_update+0, BitPos(_lcd_update+0) 
;Setup.c,435 :: 		}
L_interrupt10:
;Setup.c,437 :: 		if(countA>=250)
	MOVLW       0
	SUBWF       _countA+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt232
	MOVLW       250
	SUBWF       _countA+0, 0 
L__interrupt232:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt11
;Setup.c,439 :: 		countA=0;
	CLRF        _countA+0 
	CLRF        _countA+1 
;Setup.c,440 :: 		asm CLRWDT;
	CLRWDT
;Setup.c,441 :: 		}
L_interrupt11:
;Setup.c,442 :: 		if(countB>=1000)
	MOVLW       3
	SUBWF       _countB+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt233
	MOVLW       232
	SUBWF       _countB+0, 0 
L__interrupt233:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt12
;Setup.c,444 :: 		countB=0;
	CLRF        _countB+0 
	CLRF        _countB+1 
;Setup.c,445 :: 		asm CLRWDT;
	CLRWDT
;Setup.c,446 :: 		}
L_interrupt12:
;Setup.c,449 :: 		if((Signal_A==0)&&(ProductionA_bit==0))
	BTFSC       RH4_bit+0, BitPos(RH4_bit+0) 
	GOTO        L_interrupt15
	BTFSC       _ProductionA_bit+0, BitPos(_ProductionA_bit+0) 
	GOTO        L_interrupt15
L__interrupt223:
;Setup.c,451 :: 		ProductionA_bit=1;
	BSF         _ProductionA_bit+0, BitPos(_ProductionA_bit+0) 
;Setup.c,452 :: 		}
L_interrupt15:
;Setup.c,453 :: 		if((Signal_A==1)&&(ProductionA_bit==1))
	BTFSS       RH4_bit+0, BitPos(RH4_bit+0) 
	GOTO        L_interrupt18
	BTFSS       _ProductionA_bit+0, BitPos(_ProductionA_bit+0) 
	GOTO        L_interrupt18
L__interrupt222:
;Setup.c,455 :: 		Pulse_PickA++;
	INFSNZ      _Pulse_PickA+0, 1 
	INCF        _Pulse_PickA+1, 1 
;Setup.c,456 :: 		ProductionA_bit=0;
	BCF         _ProductionA_bit+0, BitPos(_ProductionA_bit+0) 
;Setup.c,457 :: 		if(Pulse_PickA>=Picks4inchA)                  // 1
	MOVF        _Picks4inchA+1, 0 
	SUBWF       _Pulse_PickA+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt234
	MOVF        _Picks4inchA+0, 0 
	SUBWF       _Pulse_PickA+0, 0 
L__interrupt234:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt19
;Setup.c,458 :: 		{inchA=inchA+1;Pulse_PickA=0;}
	MOVF        _inchA+0, 0 
	MOVWF       R0 
	MOVF        _inchA+1, 0 
	MOVWF       R1 
	MOVF        _inchA+2, 0 
	MOVWF       R2 
	MOVF        _inchA+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _inchA+0 
	MOVF        R1, 0 
	MOVWF       _inchA+1 
	MOVF        R2, 0 
	MOVWF       _inchA+2 
	MOVF        R3, 0 
	MOVWF       _inchA+3 
	CLRF        _Pulse_PickA+0 
	CLRF        _Pulse_PickA+1 
L_interrupt19:
;Setup.c,459 :: 		}
L_interrupt18:
;Setup.c,461 :: 		if((Signal_B==0)&&(ProductionB_bit==0))
	BTFSC       RF1_bit+0, BitPos(RF1_bit+0) 
	GOTO        L_interrupt22
	BTFSC       _ProductionB_bit+0, BitPos(_ProductionB_bit+0) 
	GOTO        L_interrupt22
L__interrupt221:
;Setup.c,463 :: 		ProductionB_bit=1;
	BSF         _ProductionB_bit+0, BitPos(_ProductionB_bit+0) 
;Setup.c,464 :: 		}
L_interrupt22:
;Setup.c,465 :: 		if((Signal_B==1)&&(ProductionB_bit==1))
	BTFSS       RF1_bit+0, BitPos(RF1_bit+0) 
	GOTO        L_interrupt25
	BTFSS       _ProductionB_bit+0, BitPos(_ProductionB_bit+0) 
	GOTO        L_interrupt25
L__interrupt220:
;Setup.c,467 :: 		Pulse_PickB++;
	INFSNZ      _Pulse_PickB+0, 1 
	INCF        _Pulse_PickB+1, 1 
;Setup.c,468 :: 		ProductionB_bit=0;
	BCF         _ProductionB_bit+0, BitPos(_ProductionB_bit+0) 
;Setup.c,469 :: 		if(Pulse_PickB>=Picks4inchB)                  // 2
	MOVF        _Picks4inchB+1, 0 
	SUBWF       _Pulse_PickB+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt235
	MOVF        _Picks4inchB+0, 0 
	SUBWF       _Pulse_PickB+0, 0 
L__interrupt235:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt26
;Setup.c,470 :: 		{inchB=inchB+1;Pulse_PickB=0;}
	MOVF        _inchB+0, 0 
	MOVWF       R0 
	MOVF        _inchB+1, 0 
	MOVWF       R1 
	MOVF        _inchB+2, 0 
	MOVWF       R2 
	MOVF        _inchB+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _inchB+0 
	MOVF        R1, 0 
	MOVWF       _inchB+1 
	MOVF        R2, 0 
	MOVWF       _inchB+2 
	MOVF        R3, 0 
	MOVWF       _inchB+3 
	CLRF        _Pulse_PickB+0 
	CLRF        _Pulse_PickB+1 
L_interrupt26:
;Setup.c,471 :: 		}
L_interrupt25:
;Setup.c,472 :: 		if((Signal_C==0)&&(ProductionC_bit==0))
	BTFSC       RA3_bit+0, BitPos(RA3_bit+0) 
	GOTO        L_interrupt29
	BTFSC       _ProductionC_bit+0, BitPos(_ProductionC_bit+0) 
	GOTO        L_interrupt29
L__interrupt219:
;Setup.c,474 :: 		ProductionC_bit=1;
	BSF         _ProductionC_bit+0, BitPos(_ProductionC_bit+0) 
;Setup.c,475 :: 		}
L_interrupt29:
;Setup.c,476 :: 		if((Signal_C==1)&&(ProductionC_bit==1))
	BTFSS       RA3_bit+0, BitPos(RA3_bit+0) 
	GOTO        L_interrupt32
	BTFSS       _ProductionC_bit+0, BitPos(_ProductionC_bit+0) 
	GOTO        L_interrupt32
L__interrupt218:
;Setup.c,478 :: 		Pulse_PickC++;
	INFSNZ      _Pulse_PickC+0, 1 
	INCF        _Pulse_PickC+1, 1 
;Setup.c,479 :: 		ProductionC_bit=0;
	BCF         _ProductionC_bit+0, BitPos(_ProductionC_bit+0) 
;Setup.c,480 :: 		if(Pulse_PickC>=Picks4inchC)                  // 3
	MOVF        _Picks4inchC+1, 0 
	SUBWF       _Pulse_PickC+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt236
	MOVF        _Picks4inchC+0, 0 
	SUBWF       _Pulse_PickC+0, 0 
L__interrupt236:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt33
;Setup.c,481 :: 		{inchC=inchC+1;Pulse_PickC=0;}
	MOVF        _inchC+0, 0 
	MOVWF       R0 
	MOVF        _inchC+1, 0 
	MOVWF       R1 
	MOVF        _inchC+2, 0 
	MOVWF       R2 
	MOVF        _inchC+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _inchC+0 
	MOVF        R1, 0 
	MOVWF       _inchC+1 
	MOVF        R2, 0 
	MOVWF       _inchC+2 
	MOVF        R3, 0 
	MOVWF       _inchC+3 
	CLRF        _Pulse_PickC+0 
	CLRF        _Pulse_PickC+1 
L_interrupt33:
;Setup.c,482 :: 		}
L_interrupt32:
;Setup.c,483 :: 		if((Signal_D==0)&&(ProductionD_bit==0))
	BTFSC       RA2_bit+0, BitPos(RA2_bit+0) 
	GOTO        L_interrupt36
	BTFSC       _ProductionD_bit+0, BitPos(_ProductionD_bit+0) 
	GOTO        L_interrupt36
L__interrupt217:
;Setup.c,485 :: 		ProductionD_bit=1;
	BSF         _ProductionD_bit+0, BitPos(_ProductionD_bit+0) 
;Setup.c,486 :: 		}
L_interrupt36:
;Setup.c,487 :: 		if((Signal_D==1)&&(ProductionD_bit==1))
	BTFSS       RA2_bit+0, BitPos(RA2_bit+0) 
	GOTO        L_interrupt39
	BTFSS       _ProductionD_bit+0, BitPos(_ProductionD_bit+0) 
	GOTO        L_interrupt39
L__interrupt216:
;Setup.c,489 :: 		Pulse_PickD++;
	INFSNZ      _Pulse_PickD+0, 1 
	INCF        _Pulse_PickD+1, 1 
;Setup.c,490 :: 		ProductionD_bit=0;
	BCF         _ProductionD_bit+0, BitPos(_ProductionD_bit+0) 
;Setup.c,491 :: 		if(Pulse_PickD>=Picks4inchD)                  // 4
	MOVF        _Picks4inchD+1, 0 
	SUBWF       _Pulse_PickD+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt237
	MOVF        _Picks4inchD+0, 0 
	SUBWF       _Pulse_PickD+0, 0 
L__interrupt237:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt40
;Setup.c,492 :: 		{inchD=inchD+1;Pulse_PickD=0;}
	MOVF        _inchD+0, 0 
	MOVWF       R0 
	MOVF        _inchD+1, 0 
	MOVWF       R1 
	MOVF        _inchD+2, 0 
	MOVWF       R2 
	MOVF        _inchD+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _inchD+0 
	MOVF        R1, 0 
	MOVWF       _inchD+1 
	MOVF        R2, 0 
	MOVWF       _inchD+2 
	MOVF        R3, 0 
	MOVWF       _inchD+3 
	CLRF        _Pulse_PickD+0 
	CLRF        _Pulse_PickD+1 
L_interrupt40:
;Setup.c,493 :: 		}
L_interrupt39:
;Setup.c,495 :: 		if((Signal_E==0)&&(ProductionE_bit==0))
	BTFSC       RA1_bit+0, BitPos(RA1_bit+0) 
	GOTO        L_interrupt43
	BTFSC       _ProductionE_bit+0, BitPos(_ProductionE_bit+0) 
	GOTO        L_interrupt43
L__interrupt215:
;Setup.c,497 :: 		ProductionE_bit=1;
	BSF         _ProductionE_bit+0, BitPos(_ProductionE_bit+0) 
;Setup.c,498 :: 		}
L_interrupt43:
;Setup.c,499 :: 		if((Signal_E==1)&&(ProductionE_bit==1))
	BTFSS       RA1_bit+0, BitPos(RA1_bit+0) 
	GOTO        L_interrupt46
	BTFSS       _ProductionE_bit+0, BitPos(_ProductionE_bit+0) 
	GOTO        L_interrupt46
L__interrupt214:
;Setup.c,501 :: 		Pulse_PickE++;
	INFSNZ      _Pulse_PickE+0, 1 
	INCF        _Pulse_PickE+1, 1 
;Setup.c,502 :: 		ProductionE_bit=0;
	BCF         _ProductionE_bit+0, BitPos(_ProductionE_bit+0) 
;Setup.c,503 :: 		if(Pulse_PickE>=Picks4inchE)                  // 5
	MOVF        _Picks4inchE+1, 0 
	SUBWF       _Pulse_PickE+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt238
	MOVF        _Picks4inchE+0, 0 
	SUBWF       _Pulse_PickE+0, 0 
L__interrupt238:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt47
;Setup.c,504 :: 		{inchE=inchE+1;Pulse_PickE=0;}
	MOVF        _inchE+0, 0 
	MOVWF       R0 
	MOVF        _inchE+1, 0 
	MOVWF       R1 
	MOVF        _inchE+2, 0 
	MOVWF       R2 
	MOVF        _inchE+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _inchE+0 
	MOVF        R1, 0 
	MOVWF       _inchE+1 
	MOVF        R2, 0 
	MOVWF       _inchE+2 
	MOVF        R3, 0 
	MOVWF       _inchE+3 
	CLRF        _Pulse_PickE+0 
	CLRF        _Pulse_PickE+1 
L_interrupt47:
;Setup.c,505 :: 		}
L_interrupt46:
;Setup.c,507 :: 		if((Signal_F==0)&&(ProductionF_bit==0))
	BTFSC       RA0_bit+0, BitPos(RA0_bit+0) 
	GOTO        L_interrupt50
	BTFSC       _ProductionF_bit+0, BitPos(_ProductionF_bit+0) 
	GOTO        L_interrupt50
L__interrupt213:
;Setup.c,509 :: 		ProductionF_bit=1;
	BSF         _ProductionF_bit+0, BitPos(_ProductionF_bit+0) 
;Setup.c,510 :: 		}
L_interrupt50:
;Setup.c,511 :: 		if((Signal_F==1)&&(ProductionF_bit==1))
	BTFSS       RA0_bit+0, BitPos(RA0_bit+0) 
	GOTO        L_interrupt53
	BTFSS       _ProductionF_bit+0, BitPos(_ProductionF_bit+0) 
	GOTO        L_interrupt53
L__interrupt212:
;Setup.c,513 :: 		Pulse_PickF++;
	INFSNZ      _Pulse_PickF+0, 1 
	INCF        _Pulse_PickF+1, 1 
;Setup.c,514 :: 		ProductionF_bit=0;
	BCF         _ProductionF_bit+0, BitPos(_ProductionF_bit+0) 
;Setup.c,515 :: 		if(Pulse_PickF>=Picks4inchF)                  // 6
	MOVF        _Picks4inchF+1, 0 
	SUBWF       _Pulse_PickF+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt239
	MOVF        _Picks4inchF+0, 0 
	SUBWF       _Pulse_PickF+0, 0 
L__interrupt239:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt54
;Setup.c,516 :: 		{inchF=inchF+1;Pulse_PickF=0;}
	MOVF        _inchF+0, 0 
	MOVWF       R0 
	MOVF        _inchF+1, 0 
	MOVWF       R1 
	MOVF        _inchF+2, 0 
	MOVWF       R2 
	MOVF        _inchF+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _inchF+0 
	MOVF        R1, 0 
	MOVWF       _inchF+1 
	MOVF        R2, 0 
	MOVWF       _inchF+2 
	MOVF        R3, 0 
	MOVWF       _inchF+3 
	CLRF        _Pulse_PickF+0 
	CLRF        _Pulse_PickF+1 
L_interrupt54:
;Setup.c,517 :: 		}
L_interrupt53:
;Setup.c,519 :: 		if((Signal_G==0)&&(ProductionG_bit==0))
	BTFSC       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L_interrupt57
	BTFSC       _ProductionG_bit+0, BitPos(_ProductionG_bit+0) 
	GOTO        L_interrupt57
L__interrupt211:
;Setup.c,521 :: 		ProductionG_bit=1;
	BSF         _ProductionG_bit+0, BitPos(_ProductionG_bit+0) 
;Setup.c,522 :: 		}
L_interrupt57:
;Setup.c,523 :: 		if((Signal_G==1)&&(ProductionG_bit==1))
	BTFSS       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L_interrupt60
	BTFSS       _ProductionG_bit+0, BitPos(_ProductionG_bit+0) 
	GOTO        L_interrupt60
L__interrupt210:
;Setup.c,525 :: 		Pulse_PickG++;
	INFSNZ      _Pulse_PickG+0, 1 
	INCF        _Pulse_PickG+1, 1 
;Setup.c,526 :: 		ProductionG_bit=0;
	BCF         _ProductionG_bit+0, BitPos(_ProductionG_bit+0) 
;Setup.c,527 :: 		if(Pulse_PickG>=Picks4inchG)                  // 7
	MOVF        _Picks4inchG+1, 0 
	SUBWF       _Pulse_PickG+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt240
	MOVF        _Picks4inchG+0, 0 
	SUBWF       _Pulse_PickG+0, 0 
L__interrupt240:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt61
;Setup.c,528 :: 		{inchG=inchG+1;Pulse_PickG=0;}
	MOVF        _inchG+0, 0 
	MOVWF       R0 
	MOVF        _inchG+1, 0 
	MOVWF       R1 
	MOVF        _inchG+2, 0 
	MOVWF       R2 
	MOVF        _inchG+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _inchG+0 
	MOVF        R1, 0 
	MOVWF       _inchG+1 
	MOVF        R2, 0 
	MOVWF       _inchG+2 
	MOVF        R3, 0 
	MOVWF       _inchG+3 
	CLRF        _Pulse_PickG+0 
	CLRF        _Pulse_PickG+1 
L_interrupt61:
;Setup.c,529 :: 		}
L_interrupt60:
;Setup.c,531 :: 		if((Signal_H==0)&&(ProductionH_bit==0))
	BTFSC       RA4_bit+0, BitPos(RA4_bit+0) 
	GOTO        L_interrupt64
	BTFSC       _ProductionH_bit+0, BitPos(_ProductionH_bit+0) 
	GOTO        L_interrupt64
L__interrupt209:
;Setup.c,533 :: 		ProductionH_bit=1;
	BSF         _ProductionH_bit+0, BitPos(_ProductionH_bit+0) 
;Setup.c,534 :: 		}
L_interrupt64:
;Setup.c,535 :: 		if((Signal_H==1)&&(ProductionH_bit==1))
	BTFSS       RA4_bit+0, BitPos(RA4_bit+0) 
	GOTO        L_interrupt67
	BTFSS       _ProductionH_bit+0, BitPos(_ProductionH_bit+0) 
	GOTO        L_interrupt67
L__interrupt208:
;Setup.c,537 :: 		Pulse_PickH++;
	INFSNZ      _Pulse_PickH+0, 1 
	INCF        _Pulse_PickH+1, 1 
;Setup.c,538 :: 		ProductionH_bit=0;
	BCF         _ProductionH_bit+0, BitPos(_ProductionH_bit+0) 
;Setup.c,539 :: 		if(Pulse_PickH>=Picks4inchH)                  // 8
	MOVF        _Picks4inchH+1, 0 
	SUBWF       _Pulse_PickH+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt241
	MOVF        _Picks4inchH+0, 0 
	SUBWF       _Pulse_PickH+0, 0 
L__interrupt241:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt68
;Setup.c,540 :: 		{inchH=inchH+1;Pulse_PickH=0;}
	MOVF        _inchH+0, 0 
	MOVWF       R0 
	MOVF        _inchH+1, 0 
	MOVWF       R1 
	MOVF        _inchH+2, 0 
	MOVWF       R2 
	MOVF        _inchH+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _inchH+0 
	MOVF        R1, 0 
	MOVWF       _inchH+1 
	MOVF        R2, 0 
	MOVWF       _inchH+2 
	MOVF        R3, 0 
	MOVWF       _inchH+3 
	CLRF        _Pulse_PickH+0 
	CLRF        _Pulse_PickH+1 
L_interrupt68:
;Setup.c,541 :: 		}
L_interrupt67:
;Setup.c,543 :: 		if((Signal_I==0)&&(ProductionI_bit==0))
	BTFSC       RC1_bit+0, BitPos(RC1_bit+0) 
	GOTO        L_interrupt71
	BTFSC       _ProductionI_bit+0, BitPos(_ProductionI_bit+0) 
	GOTO        L_interrupt71
L__interrupt207:
;Setup.c,545 :: 		ProductionI_bit=1;
	BSF         _ProductionI_bit+0, BitPos(_ProductionI_bit+0) 
;Setup.c,546 :: 		}
L_interrupt71:
;Setup.c,547 :: 		if((Signal_I==1)&&(ProductionI_bit==1))
	BTFSS       RC1_bit+0, BitPos(RC1_bit+0) 
	GOTO        L_interrupt74
	BTFSS       _ProductionI_bit+0, BitPos(_ProductionI_bit+0) 
	GOTO        L_interrupt74
L__interrupt206:
;Setup.c,549 :: 		Pulse_PickI++;
	INFSNZ      _Pulse_PickI+0, 1 
	INCF        _Pulse_PickI+1, 1 
;Setup.c,550 :: 		ProductionI_bit=0;
	BCF         _ProductionI_bit+0, BitPos(_ProductionI_bit+0) 
;Setup.c,551 :: 		if(Pulse_PickI>=Picks4inchI)                  // 9
	MOVF        _Picks4inchI+1, 0 
	SUBWF       _Pulse_PickI+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt242
	MOVF        _Picks4inchI+0, 0 
	SUBWF       _Pulse_PickI+0, 0 
L__interrupt242:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt75
;Setup.c,552 :: 		{inchI=inchI+1;Pulse_PickI=0;}
	MOVF        _inchI+0, 0 
	MOVWF       R0 
	MOVF        _inchI+1, 0 
	MOVWF       R1 
	MOVF        _inchI+2, 0 
	MOVWF       R2 
	MOVF        _inchI+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _inchI+0 
	MOVF        R1, 0 
	MOVWF       _inchI+1 
	MOVF        R2, 0 
	MOVWF       _inchI+2 
	MOVF        R3, 0 
	MOVWF       _inchI+3 
	CLRF        _Pulse_PickI+0 
	CLRF        _Pulse_PickI+1 
L_interrupt75:
;Setup.c,553 :: 		}
L_interrupt74:
;Setup.c,555 :: 		if((Signal_J==0)&&(ProductionJ_bit==0))
	BTFSC       RC0_bit+0, BitPos(RC0_bit+0) 
	GOTO        L_interrupt78
	BTFSC       _ProductionJ_bit+0, BitPos(_ProductionJ_bit+0) 
	GOTO        L_interrupt78
L__interrupt205:
;Setup.c,557 :: 		ProductionJ_bit=1;
	BSF         _ProductionJ_bit+0, BitPos(_ProductionJ_bit+0) 
;Setup.c,558 :: 		}
L_interrupt78:
;Setup.c,559 :: 		if((Signal_J==1)&&(ProductionJ_bit==1))
	BTFSS       RC0_bit+0, BitPos(RC0_bit+0) 
	GOTO        L_interrupt81
	BTFSS       _ProductionJ_bit+0, BitPos(_ProductionJ_bit+0) 
	GOTO        L_interrupt81
L__interrupt204:
;Setup.c,561 :: 		Pulse_PickJ++;
	INFSNZ      _Pulse_PickJ+0, 1 
	INCF        _Pulse_PickJ+1, 1 
;Setup.c,562 :: 		ProductionJ_bit=0;
	BCF         _ProductionJ_bit+0, BitPos(_ProductionJ_bit+0) 
;Setup.c,563 :: 		if(Pulse_PickJ>=Picks4inchJ)                  // 10
	MOVF        _Picks4inchJ+1, 0 
	SUBWF       _Pulse_PickJ+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt243
	MOVF        _Picks4inchJ+0, 0 
	SUBWF       _Pulse_PickJ+0, 0 
L__interrupt243:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt82
;Setup.c,564 :: 		{inchJ=inchJ+1;Pulse_PickJ=0;}
	MOVF        _inchJ+0, 0 
	MOVWF       R0 
	MOVF        _inchJ+1, 0 
	MOVWF       R1 
	MOVF        _inchJ+2, 0 
	MOVWF       R2 
	MOVF        _inchJ+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _inchJ+0 
	MOVF        R1, 0 
	MOVWF       _inchJ+1 
	MOVF        R2, 0 
	MOVWF       _inchJ+2 
	MOVF        R3, 0 
	MOVWF       _inchJ+3 
	CLRF        _Pulse_PickJ+0 
	CLRF        _Pulse_PickJ+1 
L_interrupt82:
;Setup.c,565 :: 		}
L_interrupt81:
;Setup.c,567 :: 		if((Signal_K==0)&&(ProductionK_bit==0))
	BTFSC       RJ4_bit+0, BitPos(RJ4_bit+0) 
	GOTO        L_interrupt85
	BTFSC       _ProductionK_bit+0, BitPos(_ProductionK_bit+0) 
	GOTO        L_interrupt85
L__interrupt203:
;Setup.c,569 :: 		ProductionK_bit=1;
	BSF         _ProductionK_bit+0, BitPos(_ProductionK_bit+0) 
;Setup.c,570 :: 		}
L_interrupt85:
;Setup.c,571 :: 		if((Signal_K==1)&&(ProductionK_bit==1))
	BTFSS       RJ4_bit+0, BitPos(RJ4_bit+0) 
	GOTO        L_interrupt88
	BTFSS       _ProductionK_bit+0, BitPos(_ProductionK_bit+0) 
	GOTO        L_interrupt88
L__interrupt202:
;Setup.c,573 :: 		Pulse_PickK++;
	INFSNZ      _Pulse_PickK+0, 1 
	INCF        _Pulse_PickK+1, 1 
;Setup.c,574 :: 		ProductionK_bit=0;
	BCF         _ProductionK_bit+0, BitPos(_ProductionK_bit+0) 
;Setup.c,575 :: 		if(Pulse_PickK>=Picks4inchK)                  // 11
	MOVF        _Picks4inchK+1, 0 
	SUBWF       _Pulse_PickK+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt244
	MOVF        _Picks4inchK+0, 0 
	SUBWF       _Pulse_PickK+0, 0 
L__interrupt244:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt89
;Setup.c,576 :: 		{inchK=inchK+1;Pulse_PickK=0;}
	MOVF        _inchK+0, 0 
	MOVWF       R0 
	MOVF        _inchK+1, 0 
	MOVWF       R1 
	MOVF        _inchK+2, 0 
	MOVWF       R2 
	MOVF        _inchK+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _inchK+0 
	MOVF        R1, 0 
	MOVWF       _inchK+1 
	MOVF        R2, 0 
	MOVWF       _inchK+2 
	MOVF        R3, 0 
	MOVWF       _inchK+3 
	CLRF        _Pulse_PickK+0 
	CLRF        _Pulse_PickK+1 
L_interrupt89:
;Setup.c,577 :: 		}
L_interrupt88:
;Setup.c,579 :: 		if((Signal_L==0)&&(ProductionL_bit==0))
	BTFSC       RJ5_bit+0, BitPos(RJ5_bit+0) 
	GOTO        L_interrupt92
	BTFSC       _ProductionL_bit+0, BitPos(_ProductionL_bit+0) 
	GOTO        L_interrupt92
L__interrupt201:
;Setup.c,581 :: 		ProductionL_bit=1;
	BSF         _ProductionL_bit+0, BitPos(_ProductionL_bit+0) 
;Setup.c,582 :: 		}
L_interrupt92:
;Setup.c,583 :: 		if((Signal_L==1)&&(ProductionL_bit==1))
	BTFSS       RJ5_bit+0, BitPos(RJ5_bit+0) 
	GOTO        L_interrupt95
	BTFSS       _ProductionL_bit+0, BitPos(_ProductionL_bit+0) 
	GOTO        L_interrupt95
L__interrupt200:
;Setup.c,585 :: 		Pulse_PickL++;
	INFSNZ      _Pulse_PickL+0, 1 
	INCF        _Pulse_PickL+1, 1 
;Setup.c,586 :: 		ProductionL_bit=0;
	BCF         _ProductionL_bit+0, BitPos(_ProductionL_bit+0) 
;Setup.c,587 :: 		if(Pulse_PickL>=Picks4inchL)                  // 12
	MOVF        _Picks4inchL+1, 0 
	SUBWF       _Pulse_PickL+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt245
	MOVF        _Picks4inchL+0, 0 
	SUBWF       _Pulse_PickL+0, 0 
L__interrupt245:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt96
;Setup.c,588 :: 		{inchL=inchL+1;Pulse_PickL=0;}
	MOVF        _inchL+0, 0 
	MOVWF       R0 
	MOVF        _inchL+1, 0 
	MOVWF       R1 
	MOVF        _inchL+2, 0 
	MOVWF       R2 
	MOVF        _inchL+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _inchL+0 
	MOVF        R1, 0 
	MOVWF       _inchL+1 
	MOVF        R2, 0 
	MOVWF       _inchL+2 
	MOVF        R3, 0 
	MOVWF       _inchL+3 
	CLRF        _Pulse_PickL+0 
	CLRF        _Pulse_PickL+1 
L_interrupt96:
;Setup.c,589 :: 		}
L_interrupt95:
;Setup.c,591 :: 		if((Signal_M==0)&&(ProductionM_bit==0))
	BTFSC       RJ6_bit+0, BitPos(RJ6_bit+0) 
	GOTO        L_interrupt99
	BTFSC       _ProductionM_bit+0, BitPos(_ProductionM_bit+0) 
	GOTO        L_interrupt99
L__interrupt199:
;Setup.c,593 :: 		ProductionM_bit=1;
	BSF         _ProductionM_bit+0, BitPos(_ProductionM_bit+0) 
;Setup.c,594 :: 		}
L_interrupt99:
;Setup.c,595 :: 		if((Signal_M==1)&&(ProductionM_bit==1))
	BTFSS       RJ6_bit+0, BitPos(RJ6_bit+0) 
	GOTO        L_interrupt102
	BTFSS       _ProductionM_bit+0, BitPos(_ProductionM_bit+0) 
	GOTO        L_interrupt102
L__interrupt198:
;Setup.c,597 :: 		Pulse_PickM++;
	INFSNZ      _Pulse_PickM+0, 1 
	INCF        _Pulse_PickM+1, 1 
;Setup.c,598 :: 		ProductionM_bit=0;
	BCF         _ProductionM_bit+0, BitPos(_ProductionM_bit+0) 
;Setup.c,599 :: 		if(Pulse_PickM>=Picks4inchM)                  // 13
	MOVF        _Picks4inchM+1, 0 
	SUBWF       _Pulse_PickM+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt246
	MOVF        _Picks4inchM+0, 0 
	SUBWF       _Pulse_PickM+0, 0 
L__interrupt246:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt103
;Setup.c,600 :: 		{inchM=inchM+1;Pulse_PickM=0;}
	MOVF        _inchM+0, 0 
	MOVWF       R0 
	MOVF        _inchM+1, 0 
	MOVWF       R1 
	MOVF        _inchM+2, 0 
	MOVWF       R2 
	MOVF        _inchM+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _inchM+0 
	MOVF        R1, 0 
	MOVWF       _inchM+1 
	MOVF        R2, 0 
	MOVWF       _inchM+2 
	MOVF        R3, 0 
	MOVWF       _inchM+3 
	CLRF        _Pulse_PickM+0 
	CLRF        _Pulse_PickM+1 
L_interrupt103:
;Setup.c,601 :: 		}
L_interrupt102:
;Setup.c,603 :: 		if((Signal_N==0)&&(ProductionN_bit==0))
	BTFSC       RJ7_bit+0, BitPos(RJ7_bit+0) 
	GOTO        L_interrupt106
	BTFSC       _ProductionN_bit+0, BitPos(_ProductionN_bit+0) 
	GOTO        L_interrupt106
L__interrupt197:
;Setup.c,605 :: 		ProductionN_bit=1;
	BSF         _ProductionN_bit+0, BitPos(_ProductionN_bit+0) 
;Setup.c,606 :: 		}
L_interrupt106:
;Setup.c,607 :: 		if((Signal_N==1)&&(ProductionN_bit==1))
	BTFSS       RJ7_bit+0, BitPos(RJ7_bit+0) 
	GOTO        L_interrupt109
	BTFSS       _ProductionN_bit+0, BitPos(_ProductionN_bit+0) 
	GOTO        L_interrupt109
L__interrupt196:
;Setup.c,609 :: 		Pulse_PickN++;
	INFSNZ      _Pulse_PickN+0, 1 
	INCF        _Pulse_PickN+1, 1 
;Setup.c,610 :: 		ProductionN_bit=0;
	BCF         _ProductionN_bit+0, BitPos(_ProductionN_bit+0) 
;Setup.c,611 :: 		if(Pulse_PickN>=Picks4inchN)                  // 14
	MOVF        _Picks4inchN+1, 0 
	SUBWF       _Pulse_PickN+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt247
	MOVF        _Picks4inchN+0, 0 
	SUBWF       _Pulse_PickN+0, 0 
L__interrupt247:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt110
;Setup.c,612 :: 		{inchN=inchN+1;Pulse_PickN=0;}
	MOVF        _inchN+0, 0 
	MOVWF       R0 
	MOVF        _inchN+1, 0 
	MOVWF       R1 
	MOVF        _inchN+2, 0 
	MOVWF       R2 
	MOVF        _inchN+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _inchN+0 
	MOVF        R1, 0 
	MOVWF       _inchN+1 
	MOVF        R2, 0 
	MOVWF       _inchN+2 
	MOVF        R3, 0 
	MOVWF       _inchN+3 
	CLRF        _Pulse_PickN+0 
	CLRF        _Pulse_PickN+1 
L_interrupt110:
;Setup.c,613 :: 		}
L_interrupt109:
;Setup.c,615 :: 		if((Signal_O==0)&&(ProductionO_bit==0))
	BTFSC       RC2_bit+0, BitPos(RC2_bit+0) 
	GOTO        L_interrupt113
	BTFSC       _ProductionO_bit+0, BitPos(_ProductionO_bit+0) 
	GOTO        L_interrupt113
L__interrupt195:
;Setup.c,617 :: 		ProductionO_bit=1;
	BSF         _ProductionO_bit+0, BitPos(_ProductionO_bit+0) 
;Setup.c,618 :: 		}
L_interrupt113:
;Setup.c,619 :: 		if((Signal_O==1)&&(ProductionO_bit==1))
	BTFSS       RC2_bit+0, BitPos(RC2_bit+0) 
	GOTO        L_interrupt116
	BTFSS       _ProductionO_bit+0, BitPos(_ProductionO_bit+0) 
	GOTO        L_interrupt116
L__interrupt194:
;Setup.c,621 :: 		Pulse_PickO++;
	INFSNZ      _Pulse_PickO+0, 1 
	INCF        _Pulse_PickO+1, 1 
;Setup.c,622 :: 		ProductionO_bit=0;
	BCF         _ProductionO_bit+0, BitPos(_ProductionO_bit+0) 
;Setup.c,623 :: 		if(Pulse_PickO>=Picks4inchO)                  // 15
	MOVF        _Picks4inchO+1, 0 
	SUBWF       _Pulse_PickO+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt248
	MOVF        _Picks4inchO+0, 0 
	SUBWF       _Pulse_PickO+0, 0 
L__interrupt248:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt117
;Setup.c,624 :: 		{inchO=inchO+1;Pulse_PickO=0;}
	MOVF        _inchO+0, 0 
	MOVWF       R0 
	MOVF        _inchO+1, 0 
	MOVWF       R1 
	MOVF        _inchO+2, 0 
	MOVWF       R2 
	MOVF        _inchO+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _inchO+0 
	MOVF        R1, 0 
	MOVWF       _inchO+1 
	MOVF        R2, 0 
	MOVWF       _inchO+2 
	MOVF        R3, 0 
	MOVWF       _inchO+3 
	CLRF        _Pulse_PickO+0 
	CLRF        _Pulse_PickO+1 
L_interrupt117:
;Setup.c,625 :: 		}
L_interrupt116:
;Setup.c,627 :: 		if((Signal_P==0)&&(ProductionP_bit==0))
	BTFSC       RC5_bit+0, BitPos(RC5_bit+0) 
	GOTO        L_interrupt120
	BTFSC       _ProductionP_bit+0, BitPos(_ProductionP_bit+0) 
	GOTO        L_interrupt120
L__interrupt193:
;Setup.c,629 :: 		ProductionP_bit=1;
	BSF         _ProductionP_bit+0, BitPos(_ProductionP_bit+0) 
;Setup.c,630 :: 		}
L_interrupt120:
;Setup.c,631 :: 		if((Signal_P==1)&&(ProductionP_bit==1))
	BTFSS       RC5_bit+0, BitPos(RC5_bit+0) 
	GOTO        L_interrupt123
	BTFSS       _ProductionP_bit+0, BitPos(_ProductionP_bit+0) 
	GOTO        L_interrupt123
L__interrupt192:
;Setup.c,633 :: 		Pulse_PickP++;
	INFSNZ      _Pulse_PickP+0, 1 
	INCF        _Pulse_PickP+1, 1 
;Setup.c,634 :: 		ProductionP_bit=0;
	BCF         _ProductionP_bit+0, BitPos(_ProductionP_bit+0) 
;Setup.c,635 :: 		if(Pulse_PickP>=Picks4inchP)                  // 16
	MOVF        _Picks4inchP+1, 0 
	SUBWF       _Pulse_PickP+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt249
	MOVF        _Picks4inchP+0, 0 
	SUBWF       _Pulse_PickP+0, 0 
L__interrupt249:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt124
;Setup.c,636 :: 		{inchP=inchP+1;Pulse_PickP=0;}
	MOVF        _inchP+0, 0 
	MOVWF       R0 
	MOVF        _inchP+1, 0 
	MOVWF       R1 
	MOVF        _inchP+2, 0 
	MOVWF       R2 
	MOVF        _inchP+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _inchP+0 
	MOVF        R1, 0 
	MOVWF       _inchP+1 
	MOVF        R2, 0 
	MOVWF       _inchP+2 
	MOVF        R3, 0 
	MOVWF       _inchP+3 
	CLRF        _Pulse_PickP+0 
	CLRF        _Pulse_PickP+1 
L_interrupt124:
;Setup.c,637 :: 		}
L_interrupt123:
;Setup.c,640 :: 		}
L_interrupt9:
;Setup.c,643 :: 		if(INTCON.INT0IF)
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt125
;Setup.c,645 :: 		if( (Power_up_bit == 1) && (PowerFail_Done_bit == 0)    )
	BTFSS       _Power_up_bit+0, BitPos(_Power_up_bit+0) 
	GOTO        L_interrupt128
	BTFSC       _PowerFail_Done_bit+0, BitPos(_PowerFail_Done_bit+0) 
	GOTO        L_interrupt128
L__interrupt191:
;Setup.c,647 :: 		PowerFail_Enable_bit=1;//BIT SETTED
	BSF         _PowerFail_Enable_bit+0, BitPos(_PowerFail_Enable_bit+0) 
;Setup.c,648 :: 		}
L_interrupt128:
;Setup.c,649 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;Setup.c,650 :: 		}
L_interrupt125:
;Setup.c,651 :: 		}
L_end_interrupt:
L__interrupt230:
	RETFIE      1
; end of _interrupt

_Meter_Or_Picks_Method:

;Setup.c,659 :: 		void Meter_Or_Picks_Method()
;Setup.c,661 :: 		unsigned char Meter_Or_Picks_Exit = 1;
	MOVLW       1
	MOVWF       Meter_Or_Picks_Method_Meter_Or_Picks_Exit_L0+0 
	MOVLW       1
	MOVWF       Meter_Or_Picks_Method_Meter_Or_Picks_Option_L0+0 
	MOVLW       1
	MOVWF       Meter_Or_Picks_Method_Refresh_Screen_L0+0 
;Setup.c,665 :: 		while(Set == 0);//NEED
L_Meter_Or_Picks_Method129:
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Meter_Or_Picks_Method130
	GOTO        L_Meter_Or_Picks_Method129
L_Meter_Or_Picks_Method130:
;Setup.c,667 :: 		while(Meter_Or_Picks_Exit == 1)
L_Meter_Or_Picks_Method131:
	MOVF        Meter_Or_Picks_Method_Meter_Or_Picks_Exit_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Meter_Or_Picks_Method132
;Setup.c,670 :: 		if(Refresh_Screen == 1)
	MOVF        Meter_Or_Picks_Method_Refresh_Screen_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Meter_Or_Picks_Method133
;Setup.c,672 :: 		Refresh_Screen=0;
	CLRF        Meter_Or_Picks_Method_Refresh_Screen_L0+0 
;Setup.c,674 :: 		T6963C_PanelFill(0);
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
;Setup.c,675 :: 		T6963C_Write_Text_Adv_ROM("METER",11,8);
	MOVLW       ?lstr_10_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_10_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_10_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,676 :: 		T6963C_Write_Text_Adv_ROM("PICKS",11,24);
	MOVLW       ?lstr_11_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_11_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_11_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,678 :: 		if(Meter_Or_Picks_Option == 1)
	MOVF        Meter_Or_Picks_Method_Meter_Or_Picks_Option_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Meter_Or_Picks_Method134
;Setup.c,680 :: 		T6963C_Write_char_adv(45,0,8);
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Setup.c,681 :: 		T6963C_Write_char_adv(45,2,8);
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       2
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Setup.c,682 :: 		T6963C_Write_char_adv(62,3,8);
	MOVLW       62
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Setup.c,683 :: 		T6963C_set_cursor(7,1);
	MOVLW       7
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       1
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Setup.c,684 :: 		}
	GOTO        L_Meter_Or_Picks_Method135
L_Meter_Or_Picks_Method134:
;Setup.c,685 :: 		else if(Meter_Or_Picks_Option == 2)
	MOVF        Meter_Or_Picks_Method_Meter_Or_Picks_Option_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_Meter_Or_Picks_Method136
;Setup.c,687 :: 		T6963C_Write_char_adv(45,0,24);
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Setup.c,688 :: 		T6963C_Write_char_adv(45,2,24);
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       2
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Setup.c,689 :: 		T6963C_Write_char_adv(62,3,24);
	MOVLW       62
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Setup.c,690 :: 		T6963C_set_cursor(7,3);
	MOVLW       7
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       3
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Setup.c,691 :: 		}
L_Meter_Or_Picks_Method136:
L_Meter_Or_Picks_Method135:
;Setup.c,694 :: 		}
L_Meter_Or_Picks_Method133:
;Setup.c,697 :: 		if(Start == 0)
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Meter_Or_Picks_Method137
;Setup.c,700 :: 		Meter_Or_Picks_Option++;
	INCF        Meter_Or_Picks_Method_Meter_Or_Picks_Option_L0+0, 1 
;Setup.c,701 :: 		if(Meter_Or_Picks_Option > 2)
	MOVF        Meter_Or_Picks_Method_Meter_Or_Picks_Option_L0+0, 0 
	SUBLW       2
	BTFSC       STATUS+0, 0 
	GOTO        L_Meter_Or_Picks_Method138
;Setup.c,703 :: 		Meter_Or_Picks_Option = 1;
	MOVLW       1
	MOVWF       Meter_Or_Picks_Method_Meter_Or_Picks_Option_L0+0 
;Setup.c,704 :: 		}
L_Meter_Or_Picks_Method138:
;Setup.c,707 :: 		delay_ms(250);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Meter_Or_Picks_Method139:
	DECFSZ      R13, 1, 1
	BRA         L_Meter_Or_Picks_Method139
	DECFSZ      R12, 1, 1
	BRA         L_Meter_Or_Picks_Method139
	DECFSZ      R11, 1, 1
	BRA         L_Meter_Or_Picks_Method139
	NOP
;Setup.c,708 :: 		Refresh_Screen=1;
	MOVLW       1
	MOVWF       Meter_Or_Picks_Method_Refresh_Screen_L0+0 
;Setup.c,709 :: 		}
	GOTO        L_Meter_Or_Picks_Method140
L_Meter_Or_Picks_Method137:
;Setup.c,710 :: 		else if(Stop == 0)
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_Meter_Or_Picks_Method141
;Setup.c,712 :: 		if(Meter_Or_Picks_Option == 1)
	MOVF        Meter_Or_Picks_Method_Meter_Or_Picks_Option_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Meter_Or_Picks_Method142
;Setup.c,714 :: 		Meter_Or_Picks_Option = 2;
	MOVLW       2
	MOVWF       Meter_Or_Picks_Method_Meter_Or_Picks_Option_L0+0 
;Setup.c,715 :: 		}
	GOTO        L_Meter_Or_Picks_Method143
L_Meter_Or_Picks_Method142:
;Setup.c,718 :: 		Meter_Or_Picks_Option--;
	DECF        Meter_Or_Picks_Method_Meter_Or_Picks_Option_L0+0, 1 
;Setup.c,719 :: 		}
L_Meter_Or_Picks_Method143:
;Setup.c,721 :: 		delay_ms(250);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Meter_Or_Picks_Method144:
	DECFSZ      R13, 1, 1
	BRA         L_Meter_Or_Picks_Method144
	DECFSZ      R12, 1, 1
	BRA         L_Meter_Or_Picks_Method144
	DECFSZ      R11, 1, 1
	BRA         L_Meter_Or_Picks_Method144
	NOP
;Setup.c,722 :: 		Refresh_Screen=1;
	MOVLW       1
	MOVWF       Meter_Or_Picks_Method_Refresh_Screen_L0+0 
;Setup.c,723 :: 		}
L_Meter_Or_Picks_Method141:
L_Meter_Or_Picks_Method140:
;Setup.c,724 :: 		if(Set == 0)
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Meter_Or_Picks_Method145
;Setup.c,726 :: 		if( Meter_Or_Picks_Option == 1)
	MOVF        Meter_Or_Picks_Method_Meter_Or_Picks_Option_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Meter_Or_Picks_Method146
;Setup.c,728 :: 		T6963C_PanelFill(0);
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
;Setup.c,729 :: 		T6963C_Write_Text_Adv_ROM("METER MODE SETTED",60,64);
	MOVLW       ?lstr_12_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_12_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_12_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,730 :: 		T6963C_set_cursor(25,8);
	MOVLW       25
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Setup.c,731 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_Meter_Or_Picks_Method147:
	DECFSZ      R13, 1, 1
	BRA         L_Meter_Or_Picks_Method147
	DECFSZ      R12, 1, 1
	BRA         L_Meter_Or_Picks_Method147
	DECFSZ      R11, 1, 1
	BRA         L_Meter_Or_Picks_Method147
	NOP
;Setup.c,733 :: 		Meter_Or_Picks_Sel=0; //SLECTION VALUE
	BCF         _Meter_Or_Picks_Sel+0, BitPos(_Meter_Or_Picks_Sel+0) 
;Setup.c,734 :: 		EEPROM_Write (  (Meter_Or_Picks_Sel_addr)  ,Meter_Or_Picks_Sel);//SELECTION BIT
	MOVLW       65
	MOVWF       FARG_Eeprom_Write_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Write_address+1 
	MOVLW       0
	BTFSC       _Meter_Or_Picks_Sel+0, BitPos(_Meter_Or_Picks_Sel+0) 
	MOVLW       1
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;Setup.c,735 :: 		}
L_Meter_Or_Picks_Method146:
;Setup.c,736 :: 		if( Meter_Or_Picks_Option == 2)
	MOVF        Meter_Or_Picks_Method_Meter_Or_Picks_Option_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_Meter_Or_Picks_Method148
;Setup.c,738 :: 		T6963C_PanelFill(0);
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
;Setup.c,739 :: 		T6963C_Write_Text_Adv_ROM("PICKS MODE SETTED",60,64);
	MOVLW       ?lstr_13_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_13_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_13_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,740 :: 		T6963C_set_cursor(25,8);
	MOVLW       25
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Setup.c,741 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_Meter_Or_Picks_Method149:
	DECFSZ      R13, 1, 1
	BRA         L_Meter_Or_Picks_Method149
	DECFSZ      R12, 1, 1
	BRA         L_Meter_Or_Picks_Method149
	DECFSZ      R11, 1, 1
	BRA         L_Meter_Or_Picks_Method149
	NOP
;Setup.c,743 :: 		Meter_Or_Picks_Sel=1; //SLECTION VALUE
	BSF         _Meter_Or_Picks_Sel+0, BitPos(_Meter_Or_Picks_Sel+0) 
;Setup.c,744 :: 		EEPROM_Write (  (Meter_Or_Picks_Sel_addr)  ,Meter_Or_Picks_Sel);//SELECTION BIT
	MOVLW       65
	MOVWF       FARG_Eeprom_Write_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Write_address+1 
	MOVLW       0
	BTFSC       _Meter_Or_Picks_Sel+0, BitPos(_Meter_Or_Picks_Sel+0) 
	MOVLW       1
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;Setup.c,745 :: 		}
L_Meter_Or_Picks_Method148:
;Setup.c,747 :: 		Meter_Or_Picks_Exit = 0;
	CLRF        Meter_Or_Picks_Method_Meter_Or_Picks_Exit_L0+0 
;Setup.c,748 :: 		exit1 = 1;
	MOVLW       1
	MOVWF       _exit1+0 
;Setup.c,749 :: 		Refresh_Screen=1;
	MOVLW       1
	MOVWF       Meter_Or_Picks_Method_Refresh_Screen_L0+0 
;Setup.c,750 :: 		}
L_Meter_Or_Picks_Method145:
;Setup.c,752 :: 		if(Reverse == 0)
	BTFSC       RE7_bit+0, BitPos(RE7_bit+0) 
	GOTO        L_Meter_Or_Picks_Method150
;Setup.c,755 :: 		Meter_Or_Picks_Exit = 0;
	CLRF        Meter_Or_Picks_Method_Meter_Or_Picks_Exit_L0+0 
;Setup.c,756 :: 		exit1 = 1;
	MOVLW       1
	MOVWF       _exit1+0 
;Setup.c,757 :: 		GIE_bit  = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;Setup.c,758 :: 		PEIE_bit = 1;
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;Setup.c,759 :: 		delay_ms(250);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Meter_Or_Picks_Method151:
	DECFSZ      R13, 1, 1
	BRA         L_Meter_Or_Picks_Method151
	DECFSZ      R12, 1, 1
	BRA         L_Meter_Or_Picks_Method151
	DECFSZ      R11, 1, 1
	BRA         L_Meter_Or_Picks_Method151
	NOP
;Setup.c,760 :: 		return;
	GOTO        L_end_Meter_Or_Picks_Method
;Setup.c,761 :: 		}
L_Meter_Or_Picks_Method150:
;Setup.c,762 :: 		}
	GOTO        L_Meter_Or_Picks_Method131
L_Meter_Or_Picks_Method132:
;Setup.c,763 :: 		}
L_end_Meter_Or_Picks_Method:
	RETURN      0
; end of _Meter_Or_Picks_Method

_Inch_Or_Pay_Method:

;Setup.c,767 :: 		void Inch_Or_Pay_Method()
;Setup.c,770 :: 		unsigned char Inch_Or_Pay_Method_Exit=1,Refresh_Screen=1,Inch_Or_Pay_Method_Option=1;
	MOVLW       1
	MOVWF       Inch_Or_Pay_Method_Inch_Or_Pay_Method_Exit_L0+0 
	MOVLW       1
	MOVWF       Inch_Or_Pay_Method_Refresh_Screen_L0+0 
	MOVLW       1
	MOVWF       Inch_Or_Pay_Method_Inch_Or_Pay_Method_Option_L0+0 
;Setup.c,773 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Inch_Or_Pay_Method152:
	DECFSZ      R13, 1, 1
	BRA         L_Inch_Or_Pay_Method152
	DECFSZ      R12, 1, 1
	BRA         L_Inch_Or_Pay_Method152
	NOP
;Setup.c,774 :: 		while(Set == 0);//NEED TO WAIT TILL SET BUTTON FAIL
L_Inch_Or_Pay_Method153:
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Inch_Or_Pay_Method154
	GOTO        L_Inch_Or_Pay_Method153
L_Inch_Or_Pay_Method154:
;Setup.c,776 :: 		while(Inch_Or_Pay_Method_Exit == 1)//TILL PRESSING BACK BUTTON TRUE STAGE
L_Inch_Or_Pay_Method155:
	MOVF        Inch_Or_Pay_Method_Inch_Or_Pay_Method_Exit_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Inch_Or_Pay_Method156
;Setup.c,779 :: 		if( Refresh_Screen == 1)  //DISPLAYING SECTION
	MOVF        Inch_Or_Pay_Method_Refresh_Screen_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Inch_Or_Pay_Method157
;Setup.c,784 :: 		Refresh_Screen=0;
	CLRF        Inch_Or_Pay_Method_Refresh_Screen_L0+0 
;Setup.c,785 :: 		T6963C_PanelFill(0);
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
;Setup.c,786 :: 		T6963C_Write_Text_Adv_ROM("INCH",11,8);
	MOVLW       ?lstr_14_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_14_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_14_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,787 :: 		T6963C_Write_Text_Adv_ROM("PAY",11,24);
	MOVLW       ?lstr_15_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_15_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_15_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,788 :: 		if(Inch_Or_Pay_Method_Option == 1)
	MOVF        Inch_Or_Pay_Method_Inch_Or_Pay_Method_Option_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Inch_Or_Pay_Method158
;Setup.c,790 :: 		T6963C_Write_char_adv(45,0,8);
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Setup.c,791 :: 		T6963C_Write_char_adv(45,2,8);
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       2
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Setup.c,792 :: 		T6963C_Write_char_adv(62,3,8);
	MOVLW       62
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Setup.c,793 :: 		T6963C_set_cursor(7,1);
	MOVLW       7
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       1
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Setup.c,794 :: 		}
	GOTO        L_Inch_Or_Pay_Method159
L_Inch_Or_Pay_Method158:
;Setup.c,795 :: 		else if(Inch_Or_Pay_Method_Option == 2)
	MOVF        Inch_Or_Pay_Method_Inch_Or_Pay_Method_Option_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_Inch_Or_Pay_Method160
;Setup.c,797 :: 		T6963C_Write_char_adv(45,0,24);
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Setup.c,798 :: 		T6963C_Write_char_adv(45,2,24);
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       2
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Setup.c,799 :: 		T6963C_Write_char_adv(62,3,24);
	MOVLW       62
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Setup.c,800 :: 		T6963C_set_cursor(7,3);
	MOVLW       7
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       3
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Setup.c,801 :: 		}
L_Inch_Or_Pay_Method160:
L_Inch_Or_Pay_Method159:
;Setup.c,803 :: 		}
L_Inch_Or_Pay_Method157:
;Setup.c,805 :: 		if(Start == 0)
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Inch_Or_Pay_Method161
;Setup.c,807 :: 		Refresh_Screen=1;
	MOVLW       1
	MOVWF       Inch_Or_Pay_Method_Refresh_Screen_L0+0 
;Setup.c,808 :: 		delay_ms(50);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_Inch_Or_Pay_Method162:
	DECFSZ      R13, 1, 1
	BRA         L_Inch_Or_Pay_Method162
	DECFSZ      R12, 1, 1
	BRA         L_Inch_Or_Pay_Method162
	DECFSZ      R11, 1, 1
	BRA         L_Inch_Or_Pay_Method162
;Setup.c,809 :: 		while(Start==0);
L_Inch_Or_Pay_Method163:
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Inch_Or_Pay_Method164
	GOTO        L_Inch_Or_Pay_Method163
L_Inch_Or_Pay_Method164:
;Setup.c,810 :: 		if(Inch_Or_Pay_Method_Option >=2 )
	MOVLW       2
	SUBWF       Inch_Or_Pay_Method_Inch_Or_Pay_Method_Option_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Inch_Or_Pay_Method165
;Setup.c,812 :: 		Inch_Or_Pay_Method_Option=1;
	MOVLW       1
	MOVWF       Inch_Or_Pay_Method_Inch_Or_Pay_Method_Option_L0+0 
;Setup.c,813 :: 		}
	GOTO        L_Inch_Or_Pay_Method166
L_Inch_Or_Pay_Method165:
;Setup.c,816 :: 		Inch_Or_Pay_Method_Option++;
	INCF        Inch_Or_Pay_Method_Inch_Or_Pay_Method_Option_L0+0, 1 
;Setup.c,817 :: 		}
L_Inch_Or_Pay_Method166:
;Setup.c,818 :: 		}
L_Inch_Or_Pay_Method161:
;Setup.c,820 :: 		if (Stop == 0)
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_Inch_Or_Pay_Method167
;Setup.c,822 :: 		Refresh_Screen=1;
	MOVLW       1
	MOVWF       Inch_Or_Pay_Method_Refresh_Screen_L0+0 
;Setup.c,823 :: 		delay_ms(50);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_Inch_Or_Pay_Method168:
	DECFSZ      R13, 1, 1
	BRA         L_Inch_Or_Pay_Method168
	DECFSZ      R12, 1, 1
	BRA         L_Inch_Or_Pay_Method168
	DECFSZ      R11, 1, 1
	BRA         L_Inch_Or_Pay_Method168
;Setup.c,824 :: 		while(Stop==0);
L_Inch_Or_Pay_Method169:
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_Inch_Or_Pay_Method170
	GOTO        L_Inch_Or_Pay_Method169
L_Inch_Or_Pay_Method170:
;Setup.c,826 :: 		if(Inch_Or_Pay_Method_Option <= 1)
	MOVF        Inch_Or_Pay_Method_Inch_Or_Pay_Method_Option_L0+0, 0 
	SUBLW       1
	BTFSS       STATUS+0, 0 
	GOTO        L_Inch_Or_Pay_Method171
;Setup.c,828 :: 		Inch_Or_Pay_Method_Option=2;
	MOVLW       2
	MOVWF       Inch_Or_Pay_Method_Inch_Or_Pay_Method_Option_L0+0 
;Setup.c,829 :: 		}
	GOTO        L_Inch_Or_Pay_Method172
L_Inch_Or_Pay_Method171:
;Setup.c,832 :: 		Inch_Or_Pay_Method_Option--;
	DECF        Inch_Or_Pay_Method_Inch_Or_Pay_Method_Option_L0+0, 1 
;Setup.c,833 :: 		}
L_Inch_Or_Pay_Method172:
;Setup.c,834 :: 		}
L_Inch_Or_Pay_Method167:
;Setup.c,836 :: 		if(Set == 0 )
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Inch_Or_Pay_Method173
;Setup.c,838 :: 		Refresh_Screen=1;
	MOVLW       1
	MOVWF       Inch_Or_Pay_Method_Refresh_Screen_L0+0 
;Setup.c,839 :: 		delay_ms(50);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_Inch_Or_Pay_Method174:
	DECFSZ      R13, 1, 1
	BRA         L_Inch_Or_Pay_Method174
	DECFSZ      R12, 1, 1
	BRA         L_Inch_Or_Pay_Method174
	DECFSZ      R11, 1, 1
	BRA         L_Inch_Or_Pay_Method174
;Setup.c,840 :: 		while(Set==0);
L_Inch_Or_Pay_Method175:
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Inch_Or_Pay_Method176
	GOTO        L_Inch_Or_Pay_Method175
L_Inch_Or_Pay_Method176:
;Setup.c,843 :: 		if( Inch_Or_Pay_Method_Option == 1 )  //INCH
	MOVF        Inch_Or_Pay_Method_Inch_Or_Pay_Method_Option_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Inch_Or_Pay_Method177
;Setup.c,845 :: 		Inch_Or_Pay_Sel=0; //SLECTION VALUE
	BCF         _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
;Setup.c,847 :: 		T6963C_PanelFill(0);
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
;Setup.c,848 :: 		T6963C_Write_Text_Adv_ROM("INCH MODE SETTED",56,64);
	MOVLW       ?lstr_16_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_16_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_16_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,849 :: 		T6963C_set_cursor(24,8);
	MOVLW       24
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Setup.c,850 :: 		EEPROM_Write (  (Inch_Or_Pay_Sel_addr)  ,Inch_Or_Pay_Sel);//SELECTION BIT
	MOVLW       66
	MOVWF       FARG_Eeprom_Write_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Write_address+1 
	MOVLW       0
	BTFSC       _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
	MOVLW       1
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;Setup.c,852 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_Inch_Or_Pay_Method178:
	DECFSZ      R13, 1, 1
	BRA         L_Inch_Or_Pay_Method178
	DECFSZ      R12, 1, 1
	BRA         L_Inch_Or_Pay_Method178
	DECFSZ      R11, 1, 1
	BRA         L_Inch_Or_Pay_Method178
	NOP
;Setup.c,853 :: 		}
	GOTO        L_Inch_Or_Pay_Method179
L_Inch_Or_Pay_Method177:
;Setup.c,854 :: 		else if ( Inch_Or_Pay_Method_Option == 2 ) //PAY
	MOVF        Inch_Or_Pay_Method_Inch_Or_Pay_Method_Option_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_Inch_Or_Pay_Method180
;Setup.c,857 :: 		T6963C_PanelFill(0);
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
;Setup.c,859 :: 		Inch_Or_Pay_Sel=1; //SLECTION VALUE
	BSF         _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
;Setup.c,865 :: 		T6963C_set_cursor(28,8);
	MOVLW       28
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Setup.c,866 :: 		Increment_Decerement_Float(&Pay_Value, 50.0 ,144, 64);
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
;Setup.c,867 :: 		delay_ms(15);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       56
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_Inch_Or_Pay_Method181:
	DECFSZ      R13, 1, 1
	BRA         L_Inch_Or_Pay_Method181
	DECFSZ      R12, 1, 1
	BRA         L_Inch_Or_Pay_Method181
	DECFSZ      R11, 1, 1
	BRA         L_Inch_Or_Pay_Method181
;Setup.c,869 :: 		T6963C_PanelFill(0);
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
;Setup.c,870 :: 		T6963C_Write_Text_Adv_ROM("PAY MODE SETTED",60,64);
	MOVLW       ?lstr_17_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_17_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_17_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,871 :: 		T6963C_set_cursor(24,8);
	MOVLW       24
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Setup.c,872 :: 		EEPROM_Write (  (Inch_Or_Pay_Sel_addr)  ,Inch_Or_Pay_Sel);//SELECTION BIT
	MOVLW       66
	MOVWF       FARG_Eeprom_Write_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Write_address+1 
	MOVLW       0
	BTFSC       _Inch_Or_Pay_Sel+0, BitPos(_Inch_Or_Pay_Sel+0) 
	MOVLW       1
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;Setup.c,873 :: 		EEPORM_Write_Float( (Pay_Value_Store_addr)  , Pay_Value );//RUPEES STORE PURPOSE
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
;Setup.c,874 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_Inch_Or_Pay_Method182:
	DECFSZ      R13, 1, 1
	BRA         L_Inch_Or_Pay_Method182
	DECFSZ      R12, 1, 1
	BRA         L_Inch_Or_Pay_Method182
	DECFSZ      R11, 1, 1
	BRA         L_Inch_Or_Pay_Method182
	NOP
;Setup.c,877 :: 		T6963C_PanelFill(0);
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
;Setup.c,878 :: 		T6963C_set_cursor(25,8);
	MOVLW       25
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Setup.c,879 :: 		T6963C_Write_Text_Adv_ROM("SETTED PAY VALUE=",44,64);
	MOVLW       ?lstr_18_Setup+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_18_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_18_Setup+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       44
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Setup.c,880 :: 		Pay_Value = EEPORM_Read_Float(Pay_Value_Store_addr);
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
;Setup.c,881 :: 		FloatToStr_SingleDecimal(Pay_Value, Text);
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
;Setup.c,882 :: 		T6963C_Write_Text_Adv(Text,180,64);
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
;Setup.c,900 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_Inch_Or_Pay_Method183:
	DECFSZ      R13, 1, 1
	BRA         L_Inch_Or_Pay_Method183
	DECFSZ      R12, 1, 1
	BRA         L_Inch_Or_Pay_Method183
	DECFSZ      R11, 1, 1
	BRA         L_Inch_Or_Pay_Method183
	NOP
;Setup.c,902 :: 		}
L_Inch_Or_Pay_Method180:
L_Inch_Or_Pay_Method179:
;Setup.c,904 :: 		}
L_Inch_Or_Pay_Method173:
;Setup.c,906 :: 		if(Reverse == 0)
	BTFSC       RE7_bit+0, BitPos(RE7_bit+0) 
	GOTO        L_Inch_Or_Pay_Method184
;Setup.c,908 :: 		Refresh_Screen=1;
	MOVLW       1
	MOVWF       Inch_Or_Pay_Method_Refresh_Screen_L0+0 
;Setup.c,909 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_Inch_Or_Pay_Method185:
	DECFSZ      R13, 1, 1
	BRA         L_Inch_Or_Pay_Method185
	DECFSZ      R12, 1, 1
	BRA         L_Inch_Or_Pay_Method185
	DECFSZ      R11, 1, 1
	BRA         L_Inch_Or_Pay_Method185
	NOP
	NOP
;Setup.c,910 :: 		while(Reverse==0);
L_Inch_Or_Pay_Method186:
	BTFSC       RE7_bit+0, BitPos(RE7_bit+0) 
	GOTO        L_Inch_Or_Pay_Method187
	GOTO        L_Inch_Or_Pay_Method186
L_Inch_Or_Pay_Method187:
;Setup.c,911 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_Inch_Or_Pay_Method188:
	DECFSZ      R13, 1, 1
	BRA         L_Inch_Or_Pay_Method188
	DECFSZ      R12, 1, 1
	BRA         L_Inch_Or_Pay_Method188
	DECFSZ      R11, 1, 1
	BRA         L_Inch_Or_Pay_Method188
	NOP
	NOP
;Setup.c,913 :: 		Inch_Or_Pay_Method_Exit = 0;
	CLRF        Inch_Or_Pay_Method_Inch_Or_Pay_Method_Exit_L0+0 
;Setup.c,914 :: 		exit1 = 1;
	MOVLW       1
	MOVWF       _exit1+0 
;Setup.c,915 :: 		GIE_bit  = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;Setup.c,916 :: 		PEIE_bit = 1;
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;Setup.c,917 :: 		delay_ms(250);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Inch_Or_Pay_Method189:
	DECFSZ      R13, 1, 1
	BRA         L_Inch_Or_Pay_Method189
	DECFSZ      R12, 1, 1
	BRA         L_Inch_Or_Pay_Method189
	DECFSZ      R11, 1, 1
	BRA         L_Inch_Or_Pay_Method189
	NOP
;Setup.c,918 :: 		return;
	GOTO        L_end_Inch_Or_Pay_Method
;Setup.c,919 :: 		}
L_Inch_Or_Pay_Method184:
;Setup.c,921 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_Inch_Or_Pay_Method190:
	DECFSZ      R13, 1, 1
	BRA         L_Inch_Or_Pay_Method190
	DECFSZ      R12, 1, 1
	BRA         L_Inch_Or_Pay_Method190
	NOP
	NOP
;Setup.c,924 :: 		}
	GOTO        L_Inch_Or_Pay_Method155
L_Inch_Or_Pay_Method156:
;Setup.c,926 :: 		}
L_end_Inch_Or_Pay_Method:
	RETURN      0
; end of _Inch_Or_Pay_Method
