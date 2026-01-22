
_Menulist:

;Control_Fn.c,84 :: 		void Menulist(void)
;Control_Fn.c,86 :: 		T6963C_PanelFill(0);  //LCD CLEAR
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
;Control_Fn.c,87 :: 		T6963C_Write_Text_Adv_ROM("PRESS AND HOLD YELLOW BUTTON",8,40);
	MOVLW       ?lstr_1_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_1_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_1_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,88 :: 		IntToStr( (5-menu_sec)  , Text); //INVERT LOGIC USED
	MOVF        _menu_sec+0, 0 
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
;Control_Fn.c,89 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,90 :: 		T6963C_Write_Text_Adv(Text ,112,56 );
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
;Control_Fn.c,91 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,93 :: 		T6963C_Write_Text_Adv_ROM("SECS LEFT",80,72);
	MOVLW       ?lstr_2_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_2_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_2_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,94 :: 		menu_sec++;
	INCF        _menu_sec+0, 1 
;Control_Fn.c,95 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Menulist0:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist0
	DECFSZ      R12, 1, 1
	BRA         L_Menulist0
	DECFSZ      R11, 1, 1
	BRA         L_Menulist0
	NOP
;Control_Fn.c,96 :: 		count=0;
	CLRF        _count+0 
	CLRF        _count+1 
;Control_Fn.c,98 :: 		if(menu_sec>=5) //COUNTING VALUE
	MOVLW       5
	SUBWF       _menu_sec+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Menulist1
;Control_Fn.c,100 :: 		T6963C_PanelFill(0);  //LCD CLEAR
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
;Control_Fn.c,101 :: 		T6963C_Write_Text_Adv_ROM("NK",108,48);
	MOVLW       ?lstr_3_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_3_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_3_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       108
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,102 :: 		T6963C_Write_Text_Adv_ROM("AUTOMATION",80,64);
	MOVLW       ?lstr_4_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_4_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_4_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,103 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_Menulist2:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist2
	DECFSZ      R12, 1, 1
	BRA         L_Menulist2
	DECFSZ      R11, 1, 1
	BRA         L_Menulist2
	NOP
;Control_Fn.c,104 :: 		T6963C_PanelFill(0);  //LCD CLEAR
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
;Control_Fn.c,106 :: 		exit2=0;//BIT SET
	CLRF        _exit2+0 
;Control_Fn.c,108 :: 		menu_item=1;//DEFAULT POSITION
	MOVLW       1
	MOVWF       _menu_item+0 
;Control_Fn.c,112 :: 		while(exit2==0)
L_Menulist3:
	MOVF        _exit2+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Menulist4
;Control_Fn.c,114 :: 		T6963C_Cursor(0);              // Cursor off
	BCF         _T6963C_display+0, 1 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Control_Fn.c,115 :: 		T6963C_Cursor(1);
	BSF         _T6963C_display+0, 1 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Control_Fn.c,116 :: 		T6963C_Cursor_Blink(1);
	BSF         _T6963C_display+0, 0 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Control_Fn.c,119 :: 		if(menu_item==1)
	MOVF        _menu_item+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Menulist5
;Control_Fn.c,121 :: 		T6963C_Write_char_adv(45,0,8 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,122 :: 		T6963C_Write_char_adv(45,2,8 );
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
;Control_Fn.c,123 :: 		T6963C_Write_char_adv(62,3,8 );
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
;Control_Fn.c,124 :: 		T6963C_Write_Text_Adv_ROM("MENU MODE           ", 11, 8);
	MOVLW       ?lstr_5_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_5_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_5_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,125 :: 		T6963C_Write_Text_Adv_ROM("BEAM METER          ", 11, 24);
	MOVLW       ?lstr_6_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_6_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_6_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,126 :: 		T6963C_Write_Text_Adv_ROM("RESET COLOR         ", 11, 40);
	MOVLW       ?lstr_7_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_7_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_7_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,127 :: 		T6963C_Write_Text_Adv_ROM("CLOCK               ", 11, 56);
	MOVLW       ?lstr_8_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_8_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_8_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,128 :: 		T6963C_Write_Text_Adv_ROM("FACTORY SETTING     ", 11, 72);
	MOVLW       ?lstr_9_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_9_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_9_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,130 :: 		T6963C_set_cursor(12,1);
	MOVLW       12
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       1
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,131 :: 		if(Start==0)
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Menulist6
;Control_Fn.c,132 :: 		{menu_item=2;delay_ms(250);T6963C_PanelFill(0);}
	MOVLW       2
	MOVWF       _menu_item+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Menulist7:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist7
	DECFSZ      R12, 1, 1
	BRA         L_Menulist7
	DECFSZ      R11, 1, 1
	BRA         L_Menulist7
	NOP
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
L_Menulist6:
;Control_Fn.c,133 :: 		if(Stop==0)
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_Menulist8
;Control_Fn.c,134 :: 		{menu_item=5;delay_ms(250);T6963C_PanelFill(0);}
	MOVLW       5
	MOVWF       _menu_item+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Menulist9:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist9
	DECFSZ      R12, 1, 1
	BRA         L_Menulist9
	DECFSZ      R11, 1, 1
	BRA         L_Menulist9
	NOP
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
L_Menulist8:
;Control_Fn.c,136 :: 		if(Set==0)
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Menulist10
;Control_Fn.c,138 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Menulist11:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist11
	DECFSZ      R12, 1, 1
	BRA         L_Menulist11
	DECFSZ      R11, 1, 1
	BRA         L_Menulist11
;Control_Fn.c,139 :: 		while(Set==0);
L_Menulist12:
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Menulist13
	GOTO        L_Menulist12
L_Menulist13:
;Control_Fn.c,140 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Menulist14:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist14
	DECFSZ      R12, 1, 1
	BRA         L_Menulist14
	DECFSZ      R11, 1, 1
	BRA         L_Menulist14
;Control_Fn.c,141 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,142 :: 		UserColourSetting(); //MENU BLOCK SETTINGS
	CALL        _UserColourSetting+0, 0
;Control_Fn.c,143 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Menulist15:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist15
	DECFSZ      R12, 1, 1
	BRA         L_Menulist15
	DECFSZ      R11, 1, 1
	BRA         L_Menulist15
;Control_Fn.c,144 :: 		ColourExit=0;// only for testing 1 machine
	CLRF        _ColourExit+0 
;Control_Fn.c,145 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,146 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Menulist16:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist16
	DECFSZ      R12, 1, 1
	BRA         L_Menulist16
	DECFSZ      R11, 1, 1
	BRA         L_Menulist16
;Control_Fn.c,147 :: 		}
L_Menulist10:
;Control_Fn.c,148 :: 		}
L_Menulist5:
;Control_Fn.c,150 :: 		if(menu_item==2)
	MOVF        _menu_item+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_Menulist17
;Control_Fn.c,152 :: 		T6963C_Write_char_adv(45,0,24 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,153 :: 		T6963C_Write_char_adv(45,2,24 );
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
;Control_Fn.c,154 :: 		T6963C_Write_char_adv(62,3,24 );
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
;Control_Fn.c,155 :: 		T6963C_Write_Text_Adv_ROM("MENU MODE           ", 11, 8);
	MOVLW       ?lstr_10_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_10_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_10_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,156 :: 		T6963C_Write_Text_Adv_ROM("BEAM METER          ", 11, 24);
	MOVLW       ?lstr_11_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_11_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_11_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,157 :: 		T6963C_Write_Text_Adv_ROM("RESET COLOR         ", 11, 40);
	MOVLW       ?lstr_12_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_12_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_12_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,158 :: 		T6963C_Write_Text_Adv_ROM("CLOCK               ", 11, 56);
	MOVLW       ?lstr_13_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_13_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_13_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,159 :: 		T6963C_Write_Text_Adv_ROM("FACTORY SETTING     ", 11, 72);
	MOVLW       ?lstr_14_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_14_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_14_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,161 :: 		T6963C_set_cursor(12,3);
	MOVLW       12
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       3
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,162 :: 		if(Start==0)
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Menulist18
;Control_Fn.c,163 :: 		{menu_item=3;delay_ms(250);T6963C_PanelFill(0);}
	MOVLW       3
	MOVWF       _menu_item+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Menulist19:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist19
	DECFSZ      R12, 1, 1
	BRA         L_Menulist19
	DECFSZ      R11, 1, 1
	BRA         L_Menulist19
	NOP
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
L_Menulist18:
;Control_Fn.c,165 :: 		if(Stop==0)
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_Menulist20
;Control_Fn.c,166 :: 		{menu_item=1;delay_ms(250);T6963C_PanelFill(0);}
	MOVLW       1
	MOVWF       _menu_item+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Menulist21:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist21
	DECFSZ      R12, 1, 1
	BRA         L_Menulist21
	DECFSZ      R11, 1, 1
	BRA         L_Menulist21
	NOP
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
L_Menulist20:
;Control_Fn.c,168 :: 		if(Set==0)
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Menulist22
;Control_Fn.c,170 :: 		while(Set==0)
L_Menulist23:
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Menulist24
;Control_Fn.c,171 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Menulist25:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist25
	DECFSZ      R12, 1, 1
	BRA         L_Menulist25
	DECFSZ      R11, 1, 1
	BRA         L_Menulist25
	GOTO        L_Menulist23
L_Menulist24:
;Control_Fn.c,172 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,173 :: 		Beam_Setting(void);
	CALL        _Beam_Setting+0, 0
;Control_Fn.c,174 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,175 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Menulist26:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist26
	DECFSZ      R12, 1, 1
	BRA         L_Menulist26
	DECFSZ      R11, 1, 1
	BRA         L_Menulist26
;Control_Fn.c,176 :: 		}
L_Menulist22:
;Control_Fn.c,177 :: 		}
L_Menulist17:
;Control_Fn.c,178 :: 		if(menu_item==3)
	MOVF        _menu_item+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_Menulist27
;Control_Fn.c,180 :: 		T6963C_Write_char_adv(45,0,40 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,181 :: 		T6963C_Write_char_adv(45,2,40 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       2
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,182 :: 		T6963C_Write_char_adv(62,3,40 );
	MOVLW       62
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,183 :: 		T6963C_Write_Text_Adv_ROM("MENU MODE           ", 11, 8);
	MOVLW       ?lstr_15_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_15_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_15_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,184 :: 		T6963C_Write_Text_Adv_ROM("BEAM METER          ", 11, 24);
	MOVLW       ?lstr_16_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_16_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_16_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,185 :: 		T6963C_Write_Text_Adv_ROM("RESET COLOR         ", 11, 40);
	MOVLW       ?lstr_17_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_17_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_17_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,186 :: 		T6963C_Write_Text_Adv_ROM("CLOCK               ", 11, 56);
	MOVLW       ?lstr_18_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_18_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_18_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,187 :: 		T6963C_Write_Text_Adv_ROM("FACTORY SETTING     ", 11, 72);
	MOVLW       ?lstr_19_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_19_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_19_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,188 :: 		T6963C_set_cursor(13,5);
	MOVLW       13
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       5
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,190 :: 		if(Start==0)
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Menulist28
;Control_Fn.c,191 :: 		{menu_item=4;delay_ms(250);T6963C_PanelFill(0);}
	MOVLW       4
	MOVWF       _menu_item+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Menulist29:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist29
	DECFSZ      R12, 1, 1
	BRA         L_Menulist29
	DECFSZ      R11, 1, 1
	BRA         L_Menulist29
	NOP
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
L_Menulist28:
;Control_Fn.c,193 :: 		if(Stop==0)
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_Menulist30
;Control_Fn.c,194 :: 		{menu_item=2;delay_ms(250);T6963C_PanelFill(0);}
	MOVLW       2
	MOVWF       _menu_item+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Menulist31:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist31
	DECFSZ      R12, 1, 1
	BRA         L_Menulist31
	DECFSZ      R11, 1, 1
	BRA         L_Menulist31
	NOP
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
L_Menulist30:
;Control_Fn.c,196 :: 		if(Set==0)
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Menulist32
;Control_Fn.c,198 :: 		while(Set==0)
L_Menulist33:
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Menulist34
;Control_Fn.c,199 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Menulist35:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist35
	DECFSZ      R12, 1, 1
	BRA         L_Menulist35
	DECFSZ      R11, 1, 1
	BRA         L_Menulist35
	GOTO        L_Menulist33
L_Menulist34:
;Control_Fn.c,200 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,201 :: 		Reset_color_Setting();
	CALL        _Reset_color_Setting+0, 0
;Control_Fn.c,202 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,203 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Menulist36:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist36
	DECFSZ      R12, 1, 1
	BRA         L_Menulist36
	DECFSZ      R11, 1, 1
	BRA         L_Menulist36
;Control_Fn.c,204 :: 		}
L_Menulist32:
;Control_Fn.c,205 :: 		}
L_Menulist27:
;Control_Fn.c,207 :: 		if(menu_item==4)
	MOVF        _menu_item+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_Menulist37
;Control_Fn.c,209 :: 		T6963C_Write_char_adv(45,0,56 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,210 :: 		T6963C_Write_char_adv(45,2,56 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       2
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,211 :: 		T6963C_Write_char_adv(62,3,56 );
	MOVLW       62
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,212 :: 		T6963C_Write_Text_Adv_ROM("MENU MODE           ", 11, 8);
	MOVLW       ?lstr_20_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_20_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_20_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,213 :: 		T6963C_Write_Text_Adv_ROM("BEAM METER          ", 11, 24);
	MOVLW       ?lstr_21_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_21_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_21_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,214 :: 		T6963C_Write_Text_Adv_ROM("RESET COLOR         ", 11, 40);
	MOVLW       ?lstr_22_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_22_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_22_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,215 :: 		T6963C_Write_Text_Adv_ROM("CLOCK               ", 11, 56);
	MOVLW       ?lstr_23_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_23_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_23_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,216 :: 		T6963C_Write_Text_Adv_ROM("FACTORY SETTING     ", 11, 72);
	MOVLW       ?lstr_24_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_24_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_24_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,217 :: 		T6963C_set_cursor(9,7);
	MOVLW       9
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       7
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,219 :: 		if(Start==0)
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Menulist38
;Control_Fn.c,220 :: 		{menu_item=5;delay_ms(250);T6963C_PanelFill(0);}
	MOVLW       5
	MOVWF       _menu_item+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Menulist39:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist39
	DECFSZ      R12, 1, 1
	BRA         L_Menulist39
	DECFSZ      R11, 1, 1
	BRA         L_Menulist39
	NOP
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
L_Menulist38:
;Control_Fn.c,222 :: 		if(Stop==0)
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_Menulist40
;Control_Fn.c,223 :: 		{menu_item=3;delay_ms(250);T6963C_PanelFill(0);}
	MOVLW       3
	MOVWF       _menu_item+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Menulist41:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist41
	DECFSZ      R12, 1, 1
	BRA         L_Menulist41
	DECFSZ      R11, 1, 1
	BRA         L_Menulist41
	NOP
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
L_Menulist40:
;Control_Fn.c,225 :: 		if(Set==0)
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Menulist42
;Control_Fn.c,227 :: 		while(Set==0)
L_Menulist43:
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Menulist44
;Control_Fn.c,228 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Menulist45:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist45
	DECFSZ      R12, 1, 1
	BRA         L_Menulist45
	DECFSZ      R11, 1, 1
	BRA         L_Menulist45
	GOTO        L_Menulist43
L_Menulist44:
;Control_Fn.c,229 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,230 :: 		Set_Date_Time_Rtc();
	CALL        _Set_Date_Time_Rtc+0, 0
;Control_Fn.c,231 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,232 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Menulist46:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist46
	DECFSZ      R12, 1, 1
	BRA         L_Menulist46
	DECFSZ      R11, 1, 1
	BRA         L_Menulist46
;Control_Fn.c,233 :: 		}
L_Menulist42:
;Control_Fn.c,234 :: 		}
L_Menulist37:
;Control_Fn.c,235 :: 		if(menu_item==5)
	MOVF        _menu_item+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_Menulist47
;Control_Fn.c,237 :: 		T6963C_Write_char_adv(45,0,72 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,238 :: 		T6963C_Write_char_adv(45,2,72 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       2
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,239 :: 		T6963C_Write_char_adv(62,3,72 );
	MOVLW       62
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,240 :: 		T6963C_Write_Text_Adv_ROM("MENU MODE           ", 11, 8);
	MOVLW       ?lstr_25_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_25_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_25_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,241 :: 		T6963C_Write_Text_Adv_ROM("BEAM METER          ", 11, 24);
	MOVLW       ?lstr_26_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_26_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_26_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,242 :: 		T6963C_Write_Text_Adv_ROM("RESET COLOR         ", 11, 40);
	MOVLW       ?lstr_27_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_27_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_27_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,243 :: 		T6963C_Write_Text_Adv_ROM("CLOCK               ", 11, 56);
	MOVLW       ?lstr_28_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_28_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_28_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,244 :: 		T6963C_Write_Text_Adv_ROM("FACTORY SETTING     ", 11, 72);
	MOVLW       ?lstr_29_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_29_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_29_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,245 :: 		T6963C_set_cursor(18,22);
	MOVLW       18
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       22
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,246 :: 		if(Start==0)
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Menulist48
;Control_Fn.c,247 :: 		{menu_item=1;delay_ms(250);T6963C_PanelFill(0);}
	MOVLW       1
	MOVWF       _menu_item+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Menulist49:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist49
	DECFSZ      R12, 1, 1
	BRA         L_Menulist49
	DECFSZ      R11, 1, 1
	BRA         L_Menulist49
	NOP
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
L_Menulist48:
;Control_Fn.c,249 :: 		if(Stop==0)
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_Menulist50
;Control_Fn.c,250 :: 		{menu_item=4;delay_ms(250);T6963C_PanelFill(0);}
	MOVLW       4
	MOVWF       _menu_item+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Menulist51:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist51
	DECFSZ      R12, 1, 1
	BRA         L_Menulist51
	DECFSZ      R11, 1, 1
	BRA         L_Menulist51
	NOP
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
L_Menulist50:
;Control_Fn.c,252 :: 		if(Set==0)
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Menulist52
;Control_Fn.c,254 :: 		while(Set==0)
L_Menulist53:
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Menulist54
;Control_Fn.c,255 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Menulist55:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist55
	DECFSZ      R12, 1, 1
	BRA         L_Menulist55
	DECFSZ      R11, 1, 1
	BRA         L_Menulist55
	GOTO        L_Menulist53
L_Menulist54:
;Control_Fn.c,256 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,257 :: 		Factory_Reset();
	CALL        _Factory_Reset+0, 0
;Control_Fn.c,258 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,259 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Menulist56:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist56
	DECFSZ      R12, 1, 1
	BRA         L_Menulist56
	DECFSZ      R11, 1, 1
	BRA         L_Menulist56
;Control_Fn.c,260 :: 		}
L_Menulist52:
;Control_Fn.c,261 :: 		}
L_Menulist47:
;Control_Fn.c,265 :: 		if(Reverse==0)
	BTFSC       RE7_bit+0, BitPos(RE7_bit+0) 
	GOTO        L_Menulist57
;Control_Fn.c,267 :: 		T6963C_Cursor(0);
	BCF         _T6963C_display+0, 1 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Control_Fn.c,268 :: 		exit2=1;
	MOVLW       1
	MOVWF       _exit2+0 
;Control_Fn.c,269 :: 		LCD_Refresh();
	CALL        _LCD_Refresh+0, 0
;Control_Fn.c,270 :: 		delay_ms(250);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Menulist58:
	DECFSZ      R13, 1, 1
	BRA         L_Menulist58
	DECFSZ      R12, 1, 1
	BRA         L_Menulist58
	DECFSZ      R11, 1, 1
	BRA         L_Menulist58
	NOP
;Control_Fn.c,271 :: 		}
L_Menulist57:
;Control_Fn.c,274 :: 		}
	GOTO        L_Menulist3
L_Menulist4:
;Control_Fn.c,275 :: 		}
L_Menulist1:
;Control_Fn.c,276 :: 		if(Set!=0)
	BTFSS       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Menulist59
;Control_Fn.c,278 :: 		menu_sec=0;LCD_Refresh();
	CLRF        _menu_sec+0 
	CALL        _LCD_Refresh+0, 0
;Control_Fn.c,279 :: 		}
L_Menulist59:
;Control_Fn.c,280 :: 		}
L_end_Menulist:
	RETURN      0
; end of _Menulist

_Beam_Setting:

;Control_Fn.c,284 :: 		void Beam_Setting(void)
;Control_Fn.c,286 :: 		unsigned char Reset_loop=0,Exit_loop=0,SplFlag=0,SplFlag1=0;
	CLRF        Beam_Setting_Reset_loop_L0+0 
	CLRF        Beam_Setting_Exit_loop_L0+0 
	CLRF        Beam_Setting_SplFlag_L0+0 
	CLRF        Beam_Setting_Hold_mode_L0+0 
;Control_Fn.c,290 :: 		Exit_loop=0;
	CLRF        Beam_Setting_Exit_loop_L0+0 
;Control_Fn.c,293 :: 		while(Exit_loop==0)
L_Beam_Setting60:
	MOVF        Beam_Setting_Exit_loop_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Beam_Setting61
;Control_Fn.c,295 :: 		while(Hold_mode==0)
L_Beam_Setting62:
	MOVF        Beam_Setting_Hold_mode_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Beam_Setting63
;Control_Fn.c,297 :: 		if((SplFlag==0)&&(Reset_loop==0))
	MOVF        Beam_Setting_SplFlag_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Beam_Setting66
	MOVF        Beam_Setting_Reset_loop_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Beam_Setting66
L__Beam_Setting667:
;Control_Fn.c,300 :: 		T6963C_Write_char_adv(45,0,8 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,301 :: 		T6963C_Write_char_adv(45,2,8 );
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
;Control_Fn.c,302 :: 		T6963C_Write_char_adv(62,3,8 );
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
;Control_Fn.c,303 :: 		T6963C_Write_Text_Adv_ROM("TOTAL:BEAM/LOOM", 11, 8);
	MOVLW       ?lstr_30_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_30_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_30_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,304 :: 		T6963C_Write_Text_Adv_ROM("BEAM:LOOM/SHIFT", 11, 24);
	MOVLW       ?lstr_31_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_31_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_31_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,305 :: 		T6963C_set_cursor(20,1);
	MOVLW       20
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       1
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,306 :: 		Reset_loop=1;
	MOVLW       1
	MOVWF       Beam_Setting_Reset_loop_L0+0 
;Control_Fn.c,307 :: 		delay_ms(100);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Beam_Setting67:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Setting67
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Setting67
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Setting67
	NOP
;Control_Fn.c,308 :: 		}
L_Beam_Setting66:
;Control_Fn.c,310 :: 		if((SplFlag==1)&&(Reset_loop==0))
	MOVF        Beam_Setting_SplFlag_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Beam_Setting70
	MOVF        Beam_Setting_Reset_loop_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Beam_Setting70
L__Beam_Setting666:
;Control_Fn.c,312 :: 		T6963C_Write_char_adv(45,0,24 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,313 :: 		T6963C_Write_char_adv(45,2,24 );
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
;Control_Fn.c,314 :: 		T6963C_Write_char_adv(62,3,24 );
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
;Control_Fn.c,315 :: 		T6963C_Write_Text_Adv_ROM("TOTAL:BEAM/LOOM", 11, 8);
	MOVLW       ?lstr_32_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_32_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_32_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,316 :: 		T6963C_Write_Text_Adv_ROM("BEAM:LOOM/SHIFT", 11, 24);
	MOVLW       ?lstr_33_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_33_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_33_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,317 :: 		T6963C_set_cursor(20,3);
	MOVLW       20
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       3
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,318 :: 		Reset_loop=1;
	MOVLW       1
	MOVWF       Beam_Setting_Reset_loop_L0+0 
;Control_Fn.c,319 :: 		delay_ms(100);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Beam_Setting71:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Setting71
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Setting71
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Setting71
	NOP
;Control_Fn.c,320 :: 		}
L_Beam_Setting70:
;Control_Fn.c,322 :: 		if(Start==0)
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Beam_Setting72
;Control_Fn.c,324 :: 		if(SplFlag==0)
	MOVF        Beam_Setting_SplFlag_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Beam_Setting73
;Control_Fn.c,325 :: 		{SplFlag=1;Reset_loop=0;T6963C_PanelFill(0);delay_ms(100); }
	MOVLW       1
	MOVWF       Beam_Setting_SplFlag_L0+0 
	CLRF        Beam_Setting_Reset_loop_L0+0 
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
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Beam_Setting74:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Setting74
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Setting74
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Setting74
	NOP
	GOTO        L_Beam_Setting75
L_Beam_Setting73:
;Control_Fn.c,326 :: 		else if(SplFlag==1)
	MOVF        Beam_Setting_SplFlag_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Beam_Setting76
;Control_Fn.c,327 :: 		{SplFlag=0;Reset_loop=0;T6963C_PanelFill(0);delay_ms(100); }
	CLRF        Beam_Setting_SplFlag_L0+0 
	CLRF        Beam_Setting_Reset_loop_L0+0 
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
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Beam_Setting77:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Setting77
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Setting77
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Setting77
	NOP
L_Beam_Setting76:
L_Beam_Setting75:
;Control_Fn.c,328 :: 		}
L_Beam_Setting72:
;Control_Fn.c,332 :: 		if(Set==0)
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Beam_Setting78
;Control_Fn.c,335 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,336 :: 		if(SplFlag==0)
	MOVF        Beam_Setting_SplFlag_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Beam_Setting79
;Control_Fn.c,338 :: 		Beam_Loom_Shift();
	CALL        _Beam_Loom_Shift+0, 0
;Control_Fn.c,339 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Beam_Setting80:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Setting80
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Setting80
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Setting80
;Control_Fn.c,340 :: 		return;
	GOTO        L_end_Beam_Setting
;Control_Fn.c,341 :: 		}
L_Beam_Setting79:
;Control_Fn.c,343 :: 		if(SplFlag==1)
	MOVF        Beam_Setting_SplFlag_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Beam_Setting81
;Control_Fn.c,345 :: 		Select_Loom_Total_Beam_per_loom();
	CALL        _Select_Loom_Total_Beam_per_loom+0, 0
;Control_Fn.c,346 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Beam_Setting82:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Setting82
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Setting82
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Setting82
;Control_Fn.c,347 :: 		return;
	GOTO        L_end_Beam_Setting
;Control_Fn.c,348 :: 		}
L_Beam_Setting81:
;Control_Fn.c,349 :: 		}
L_Beam_Setting78:
;Control_Fn.c,351 :: 		if(Reverse==0)
	BTFSC       RE7_bit+0, BitPos(RE7_bit+0) 
	GOTO        L_Beam_Setting83
;Control_Fn.c,353 :: 		Exit_loop=1;
	MOVLW       1
	MOVWF       Beam_Setting_Exit_loop_L0+0 
;Control_Fn.c,354 :: 		Hold_mode=1;
	MOVLW       1
	MOVWF       Beam_Setting_Hold_mode_L0+0 
;Control_Fn.c,355 :: 		Reset_loop=0;
	CLRF        Beam_Setting_Reset_loop_L0+0 
;Control_Fn.c,356 :: 		exit1=1;
	MOVLW       1
	MOVWF       _exit1+0 
;Control_Fn.c,357 :: 		GIE_bit       = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;Control_Fn.c,358 :: 		PEIE_bit      = 1;
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;Control_Fn.c,359 :: 		delay_ms(250);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Beam_Setting84:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Setting84
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Setting84
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Setting84
	NOP
;Control_Fn.c,360 :: 		return;
	GOTO        L_end_Beam_Setting
;Control_Fn.c,361 :: 		}
L_Beam_Setting83:
;Control_Fn.c,363 :: 		}
	GOTO        L_Beam_Setting62
L_Beam_Setting63:
;Control_Fn.c,366 :: 		}
	GOTO        L_Beam_Setting60
L_Beam_Setting61:
;Control_Fn.c,367 :: 		}
L_end_Beam_Setting:
	RETURN      0
; end of _Beam_Setting

_Reset_To_Next_Shift:

;Control_Fn.c,370 :: 		void Reset_To_Next_Shift(void)
;Control_Fn.c,372 :: 		T6963C_PanelFill(0);  //LCD CLEAR
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
;Control_Fn.c,373 :: 		T6963C_Write_Text_Adv_ROM("PRESS AND HOLD RED BUTTON",20,40);
	MOVLW       ?lstr_34_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_34_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_34_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       20
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,374 :: 		IntToStr( (5-menushift_sec)  , Text);
	MOVF        _menushift_sec+0, 0 
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
;Control_Fn.c,375 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,376 :: 		T6963C_Write_Text_Adv(Text ,112,56 );
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
;Control_Fn.c,377 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,381 :: 		T6963C_Write_Text_Adv_ROM("SECONDS LEFT",72,72);
	MOVLW       ?lstr_35_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_35_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_35_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,382 :: 		T6963C_Write_Text_Adv_ROM("TO RESET SHIFT",64,88);
	MOVLW       ?lstr_36_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_36_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_36_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       88
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,383 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Reset_To_Next_Shift85:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_To_Next_Shift85
	DECFSZ      R12, 1, 1
	BRA         L_Reset_To_Next_Shift85
	DECFSZ      R11, 1, 1
	BRA         L_Reset_To_Next_Shift85
	NOP
;Control_Fn.c,384 :: 		menushift_sec++;
	INCF        _menushift_sec+0, 1 
;Control_Fn.c,385 :: 		count=0;
	CLRF        _count+0 
	CLRF        _count+1 
;Control_Fn.c,387 :: 		if(menushift_sec>=5)
	MOVLW       5
	SUBWF       _menushift_sec+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Reset_To_Next_Shift86
;Control_Fn.c,389 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,390 :: 		T6963C_Write_Text_Adv_ROM("NK", 108, 48);
	MOVLW       ?lstr_37_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_37_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_37_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       108
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,391 :: 		T6963C_Write_Text_Adv_ROM("AUTOMATION", 80, 64);
	MOVLW       ?lstr_38_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_38_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_38_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,392 :: 		Save_shiftwise_External();
	CALL        _Save_shiftwise_External+0, 0
;Control_Fn.c,393 :: 		Save_shiftwise_Date_time_External();
	CALL        _Save_shiftwise_Date_time_External+0, 0
;Control_Fn.c,394 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Reset_To_Next_Shift87:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_To_Next_Shift87
	DECFSZ      R12, 1, 1
	BRA         L_Reset_To_Next_Shift87
	DECFSZ      R11, 1, 1
	BRA         L_Reset_To_Next_Shift87
	NOP
;Control_Fn.c,395 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,396 :: 		exit3=0;
	CLRF        _exit3+0 
;Control_Fn.c,397 :: 		menushift_item=1;
	MOVLW       1
	MOVWF       _menushift_item+0 
;Control_Fn.c,402 :: 		if(Shift_value<95)
	MOVLW       95
	SUBWF       _Shift_value+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Reset_To_Next_Shift88
;Control_Fn.c,404 :: 		Shift_value++;
	INCF        _Shift_value+0, 1 
;Control_Fn.c,405 :: 		Variable_Reset();
	CALL        _Variable_Reset+0, 0
;Control_Fn.c,406 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,407 :: 		T6963C_Write_Text_Adv_ROM("SHIFT CHANGED", 80, 48);
	MOVLW       ?lstr_39_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_39_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_39_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,408 :: 		IntToStr( (Shift_value+1)  , Text);
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
;Control_Fn.c,409 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,410 :: 		T6963C_Write_Text_Adv(Text ,116,64 );
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       116
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,411 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,413 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_Reset_To_Next_Shift89:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_To_Next_Shift89
	DECFSZ      R12, 1, 1
	BRA         L_Reset_To_Next_Shift89
	DECFSZ      R11, 1, 1
	BRA         L_Reset_To_Next_Shift89
	NOP
;Control_Fn.c,414 :: 		}
	GOTO        L_Reset_To_Next_Shift90
L_Reset_To_Next_Shift88:
;Control_Fn.c,417 :: 		Next_cyle();
	CALL        _Next_cyle+0, 0
;Control_Fn.c,418 :: 		}
L_Reset_To_Next_Shift90:
;Control_Fn.c,421 :: 		}
L_Reset_To_Next_Shift86:
;Control_Fn.c,422 :: 		if(Stop!=0)
	BTFSS       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_Reset_To_Next_Shift91
;Control_Fn.c,424 :: 		menushift_sec=0;LCD_Refresh();
	CLRF        _menushift_sec+0 
	CALL        _LCD_Refresh+0, 0
;Control_Fn.c,425 :: 		}
L_Reset_To_Next_Shift91:
;Control_Fn.c,427 :: 		}
L_end_Reset_To_Next_Shift:
	RETURN      0
; end of _Reset_To_Next_Shift

_Shift_Jump:

;Control_Fn.c,429 :: 		void Shift_Jump(void)
;Control_Fn.c,431 :: 		Save_shiftwise_External();
	CALL        _Save_shiftwise_External+0, 0
;Control_Fn.c,432 :: 		Save_shiftwise_Date_time_External();
	CALL        _Save_shiftwise_Date_time_External+0, 0
;Control_Fn.c,434 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,435 :: 		T6963C_Write_Text_Adv_ROM("SHIFT:NO:", 90, 48);
	MOVLW       ?lstr_40_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_40_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_40_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       90
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,436 :: 		delay_ms(500);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_Shift_Jump92:
	DECFSZ      R13, 1, 1
	BRA         L_Shift_Jump92
	DECFSZ      R12, 1, 1
	BRA         L_Shift_Jump92
	DECFSZ      R11, 1, 1
	BRA         L_Shift_Jump92
;Control_Fn.c,437 :: 		Increment_Decerement(&Shift_value,96,104,64);
	MOVLW       _Shift_value+0
	MOVWF       FARG_Increment_Decerement_var+0 
	MOVLW       hi_addr(_Shift_value+0)
	MOVWF       FARG_Increment_Decerement_var+1 
	MOVLW       96
	MOVWF       FARG_Increment_Decerement_limit+0 
	MOVLW       104
	MOVWF       FARG_Increment_Decerement_Pos_x+0 
	MOVLW       64
	MOVWF       FARG_Increment_Decerement_Pos_y+0 
	CALL        _Increment_Decerement+0, 0
;Control_Fn.c,438 :: 		delay_ms(500);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_Shift_Jump93:
	DECFSZ      R13, 1, 1
	BRA         L_Shift_Jump93
	DECFSZ      R12, 1, 1
	BRA         L_Shift_Jump93
	DECFSZ      R11, 1, 1
	BRA         L_Shift_Jump93
;Control_Fn.c,440 :: 		if(Shift_value<=0){Shift_value=0;}
	MOVF        _Shift_value+0, 0 
	SUBLW       0
	BTFSS       STATUS+0, 0 
	GOTO        L_Shift_Jump94
	CLRF        _Shift_value+0 
L_Shift_Jump94:
;Control_Fn.c,441 :: 		if(Shift_value>=1){Shift_value=(Shift_value-1); }
	MOVLW       1
	SUBWF       _Shift_value+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Shift_Jump95
	DECF        _Shift_value+0, 1 
L_Shift_Jump95:
;Control_Fn.c,445 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Shift_Jump96:
	DECFSZ      R13, 1, 1
	BRA         L_Shift_Jump96
	DECFSZ      R12, 1, 1
	BRA         L_Shift_Jump96
	DECFSZ      R11, 1, 1
	BRA         L_Shift_Jump96
	NOP
;Control_Fn.c,446 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,448 :: 		if(Shift_value<95)
	MOVLW       95
	SUBWF       _Shift_value+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Shift_Jump97
;Control_Fn.c,450 :: 		Variable_Reset();
	CALL        _Variable_Reset+0, 0
;Control_Fn.c,451 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,453 :: 		T6963C_Write_Text_Adv_ROM("SHIFT CHANGED", 80, 48);
	MOVLW       ?lstr_41_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_41_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_41_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,454 :: 		IntToStr( (Shift_value+1)  , Text);
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
;Control_Fn.c,455 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,456 :: 		T6963C_Write_Text_Adv(Text ,116,64 );
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       116
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,457 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,462 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_Shift_Jump98:
	DECFSZ      R13, 1, 1
	BRA         L_Shift_Jump98
	DECFSZ      R12, 1, 1
	BRA         L_Shift_Jump98
	DECFSZ      R11, 1, 1
	BRA         L_Shift_Jump98
	NOP
;Control_Fn.c,463 :: 		}
	GOTO        L_Shift_Jump99
L_Shift_Jump97:
;Control_Fn.c,466 :: 		Next_cyle();
	CALL        _Next_cyle+0, 0
;Control_Fn.c,467 :: 		}
L_Shift_Jump99:
;Control_Fn.c,472 :: 		}
L_end_Shift_Jump:
	RETURN      0
; end of _Shift_Jump

_Beam_Loom_Shift:

;Control_Fn.c,475 :: 		void Beam_Loom_Shift(void)
;Control_Fn.c,477 :: 		unsigned char Reset_loop=0,ColourExit2=0,item=0,SplFlag=0;
	CLRF        Beam_Loom_Shift_Reset_loop_L0+0 
	CLRF        Beam_Loom_Shift_ColourExit2_L0+0 
	MOVLW       1
	MOVWF       Beam_Loom_Shift_Loom_no_L0+0 
	MOVLW       1
	MOVWF       Beam_Loom_Shift_Shift_no_L0+0 
;Control_Fn.c,484 :: 		while(ColourExit2==0)
L_Beam_Loom_Shift100:
	MOVF        Beam_Loom_Shift_ColourExit2_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Beam_Loom_Shift101
;Control_Fn.c,486 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,487 :: 		T6963C_Write_Text_Adv_ROM("LOOM:NO      SHIFT:NO", 30, 48);
	MOVLW       ?lstr_42_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_42_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_42_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       30
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,488 :: 		delay_ms(1500);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_Beam_Loom_Shift102:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Loom_Shift102
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Loom_Shift102
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Loom_Shift102
	NOP
	NOP
;Control_Fn.c,489 :: 		Loom_no=Loom_Starting_value;
	MOVF        _Loom_Starting_value+0, 0 
	MOVWF       Beam_Loom_Shift_Loom_no_L0+0 
;Control_Fn.c,491 :: 		Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),38,64);// [DECREMENT PORBLEM] WHILE DECREMENT STARTING MAKE THE VLAUE GOES ABOVE THE LIMIT
	MOVLW       Beam_Loom_Shift_Loom_no_L0+0
	MOVWF       FARG_Increment_Decerement_var+0 
	MOVLW       hi_addr(Beam_Loom_Shift_Loom_no_L0+0)
	MOVWF       FARG_Increment_Decerement_var+1 
	DECF        _Loom_Starting_value+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       16
	MOVWF       FARG_Increment_Decerement_limit+0 
	MOVLW       38
	MOVWF       FARG_Increment_Decerement_Pos_x+0 
	MOVLW       64
	MOVWF       FARG_Increment_Decerement_Pos_y+0 
	CALL        _Increment_Decerement+0, 0
;Control_Fn.c,493 :: 		while(Loom_no<Loom_Starting_value)
L_Beam_Loom_Shift103:
	MOVF        _Loom_Starting_value+0, 0 
	SUBWF       Beam_Loom_Shift_Loom_no_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Beam_Loom_Shift104
;Control_Fn.c,495 :: 		Loom_no=Loom_Starting_value;
	MOVF        _Loom_Starting_value+0, 0 
	MOVWF       Beam_Loom_Shift_Loom_no_L0+0 
;Control_Fn.c,496 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,497 :: 		T6963C_Write_Text_Adv_ROM("INVALD VALUE FOR THIS BOX", 21, 8);
	MOVLW       ?lstr_43_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_43_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_43_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       21
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,498 :: 		delay_ms(1500);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_Beam_Loom_Shift105:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Loom_Shift105
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Loom_Shift105
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Loom_Shift105
	NOP
	NOP
;Control_Fn.c,499 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,500 :: 		T6963C_Write_Text_Adv_ROM("LOOM:NO      SHIFT:NO", 30, 48);
	MOVLW       ?lstr_44_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_44_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_44_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       30
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,501 :: 		delay_ms(1500);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_Beam_Loom_Shift106:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Loom_Shift106
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Loom_Shift106
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Loom_Shift106
	NOP
	NOP
;Control_Fn.c,504 :: 		Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),38,64);
	MOVLW       Beam_Loom_Shift_Loom_no_L0+0
	MOVWF       FARG_Increment_Decerement_var+0 
	MOVLW       hi_addr(Beam_Loom_Shift_Loom_no_L0+0)
	MOVWF       FARG_Increment_Decerement_var+1 
	DECF        _Loom_Starting_value+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       16
	MOVWF       FARG_Increment_Decerement_limit+0 
	MOVLW       38
	MOVWF       FARG_Increment_Decerement_Pos_x+0 
	MOVLW       64
	MOVWF       FARG_Increment_Decerement_Pos_y+0 
	CALL        _Increment_Decerement+0, 0
;Control_Fn.c,507 :: 		}
	GOTO        L_Beam_Loom_Shift103
L_Beam_Loom_Shift104:
;Control_Fn.c,511 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Beam_Loom_Shift107:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Loom_Shift107
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Loom_Shift107
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Loom_Shift107
	NOP
;Control_Fn.c,512 :: 		Increment_Decerement(&Shift_no,96,160,64);
	MOVLW       Beam_Loom_Shift_Shift_no_L0+0
	MOVWF       FARG_Increment_Decerement_var+0 
	MOVLW       hi_addr(Beam_Loom_Shift_Shift_no_L0+0)
	MOVWF       FARG_Increment_Decerement_var+1 
	MOVLW       96
	MOVWF       FARG_Increment_Decerement_limit+0 
	MOVLW       160
	MOVWF       FARG_Increment_Decerement_Pos_x+0 
	MOVLW       64
	MOVWF       FARG_Increment_Decerement_Pos_y+0 
	CALL        _Increment_Decerement+0, 0
;Control_Fn.c,513 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Beam_Loom_Shift108:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Loom_Shift108
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Loom_Shift108
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Loom_Shift108
	NOP
;Control_Fn.c,514 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,516 :: 		T6963C_Write_Text_Adv_ROM("PLEASE NOTE:", 72, 32);
	MOVLW       ?lstr_45_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_45_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_45_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       32
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,517 :: 		T6963C_Write_Text_Adv_ROM("DATE SHIFT AND TIME READINGS",8, 48);
	MOVLW       ?lstr_46_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_46_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_46_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,518 :: 		delay_ms(3000);
	MOVLW       244
	MOVWF       R11, 0
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_Beam_Loom_Shift109:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Loom_Shift109
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Loom_Shift109
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Loom_Shift109
;Control_Fn.c,519 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,520 :: 		T6963C_Write_Text_Adv_ROM("L00M   DATE   MONTH   YEAR", 11, 8);
	MOVLW       ?lstr_47_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_47_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_47_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,521 :: 		IntToStr( Loom_no  , Text);
	MOVF        Beam_Loom_Shift_Loom_no_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _Text+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Control_Fn.c,522 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,523 :: 		T6963C_Write_Text_Adv(Text ,16,23 );
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       16
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       23
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,524 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,526 :: 		T6963C_Write_Text_Adv_ROM(" ", 32, 23);
	MOVLW       ?lstr_48_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_48_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_48_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       32
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       23
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,528 :: 		Read_Shift_Date_Time(Shift_no);
	MOVF        Beam_Loom_Shift_Shift_no_L0+0, 0 
	MOVWF       FARG_Read_Shift_Date_Time_Shift_no+0 
	CALL        _Read_Shift_Date_Time+0, 0
;Control_Fn.c,531 :: 		GLCD_Print_Int_With_LeadingZero(Date ,72,23 );
	MOVF        _Date+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       72
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       23
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,533 :: 		T6963C_Write_Text_Adv_ROM("-", 98, 23);
	MOVLW       ?lstr_49_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_49_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_49_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       98
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       23
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,536 :: 		GLCD_Print_Int_With_LeadingZero(Month ,130,23 );
	MOVF        _Month+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       130
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       23
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,539 :: 		T6963C_Write_Text_Adv_ROM("-",180,23);
	MOVLW       ?lstr_50_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_50_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_50_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       180
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       23
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,540 :: 		GLCD_Print_Int_With_LeadingZero(Year ,198,23 );
	MOVF        _Year+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       198
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       23
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,543 :: 		T6963C_Write_Text_Adv_ROM("SHIFT NO:", 11, 45);
	MOVLW       ?lstr_51_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_51_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_51_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,544 :: 		GLCD_Print_Int_With_LeadingZero(Shift_no ,86,45 );
	MOVF        Beam_Loom_Shift_Shift_no_L0+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       86
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       45
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,551 :: 		T6963C_Write_Text_Adv_ROM("TIME:", 11, 64);
	MOVLW       ?lstr_52_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_52_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_52_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,552 :: 		GLCD_Print_Int_With_LeadingZero(Hour ,48,64 );
	MOVF        _Hour+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       48
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       64
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,557 :: 		T6963C_Write_Text_Adv_ROM(":", 64, 64);
	MOVLW       ?lstr_53_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_53_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_53_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,558 :: 		GLCD_Print_Int_With_LeadingZero(Min ,72,64);
	MOVF        _Min+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       72
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       64
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,564 :: 		T6963C_Write_Text_Adv_ROM(":", 88, 64);;
	MOVLW       ?lstr_54_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_54_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_54_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       88
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,565 :: 		GLCD_Print_Int_With_LeadingZero(Sec ,96,64 );
	MOVF        _Sec+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       96
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       64
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,571 :: 		delay_ms(5000);
	MOVLW       2
	MOVWF       R10, 0
	MOVLW       150
	MOVWF       R11, 0
	MOVLW       216
	MOVWF       R12, 0
	MOVLW       8
	MOVWF       R13, 0
L_Beam_Loom_Shift110:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Loom_Shift110
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Loom_Shift110
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Loom_Shift110
	DECFSZ      R10, 1, 1
	BRA         L_Beam_Loom_Shift110
	NOP
;Control_Fn.c,573 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,574 :: 		T6963C_Write_Text_Adv_ROM("CALCULATING BEAM METER", 42, 45);
	MOVLW       ?lstr_55_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_55_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_55_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       42
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,575 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_Beam_Loom_Shift111:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Loom_Shift111
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Loom_Shift111
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Loom_Shift111
	NOP
;Control_Fn.c,576 :: 		Reset_loop=0;
	CLRF        Beam_Loom_Shift_Reset_loop_L0+0 
;Control_Fn.c,578 :: 		Loom_no=(Loom_no-(Loom_Starting_value-1));
	DECF        _Loom_Starting_value+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	SUBWF       Beam_Loom_Shift_Loom_no_L0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       Beam_Loom_Shift_Loom_no_L0+0 
;Control_Fn.c,580 :: 		Loom_noA = Loom_no;
	MOVF        R0, 0 
	MOVWF       Beam_Loom_Shift_Loom_noA_L0+0 
	MOVLW       0
	MOVWF       Beam_Loom_Shift_Loom_noA_L0+1 
;Control_Fn.c,581 :: 		j=(Loom_noA-1)*192;
	MOVLW       1
	SUBWF       Beam_Loom_Shift_Loom_noA_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      Beam_Loom_Shift_Loom_noA_L0+1, 0 
	MOVWF       R1 
	MOVLW       192
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
;Control_Fn.c,582 :: 		LoomStartAddr=j+InchA_addr;
	MOVLW       16
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
;Control_Fn.c,583 :: 		k = ((Shift_no-1)*2);
	DECF        Beam_Loom_Shift_Shift_no_L0+0, 0 
	MOVWF       R3 
	CLRF        R4 
	MOVLW       0
	SUBWFB      R4, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
;Control_Fn.c,584 :: 		Shift_beam_Inch =EEPROM_AT24C32_RdInt(LoomStartAddr+k);
	MOVF        R0, 0 
	ADDWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0, 1 
	MOVF        R1, 0 
	ADDWFC      FARG_EEPROM_AT24C32_RdInt_rAddr+1, 1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	MOVF        R0, 0 
	MOVWF       Beam_Loom_Shift_Shift_beam_Inch_L0+0 
	MOVF        R1, 0 
	MOVWF       Beam_Loom_Shift_Shift_beam_Inch_L0+1 
;Control_Fn.c,585 :: 		delay_ms(500);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_Beam_Loom_Shift112:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Loom_Shift112
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Loom_Shift112
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Loom_Shift112
;Control_Fn.c,586 :: 		Shift_Beam_meter=((float)(0.0254*Shift_beam_Inch));
	MOVF        Beam_Loom_Shift_Shift_beam_Inch_L0+0, 0 
	MOVWF       R0 
	MOVF        Beam_Loom_Shift_Shift_beam_Inch_L0+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       169
	MOVWF       R4 
	MOVLW       19
	MOVWF       R5 
	MOVLW       80
	MOVWF       R6 
	MOVLW       121
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Beam_Loom_Shift_Shift_Beam_meter_L0+0 
	MOVF        R1, 0 
	MOVWF       Beam_Loom_Shift_Shift_Beam_meter_L0+1 
	MOVF        R2, 0 
	MOVWF       Beam_Loom_Shift_Shift_Beam_meter_L0+2 
	MOVF        R3, 0 
	MOVWF       Beam_Loom_Shift_Shift_Beam_meter_L0+3 
;Control_Fn.c,588 :: 		delay_ms(100);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Beam_Loom_Shift113:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Loom_Shift113
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Loom_Shift113
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Loom_Shift113
	NOP
;Control_Fn.c,589 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,590 :: 		T6963C_Write_Text_Adv_ROM("L00M:", 8, 24);
	MOVLW       ?lstr_56_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_56_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_56_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,592 :: 		IntToStr( (Loom_no+(Loom_Starting_value-1) )  , Text);
	DECF        _Loom_Starting_value+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVF        Beam_Loom_Shift_Loom_no_L0+0, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _Text+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Control_Fn.c,593 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,594 :: 		T6963C_Write_Text_Adv(Text ,56,24);
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,600 :: 		T6963C_Write_Text_Adv_ROM("SHIFT:", 8, 48);
	MOVLW       ?lstr_57_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_57_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_57_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,601 :: 		GLCD_Print_Int_With_LeadingZero(Shift_no,60,48  );
	MOVF        Beam_Loom_Shift_Shift_no_L0+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       60
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       48
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,606 :: 		T6963C_Write_Text_Adv_ROM("INCH:", 90, 48);
	MOVLW       ?lstr_58_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_58_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_58_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       90
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,607 :: 		GLCD_Print_Int_With_LeadingZero ( Shift_beam_Inch,140,48 );
	MOVF        Beam_Loom_Shift_Shift_beam_Inch_L0+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       140
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       48
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,616 :: 		T6963C_Write_Text_Adv_ROM("M:", 8, 72);
	MOVLW       ?lstr_59_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_59_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_59_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,617 :: 		FloatToStr_SingleDecimal(Shift_Beam_meter,Text);
	MOVF        Beam_Loom_Shift_Shift_Beam_meter_L0+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+0 
	MOVF        Beam_Loom_Shift_Shift_Beam_meter_L0+1, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+1 
	MOVF        Beam_Loom_Shift_Shift_Beam_meter_L0+2, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+2 
	MOVF        Beam_Loom_Shift_Shift_Beam_meter_L0+3, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+3 
	MOVLW       _Text+0
	MOVWF       FARG_FloatToStr_SingleDecimal_str+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_FloatToStr_SingleDecimal_str+1 
	CALL        _FloatToStr_SingleDecimal+0, 0
;Control_Fn.c,618 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,619 :: 		T6963C_Write_Text_Adv(Text,34,72);// VALUE [METER]
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       34
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,620 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,629 :: 		while(Reset_loop==0)
L_Beam_Loom_Shift114:
	MOVF        Beam_Loom_Shift_Reset_loop_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Beam_Loom_Shift115
;Control_Fn.c,632 :: 		if(Stop==0)
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_Beam_Loom_Shift116
;Control_Fn.c,634 :: 		Reset_loop=1;
	MOVLW       1
	MOVWF       Beam_Loom_Shift_Reset_loop_L0+0 
;Control_Fn.c,635 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Beam_Loom_Shift117:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Loom_Shift117
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Loom_Shift117
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Loom_Shift117
	NOP
;Control_Fn.c,636 :: 		}
L_Beam_Loom_Shift116:
;Control_Fn.c,639 :: 		if(Reverse==0)
	BTFSC       RE7_bit+0, BitPos(RE7_bit+0) 
	GOTO        L_Beam_Loom_Shift118
;Control_Fn.c,641 :: 		ColourExit2=1;
	MOVLW       1
	MOVWF       Beam_Loom_Shift_ColourExit2_L0+0 
;Control_Fn.c,642 :: 		return;
	GOTO        L_end_Beam_Loom_Shift
;Control_Fn.c,643 :: 		}
L_Beam_Loom_Shift118:
;Control_Fn.c,644 :: 		}
	GOTO        L_Beam_Loom_Shift114
L_Beam_Loom_Shift115:
;Control_Fn.c,645 :: 		}
	GOTO        L_Beam_Loom_Shift100
L_Beam_Loom_Shift101:
;Control_Fn.c,647 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Beam_Loom_Shift119:
	DECFSZ      R13, 1, 1
	BRA         L_Beam_Loom_Shift119
	DECFSZ      R12, 1, 1
	BRA         L_Beam_Loom_Shift119
	DECFSZ      R11, 1, 1
	BRA         L_Beam_Loom_Shift119
	NOP
;Control_Fn.c,648 :: 		}
L_end_Beam_Loom_Shift:
	RETURN      0
; end of _Beam_Loom_Shift

_Total_Beam_per_loom:

;Control_Fn.c,651 :: 		void Total_Beam_per_loom(void)
;Control_Fn.c,653 :: 		unsigned int j=0,k=0,x=0;
	CLRF        Total_Beam_per_loom_k_L0+0 
	CLRF        Total_Beam_per_loom_k_L0+1 
	CLRF        Total_Beam_per_loom_x_L0+0 
	CLRF        Total_Beam_per_loom_x_L0+1 
;Control_Fn.c,656 :: 		j=Loom_value*192;
	MOVLW       192
	MULWF       _Loom_value+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
;Control_Fn.c,657 :: 		x=j+InchA_addr;
	MOVLW       16
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       Total_Beam_per_loom_x_L0+0 
	MOVF        R1, 0 
	MOVWF       Total_Beam_per_loom_x_L0+1 
;Control_Fn.c,658 :: 		Beam_production=0;
	CLRF        _Beam_production+0 
	CLRF        _Beam_production+1 
	CLRF        _Beam_production+2 
	CLRF        _Beam_production+3 
;Control_Fn.c,659 :: 		Disp_Beam=0;
	CLRF        _Disp_Beam+0 
	CLRF        _Disp_Beam+1 
	CLRF        _Disp_Beam+2 
	CLRF        _Disp_Beam+3 
;Control_Fn.c,660 :: 		for(k=x;k<(96+x);k++)
	MOVF        R0, 0 
	MOVWF       Total_Beam_per_loom_k_L0+0 
	MOVF        R1, 0 
	MOVWF       Total_Beam_per_loom_k_L0+1 
L_Total_Beam_per_loom120:
	MOVLW       96
	ADDWF       Total_Beam_per_loom_x_L0+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      Total_Beam_per_loom_x_L0+1, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       Total_Beam_per_loom_k_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Total_Beam_per_loom702
	MOVF        R1, 0 
	SUBWF       Total_Beam_per_loom_k_L0+0, 0 
L__Total_Beam_per_loom702:
	BTFSC       STATUS+0, 0 
	GOTO        L_Total_Beam_per_loom121
;Control_Fn.c,662 :: 		temp_data=EEPROM_AT24C32_RdInt(x+(2*(k-x)));
	MOVF        Total_Beam_per_loom_x_L0+0, 0 
	SUBWF       Total_Beam_per_loom_k_L0+0, 0 
	MOVWF       R3 
	MOVF        Total_Beam_per_loom_x_L0+1, 0 
	SUBWFB      Total_Beam_per_loom_k_L0+1, 0 
	MOVWF       R4 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       Total_Beam_per_loom_x_L0+0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVF        R1, 0 
	ADDWFC      Total_Beam_per_loom_x_L0+1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
;Control_Fn.c,663 :: 		Disp_Beam+=temp_data;
	MOVF        R0, 0 
	ADDWF       _Disp_Beam+0, 1 
	MOVF        R1, 0 
	ADDWFC      _Disp_Beam+1, 1 
	MOVLW       0
	ADDWFC      _Disp_Beam+2, 1 
	ADDWFC      _Disp_Beam+3, 1 
;Control_Fn.c,660 :: 		for(k=x;k<(96+x);k++)
	INFSNZ      Total_Beam_per_loom_k_L0+0, 1 
	INCF        Total_Beam_per_loom_k_L0+1, 1 
;Control_Fn.c,664 :: 		}
	GOTO        L_Total_Beam_per_loom120
L_Total_Beam_per_loom121:
;Control_Fn.c,665 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,666 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Total_Beam_per_loom123:
	DECFSZ      R13, 1, 1
	BRA         L_Total_Beam_per_loom123
	DECFSZ      R12, 1, 1
	BRA         L_Total_Beam_per_loom123
	DECFSZ      R11, 1, 1
	BRA         L_Total_Beam_per_loom123
;Control_Fn.c,667 :: 		Beam_production = ((float)(0.0254*Disp_Beam)+((float)((1/Disp_Picks4inch)*Disp_Pulse_Pick)));
	MOVF        _Disp_Beam+0, 0 
	MOVWF       R0 
	MOVF        _Disp_Beam+1, 0 
	MOVWF       R1 
	MOVF        _Disp_Beam+2, 0 
	MOVWF       R2 
	MOVF        _Disp_Beam+3, 0 
	MOVWF       R3 
	CALL        _longword2double+0, 0
	MOVLW       169
	MOVWF       R4 
	MOVLW       19
	MOVWF       R5 
	MOVLW       80
	MOVWF       R6 
	MOVLW       121
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__Total_Beam_per_loom+0 
	MOVF        R1, 0 
	MOVWF       FLOC__Total_Beam_per_loom+1 
	MOVF        R2, 0 
	MOVWF       FLOC__Total_Beam_per_loom+2 
	MOVF        R3, 0 
	MOVWF       FLOC__Total_Beam_per_loom+3 
	MOVF        _Disp_Picks4inch+0, 0 
	MOVWF       R4 
	MOVF        _Disp_Picks4inch+1, 0 
	MOVWF       R5 
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        _Disp_Pulse_Pick+0, 0 
	MOVWF       R4 
	MOVF        _Disp_Pulse_Pick+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	CALL        _word2double+0, 0
	MOVF        FLOC__Total_Beam_per_loom+0, 0 
	MOVWF       R4 
	MOVF        FLOC__Total_Beam_per_loom+1, 0 
	MOVWF       R5 
	MOVF        FLOC__Total_Beam_per_loom+2, 0 
	MOVWF       R6 
	MOVF        FLOC__Total_Beam_per_loom+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Beam_production+0 
	MOVF        R1, 0 
	MOVWF       _Beam_production+1 
	MOVF        R2, 0 
	MOVWF       _Beam_production+2 
	MOVF        R3, 0 
	MOVWF       _Beam_production+3 
;Control_Fn.c,669 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Total_Beam_per_loom124:
	DECFSZ      R13, 1, 1
	BRA         L_Total_Beam_per_loom124
	DECFSZ      R12, 1, 1
	BRA         L_Total_Beam_per_loom124
	DECFSZ      R11, 1, 1
	BRA         L_Total_Beam_per_loom124
;Control_Fn.c,670 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,671 :: 		T6963C_Write_Text_Adv_ROM("L", 42, 80);
	MOVLW       ?lstr_60_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_60_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_60_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       42
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,675 :: 		GLCD_Print_Int_With_LeadingZero ( (Loom_value+Loom_Starting_value) ,50,80 );
	MOVF        _Loom_Starting_value+0, 0 
	ADDWF       _Loom_value+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       50
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       80
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,680 :: 		T6963C_Write_Text_Adv_ROM(":M:",66,80);
	MOVLW       ?lstr_61_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_61_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_61_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       66
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,682 :: 		FloatToStr_SingleDecimal(Beam_production,Text);
	MOVF        _Beam_production+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+0 
	MOVF        _Beam_production+1, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+1 
	MOVF        _Beam_production+2, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+2 
	MOVF        _Beam_production+3, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+3 
	MOVLW       _Text+0
	MOVWF       FARG_FloatToStr_SingleDecimal_str+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_FloatToStr_SingleDecimal_str+1 
	CALL        _FloatToStr_SingleDecimal+0, 0
;Control_Fn.c,683 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,684 :: 		T6963C_Write_Text_Adv(Text,74,80);// VALUE [METER]
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       74
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,685 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,694 :: 		T6963C_Write_Text_Adv_ROM("I:",122,80);
	MOVLW       ?lstr_62_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_62_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_62_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       122
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,695 :: 		GLCD_Print_Int_With_LeadingZero(Disp_Beam,130,80  );
	MOVF        _Disp_Beam+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       130
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       80
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,704 :: 		delay_ms(12000);
	MOVLW       4
	MOVWF       R10, 0
	MOVLW       207
	MOVWF       R11, 0
	MOVLW       5
	MOVWF       R12, 0
	MOVLW       24
	MOVWF       R13, 0
L_Total_Beam_per_loom125:
	DECFSZ      R13, 1, 1
	BRA         L_Total_Beam_per_loom125
	DECFSZ      R12, 1, 1
	BRA         L_Total_Beam_per_loom125
	DECFSZ      R11, 1, 1
	BRA         L_Total_Beam_per_loom125
	DECFSZ      R10, 1, 1
	BRA         L_Total_Beam_per_loom125
	NOP
;Control_Fn.c,705 :: 		}
L_end_Total_Beam_per_loom:
	RETURN      0
; end of _Total_Beam_per_loom

_Total_Beam_Per_Shift:

;Control_Fn.c,707 :: 		void Total_Beam_Per_Shift(void)
;Control_Fn.c,712 :: 		Current_Total_Beam_Per_Shift=(inchA+inchB+inchC+inchD+inchE+inchF+inchG+inchH+inchI+inchJ+inchK+inchL+inchM+inchN+inchO+inchP);
	MOVF        _inchA+0, 0 
	MOVWF       R0 
	MOVF        _inchA+1, 0 
	MOVWF       R1 
	MOVF        _inchA+2, 0 
	MOVWF       R2 
	MOVF        _inchA+3, 0 
	MOVWF       R3 
	MOVF        _inchB+0, 0 
	MOVWF       R4 
	MOVF        _inchB+1, 0 
	MOVWF       R5 
	MOVF        _inchB+2, 0 
	MOVWF       R6 
	MOVF        _inchB+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _inchC+0, 0 
	MOVWF       R4 
	MOVF        _inchC+1, 0 
	MOVWF       R5 
	MOVF        _inchC+2, 0 
	MOVWF       R6 
	MOVF        _inchC+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _inchD+0, 0 
	MOVWF       R4 
	MOVF        _inchD+1, 0 
	MOVWF       R5 
	MOVF        _inchD+2, 0 
	MOVWF       R6 
	MOVF        _inchD+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _inchE+0, 0 
	MOVWF       R4 
	MOVF        _inchE+1, 0 
	MOVWF       R5 
	MOVF        _inchE+2, 0 
	MOVWF       R6 
	MOVF        _inchE+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _inchF+0, 0 
	MOVWF       R4 
	MOVF        _inchF+1, 0 
	MOVWF       R5 
	MOVF        _inchF+2, 0 
	MOVWF       R6 
	MOVF        _inchF+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _inchG+0, 0 
	MOVWF       R4 
	MOVF        _inchG+1, 0 
	MOVWF       R5 
	MOVF        _inchG+2, 0 
	MOVWF       R6 
	MOVF        _inchG+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _inchH+0, 0 
	MOVWF       R4 
	MOVF        _inchH+1, 0 
	MOVWF       R5 
	MOVF        _inchH+2, 0 
	MOVWF       R6 
	MOVF        _inchH+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _inchI+0, 0 
	MOVWF       R4 
	MOVF        _inchI+1, 0 
	MOVWF       R5 
	MOVF        _inchI+2, 0 
	MOVWF       R6 
	MOVF        _inchI+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _inchJ+0, 0 
	MOVWF       R4 
	MOVF        _inchJ+1, 0 
	MOVWF       R5 
	MOVF        _inchJ+2, 0 
	MOVWF       R6 
	MOVF        _inchJ+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _inchK+0, 0 
	MOVWF       R4 
	MOVF        _inchK+1, 0 
	MOVWF       R5 
	MOVF        _inchK+2, 0 
	MOVWF       R6 
	MOVF        _inchK+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _inchL+0, 0 
	MOVWF       R4 
	MOVF        _inchL+1, 0 
	MOVWF       R5 
	MOVF        _inchL+2, 0 
	MOVWF       R6 
	MOVF        _inchL+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _inchM+0, 0 
	MOVWF       R4 
	MOVF        _inchM+1, 0 
	MOVWF       R5 
	MOVF        _inchM+2, 0 
	MOVWF       R6 
	MOVF        _inchM+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _inchN+0, 0 
	MOVWF       R4 
	MOVF        _inchN+1, 0 
	MOVWF       R5 
	MOVF        _inchN+2, 0 
	MOVWF       R6 
	MOVF        _inchN+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _inchO+0, 0 
	MOVWF       R4 
	MOVF        _inchO+1, 0 
	MOVWF       R5 
	MOVF        _inchO+2, 0 
	MOVWF       R6 
	MOVF        _inchO+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        _inchP+0, 0 
	MOVWF       R4 
	MOVF        _inchP+1, 0 
	MOVWF       R5 
	MOVF        _inchP+2, 0 
	MOVWF       R6 
	MOVF        _inchP+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _double2longword+0, 0
	MOVF        R0, 0 
	MOVWF       Total_Beam_Per_Shift_Current_Total_Beam_Per_Shift_L0+0 
	MOVF        R1, 0 
	MOVWF       Total_Beam_Per_Shift_Current_Total_Beam_Per_Shift_L0+1 
	MOVF        R2, 0 
	MOVWF       Total_Beam_Per_Shift_Current_Total_Beam_Per_Shift_L0+2 
	MOVF        R3, 0 
	MOVWF       Total_Beam_Per_Shift_Current_Total_Beam_Per_Shift_L0+3 
;Control_Fn.c,714 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,716 :: 		T6963C_Write_Text_Adv_ROM("BEAM/SHIFT:",20,23);
	MOVLW       ?lstr_63_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_63_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_63_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       20
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       23
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,717 :: 		GLCD_Print_Int_With_LeadingZero( (Shift_value+1) ,28,23);
	MOVF        _Shift_value+0, 0 
	ADDLW       1
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       28
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       23
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,724 :: 		T6963C_Write_Text_Adv_ROM("I:",44,23);
	MOVLW       ?lstr_64_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_64_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_64_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       44
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       23
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,725 :: 		GLCD_Print_Int_With_LeadingZero( Current_Total_Beam_Per_Shift ,52,23);
	MOVF        Total_Beam_Per_Shift_Current_Total_Beam_Per_Shift_L0+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       52
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       23
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,734 :: 		Current_Shift_Meter=((float)(0.025*Current_Total_Beam_Per_Shift));
	MOVF        Total_Beam_Per_Shift_Current_Total_Beam_Per_Shift_L0+0, 0 
	MOVWF       R0 
	MOVF        Total_Beam_Per_Shift_Current_Total_Beam_Per_Shift_L0+1, 0 
	MOVWF       R1 
	MOVF        Total_Beam_Per_Shift_Current_Total_Beam_Per_Shift_L0+2, 0 
	MOVWF       R2 
	MOVF        Total_Beam_Per_Shift_Current_Total_Beam_Per_Shift_L0+3, 0 
	MOVWF       R3 
	CALL        _longword2double+0, 0
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       121
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Total_Beam_Per_Shift_Current_Shift_Meter_L0+0 
	MOVF        R1, 0 
	MOVWF       Total_Beam_Per_Shift_Current_Shift_Meter_L0+1 
	MOVF        R2, 0 
	MOVWF       Total_Beam_Per_Shift_Current_Shift_Meter_L0+2 
	MOVF        R3, 0 
	MOVWF       Total_Beam_Per_Shift_Current_Shift_Meter_L0+3 
;Control_Fn.c,737 :: 		T6963C_Write_Text_Adv_ROM(":M:",44,31);
	MOVLW       ?lstr_65_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_65_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_65_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       44
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       31
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,738 :: 		FloatToStr_SingleDecimal(Current_Shift_Meter,Text);
	MOVF        Total_Beam_Per_Shift_Current_Shift_Meter_L0+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+0 
	MOVF        Total_Beam_Per_Shift_Current_Shift_Meter_L0+1, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+1 
	MOVF        Total_Beam_Per_Shift_Current_Shift_Meter_L0+2, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+2 
	MOVF        Total_Beam_Per_Shift_Current_Shift_Meter_L0+3, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+3 
	MOVLW       _Text+0
	MOVWF       FARG_FloatToStr_SingleDecimal_str+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_FloatToStr_SingleDecimal_str+1 
	CALL        _FloatToStr_SingleDecimal+0, 0
;Control_Fn.c,739 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,740 :: 		T6963C_Write_Text_Adv(Text,52,31);// VALUE [METER]
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       52
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       31
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,741 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,751 :: 		delay_ms(6000);
	MOVLW       2
	MOVWF       R10, 0
	MOVLW       232
	MOVWF       R11, 0
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       10
	MOVWF       R13, 0
L_Total_Beam_Per_Shift126:
	DECFSZ      R13, 1, 1
	BRA         L_Total_Beam_Per_Shift126
	DECFSZ      R12, 1, 1
	BRA         L_Total_Beam_Per_Shift126
	DECFSZ      R11, 1, 1
	BRA         L_Total_Beam_Per_Shift126
	DECFSZ      R10, 1, 1
	BRA         L_Total_Beam_Per_Shift126
	NOP
;Control_Fn.c,752 :: 		}
L_end_Total_Beam_Per_Shift:
	RETURN      0
; end of _Total_Beam_Per_Shift

_Select_Loom_Total_Beam_per_loom:

;Control_Fn.c,754 :: 		void Select_Loom_Total_Beam_per_loom(void)
;Control_Fn.c,756 :: 		unsigned int j=0,k=0,x=0;
	CLRF        Select_Loom_Total_Beam_per_loom_k_L0+0 
	CLRF        Select_Loom_Total_Beam_per_loom_k_L0+1 
	CLRF        Select_Loom_Total_Beam_per_loom_x_L0+0 
	CLRF        Select_Loom_Total_Beam_per_loom_x_L0+1 
	MOVLW       1
	MOVWF       Select_Loom_Total_Beam_per_loom_Loom_no_L0+0 
	MOVLW       0
	MOVWF       Select_Loom_Total_Beam_per_loom_Loom_no_L0+1 
;Control_Fn.c,761 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,762 :: 		T6963C_Write_Text_Adv_ROM("LOOM:NO:",80,48);
	MOVLW       ?lstr_66_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_66_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_66_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,763 :: 		delay_ms(500);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_Select_Loom_Total_Beam_per_loom127:
	DECFSZ      R13, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom127
	DECFSZ      R12, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom127
	DECFSZ      R11, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom127
;Control_Fn.c,765 :: 		Loom_no=Loom_Starting_value;
	MOVF        _Loom_Starting_value+0, 0 
	MOVWF       Select_Loom_Total_Beam_per_loom_Loom_no_L0+0 
	MOVLW       0
	MOVWF       Select_Loom_Total_Beam_per_loom_Loom_no_L0+1 
;Control_Fn.c,766 :: 		Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),144,48);
	MOVLW       Select_Loom_Total_Beam_per_loom_Loom_no_L0+0
	MOVWF       FARG_Increment_Decerement_var+0 
	MOVLW       hi_addr(Select_Loom_Total_Beam_per_loom_Loom_no_L0+0)
	MOVWF       FARG_Increment_Decerement_var+1 
	DECF        _Loom_Starting_value+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       16
	MOVWF       FARG_Increment_Decerement_limit+0 
	MOVLW       144
	MOVWF       FARG_Increment_Decerement_Pos_x+0 
	MOVLW       48
	MOVWF       FARG_Increment_Decerement_Pos_y+0 
	CALL        _Increment_Decerement+0, 0
;Control_Fn.c,768 :: 		while(Loom_no<Loom_Starting_value)
L_Select_Loom_Total_Beam_per_loom128:
	MOVLW       0
	SUBWF       Select_Loom_Total_Beam_per_loom_Loom_no_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Select_Loom_Total_Beam_per_loom705
	MOVF        _Loom_Starting_value+0, 0 
	SUBWF       Select_Loom_Total_Beam_per_loom_Loom_no_L0+0, 0 
L__Select_Loom_Total_Beam_per_loom705:
	BTFSC       STATUS+0, 0 
	GOTO        L_Select_Loom_Total_Beam_per_loom129
;Control_Fn.c,770 :: 		Loom_no=Loom_Starting_value;
	MOVF        _Loom_Starting_value+0, 0 
	MOVWF       Select_Loom_Total_Beam_per_loom_Loom_no_L0+0 
	MOVLW       0
	MOVWF       Select_Loom_Total_Beam_per_loom_Loom_no_L0+1 
;Control_Fn.c,772 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,773 :: 		T6963C_Write_Text_Adv_ROM("INVALD VALUE",80,48);
	MOVLW       ?lstr_67_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_67_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_67_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,775 :: 		T6963C_Write_Text_Adv_ROM("FOR THIS BOX LOOM NO",64,64);
	MOVLW       ?lstr_68_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_68_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_68_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,776 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_Select_Loom_Total_Beam_per_loom130:
	DECFSZ      R13, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom130
	DECFSZ      R12, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom130
	DECFSZ      R11, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom130
	NOP
;Control_Fn.c,777 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,778 :: 		T6963C_Write_Text_Adv_ROM("LOOM:NO:",80,48);
	MOVLW       ?lstr_69_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_69_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_69_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,779 :: 		Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),144,48);
	MOVLW       Select_Loom_Total_Beam_per_loom_Loom_no_L0+0
	MOVWF       FARG_Increment_Decerement_var+0 
	MOVLW       hi_addr(Select_Loom_Total_Beam_per_loom_Loom_no_L0+0)
	MOVWF       FARG_Increment_Decerement_var+1 
	DECF        _Loom_Starting_value+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       16
	MOVWF       FARG_Increment_Decerement_limit+0 
	MOVLW       144
	MOVWF       FARG_Increment_Decerement_Pos_x+0 
	MOVLW       48
	MOVWF       FARG_Increment_Decerement_Pos_y+0 
	CALL        _Increment_Decerement+0, 0
;Control_Fn.c,780 :: 		}
	GOTO        L_Select_Loom_Total_Beam_per_loom128
L_Select_Loom_Total_Beam_per_loom129:
;Control_Fn.c,782 :: 		delay_ms(500);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_Select_Loom_Total_Beam_per_loom131:
	DECFSZ      R13, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom131
	DECFSZ      R12, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom131
	DECFSZ      R11, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom131
;Control_Fn.c,783 :: 		Loom_no=(Loom_no-(Loom_Starting_value-1));
	DECF        _Loom_Starting_value+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVF        R0, 0 
	SUBWF       Select_Loom_Total_Beam_per_loom_Loom_no_L0+0, 0 
	MOVWF       R0 
	MOVF        R1, 0 
	SUBWFB      Select_Loom_Total_Beam_per_loom_Loom_no_L0+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       Select_Loom_Total_Beam_per_loom_Loom_no_L0+0 
	MOVF        R1, 0 
	MOVWF       Select_Loom_Total_Beam_per_loom_Loom_no_L0+1 
;Control_Fn.c,785 :: 		Loom_no=(Loom_no-1);
	MOVLW       1
	SUBWF       R0, 1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVF        R0, 0 
	MOVWF       Select_Loom_Total_Beam_per_loom_Loom_no_L0+0 
	MOVF        R1, 0 
	MOVWF       Select_Loom_Total_Beam_per_loom_Loom_no_L0+1 
;Control_Fn.c,788 :: 		j=Loom_No*192;
	MOVLW       192
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
;Control_Fn.c,789 :: 		x=j+InchA_addr;
	MOVLW       16
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       Select_Loom_Total_Beam_per_loom_x_L0+0 
	MOVF        R1, 0 
	MOVWF       Select_Loom_Total_Beam_per_loom_x_L0+1 
;Control_Fn.c,790 :: 		Beam_production=0;
	CLRF        _Beam_production+0 
	CLRF        _Beam_production+1 
	CLRF        _Beam_production+2 
	CLRF        _Beam_production+3 
;Control_Fn.c,791 :: 		Disp_Beam=0;
	CLRF        _Disp_Beam+0 
	CLRF        _Disp_Beam+1 
	CLRF        _Disp_Beam+2 
	CLRF        _Disp_Beam+3 
;Control_Fn.c,792 :: 		for(k=x;k<(96+x);k++)
	MOVF        R0, 0 
	MOVWF       Select_Loom_Total_Beam_per_loom_k_L0+0 
	MOVF        R1, 0 
	MOVWF       Select_Loom_Total_Beam_per_loom_k_L0+1 
L_Select_Loom_Total_Beam_per_loom132:
	MOVLW       96
	ADDWF       Select_Loom_Total_Beam_per_loom_x_L0+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      Select_Loom_Total_Beam_per_loom_x_L0+1, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       Select_Loom_Total_Beam_per_loom_k_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Select_Loom_Total_Beam_per_loom706
	MOVF        R1, 0 
	SUBWF       Select_Loom_Total_Beam_per_loom_k_L0+0, 0 
L__Select_Loom_Total_Beam_per_loom706:
	BTFSC       STATUS+0, 0 
	GOTO        L_Select_Loom_Total_Beam_per_loom133
;Control_Fn.c,794 :: 		temp_data=EEPROM_AT24C32_RdInt(x+(2*(k-x)));
	MOVF        Select_Loom_Total_Beam_per_loom_x_L0+0, 0 
	SUBWF       Select_Loom_Total_Beam_per_loom_k_L0+0, 0 
	MOVWF       R3 
	MOVF        Select_Loom_Total_Beam_per_loom_x_L0+1, 0 
	SUBWFB      Select_Loom_Total_Beam_per_loom_k_L0+1, 0 
	MOVWF       R4 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       Select_Loom_Total_Beam_per_loom_x_L0+0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVF        R1, 0 
	ADDWFC      Select_Loom_Total_Beam_per_loom_x_L0+1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
;Control_Fn.c,795 :: 		Disp_Beam+=temp_data;
	MOVF        R0, 0 
	ADDWF       _Disp_Beam+0, 1 
	MOVF        R1, 0 
	ADDWFC      _Disp_Beam+1, 1 
	MOVLW       0
	ADDWFC      _Disp_Beam+2, 1 
	ADDWFC      _Disp_Beam+3, 1 
;Control_Fn.c,792 :: 		for(k=x;k<(96+x);k++)
	INFSNZ      Select_Loom_Total_Beam_per_loom_k_L0+0, 1 
	INCF        Select_Loom_Total_Beam_per_loom_k_L0+1, 1 
;Control_Fn.c,796 :: 		}
	GOTO        L_Select_Loom_Total_Beam_per_loom132
L_Select_Loom_Total_Beam_per_loom133:
;Control_Fn.c,797 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,798 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Select_Loom_Total_Beam_per_loom135:
	DECFSZ      R13, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom135
	DECFSZ      R12, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom135
	DECFSZ      R11, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom135
;Control_Fn.c,799 :: 		Beam_production = ((float)(0.025*Disp_Beam)+((float)((1/Disp_Picks4inch)*Disp_Pulse_Pick)));
	MOVF        _Disp_Beam+0, 0 
	MOVWF       R0 
	MOVF        _Disp_Beam+1, 0 
	MOVWF       R1 
	MOVF        _Disp_Beam+2, 0 
	MOVWF       R2 
	MOVF        _Disp_Beam+3, 0 
	MOVWF       R3 
	CALL        _longword2double+0, 0
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       121
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__Select_Loom_Total_Beam_per_loom+0 
	MOVF        R1, 0 
	MOVWF       FLOC__Select_Loom_Total_Beam_per_loom+1 
	MOVF        R2, 0 
	MOVWF       FLOC__Select_Loom_Total_Beam_per_loom+2 
	MOVF        R3, 0 
	MOVWF       FLOC__Select_Loom_Total_Beam_per_loom+3 
	MOVF        _Disp_Picks4inch+0, 0 
	MOVWF       R4 
	MOVF        _Disp_Picks4inch+1, 0 
	MOVWF       R5 
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        _Disp_Pulse_Pick+0, 0 
	MOVWF       R4 
	MOVF        _Disp_Pulse_Pick+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	CALL        _word2double+0, 0
	MOVF        FLOC__Select_Loom_Total_Beam_per_loom+0, 0 
	MOVWF       R4 
	MOVF        FLOC__Select_Loom_Total_Beam_per_loom+1, 0 
	MOVWF       R5 
	MOVF        FLOC__Select_Loom_Total_Beam_per_loom+2, 0 
	MOVWF       R6 
	MOVF        FLOC__Select_Loom_Total_Beam_per_loom+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Beam_production+0 
	MOVF        R1, 0 
	MOVWF       _Beam_production+1 
	MOVF        R2, 0 
	MOVWF       _Beam_production+2 
	MOVF        R3, 0 
	MOVWF       _Beam_production+3 
;Control_Fn.c,801 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Select_Loom_Total_Beam_per_loom136:
	DECFSZ      R13, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom136
	DECFSZ      R12, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom136
	DECFSZ      R11, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom136
;Control_Fn.c,802 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,805 :: 		T6963C_Write_Text_Adv_ROM("LOOM NO:",4,16);
	MOVLW       ?lstr_70_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_70_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_70_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       4
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       16
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,806 :: 		GLCD_Print_Int_With_LeadingZero( (Loom_No+Loom_Starting_value) ,64,16);
	MOVF        _Loom_Starting_value+0, 0 
	ADDWF       Select_Loom_Total_Beam_per_loom_Loom_no_L0+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       64
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       16
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,808 :: 		T6963C_Write_Text_Adv_ROM("M:",96,16);
	MOVLW       ?lstr_71_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_71_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_71_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       96
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       16
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,809 :: 		FloatToStr_SingleDecimal(Beam_production,Text);
	MOVF        _Beam_production+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+0 
	MOVF        _Beam_production+1, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+1 
	MOVF        _Beam_production+2, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+2 
	MOVF        _Beam_production+3, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+3 
	MOVLW       _Text+0
	MOVWF       FARG_FloatToStr_SingleDecimal_str+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_FloatToStr_SingleDecimal_str+1 
	CALL        _FloatToStr_SingleDecimal+0, 0
;Control_Fn.c,810 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,811 :: 		T6963C_Write_Text_Adv(Text,112,16);// VALUE [METER]
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       112
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       16
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,812 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,821 :: 		T6963C_Write_Text_Adv_ROM("I:",4,32);
	MOVLW       ?lstr_72_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_72_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_72_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       4
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       32
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,822 :: 		GLCD_Print_Int_With_LeadingZero(Disp_Beam ,16,32);
	MOVF        _Disp_Beam+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       16
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       32
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,831 :: 		delay_ms(12000);
	MOVLW       4
	MOVWF       R10, 0
	MOVLW       207
	MOVWF       R11, 0
	MOVLW       5
	MOVWF       R12, 0
	MOVLW       24
	MOVWF       R13, 0
L_Select_Loom_Total_Beam_per_loom137:
	DECFSZ      R13, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom137
	DECFSZ      R12, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom137
	DECFSZ      R11, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom137
	DECFSZ      R10, 1, 1
	BRA         L_Select_Loom_Total_Beam_per_loom137
	NOP
;Control_Fn.c,833 :: 		}
L_end_Select_Loom_Total_Beam_per_loom:
	RETURN      0
; end of _Select_Loom_Total_Beam_per_loom

_UserColourSetting:

;Control_Fn.c,835 :: 		void UserColourSetting()
;Control_Fn.c,837 :: 		unsigned char Reset_loop=0,ColourExit2=0,item=0,i=0,SplFlag=0;
	CLRF        UserColourSetting_Reset_loop_L0+0 
	CLRF        UserColourSetting_ColourExit2_L0+0 
	CLRF        UserColourSetting_SplFlag_L0+0 
;Control_Fn.c,842 :: 		while(ColourExit==0)
L_UserColourSetting138:
	MOVF        _ColourExit+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting139
;Control_Fn.c,844 :: 		while(ColourExit2==0)
L_UserColourSetting140:
	MOVF        UserColourSetting_ColourExit2_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting141
;Control_Fn.c,846 :: 		if((SplFlag==0) &&(Reset_loop==0))
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting144
	MOVF        UserColourSetting_Reset_loop_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting144
L__UserColourSetting672:
;Control_Fn.c,848 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,849 :: 		T6963C_Write_char_adv(45,0,8 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,850 :: 		T6963C_Write_char_adv(45,2,8 );
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
;Control_Fn.c,851 :: 		T6963C_Write_char_adv(62,3,8 );
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
;Control_Fn.c,852 :: 		T6963C_Write_Text_Adv_ROM("SET PICK:ALL",11,8);
	MOVLW       ?lstr_73_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_73_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_73_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,853 :: 		T6963C_Write_Text_Adv_ROM("SET PICK:1/1",11,24);
	MOVLW       ?lstr_74_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_74_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_74_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,854 :: 		T6963C_Write_Text_Adv_ROM("LOOM STARTING NO",11,40);
	MOVLW       ?lstr_75_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_75_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_75_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,855 :: 		T6963C_Write_Text_Adv_ROM("METER/PICKS METHOD  ", 11, 56);
	MOVLW       ?lstr_76_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_76_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_76_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,856 :: 		T6963C_Write_Text_Adv_ROM("INCH/PAY            ", 11, 72);
	MOVLW       ?lstr_77_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_77_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_77_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,857 :: 		T6963C_set_cursor(14,1);
	MOVLW       14
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       1
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,858 :: 		Reset_loop=1;
	MOVLW       1
	MOVWF       UserColourSetting_Reset_loop_L0+0 
;Control_Fn.c,859 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_UserColourSetting145:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting145
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting145
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting145
	NOP
	NOP
;Control_Fn.c,860 :: 		}
L_UserColourSetting144:
;Control_Fn.c,862 :: 		if((SplFlag==1) &&(Reset_loop==0))
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting148
	MOVF        UserColourSetting_Reset_loop_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting148
L__UserColourSetting671:
;Control_Fn.c,864 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,865 :: 		T6963C_Write_char_adv(45,0,24 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,866 :: 		T6963C_Write_char_adv(45,2,24 );
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
;Control_Fn.c,867 :: 		T6963C_Write_char_adv(62,3,24 );
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
;Control_Fn.c,868 :: 		T6963C_Write_Text_Adv_ROM("SET PICK:ALL",11,8);
	MOVLW       ?lstr_78_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_78_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_78_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,869 :: 		T6963C_Write_Text_Adv_ROM("SET PICK:1/1",11,24);
	MOVLW       ?lstr_79_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_79_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_79_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,870 :: 		T6963C_Write_Text_Adv_ROM("LOOM STARTING NO",11,40);
	MOVLW       ?lstr_80_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_80_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_80_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,871 :: 		T6963C_Write_Text_Adv_ROM("METER/PICKS METHOD  ", 11, 56);
	MOVLW       ?lstr_81_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_81_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_81_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,872 :: 		T6963C_Write_Text_Adv_ROM("INCH/PAY            ", 11, 72);
	MOVLW       ?lstr_82_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_82_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_82_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,874 :: 		T6963C_set_cursor(14,3);
	MOVLW       14
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       3
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,875 :: 		Reset_loop=1;
	MOVLW       1
	MOVWF       UserColourSetting_Reset_loop_L0+0 
;Control_Fn.c,876 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_UserColourSetting149:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting149
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting149
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting149
	NOP
	NOP
;Control_Fn.c,877 :: 		}
L_UserColourSetting148:
;Control_Fn.c,878 :: 		if((SplFlag==2) &&(Reset_loop==0))
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting152
	MOVF        UserColourSetting_Reset_loop_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting152
L__UserColourSetting670:
;Control_Fn.c,880 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,881 :: 		T6963C_Write_char_adv(45,0,40 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,882 :: 		T6963C_Write_char_adv(45,2,40 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       2
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,883 :: 		T6963C_Write_char_adv(62,3,40 );
	MOVLW       62
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,884 :: 		T6963C_Write_Text_Adv_ROM("SET PICK:ALL",11,8);
	MOVLW       ?lstr_83_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_83_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_83_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,885 :: 		T6963C_Write_Text_Adv_ROM("SET PICK:1/1",11,24);
	MOVLW       ?lstr_84_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_84_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_84_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,886 :: 		T6963C_Write_Text_Adv_ROM("LOOM STARTING NO",11,40);
	MOVLW       ?lstr_85_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_85_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_85_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,887 :: 		T6963C_Write_Text_Adv_ROM("METER/PICKS METHOD  ", 11, 56);
	MOVLW       ?lstr_86_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_86_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_86_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,888 :: 		T6963C_Write_Text_Adv_ROM("INCH/PAY            ", 11, 72);
	MOVLW       ?lstr_87_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_87_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_87_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,890 :: 		T6963C_set_cursor(19,5);
	MOVLW       19
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       5
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,891 :: 		Reset_loop=1;
	MOVLW       1
	MOVWF       UserColourSetting_Reset_loop_L0+0 
;Control_Fn.c,892 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_UserColourSetting153:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting153
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting153
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting153
	NOP
	NOP
;Control_Fn.c,893 :: 		}
L_UserColourSetting152:
;Control_Fn.c,895 :: 		if((SplFlag==3) &&(Reset_loop==0))
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting156
	MOVF        UserColourSetting_Reset_loop_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting156
L__UserColourSetting669:
;Control_Fn.c,897 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,898 :: 		T6963C_Write_char_adv(45,0,56 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,899 :: 		T6963C_Write_char_adv(45,2,56 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       2
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,900 :: 		T6963C_Write_char_adv(62,3,56 );
	MOVLW       62
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,901 :: 		T6963C_Write_Text_Adv_ROM("SET PICK:ALL",11,8);
	MOVLW       ?lstr_88_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_88_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_88_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,902 :: 		T6963C_Write_Text_Adv_ROM("SET PICK:1/1",11,24);
	MOVLW       ?lstr_89_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_89_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_89_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,903 :: 		T6963C_Write_Text_Adv_ROM("LOOM STARTING NO",11,40);
	MOVLW       ?lstr_90_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_90_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_90_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,904 :: 		T6963C_Write_Text_Adv_ROM("METER/PICKS METHOD", 11, 56);
	MOVLW       ?lstr_91_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_91_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_91_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,905 :: 		T6963C_Write_Text_Adv_ROM("INCH/PAY", 11, 72);
	MOVLW       ?lstr_92_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_92_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_92_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,907 :: 		T6963C_set_cursor(20,7);
	MOVLW       20
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       7
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,908 :: 		Reset_loop=1;
	MOVLW       1
	MOVWF       UserColourSetting_Reset_loop_L0+0 
;Control_Fn.c,909 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_UserColourSetting157:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting157
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting157
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting157
	NOP
	NOP
;Control_Fn.c,910 :: 		}
L_UserColourSetting156:
;Control_Fn.c,912 :: 		if((SplFlag==4) &&(Reset_loop==0))
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting160
	MOVF        UserColourSetting_Reset_loop_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting160
L__UserColourSetting668:
;Control_Fn.c,914 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,915 :: 		T6963C_Write_char_adv(45,0,72 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,916 :: 		T6963C_Write_char_adv(45,2,72 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       2
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,917 :: 		T6963C_Write_char_adv(62,3,72 );
	MOVLW       62
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,918 :: 		T6963C_Write_Text_Adv_ROM("SET PICK:ALL",11,8);
	MOVLW       ?lstr_93_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_93_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_93_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,919 :: 		T6963C_Write_Text_Adv_ROM("SET PICK:1/1",11,24);
	MOVLW       ?lstr_94_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_94_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_94_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,920 :: 		T6963C_Write_Text_Adv_ROM("LOOM STARTING NO",11,40);
	MOVLW       ?lstr_95_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_95_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_95_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,921 :: 		T6963C_Write_Text_Adv_ROM("METER/PICKS METHOD", 11, 56);
	MOVLW       ?lstr_96_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_96_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_96_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,922 :: 		T6963C_Write_Text_Adv_ROM("INCH/PAY", 11, 72);
	MOVLW       ?lstr_97_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_97_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_97_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,924 :: 		T6963C_set_cursor(10,9);
	MOVLW       10
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       9
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,925 :: 		Reset_loop=1;
	MOVLW       1
	MOVWF       UserColourSetting_Reset_loop_L0+0 
;Control_Fn.c,926 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_UserColourSetting161:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting161
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting161
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting161
	NOP
	NOP
;Control_Fn.c,927 :: 		}
L_UserColourSetting160:
;Control_Fn.c,930 :: 		if(Start==0)
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_UserColourSetting162
;Control_Fn.c,932 :: 		if(SplFlag==0)   //OPTION 1
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting163
;Control_Fn.c,933 :: 		{SplFlag=1;Reset_loop=0;delay_ms(250); }
	MOVLW       1
	MOVWF       UserColourSetting_SplFlag_L0+0 
	CLRF        UserColourSetting_Reset_loop_L0+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_UserColourSetting164:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting164
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting164
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting164
	NOP
	GOTO        L_UserColourSetting165
L_UserColourSetting163:
;Control_Fn.c,934 :: 		else if(SplFlag==1)    //OPTION 2
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting166
;Control_Fn.c,935 :: 		{SplFlag=2;Reset_loop=0;delay_ms(250); }
	MOVLW       2
	MOVWF       UserColourSetting_SplFlag_L0+0 
	CLRF        UserColourSetting_Reset_loop_L0+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_UserColourSetting167:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting167
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting167
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting167
	NOP
	GOTO        L_UserColourSetting168
L_UserColourSetting166:
;Control_Fn.c,936 :: 		else if(SplFlag==2)    //OPTION 3
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting169
;Control_Fn.c,937 :: 		{SplFlag=3;Reset_loop=0;delay_ms(250); }
	MOVLW       3
	MOVWF       UserColourSetting_SplFlag_L0+0 
	CLRF        UserColourSetting_Reset_loop_L0+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_UserColourSetting170:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting170
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting170
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting170
	NOP
	GOTO        L_UserColourSetting171
L_UserColourSetting169:
;Control_Fn.c,938 :: 		else if(SplFlag==3)    //OPTION 4
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting172
;Control_Fn.c,939 :: 		{SplFlag=4;Reset_loop=0;delay_ms(250); }
	MOVLW       4
	MOVWF       UserColourSetting_SplFlag_L0+0 
	CLRF        UserColourSetting_Reset_loop_L0+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_UserColourSetting173:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting173
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting173
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting173
	NOP
	GOTO        L_UserColourSetting174
L_UserColourSetting172:
;Control_Fn.c,940 :: 		else if(SplFlag==4)    //OPTION 5
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting175
;Control_Fn.c,941 :: 		{SplFlag=0;Reset_loop=0;delay_ms(250); }
	CLRF        UserColourSetting_SplFlag_L0+0 
	CLRF        UserColourSetting_Reset_loop_L0+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_UserColourSetting176:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting176
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting176
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting176
	NOP
L_UserColourSetting175:
L_UserColourSetting174:
L_UserColourSetting171:
L_UserColourSetting168:
L_UserColourSetting165:
;Control_Fn.c,943 :: 		}
L_UserColourSetting162:
;Control_Fn.c,945 :: 		if(Stop==0)
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_UserColourSetting177
;Control_Fn.c,947 :: 		if(SplFlag==0)      //OPTION 5
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting178
;Control_Fn.c,948 :: 		{SplFlag=4;Reset_loop=0;delay_ms(250); }
	MOVLW       4
	MOVWF       UserColourSetting_SplFlag_L0+0 
	CLRF        UserColourSetting_Reset_loop_L0+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_UserColourSetting179:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting179
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting179
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting179
	NOP
	GOTO        L_UserColourSetting180
L_UserColourSetting178:
;Control_Fn.c,949 :: 		else if(SplFlag==1) //OPTION 1
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting181
;Control_Fn.c,950 :: 		{SplFlag=0;Reset_loop=0;delay_ms(250); }
	CLRF        UserColourSetting_SplFlag_L0+0 
	CLRF        UserColourSetting_Reset_loop_L0+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_UserColourSetting182:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting182
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting182
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting182
	NOP
	GOTO        L_UserColourSetting183
L_UserColourSetting181:
;Control_Fn.c,951 :: 		else if(SplFlag==2) //OPTION 2
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting184
;Control_Fn.c,952 :: 		{SplFlag=1;Reset_loop=0;delay_ms(250); }
	MOVLW       1
	MOVWF       UserColourSetting_SplFlag_L0+0 
	CLRF        UserColourSetting_Reset_loop_L0+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_UserColourSetting185:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting185
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting185
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting185
	NOP
	GOTO        L_UserColourSetting186
L_UserColourSetting184:
;Control_Fn.c,953 :: 		else if(SplFlag==3)    //OPTION 3
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting187
;Control_Fn.c,954 :: 		{SplFlag=2;Reset_loop=0;delay_ms(250); }
	MOVLW       2
	MOVWF       UserColourSetting_SplFlag_L0+0 
	CLRF        UserColourSetting_Reset_loop_L0+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_UserColourSetting188:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting188
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting188
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting188
	NOP
	GOTO        L_UserColourSetting189
L_UserColourSetting187:
;Control_Fn.c,955 :: 		else if(SplFlag==4)    //OPTION 4
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting190
;Control_Fn.c,956 :: 		{SplFlag=3;Reset_loop=0;delay_ms(250); }
	MOVLW       3
	MOVWF       UserColourSetting_SplFlag_L0+0 
	CLRF        UserColourSetting_Reset_loop_L0+0 
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_UserColourSetting191:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting191
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting191
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting191
	NOP
L_UserColourSetting190:
L_UserColourSetting189:
L_UserColourSetting186:
L_UserColourSetting183:
L_UserColourSetting180:
;Control_Fn.c,958 :: 		}
L_UserColourSetting177:
;Control_Fn.c,959 :: 		if(Set==0)
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_UserColourSetting192
;Control_Fn.c,962 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,963 :: 		if(SplFlag==0)
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting193
;Control_Fn.c,965 :: 		Pick_Set_All();
	CALL        _Pick_Set_All+0, 0
;Control_Fn.c,966 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_UserColourSetting194:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting194
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting194
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting194
;Control_Fn.c,967 :: 		return;
	GOTO        L_end_UserColourSetting
;Control_Fn.c,968 :: 		}
L_UserColourSetting193:
;Control_Fn.c,970 :: 		if(SplFlag==1)
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting195
;Control_Fn.c,972 :: 		Pick_Set_One_one();
	CALL        _Pick_Set_One_one+0, 0
;Control_Fn.c,973 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_UserColourSetting196:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting196
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting196
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting196
;Control_Fn.c,974 :: 		return;
	GOTO        L_end_UserColourSetting
;Control_Fn.c,975 :: 		}
L_UserColourSetting195:
;Control_Fn.c,977 :: 		if(SplFlag==2)
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting197
;Control_Fn.c,979 :: 		Loom_Starting_No();
	CALL        _Loom_Starting_No+0, 0
;Control_Fn.c,980 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_UserColourSetting198:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting198
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting198
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting198
;Control_Fn.c,981 :: 		return;
	GOTO        L_end_UserColourSetting
;Control_Fn.c,982 :: 		}
L_UserColourSetting197:
;Control_Fn.c,983 :: 		if(SplFlag==3)
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting199
;Control_Fn.c,985 :: 		Meter_Or_Picks_Method();
	CALL        _Meter_Or_Picks_Method+0, 0
;Control_Fn.c,986 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,989 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_UserColourSetting200:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting200
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting200
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting200
;Control_Fn.c,990 :: 		return;
	GOTO        L_end_UserColourSetting
;Control_Fn.c,991 :: 		}
L_UserColourSetting199:
;Control_Fn.c,992 :: 		if(SplFlag==4)
	MOVF        UserColourSetting_SplFlag_L0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_UserColourSetting201
;Control_Fn.c,994 :: 		Inch_Or_Pay_Method();
	CALL        _Inch_Or_Pay_Method+0, 0
;Control_Fn.c,995 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,998 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_UserColourSetting202:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting202
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting202
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting202
;Control_Fn.c,999 :: 		return;
	GOTO        L_end_UserColourSetting
;Control_Fn.c,1000 :: 		}
L_UserColourSetting201:
;Control_Fn.c,1001 :: 		}
L_UserColourSetting192:
;Control_Fn.c,1003 :: 		if(Reverse==0)
	BTFSC       RE7_bit+0, BitPos(RE7_bit+0) 
	GOTO        L_UserColourSetting203
;Control_Fn.c,1005 :: 		ColourExit=0;
	CLRF        _ColourExit+0 
;Control_Fn.c,1006 :: 		ColourExit2=1;
	MOVLW       1
	MOVWF       UserColourSetting_ColourExit2_L0+0 
;Control_Fn.c,1007 :: 		exit1=1;
	MOVLW       1
	MOVWF       _exit1+0 
;Control_Fn.c,1008 :: 		GIE_bit       = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;Control_Fn.c,1009 :: 		PEIE_bit      = 1;
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;Control_Fn.c,1010 :: 		delay_ms(250);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_UserColourSetting204:
	DECFSZ      R13, 1, 1
	BRA         L_UserColourSetting204
	DECFSZ      R12, 1, 1
	BRA         L_UserColourSetting204
	DECFSZ      R11, 1, 1
	BRA         L_UserColourSetting204
	NOP
;Control_Fn.c,1011 :: 		return;
	GOTO        L_end_UserColourSetting
;Control_Fn.c,1012 :: 		}
L_UserColourSetting203:
;Control_Fn.c,1014 :: 		}
	GOTO        L_UserColourSetting140
L_UserColourSetting141:
;Control_Fn.c,1016 :: 		}
	GOTO        L_UserColourSetting138
L_UserColourSetting139:
;Control_Fn.c,1020 :: 		}
L_end_UserColourSetting:
	RETURN      0
; end of _UserColourSetting

_Loom_Starting_No:

;Control_Fn.c,1022 :: 		void Loom_Starting_No(void)
;Control_Fn.c,1024 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1025 :: 		T6963C_Write_Text_Adv_ROM("LOOM STARTING NO",56,56);
	MOVLW       ?lstr_98_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_98_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_98_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1026 :: 		Loom_Starting_value=EEPROM_Read(Loom_Starting_NO_addr);
	MOVLW       64
	MOVWF       FARG_Eeprom_Read_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Read_address+1 
	CALL        _Eeprom_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _Loom_Starting_value+0 
;Control_Fn.c,1027 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Loom_Starting_No205:
	DECFSZ      R13, 1, 1
	BRA         L_Loom_Starting_No205
	DECFSZ      R12, 1, 1
	BRA         L_Loom_Starting_No205
	NOP
;Control_Fn.c,1030 :: 		GLCD_Print_Int_With_LeadingZero( Loom_Starting_value,112,72);
	MOVF        _Loom_Starting_value+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       112
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       72
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1035 :: 		delay_ms(250);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Loom_Starting_No206:
	DECFSZ      R13, 1, 1
	BRA         L_Loom_Starting_No206
	DECFSZ      R12, 1, 1
	BRA         L_Loom_Starting_No206
	DECFSZ      R11, 1, 1
	BRA         L_Loom_Starting_No206
	NOP
;Control_Fn.c,1037 :: 		Increment_Decerement_Char(&Loom_Starting_value,81,112,72);
	MOVLW       _Loom_Starting_value+0
	MOVWF       FARG_Increment_Decerement_Char_var+0 
	MOVLW       hi_addr(_Loom_Starting_value+0)
	MOVWF       FARG_Increment_Decerement_Char_var+1 
	MOVLW       81
	MOVWF       FARG_Increment_Decerement_Char_limit+0 
	MOVLW       112
	MOVWF       FARG_Increment_Decerement_Char_Pos_x+0 
	MOVLW       72
	MOVWF       FARG_Increment_Decerement_Char_Pos_y+0 
	CALL        _Increment_Decerement_Char+0, 0
;Control_Fn.c,1039 :: 		EEPROM_Write((Loom_Starting_NO_addr),Loom_Starting_value);
	MOVLW       64
	MOVWF       FARG_Eeprom_Write_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Write_address+1 
	MOVF        _Loom_Starting_value+0, 0 
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;Control_Fn.c,1040 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Loom_Starting_No207:
	DECFSZ      R13, 1, 1
	BRA         L_Loom_Starting_No207
	DECFSZ      R12, 1, 1
	BRA         L_Loom_Starting_No207
	NOP
;Control_Fn.c,1041 :: 		}
L_end_Loom_Starting_No:
	RETURN      0
; end of _Loom_Starting_No

_Pick_Set_All:

;Control_Fn.c,1044 :: 		void Pick_Set_All(void)
;Control_Fn.c,1046 :: 		unsigned char i=0;
	CLRF        Pick_Set_All_i_L0+0 
;Control_Fn.c,1048 :: 		T6963C_Write_Text_Adv_ROM(" SET PICK / INCH ",50,48);
	MOVLW       ?lstr_99_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_99_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_99_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       50
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1050 :: 		GLCD_Print_Int_With_LeadingZero( Picks4inchA,102,72);
	MOVF        _Picks4inchA+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       102
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       72
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1055 :: 		T6963C_Cursor(0);              // Cursor off
	BCF         _T6963C_display+0, 1 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Control_Fn.c,1056 :: 		T6963C_Cursor(1);
	BSF         _T6963C_display+0, 1 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Control_Fn.c,1057 :: 		T6963C_Cursor_Blink(1);
	BSF         _T6963C_display+0, 0 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Control_Fn.c,1059 :: 		delay_ms(250);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Pick_Set_All208:
	DECFSZ      R13, 1, 1
	BRA         L_Pick_Set_All208
	DECFSZ      R12, 1, 1
	BRA         L_Pick_Set_All208
	DECFSZ      R11, 1, 1
	BRA         L_Pick_Set_All208
	NOP
;Control_Fn.c,1060 :: 		Increment_Decerement_Char(&Picks4inchA,250,102,72);
	MOVLW       _Picks4inchA+0
	MOVWF       FARG_Increment_Decerement_Char_var+0 
	MOVLW       hi_addr(_Picks4inchA+0)
	MOVWF       FARG_Increment_Decerement_Char_var+1 
	MOVLW       250
	MOVWF       FARG_Increment_Decerement_Char_limit+0 
	MOVLW       102
	MOVWF       FARG_Increment_Decerement_Char_Pos_x+0 
	MOVLW       72
	MOVWF       FARG_Increment_Decerement_Char_Pos_y+0 
	CALL        _Increment_Decerement_Char+0, 0
;Control_Fn.c,1061 :: 		for(i=0;i<=15;i++)
	CLRF        Pick_Set_All_i_L0+0 
L_Pick_Set_All209:
	MOVF        Pick_Set_All_i_L0+0, 0 
	SUBLW       15
	BTFSS       STATUS+0, 0 
	GOTO        L_Pick_Set_All210
;Control_Fn.c,1063 :: 		EEPROM_Write(Picks4inchA_addr+i,Picks4inchA);
	MOVF        Pick_Set_All_i_L0+0, 0 
	ADDLW       16
	MOVWF       FARG_Eeprom_Write_address+0 
	CLRF        FARG_Eeprom_Write_address+1 
	MOVLW       0
	ADDWFC      FARG_Eeprom_Write_address+1, 1 
	MOVF        _Picks4inchA+0, 0 
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;Control_Fn.c,1064 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Pick_Set_All212:
	DECFSZ      R13, 1, 1
	BRA         L_Pick_Set_All212
	DECFSZ      R12, 1, 1
	BRA         L_Pick_Set_All212
	DECFSZ      R11, 1, 1
	BRA         L_Pick_Set_All212
	NOP
;Control_Fn.c,1061 :: 		for(i=0;i<=15;i++)
	INCF        Pick_Set_All_i_L0+0, 1 
;Control_Fn.c,1065 :: 		}
	GOTO        L_Pick_Set_All209
L_Pick_Set_All210:
;Control_Fn.c,1066 :: 		load_Picks4inch(void);//EEPORM SAVE PURPOSE
	CALL        _load_Picks4inch+0, 0
;Control_Fn.c,1067 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1068 :: 		T6963C_Write_Text_Adv_ROM("SAVING FOR ALL LOOMS",44,48);
	MOVLW       ?lstr_100_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_100_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_100_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       44
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1069 :: 		delay_ms(1500);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_Pick_Set_All213:
	DECFSZ      R13, 1, 1
	BRA         L_Pick_Set_All213
	DECFSZ      R12, 1, 1
	BRA         L_Pick_Set_All213
	DECFSZ      R11, 1, 1
	BRA         L_Pick_Set_All213
	NOP
	NOP
;Control_Fn.c,1070 :: 		T6963C_Cursor(0);
	BCF         _T6963C_display+0, 1 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Control_Fn.c,1071 :: 		return;
;Control_Fn.c,1073 :: 		}
L_end_Pick_Set_All:
	RETURN      0
; end of _Pick_Set_All

_Pick_Set_One_one:

;Control_Fn.c,1074 :: 		void Pick_Set_One_one(void)
;Control_Fn.c,1076 :: 		unsigned char i=0;
	CLRF        Pick_Set_One_one_i_L0+0 
;Control_Fn.c,1077 :: 		for(i=0;i<=15;i++)
	CLRF        Pick_Set_One_one_i_L0+0 
L_Pick_Set_One_one214:
	MOVF        Pick_Set_One_one_i_L0+0, 0 
	SUBLW       15
	BTFSS       STATUS+0, 0 
	GOTO        L_Pick_Set_One_one215
;Control_Fn.c,1081 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1082 :: 		T6963C_Write_Text_Adv_ROM("SET PICK/INCH:",50,16);
	MOVLW       ?lstr_101_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_101_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_101_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       50
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       16
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1083 :: 		T6963C_Write_Text_Adv_ROM("LOOM NUMBER:",8,40);
	MOVLW       ?lstr_102_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_102_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_102_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1084 :: 		GLCD_Print_Int_With_LeadingZero ( (Loom_Starting_value+i) , 104,40);
	MOVF        Pick_Set_One_one_i_L0+0, 0 
	ADDWF       _Loom_Starting_value+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       104
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       40
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1091 :: 		Picks4inchA = EEPROM_Read(Picks4inchA_addr+i);
	MOVF        Pick_Set_One_one_i_L0+0, 0 
	ADDLW       16
	MOVWF       FARG_Eeprom_Read_address+0 
	CLRF        FARG_Eeprom_Read_address+1 
	MOVLW       0
	ADDWFC      FARG_Eeprom_Read_address+1, 1 
	CALL        _Eeprom_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _Picks4inchA+0 
	MOVLW       0
	MOVWF       _Picks4inchA+1 
;Control_Fn.c,1092 :: 		T6963C_Write_Text_Adv_ROM("SET PICK FOR INCH:",8,64);
	MOVLW       ?lstr_103_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_103_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_103_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1093 :: 		GLCD_Print_Int_With_LeadingZero (Picks4inchA,158,64);
	MOVF        _Picks4inchA+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       158
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       64
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1099 :: 		delay_ms(250);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Pick_Set_One_one217:
	DECFSZ      R13, 1, 1
	BRA         L_Pick_Set_One_one217
	DECFSZ      R12, 1, 1
	BRA         L_Pick_Set_One_one217
	DECFSZ      R11, 1, 1
	BRA         L_Pick_Set_One_one217
	NOP
;Control_Fn.c,1100 :: 		Increment_Decerement_Char(&Picks4inchA,250,158,64);
	MOVLW       _Picks4inchA+0
	MOVWF       FARG_Increment_Decerement_Char_var+0 
	MOVLW       hi_addr(_Picks4inchA+0)
	MOVWF       FARG_Increment_Decerement_Char_var+1 
	MOVLW       250
	MOVWF       FARG_Increment_Decerement_Char_limit+0 
	MOVLW       158
	MOVWF       FARG_Increment_Decerement_Char_Pos_x+0 
	MOVLW       64
	MOVWF       FARG_Increment_Decerement_Char_Pos_y+0 
	CALL        _Increment_Decerement_Char+0, 0
;Control_Fn.c,1101 :: 		EEPROM_Write(Picks4inchA_addr+i,Picks4inchA);
	MOVF        Pick_Set_One_one_i_L0+0, 0 
	ADDLW       16
	MOVWF       FARG_Eeprom_Write_address+0 
	CLRF        FARG_Eeprom_Write_address+1 
	MOVLW       0
	ADDWFC      FARG_Eeprom_Write_address+1, 1 
	MOVF        _Picks4inchA+0, 0 
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;Control_Fn.c,1102 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Pick_Set_One_one218:
	DECFSZ      R13, 1, 1
	BRA         L_Pick_Set_One_one218
	DECFSZ      R12, 1, 1
	BRA         L_Pick_Set_One_one218
	DECFSZ      R11, 1, 1
	BRA         L_Pick_Set_One_one218
	NOP
;Control_Fn.c,1104 :: 		if(Stop==0)
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_Pick_Set_One_one219
;Control_Fn.c,1106 :: 		load_Picks4inch(void);
	CALL        _load_Picks4inch+0, 0
;Control_Fn.c,1107 :: 		delay_ms(500);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_Pick_Set_One_one220:
	DECFSZ      R13, 1, 1
	BRA         L_Pick_Set_One_one220
	DECFSZ      R12, 1, 1
	BRA         L_Pick_Set_One_one220
	DECFSZ      R11, 1, 1
	BRA         L_Pick_Set_One_one220
;Control_Fn.c,1108 :: 		return;
	GOTO        L_end_Pick_Set_One_one
;Control_Fn.c,1109 :: 		}
L_Pick_Set_One_one219:
;Control_Fn.c,1077 :: 		for(i=0;i<=15;i++)
	INCF        Pick_Set_One_one_i_L0+0, 1 
;Control_Fn.c,1110 :: 		}
	GOTO        L_Pick_Set_One_one214
L_Pick_Set_One_one215:
;Control_Fn.c,1111 :: 		load_Picks4inch(void);
	CALL        _load_Picks4inch+0, 0
;Control_Fn.c,1113 :: 		}
L_end_Pick_Set_One_one:
	RETURN      0
; end of _Pick_Set_One_one

_Reset_color_Setting:

;Control_Fn.c,1116 :: 		void Reset_color_Setting(void)
;Control_Fn.c,1118 :: 		unsigned char Reset_loop=0,Exit_loop=0,SplFlag=0,SplFlag1=0;
	CLRF        Reset_color_Setting_Reset_loop_L0+0 
	CLRF        Reset_color_Setting_Exit_loop_L0+0 
	CLRF        Reset_color_Setting_SplFlag_L0+0 
	CLRF        Reset_color_Setting_Hold_mode_L0+0 
;Control_Fn.c,1122 :: 		Exit_loop=0;
	CLRF        Reset_color_Setting_Exit_loop_L0+0 
;Control_Fn.c,1125 :: 		while(Exit_loop==0)
L_Reset_color_Setting221:
	MOVF        Reset_color_Setting_Exit_loop_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting222
;Control_Fn.c,1127 :: 		while(Hold_mode==0)
L_Reset_color_Setting223:
	MOVF        Reset_color_Setting_Hold_mode_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting224
;Control_Fn.c,1129 :: 		if((SplFlag==0)&&(Reset_loop==0))
	MOVF        Reset_color_Setting_SplFlag_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting227
	MOVF        Reset_color_Setting_Reset_loop_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting227
L__Reset_color_Setting676:
;Control_Fn.c,1131 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1132 :: 		T6963C_Write_char_adv(45,0,8 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,1133 :: 		T6963C_Write_char_adv(45,2,8 );
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
;Control_Fn.c,1134 :: 		T6963C_Write_char_adv(62,3,8 );
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
;Control_Fn.c,1135 :: 		T6963C_Write_Text_Adv_ROM("RESET:ALL LOOMS",11,8);
	MOVLW       ?lstr_104_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_104_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_104_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1136 :: 		T6963C_Write_Text_Adv_ROM("RESET:LOOM ONE BY ONE",11,24);
	MOVLW       ?lstr_105_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_105_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_105_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1137 :: 		T6963C_Write_Text_Adv_ROM("RESET:SHIFT:ONE BY ONE",11,40);
	MOVLW       ?lstr_106_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_106_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_106_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1138 :: 		T6963C_Write_Text_Adv_ROM("RESET:SHIFT:NO  ",11,56);
	MOVLW       ?lstr_107_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_107_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_107_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1139 :: 		T6963C_set_cursor(18,1);
	MOVLW       18
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       1
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,1140 :: 		Reset_loop=1;
	MOVLW       1
	MOVWF       Reset_color_Setting_Reset_loop_L0+0 
;Control_Fn.c,1141 :: 		delay_ms(100);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Reset_color_Setting228:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_color_Setting228
	DECFSZ      R12, 1, 1
	BRA         L_Reset_color_Setting228
	DECFSZ      R11, 1, 1
	BRA         L_Reset_color_Setting228
	NOP
;Control_Fn.c,1142 :: 		}
L_Reset_color_Setting227:
;Control_Fn.c,1144 :: 		if((SplFlag==1)&&(Reset_loop==0))
	MOVF        Reset_color_Setting_SplFlag_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting231
	MOVF        Reset_color_Setting_Reset_loop_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting231
L__Reset_color_Setting675:
;Control_Fn.c,1146 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1147 :: 		T6963C_Write_char_adv(45,0,24 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,1148 :: 		T6963C_Write_char_adv(45,2,24);
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
;Control_Fn.c,1149 :: 		T6963C_Write_char_adv(62,3,24);
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
;Control_Fn.c,1150 :: 		T6963C_Write_Text_Adv_ROM("RESET:ALL LOOMS",11,8);
	MOVLW       ?lstr_108_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_108_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_108_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1151 :: 		T6963C_Write_Text_Adv_ROM("RESET:LOOM ONE BY ONE",11,24);
	MOVLW       ?lstr_109_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_109_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_109_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1152 :: 		T6963C_Write_Text_Adv_ROM("RESET:SHIFT:ONE BY ONE",11,40);
	MOVLW       ?lstr_110_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_110_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_110_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1153 :: 		T6963C_Write_Text_Adv_ROM("RESET:SHIFT:NO  ",11,56);
	MOVLW       ?lstr_111_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_111_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_111_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1154 :: 		T6963C_set_cursor(18,23);
	MOVLW       18
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       23
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,1155 :: 		Reset_loop=1;
	MOVLW       1
	MOVWF       Reset_color_Setting_Reset_loop_L0+0 
;Control_Fn.c,1156 :: 		delay_ms(100);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Reset_color_Setting232:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_color_Setting232
	DECFSZ      R12, 1, 1
	BRA         L_Reset_color_Setting232
	DECFSZ      R11, 1, 1
	BRA         L_Reset_color_Setting232
	NOP
;Control_Fn.c,1157 :: 		}
L_Reset_color_Setting231:
;Control_Fn.c,1159 :: 		if((SplFlag==2)&&(Reset_loop==0))
	MOVF        Reset_color_Setting_SplFlag_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting235
	MOVF        Reset_color_Setting_Reset_loop_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting235
L__Reset_color_Setting674:
;Control_Fn.c,1161 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1162 :: 		T6963C_Write_char_adv(45,0,40);
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,1163 :: 		T6963C_Write_char_adv(45,2,40);
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       2
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,1164 :: 		T6963C_Write_char_adv(62,3,40);
	MOVLW       62
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,1165 :: 		T6963C_Write_Text_Adv_ROM("RESET:ALL LOOMS",11,8);
	MOVLW       ?lstr_112_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_112_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_112_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1166 :: 		T6963C_Write_Text_Adv_ROM("RESET:LOOM ONE BY ONE",11,24);
	MOVLW       ?lstr_113_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_113_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_113_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1167 :: 		T6963C_Write_Text_Adv_ROM("RESET:SHIFT:ONE BY ONE",11,40);
	MOVLW       ?lstr_114_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_114_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_114_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1168 :: 		T6963C_Write_Text_Adv_ROM("RESET:SHIFT:NO  ",11,56);
	MOVLW       ?lstr_115_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_115_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_115_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1169 :: 		T6963C_set_cursor(18,5);
	MOVLW       18
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       5
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,1170 :: 		Reset_loop=1;
	MOVLW       1
	MOVWF       Reset_color_Setting_Reset_loop_L0+0 
;Control_Fn.c,1171 :: 		delay_ms(100);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Reset_color_Setting236:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_color_Setting236
	DECFSZ      R12, 1, 1
	BRA         L_Reset_color_Setting236
	DECFSZ      R11, 1, 1
	BRA         L_Reset_color_Setting236
	NOP
;Control_Fn.c,1172 :: 		}
L_Reset_color_Setting235:
;Control_Fn.c,1174 :: 		if((SplFlag==3)&&(Reset_loop==0))
	MOVF        Reset_color_Setting_SplFlag_L0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting239
	MOVF        Reset_color_Setting_Reset_loop_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting239
L__Reset_color_Setting673:
;Control_Fn.c,1176 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1177 :: 		T6963C_Write_char_adv(45,0,56);
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+0 
	CLRF        FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,1178 :: 		T6963C_Write_char_adv(45,2,56);
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       2
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,1179 :: 		T6963C_Write_char_adv(62,3,56);
	MOVLW       62
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,1180 :: 		T6963C_Write_Text_Adv_ROM("RESET:ALL LOOMS",11,8);
	MOVLW       ?lstr_116_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_116_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_116_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1181 :: 		T6963C_Write_Text_Adv_ROM("RESET:LOOM ONE BY ONE",11,24);
	MOVLW       ?lstr_117_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_117_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_117_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1182 :: 		T6963C_Write_Text_Adv_ROM("RESET:SHIFT:ONE BY ONE",11,40);
	MOVLW       ?lstr_118_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_118_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_118_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1183 :: 		T6963C_Write_Text_Adv_ROM("RESET:SHIFT:NO  ",11,56);
	MOVLW       ?lstr_119_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_119_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_119_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1184 :: 		T6963C_set_cursor(18,7);
	MOVLW       18
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       7
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,1185 :: 		Reset_loop=1;
	MOVLW       1
	MOVWF       Reset_color_Setting_Reset_loop_L0+0 
;Control_Fn.c,1186 :: 		delay_ms(100);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Reset_color_Setting240:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_color_Setting240
	DECFSZ      R12, 1, 1
	BRA         L_Reset_color_Setting240
	DECFSZ      R11, 1, 1
	BRA         L_Reset_color_Setting240
	NOP
;Control_Fn.c,1187 :: 		}
L_Reset_color_Setting239:
;Control_Fn.c,1190 :: 		if(Start==0)
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Reset_color_Setting241
;Control_Fn.c,1192 :: 		if(SplFlag==0)
	MOVF        Reset_color_Setting_SplFlag_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting242
;Control_Fn.c,1193 :: 		{SplFlag=1;Reset_loop=0;delay_ms(100); }
	MOVLW       1
	MOVWF       Reset_color_Setting_SplFlag_L0+0 
	CLRF        Reset_color_Setting_Reset_loop_L0+0 
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Reset_color_Setting243:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_color_Setting243
	DECFSZ      R12, 1, 1
	BRA         L_Reset_color_Setting243
	DECFSZ      R11, 1, 1
	BRA         L_Reset_color_Setting243
	NOP
	GOTO        L_Reset_color_Setting244
L_Reset_color_Setting242:
;Control_Fn.c,1194 :: 		else if(SplFlag==1)
	MOVF        Reset_color_Setting_SplFlag_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting245
;Control_Fn.c,1195 :: 		{SplFlag=2;Reset_loop=0;delay_ms(100); }
	MOVLW       2
	MOVWF       Reset_color_Setting_SplFlag_L0+0 
	CLRF        Reset_color_Setting_Reset_loop_L0+0 
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Reset_color_Setting246:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_color_Setting246
	DECFSZ      R12, 1, 1
	BRA         L_Reset_color_Setting246
	DECFSZ      R11, 1, 1
	BRA         L_Reset_color_Setting246
	NOP
	GOTO        L_Reset_color_Setting247
L_Reset_color_Setting245:
;Control_Fn.c,1196 :: 		else if(SplFlag==2)
	MOVF        Reset_color_Setting_SplFlag_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting248
;Control_Fn.c,1197 :: 		{SplFlag=3;Reset_loop=0;delay_ms(100); }
	MOVLW       3
	MOVWF       Reset_color_Setting_SplFlag_L0+0 
	CLRF        Reset_color_Setting_Reset_loop_L0+0 
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Reset_color_Setting249:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_color_Setting249
	DECFSZ      R12, 1, 1
	BRA         L_Reset_color_Setting249
	DECFSZ      R11, 1, 1
	BRA         L_Reset_color_Setting249
	NOP
	GOTO        L_Reset_color_Setting250
L_Reset_color_Setting248:
;Control_Fn.c,1198 :: 		else if(SplFlag==3)
	MOVF        Reset_color_Setting_SplFlag_L0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting251
;Control_Fn.c,1199 :: 		{SplFlag=0;Reset_loop=0;delay_ms(100); }
	CLRF        Reset_color_Setting_SplFlag_L0+0 
	CLRF        Reset_color_Setting_Reset_loop_L0+0 
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Reset_color_Setting252:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_color_Setting252
	DECFSZ      R12, 1, 1
	BRA         L_Reset_color_Setting252
	DECFSZ      R11, 1, 1
	BRA         L_Reset_color_Setting252
	NOP
L_Reset_color_Setting251:
L_Reset_color_Setting250:
L_Reset_color_Setting247:
L_Reset_color_Setting244:
;Control_Fn.c,1201 :: 		}
L_Reset_color_Setting241:
;Control_Fn.c,1203 :: 		if(Stop==0)
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_Reset_color_Setting253
;Control_Fn.c,1205 :: 		if(SplFlag==0)
	MOVF        Reset_color_Setting_SplFlag_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting254
;Control_Fn.c,1206 :: 		{SplFlag=3;Reset_loop=0;delay_ms(100); }
	MOVLW       3
	MOVWF       Reset_color_Setting_SplFlag_L0+0 
	CLRF        Reset_color_Setting_Reset_loop_L0+0 
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Reset_color_Setting255:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_color_Setting255
	DECFSZ      R12, 1, 1
	BRA         L_Reset_color_Setting255
	DECFSZ      R11, 1, 1
	BRA         L_Reset_color_Setting255
	NOP
	GOTO        L_Reset_color_Setting256
L_Reset_color_Setting254:
;Control_Fn.c,1207 :: 		else if(SplFlag==1)
	MOVF        Reset_color_Setting_SplFlag_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting257
;Control_Fn.c,1208 :: 		{SplFlag=0;Reset_loop=0;delay_ms(100); }
	CLRF        Reset_color_Setting_SplFlag_L0+0 
	CLRF        Reset_color_Setting_Reset_loop_L0+0 
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Reset_color_Setting258:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_color_Setting258
	DECFSZ      R12, 1, 1
	BRA         L_Reset_color_Setting258
	DECFSZ      R11, 1, 1
	BRA         L_Reset_color_Setting258
	NOP
	GOTO        L_Reset_color_Setting259
L_Reset_color_Setting257:
;Control_Fn.c,1209 :: 		else if(SplFlag==2)
	MOVF        Reset_color_Setting_SplFlag_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting260
;Control_Fn.c,1210 :: 		{SplFlag=1;Reset_loop=0;delay_ms(100); }
	MOVLW       1
	MOVWF       Reset_color_Setting_SplFlag_L0+0 
	CLRF        Reset_color_Setting_Reset_loop_L0+0 
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Reset_color_Setting261:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_color_Setting261
	DECFSZ      R12, 1, 1
	BRA         L_Reset_color_Setting261
	DECFSZ      R11, 1, 1
	BRA         L_Reset_color_Setting261
	NOP
	GOTO        L_Reset_color_Setting262
L_Reset_color_Setting260:
;Control_Fn.c,1211 :: 		else if(SplFlag==3)
	MOVF        Reset_color_Setting_SplFlag_L0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting263
;Control_Fn.c,1212 :: 		{SplFlag=2;Reset_loop=0;delay_ms(100); }
	MOVLW       2
	MOVWF       Reset_color_Setting_SplFlag_L0+0 
	CLRF        Reset_color_Setting_Reset_loop_L0+0 
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Reset_color_Setting264:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_color_Setting264
	DECFSZ      R12, 1, 1
	BRA         L_Reset_color_Setting264
	DECFSZ      R11, 1, 1
	BRA         L_Reset_color_Setting264
	NOP
L_Reset_color_Setting263:
L_Reset_color_Setting262:
L_Reset_color_Setting259:
L_Reset_color_Setting256:
;Control_Fn.c,1214 :: 		}
L_Reset_color_Setting253:
;Control_Fn.c,1216 :: 		if(Set==0)
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Reset_color_Setting265
;Control_Fn.c,1219 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1220 :: 		if(SplFlag==0)
	MOVF        Reset_color_Setting_SplFlag_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting266
;Control_Fn.c,1222 :: 		Reset_All_Loom();
	CALL        _Reset_All_Loom+0, 0
;Control_Fn.c,1223 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Reset_color_Setting267:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_color_Setting267
	DECFSZ      R12, 1, 1
	BRA         L_Reset_color_Setting267
	DECFSZ      R11, 1, 1
	BRA         L_Reset_color_Setting267
;Control_Fn.c,1224 :: 		return;
	GOTO        L_end_Reset_color_Setting
;Control_Fn.c,1225 :: 		}
L_Reset_color_Setting266:
;Control_Fn.c,1227 :: 		if(SplFlag==1)
	MOVF        Reset_color_Setting_SplFlag_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting268
;Control_Fn.c,1229 :: 		Reset_Loom_One_one();
	CALL        _Reset_Loom_One_one+0, 0
;Control_Fn.c,1230 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Reset_color_Setting269:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_color_Setting269
	DECFSZ      R12, 1, 1
	BRA         L_Reset_color_Setting269
	DECFSZ      R11, 1, 1
	BRA         L_Reset_color_Setting269
;Control_Fn.c,1231 :: 		return;
	GOTO        L_end_Reset_color_Setting
;Control_Fn.c,1232 :: 		}
L_Reset_color_Setting268:
;Control_Fn.c,1233 :: 		if(SplFlag==2)
	MOVF        Reset_color_Setting_SplFlag_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting270
;Control_Fn.c,1235 :: 		Reset_Shift_One_one();
	CALL        _Reset_Shift_One_one+0, 0
;Control_Fn.c,1236 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Reset_color_Setting271:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_color_Setting271
	DECFSZ      R12, 1, 1
	BRA         L_Reset_color_Setting271
	DECFSZ      R11, 1, 1
	BRA         L_Reset_color_Setting271
;Control_Fn.c,1237 :: 		return;
	GOTO        L_end_Reset_color_Setting
;Control_Fn.c,1238 :: 		}
L_Reset_color_Setting270:
;Control_Fn.c,1239 :: 		if(SplFlag==3)
	MOVF        Reset_color_Setting_SplFlag_L0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_color_Setting272
;Control_Fn.c,1241 :: 		Shift_Jump();
	CALL        _Shift_Jump+0, 0
;Control_Fn.c,1242 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Reset_color_Setting273:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_color_Setting273
	DECFSZ      R12, 1, 1
	BRA         L_Reset_color_Setting273
	DECFSZ      R11, 1, 1
	BRA         L_Reset_color_Setting273
;Control_Fn.c,1243 :: 		return;
	GOTO        L_end_Reset_color_Setting
;Control_Fn.c,1244 :: 		}
L_Reset_color_Setting272:
;Control_Fn.c,1245 :: 		}
L_Reset_color_Setting265:
;Control_Fn.c,1247 :: 		if(Reverse==0)
	BTFSC       RE7_bit+0, BitPos(RE7_bit+0) 
	GOTO        L_Reset_color_Setting274
;Control_Fn.c,1249 :: 		Exit_loop=1;
	MOVLW       1
	MOVWF       Reset_color_Setting_Exit_loop_L0+0 
;Control_Fn.c,1250 :: 		Hold_mode=1;
	MOVLW       1
	MOVWF       Reset_color_Setting_Hold_mode_L0+0 
;Control_Fn.c,1251 :: 		Reset_loop=0;
	CLRF        Reset_color_Setting_Reset_loop_L0+0 
;Control_Fn.c,1252 :: 		exit1=1;
	MOVLW       1
	MOVWF       _exit1+0 
;Control_Fn.c,1253 :: 		GIE_bit       = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;Control_Fn.c,1254 :: 		PEIE_bit      = 1;
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;Control_Fn.c,1255 :: 		delay_ms(250);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Reset_color_Setting275:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_color_Setting275
	DECFSZ      R12, 1, 1
	BRA         L_Reset_color_Setting275
	DECFSZ      R11, 1, 1
	BRA         L_Reset_color_Setting275
	NOP
;Control_Fn.c,1256 :: 		return;
	GOTO        L_end_Reset_color_Setting
;Control_Fn.c,1257 :: 		}
L_Reset_color_Setting274:
;Control_Fn.c,1259 :: 		}
	GOTO        L_Reset_color_Setting223
L_Reset_color_Setting224:
;Control_Fn.c,1262 :: 		}
	GOTO        L_Reset_color_Setting221
L_Reset_color_Setting222:
;Control_Fn.c,1263 :: 		}
L_end_Reset_color_Setting:
	RETURN      0
; end of _Reset_color_Setting

_Reset_All_Loom:

;Control_Fn.c,1265 :: 		void Reset_All_Loom(void)
;Control_Fn.c,1267 :: 		unsigned int i=0,j=0,k=0;
	CLRF        Reset_All_Loom_i_L0+0 
	CLRF        Reset_All_Loom_i_L0+1 
	CLRF        Reset_All_Loom_j_L0+0 
	CLRF        Reset_All_Loom_j_L0+1 
	CLRF        Reset_All_Loom_k_L0+0 
	CLRF        Reset_All_Loom_k_L0+1 
;Control_Fn.c,1271 :: 		while (EEPROM_Reset_Attempt_Count_bit  <= 1 )
L_Reset_All_Loom276:
	CLRF        R1 
	BTFSC       _EEPROM_Reset_Attempt_Count_bit+0, BitPos(_EEPROM_Reset_Attempt_Count_bit+0) 
	INCF        R1, 1 
	MOVF        R1, 0 
	SUBLW       1
	BTFSS       STATUS+0, 0 
	GOTO        L_Reset_All_Loom277
;Control_Fn.c,1273 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1276 :: 		T6963C_Write_Text_Adv_ROM("UPDATING...",78,32);
	MOVLW       ?lstr_120_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_120_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_120_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       78
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       32
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1277 :: 		T6963C_Write_Text_Adv_ROM("PLEASE WAIT",78,48);
	MOVLW       ?lstr_121_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_121_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_121_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       78
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1280 :: 		PEIE_bit  = 0;
	BCF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;Control_Fn.c,1281 :: 		GIE_bit   = 0;
	BCF         GIE_bit+0, BitPos(GIE_bit+0) 
;Control_Fn.c,1284 :: 		T6963C_rectangle(80,104, 160, 90 , T6963C_WHITE); //FOR ANMIATION OUTER BOX
	MOVLW       80
	MOVWF       FARG_T6963C_rectangle_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_rectangle_x0+1 
	MOVLW       104
	MOVWF       FARG_T6963C_rectangle_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_rectangle_y0+1 
	MOVLW       160
	MOVWF       FARG_T6963C_rectangle_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_rectangle_x1+1 
	MOVLW       90
	MOVWF       FARG_T6963C_rectangle_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_rectangle_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_rectangle_pcolor+0 
	CALL        _T6963C_rectangle+0, 0
;Control_Fn.c,1287 :: 		for(i=0;i<16;i++)
	CLRF        Reset_All_Loom_i_L0+0 
	CLRF        Reset_All_Loom_i_L0+1 
L_Reset_All_Loom278:
	MOVLW       0
	SUBWF       Reset_All_Loom_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Reset_All_Loom713
	MOVLW       16
	SUBWF       Reset_All_Loom_i_L0+0, 0 
L__Reset_All_Loom713:
	BTFSC       STATUS+0, 0 
	GOTO        L_Reset_All_Loom279
;Control_Fn.c,1289 :: 		Loading_Fill(i);//0 TO 16
	MOVF        Reset_All_Loom_i_L0+0, 0 
	MOVWF       FARG_Loading_Fill_percent+0 
	CALL        _Loading_Fill+0, 0
;Control_Fn.c,1290 :: 		j=i*96;
	MOVF        Reset_All_Loom_i_L0+0, 0 
	MOVWF       R0 
	MOVF        Reset_All_Loom_i_L0+1, 0 
	MOVWF       R1 
	MOVLW       96
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       Reset_All_Loom_j_L0+0 
	MOVF        R1, 0 
	MOVWF       Reset_All_Loom_j_L0+1 
;Control_Fn.c,1291 :: 		for(k=j;k<(96+j);k++)
	MOVF        R0, 0 
	MOVWF       Reset_All_Loom_k_L0+0 
	MOVF        R1, 0 
	MOVWF       Reset_All_Loom_k_L0+1 
L_Reset_All_Loom281:
	MOVLW       96
	ADDWF       Reset_All_Loom_j_L0+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      Reset_All_Loom_j_L0+1, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       Reset_All_Loom_k_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Reset_All_Loom714
	MOVF        R1, 0 
	SUBWF       Reset_All_Loom_k_L0+0, 0 
L__Reset_All_Loom714:
	BTFSC       STATUS+0, 0 
	GOTO        L_Reset_All_Loom282
;Control_Fn.c,1293 :: 		EEPROM_AT24C32_WrInt(InchA_addr+(2*k),0);
	MOVF        Reset_All_Loom_k_L0+0, 0 
	MOVWF       R0 
	MOVF        Reset_All_Loom_k_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       16
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_WrInt_wAddr+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_WrInt_wAddr+1 
	CLRF        FARG_EEPROM_AT24C32_WrInt_wData+0 
	CLRF        FARG_EEPROM_AT24C32_WrInt_wData+1 
	CALL        _EEPROM_AT24C32_WrInt+0, 0
;Control_Fn.c,1294 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_Reset_All_Loom284:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_All_Loom284
	DECFSZ      R12, 1, 1
	BRA         L_Reset_All_Loom284
	NOP
	NOP
;Control_Fn.c,1291 :: 		for(k=j;k<(96+j);k++)
	INFSNZ      Reset_All_Loom_k_L0+0, 1 
	INCF        Reset_All_Loom_k_L0+1, 1 
;Control_Fn.c,1296 :: 		}
	GOTO        L_Reset_All_Loom281
L_Reset_All_Loom282:
;Control_Fn.c,1287 :: 		for(i=0;i<16;i++)
	INFSNZ      Reset_All_Loom_i_L0+0, 1 
	INCF        Reset_All_Loom_i_L0+1, 1 
;Control_Fn.c,1297 :: 		}
	GOTO        L_Reset_All_Loom278
L_Reset_All_Loom279:
;Control_Fn.c,1298 :: 		for(i=0;i<16;i++)
	CLRF        Reset_All_Loom_i_L0+0 
	CLRF        Reset_All_Loom_i_L0+1 
L_Reset_All_Loom285:
	MOVLW       0
	SUBWF       Reset_All_Loom_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Reset_All_Loom715
	MOVLW       16
	SUBWF       Reset_All_Loom_i_L0+0, 0 
L__Reset_All_Loom715:
	BTFSC       STATUS+0, 0 
	GOTO        L_Reset_All_Loom286
;Control_Fn.c,1300 :: 		Loading_Fill(i+25);// from 25 to  41
	MOVLW       25
	ADDWF       Reset_All_Loom_i_L0+0, 0 
	MOVWF       FARG_Loading_Fill_percent+0 
	CALL        _Loading_Fill+0, 0
;Control_Fn.c,1301 :: 		EEPROM_Write_int((InchA_addr_Temp+(2*i)),0);
	MOVF        Reset_All_Loom_i_L0+0, 0 
	MOVWF       R0 
	MOVF        Reset_All_Loom_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       32
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_Write_int_Addr+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_Write_int_Addr+1 
	CLRF        FARG_EEPROM_Write_int_Data+0 
	CLRF        FARG_EEPROM_Write_int_Data+1 
	CALL        _EEPROM_Write_int+0, 0
;Control_Fn.c,1302 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_Reset_All_Loom288:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_All_Loom288
	DECFSZ      R12, 1, 1
	BRA         L_Reset_All_Loom288
	NOP
	NOP
;Control_Fn.c,1298 :: 		for(i=0;i<16;i++)
	INFSNZ      Reset_All_Loom_i_L0+0, 1 
	INCF        Reset_All_Loom_i_L0+1, 1 
;Control_Fn.c,1303 :: 		}
	GOTO        L_Reset_All_Loom285
L_Reset_All_Loom286:
;Control_Fn.c,1306 :: 		Verify_EEPROM_Data_Clear();
	CALL        _Verify_EEPROM_Data_Clear+0, 0
;Control_Fn.c,1309 :: 		if( (EEPROM_RST_Check_bit == 1) && (EEPROM_Reset_Attempt_Count_bit == 1) )  //FIRST TIME
	BTFSS       _EEPROM_RST_Check_bit+0, BitPos(_EEPROM_RST_Check_bit+0) 
	GOTO        L_Reset_All_Loom291
	BTFSS       _EEPROM_Reset_Attempt_Count_bit+0, BitPos(_EEPROM_Reset_Attempt_Count_bit+0) 
	GOTO        L_Reset_All_Loom291
L__Reset_All_Loom678:
;Control_Fn.c,1311 :: 		EEPROM_RST_Check_bit = 0;//CLEAR RST STATE
	BCF         _EEPROM_RST_Check_bit+0, BitPos(_EEPROM_RST_Check_bit+0) 
;Control_Fn.c,1312 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1313 :: 		T6963C_Write_Text_Adv_ROM("EEPROM RESET FAIL",52,60);
	MOVLW       ?lstr_122_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_122_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_122_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       52
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1314 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1315 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1320 :: 		}
	GOTO        L_Reset_All_Loom292
L_Reset_All_Loom291:
;Control_Fn.c,1321 :: 		else if( (EEPROM_RST_Check_bit == 1) && ( EEPROM_Reset_Attempt_Count_bit == 2) ) //SECOND TIME
	BTFSS       _EEPROM_RST_Check_bit+0, BitPos(_EEPROM_RST_Check_bit+0) 
	GOTO        L_Reset_All_Loom295
	BTFSC       _EEPROM_Reset_Attempt_Count_bit+0, BitPos(_EEPROM_Reset_Attempt_Count_bit+0) 
	GOTO        L_Reset_All_Loom295
L__Reset_All_Loom677:
;Control_Fn.c,1323 :: 		EEPROM_RST_Check_bit = 0;//CLEAR RST STATE
	BCF         _EEPROM_RST_Check_bit+0, BitPos(_EEPROM_RST_Check_bit+0) 
;Control_Fn.c,1324 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1325 :: 		T6963C_Write_Text_Adv_ROM("AGAIN EEPROM RESET FAIL",4,60);
	MOVLW       ?lstr_123_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_123_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_123_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       4
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1326 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_Reset_All_Loom296:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_All_Loom296
	DECFSZ      R12, 1, 1
	BRA         L_Reset_All_Loom296
	DECFSZ      R11, 1, 1
	BRA         L_Reset_All_Loom296
	NOP
;Control_Fn.c,1328 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1329 :: 		while(Reverse == 1)
L_Reset_All_Loom297:
	BTFSS       RE7_bit+0, BitPos(RE7_bit+0) 
	GOTO        L_Reset_All_Loom298
;Control_Fn.c,1331 :: 		T6963C_Write_Text_Adv_ROM("PRESS BLACK BUTTON",48,46);
	MOVLW       ?lstr_124_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_124_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_124_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       46
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1332 :: 		T6963C_Write_Text_Adv_ROM("PLEASE KINLDY CONTACT", 36, 62);
	MOVLW       ?lstr_125_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_125_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_125_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       36
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       62
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1333 :: 		T6963C_Write_Text_Adv_ROM("NK AUTOMATION",68,78);
	MOVLW       ?lstr_126_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_126_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_126_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       68
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       78
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1334 :: 		T6963C_Write_Text_Adv_ROM("PH:9043043037",68,94);
	MOVLW       ?lstr_127_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_127_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_127_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       68
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       94
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1335 :: 		T6963C_Write_Text_Adv_ROM("MADE IN COIMBATORE",48,110);
	MOVLW       ?lstr_128_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_128_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_128_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       110
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1336 :: 		T6963C_Write_Text_Adv_ROM("TAMILNADU INDIA",60,126);
	MOVLW       ?lstr_129_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_129_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_129_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       126
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1337 :: 		EEPROM_Reset_Attempt_Count_bit=0;
	BCF         _EEPROM_Reset_Attempt_Count_bit+0, BitPos(_EEPROM_Reset_Attempt_Count_bit+0) 
;Control_Fn.c,1339 :: 		}
	GOTO        L_Reset_All_Loom297
L_Reset_All_Loom298:
;Control_Fn.c,1340 :: 		break;
	GOTO        L_Reset_All_Loom277
;Control_Fn.c,1341 :: 		}
L_Reset_All_Loom295:
;Control_Fn.c,1344 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1345 :: 		T6963C_Write_Text_Adv_ROM("EEPROM RESET SUCCESS",40,60);
	MOVLW       ?lstr_130_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_130_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_130_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1346 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_Reset_All_Loom300:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_All_Loom300
	DECFSZ      R12, 1, 1
	BRA         L_Reset_All_Loom300
	DECFSZ      R11, 1, 1
	BRA         L_Reset_All_Loom300
	NOP
;Control_Fn.c,1347 :: 		break;
	GOTO        L_Reset_All_Loom277
;Control_Fn.c,1348 :: 		}
L_Reset_All_Loom292:
;Control_Fn.c,1350 :: 		}
	GOTO        L_Reset_All_Loom276
L_Reset_All_Loom277:
;Control_Fn.c,1354 :: 		PEIE_bit  = 1;
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;Control_Fn.c,1355 :: 		GIE_bit   = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;Control_Fn.c,1359 :: 		Pulse_PickA=0;
	CLRF        _Pulse_PickA+0 
	CLRF        _Pulse_PickA+1 
;Control_Fn.c,1360 :: 		Pulse_PickB=0;
	CLRF        _Pulse_PickB+0 
	CLRF        _Pulse_PickB+1 
;Control_Fn.c,1361 :: 		Pulse_PickC=0;
	CLRF        _Pulse_PickC+0 
	CLRF        _Pulse_PickC+1 
;Control_Fn.c,1362 :: 		Pulse_PickD=0;
	CLRF        _Pulse_PickD+0 
	CLRF        _Pulse_PickD+1 
;Control_Fn.c,1363 :: 		Pulse_PickE=0;
	CLRF        _Pulse_PickE+0 
	CLRF        _Pulse_PickE+1 
;Control_Fn.c,1364 :: 		Pulse_PickF=0;
	CLRF        _Pulse_PickF+0 
	CLRF        _Pulse_PickF+1 
;Control_Fn.c,1365 :: 		Pulse_PickG=0;
	CLRF        _Pulse_PickG+0 
	CLRF        _Pulse_PickG+1 
;Control_Fn.c,1366 :: 		Pulse_PickH=0;
	CLRF        _Pulse_PickH+0 
	CLRF        _Pulse_PickH+1 
;Control_Fn.c,1367 :: 		Pulse_PickI=0;
	CLRF        _Pulse_PickI+0 
	CLRF        _Pulse_PickI+1 
;Control_Fn.c,1368 :: 		Pulse_PickJ=0;
	CLRF        _Pulse_PickJ+0 
	CLRF        _Pulse_PickJ+1 
;Control_Fn.c,1369 :: 		Pulse_PickK=0;
	CLRF        _Pulse_PickK+0 
	CLRF        _Pulse_PickK+1 
;Control_Fn.c,1370 :: 		Pulse_PickL=0;
	CLRF        _Pulse_PickL+0 
	CLRF        _Pulse_PickL+1 
;Control_Fn.c,1371 :: 		Pulse_PickM=0;
	CLRF        _Pulse_PickM+0 
	CLRF        _Pulse_PickM+1 
;Control_Fn.c,1372 :: 		Pulse_PickN=0;
	CLRF        _Pulse_PickN+0 
	CLRF        _Pulse_PickN+1 
;Control_Fn.c,1373 :: 		Pulse_PickO=0;
	CLRF        _Pulse_PickO+0 
	CLRF        _Pulse_PickO+1 
;Control_Fn.c,1374 :: 		Pulse_PickP=0;
	CLRF        _Pulse_PickP+0 
	CLRF        _Pulse_PickP+1 
;Control_Fn.c,1376 :: 		load_inch(void);
	CALL        _load_inch+0, 0
;Control_Fn.c,1377 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1379 :: 		T6963C_Write_Text_Adv_ROM("ALL LOOM METER",64,48);
	MOVLW       ?lstr_131_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_131_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_131_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1380 :: 		T6963C_Write_Text_Adv_ROM("RESETTING DONE",64,64);
	MOVLW       ?lstr_132_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_132_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_132_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1381 :: 		delay_ms(2500);
	MOVLW       203
	MOVWF       R11, 0
	MOVLW       236
	MOVWF       R12, 0
	MOVLW       132
	MOVWF       R13, 0
L_Reset_All_Loom301:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_All_Loom301
	DECFSZ      R12, 1, 1
	BRA         L_Reset_All_Loom301
	DECFSZ      R11, 1, 1
	BRA         L_Reset_All_Loom301
	NOP
;Control_Fn.c,1382 :: 		return;
;Control_Fn.c,1384 :: 		}
L_end_Reset_All_Loom:
	RETURN      0
; end of _Reset_All_Loom

_Reset_Loom_One_one:

;Control_Fn.c,1388 :: 		void Reset_Loom_One_one(void)
;Control_Fn.c,1391 :: 		unsigned int i=0,j=0,k=0;
	CLRF        Reset_Loom_One_one_i_L0+0 
	CLRF        Reset_Loom_One_one_i_L0+1 
	CLRF        Reset_Loom_One_one_j_L0+0 
	CLRF        Reset_Loom_One_one_j_L0+1 
	CLRF        Reset_Loom_One_one_k_L0+0 
	CLRF        Reset_Loom_One_one_k_L0+1 
	CLRF        Reset_Loom_One_one_Inc_Reset_L0+0 
;Control_Fn.c,1394 :: 		Save_shiftwise();
	CALL        _Save_shiftwise+0, 0
;Control_Fn.c,1395 :: 		for(i=0;i<=15;i++)
	CLRF        Reset_Loom_One_one_i_L0+0 
	CLRF        Reset_Loom_One_one_i_L0+1 
L_Reset_Loom_One_one302:
	MOVLW       0
	MOVWF       R0 
	MOVF        Reset_Loom_One_one_i_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Reset_Loom_One_one717
	MOVF        Reset_Loom_One_one_i_L0+0, 0 
	SUBLW       15
L__Reset_Loom_One_one717:
	BTFSS       STATUS+0, 0 
	GOTO        L_Reset_Loom_One_one303
;Control_Fn.c,1397 :: 		Inc_Reset=0;
	CLRF        Reset_Loom_One_one_Inc_Reset_L0+0 
;Control_Fn.c,1398 :: 		T6963C_Write_Text_Adv_ROM("RESET LOOM:",76,48);
	MOVLW       ?lstr_133_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_133_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_133_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       76
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1400 :: 		T6963C_box(104,64,136,73, T6963C_BLACK);
	MOVLW       104
	MOVWF       FARG_T6963C_box_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x0+1 
	MOVLW       64
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVLW       136
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       73
	MOVWF       FARG_T6963C_box_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y1+1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,1401 :: 		GLCD_Print_Int_With_LeadingZero ( (i+Loom_Starting_value) ,112,64);
	MOVF        _Loom_Starting_value+0, 0 
	ADDWF       Reset_Loom_One_one_i_L0+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       112
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       64
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1407 :: 		T6963C_Write_Text_Adv_ROM("IF YES PRESS INCH",52,80);
	MOVLW       ?lstr_134_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_134_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_134_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       52
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1408 :: 		delay_ms(250);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_Reset_Loom_One_one305:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_Loom_One_one305
	DECFSZ      R12, 1, 1
	BRA         L_Reset_Loom_One_one305
	DECFSZ      R11, 1, 1
	BRA         L_Reset_Loom_One_one305
	NOP
;Control_Fn.c,1409 :: 		j=i*96;
	MOVF        Reset_Loom_One_one_i_L0+0, 0 
	MOVWF       R0 
	MOVF        Reset_Loom_One_one_i_L0+1, 0 
	MOVWF       R1 
	MOVLW       96
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       Reset_Loom_One_one_j_L0+0 
	MOVF        R1, 0 
	MOVWF       Reset_Loom_One_one_j_L0+1 
;Control_Fn.c,1412 :: 		while(Inc_Reset==0)
L_Reset_Loom_One_one306:
	MOVF        Reset_Loom_One_one_Inc_Reset_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_Loom_One_one307
;Control_Fn.c,1414 :: 		if(Reverse==0)
	BTFSC       RE7_bit+0, BitPos(RE7_bit+0) 
	GOTO        L_Reset_Loom_One_one308
;Control_Fn.c,1416 :: 		load_inch(void);
	CALL        _load_inch+0, 0
;Control_Fn.c,1417 :: 		delay_ms(500);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_Reset_Loom_One_one309:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_Loom_One_one309
	DECFSZ      R12, 1, 1
	BRA         L_Reset_Loom_One_one309
	DECFSZ      R11, 1, 1
	BRA         L_Reset_Loom_One_one309
;Control_Fn.c,1418 :: 		return;
	GOTO        L_end_Reset_Loom_One_one
;Control_Fn.c,1419 :: 		}
L_Reset_Loom_One_one308:
;Control_Fn.c,1420 :: 		if(Start==0)
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Reset_Loom_One_one310
;Control_Fn.c,1422 :: 		Inc_Reset=1;
	MOVLW       1
	MOVWF       Reset_Loom_One_one_Inc_Reset_L0+0 
;Control_Fn.c,1423 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Reset_Loom_One_one311:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_Loom_One_one311
	DECFSZ      R12, 1, 1
	BRA         L_Reset_Loom_One_one311
	DECFSZ      R11, 1, 1
	BRA         L_Reset_Loom_One_one311
	NOP
;Control_Fn.c,1425 :: 		}
L_Reset_Loom_One_one310:
;Control_Fn.c,1426 :: 		if(Set==0)
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Reset_Loom_One_one312
;Control_Fn.c,1428 :: 		for(k=j;k<(96+j);k++)
	MOVF        Reset_Loom_One_one_j_L0+0, 0 
	MOVWF       Reset_Loom_One_one_k_L0+0 
	MOVF        Reset_Loom_One_one_j_L0+1, 0 
	MOVWF       Reset_Loom_One_one_k_L0+1 
L_Reset_Loom_One_one313:
	MOVLW       96
	ADDWF       Reset_Loom_One_one_j_L0+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      Reset_Loom_One_one_j_L0+1, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       Reset_Loom_One_one_k_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Reset_Loom_One_one718
	MOVF        R1, 0 
	SUBWF       Reset_Loom_One_one_k_L0+0, 0 
L__Reset_Loom_One_one718:
	BTFSC       STATUS+0, 0 
	GOTO        L_Reset_Loom_One_one314
;Control_Fn.c,1430 :: 		EEPROM_AT24C32_WrInt(InchA_addr+(2*k),0);
	MOVF        Reset_Loom_One_one_k_L0+0, 0 
	MOVWF       R0 
	MOVF        Reset_Loom_One_one_k_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       16
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_WrInt_wAddr+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_WrInt_wAddr+1 
	CLRF        FARG_EEPROM_AT24C32_WrInt_wData+0 
	CLRF        FARG_EEPROM_AT24C32_WrInt_wData+1 
	CALL        _EEPROM_AT24C32_WrInt+0, 0
;Control_Fn.c,1431 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_Reset_Loom_One_one316:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_Loom_One_one316
	DECFSZ      R12, 1, 1
	BRA         L_Reset_Loom_One_one316
	NOP
	NOP
;Control_Fn.c,1428 :: 		for(k=j;k<(96+j);k++)
	INFSNZ      Reset_Loom_One_one_k_L0+0, 1 
	INCF        Reset_Loom_One_one_k_L0+1, 1 
;Control_Fn.c,1432 :: 		}
	GOTO        L_Reset_Loom_One_one313
L_Reset_Loom_One_one314:
;Control_Fn.c,1433 :: 		EEPROM_Write_int((InchA_addr_Temp+(2*i)),0);
	MOVF        Reset_Loom_One_one_i_L0+0, 0 
	MOVWF       R0 
	MOVF        Reset_Loom_One_one_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       32
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_Write_int_Addr+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_Write_int_Addr+1 
	CLRF        FARG_EEPROM_Write_int_Data+0 
	CLRF        FARG_EEPROM_Write_int_Data+1 
	CALL        _EEPROM_Write_int+0, 0
;Control_Fn.c,1434 :: 		delay_ms(100);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Reset_Loom_One_one317:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_Loom_One_one317
	DECFSZ      R12, 1, 1
	BRA         L_Reset_Loom_One_one317
	DECFSZ      R11, 1, 1
	BRA         L_Reset_Loom_One_one317
	NOP
;Control_Fn.c,1435 :: 		while(Set==0)
L_Reset_Loom_One_one318:
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Reset_Loom_One_one319
;Control_Fn.c,1436 :: 		delay_ms(100);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Reset_Loom_One_one320:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_Loom_One_one320
	DECFSZ      R12, 1, 1
	BRA         L_Reset_Loom_One_one320
	DECFSZ      R11, 1, 1
	BRA         L_Reset_Loom_One_one320
	NOP
	GOTO        L_Reset_Loom_One_one318
L_Reset_Loom_One_one319:
;Control_Fn.c,1437 :: 		Inc_Reset=1;
	MOVLW       1
	MOVWF       Reset_Loom_One_one_Inc_Reset_L0+0 
;Control_Fn.c,1438 :: 		}
L_Reset_Loom_One_one312:
;Control_Fn.c,1439 :: 		}
	GOTO        L_Reset_Loom_One_one306
L_Reset_Loom_One_one307:
;Control_Fn.c,1395 :: 		for(i=0;i<=15;i++)
	INFSNZ      Reset_Loom_One_one_i_L0+0, 1 
	INCF        Reset_Loom_One_one_i_L0+1, 1 
;Control_Fn.c,1443 :: 		}
	GOTO        L_Reset_Loom_One_one302
L_Reset_Loom_One_one303:
;Control_Fn.c,1444 :: 		load_inch(void);
	CALL        _load_inch+0, 0
;Control_Fn.c,1446 :: 		}
L_end_Reset_Loom_One_one:
	RETURN      0
; end of _Reset_Loom_One_one

_Reset_Shift_One_one:

;Control_Fn.c,1448 :: 		void Reset_Shift_One_one(void)
;Control_Fn.c,1451 :: 		unsigned char Reset_loop=0,ColourExit2=0,item=0,SplFlag=0;
	CLRF        Reset_Shift_One_one_ColourExit2_L0+0 
;Control_Fn.c,1456 :: 		Save_shiftwise();
	CALL        _Save_shiftwise+0, 0
;Control_Fn.c,1457 :: 		while(ColourExit2==0)
L_Reset_Shift_One_one321:
	MOVF        Reset_Shift_One_one_ColourExit2_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Reset_Shift_One_one322
;Control_Fn.c,1459 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1460 :: 		T6963C_Write_Text_Adv_ROM("LOOM:NO    SHIFT:NO",30,8);
	MOVLW       ?lstr_135_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_135_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_135_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       30
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1461 :: 		delay_ms(1500);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_Reset_Shift_One_one323:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_Shift_One_one323
	DECFSZ      R12, 1, 1
	BRA         L_Reset_Shift_One_one323
	DECFSZ      R11, 1, 1
	BRA         L_Reset_Shift_One_one323
	NOP
	NOP
;Control_Fn.c,1463 :: 		Loom_no=Loom_Starting_value;
	MOVF        _Loom_Starting_value+0, 0 
	MOVWF       Reset_Shift_One_one_Loom_no_L0+0 
;Control_Fn.c,1464 :: 		Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),20,24);
	MOVLW       Reset_Shift_One_one_Loom_no_L0+0
	MOVWF       FARG_Increment_Decerement_var+0 
	MOVLW       hi_addr(Reset_Shift_One_one_Loom_no_L0+0)
	MOVWF       FARG_Increment_Decerement_var+1 
	DECF        _Loom_Starting_value+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       16
	MOVWF       FARG_Increment_Decerement_limit+0 
	MOVLW       20
	MOVWF       FARG_Increment_Decerement_Pos_x+0 
	MOVLW       24
	MOVWF       FARG_Increment_Decerement_Pos_y+0 
	CALL        _Increment_Decerement+0, 0
;Control_Fn.c,1466 :: 		while(Loom_no<Loom_Starting_value)
L_Reset_Shift_One_one324:
	MOVF        _Loom_Starting_value+0, 0 
	SUBWF       Reset_Shift_One_one_Loom_no_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Reset_Shift_One_one325
;Control_Fn.c,1468 :: 		Loom_no=Loom_Starting_value;
	MOVF        _Loom_Starting_value+0, 0 
	MOVWF       Reset_Shift_One_one_Loom_no_L0+0 
;Control_Fn.c,1469 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1470 :: 		T6963C_Write_Text_Adv_ROM("INVALD VALUE",11,8);
	MOVLW       ?lstr_136_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_136_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_136_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1471 :: 		T6963C_Write_Text_Adv_ROM("FOR THIS BOX",11,24);
	MOVLW       ?lstr_137_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_137_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_137_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       11
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1472 :: 		delay_ms(1500);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_Reset_Shift_One_one326:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_Shift_One_one326
	DECFSZ      R12, 1, 1
	BRA         L_Reset_Shift_One_one326
	DECFSZ      R11, 1, 1
	BRA         L_Reset_Shift_One_one326
	NOP
	NOP
;Control_Fn.c,1473 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1474 :: 		T6963C_Write_Text_Adv_ROM("LOOM:NO    SHIFT:NO",30,8);
	MOVLW       ?lstr_138_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_138_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_138_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       30
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1475 :: 		delay_ms(1500);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_Reset_Shift_One_one327:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_Shift_One_one327
	DECFSZ      R12, 1, 1
	BRA         L_Reset_Shift_One_one327
	DECFSZ      R11, 1, 1
	BRA         L_Reset_Shift_One_one327
	NOP
	NOP
;Control_Fn.c,1476 :: 		Increment_Decerement(&Loom_no,(16+(Loom_Starting_value-1)),32,24);
	MOVLW       Reset_Shift_One_one_Loom_no_L0+0
	MOVWF       FARG_Increment_Decerement_var+0 
	MOVLW       hi_addr(Reset_Shift_One_one_Loom_no_L0+0)
	MOVWF       FARG_Increment_Decerement_var+1 
	DECF        _Loom_Starting_value+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       16
	MOVWF       FARG_Increment_Decerement_limit+0 
	MOVLW       32
	MOVWF       FARG_Increment_Decerement_Pos_x+0 
	MOVLW       24
	MOVWF       FARG_Increment_Decerement_Pos_y+0 
	CALL        _Increment_Decerement+0, 0
;Control_Fn.c,1477 :: 		}
	GOTO        L_Reset_Shift_One_one324
L_Reset_Shift_One_one325:
;Control_Fn.c,1479 :: 		Increment_Decerement(&Shift_no,96,100,24);
	MOVLW       Reset_Shift_One_one_Shift_no_L0+0
	MOVWF       FARG_Increment_Decerement_var+0 
	MOVLW       hi_addr(Reset_Shift_One_one_Shift_no_L0+0)
	MOVWF       FARG_Increment_Decerement_var+1 
	MOVLW       96
	MOVWF       FARG_Increment_Decerement_limit+0 
	MOVLW       100
	MOVWF       FARG_Increment_Decerement_Pos_x+0 
	MOVLW       24
	MOVWF       FARG_Increment_Decerement_Pos_y+0 
	CALL        _Increment_Decerement+0, 0
;Control_Fn.c,1480 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Reset_Shift_One_one328:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_Shift_One_one328
	DECFSZ      R12, 1, 1
	BRA         L_Reset_Shift_One_one328
	DECFSZ      R11, 1, 1
	BRA         L_Reset_Shift_One_one328
	NOP
;Control_Fn.c,1483 :: 		Loom_no=(Loom_no-(Loom_Starting_value-1));
	DECF        _Loom_Starting_value+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	SUBWF       Reset_Shift_One_one_Loom_no_L0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       Reset_Shift_One_one_Loom_no_L0+0 
;Control_Fn.c,1485 :: 		Loom_noA = Loom_no;
	MOVF        R0, 0 
	MOVWF       Reset_Shift_One_one_Loom_noA_L0+0 
	MOVLW       0
	MOVWF       Reset_Shift_One_one_Loom_noA_L0+1 
;Control_Fn.c,1486 :: 		j=(Loom_noA-1)*192;
	MOVLW       1
	SUBWF       Reset_Shift_One_one_Loom_noA_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      Reset_Shift_One_one_Loom_noA_L0+1, 0 
	MOVWF       R1 
	MOVLW       192
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
;Control_Fn.c,1487 :: 		LoomStartAddr=j+InchA_addr;
	MOVLW       16
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_WrInt_wAddr+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_WrInt_wAddr+1 
;Control_Fn.c,1488 :: 		k = ((Shift_no-1)*2);
	DECF        Reset_Shift_One_one_Shift_no_L0+0, 0 
	MOVWF       R3 
	CLRF        R4 
	MOVLW       0
	SUBWFB      R4, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
;Control_Fn.c,1490 :: 		EEPROM_AT24C32_WrInt((LoomStartAddr+k),0);
	MOVF        R0, 0 
	ADDWF       FARG_EEPROM_AT24C32_WrInt_wAddr+0, 1 
	MOVF        R1, 0 
	ADDWFC      FARG_EEPROM_AT24C32_WrInt_wAddr+1, 1 
	CLRF        FARG_EEPROM_AT24C32_WrInt_wData+0 
	CLRF        FARG_EEPROM_AT24C32_WrInt_wData+1 
	CALL        _EEPROM_AT24C32_WrInt+0, 0
;Control_Fn.c,1491 :: 		delay_ms(500);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_Reset_Shift_One_one329:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_Shift_One_one329
	DECFSZ      R12, 1, 1
	BRA         L_Reset_Shift_One_one329
	DECFSZ      R11, 1, 1
	BRA         L_Reset_Shift_One_one329
;Control_Fn.c,1493 :: 		EEPROM_Write_int((InchA_addr_Temp+(2*(Loom_noA-1))),0);
	MOVLW       1
	SUBWF       Reset_Shift_One_one_Loom_noA_L0+0, 0 
	MOVWF       R3 
	MOVLW       0
	SUBWFB      Reset_Shift_One_one_Loom_noA_L0+1, 0 
	MOVWF       R4 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       32
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_Write_int_Addr+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_Write_int_Addr+1 
	CLRF        FARG_EEPROM_Write_int_Data+0 
	CLRF        FARG_EEPROM_Write_int_Data+1 
	CALL        _EEPROM_Write_int+0, 0
;Control_Fn.c,1494 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_Reset_Shift_One_one330:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_Shift_One_one330
	DECFSZ      R12, 1, 1
	BRA         L_Reset_Shift_One_one330
	NOP
	NOP
;Control_Fn.c,1497 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1498 :: 		T6963C_Write_Text_Adv_ROM("RESETTING DONE",64,8);
	MOVLW       ?lstr_139_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_139_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_139_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1499 :: 		T6963C_Write_Text_Adv_ROM("PRESS & HOLD BLACK BUTTON",20,24);
	MOVLW       ?lstr_140_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_140_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_140_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       20
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1500 :: 		T6963C_Write_Text_Adv_ROM("IF YOU WANT TO EXIT",44,40);
	MOVLW       ?lstr_141_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_141_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_141_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       44
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1501 :: 		delay_ms(4000);
	MOVLW       2
	MOVWF       R10, 0
	MOVLW       69
	MOVWF       R11, 0
	MOVLW       173
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_Reset_Shift_One_one331:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_Shift_One_one331
	DECFSZ      R12, 1, 1
	BRA         L_Reset_Shift_One_one331
	DECFSZ      R11, 1, 1
	BRA         L_Reset_Shift_One_one331
	DECFSZ      R10, 1, 1
	BRA         L_Reset_Shift_One_one331
	NOP
	NOP
;Control_Fn.c,1503 :: 		if(Reverse==0)
	BTFSC       RE7_bit+0, BitPos(RE7_bit+0) 
	GOTO        L_Reset_Shift_One_one332
;Control_Fn.c,1505 :: 		ColourExit2=1;
	MOVLW       1
	MOVWF       Reset_Shift_One_one_ColourExit2_L0+0 
;Control_Fn.c,1506 :: 		}
L_Reset_Shift_One_one332:
;Control_Fn.c,1508 :: 		}
	GOTO        L_Reset_Shift_One_one321
L_Reset_Shift_One_one322:
;Control_Fn.c,1510 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Reset_Shift_One_one333:
	DECFSZ      R13, 1, 1
	BRA         L_Reset_Shift_One_one333
	DECFSZ      R12, 1, 1
	BRA         L_Reset_Shift_One_one333
	DECFSZ      R11, 1, 1
	BRA         L_Reset_Shift_One_one333
	NOP
;Control_Fn.c,1511 :: 		load_inch();
	CALL        _load_inch+0, 0
;Control_Fn.c,1513 :: 		}
L_end_Reset_Shift_One_one:
	RETURN      0
; end of _Reset_Shift_One_one

_Display_variable_Update_Left_Pulse_picks:

;Control_Fn.c,1517 :: 		void Display_variable_Update_Left_Pulse_picks(void)
;Control_Fn.c,1520 :: 		unsigned char Inch_Order_Count=0;
	CLRF        Display_variable_Update_Left_Pulse_picks_Inch_Order_Count_L0+0 
;Control_Fn.c,1523 :: 		Pulse_Pick_Left_Order[0]=Pulse_PickA;
	MOVF        _Pulse_PickA+0, 0 
	MOVWF       Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+0 
	MOVF        _Pulse_PickA+1, 0 
	MOVWF       Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+1 
;Control_Fn.c,1524 :: 		Pulse_Pick_Left_Order[1]=Pulse_PickB;
	MOVF        _Pulse_PickB+0, 0 
	MOVWF       Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+2 
	MOVF        _Pulse_PickB+1, 0 
	MOVWF       Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+3 
;Control_Fn.c,1525 :: 		Pulse_Pick_Left_Order[2]=Pulse_PickC;
	MOVF        _Pulse_PickC+0, 0 
	MOVWF       Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+4 
	MOVF        _Pulse_PickC+1, 0 
	MOVWF       Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+5 
;Control_Fn.c,1526 :: 		Pulse_Pick_Left_Order[3]=Pulse_PickD;
	MOVF        _Pulse_PickD+0, 0 
	MOVWF       Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+6 
	MOVF        _Pulse_PickD+1, 0 
	MOVWF       Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+7 
;Control_Fn.c,1527 :: 		Pulse_Pick_Left_Order[4]=Pulse_PickE;
	MOVF        _Pulse_PickE+0, 0 
	MOVWF       Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+8 
	MOVF        _Pulse_PickE+1, 0 
	MOVWF       Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+9 
;Control_Fn.c,1528 :: 		Pulse_Pick_Left_Order[5]=Pulse_PickF;
	MOVF        _Pulse_PickF+0, 0 
	MOVWF       Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+10 
	MOVF        _Pulse_PickF+1, 0 
	MOVWF       Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+11 
;Control_Fn.c,1529 :: 		Pulse_Pick_Left_Order[6]=Pulse_PickG;
	MOVF        _Pulse_PickG+0, 0 
	MOVWF       Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+12 
	MOVF        _Pulse_PickG+1, 0 
	MOVWF       Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+13 
;Control_Fn.c,1530 :: 		Pulse_Pick_Left_Order[7]=Pulse_PickH;
	MOVF        _Pulse_PickH+0, 0 
	MOVWF       Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+14 
	MOVF        _Pulse_PickH+1, 0 
	MOVWF       Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+15 
;Control_Fn.c,1532 :: 		for(Inch_Order_Count=0 ; Inch_Order_Count < 8; Inch_Order_Count++ )
	CLRF        Display_variable_Update_Left_Pulse_picks_Inch_Order_Count_L0+0 
L_Display_variable_Update_Left_Pulse_picks334:
	MOVLW       8
	SUBWF       Display_variable_Update_Left_Pulse_picks_Inch_Order_Count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Display_variable_Update_Left_Pulse_picks335
;Control_Fn.c,1534 :: 		T6963C_box(21+Fi_Xpos, 1+Ypos+(13*Inch_Order_Count), 21+Fi_Xpos+19, Ypos+(13*Inch_Order_Count)+10, T6963C_BLACK);
	MOVLW       21
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
	MOVWF       R3 
	MOVF        R2, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	MOVF        R3, 0 
	MOVWF       FARG_T6963C_box_x0+1 
	MOVLW       1
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y0+1 
	MOVLW       13
	MULWF       Display_variable_Update_Left_Pulse_picks_Inch_Order_Count_L0+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_T6963C_box_y0+0, 1 
	MOVF        R1, 0 
	ADDWFC      FARG_T6963C_box_y0+1, 1 
	MOVLW       19
	ADDWF       R2, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	ADDWFC      R3, 0 
	MOVWF       FARG_T6963C_box_x1+1 
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       10
	ADDWF       FARG_T6963C_box_y1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,1535 :: 		IntToStr(Pulse_Pick_Left_Order[Inch_Order_Count], Text);
	MOVF        Display_variable_Update_Left_Pulse_picks_Inch_Order_Count_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(Display_variable_Update_Left_Pulse_picks_Pulse_Pick_Left_Order_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _Text+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Control_Fn.c,1536 :: 		T6963C_Write_Text_Adv(Text,20+Fi_Xpos       ,Ypos+(13*Inch_Order_Count));
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       20
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       13
	MULWF       Display_variable_Update_Left_Pulse_picks_Inch_Order_Count_L0+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,1537 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Display_variable_Update_Left_Pulse_picks337:
	DECFSZ      R13, 1, 1
	BRA         L_Display_variable_Update_Left_Pulse_picks337
	DECFSZ      R12, 1, 1
	BRA         L_Display_variable_Update_Left_Pulse_picks337
	NOP
;Control_Fn.c,1532 :: 		for(Inch_Order_Count=0 ; Inch_Order_Count < 8; Inch_Order_Count++ )
	INCF        Display_variable_Update_Left_Pulse_picks_Inch_Order_Count_L0+0, 1 
;Control_Fn.c,1538 :: 		}
	GOTO        L_Display_variable_Update_Left_Pulse_picks334
L_Display_variable_Update_Left_Pulse_picks335:
;Control_Fn.c,1541 :: 		return;
;Control_Fn.c,1542 :: 		}
L_end_Display_variable_Update_Left_Pulse_picks:
	RETURN      0
; end of _Display_variable_Update_Left_Pulse_picks

_Display_variable_Update_Left_Inches:

;Control_Fn.c,1545 :: 		void Display_variable_Update_Left_Inches(void)
;Control_Fn.c,1547 :: 		int Value_int=0;
	CLRF        Display_variable_Update_Left_Inches_Value_int_L0+0 
	CLRF        Display_variable_Update_Left_Inches_Value_int_L0+1 
	CLRF        Display_variable_Update_Left_Inches_Inch_Order_Count_L0+0 
;Control_Fn.c,1551 :: 		for(Inch_Order_Count=0 ; Inch_Order_Count < 8; Inch_Order_Count++ )
	CLRF        Display_variable_Update_Left_Inches_Inch_Order_Count_L0+0 
L_Display_variable_Update_Left_Inches338:
	MOVLW       8
	SUBWF       Display_variable_Update_Left_Inches_Inch_Order_Count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Display_variable_Update_Left_Inches339
;Control_Fn.c,1553 :: 		Value_int= (int)Inch[Inch_Order_Count];
	MOVF        Display_variable_Update_Left_Inches_Inch_Order_Count_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _Inch+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_Inch+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       Display_variable_Update_Left_Inches_Value_int_L0+0 
	MOVF        R1, 0 
	MOVWF       Display_variable_Update_Left_Inches_Value_int_L0+1 
;Control_Fn.c,1554 :: 		T6963C_box(44+Fi_Xpos, 1+Ypos+(13*Inch_Order_Count), 44+Fi_Xpos+27, Ypos+(13*Inch_Order_Count)+10, T6963C_BLACK);//CLEAR PURPOSE
	MOVLW       44
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
	MOVWF       R3 
	MOVF        R2, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	MOVF        R3, 0 
	MOVWF       FARG_T6963C_box_x0+1 
	MOVLW       1
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y0+1 
	MOVLW       13
	MULWF       Display_variable_Update_Left_Inches_Inch_Order_Count_L0+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_T6963C_box_y0+0, 1 
	MOVF        R1, 0 
	ADDWFC      FARG_T6963C_box_y0+1, 1 
	MOVLW       27
	ADDWF       R2, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	ADDWFC      R3, 0 
	MOVWF       FARG_T6963C_box_x1+1 
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       10
	ADDWF       FARG_T6963C_box_y1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,1555 :: 		IntToStr(Value_int, Text);
	MOVF        Display_variable_Update_Left_Inches_Value_int_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        Display_variable_Update_Left_Inches_Value_int_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _Text+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Control_Fn.c,1556 :: 		T6963C_Write_Text_Adv(Text,43+Fi_Xpos       ,Ypos+(13*Inch_Order_Count));//PREV 45
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       43
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       13
	MULWF       Display_variable_Update_Left_Inches_Inch_Order_Count_L0+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,1557 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Display_variable_Update_Left_Inches341:
	DECFSZ      R13, 1, 1
	BRA         L_Display_variable_Update_Left_Inches341
	DECFSZ      R12, 1, 1
	BRA         L_Display_variable_Update_Left_Inches341
	NOP
;Control_Fn.c,1551 :: 		for(Inch_Order_Count=0 ; Inch_Order_Count < 8; Inch_Order_Count++ )
	INCF        Display_variable_Update_Left_Inches_Inch_Order_Count_L0+0, 1 
;Control_Fn.c,1559 :: 		}
	GOTO        L_Display_variable_Update_Left_Inches338
L_Display_variable_Update_Left_Inches339:
;Control_Fn.c,1562 :: 		return;
;Control_Fn.c,1563 :: 		}
L_end_Display_variable_Update_Left_Inches:
	RETURN      0
; end of _Display_variable_Update_Left_Inches

_Display_variable_Update_Right_Pulse_picks:

;Control_Fn.c,1565 :: 		void Display_variable_Update_Right_Pulse_picks(void)
;Control_Fn.c,1568 :: 		unsigned char Inch_Order_Count=0;
	CLRF        Display_variable_Update_Right_Pulse_picks_Inch_Order_Count_L0+0 
;Control_Fn.c,1571 :: 		Pulse_Pick_Right_Order[0]=Pulse_PickI;
	MOVF        _Pulse_PickI+0, 0 
	MOVWF       Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+0 
	MOVF        _Pulse_PickI+1, 0 
	MOVWF       Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+1 
;Control_Fn.c,1572 :: 		Pulse_Pick_Right_Order[1]=Pulse_PickJ;
	MOVF        _Pulse_PickJ+0, 0 
	MOVWF       Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+2 
	MOVF        _Pulse_PickJ+1, 0 
	MOVWF       Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+3 
;Control_Fn.c,1573 :: 		Pulse_Pick_Right_Order[2]=Pulse_PickK;
	MOVF        _Pulse_PickK+0, 0 
	MOVWF       Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+4 
	MOVF        _Pulse_PickK+1, 0 
	MOVWF       Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+5 
;Control_Fn.c,1574 :: 		Pulse_Pick_Right_Order[3]=Pulse_PickL;
	MOVF        _Pulse_PickL+0, 0 
	MOVWF       Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+6 
	MOVF        _Pulse_PickL+1, 0 
	MOVWF       Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+7 
;Control_Fn.c,1575 :: 		Pulse_Pick_Right_Order[4]=Pulse_PickM;
	MOVF        _Pulse_PickM+0, 0 
	MOVWF       Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+8 
	MOVF        _Pulse_PickM+1, 0 
	MOVWF       Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+9 
;Control_Fn.c,1576 :: 		Pulse_Pick_Right_Order[5]=Pulse_PickN;
	MOVF        _Pulse_PickN+0, 0 
	MOVWF       Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+10 
	MOVF        _Pulse_PickN+1, 0 
	MOVWF       Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+11 
;Control_Fn.c,1577 :: 		Pulse_Pick_Right_Order[6]=Pulse_PickO;
	MOVF        _Pulse_PickO+0, 0 
	MOVWF       Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+12 
	MOVF        _Pulse_PickO+1, 0 
	MOVWF       Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+13 
;Control_Fn.c,1578 :: 		Pulse_Pick_Right_Order[7]=Pulse_PickP;
	MOVF        _Pulse_PickP+0, 0 
	MOVWF       Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+14 
	MOVF        _Pulse_PickP+1, 0 
	MOVWF       Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+15 
;Control_Fn.c,1583 :: 		for(Inch_Order_Count=0 ; Inch_Order_Count < 8; Inch_Order_Count++ )
	CLRF        Display_variable_Update_Right_Pulse_picks_Inch_Order_Count_L0+0 
L_Display_variable_Update_Right_Pulse_picks342:
	MOVLW       8
	SUBWF       Display_variable_Update_Right_Pulse_picks_Inch_Order_Count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Display_variable_Update_Right_Pulse_picks343
;Control_Fn.c,1585 :: 		T6963C_box(141+Fi_Xpos, 1+Ypos+(13*Inch_Order_Count), 141+Fi_Xpos+19, Ypos+(13*Inch_Order_Count)+10, T6963C_BLACK);
	MOVLW       141
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
	MOVWF       R3 
	MOVF        R2, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	MOVF        R3, 0 
	MOVWF       FARG_T6963C_box_x0+1 
	MOVLW       1
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y0+1 
	MOVLW       13
	MULWF       Display_variable_Update_Right_Pulse_picks_Inch_Order_Count_L0+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_T6963C_box_y0+0, 1 
	MOVF        R1, 0 
	ADDWFC      FARG_T6963C_box_y0+1, 1 
	MOVLW       19
	ADDWF       R2, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	ADDWFC      R3, 0 
	MOVWF       FARG_T6963C_box_x1+1 
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       10
	ADDWF       FARG_T6963C_box_y1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,1586 :: 		IntToStr(Pulse_Pick_Right_Order[Inch_Order_Count], Text);
	MOVF        Display_variable_Update_Right_Pulse_picks_Inch_Order_Count_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(Display_variable_Update_Right_Pulse_picks_Pulse_Pick_Right_Order_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _Text+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Control_Fn.c,1587 :: 		T6963C_Write_Text_Adv(Text,138+Fi_Xpos       ,Ypos+(13*Inch_Order_Count));
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       138
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       13
	MULWF       Display_variable_Update_Right_Pulse_picks_Inch_Order_Count_L0+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,1588 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Display_variable_Update_Right_Pulse_picks345:
	DECFSZ      R13, 1, 1
	BRA         L_Display_variable_Update_Right_Pulse_picks345
	DECFSZ      R12, 1, 1
	BRA         L_Display_variable_Update_Right_Pulse_picks345
	NOP
;Control_Fn.c,1583 :: 		for(Inch_Order_Count=0 ; Inch_Order_Count < 8; Inch_Order_Count++ )
	INCF        Display_variable_Update_Right_Pulse_picks_Inch_Order_Count_L0+0, 1 
;Control_Fn.c,1589 :: 		}
	GOTO        L_Display_variable_Update_Right_Pulse_picks342
L_Display_variable_Update_Right_Pulse_picks343:
;Control_Fn.c,1592 :: 		return;
;Control_Fn.c,1593 :: 		}
L_end_Display_variable_Update_Right_Pulse_picks:
	RETURN      0
; end of _Display_variable_Update_Right_Pulse_picks

_Display_variable_Update_Right_Inches:

;Control_Fn.c,1595 :: 		void Display_variable_Update_Right_Inches(void)
;Control_Fn.c,1599 :: 		int Value_int=0;
	CLRF        Display_variable_Update_Right_Inches_Value_int_L0+0 
	CLRF        Display_variable_Update_Right_Inches_Value_int_L0+1 
	CLRF        Display_variable_Update_Right_Inches_Inch_Order_Count_L0+0 
;Control_Fn.c,1602 :: 		for(Inch_Order_Count=0 ; Inch_Order_Count < 8; Inch_Order_Count++ )
	CLRF        Display_variable_Update_Right_Inches_Inch_Order_Count_L0+0 
L_Display_variable_Update_Right_Inches346:
	MOVLW       8
	SUBWF       Display_variable_Update_Right_Inches_Inch_Order_Count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Display_variable_Update_Right_Inches347
;Control_Fn.c,1604 :: 		Value_int= (int)Inch[Inch_Order_Count + 8];
	MOVLW       8
	ADDWF       Display_variable_Update_Right_Inches_Inch_Order_Count_L0+0, 0 
	MOVWF       R3 
	CLRF        R4 
	MOVLW       0
	ADDWFC      R4, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _Inch+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_Inch+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       Display_variable_Update_Right_Inches_Value_int_L0+0 
	MOVF        R1, 0 
	MOVWF       Display_variable_Update_Right_Inches_Value_int_L0+1 
;Control_Fn.c,1605 :: 		T6963C_box(164+Fi_Xpos, 1+Ypos+(13*Inch_Order_Count), 164+Fi_Xpos+27, Ypos+(13*Inch_Order_Count)+10, T6963C_BLACK);//CLEAR PURPOSE
	MOVLW       164
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
	MOVWF       R3 
	MOVF        R2, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	MOVF        R3, 0 
	MOVWF       FARG_T6963C_box_x0+1 
	MOVLW       1
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y0+1 
	MOVLW       13
	MULWF       Display_variable_Update_Right_Inches_Inch_Order_Count_L0+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_T6963C_box_y0+0, 1 
	MOVF        R1, 0 
	ADDWFC      FARG_T6963C_box_y0+1, 1 
	MOVLW       27
	ADDWF       R2, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	ADDWFC      R3, 0 
	MOVWF       FARG_T6963C_box_x1+1 
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       10
	ADDWF       FARG_T6963C_box_y1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,1606 :: 		IntToStr(Value_int, Text);
	MOVF        Display_variable_Update_Right_Inches_Value_int_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        Display_variable_Update_Right_Inches_Value_int_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _Text+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Control_Fn.c,1607 :: 		T6963C_Write_Text_Adv(Text,163+Fi_Xpos       ,Ypos+(13*Inch_Order_Count));
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       163
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       13
	MULWF       Display_variable_Update_Right_Inches_Inch_Order_Count_L0+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,1608 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Display_variable_Update_Right_Inches349:
	DECFSZ      R13, 1, 1
	BRA         L_Display_variable_Update_Right_Inches349
	DECFSZ      R12, 1, 1
	BRA         L_Display_variable_Update_Right_Inches349
	NOP
;Control_Fn.c,1602 :: 		for(Inch_Order_Count=0 ; Inch_Order_Count < 8; Inch_Order_Count++ )
	INCF        Display_variable_Update_Right_Inches_Inch_Order_Count_L0+0, 1 
;Control_Fn.c,1609 :: 		}
	GOTO        L_Display_variable_Update_Right_Inches346
L_Display_variable_Update_Right_Inches347:
;Control_Fn.c,1611 :: 		return;
;Control_Fn.c,1612 :: 		}
L_end_Display_variable_Update_Right_Inches:
	RETURN      0
; end of _Display_variable_Update_Right_Inches

_Variable_Reset:

;Control_Fn.c,1615 :: 		void Variable_Reset(void)
;Control_Fn.c,1617 :: 		inchA = EEPROM_AT24C32_RdInt((InchA_addr+(2*Shift_value)));
	MOVF        _Shift_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVLW       16
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _inchA+0 
	MOVF        R1, 0 
	MOVWF       _inchA+1 
	MOVF        R2, 0 
	MOVWF       _inchA+2 
	MOVF        R3, 0 
	MOVWF       _inchA+3 
;Control_Fn.c,1618 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Variable_Reset350:
	DECFSZ      R13, 1, 1
	BRA         L_Variable_Reset350
	DECFSZ      R12, 1, 1
	BRA         L_Variable_Reset350
	DECFSZ      R11, 1, 1
	BRA         L_Variable_Reset350
	NOP
;Control_Fn.c,1619 :: 		inchB = EEPROM_AT24C32_RdInt((InchB_addr+(2*Shift_value)));
	MOVF        _Shift_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVLW       208
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _inchB+0 
	MOVF        R1, 0 
	MOVWF       _inchB+1 
	MOVF        R2, 0 
	MOVWF       _inchB+2 
	MOVF        R3, 0 
	MOVWF       _inchB+3 
;Control_Fn.c,1620 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Variable_Reset351:
	DECFSZ      R13, 1, 1
	BRA         L_Variable_Reset351
	DECFSZ      R12, 1, 1
	BRA         L_Variable_Reset351
	DECFSZ      R11, 1, 1
	BRA         L_Variable_Reset351
	NOP
;Control_Fn.c,1621 :: 		inchC = EEPROM_AT24C32_RdInt((InchC_addr+(2*Shift_value)));
	MOVF        _Shift_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVLW       144
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       1
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _inchC+0 
	MOVF        R1, 0 
	MOVWF       _inchC+1 
	MOVF        R2, 0 
	MOVWF       _inchC+2 
	MOVF        R3, 0 
	MOVWF       _inchC+3 
;Control_Fn.c,1622 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Variable_Reset352:
	DECFSZ      R13, 1, 1
	BRA         L_Variable_Reset352
	DECFSZ      R12, 1, 1
	BRA         L_Variable_Reset352
	DECFSZ      R11, 1, 1
	BRA         L_Variable_Reset352
	NOP
;Control_Fn.c,1623 :: 		inchD = EEPROM_AT24C32_RdInt((InchD_addr+(2*Shift_value)));
	MOVF        _Shift_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVLW       80
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       2
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _inchD+0 
	MOVF        R1, 0 
	MOVWF       _inchD+1 
	MOVF        R2, 0 
	MOVWF       _inchD+2 
	MOVF        R3, 0 
	MOVWF       _inchD+3 
;Control_Fn.c,1624 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Variable_Reset353:
	DECFSZ      R13, 1, 1
	BRA         L_Variable_Reset353
	DECFSZ      R12, 1, 1
	BRA         L_Variable_Reset353
	DECFSZ      R11, 1, 1
	BRA         L_Variable_Reset353
	NOP
;Control_Fn.c,1625 :: 		inchE = EEPROM_AT24C32_RdInt((InchE_addr+(2*Shift_value)));
	MOVF        _Shift_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVLW       16
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       3
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _inchE+0 
	MOVF        R1, 0 
	MOVWF       _inchE+1 
	MOVF        R2, 0 
	MOVWF       _inchE+2 
	MOVF        R3, 0 
	MOVWF       _inchE+3 
;Control_Fn.c,1626 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Variable_Reset354:
	DECFSZ      R13, 1, 1
	BRA         L_Variable_Reset354
	DECFSZ      R12, 1, 1
	BRA         L_Variable_Reset354
	DECFSZ      R11, 1, 1
	BRA         L_Variable_Reset354
	NOP
;Control_Fn.c,1627 :: 		inchF = EEPROM_AT24C32_RdInt((InchF_addr+(2*Shift_value)));
	MOVF        _Shift_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVLW       208
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       3
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _inchF+0 
	MOVF        R1, 0 
	MOVWF       _inchF+1 
	MOVF        R2, 0 
	MOVWF       _inchF+2 
	MOVF        R3, 0 
	MOVWF       _inchF+3 
;Control_Fn.c,1628 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Variable_Reset355:
	DECFSZ      R13, 1, 1
	BRA         L_Variable_Reset355
	DECFSZ      R12, 1, 1
	BRA         L_Variable_Reset355
	DECFSZ      R11, 1, 1
	BRA         L_Variable_Reset355
	NOP
;Control_Fn.c,1629 :: 		inchG = EEPROM_AT24C32_RdInt((InchG_addr+(2*Shift_value)));
	MOVF        _Shift_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVLW       144
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       4
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _inchG+0 
	MOVF        R1, 0 
	MOVWF       _inchG+1 
	MOVF        R2, 0 
	MOVWF       _inchG+2 
	MOVF        R3, 0 
	MOVWF       _inchG+3 
;Control_Fn.c,1630 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Variable_Reset356:
	DECFSZ      R13, 1, 1
	BRA         L_Variable_Reset356
	DECFSZ      R12, 1, 1
	BRA         L_Variable_Reset356
	DECFSZ      R11, 1, 1
	BRA         L_Variable_Reset356
	NOP
;Control_Fn.c,1631 :: 		inchH = EEPROM_AT24C32_RdInt((InchH_addr+(2*Shift_value)));
	MOVF        _Shift_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVLW       80
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       5
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _inchH+0 
	MOVF        R1, 0 
	MOVWF       _inchH+1 
	MOVF        R2, 0 
	MOVWF       _inchH+2 
	MOVF        R3, 0 
	MOVWF       _inchH+3 
;Control_Fn.c,1632 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Variable_Reset357:
	DECFSZ      R13, 1, 1
	BRA         L_Variable_Reset357
	DECFSZ      R12, 1, 1
	BRA         L_Variable_Reset357
	DECFSZ      R11, 1, 1
	BRA         L_Variable_Reset357
	NOP
;Control_Fn.c,1633 :: 		inchI = EEPROM_AT24C32_RdInt((InchI_addr+(2*Shift_value)));
	MOVF        _Shift_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVLW       16
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       6
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _inchI+0 
	MOVF        R1, 0 
	MOVWF       _inchI+1 
	MOVF        R2, 0 
	MOVWF       _inchI+2 
	MOVF        R3, 0 
	MOVWF       _inchI+3 
;Control_Fn.c,1634 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Variable_Reset358:
	DECFSZ      R13, 1, 1
	BRA         L_Variable_Reset358
	DECFSZ      R12, 1, 1
	BRA         L_Variable_Reset358
	DECFSZ      R11, 1, 1
	BRA         L_Variable_Reset358
	NOP
;Control_Fn.c,1635 :: 		inchJ = EEPROM_AT24C32_RdInt((InchJ_addr+(2*Shift_value)));
	MOVF        _Shift_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVLW       208
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       6
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _inchJ+0 
	MOVF        R1, 0 
	MOVWF       _inchJ+1 
	MOVF        R2, 0 
	MOVWF       _inchJ+2 
	MOVF        R3, 0 
	MOVWF       _inchJ+3 
;Control_Fn.c,1636 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Variable_Reset359:
	DECFSZ      R13, 1, 1
	BRA         L_Variable_Reset359
	DECFSZ      R12, 1, 1
	BRA         L_Variable_Reset359
	DECFSZ      R11, 1, 1
	BRA         L_Variable_Reset359
	NOP
;Control_Fn.c,1637 :: 		inchK = EEPROM_AT24C32_RdInt((InchK_addr+(2*Shift_value)));
	MOVF        _Shift_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVLW       144
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       7
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _inchK+0 
	MOVF        R1, 0 
	MOVWF       _inchK+1 
	MOVF        R2, 0 
	MOVWF       _inchK+2 
	MOVF        R3, 0 
	MOVWF       _inchK+3 
;Control_Fn.c,1638 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Variable_Reset360:
	DECFSZ      R13, 1, 1
	BRA         L_Variable_Reset360
	DECFSZ      R12, 1, 1
	BRA         L_Variable_Reset360
	DECFSZ      R11, 1, 1
	BRA         L_Variable_Reset360
	NOP
;Control_Fn.c,1639 :: 		inchL = EEPROM_AT24C32_RdInt((InchL_addr+(2*Shift_value)));
	MOVF        _Shift_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVLW       80
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       8
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _inchL+0 
	MOVF        R1, 0 
	MOVWF       _inchL+1 
	MOVF        R2, 0 
	MOVWF       _inchL+2 
	MOVF        R3, 0 
	MOVWF       _inchL+3 
;Control_Fn.c,1640 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Variable_Reset361:
	DECFSZ      R13, 1, 1
	BRA         L_Variable_Reset361
	DECFSZ      R12, 1, 1
	BRA         L_Variable_Reset361
	DECFSZ      R11, 1, 1
	BRA         L_Variable_Reset361
	NOP
;Control_Fn.c,1641 :: 		inchM = EEPROM_AT24C32_RdInt((InchM_addr+(2*Shift_value)));
	MOVF        _Shift_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVLW       16
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       9
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _inchM+0 
	MOVF        R1, 0 
	MOVWF       _inchM+1 
	MOVF        R2, 0 
	MOVWF       _inchM+2 
	MOVF        R3, 0 
	MOVWF       _inchM+3 
;Control_Fn.c,1642 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Variable_Reset362:
	DECFSZ      R13, 1, 1
	BRA         L_Variable_Reset362
	DECFSZ      R12, 1, 1
	BRA         L_Variable_Reset362
	DECFSZ      R11, 1, 1
	BRA         L_Variable_Reset362
	NOP
;Control_Fn.c,1643 :: 		inchN = EEPROM_AT24C32_RdInt((InchN_addr+(2*Shift_value)));
	MOVF        _Shift_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVLW       208
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       9
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _inchN+0 
	MOVF        R1, 0 
	MOVWF       _inchN+1 
	MOVF        R2, 0 
	MOVWF       _inchN+2 
	MOVF        R3, 0 
	MOVWF       _inchN+3 
;Control_Fn.c,1644 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Variable_Reset363:
	DECFSZ      R13, 1, 1
	BRA         L_Variable_Reset363
	DECFSZ      R12, 1, 1
	BRA         L_Variable_Reset363
	DECFSZ      R11, 1, 1
	BRA         L_Variable_Reset363
	NOP
;Control_Fn.c,1645 :: 		inchO = EEPROM_AT24C32_RdInt((InchO_addr+(2*Shift_value)));
	MOVF        _Shift_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVLW       144
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       10
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _inchO+0 
	MOVF        R1, 0 
	MOVWF       _inchO+1 
	MOVF        R2, 0 
	MOVWF       _inchO+2 
	MOVF        R3, 0 
	MOVWF       _inchO+3 
;Control_Fn.c,1646 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Variable_Reset364:
	DECFSZ      R13, 1, 1
	BRA         L_Variable_Reset364
	DECFSZ      R12, 1, 1
	BRA         L_Variable_Reset364
	DECFSZ      R11, 1, 1
	BRA         L_Variable_Reset364
	NOP
;Control_Fn.c,1647 :: 		inchP = EEPROM_AT24C32_RdInt((InchP_addr+(2*Shift_value)));
	MOVF        _Shift_value+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	RLCF        R1, 1 
	BCF         R0, 0 
	MOVLW       80
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       11
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _inchP+0 
	MOVF        R1, 0 
	MOVWF       _inchP+1 
	MOVF        R2, 0 
	MOVWF       _inchP+2 
	MOVF        R3, 0 
	MOVWF       _inchP+3 
;Control_Fn.c,1648 :: 		delay_ms(30);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       112
	MOVWF       R12, 0
	MOVLW       92
	MOVWF       R13, 0
L_Variable_Reset365:
	DECFSZ      R13, 1, 1
	BRA         L_Variable_Reset365
	DECFSZ      R12, 1, 1
	BRA         L_Variable_Reset365
	DECFSZ      R11, 1, 1
	BRA         L_Variable_Reset365
	NOP
;Control_Fn.c,1650 :: 		Pulse_PickA=0;
	CLRF        _Pulse_PickA+0 
	CLRF        _Pulse_PickA+1 
;Control_Fn.c,1651 :: 		Pulse_PickB=0;
	CLRF        _Pulse_PickB+0 
	CLRF        _Pulse_PickB+1 
;Control_Fn.c,1652 :: 		Pulse_PickC=0;
	CLRF        _Pulse_PickC+0 
	CLRF        _Pulse_PickC+1 
;Control_Fn.c,1653 :: 		Pulse_PickD=0;
	CLRF        _Pulse_PickD+0 
	CLRF        _Pulse_PickD+1 
;Control_Fn.c,1654 :: 		Pulse_PickE=0;
	CLRF        _Pulse_PickE+0 
	CLRF        _Pulse_PickE+1 
;Control_Fn.c,1655 :: 		Pulse_PickF=0;
	CLRF        _Pulse_PickF+0 
	CLRF        _Pulse_PickF+1 
;Control_Fn.c,1656 :: 		Pulse_PickG=0;
	CLRF        _Pulse_PickG+0 
	CLRF        _Pulse_PickG+1 
;Control_Fn.c,1657 :: 		Pulse_PickH=0;
	CLRF        _Pulse_PickH+0 
	CLRF        _Pulse_PickH+1 
;Control_Fn.c,1658 :: 		Pulse_PickI=0;
	CLRF        _Pulse_PickI+0 
	CLRF        _Pulse_PickI+1 
;Control_Fn.c,1659 :: 		Pulse_PickJ=0;
	CLRF        _Pulse_PickJ+0 
	CLRF        _Pulse_PickJ+1 
;Control_Fn.c,1660 :: 		Pulse_PickK=0;
	CLRF        _Pulse_PickK+0 
	CLRF        _Pulse_PickK+1 
;Control_Fn.c,1661 :: 		Pulse_PickL=0;
	CLRF        _Pulse_PickL+0 
	CLRF        _Pulse_PickL+1 
;Control_Fn.c,1662 :: 		Pulse_PickM=0;
	CLRF        _Pulse_PickM+0 
	CLRF        _Pulse_PickM+1 
;Control_Fn.c,1663 :: 		Pulse_PickN=0;
	CLRF        _Pulse_PickN+0 
	CLRF        _Pulse_PickN+1 
;Control_Fn.c,1664 :: 		Pulse_PickO=0;
	CLRF        _Pulse_PickO+0 
	CLRF        _Pulse_PickO+1 
;Control_Fn.c,1665 :: 		Pulse_PickP=0;
	CLRF        _Pulse_PickP+0 
	CLRF        _Pulse_PickP+1 
;Control_Fn.c,1668 :: 		}
L_end_Variable_Reset:
	RETURN      0
; end of _Variable_Reset

_Next_cyle:

;Control_Fn.c,1670 :: 		void Next_cyle(void)
;Control_Fn.c,1672 :: 		unsigned char Cycle_exit=0,i=0,j=0;
	CLRF        Next_cyle_Cycle_exit_L0+0 
;Control_Fn.c,1674 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1675 :: 		while (Cycle_exit==0)
L_Next_cyle366:
	MOVF        Next_cyle_Cycle_exit_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Next_cyle367
;Control_Fn.c,1677 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1679 :: 		T6963C_Write_Text_Adv_ROM("SHIFT CYCLE OVER",56,8);
	MOVLW       ?lstr_142_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_142_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_142_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1682 :: 		T6963C_Write_char_adv(45,1,24 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       1
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,1683 :: 		T6963C_Write_char_adv(45,3,24 );
	MOVLW       45
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
;Control_Fn.c,1684 :: 		T6963C_Write_char_adv(62,4,24 );
	MOVLW       62
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       4
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,1685 :: 		T6963C_Write_Text_Adv_ROM("IF OK PRESS[START]",14,24);
	MOVLW       ?lstr_143_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_143_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_143_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       14
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       24
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1688 :: 		T6963C_Write_Text_Adv_ROM("OR",30,40);
	MOVLW       ?lstr_144_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_144_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_144_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       30
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1691 :: 		T6963C_Write_char_adv(45,1,56 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       1
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,1692 :: 		T6963C_Write_char_adv(45,3,56 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,1693 :: 		T6963C_Write_char_adv(62,4,56 );
	MOVLW       62
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       4
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,1694 :: 		T6963C_Write_Text_Adv_ROM("PRESS STOP",   14, 56);
	MOVLW       ?lstr_145_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_145_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_145_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       14
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1695 :: 		T6963C_Write_Text_Adv_ROM("NOTE: 96th SHIFT", 14, 72);
	MOVLW       ?lstr_146_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_146_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_146_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       14
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1696 :: 		T6963C_Write_Text_Adv_ROM("NOTE METER & RESET SHIFT",   14, 88);
	MOVLW       ?lstr_147_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_147_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_147_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       14
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       88
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1699 :: 		T6963C_Write_char_adv(45,1, 104 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       1
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       104
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,1700 :: 		T6963C_Write_char_adv(45,3,104 );
	MOVLW       45
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       3
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       104
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,1701 :: 		T6963C_Write_char_adv(62,4,104 );
	MOVLW       62
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVLW       4
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVLW       104
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,1702 :: 		T6963C_Write_Text_Adv_ROM("PRESS INCH TO RESET ALL LOOM",  14, 104);
	MOVLW       ?lstr_148_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_148_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_148_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       14
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       104
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1704 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Next_cyle368:
	DECFSZ      R13, 1, 1
	BRA         L_Next_cyle368
	DECFSZ      R12, 1, 1
	BRA         L_Next_cyle368
	DECFSZ      R11, 1, 1
	BRA         L_Next_cyle368
	NOP
;Control_Fn.c,1706 :: 		if (Start==0)
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Next_cyle369
;Control_Fn.c,1709 :: 		Cycle_exit=1;
	MOVLW       1
	MOVWF       Next_cyle_Cycle_exit_L0+0 
;Control_Fn.c,1710 :: 		Shift_value=0;
	CLRF        _Shift_value+0 
;Control_Fn.c,1711 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_Next_cyle370:
	DECFSZ      R13, 1, 1
	BRA         L_Next_cyle370
	DECFSZ      R12, 1, 1
	BRA         L_Next_cyle370
	DECFSZ      R11, 1, 1
	BRA         L_Next_cyle370
	NOP
	NOP
;Control_Fn.c,1712 :: 		Variable_Reset();
	CALL        _Variable_Reset+0, 0
;Control_Fn.c,1713 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_Next_cyle371:
	DECFSZ      R13, 1, 1
	BRA         L_Next_cyle371
	DECFSZ      R12, 1, 1
	BRA         L_Next_cyle371
	DECFSZ      R11, 1, 1
	BRA         L_Next_cyle371
	NOP
	NOP
;Control_Fn.c,1714 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1715 :: 		T6963C_Write_Text_Adv_ROM("SHIFT CHANGED",80,48);
	MOVLW       ?lstr_149_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_149_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_149_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1716 :: 		GLCD_Print_Int_With_LeadingZero ( (Shift_value+1),112,64);
	MOVF        _Shift_value+0, 0 
	ADDLW       1
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       112
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       64
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1719 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_Next_cyle372:
	DECFSZ      R13, 1, 1
	BRA         L_Next_cyle372
	DECFSZ      R12, 1, 1
	BRA         L_Next_cyle372
	DECFSZ      R11, 1, 1
	BRA         L_Next_cyle372
	NOP
;Control_Fn.c,1720 :: 		}
L_Next_cyle369:
;Control_Fn.c,1722 :: 		if (Stop==0)
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_Next_cyle373
;Control_Fn.c,1724 :: 		menushift_sec=0;
	CLRF        _menushift_sec+0 
;Control_Fn.c,1725 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_Next_cyle374:
	DECFSZ      R13, 1, 1
	BRA         L_Next_cyle374
	DECFSZ      R12, 1, 1
	BRA         L_Next_cyle374
	DECFSZ      R11, 1, 1
	BRA         L_Next_cyle374
	NOP
	NOP
;Control_Fn.c,1726 :: 		while(Stop==0);
L_Next_cyle375:
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_Next_cyle376
	GOTO        L_Next_cyle375
L_Next_cyle376:
;Control_Fn.c,1727 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_Next_cyle377:
	DECFSZ      R13, 1, 1
	BRA         L_Next_cyle377
	DECFSZ      R12, 1, 1
	BRA         L_Next_cyle377
	DECFSZ      R11, 1, 1
	BRA         L_Next_cyle377
	NOP
	NOP
;Control_Fn.c,1728 :: 		return;
	GOTO        L_end_Next_cyle
;Control_Fn.c,1729 :: 		}
L_Next_cyle373:
;Control_Fn.c,1730 :: 		if (Set == 0)//T O RESET ALL LOOMS PURPOSE
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Next_cyle378
;Control_Fn.c,1734 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1735 :: 		Reset_All_Loom();
	CALL        _Reset_All_Loom+0, 0
;Control_Fn.c,1736 :: 		delay_ms(200);
	MOVLW       17
	MOVWF       R11, 0
	MOVLW       60
	MOVWF       R12, 0
	MOVLW       203
	MOVWF       R13, 0
L_Next_cyle379:
	DECFSZ      R13, 1, 1
	BRA         L_Next_cyle379
	DECFSZ      R12, 1, 1
	BRA         L_Next_cyle379
	DECFSZ      R11, 1, 1
	BRA         L_Next_cyle379
;Control_Fn.c,1739 :: 		Cycle_exit=1;
	MOVLW       1
	MOVWF       Next_cyle_Cycle_exit_L0+0 
;Control_Fn.c,1740 :: 		Shift_value=0;
	CLRF        _Shift_value+0 
;Control_Fn.c,1741 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_Next_cyle380:
	DECFSZ      R13, 1, 1
	BRA         L_Next_cyle380
	DECFSZ      R12, 1, 1
	BRA         L_Next_cyle380
	DECFSZ      R11, 1, 1
	BRA         L_Next_cyle380
	NOP
	NOP
;Control_Fn.c,1743 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_Next_cyle381:
	DECFSZ      R13, 1, 1
	BRA         L_Next_cyle381
	DECFSZ      R12, 1, 1
	BRA         L_Next_cyle381
	DECFSZ      R11, 1, 1
	BRA         L_Next_cyle381
	NOP
	NOP
;Control_Fn.c,1744 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1745 :: 		T6963C_Write_Text_Adv_ROM("ALL LOOMS RESET DONE",80,32);
	MOVLW       ?lstr_150_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_150_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_150_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       32
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1746 :: 		T6963C_Write_Text_Adv_ROM("SHIFT CHANGED",80,48);
	MOVLW       ?lstr_151_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_151_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_151_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       48
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1747 :: 		GLCD_Print_Int_With_LeadingZero ( (Shift_value+1),112,64);
	MOVF        _Shift_value+0, 0 
	ADDLW       1
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       112
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       64
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1748 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_Next_cyle382:
	DECFSZ      R13, 1, 1
	BRA         L_Next_cyle382
	DECFSZ      R12, 1, 1
	BRA         L_Next_cyle382
	DECFSZ      R11, 1, 1
	BRA         L_Next_cyle382
	NOP
;Control_Fn.c,1750 :: 		}
L_Next_cyle378:
;Control_Fn.c,1752 :: 		}
	GOTO        L_Next_cyle366
L_Next_cyle367:
;Control_Fn.c,1753 :: 		}
L_end_Next_cyle:
	RETURN      0
; end of _Next_cyle

_Set_Date_Time_Rtc:

;Control_Fn.c,1756 :: 		void Set_Date_Time_Rtc(void)
;Control_Fn.c,1759 :: 		unsigned char Reset_loop=0,ColourExit2=0,item=0,SplFlag=0;
	CLRF        Set_Date_Time_Rtc_ColourExit2_L0+0 
;Control_Fn.c,1763 :: 		while(ColourExit2==0)
L_Set_Date_Time_Rtc383:
	MOVF        Set_Date_Time_Rtc_ColourExit2_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Set_Date_Time_Rtc384
;Control_Fn.c,1769 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1770 :: 		T6963C_Write_Text_Adv_ROM("DATE MONTHS YEAR",56,36);
	MOVLW       ?lstr_152_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_152_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_152_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       36
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1771 :: 		delay_ms(500);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_Set_Date_Time_Rtc385:
	DECFSZ      R13, 1, 1
	BRA         L_Set_Date_Time_Rtc385
	DECFSZ      R12, 1, 1
	BRA         L_Set_Date_Time_Rtc385
	DECFSZ      R11, 1, 1
	BRA         L_Set_Date_Time_Rtc385
;Control_Fn.c,1773 :: 		Date=Read_RTC(4);
	MOVLW       4
	MOVWF       FARG_Read_RTC_rAddr+0 
	CALL        _Read_RTC+0, 0
	MOVF        R0, 0 
	MOVWF       _Date+0 
;Control_Fn.c,1774 :: 		Month=Read_RTC(5);
	MOVLW       5
	MOVWF       FARG_Read_RTC_rAddr+0 
	CALL        _Read_RTC+0, 0
	MOVF        R0, 0 
	MOVWF       _Month+0 
;Control_Fn.c,1775 :: 		Year=Read_RTC(6);
	MOVLW       6
	MOVWF       FARG_Read_RTC_rAddr+0 
	CALL        _Read_RTC+0, 0
	MOVF        R0, 0 
	MOVWF       _Year+0 
;Control_Fn.c,1777 :: 		GLCD_Print_Int_With_LeadingZero (Date,64,64);
	MOVF        _Date+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       64
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       64
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1782 :: 		GLCD_Print_Int_With_LeadingZero (Month,112,64);
	MOVF        _Month+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       112
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       64
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1787 :: 		GLCD_Print_Int_With_LeadingZero (Year,156,64);
	MOVF        _Year+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       156
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       64
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1791 :: 		delay_ms(1500);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_Set_Date_Time_Rtc386:
	DECFSZ      R13, 1, 1
	BRA         L_Set_Date_Time_Rtc386
	DECFSZ      R12, 1, 1
	BRA         L_Set_Date_Time_Rtc386
	DECFSZ      R11, 1, 1
	BRA         L_Set_Date_Time_Rtc386
	NOP
	NOP
;Control_Fn.c,1794 :: 		Increment_Decerement(&Date,31,64,64);
	MOVLW       _Date+0
	MOVWF       FARG_Increment_Decerement_var+0 
	MOVLW       hi_addr(_Date+0)
	MOVWF       FARG_Increment_Decerement_var+1 
	MOVLW       31
	MOVWF       FARG_Increment_Decerement_limit+0 
	MOVLW       64
	MOVWF       FARG_Increment_Decerement_Pos_x+0 
	MOVLW       64
	MOVWF       FARG_Increment_Decerement_Pos_y+0 
	CALL        _Increment_Decerement+0, 0
;Control_Fn.c,1795 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Set_Date_Time_Rtc387:
	DECFSZ      R13, 1, 1
	BRA         L_Set_Date_Time_Rtc387
	DECFSZ      R12, 1, 1
	BRA         L_Set_Date_Time_Rtc387
	DECFSZ      R11, 1, 1
	BRA         L_Set_Date_Time_Rtc387
	NOP
;Control_Fn.c,1796 :: 		Increment_Decerement(&Month,12,112,64);
	MOVLW       _Month+0
	MOVWF       FARG_Increment_Decerement_var+0 
	MOVLW       hi_addr(_Month+0)
	MOVWF       FARG_Increment_Decerement_var+1 
	MOVLW       12
	MOVWF       FARG_Increment_Decerement_limit+0 
	MOVLW       112
	MOVWF       FARG_Increment_Decerement_Pos_x+0 
	MOVLW       64
	MOVWF       FARG_Increment_Decerement_Pos_y+0 
	CALL        _Increment_Decerement+0, 0
;Control_Fn.c,1797 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Set_Date_Time_Rtc388:
	DECFSZ      R13, 1, 1
	BRA         L_Set_Date_Time_Rtc388
	DECFSZ      R12, 1, 1
	BRA         L_Set_Date_Time_Rtc388
	DECFSZ      R11, 1, 1
	BRA         L_Set_Date_Time_Rtc388
	NOP
;Control_Fn.c,1798 :: 		Increment_Decerement(&Year,99,156,64);
	MOVLW       _Year+0
	MOVWF       FARG_Increment_Decerement_var+0 
	MOVLW       hi_addr(_Year+0)
	MOVWF       FARG_Increment_Decerement_var+1 
	MOVLW       99
	MOVWF       FARG_Increment_Decerement_limit+0 
	MOVLW       156
	MOVWF       FARG_Increment_Decerement_Pos_x+0 
	MOVLW       64
	MOVWF       FARG_Increment_Decerement_Pos_y+0 
	CALL        _Increment_Decerement+0, 0
;Control_Fn.c,1799 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Set_Date_Time_Rtc389:
	DECFSZ      R13, 1, 1
	BRA         L_Set_Date_Time_Rtc389
	DECFSZ      R12, 1, 1
	BRA         L_Set_Date_Time_Rtc389
	DECFSZ      R11, 1, 1
	BRA         L_Set_Date_Time_Rtc389
	NOP
;Control_Fn.c,1801 :: 		Write_RTC(4,Date);
	MOVLW       4
	MOVWF       FARG_Write_RTC_wAddr+0 
	MOVF        _Date+0, 0 
	MOVWF       FARG_Write_RTC_wData+0 
	CALL        _Write_RTC+0, 0
;Control_Fn.c,1802 :: 		Write_RTC(5,Month);
	MOVLW       5
	MOVWF       FARG_Write_RTC_wAddr+0 
	MOVF        _Month+0, 0 
	MOVWF       FARG_Write_RTC_wData+0 
	CALL        _Write_RTC+0, 0
;Control_Fn.c,1803 :: 		Write_RTC(6,Year);
	MOVLW       6
	MOVWF       FARG_Write_RTC_wAddr+0 
	MOVF        _Year+0, 0 
	MOVWF       FARG_Write_RTC_wData+0 
	CALL        _Write_RTC+0, 0
;Control_Fn.c,1805 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1806 :: 		T6963C_Write_Text_Adv_ROM("HOUR MINUTES SECONDS",56,36);
	MOVLW       ?lstr_153_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_153_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_153_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       56
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       36
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,1807 :: 		delay_ms(1500);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_Set_Date_Time_Rtc390:
	DECFSZ      R13, 1, 1
	BRA         L_Set_Date_Time_Rtc390
	DECFSZ      R12, 1, 1
	BRA         L_Set_Date_Time_Rtc390
	DECFSZ      R11, 1, 1
	BRA         L_Set_Date_Time_Rtc390
	NOP
	NOP
;Control_Fn.c,1809 :: 		Hour=Read_RTC(2);
	MOVLW       2
	MOVWF       FARG_Read_RTC_rAddr+0 
	CALL        _Read_RTC+0, 0
	MOVF        R0, 0 
	MOVWF       _Hour+0 
;Control_Fn.c,1810 :: 		Min=Read_RTC(1);
	MOVLW       1
	MOVWF       FARG_Read_RTC_rAddr+0 
	CALL        _Read_RTC+0, 0
	MOVF        R0, 0 
	MOVWF       _Min+0 
;Control_Fn.c,1811 :: 		Sec=Read_RTC(0);
	CLRF        FARG_Read_RTC_rAddr+0 
	CALL        _Read_RTC+0, 0
	MOVF        R0, 0 
	MOVWF       _Sec+0 
;Control_Fn.c,1813 :: 		GLCD_Print_Int_With_LeadingZero (Hour,64,64);
	MOVF        _Hour+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       64
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       64
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1816 :: 		GLCD_Print_Int_With_LeadingZero(Min,112,64);
	MOVF        _Min+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       112
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       64
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1821 :: 		GLCD_Print_Int_With_LeadingZero(Sec,168,64);
	MOVF        _Sec+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       168
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       64
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1826 :: 		Increment_Decerement(&Hour,24,64,64);
	MOVLW       _Hour+0
	MOVWF       FARG_Increment_Decerement_var+0 
	MOVLW       hi_addr(_Hour+0)
	MOVWF       FARG_Increment_Decerement_var+1 
	MOVLW       24
	MOVWF       FARG_Increment_Decerement_limit+0 
	MOVLW       64
	MOVWF       FARG_Increment_Decerement_Pos_x+0 
	MOVLW       64
	MOVWF       FARG_Increment_Decerement_Pos_y+0 
	CALL        _Increment_Decerement+0, 0
;Control_Fn.c,1827 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Set_Date_Time_Rtc391:
	DECFSZ      R13, 1, 1
	BRA         L_Set_Date_Time_Rtc391
	DECFSZ      R12, 1, 1
	BRA         L_Set_Date_Time_Rtc391
	DECFSZ      R11, 1, 1
	BRA         L_Set_Date_Time_Rtc391
	NOP
;Control_Fn.c,1828 :: 		Increment_Decerement(&Min,59,112,64);
	MOVLW       _Min+0
	MOVWF       FARG_Increment_Decerement_var+0 
	MOVLW       hi_addr(_Min+0)
	MOVWF       FARG_Increment_Decerement_var+1 
	MOVLW       59
	MOVWF       FARG_Increment_Decerement_limit+0 
	MOVLW       112
	MOVWF       FARG_Increment_Decerement_Pos_x+0 
	MOVLW       64
	MOVWF       FARG_Increment_Decerement_Pos_y+0 
	CALL        _Increment_Decerement+0, 0
;Control_Fn.c,1829 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Set_Date_Time_Rtc392:
	DECFSZ      R13, 1, 1
	BRA         L_Set_Date_Time_Rtc392
	DECFSZ      R12, 1, 1
	BRA         L_Set_Date_Time_Rtc392
	DECFSZ      R11, 1, 1
	BRA         L_Set_Date_Time_Rtc392
	NOP
;Control_Fn.c,1830 :: 		Increment_Decerement(&Sec,59,168,64);
	MOVLW       _Sec+0
	MOVWF       FARG_Increment_Decerement_var+0 
	MOVLW       hi_addr(_Sec+0)
	MOVWF       FARG_Increment_Decerement_var+1 
	MOVLW       59
	MOVWF       FARG_Increment_Decerement_limit+0 
	MOVLW       168
	MOVWF       FARG_Increment_Decerement_Pos_x+0 
	MOVLW       64
	MOVWF       FARG_Increment_Decerement_Pos_y+0 
	CALL        _Increment_Decerement+0, 0
;Control_Fn.c,1831 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Set_Date_Time_Rtc393:
	DECFSZ      R13, 1, 1
	BRA         L_Set_Date_Time_Rtc393
	DECFSZ      R12, 1, 1
	BRA         L_Set_Date_Time_Rtc393
	DECFSZ      R11, 1, 1
	BRA         L_Set_Date_Time_Rtc393
	NOP
;Control_Fn.c,1833 :: 		Write_RTC(2,Hour);
	MOVLW       2
	MOVWF       FARG_Write_RTC_wAddr+0 
	MOVF        _Hour+0, 0 
	MOVWF       FARG_Write_RTC_wData+0 
	CALL        _Write_RTC+0, 0
;Control_Fn.c,1834 :: 		Write_RTC(1,Min);
	MOVLW       1
	MOVWF       FARG_Write_RTC_wAddr+0 
	MOVF        _Min+0, 0 
	MOVWF       FARG_Write_RTC_wData+0 
	CALL        _Write_RTC+0, 0
;Control_Fn.c,1835 :: 		Write_RTC(0,Sec);
	CLRF        FARG_Write_RTC_wAddr+0 
	MOVF        _Sec+0, 0 
	MOVWF       FARG_Write_RTC_wData+0 
	CALL        _Write_RTC+0, 0
;Control_Fn.c,1837 :: 		ColourExit2=1;
	MOVLW       1
	MOVWF       Set_Date_Time_Rtc_ColourExit2_L0+0 
;Control_Fn.c,1839 :: 		}
	GOTO        L_Set_Date_Time_Rtc383
L_Set_Date_Time_Rtc384:
;Control_Fn.c,1841 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_Set_Date_Time_Rtc394:
	DECFSZ      R13, 1, 1
	BRA         L_Set_Date_Time_Rtc394
	DECFSZ      R12, 1, 1
	BRA         L_Set_Date_Time_Rtc394
	DECFSZ      R11, 1, 1
	BRA         L_Set_Date_Time_Rtc394
	NOP
;Control_Fn.c,1842 :: 		}
L_end_Set_Date_Time_Rtc:
	RETURN      0
; end of _Set_Date_Time_Rtc

_Read_Date_Time_Rtc:

;Control_Fn.c,1844 :: 		void Read_Date_Time_Rtc(void)
;Control_Fn.c,1846 :: 		Hour  =Read_RTC(2);
	MOVLW       2
	MOVWF       FARG_Read_RTC_rAddr+0 
	CALL        _Read_RTC+0, 0
	MOVF        R0, 0 
	MOVWF       _Hour+0 
;Control_Fn.c,1847 :: 		Min   =Read_RTC(1);
	MOVLW       1
	MOVWF       FARG_Read_RTC_rAddr+0 
	CALL        _Read_RTC+0, 0
	MOVF        R0, 0 
	MOVWF       _Min+0 
;Control_Fn.c,1848 :: 		Date  =Read_RTC(4);
	MOVLW       4
	MOVWF       FARG_Read_RTC_rAddr+0 
	CALL        _Read_RTC+0, 0
	MOVF        R0, 0 
	MOVWF       _Date+0 
;Control_Fn.c,1849 :: 		Month =Read_RTC(5);
	MOVLW       5
	MOVWF       FARG_Read_RTC_rAddr+0 
	CALL        _Read_RTC+0, 0
	MOVF        R0, 0 
	MOVWF       _Month+0 
;Control_Fn.c,1850 :: 		Year  =Read_RTC(6);
	MOVLW       6
	MOVWF       FARG_Read_RTC_rAddr+0 
	CALL        _Read_RTC+0, 0
	MOVF        R0, 0 
	MOVWF       _Year+0 
;Control_Fn.c,1851 :: 		delay_ms(400);
	MOVLW       33
	MOVWF       R11, 0
	MOVLW       120
	MOVWF       R12, 0
	MOVLW       152
	MOVWF       R13, 0
L_Read_Date_Time_Rtc395:
	DECFSZ      R13, 1, 1
	BRA         L_Read_Date_Time_Rtc395
	DECFSZ      R12, 1, 1
	BRA         L_Read_Date_Time_Rtc395
	DECFSZ      R11, 1, 1
	BRA         L_Read_Date_Time_Rtc395
	NOP
;Control_Fn.c,1853 :: 		}
L_end_Read_Date_Time_Rtc:
	RETURN      0
; end of _Read_Date_Time_Rtc

_Read_Shift_Date_Time:

;Control_Fn.c,1854 :: 		void Read_Shift_Date_Time(unsigned char Shift_no )
;Control_Fn.c,1857 :: 		Hour  =EEPROM_AT24C32_RdByte((Date_Time_addr+(5*(Shift_no-1))+0));
	DECF        FARG_Read_Shift_Date_Time_Shift_no+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       5
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       0
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdByte_rAddr+0 
	MOVLW       13
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdByte_rAddr+1 
	CALL        _EEPROM_AT24C32_RdByte+0, 0
	MOVF        R0, 0 
	MOVWF       _Hour+0 
;Control_Fn.c,1858 :: 		Min   =EEPROM_AT24C32_RdByte((Date_Time_addr+(5*(Shift_no-1)+1)));
	DECF        FARG_Read_Shift_Date_Time_Shift_no+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       5
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	INFSNZ      R0, 1 
	INCF        R1, 1 
	MOVLW       0
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdByte_rAddr+0 
	MOVLW       13
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdByte_rAddr+1 
	CALL        _EEPROM_AT24C32_RdByte+0, 0
	MOVF        R0, 0 
	MOVWF       _Min+0 
;Control_Fn.c,1859 :: 		Date  =EEPROM_AT24C32_RdByte((Date_Time_addr+(5*(Shift_no-1)+2)));
	DECF        FARG_Read_Shift_Date_Time_Shift_no+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       5
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       2
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       0
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdByte_rAddr+0 
	MOVLW       13
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdByte_rAddr+1 
	CALL        _EEPROM_AT24C32_RdByte+0, 0
	MOVF        R0, 0 
	MOVWF       _Date+0 
;Control_Fn.c,1860 :: 		Month =EEPROM_AT24C32_RdByte((Date_Time_addr+(5*(Shift_no-1)+3)));
	DECF        FARG_Read_Shift_Date_Time_Shift_no+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       5
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       3
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       0
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdByte_rAddr+0 
	MOVLW       13
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdByte_rAddr+1 
	CALL        _EEPROM_AT24C32_RdByte+0, 0
	MOVF        R0, 0 
	MOVWF       _Month+0 
;Control_Fn.c,1861 :: 		Year  =EEPROM_AT24C32_RdByte((Date_Time_addr+(5*(Shift_no-1)+4)));
	DECF        FARG_Read_Shift_Date_Time_Shift_no+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       5
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       4
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       0
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdByte_rAddr+0 
	MOVLW       13
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdByte_rAddr+1 
	CALL        _EEPROM_AT24C32_RdByte+0, 0
	MOVF        R0, 0 
	MOVWF       _Year+0 
;Control_Fn.c,1862 :: 		delay_ms(400);
	MOVLW       33
	MOVWF       R11, 0
	MOVLW       120
	MOVWF       R12, 0
	MOVLW       152
	MOVWF       R13, 0
L_Read_Shift_Date_Time396:
	DECFSZ      R13, 1, 1
	BRA         L_Read_Shift_Date_Time396
	DECFSZ      R12, 1, 1
	BRA         L_Read_Shift_Date_Time396
	DECFSZ      R11, 1, 1
	BRA         L_Read_Shift_Date_Time396
	NOP
;Control_Fn.c,1863 :: 		}
L_end_Read_Shift_Date_Time:
	RETURN      0
; end of _Read_Shift_Date_Time

_Factory_Reset:

;Control_Fn.c,1865 :: 		void Factory_Reset(void)
;Control_Fn.c,1867 :: 		Power_up_bit=0;
	BCF         _Power_up_bit+0, BitPos(_Power_up_bit+0) 
;Control_Fn.c,1868 :: 		if(Power_up_bit==0)
	BTFSC       _Power_up_bit+0, BitPos(_Power_up_bit+0) 
	GOTO        L_Factory_Reset397
;Control_Fn.c,1870 :: 		EEPROM_Write(First_Time_addr,0xFF);
	MOVLW       15
	MOVWF       FARG_Eeprom_Write_address+0 
	MOVLW       0
	MOVWF       FARG_Eeprom_Write_address+1 
	MOVLW       255
	MOVWF       FARG_Eeprom_Write_data_+0 
	CALL        _Eeprom_Write+0, 0
;Control_Fn.c,1871 :: 		LOAD_EEPROM_Param(void);
	CALL        _LOAD_EEPROM_Param+0, 0
;Control_Fn.c,1872 :: 		Power_up_bit=1;
	BSF         _Power_up_bit+0, BitPos(_Power_up_bit+0) 
;Control_Fn.c,1873 :: 		}
L_Factory_Reset397:
;Control_Fn.c,1874 :: 		}
L_end_Factory_Reset:
	RETURN      0
; end of _Factory_Reset

_Increment_Decerement:

;Control_Fn.c,1877 :: 		void Increment_Decerement(unsigned char *var,unsigned char limit,unsigned char Pos_x,unsigned char Pos_y)
;Control_Fn.c,1880 :: 		unsigned char dummy=0,dummy1=0xFF;
	CLRF        Increment_Decerement_dummy_L0+0 
	MOVLW       255
	MOVWF       Increment_Decerement_dummy1_L0+0 
	CLRF        Increment_Decerement_list_L0+0 
	CLRF        Increment_Decerement_increment_exit_L0+0 
;Control_Fn.c,1886 :: 		T6963C_Cursor(1);
	BSF         _T6963C_display+0, 1 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Control_Fn.c,1887 :: 		T6963C_Cursor_Blink(1);
	BSF         _T6963C_display+0, 0 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Control_Fn.c,1889 :: 		cposx= (Pos_x/8)+3;
	MOVF        FARG_Increment_Decerement_Pos_x+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       _cposx+0 
;Control_Fn.c,1890 :: 		cposy= (Pos_y/8);
	MOVF        FARG_Increment_Decerement_Pos_y+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVF        R0, 0 
	MOVWF       _cposy+0 
;Control_Fn.c,1891 :: 		T6963C_set_cursor(cposx,cposy);
	MOVF        R2, 0 
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVF        R0, 0 
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,1893 :: 		while((list==0)&&(increment_exit==0))
L_Increment_Decerement398:
	MOVF        Increment_Decerement_list_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Increment_Decerement399
	MOVF        Increment_Decerement_increment_exit_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Increment_Decerement399
L__Increment_Decerement683:
;Control_Fn.c,1895 :: 		asm CLRWDT;
	CLRWDT
;Control_Fn.c,1897 :: 		if((Start==0) && (*var<limit))
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Increment_Decerement404
	MOVFF       FARG_Increment_Decerement_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_var+1, FSR0H+0
	MOVF        FARG_Increment_Decerement_limit+0, 0 
	SUBWF       POSTINC0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Increment_Decerement404
L__Increment_Decerement682:
;Control_Fn.c,1899 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_Increment_Decerement405:
	DECFSZ      R13, 1, 1
	BRA         L_Increment_Decerement405
	DECFSZ      R12, 1, 1
	BRA         L_Increment_Decerement405
	DECFSZ      R11, 1, 1
	BRA         L_Increment_Decerement405
	NOP
	NOP
;Control_Fn.c,1900 :: 		if(*var<=240)
	MOVFF       FARG_Increment_Decerement_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	SUBLW       240
	BTFSS       STATUS+0, 0 
	GOTO        L_Increment_Decerement406
;Control_Fn.c,1903 :: 		*var=*var+10;
	MOVFF       FARG_Increment_Decerement_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_var+1, FSR0H+0
	MOVFF       FARG_Increment_Decerement_var+0, FSR1L+0
	MOVFF       FARG_Increment_Decerement_var+1, FSR1H+0
	MOVLW       10
	ADDWF       POSTINC0+0, 1 
;Control_Fn.c,1904 :: 		T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
	MOVLW       10
	SUBWF       FARG_Increment_Decerement_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_x0+1, 1 
	MOVF        FARG_Increment_Decerement_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVF        FARG_Increment_Decerement_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       24
	ADDWF       FARG_T6963C_box_x1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_x1+1, 1 
	MOVLW       9
	ADDWF       FARG_Increment_Decerement_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,1905 :: 		GLCD_Print_Int_With_LeadingZero(dummy,Pos_x,Pos_y);
	MOVF        Increment_Decerement_dummy_L0+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVF        FARG_Increment_Decerement_Pos_x+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVF        FARG_Increment_Decerement_Pos_y+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1911 :: 		dummy1=dummy;
	MOVF        Increment_Decerement_dummy_L0+0, 0 
	MOVWF       Increment_Decerement_dummy1_L0+0 
;Control_Fn.c,1912 :: 		}
	GOTO        L_Increment_Decerement407
L_Increment_Decerement406:
;Control_Fn.c,1915 :: 		*var=limit;
	MOVFF       FARG_Increment_Decerement_var+0, FSR1L+0
	MOVFF       FARG_Increment_Decerement_var+1, FSR1H+0
	MOVF        FARG_Increment_Decerement_limit+0, 0 
	MOVWF       POSTINC1+0 
;Control_Fn.c,1916 :: 		T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
	MOVLW       10
	SUBWF       FARG_Increment_Decerement_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_x0+1, 1 
	MOVF        FARG_Increment_Decerement_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVF        FARG_Increment_Decerement_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       24
	ADDWF       FARG_T6963C_box_x1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_x1+1, 1 
	MOVLW       9
	ADDWF       FARG_Increment_Decerement_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,1917 :: 		GLCD_Print_Int_With_LeadingZero(dummy ,Pos_x,Pos_y);
	MOVF        Increment_Decerement_dummy_L0+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVF        FARG_Increment_Decerement_Pos_x+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVF        FARG_Increment_Decerement_Pos_y+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1922 :: 		dummy1=dummy;
	MOVF        Increment_Decerement_dummy_L0+0, 0 
	MOVWF       Increment_Decerement_dummy1_L0+0 
;Control_Fn.c,1923 :: 		}
L_Increment_Decerement407:
;Control_Fn.c,1925 :: 		if(*var>=limit)
	MOVFF       FARG_Increment_Decerement_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_var+1, FSR0H+0
	MOVF        FARG_Increment_Decerement_limit+0, 0 
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Increment_Decerement408
;Control_Fn.c,1926 :: 		*var=limit;
	MOVFF       FARG_Increment_Decerement_var+0, FSR1L+0
	MOVFF       FARG_Increment_Decerement_var+1, FSR1H+0
	MOVF        FARG_Increment_Decerement_limit+0, 0 
	MOVWF       POSTINC1+0 
L_Increment_Decerement408:
;Control_Fn.c,1927 :: 		}
L_Increment_Decerement404:
;Control_Fn.c,1929 :: 		if((Stop==0)&&(*var>0)&&(Start==1))
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_Increment_Decerement411
	MOVFF       FARG_Increment_Decerement_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Increment_Decerement411
	BTFSS       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Increment_Decerement411
L__Increment_Decerement681:
;Control_Fn.c,1932 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_Increment_Decerement412:
	DECFSZ      R13, 1, 1
	BRA         L_Increment_Decerement412
	DECFSZ      R12, 1, 1
	BRA         L_Increment_Decerement412
	DECFSZ      R11, 1, 1
	BRA         L_Increment_Decerement412
	NOP
	NOP
;Control_Fn.c,1933 :: 		*var=*var-1;
	MOVFF       FARG_Increment_Decerement_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_var+1, FSR0H+0
	MOVFF       FARG_Increment_Decerement_var+0, FSR1L+0
	MOVFF       FARG_Increment_Decerement_var+1, FSR1H+0
	DECF        POSTINC1+0, 1 
;Control_Fn.c,1936 :: 		T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
	MOVLW       10
	SUBWF       FARG_Increment_Decerement_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_x0+1, 1 
	MOVF        FARG_Increment_Decerement_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVF        FARG_Increment_Decerement_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       24
	ADDWF       FARG_T6963C_box_x1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_x1+1, 1 
	MOVLW       9
	ADDWF       FARG_Increment_Decerement_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,1937 :: 		GLCD_Print_Int_With_LeadingZero(dummy,Pos_x,Pos_y);
	MOVF        Increment_Decerement_dummy_L0+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVF        FARG_Increment_Decerement_Pos_x+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVF        FARG_Increment_Decerement_Pos_y+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1943 :: 		dummy1=dummy;
	MOVF        Increment_Decerement_dummy_L0+0, 0 
	MOVWF       Increment_Decerement_dummy1_L0+0 
;Control_Fn.c,1944 :: 		}
L_Increment_Decerement411:
;Control_Fn.c,1946 :: 		if((Reverse==0)&&(*var>0)&&(Start==1))
	BTFSC       RE7_bit+0, BitPos(RE7_bit+0) 
	GOTO        L_Increment_Decerement415
	MOVFF       FARG_Increment_Decerement_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Increment_Decerement415
	BTFSS       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Increment_Decerement415
L__Increment_Decerement680:
;Control_Fn.c,1949 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_Increment_Decerement416:
	DECFSZ      R13, 1, 1
	BRA         L_Increment_Decerement416
	DECFSZ      R12, 1, 1
	BRA         L_Increment_Decerement416
	DECFSZ      R11, 1, 1
	BRA         L_Increment_Decerement416
	NOP
	NOP
;Control_Fn.c,1950 :: 		*var=0;
	MOVFF       FARG_Increment_Decerement_var+0, FSR1L+0
	MOVFF       FARG_Increment_Decerement_var+1, FSR1H+0
	CLRF        POSTINC1+0 
;Control_Fn.c,1953 :: 		T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
	MOVLW       10
	SUBWF       FARG_Increment_Decerement_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_x0+1, 1 
	MOVF        FARG_Increment_Decerement_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVF        FARG_Increment_Decerement_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       24
	ADDWF       FARG_T6963C_box_x1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_x1+1, 1 
	MOVLW       9
	ADDWF       FARG_Increment_Decerement_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,1954 :: 		GLCD_Print_Int_With_LeadingZero(dummy,Pos_x,Pos_y);
	MOVF        Increment_Decerement_dummy_L0+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVF        FARG_Increment_Decerement_Pos_x+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVF        FARG_Increment_Decerement_Pos_y+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1960 :: 		dummy1=dummy;
	MOVF        Increment_Decerement_dummy_L0+0, 0 
	MOVWF       Increment_Decerement_dummy1_L0+0 
;Control_Fn.c,1962 :: 		}
L_Increment_Decerement415:
;Control_Fn.c,1963 :: 		if(Set==0)
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Increment_Decerement417
;Control_Fn.c,1965 :: 		T6963C_Cursor(0);
	BCF         _T6963C_display+0, 1 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Control_Fn.c,1966 :: 		ColourExit++;
	INCF        _ColourExit+0, 1 
;Control_Fn.c,1967 :: 		list=1;
	MOVLW       1
	MOVWF       Increment_Decerement_list_L0+0 
;Control_Fn.c,1968 :: 		increment_exit=1;
	MOVLW       1
	MOVWF       Increment_Decerement_increment_exit_L0+0 
;Control_Fn.c,1969 :: 		delay_ms(350);
	MOVLW       29
	MOVWF       R11, 0
	MOVLW       105
	MOVWF       R12, 0
	MOVLW       165
	MOVWF       R13, 0
L_Increment_Decerement418:
	DECFSZ      R13, 1, 1
	BRA         L_Increment_Decerement418
	DECFSZ      R12, 1, 1
	BRA         L_Increment_Decerement418
	DECFSZ      R11, 1, 1
	BRA         L_Increment_Decerement418
;Control_Fn.c,1970 :: 		while(Set==0);
L_Increment_Decerement419:
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Increment_Decerement420
	GOTO        L_Increment_Decerement419
L_Increment_Decerement420:
;Control_Fn.c,1971 :: 		delay_ms(350);
	MOVLW       29
	MOVWF       R11, 0
	MOVLW       105
	MOVWF       R12, 0
	MOVLW       165
	MOVWF       R13, 0
L_Increment_Decerement421:
	DECFSZ      R13, 1, 1
	BRA         L_Increment_Decerement421
	DECFSZ      R12, 1, 1
	BRA         L_Increment_Decerement421
	DECFSZ      R11, 1, 1
	BRA         L_Increment_Decerement421
;Control_Fn.c,1972 :: 		return;
	GOTO        L_end_Increment_Decerement
;Control_Fn.c,1973 :: 		}
L_Increment_Decerement417:
;Control_Fn.c,1975 :: 		dummy=*var;
	MOVFF       FARG_Increment_Decerement_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       Increment_Decerement_dummy_L0+0 
;Control_Fn.c,1977 :: 		if((dummy!=dummy1) || (dummy1==0xFFFF))
	MOVF        R1, 0 
	XORWF       Increment_Decerement_dummy1_L0+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Increment_Decerement679
	MOVLW       0
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L__Increment_Decerement731
	MOVLW       255
	XORWF       Increment_Decerement_dummy1_L0+0, 0 
L__Increment_Decerement731:
	BTFSC       STATUS+0, 2 
	GOTO        L__Increment_Decerement679
	GOTO        L_Increment_Decerement424
L__Increment_Decerement679:
;Control_Fn.c,1979 :: 		T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
	MOVLW       10
	SUBWF       FARG_Increment_Decerement_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_x0+1, 1 
	MOVF        FARG_Increment_Decerement_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVF        FARG_Increment_Decerement_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       24
	ADDWF       FARG_T6963C_box_x1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_x1+1, 1 
	MOVLW       9
	ADDWF       FARG_Increment_Decerement_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,1980 :: 		GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);
	MOVF        Increment_Decerement_dummy_L0+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVF        FARG_Increment_Decerement_Pos_x+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVF        FARG_Increment_Decerement_Pos_y+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,1985 :: 		dummy1=dummy;
	MOVF        Increment_Decerement_dummy_L0+0, 0 
	MOVWF       Increment_Decerement_dummy1_L0+0 
;Control_Fn.c,1986 :: 		}
L_Increment_Decerement424:
;Control_Fn.c,1987 :: 		}
	GOTO        L_Increment_Decerement398
L_Increment_Decerement399:
;Control_Fn.c,1988 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,1989 :: 		}
L_end_Increment_Decerement:
	RETURN      0
; end of _Increment_Decerement

_Increment_Decerement_Char:

;Control_Fn.c,1992 :: 		void Increment_Decerement_Char(unsigned char *var,unsigned char limit,unsigned char Pos_x,unsigned char Pos_y)
;Control_Fn.c,1995 :: 		unsigned char dummy=0,dummy1=0xFF;
	CLRF        Increment_Decerement_Char_dummy_L0+0 
	MOVLW       255
	MOVWF       Increment_Decerement_Char_dummy1_L0+0 
	CLRF        Increment_Decerement_Char_list_L0+0 
	CLRF        Increment_Decerement_Char_increment_exit_L0+0 
;Control_Fn.c,2000 :: 		T6963C_Cursor(1);
	BSF         _T6963C_display+0, 1 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Control_Fn.c,2001 :: 		T6963C_Cursor_Blink(1);
	BSF         _T6963C_display+0, 0 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Control_Fn.c,2003 :: 		cposx= (Pos_x/8)+3;
	MOVF        FARG_Increment_Decerement_Char_Pos_x+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       _cposx+0 
;Control_Fn.c,2004 :: 		cposy= (Pos_y/8);
	MOVF        FARG_Increment_Decerement_Char_Pos_y+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVF        R0, 0 
	MOVWF       _cposy+0 
;Control_Fn.c,2005 :: 		T6963C_set_cursor(cposx,cposy);
	MOVF        R2, 0 
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVF        R0, 0 
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,2008 :: 		while((list==0)&&(increment_exit==0))
L_Increment_Decerement_Char425:
	MOVF        Increment_Decerement_Char_list_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Increment_Decerement_Char426
	MOVF        Increment_Decerement_Char_increment_exit_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Increment_Decerement_Char426
L__Increment_Decerement_Char688:
;Control_Fn.c,2010 :: 		asm CLRWDT;
	CLRWDT
;Control_Fn.c,2011 :: 		if((Start==0) && (*var<limit))
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Increment_Decerement_Char431
	MOVFF       FARG_Increment_Decerement_Char_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Char_var+1, FSR0H+0
	MOVF        FARG_Increment_Decerement_Char_limit+0, 0 
	SUBWF       POSTINC0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Increment_Decerement_Char431
L__Increment_Decerement_Char687:
;Control_Fn.c,2013 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_Increment_Decerement_Char432:
	DECFSZ      R13, 1, 1
	BRA         L_Increment_Decerement_Char432
	DECFSZ      R12, 1, 1
	BRA         L_Increment_Decerement_Char432
	DECFSZ      R11, 1, 1
	BRA         L_Increment_Decerement_Char432
	NOP
	NOP
;Control_Fn.c,2015 :: 		if(*var<=240)
	MOVFF       FARG_Increment_Decerement_Char_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Char_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	SUBLW       240
	BTFSS       STATUS+0, 0 
	GOTO        L_Increment_Decerement_Char433
;Control_Fn.c,2017 :: 		*var=*var+10;
	MOVFF       FARG_Increment_Decerement_Char_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Char_var+1, FSR0H+0
	MOVFF       FARG_Increment_Decerement_Char_var+0, FSR1L+0
	MOVFF       FARG_Increment_Decerement_Char_var+1, FSR1H+0
	MOVLW       10
	ADDWF       POSTINC0+0, 1 
;Control_Fn.c,2019 :: 		T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
	MOVLW       10
	SUBWF       FARG_Increment_Decerement_Char_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_x0+1, 1 
	MOVF        FARG_Increment_Decerement_Char_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVF        FARG_Increment_Decerement_Char_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       24
	ADDWF       FARG_T6963C_box_x1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_x1+1, 1 
	MOVLW       9
	ADDWF       FARG_Increment_Decerement_Char_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2020 :: 		GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);
	MOVF        Increment_Decerement_Char_dummy_L0+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVF        FARG_Increment_Decerement_Char_Pos_x+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVF        FARG_Increment_Decerement_Char_Pos_y+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,2026 :: 		}
	GOTO        L_Increment_Decerement_Char434
L_Increment_Decerement_Char433:
;Control_Fn.c,2029 :: 		*var=limit;
	MOVFF       FARG_Increment_Decerement_Char_var+0, FSR1L+0
	MOVFF       FARG_Increment_Decerement_Char_var+1, FSR1H+0
	MOVF        FARG_Increment_Decerement_Char_limit+0, 0 
	MOVWF       POSTINC1+0 
;Control_Fn.c,2030 :: 		GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);
	MOVF        Increment_Decerement_Char_dummy_L0+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVF        FARG_Increment_Decerement_Char_Pos_x+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVF        FARG_Increment_Decerement_Char_Pos_y+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,2035 :: 		}
L_Increment_Decerement_Char434:
;Control_Fn.c,2037 :: 		if(*var>=limit)
	MOVFF       FARG_Increment_Decerement_Char_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Char_var+1, FSR0H+0
	MOVF        FARG_Increment_Decerement_Char_limit+0, 0 
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Increment_Decerement_Char435
;Control_Fn.c,2038 :: 		*var=limit;
	MOVFF       FARG_Increment_Decerement_Char_var+0, FSR1L+0
	MOVFF       FARG_Increment_Decerement_Char_var+1, FSR1H+0
	MOVF        FARG_Increment_Decerement_Char_limit+0, 0 
	MOVWF       POSTINC1+0 
L_Increment_Decerement_Char435:
;Control_Fn.c,2039 :: 		}
L_Increment_Decerement_Char431:
;Control_Fn.c,2040 :: 		if((Stop==0)&&(*var>0)&&(Start==1))
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_Increment_Decerement_Char438
	MOVFF       FARG_Increment_Decerement_Char_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Char_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Increment_Decerement_Char438
	BTFSS       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Increment_Decerement_Char438
L__Increment_Decerement_Char686:
;Control_Fn.c,2043 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_Increment_Decerement_Char439:
	DECFSZ      R13, 1, 1
	BRA         L_Increment_Decerement_Char439
	DECFSZ      R12, 1, 1
	BRA         L_Increment_Decerement_Char439
	DECFSZ      R11, 1, 1
	BRA         L_Increment_Decerement_Char439
	NOP
	NOP
;Control_Fn.c,2044 :: 		*var=*var-1;
	MOVFF       FARG_Increment_Decerement_Char_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Char_var+1, FSR0H+0
	MOVFF       FARG_Increment_Decerement_Char_var+0, FSR1L+0
	MOVFF       FARG_Increment_Decerement_Char_var+1, FSR1H+0
	DECF        POSTINC1+0, 1 
;Control_Fn.c,2046 :: 		T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
	MOVLW       10
	SUBWF       FARG_Increment_Decerement_Char_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_x0+1, 1 
	MOVF        FARG_Increment_Decerement_Char_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVF        FARG_Increment_Decerement_Char_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       24
	ADDWF       FARG_T6963C_box_x1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_x1+1, 1 
	MOVLW       9
	ADDWF       FARG_Increment_Decerement_Char_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2047 :: 		GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);
	MOVF        Increment_Decerement_Char_dummy_L0+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVF        FARG_Increment_Decerement_Char_Pos_x+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVF        FARG_Increment_Decerement_Char_Pos_y+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,2052 :: 		}
L_Increment_Decerement_Char438:
;Control_Fn.c,2055 :: 		if((Reverse==0)&&(*var>0)&&(Start==1))
	BTFSC       RE7_bit+0, BitPos(RE7_bit+0) 
	GOTO        L_Increment_Decerement_Char442
	MOVFF       FARG_Increment_Decerement_Char_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Char_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Increment_Decerement_Char442
	BTFSS       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Increment_Decerement_Char442
L__Increment_Decerement_Char685:
;Control_Fn.c,2058 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_Increment_Decerement_Char443:
	DECFSZ      R13, 1, 1
	BRA         L_Increment_Decerement_Char443
	DECFSZ      R12, 1, 1
	BRA         L_Increment_Decerement_Char443
	DECFSZ      R11, 1, 1
	BRA         L_Increment_Decerement_Char443
	NOP
	NOP
;Control_Fn.c,2059 :: 		*var=0;
	MOVFF       FARG_Increment_Decerement_Char_var+0, FSR1L+0
	MOVFF       FARG_Increment_Decerement_Char_var+1, FSR1H+0
	CLRF        POSTINC1+0 
;Control_Fn.c,2062 :: 		T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
	MOVLW       10
	SUBWF       FARG_Increment_Decerement_Char_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_x0+1, 1 
	MOVF        FARG_Increment_Decerement_Char_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVF        FARG_Increment_Decerement_Char_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       24
	ADDWF       FARG_T6963C_box_x1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_x1+1, 1 
	MOVLW       9
	ADDWF       FARG_Increment_Decerement_Char_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2063 :: 		GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);
	MOVF        Increment_Decerement_Char_dummy_L0+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVF        FARG_Increment_Decerement_Char_Pos_x+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVF        FARG_Increment_Decerement_Char_Pos_y+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,2068 :: 		dummy1=dummy;
	MOVF        Increment_Decerement_Char_dummy_L0+0, 0 
	MOVWF       Increment_Decerement_Char_dummy1_L0+0 
;Control_Fn.c,2070 :: 		}
L_Increment_Decerement_Char442:
;Control_Fn.c,2071 :: 		if(Set==0)
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Increment_Decerement_Char444
;Control_Fn.c,2073 :: 		T6963C_Cursor(0);
	BCF         _T6963C_display+0, 1 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Control_Fn.c,2074 :: 		ColourExit++;
	INCF        _ColourExit+0, 1 
;Control_Fn.c,2075 :: 		list=1;
	MOVLW       1
	MOVWF       Increment_Decerement_Char_list_L0+0 
;Control_Fn.c,2076 :: 		increment_exit=1;
	MOVLW       1
	MOVWF       Increment_Decerement_Char_increment_exit_L0+0 
;Control_Fn.c,2077 :: 		delay_ms(350);
	MOVLW       29
	MOVWF       R11, 0
	MOVLW       105
	MOVWF       R12, 0
	MOVLW       165
	MOVWF       R13, 0
L_Increment_Decerement_Char445:
	DECFSZ      R13, 1, 1
	BRA         L_Increment_Decerement_Char445
	DECFSZ      R12, 1, 1
	BRA         L_Increment_Decerement_Char445
	DECFSZ      R11, 1, 1
	BRA         L_Increment_Decerement_Char445
;Control_Fn.c,2078 :: 		while(Set==0);
L_Increment_Decerement_Char446:
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Increment_Decerement_Char447
	GOTO        L_Increment_Decerement_Char446
L_Increment_Decerement_Char447:
;Control_Fn.c,2079 :: 		delay_ms(350);
	MOVLW       29
	MOVWF       R11, 0
	MOVLW       105
	MOVWF       R12, 0
	MOVLW       165
	MOVWF       R13, 0
L_Increment_Decerement_Char448:
	DECFSZ      R13, 1, 1
	BRA         L_Increment_Decerement_Char448
	DECFSZ      R12, 1, 1
	BRA         L_Increment_Decerement_Char448
	DECFSZ      R11, 1, 1
	BRA         L_Increment_Decerement_Char448
;Control_Fn.c,2080 :: 		return;
	GOTO        L_end_Increment_Decerement_Char
;Control_Fn.c,2081 :: 		}
L_Increment_Decerement_Char444:
;Control_Fn.c,2084 :: 		dummy=*var;
	MOVFF       FARG_Increment_Decerement_Char_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Char_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       Increment_Decerement_Char_dummy_L0+0 
;Control_Fn.c,2086 :: 		if((dummy!=dummy1) || (dummy1==0xFFFF))
	MOVF        R1, 0 
	XORWF       Increment_Decerement_Char_dummy1_L0+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Increment_Decerement_Char684
	MOVLW       0
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L__Increment_Decerement_Char733
	MOVLW       255
	XORWF       Increment_Decerement_Char_dummy1_L0+0, 0 
L__Increment_Decerement_Char733:
	BTFSC       STATUS+0, 2 
	GOTO        L__Increment_Decerement_Char684
	GOTO        L_Increment_Decerement_Char451
L__Increment_Decerement_Char684:
;Control_Fn.c,2089 :: 		T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);
	MOVLW       10
	SUBWF       FARG_Increment_Decerement_Char_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_x0+1, 1 
	MOVF        FARG_Increment_Decerement_Char_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVF        FARG_Increment_Decerement_Char_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       24
	ADDWF       FARG_T6963C_box_x1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_x1+1, 1 
	MOVLW       9
	ADDWF       FARG_Increment_Decerement_Char_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2090 :: 		GLCD_Print_Int_With_LeadingZero (dummy,Pos_x,Pos_y);
	MOVF        Increment_Decerement_Char_dummy_L0+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVF        FARG_Increment_Decerement_Char_Pos_x+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVF        FARG_Increment_Decerement_Char_Pos_y+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,2096 :: 		dummy1=dummy;
	MOVF        Increment_Decerement_Char_dummy_L0+0, 0 
	MOVWF       Increment_Decerement_Char_dummy1_L0+0 
;Control_Fn.c,2097 :: 		}
L_Increment_Decerement_Char451:
;Control_Fn.c,2099 :: 		}
	GOTO        L_Increment_Decerement_Char425
L_Increment_Decerement_Char426:
;Control_Fn.c,2100 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,2101 :: 		}
L_end_Increment_Decerement_Char:
	RETURN      0
; end of _Increment_Decerement_Char

_Increment_Decerement_Float:

;Control_Fn.c,2105 :: 		void Increment_Decerement_Float(float *var, float limit,unsigned char Pos_x,unsigned char Pos_y)
;Control_Fn.c,2108 :: 		float dummy=0,dummy1=-9999.0;
	CLRF        Increment_Decerement_Float_dummy_L0+0 
	CLRF        Increment_Decerement_Float_dummy_L0+1 
	CLRF        Increment_Decerement_Float_dummy_L0+2 
	CLRF        Increment_Decerement_Float_dummy_L0+3 
	MOVLW       0
	MOVWF       Increment_Decerement_Float_dummy1_L0+0 
	MOVLW       60
	MOVWF       Increment_Decerement_Float_dummy1_L0+1 
	MOVLW       156
	MOVWF       Increment_Decerement_Float_dummy1_L0+2 
	MOVLW       140
	MOVWF       Increment_Decerement_Float_dummy1_L0+3 
	CLRF        Increment_Decerement_Float_list_L0+0 
	CLRF        Increment_Decerement_Float_increment_exit_L0+0 
;Control_Fn.c,2113 :: 		T6963C_Cursor(1);
	BSF         _T6963C_display+0, 1 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Control_Fn.c,2114 :: 		T6963C_Cursor_Blink(1);
	BSF         _T6963C_display+0, 0 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;Control_Fn.c,2116 :: 		cposx= (Pos_x/8)+3;
	MOVF        FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       _cposx+0 
;Control_Fn.c,2117 :: 		cposy= (Pos_y/8);
	MOVF        FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVF        R0, 0 
	MOVWF       _cposy+0 
;Control_Fn.c,2118 :: 		T6963C_set_cursor(cposx,cposy);
	MOVF        R2, 0 
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVF        R0, 0 
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,2125 :: 		first_time=1;
	BSF         Increment_Decerement_Float_first_time_L0+0, BitPos(Increment_Decerement_Float_first_time_L0+0) 
;Control_Fn.c,2127 :: 		while( (list == 0 ) && (increment_exit == 0) )
L_Increment_Decerement_Float452:
	MOVF        Increment_Decerement_Float_list_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Increment_Decerement_Float453
	MOVF        Increment_Decerement_Float_increment_exit_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Increment_Decerement_Float453
L__Increment_Decerement_Float693:
;Control_Fn.c,2129 :: 		asm CLRWDT;
	CLRWDT
;Control_Fn.c,2130 :: 		T6963C_Write_Text_Adv_ROM("RUPEES=",80, 64);
	MOVLW       ?lstr_154_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_154_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_154_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       64
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,2131 :: 		T6963C_set_cursor(23,8);
	MOVLW       23
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,2133 :: 		if( (Start==0) && (*var < limit) )
	BTFSC       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Increment_Decerement_Float458
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        FARG_Increment_Decerement_Float_limit+0, 0 
	MOVWF       R4 
	MOVF        FARG_Increment_Decerement_Float_limit+1, 0 
	MOVWF       R5 
	MOVF        FARG_Increment_Decerement_Float_limit+2, 0 
	MOVWF       R6 
	MOVF        FARG_Increment_Decerement_Float_limit+3, 0 
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Increment_Decerement_Float458
L__Increment_Decerement_Float692:
;Control_Fn.c,2135 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_Increment_Decerement_Float459:
	DECFSZ      R13, 1, 1
	BRA         L_Increment_Decerement_Float459
	DECFSZ      R12, 1, 1
	BRA         L_Increment_Decerement_Float459
	DECFSZ      R11, 1, 1
	BRA         L_Increment_Decerement_Float459
	NOP
	NOP
;Control_Fn.c,2137 :: 		if(*var <= 240.0)  //MAX LIMIT
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
	MOVF        POSTINC0+0, 0 
	MOVWF       R6 
	MOVF        POSTINC0+0, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       112
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Increment_Decerement_Float460
;Control_Fn.c,2139 :: 		*var=*var + 0.5;
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR1L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;Control_Fn.c,2140 :: 		dummy = *var;
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+3 
;Control_Fn.c,2142 :: 		T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);//CLEARING THE TEXT  PURPOSE
	MOVLW       10
	SUBWF       FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_x0+1, 1 
	MOVF        FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       24
	ADDWF       FARG_T6963C_box_x1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_x1+1, 1 
	MOVLW       9
	ADDWF       FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2144 :: 		FloatToStr_SingleDecimal(dummy,Text);//12.34
	MOVF        Increment_Decerement_Float_dummy_L0+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+0 
	MOVF        Increment_Decerement_Float_dummy_L0+1, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+1 
	MOVF        Increment_Decerement_Float_dummy_L0+2, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+2 
	MOVF        Increment_Decerement_Float_dummy_L0+3, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+3 
	MOVLW       _Text+0
	MOVWF       FARG_FloatToStr_SingleDecimal_str+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_FloatToStr_SingleDecimal_str+1 
	CALL        _FloatToStr_SingleDecimal+0, 0
;Control_Fn.c,2145 :: 		Ltrim(Text);//  12.34->12.34
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,2146 :: 		T6963C_Write_Text_Adv(Text,Pos_x,Pos_y);
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,2147 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,2149 :: 		}
	GOTO        L_Increment_Decerement_Float461
L_Increment_Decerement_Float460:
;Control_Fn.c,2156 :: 		*var=limit;//TO AVOID EXCEED PURPOSE
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR1L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR1H+0
	MOVF        FARG_Increment_Decerement_Float_limit+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_Increment_Decerement_Float_limit+1, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_Increment_Decerement_Float_limit+2, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_Increment_Decerement_Float_limit+3, 0 
	MOVWF       POSTINC1+0 
;Control_Fn.c,2157 :: 		dummy = *var;
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+3 
;Control_Fn.c,2158 :: 		T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);//CLEARING THE TEXT  PURPOSE
	MOVLW       10
	SUBWF       FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_x0+1, 1 
	MOVF        FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       24
	ADDWF       FARG_T6963C_box_x1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_x1+1, 1 
	MOVLW       9
	ADDWF       FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2160 :: 		FloatToStr_SingleDecimal(dummy,Text);//12.34
	MOVF        Increment_Decerement_Float_dummy_L0+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+0 
	MOVF        Increment_Decerement_Float_dummy_L0+1, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+1 
	MOVF        Increment_Decerement_Float_dummy_L0+2, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+2 
	MOVF        Increment_Decerement_Float_dummy_L0+3, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+3 
	MOVLW       _Text+0
	MOVWF       FARG_FloatToStr_SingleDecimal_str+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_FloatToStr_SingleDecimal_str+1 
	CALL        _FloatToStr_SingleDecimal+0, 0
;Control_Fn.c,2161 :: 		Ltrim(Text);//  12.34->12.34
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,2162 :: 		T6963C_Write_Text_Adv(Text,Pos_x,Pos_y);
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,2163 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,2164 :: 		}
L_Increment_Decerement_Float461:
;Control_Fn.c,2166 :: 		if(*var>=limit)
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        FARG_Increment_Decerement_Float_limit+0, 0 
	MOVWF       R4 
	MOVF        FARG_Increment_Decerement_Float_limit+1, 0 
	MOVWF       R5 
	MOVF        FARG_Increment_Decerement_Float_limit+2, 0 
	MOVWF       R6 
	MOVF        FARG_Increment_Decerement_Float_limit+3, 0 
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Increment_Decerement_Float462
;Control_Fn.c,2167 :: 		*var=limit;
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR1L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR1H+0
	MOVF        FARG_Increment_Decerement_Float_limit+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_Increment_Decerement_Float_limit+1, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_Increment_Decerement_Float_limit+2, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_Increment_Decerement_Float_limit+3, 0 
	MOVWF       POSTINC1+0 
L_Increment_Decerement_Float462:
;Control_Fn.c,2168 :: 		}
L_Increment_Decerement_Float458:
;Control_Fn.c,2171 :: 		if((Stop==0)&&(*var > 0.0 )&&(Start==1))
	BTFSC       RE5_bit+0, BitPos(RE5_bit+0) 
	GOTO        L_Increment_Decerement_Float465
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
	MOVF        POSTINC0+0, 0 
	MOVWF       R6 
	MOVF        POSTINC0+0, 0 
	MOVWF       R7 
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Increment_Decerement_Float465
	BTFSS       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Increment_Decerement_Float465
L__Increment_Decerement_Float691:
;Control_Fn.c,2173 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_Increment_Decerement_Float466:
	DECFSZ      R13, 1, 1
	BRA         L_Increment_Decerement_Float466
	DECFSZ      R12, 1, 1
	BRA         L_Increment_Decerement_Float466
	DECFSZ      R11, 1, 1
	BRA         L_Increment_Decerement_Float466
	NOP
	NOP
;Control_Fn.c,2174 :: 		*var=*var-0.1;
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR1L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;Control_Fn.c,2175 :: 		dummy = *var;
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+3 
;Control_Fn.c,2177 :: 		T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);//CLEARING THE TEXT  PURPOSE
	MOVLW       10
	SUBWF       FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_x0+1, 1 
	MOVF        FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       24
	ADDWF       FARG_T6963C_box_x1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_x1+1, 1 
	MOVLW       9
	ADDWF       FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2179 :: 		FloatToStr_SingleDecimal(dummy,Text);//12.34
	MOVF        Increment_Decerement_Float_dummy_L0+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+0 
	MOVF        Increment_Decerement_Float_dummy_L0+1, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+1 
	MOVF        Increment_Decerement_Float_dummy_L0+2, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+2 
	MOVF        Increment_Decerement_Float_dummy_L0+3, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+3 
	MOVLW       _Text+0
	MOVWF       FARG_FloatToStr_SingleDecimal_str+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_FloatToStr_SingleDecimal_str+1 
	CALL        _FloatToStr_SingleDecimal+0, 0
;Control_Fn.c,2180 :: 		Ltrim(Text);//  12.34->12.34
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,2181 :: 		T6963C_Write_Text_Adv(Text,Pos_x,Pos_y);
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,2182 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,2184 :: 		if(*var < 0.0)
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Increment_Decerement_Float467
;Control_Fn.c,2186 :: 		*var=0.0;
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR1L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR1H+0
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
;Control_Fn.c,2187 :: 		}
L_Increment_Decerement_Float467:
;Control_Fn.c,2188 :: 		}
L_Increment_Decerement_Float465:
;Control_Fn.c,2192 :: 		if((Reverse==0)&&(*var>0)&&(Start==1))
	BTFSC       RE7_bit+0, BitPos(RE7_bit+0) 
	GOTO        L_Increment_Decerement_Float470
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
	MOVF        POSTINC0+0, 0 
	MOVWF       R6 
	MOVF        POSTINC0+0, 0 
	MOVWF       R7 
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Increment_Decerement_Float470
	BTFSS       RE4_bit+0, BitPos(RE4_bit+0) 
	GOTO        L_Increment_Decerement_Float470
L__Increment_Decerement_Float690:
;Control_Fn.c,2195 :: 		delay_ms(150);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_Increment_Decerement_Float471:
	DECFSZ      R13, 1, 1
	BRA         L_Increment_Decerement_Float471
	DECFSZ      R12, 1, 1
	BRA         L_Increment_Decerement_Float471
	DECFSZ      R11, 1, 1
	BRA         L_Increment_Decerement_Float471
	NOP
	NOP
;Control_Fn.c,2196 :: 		*var=0;//RESET PURPOSE
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR1L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR1H+0
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
;Control_Fn.c,2197 :: 		dummy = *var;
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+3 
;Control_Fn.c,2198 :: 		T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK);//CLEARING THE TEXT  PURPOSE
	MOVLW       10
	SUBWF       FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_x0+1, 1 
	MOVF        FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       24
	ADDWF       FARG_T6963C_box_x1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_x1+1, 1 
	MOVLW       9
	ADDWF       FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2200 :: 		FloatToStr_SingleDecimal(dummy,Text);//12.34
	MOVF        Increment_Decerement_Float_dummy_L0+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+0 
	MOVF        Increment_Decerement_Float_dummy_L0+1, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+1 
	MOVF        Increment_Decerement_Float_dummy_L0+2, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+2 
	MOVF        Increment_Decerement_Float_dummy_L0+3, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+3 
	MOVLW       _Text+0
	MOVWF       FARG_FloatToStr_SingleDecimal_str+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_FloatToStr_SingleDecimal_str+1 
	CALL        _FloatToStr_SingleDecimal+0, 0
;Control_Fn.c,2201 :: 		Ltrim(Text);//  12.34->12.34
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,2202 :: 		T6963C_Write_Text_Adv(Text,Pos_x,Pos_y);
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,2203 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,2205 :: 		dummy1=dummy;
	MOVF        Increment_Decerement_Float_dummy_L0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy1_L0+0 
	MOVF        Increment_Decerement_Float_dummy_L0+1, 0 
	MOVWF       Increment_Decerement_Float_dummy1_L0+1 
	MOVF        Increment_Decerement_Float_dummy_L0+2, 0 
	MOVWF       Increment_Decerement_Float_dummy1_L0+2 
	MOVF        Increment_Decerement_Float_dummy_L0+3, 0 
	MOVWF       Increment_Decerement_Float_dummy1_L0+3 
;Control_Fn.c,2207 :: 		}
L_Increment_Decerement_Float470:
;Control_Fn.c,2210 :: 		if(Set==0)
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Increment_Decerement_Float472
;Control_Fn.c,2212 :: 		if( *var <= 0)  //INVALID STATE
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
	MOVF        POSTINC0+0, 0 
	MOVWF       R6 
	MOVF        POSTINC0+0, 0 
	MOVWF       R7 
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Increment_Decerement_Float473
;Control_Fn.c,2214 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,2215 :: 		T6963C_Write_Text_Adv_ROM("INVALID VALUE",60,60);
	MOVLW       ?lstr_155_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_155_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_155_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,2216 :: 		T6963C_set_cursor(23,8);
	MOVLW       23
	MOVWF       FARG_T6963C_set_cursor_x+0 
	MOVLW       8
	MOVWF       FARG_T6963C_set_cursor_y+0 
	CALL        _T6963C_set_cursor+0, 0
;Control_Fn.c,2217 :: 		delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_Increment_Decerement_Float474:
	DECFSZ      R13, 1, 1
	BRA         L_Increment_Decerement_Float474
	DECFSZ      R12, 1, 1
	BRA         L_Increment_Decerement_Float474
	DECFSZ      R11, 1, 1
	BRA         L_Increment_Decerement_Float474
	NOP
;Control_Fn.c,2218 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,2221 :: 		dummy =*var;
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+3 
;Control_Fn.c,2222 :: 		T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK); // clear
	MOVLW       10
	SUBWF       FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_x0+1, 1 
	MOVF        FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       24
	ADDWF       FARG_T6963C_box_x1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_x1+1, 1 
	MOVLW       9
	ADDWF       FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2223 :: 		FloatToStr_SingleDecimal(dummy, Text);
	MOVF        Increment_Decerement_Float_dummy_L0+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+0 
	MOVF        Increment_Decerement_Float_dummy_L0+1, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+1 
	MOVF        Increment_Decerement_Float_dummy_L0+2, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+2 
	MOVF        Increment_Decerement_Float_dummy_L0+3, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+3 
	MOVLW       _Text+0
	MOVWF       FARG_FloatToStr_SingleDecimal_str+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_FloatToStr_SingleDecimal_str+1 
	CALL        _FloatToStr_SingleDecimal+0, 0
;Control_Fn.c,2224 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,2225 :: 		T6963C_Write_Text_Adv(Text, Pos_x, Pos_y);
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,2226 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,2227 :: 		}
	GOTO        L_Increment_Decerement_Float475
L_Increment_Decerement_Float473:
;Control_Fn.c,2230 :: 		ColourExit++;
	INCF        _ColourExit+0, 1 
;Control_Fn.c,2231 :: 		list=1;
	MOVLW       1
	MOVWF       Increment_Decerement_Float_list_L0+0 
;Control_Fn.c,2232 :: 		increment_exit=1;
	MOVLW       1
	MOVWF       Increment_Decerement_Float_increment_exit_L0+0 
;Control_Fn.c,2233 :: 		delay_ms(350);
	MOVLW       29
	MOVWF       R11, 0
	MOVLW       105
	MOVWF       R12, 0
	MOVLW       165
	MOVWF       R13, 0
L_Increment_Decerement_Float476:
	DECFSZ      R13, 1, 1
	BRA         L_Increment_Decerement_Float476
	DECFSZ      R12, 1, 1
	BRA         L_Increment_Decerement_Float476
	DECFSZ      R11, 1, 1
	BRA         L_Increment_Decerement_Float476
;Control_Fn.c,2234 :: 		while(Set==0);
L_Increment_Decerement_Float477:
	BTFSC       RE6_bit+0, BitPos(RE6_bit+0) 
	GOTO        L_Increment_Decerement_Float478
	GOTO        L_Increment_Decerement_Float477
L_Increment_Decerement_Float478:
;Control_Fn.c,2235 :: 		delay_ms(350);
	MOVLW       29
	MOVWF       R11, 0
	MOVLW       105
	MOVWF       R12, 0
	MOVLW       165
	MOVWF       R13, 0
L_Increment_Decerement_Float479:
	DECFSZ      R13, 1, 1
	BRA         L_Increment_Decerement_Float479
	DECFSZ      R12, 1, 1
	BRA         L_Increment_Decerement_Float479
	DECFSZ      R11, 1, 1
	BRA         L_Increment_Decerement_Float479
;Control_Fn.c,2236 :: 		return;
	GOTO        L_end_Increment_Decerement_Float
;Control_Fn.c,2237 :: 		}
L_Increment_Decerement_Float475:
;Control_Fn.c,2238 :: 		}
L_Increment_Decerement_Float472:
;Control_Fn.c,2241 :: 		dummy=*var;
	MOVFF       FARG_Increment_Decerement_Float_var+0, FSR0L+0
	MOVFF       FARG_Increment_Decerement_Float_var+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy_L0+3 
;Control_Fn.c,2244 :: 		if(first_time == 1 || (dummy != dummy1)) //PRINT IN FIRST TIME AND VLAUE CHANGES ALONE
	BTFSC       Increment_Decerement_Float_first_time_L0+0, BitPos(Increment_Decerement_Float_first_time_L0+0) 
	GOTO        L__Increment_Decerement_Float689
	MOVF        Increment_Decerement_Float_dummy_L0+0, 0 
	MOVWF       R0 
	MOVF        Increment_Decerement_Float_dummy_L0+1, 0 
	MOVWF       R1 
	MOVF        Increment_Decerement_Float_dummy_L0+2, 0 
	MOVWF       R2 
	MOVF        Increment_Decerement_Float_dummy_L0+3, 0 
	MOVWF       R3 
	MOVF        Increment_Decerement_Float_dummy1_L0+0, 0 
	MOVWF       R4 
	MOVF        Increment_Decerement_Float_dummy1_L0+1, 0 
	MOVWF       R5 
	MOVF        Increment_Decerement_Float_dummy1_L0+2, 0 
	MOVWF       R6 
	MOVF        Increment_Decerement_Float_dummy1_L0+3, 0 
	MOVWF       R7 
	CALL        _Equals_Double+0, 0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__Increment_Decerement_Float689
	GOTO        L_Increment_Decerement_Float482
L__Increment_Decerement_Float689:
;Control_Fn.c,2246 :: 		T6963C_box(Pos_x-10, Pos_y, Pos_x+(8*3), Pos_y+9, T6963C_BLACK); // clear
	MOVLW       10
	SUBWF       FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_x0+1, 1 
	MOVF        FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       24
	ADDWF       FARG_T6963C_box_x1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_x1+1, 1 
	MOVLW       9
	ADDWF       FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2247 :: 		FloatToStr_SingleDecimal(dummy, Text);
	MOVF        Increment_Decerement_Float_dummy_L0+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+0 
	MOVF        Increment_Decerement_Float_dummy_L0+1, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+1 
	MOVF        Increment_Decerement_Float_dummy_L0+2, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+2 
	MOVF        Increment_Decerement_Float_dummy_L0+3, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+3 
	MOVLW       _Text+0
	MOVWF       FARG_FloatToStr_SingleDecimal_str+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_FloatToStr_SingleDecimal_str+1 
	CALL        _FloatToStr_SingleDecimal+0, 0
;Control_Fn.c,2248 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,2249 :: 		T6963C_Write_Text_Adv(Text, Pos_x, Pos_y);
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_x+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVF        FARG_Increment_Decerement_Float_Pos_y+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,2250 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,2252 :: 		dummy1 = dummy;
	MOVF        Increment_Decerement_Float_dummy_L0+0, 0 
	MOVWF       Increment_Decerement_Float_dummy1_L0+0 
	MOVF        Increment_Decerement_Float_dummy_L0+1, 0 
	MOVWF       Increment_Decerement_Float_dummy1_L0+1 
	MOVF        Increment_Decerement_Float_dummy_L0+2, 0 
	MOVWF       Increment_Decerement_Float_dummy1_L0+2 
	MOVF        Increment_Decerement_Float_dummy_L0+3, 0 
	MOVWF       Increment_Decerement_Float_dummy1_L0+3 
;Control_Fn.c,2253 :: 		first_time = 0;//BIT RESET
	BCF         Increment_Decerement_Float_first_time_L0+0, BitPos(Increment_Decerement_Float_first_time_L0+0) 
;Control_Fn.c,2254 :: 		}
L_Increment_Decerement_Float482:
;Control_Fn.c,2256 :: 		}
	GOTO        L_Increment_Decerement_Float452
L_Increment_Decerement_Float453:
;Control_Fn.c,2258 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,2259 :: 		}
L_end_Increment_Decerement_Float:
	RETURN      0
; end of _Increment_Decerement_Float

_FloatToStr_SingleDecimal:

;Control_Fn.c,2324 :: 		void FloatToStr_SingleDecimal(float num, char *str)
;Control_Fn.c,2329 :: 		int idx = 0;
	CLRF        FloatToStr_SingleDecimal_idx_L0+0 
	CLRF        FloatToStr_SingleDecimal_idx_L0+1 
;Control_Fn.c,2332 :: 		if(num < 0)
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        FARG_FloatToStr_SingleDecimal_num+0, 0 
	MOVWF       R0 
	MOVF        FARG_FloatToStr_SingleDecimal_num+1, 0 
	MOVWF       R1 
	MOVF        FARG_FloatToStr_SingleDecimal_num+2, 0 
	MOVWF       R2 
	MOVF        FARG_FloatToStr_SingleDecimal_num+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_FloatToStr_SingleDecimal483
;Control_Fn.c,2334 :: 		str[idx++] = '-';
	MOVF        FloatToStr_SingleDecimal_idx_L0+0, 0 
	ADDWF       FARG_FloatToStr_SingleDecimal_str+0, 0 
	MOVWF       FSR1L+0 
	MOVF        FloatToStr_SingleDecimal_idx_L0+1, 0 
	ADDWFC      FARG_FloatToStr_SingleDecimal_str+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       45
	MOVWF       POSTINC1+0 
	INFSNZ      FloatToStr_SingleDecimal_idx_L0+0, 1 
	INCF        FloatToStr_SingleDecimal_idx_L0+1, 1 
;Control_Fn.c,2335 :: 		num = -num;
	BTG         FARG_FloatToStr_SingleDecimal_num+2, 7 
;Control_Fn.c,2336 :: 		}
L_FloatToStr_SingleDecimal483:
;Control_Fn.c,2339 :: 		value10 = (long)(num * 10.0);
	MOVF        FARG_FloatToStr_SingleDecimal_num+0, 0 
	MOVWF       R0 
	MOVF        FARG_FloatToStr_SingleDecimal_num+1, 0 
	MOVWF       R1 
	MOVF        FARG_FloatToStr_SingleDecimal_num+2, 0 
	MOVWF       R2 
	MOVF        FARG_FloatToStr_SingleDecimal_num+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2longint+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+4 
	MOVF        R1, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+5 
	MOVF        R2, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+6 
	MOVF        R3, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+7 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FLOC__FloatToStr_SingleDecimal+4, 0 
	MOVWF       R0 
	MOVF        FLOC__FloatToStr_SingleDecimal+5, 0 
	MOVWF       R1 
	MOVF        FLOC__FloatToStr_SingleDecimal+6, 0 
	MOVWF       R2 
	MOVF        FLOC__FloatToStr_SingleDecimal+7, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+0 
	MOVF        R1, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+1 
	MOVF        R2, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+2 
	MOVF        R3, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+3 
	MOVF        FLOC__FloatToStr_SingleDecimal+0, 0 
	MOVWF       FloatToStr_SingleDecimal_intPart_L0+0 
	MOVF        FLOC__FloatToStr_SingleDecimal+1, 0 
	MOVWF       FloatToStr_SingleDecimal_intPart_L0+1 
	MOVF        FLOC__FloatToStr_SingleDecimal+2, 0 
	MOVWF       FloatToStr_SingleDecimal_intPart_L0+2 
	MOVF        FLOC__FloatToStr_SingleDecimal+3, 0 
	MOVWF       FloatToStr_SingleDecimal_intPart_L0+3 
;Control_Fn.c,2342 :: 		decPart = value10 % 10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FLOC__FloatToStr_SingleDecimal+4, 0 
	MOVWF       R0 
	MOVF        FLOC__FloatToStr_SingleDecimal+5, 0 
	MOVWF       R1 
	MOVF        FLOC__FloatToStr_SingleDecimal+6, 0 
	MOVWF       R2 
	MOVF        FLOC__FloatToStr_SingleDecimal+7, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	MOVWF       FloatToStr_SingleDecimal_decPart_L0+0 
	MOVF        R1, 0 
	MOVWF       FloatToStr_SingleDecimal_decPart_L0+1 
;Control_Fn.c,2345 :: 		if(intPart >= 1000)
	MOVLW       128
	XORWF       FLOC__FloatToStr_SingleDecimal+3, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__FloatToStr_SingleDecimal736
	MOVLW       0
	SUBWF       FLOC__FloatToStr_SingleDecimal+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__FloatToStr_SingleDecimal736
	MOVLW       3
	SUBWF       FLOC__FloatToStr_SingleDecimal+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__FloatToStr_SingleDecimal736
	MOVLW       232
	SUBWF       FLOC__FloatToStr_SingleDecimal+0, 0 
L__FloatToStr_SingleDecimal736:
	BTFSS       STATUS+0, 0 
	GOTO        L_FloatToStr_SingleDecimal484
;Control_Fn.c,2347 :: 		str[idx++] = (intPart / 1000) + '0';
	MOVF        FloatToStr_SingleDecimal_idx_L0+0, 0 
	ADDWF       FARG_FloatToStr_SingleDecimal_str+0, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+0 
	MOVF        FloatToStr_SingleDecimal_idx_L0+1, 0 
	ADDWFC      FARG_FloatToStr_SingleDecimal_str+1, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+1 
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+0, 0 
	MOVWF       R0 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+1, 0 
	MOVWF       R1 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+2, 0 
	MOVWF       R2 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__FloatToStr_SingleDecimal+0, FSR1L+0
	MOVFF       FLOC__FloatToStr_SingleDecimal+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FloatToStr_SingleDecimal_idx_L0+0, 1 
	INCF        FloatToStr_SingleDecimal_idx_L0+1, 1 
;Control_Fn.c,2348 :: 		str[idx++] = ((intPart / 100) % 10) + '0';
	MOVF        FloatToStr_SingleDecimal_idx_L0+0, 0 
	ADDWF       FARG_FloatToStr_SingleDecimal_str+0, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+0 
	MOVF        FloatToStr_SingleDecimal_idx_L0+1, 0 
	ADDWFC      FARG_FloatToStr_SingleDecimal_str+1, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+0, 0 
	MOVWF       R0 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+1, 0 
	MOVWF       R1 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+2, 0 
	MOVWF       R2 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__FloatToStr_SingleDecimal+0, FSR1L+0
	MOVFF       FLOC__FloatToStr_SingleDecimal+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FloatToStr_SingleDecimal_idx_L0+0, 1 
	INCF        FloatToStr_SingleDecimal_idx_L0+1, 1 
;Control_Fn.c,2349 :: 		str[idx++] = ((intPart / 10) % 10) + '0';
	MOVF        FloatToStr_SingleDecimal_idx_L0+0, 0 
	ADDWF       FARG_FloatToStr_SingleDecimal_str+0, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+0 
	MOVF        FloatToStr_SingleDecimal_idx_L0+1, 0 
	ADDWFC      FARG_FloatToStr_SingleDecimal_str+1, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+0, 0 
	MOVWF       R0 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+1, 0 
	MOVWF       R1 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+2, 0 
	MOVWF       R2 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__FloatToStr_SingleDecimal+0, FSR1L+0
	MOVFF       FLOC__FloatToStr_SingleDecimal+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FloatToStr_SingleDecimal_idx_L0+0, 1 
	INCF        FloatToStr_SingleDecimal_idx_L0+1, 1 
;Control_Fn.c,2350 :: 		str[idx++] = (intPart % 10) + '0';
	MOVF        FloatToStr_SingleDecimal_idx_L0+0, 0 
	ADDWF       FARG_FloatToStr_SingleDecimal_str+0, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+0 
	MOVF        FloatToStr_SingleDecimal_idx_L0+1, 0 
	ADDWFC      FARG_FloatToStr_SingleDecimal_str+1, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+0, 0 
	MOVWF       R0 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+1, 0 
	MOVWF       R1 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+2, 0 
	MOVWF       R2 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__FloatToStr_SingleDecimal+0, FSR1L+0
	MOVFF       FLOC__FloatToStr_SingleDecimal+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FloatToStr_SingleDecimal_idx_L0+0, 1 
	INCF        FloatToStr_SingleDecimal_idx_L0+1, 1 
;Control_Fn.c,2351 :: 		}
	GOTO        L_FloatToStr_SingleDecimal485
L_FloatToStr_SingleDecimal484:
;Control_Fn.c,2352 :: 		else if(intPart >= 100)
	MOVLW       128
	XORWF       FloatToStr_SingleDecimal_intPart_L0+3, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__FloatToStr_SingleDecimal737
	MOVLW       0
	SUBWF       FloatToStr_SingleDecimal_intPart_L0+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__FloatToStr_SingleDecimal737
	MOVLW       0
	SUBWF       FloatToStr_SingleDecimal_intPart_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__FloatToStr_SingleDecimal737
	MOVLW       100
	SUBWF       FloatToStr_SingleDecimal_intPart_L0+0, 0 
L__FloatToStr_SingleDecimal737:
	BTFSS       STATUS+0, 0 
	GOTO        L_FloatToStr_SingleDecimal486
;Control_Fn.c,2354 :: 		str[idx++] = (intPart / 100) + '0';
	MOVF        FloatToStr_SingleDecimal_idx_L0+0, 0 
	ADDWF       FARG_FloatToStr_SingleDecimal_str+0, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+0 
	MOVF        FloatToStr_SingleDecimal_idx_L0+1, 0 
	ADDWFC      FARG_FloatToStr_SingleDecimal_str+1, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+0, 0 
	MOVWF       R0 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+1, 0 
	MOVWF       R1 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+2, 0 
	MOVWF       R2 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__FloatToStr_SingleDecimal+0, FSR1L+0
	MOVFF       FLOC__FloatToStr_SingleDecimal+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FloatToStr_SingleDecimal_idx_L0+0, 1 
	INCF        FloatToStr_SingleDecimal_idx_L0+1, 1 
;Control_Fn.c,2355 :: 		str[idx++] = ((intPart / 10) % 10) + '0';
	MOVF        FloatToStr_SingleDecimal_idx_L0+0, 0 
	ADDWF       FARG_FloatToStr_SingleDecimal_str+0, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+0 
	MOVF        FloatToStr_SingleDecimal_idx_L0+1, 0 
	ADDWFC      FARG_FloatToStr_SingleDecimal_str+1, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+0, 0 
	MOVWF       R0 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+1, 0 
	MOVWF       R1 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+2, 0 
	MOVWF       R2 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__FloatToStr_SingleDecimal+0, FSR1L+0
	MOVFF       FLOC__FloatToStr_SingleDecimal+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FloatToStr_SingleDecimal_idx_L0+0, 1 
	INCF        FloatToStr_SingleDecimal_idx_L0+1, 1 
;Control_Fn.c,2356 :: 		str[idx++] = (intPart % 10) + '0';
	MOVF        FloatToStr_SingleDecimal_idx_L0+0, 0 
	ADDWF       FARG_FloatToStr_SingleDecimal_str+0, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+0 
	MOVF        FloatToStr_SingleDecimal_idx_L0+1, 0 
	ADDWFC      FARG_FloatToStr_SingleDecimal_str+1, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+0, 0 
	MOVWF       R0 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+1, 0 
	MOVWF       R1 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+2, 0 
	MOVWF       R2 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__FloatToStr_SingleDecimal+0, FSR1L+0
	MOVFF       FLOC__FloatToStr_SingleDecimal+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FloatToStr_SingleDecimal_idx_L0+0, 1 
	INCF        FloatToStr_SingleDecimal_idx_L0+1, 1 
;Control_Fn.c,2357 :: 		}
	GOTO        L_FloatToStr_SingleDecimal487
L_FloatToStr_SingleDecimal486:
;Control_Fn.c,2358 :: 		else if(intPart >= 10)
	MOVLW       128
	XORWF       FloatToStr_SingleDecimal_intPart_L0+3, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__FloatToStr_SingleDecimal738
	MOVLW       0
	SUBWF       FloatToStr_SingleDecimal_intPart_L0+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__FloatToStr_SingleDecimal738
	MOVLW       0
	SUBWF       FloatToStr_SingleDecimal_intPart_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__FloatToStr_SingleDecimal738
	MOVLW       10
	SUBWF       FloatToStr_SingleDecimal_intPart_L0+0, 0 
L__FloatToStr_SingleDecimal738:
	BTFSS       STATUS+0, 0 
	GOTO        L_FloatToStr_SingleDecimal488
;Control_Fn.c,2360 :: 		str[idx++] = (intPart / 10) + '0';
	MOVF        FloatToStr_SingleDecimal_idx_L0+0, 0 
	ADDWF       FARG_FloatToStr_SingleDecimal_str+0, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+0 
	MOVF        FloatToStr_SingleDecimal_idx_L0+1, 0 
	ADDWFC      FARG_FloatToStr_SingleDecimal_str+1, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+0, 0 
	MOVWF       R0 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+1, 0 
	MOVWF       R1 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+2, 0 
	MOVWF       R2 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__FloatToStr_SingleDecimal+0, FSR1L+0
	MOVFF       FLOC__FloatToStr_SingleDecimal+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FloatToStr_SingleDecimal_idx_L0+0, 1 
	INCF        FloatToStr_SingleDecimal_idx_L0+1, 1 
;Control_Fn.c,2361 :: 		str[idx++] = (intPart % 10) + '0';
	MOVF        FloatToStr_SingleDecimal_idx_L0+0, 0 
	ADDWF       FARG_FloatToStr_SingleDecimal_str+0, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+0 
	MOVF        FloatToStr_SingleDecimal_idx_L0+1, 0 
	ADDWFC      FARG_FloatToStr_SingleDecimal_str+1, 0 
	MOVWF       FLOC__FloatToStr_SingleDecimal+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+0, 0 
	MOVWF       R0 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+1, 0 
	MOVWF       R1 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+2, 0 
	MOVWF       R2 
	MOVF        FloatToStr_SingleDecimal_intPart_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__FloatToStr_SingleDecimal+0, FSR1L+0
	MOVFF       FLOC__FloatToStr_SingleDecimal+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FloatToStr_SingleDecimal_idx_L0+0, 1 
	INCF        FloatToStr_SingleDecimal_idx_L0+1, 1 
;Control_Fn.c,2362 :: 		}
	GOTO        L_FloatToStr_SingleDecimal489
L_FloatToStr_SingleDecimal488:
;Control_Fn.c,2365 :: 		str[idx++] = intPart + '0';
	MOVF        FloatToStr_SingleDecimal_idx_L0+0, 0 
	ADDWF       FARG_FloatToStr_SingleDecimal_str+0, 0 
	MOVWF       FSR1L+0 
	MOVF        FloatToStr_SingleDecimal_idx_L0+1, 0 
	ADDWFC      FARG_FloatToStr_SingleDecimal_str+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       48
	ADDWF       FloatToStr_SingleDecimal_intPart_L0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FloatToStr_SingleDecimal_idx_L0+0, 1 
	INCF        FloatToStr_SingleDecimal_idx_L0+1, 1 
;Control_Fn.c,2366 :: 		}
L_FloatToStr_SingleDecimal489:
L_FloatToStr_SingleDecimal487:
L_FloatToStr_SingleDecimal485:
;Control_Fn.c,2369 :: 		str[idx++] = '.';
	MOVF        FloatToStr_SingleDecimal_idx_L0+0, 0 
	ADDWF       FARG_FloatToStr_SingleDecimal_str+0, 0 
	MOVWF       FSR1L+0 
	MOVF        FloatToStr_SingleDecimal_idx_L0+1, 0 
	ADDWFC      FARG_FloatToStr_SingleDecimal_str+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       46
	MOVWF       POSTINC1+0 
	INFSNZ      FloatToStr_SingleDecimal_idx_L0+0, 1 
	INCF        FloatToStr_SingleDecimal_idx_L0+1, 1 
;Control_Fn.c,2372 :: 		str[idx++] = decPart + '0';
	MOVF        FloatToStr_SingleDecimal_idx_L0+0, 0 
	ADDWF       FARG_FloatToStr_SingleDecimal_str+0, 0 
	MOVWF       FSR1L+0 
	MOVF        FloatToStr_SingleDecimal_idx_L0+1, 0 
	ADDWFC      FARG_FloatToStr_SingleDecimal_str+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       48
	ADDWF       FloatToStr_SingleDecimal_decPart_L0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FloatToStr_SingleDecimal_idx_L0+0, 1 
	INCF        FloatToStr_SingleDecimal_idx_L0+1, 1 
;Control_Fn.c,2375 :: 		str[idx] = '\0';
	MOVF        FloatToStr_SingleDecimal_idx_L0+0, 0 
	ADDWF       FARG_FloatToStr_SingleDecimal_str+0, 0 
	MOVWF       FSR1L+0 
	MOVF        FloatToStr_SingleDecimal_idx_L0+1, 0 
	ADDWFC      FARG_FloatToStr_SingleDecimal_str+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;Control_Fn.c,2376 :: 		}
L_end_FloatToStr_SingleDecimal:
	RETURN      0
; end of _FloatToStr_SingleDecimal

_MulFloat_To1DecimalStr:

;Control_Fn.c,2380 :: 		void MulFloat_To1DecimalStr(float A, float B, char *out)
;Control_Fn.c,2391 :: 		A10 = (long)(A * 10.0f + 0.0001f);
	MOVF        FARG_MulFloat_To1DecimalStr_A+0, 0 
	MOVWF       R0 
	MOVF        FARG_MulFloat_To1DecimalStr_A+1, 0 
	MOVWF       R1 
	MOVF        FARG_MulFloat_To1DecimalStr_A+2, 0 
	MOVWF       R2 
	MOVF        FARG_MulFloat_To1DecimalStr_A+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       23
	MOVWF       R4 
	MOVLW       183
	MOVWF       R5 
	MOVLW       81
	MOVWF       R6 
	MOVLW       113
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _double2longint+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__MulFloat_To1DecimalStr+0 
	MOVF        R1, 0 
	MOVWF       FLOC__MulFloat_To1DecimalStr+1 
	MOVF        R2, 0 
	MOVWF       FLOC__MulFloat_To1DecimalStr+2 
	MOVF        R3, 0 
	MOVWF       FLOC__MulFloat_To1DecimalStr+3 
	MOVF        FARG_MulFloat_To1DecimalStr_B+0, 0 
	MOVWF       R0 
	MOVF        FARG_MulFloat_To1DecimalStr_B+1, 0 
	MOVWF       R1 
	MOVF        FARG_MulFloat_To1DecimalStr_B+2, 0 
	MOVWF       R2 
	MOVF        FARG_MulFloat_To1DecimalStr_B+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
;Control_Fn.c,2392 :: 		B10 = (long)(B * 10.0f + 0.0001f);
	MOVLW       23
	MOVWF       R4 
	MOVLW       183
	MOVWF       R5 
	MOVLW       81
	MOVWF       R6 
	MOVLW       113
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _double2longint+0, 0
;Control_Fn.c,2395 :: 		result100 = A10 * B10;//261 *12 =3132
	MOVF        FLOC__MulFloat_To1DecimalStr+0, 0 
	MOVWF       R4 
	MOVF        FLOC__MulFloat_To1DecimalStr+1, 0 
	MOVWF       R5 
	MOVF        FLOC__MulFloat_To1DecimalStr+2, 0 
	MOVWF       R6 
	MOVF        FLOC__MulFloat_To1DecimalStr+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
;Control_Fn.c,2398 :: 		result10 = result100 / 10;//313
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_S+0, 0
	MOVF        R0, 0 
	MOVWF       MulFloat_To1DecimalStr_result10_L0+0 
	MOVF        R1, 0 
	MOVWF       MulFloat_To1DecimalStr_result10_L0+1 
	MOVF        R2, 0 
	MOVWF       MulFloat_To1DecimalStr_result10_L0+2 
	MOVF        R3, 0 
	MOVWF       MulFloat_To1DecimalStr_result10_L0+3 
;Control_Fn.c,2401 :: 		if(result10 < 0)
	MOVLW       128
	XORWF       R3, 0 
	MOVWF       R4 
	MOVLW       128
	SUBWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__MulFloat_To1DecimalStr740
	MOVLW       0
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__MulFloat_To1DecimalStr740
	MOVLW       0
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__MulFloat_To1DecimalStr740
	MOVLW       0
	SUBWF       R0, 0 
L__MulFloat_To1DecimalStr740:
	BTFSC       STATUS+0, 0 
	GOTO        L_MulFloat_To1DecimalStr490
;Control_Fn.c,2403 :: 		*out++ = '-';
	MOVFF       FARG_MulFloat_To1DecimalStr_out+0, FSR1L+0
	MOVFF       FARG_MulFloat_To1DecimalStr_out+1, FSR1H+0
	MOVLW       45
	MOVWF       POSTINC1+0 
	INFSNZ      FARG_MulFloat_To1DecimalStr_out+0, 1 
	INCF        FARG_MulFloat_To1DecimalStr_out+1, 1 
;Control_Fn.c,2404 :: 		result10 = -result10;
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVF        MulFloat_To1DecimalStr_result10_L0+0, 0 
	SUBWF       R0, 1 
	MOVF        MulFloat_To1DecimalStr_result10_L0+1, 0 
	SUBWFB      R1, 1 
	MOVF        MulFloat_To1DecimalStr_result10_L0+2, 0 
	SUBWFB      R2, 1 
	MOVF        MulFloat_To1DecimalStr_result10_L0+3, 0 
	SUBWFB      R3, 1 
	MOVF        R0, 0 
	MOVWF       MulFloat_To1DecimalStr_result10_L0+0 
	MOVF        R1, 0 
	MOVWF       MulFloat_To1DecimalStr_result10_L0+1 
	MOVF        R2, 0 
	MOVWF       MulFloat_To1DecimalStr_result10_L0+2 
	MOVF        R3, 0 
	MOVWF       MulFloat_To1DecimalStr_result10_L0+3 
;Control_Fn.c,2405 :: 		}
L_MulFloat_To1DecimalStr490:
;Control_Fn.c,2408 :: 		intPart = result10 / 10;//31
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        MulFloat_To1DecimalStr_result10_L0+0, 0 
	MOVWF       R0 
	MOVF        MulFloat_To1DecimalStr_result10_L0+1, 0 
	MOVWF       R1 
	MOVF        MulFloat_To1DecimalStr_result10_L0+2, 0 
	MOVWF       R2 
	MOVF        MulFloat_To1DecimalStr_result10_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__MulFloat_To1DecimalStr+0 
	MOVF        R1, 0 
	MOVWF       FLOC__MulFloat_To1DecimalStr+1 
	MOVF        R2, 0 
	MOVWF       FLOC__MulFloat_To1DecimalStr+2 
	MOVF        R3, 0 
	MOVWF       FLOC__MulFloat_To1DecimalStr+3 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        MulFloat_To1DecimalStr_result10_L0+0, 0 
	MOVWF       R0 
	MOVF        MulFloat_To1DecimalStr_result10_L0+1, 0 
	MOVWF       R1 
	MOVF        MulFloat_To1DecimalStr_result10_L0+2, 0 
	MOVWF       R2 
	MOVF        MulFloat_To1DecimalStr_result10_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
;Control_Fn.c,2409 :: 		decPart = result10 % 10;//3
	MOVF        R0, 0 
	MOVWF       MulFloat_To1DecimalStr_decPart_L0+0 
	MOVF        R1, 0 
	MOVWF       MulFloat_To1DecimalStr_decPart_L0+1 
;Control_Fn.c,2412 :: 		LongToStr(intPart, buf);//31
	MOVF        FLOC__MulFloat_To1DecimalStr+0, 0 
	MOVWF       FARG_LongToStr_input+0 
	MOVF        FLOC__MulFloat_To1DecimalStr+1, 0 
	MOVWF       FARG_LongToStr_input+1 
	MOVF        FLOC__MulFloat_To1DecimalStr+2, 0 
	MOVWF       FARG_LongToStr_input+2 
	MOVF        FLOC__MulFloat_To1DecimalStr+3, 0 
	MOVWF       FARG_LongToStr_input+3 
	MOVLW       MulFloat_To1DecimalStr_buf_L0+0
	MOVWF       FARG_LongToStr_output+0 
	MOVLW       hi_addr(MulFloat_To1DecimalStr_buf_L0+0)
	MOVWF       FARG_LongToStr_output+1 
	CALL        _LongToStr+0, 0
;Control_Fn.c,2413 :: 		Ltrim(buf);
	MOVLW       MulFloat_To1DecimalStr_buf_L0+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(MulFloat_To1DecimalStr_buf_L0+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,2414 :: 		strcpy(out, buf);        //31
	MOVF        FARG_MulFloat_To1DecimalStr_out+0, 0 
	MOVWF       FARG_strcpy_to+0 
	MOVF        FARG_MulFloat_To1DecimalStr_out+1, 0 
	MOVWF       FARG_strcpy_to+1 
	MOVLW       MulFloat_To1DecimalStr_buf_L0+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(MulFloat_To1DecimalStr_buf_L0+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;Control_Fn.c,2417 :: 		strcat(out, ".");//31.
	MOVF        FARG_MulFloat_To1DecimalStr_out+0, 0 
	MOVWF       FARG_strcat_to+0 
	MOVF        FARG_MulFloat_To1DecimalStr_out+1, 0 
	MOVWF       FARG_strcat_to+1 
	MOVLW       ?lstr156_Control_Fn+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(?lstr156_Control_Fn+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;Control_Fn.c,2418 :: 		out = out + strlen(out);//POINTER ARITHMETIC CONCEPT USED
	MOVF        FARG_MulFloat_To1DecimalStr_out+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        FARG_MulFloat_To1DecimalStr_out+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	ADDWF       FARG_MulFloat_To1DecimalStr_out+0, 0 
	MOVWF       R2 
	MOVF        R1, 0 
	ADDWFC      FARG_MulFloat_To1DecimalStr_out+1, 0 
	MOVWF       R3 
	MOVF        R2, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_out+0 
	MOVF        R3, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_out+1 
;Control_Fn.c,2419 :: 		*out++ = decPart + '0';//POST INCREMENT [POSITION NULL CHARACTER]
	MOVLW       48
	ADDWF       MulFloat_To1DecimalStr_decPart_L0+0, 0 
	MOVWF       R0 
	MOVFF       R2, FSR1L+0
	MOVFF       R3, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FARG_MulFloat_To1DecimalStr_out+0, 1 
	INCF        FARG_MulFloat_To1DecimalStr_out+1, 1 
;Control_Fn.c,2420 :: 		*out = '\0';
	MOVFF       FARG_MulFloat_To1DecimalStr_out+0, FSR1L+0
	MOVFF       FARG_MulFloat_To1DecimalStr_out+1, FSR1H+0
	CLRF        POSTINC1+0 
;Control_Fn.c,2421 :: 		}
L_end_MulFloat_To1DecimalStr:
	RETURN      0
; end of _MulFloat_To1DecimalStr

_Glcd_Buffer_Clear:

;Control_Fn.c,2425 :: 		void Glcd_Buffer_Clear()
;Control_Fn.c,2427 :: 		unsigned char Clear_Count=0;
	CLRF        Glcd_Buffer_Clear_Clear_Count_L0+0 
;Control_Fn.c,2429 :: 		for(Clear_Count=0 ; Clear_Count < sizeof(Text); Clear_Count++)
	CLRF        Glcd_Buffer_Clear_Clear_Count_L0+0 
L_Glcd_Buffer_Clear491:
	MOVLW       16
	SUBWF       Glcd_Buffer_Clear_Clear_Count_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Glcd_Buffer_Clear492
;Control_Fn.c,2431 :: 		Text[Clear_Count]='\0';
	MOVLW       _Text+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FSR1L+1 
	MOVF        Glcd_Buffer_Clear_Clear_Count_L0+0, 0 
	ADDWF       FSR1L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1L+1, 1 
	CLRF        POSTINC1+0 
;Control_Fn.c,2429 :: 		for(Clear_Count=0 ; Clear_Count < sizeof(Text); Clear_Count++)
	INCF        Glcd_Buffer_Clear_Clear_Count_L0+0, 1 
;Control_Fn.c,2432 :: 		}
	GOTO        L_Glcd_Buffer_Clear491
L_Glcd_Buffer_Clear492:
;Control_Fn.c,2434 :: 		}
L_end_Glcd_Buffer_Clear:
	RETURN      0
; end of _Glcd_Buffer_Clear

_Glcd_Out_ROM:

;Control_Fn.c,2441 :: 		void Glcd_Out_ROM(const char *text, unsigned short X_pixel, unsigned short Y_pixel)
;Control_Fn.c,2447 :: 		while ((temp = *text++) != '\0')
L_Glcd_Out_ROM494:
	MOVF        FARG_Glcd_Out_ROM_text+0, 0 
	MOVWF       R0 
	MOVF        FARG_Glcd_Out_ROM_text+1, 0 
	MOVWF       R1 
	MOVF        FARG_Glcd_Out_ROM_text+2, 0 
	MOVWF       R2 
	MOVLW       1
	ADDWF       FARG_Glcd_Out_ROM_text+0, 1 
	MOVLW       0
	ADDWFC      FARG_Glcd_Out_ROM_text+1, 1 
	ADDWFC      FARG_Glcd_Out_ROM_text+2, 1 
	MOVF        R0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        R1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        R2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	MOVWF       Glcd_Out_ROM_temp_L0+0 
	MOVF        R1, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_Glcd_Out_ROM495
;Control_Fn.c,2451 :: 		T6963C_Write_char_Adv(temp ,X_pixel,Y_pixel);
	MOVF        Glcd_Out_ROM_temp_L0+0, 0 
	MOVWF       FARG_T6963C_Write_Char_Adv_ch+0 
	MOVF        FARG_Glcd_Out_ROM_X_pixel+0, 0 
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVF        FARG_Glcd_Out_ROM_Y_pixel+0, 0 
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,2452 :: 		X_pixel= X_pixel+8;
	MOVLW       8
	ADDWF       FARG_Glcd_Out_ROM_X_pixel+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       FARG_Glcd_Out_ROM_X_pixel+0 
;Control_Fn.c,2454 :: 		if (X_pixel > 240)
	MOVF        R1, 0 
	SUBLW       240
	BTFSC       STATUS+0, 0 
	GOTO        L_Glcd_Out_ROM496
;Control_Fn.c,2456 :: 		break; // Prevent overflow on GLCD lines
	GOTO        L_Glcd_Out_ROM495
;Control_Fn.c,2457 :: 		}
L_Glcd_Out_ROM496:
;Control_Fn.c,2458 :: 		}
	GOTO        L_Glcd_Out_ROM494
L_Glcd_Out_ROM495:
;Control_Fn.c,2459 :: 		}
L_end_Glcd_Out_ROM:
	RETURN      0
; end of _Glcd_Out_ROM

_GLCD_Print_Int_With_LeadingZero:

;Control_Fn.c,2465 :: 		void GLCD_Print_Int_With_LeadingZero(unsigned short value,unsigned short x,unsigned short y)
;Control_Fn.c,2468 :: 		IntToStr(value, text);
	MOVF        FARG_GLCD_Print_Int_With_LeadingZero_value+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _Text+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Control_Fn.c,2469 :: 		Ltrim(text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,2471 :: 		if(value < 10)
	MOVLW       10
	SUBWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_GLCD_Print_Int_With_LeadingZero497
;Control_Fn.c,2473 :: 		T6963C_Write_Text_Adv_ROM("0", x, y);// 0 NEED TO PRINT
	MOVLW       ?lstr_157_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_157_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_157_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVF        FARG_GLCD_Print_Int_With_LeadingZero_x+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVF        FARG_GLCD_Print_Int_With_LeadingZero_y+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,2474 :: 		T6963C_Write_Text_Adv(text, x + 8, y);   // 8 = char width
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       8
	ADDWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	CLRF        FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Write_Text_Adv_x+1, 1 
	MOVF        FARG_GLCD_Print_Int_With_LeadingZero_y+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,2475 :: 		}
	GOTO        L_GLCD_Print_Int_With_LeadingZero498
L_GLCD_Print_Int_With_LeadingZero497:
;Control_Fn.c,2476 :: 		else if(value >= 10)
	MOVLW       10
	SUBWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_GLCD_Print_Int_With_LeadingZero499
;Control_Fn.c,2478 :: 		T6963C_Write_Text_Adv(text, x, y);//ABOVE 9 VALUE WILL PRINT IN THIS CONDITION
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVF        FARG_GLCD_Print_Int_With_LeadingZero_x+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVF        FARG_GLCD_Print_Int_With_LeadingZero_y+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Control_Fn.c,2479 :: 		}
L_GLCD_Print_Int_With_LeadingZero499:
L_GLCD_Print_Int_With_LeadingZero498:
;Control_Fn.c,2480 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,2481 :: 		}
L_end_GLCD_Print_Int_With_LeadingZero:
	RETURN      0
; end of _GLCD_Print_Int_With_LeadingZero

_GLCD_CharWidth:

;Control_Fn.c,2483 :: 		unsigned char GLCD_CharWidth(unsigned char ch)
;Control_Fn.c,2486 :: 		if(ch < 32) return 0;
	MOVLW       32
	SUBWF       FARG_GLCD_CharWidth_ch+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_GLCD_CharWidth500
	CLRF        R0 
	GOTO        L_end_GLCD_CharWidth
L_GLCD_CharWidth500:
;Control_Fn.c,2487 :: 		if(ch > 127) return 6;   // default safety
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	SUBLW       127
	BTFSC       STATUS+0, 0 
	GOTO        L_GLCD_CharWidth501
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
L_GLCD_CharWidth501:
;Control_Fn.c,2489 :: 		switch(ch)
	GOTO        L_GLCD_CharWidth502
;Control_Fn.c,2492 :: 		case ' ': return 8;
L_GLCD_CharWidth504:
	MOVLW       8
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2495 :: 		case '!': return 2;
L_GLCD_CharWidth505:
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2496 :: 		case '"': return 4;
L_GLCD_CharWidth506:
	MOVLW       4
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2497 :: 		case '#': return 6;
L_GLCD_CharWidth507:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2498 :: 		case '$': return 6;
L_GLCD_CharWidth508:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2499 :: 		case '%': return 8;
L_GLCD_CharWidth509:
	MOVLW       8
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2500 :: 		case '&': return 7;
L_GLCD_CharWidth510:
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2501 :: 		case '\'': return 2;//TO PRINT ['] PUPROSE LIKE THIS MENTION
L_GLCD_CharWidth511:
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2502 :: 		case '(': return 3;
L_GLCD_CharWidth512:
	MOVLW       3
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2503 :: 		case ')': return 3;
L_GLCD_CharWidth513:
	MOVLW       3
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2504 :: 		case '*': return 4;
L_GLCD_CharWidth514:
	MOVLW       4
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2505 :: 		case '+': return 6;
L_GLCD_CharWidth515:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2506 :: 		case ',': return 2;
L_GLCD_CharWidth516:
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2507 :: 		case '-': return 4;
L_GLCD_CharWidth517:
	MOVLW       4
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2508 :: 		case '.': return 2;
L_GLCD_CharWidth518:
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2509 :: 		case '/': return 4;
L_GLCD_CharWidth519:
	MOVLW       4
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2512 :: 		case '0': return 6;
L_GLCD_CharWidth520:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2513 :: 		case '1': return 4;
L_GLCD_CharWidth521:
	MOVLW       4
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2514 :: 		case '2': return 6;
L_GLCD_CharWidth522:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2515 :: 		case '3': return 6;
L_GLCD_CharWidth523:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2516 :: 		case '4': return 6;
L_GLCD_CharWidth524:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2517 :: 		case '5': return 6;
L_GLCD_CharWidth525:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2518 :: 		case '6': return 6;
L_GLCD_CharWidth526:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2519 :: 		case '7': return 6;
L_GLCD_CharWidth527:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2520 :: 		case '8': return 6;
L_GLCD_CharWidth528:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2521 :: 		case '9': return 6;
L_GLCD_CharWidth529:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2524 :: 		case ':': return 2;
L_GLCD_CharWidth530:
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2525 :: 		case ';': return 2;
L_GLCD_CharWidth531:
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2526 :: 		case '<': return 6;
L_GLCD_CharWidth532:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2527 :: 		case '=': return 6;
L_GLCD_CharWidth533:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2528 :: 		case '>': return 6;
L_GLCD_CharWidth534:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2529 :: 		case '?': return 6;
L_GLCD_CharWidth535:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2530 :: 		case '@': return 8;
L_GLCD_CharWidth536:
	MOVLW       8
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2533 :: 		case 'A': return 7;
L_GLCD_CharWidth537:
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2534 :: 		case 'B': return 7;
L_GLCD_CharWidth538:
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2535 :: 		case 'C': return 7;
L_GLCD_CharWidth539:
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2536 :: 		case 'D': return 7;
L_GLCD_CharWidth540:
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2537 :: 		case 'E': return 7;
L_GLCD_CharWidth541:
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2538 :: 		case 'F': return 7;
L_GLCD_CharWidth542:
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2539 :: 		case 'G': return 7;
L_GLCD_CharWidth543:
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2540 :: 		case 'H': return 6;
L_GLCD_CharWidth544:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2541 :: 		case 'I': return 2;
L_GLCD_CharWidth545:
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2542 :: 		case 'J': return 5;
L_GLCD_CharWidth546:
	MOVLW       5
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2543 :: 		case 'K': return 8;
L_GLCD_CharWidth547:
	MOVLW       8
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2544 :: 		case 'L': return 7;
L_GLCD_CharWidth548:
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2545 :: 		case 'M': return 10;
L_GLCD_CharWidth549:
	MOVLW       10
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2546 :: 		case 'N': return 8;
L_GLCD_CharWidth550:
	MOVLW       8
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2547 :: 		case 'O': return 9;
L_GLCD_CharWidth551:
	MOVLW       9
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2548 :: 		case 'P': return 7;
L_GLCD_CharWidth552:
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2549 :: 		case 'Q': return 9;
L_GLCD_CharWidth553:
	MOVLW       9
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2550 :: 		case 'R': return 8;
L_GLCD_CharWidth554:
	MOVLW       8
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2551 :: 		case 'S': return 5;
L_GLCD_CharWidth555:
	MOVLW       5
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2552 :: 		case 'T': return 8;
L_GLCD_CharWidth556:
	MOVLW       8
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2553 :: 		case 'U': return 8;
L_GLCD_CharWidth557:
	MOVLW       8
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2554 :: 		case 'V': return 8;
L_GLCD_CharWidth558:
	MOVLW       8
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2555 :: 		case 'W': return 9;
L_GLCD_CharWidth559:
	MOVLW       9
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2556 :: 		case 'X': return 7;
L_GLCD_CharWidth560:
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2557 :: 		case 'Y': return 7;
L_GLCD_CharWidth561:
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2558 :: 		case 'Z': return 7;
L_GLCD_CharWidth562:
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2561 :: 		case '[': return 3;
L_GLCD_CharWidth563:
	MOVLW       3
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2562 :: 		case '\\': return 4;
L_GLCD_CharWidth564:
	MOVLW       4
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2563 :: 		case ']': return 3;
L_GLCD_CharWidth565:
	MOVLW       3
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2564 :: 		case '^': return 4;
L_GLCD_CharWidth566:
	MOVLW       4
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2565 :: 		case '_': return 6;
L_GLCD_CharWidth567:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2566 :: 		case '`': return 3;
L_GLCD_CharWidth568:
	MOVLW       3
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2569 :: 		case 'a': return 6;
L_GLCD_CharWidth569:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2570 :: 		case 'b': return 6;
L_GLCD_CharWidth570:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2571 :: 		case 'c': return 6;
L_GLCD_CharWidth571:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2572 :: 		case 'd': return 7;
L_GLCD_CharWidth572:
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2573 :: 		case 'e': return 6;
L_GLCD_CharWidth573:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2574 :: 		case 'f': return 4;
L_GLCD_CharWidth574:
	MOVLW       4
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2575 :: 		case 'g': return 6;
L_GLCD_CharWidth575:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2576 :: 		case 'h': return 6;
L_GLCD_CharWidth576:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2577 :: 		case 'i': return 1;
L_GLCD_CharWidth577:
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2578 :: 		case 'j': return 3;
L_GLCD_CharWidth578:
	MOVLW       3
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2579 :: 		case 'k': return 6;
L_GLCD_CharWidth579:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2580 :: 		case 'l': return 1;
L_GLCD_CharWidth580:
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2581 :: 		case 'm': return 10;
L_GLCD_CharWidth581:
	MOVLW       10
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2582 :: 		case 'n': return 8;
L_GLCD_CharWidth582:
	MOVLW       8
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2583 :: 		case 'o': return 6;
L_GLCD_CharWidth583:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2584 :: 		case 'p': return 6;
L_GLCD_CharWidth584:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2585 :: 		case 'q': return 6;
L_GLCD_CharWidth585:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2586 :: 		case 'r': return 4;
L_GLCD_CharWidth586:
	MOVLW       4
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2587 :: 		case 's': return 6;
L_GLCD_CharWidth587:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2588 :: 		case 't': return 4;
L_GLCD_CharWidth588:
	MOVLW       4
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2589 :: 		case 'u': return 6;
L_GLCD_CharWidth589:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2590 :: 		case 'v': return 6;
L_GLCD_CharWidth590:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2591 :: 		case 'w': return 9;
L_GLCD_CharWidth591:
	MOVLW       9
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2592 :: 		case 'x': return 6;
L_GLCD_CharWidth592:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2593 :: 		case 'y': return 6;
L_GLCD_CharWidth593:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2594 :: 		case 'z': return 6;
L_GLCD_CharWidth594:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2597 :: 		case '{': return 4;
L_GLCD_CharWidth595:
	MOVLW       4
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2598 :: 		case '|': return 2;
L_GLCD_CharWidth596:
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2599 :: 		case '}': return 4;
L_GLCD_CharWidth597:
	MOVLW       4
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2600 :: 		case '~': return 6;
L_GLCD_CharWidth598:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2603 :: 		case 127: return 0;
L_GLCD_CharWidth599:
	CLRF        R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2605 :: 		default:
L_GLCD_CharWidth600:
;Control_Fn.c,2606 :: 		return 6;
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_GLCD_CharWidth
;Control_Fn.c,2607 :: 		}
L_GLCD_CharWidth502:
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       32
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth504
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       33
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth505
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       34
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth506
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       35
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth507
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       36
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth508
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       37
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth509
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       38
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth510
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       39
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth511
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       40
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth512
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       41
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth513
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       42
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth514
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       43
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth515
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       44
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth516
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       45
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth517
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       46
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth518
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       47
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth519
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       48
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth520
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       49
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth521
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth522
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth523
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       52
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth524
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       53
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth525
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       54
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth526
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       55
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth527
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       56
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth528
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       57
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth529
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       58
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth530
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       59
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth531
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       60
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth532
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       61
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth533
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       62
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth534
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       63
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth535
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       64
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth536
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       65
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth537
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       66
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth538
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       67
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth539
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       68
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth540
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       69
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth541
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       70
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth542
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       71
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth543
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       72
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth544
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       73
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth545
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       74
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth546
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       75
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth547
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       76
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth548
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       77
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth549
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       78
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth550
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       79
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth551
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       80
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth552
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       81
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth553
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       82
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth554
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       83
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth555
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       84
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth556
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       85
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth557
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       86
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth558
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       87
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth559
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       88
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth560
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       89
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth561
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       90
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth562
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       91
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth563
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       92
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth564
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       93
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth565
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       94
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth566
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       95
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth567
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       96
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth568
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       97
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth569
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       98
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth570
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       99
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth571
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       100
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth572
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       101
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth573
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       102
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth574
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       103
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth575
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       104
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth576
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       105
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth577
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       106
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth578
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       107
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth579
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       108
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth580
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       109
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth581
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       110
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth582
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       111
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth583
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       112
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth584
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       113
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth585
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       114
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth586
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       115
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth587
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       116
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth588
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       117
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth589
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       118
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth590
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       119
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth591
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       120
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth592
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       121
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth593
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       122
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth594
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       123
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth595
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       124
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth596
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       125
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth597
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       126
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth598
	MOVF        FARG_GLCD_CharWidth_ch+0, 0 
	XORLW       127
	BTFSC       STATUS+0, 2 
	GOTO        L_GLCD_CharWidth599
	GOTO        L_GLCD_CharWidth600
;Control_Fn.c,2608 :: 		}
L_end_GLCD_CharWidth:
	RETURN      0
; end of _GLCD_CharWidth

_T6963C_Write_Text_Adv_ROM:

;Control_Fn.c,2617 :: 		unsigned char y)
;Control_Fn.c,2622 :: 		unsigned char col = x;
	MOVF        FARG_T6963C_Write_Text_Adv_ROM_x+0, 0 
	MOVWF       T6963C_Write_Text_Adv_ROM_col_L0+0 
;Control_Fn.c,2626 :: 		while (*text)
L_T6963C_Write_Text_Adv_ROM601:
	MOVF        FARG_T6963C_Write_Text_Adv_ROM_text+0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        FARG_T6963C_Write_Text_Adv_ROM_text+1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        FARG_T6963C_Write_Text_Adv_ROM_text+2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_T6963C_Write_Text_Adv_ROM602
;Control_Fn.c,2628 :: 		ch =*text;
	MOVF        FARG_T6963C_Write_Text_Adv_ROM_text+0, 0 
	MOVWF       TBLPTRL+0 
	MOVF        FARG_T6963C_Write_Text_Adv_ROM_text+1, 0 
	MOVWF       TBLPTRH+0 
	MOVF        FARG_T6963C_Write_Text_Adv_ROM_text+2, 0 
	MOVWF       TBLPTRU+0 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Char_Adv_ch+0
;Control_Fn.c,2629 :: 		T6963C_write_char_adv(ch, col, y);
	MOVF        T6963C_Write_Text_Adv_ROM_col_L0+0, 0 
	MOVWF       FARG_T6963C_Write_Char_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_x+1 
	MOVF        FARG_T6963C_Write_Text_Adv_ROM_y+0, 0 
	MOVWF       FARG_T6963C_Write_Char_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Char_Adv_y+1 
	CALL        _T6963C_Write_Char_Adv+0, 0
;Control_Fn.c,2630 :: 		text++;
	MOVLW       1
	ADDWF       FARG_T6963C_Write_Text_Adv_ROM_text+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Write_Text_Adv_ROM_text+1, 1 
	ADDWFC      FARG_T6963C_Write_Text_Adv_ROM_text+2, 1 
;Control_Fn.c,2632 :: 		col +=8;
	MOVLW       8
	ADDWF       T6963C_Write_Text_Adv_ROM_col_L0+0, 1 
;Control_Fn.c,2633 :: 		delay_us(10);
	MOVLW       53
	MOVWF       R13, 0
L_T6963C_Write_Text_Adv_ROM603:
	DECFSZ      R13, 1, 1
	BRA         L_T6963C_Write_Text_Adv_ROM603
;Control_Fn.c,2635 :: 		if (col >= 240)
	MOVLW       240
	SUBWF       T6963C_Write_Text_Adv_ROM_col_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_T6963C_Write_Text_Adv_ROM604
;Control_Fn.c,2637 :: 		break;
	GOTO        L_T6963C_Write_Text_Adv_ROM602
;Control_Fn.c,2638 :: 		}
L_T6963C_Write_Text_Adv_ROM604:
;Control_Fn.c,2639 :: 		}
	GOTO        L_T6963C_Write_Text_Adv_ROM601
L_T6963C_Write_Text_Adv_ROM602:
;Control_Fn.c,2640 :: 		}
L_end_T6963C_Write_Text_Adv_ROM:
	RETURN      0
; end of _T6963C_Write_Text_Adv_ROM

_Loading_Fill:

;Control_Fn.c,2645 :: 		void Loading_Fill(unsigned char percent)
;Control_Fn.c,2647 :: 		int x0 = 81;   // inside start
	MOVLW       81
	MOVWF       Loading_Fill_x0_L0+0 
	MOVLW       0
	MOVWF       Loading_Fill_x0_L0+1 
	MOVLW       104
	MOVWF       Loading_Fill_y0_L0+0 
	MOVLW       0
	MOVWF       Loading_Fill_y0_L0+1 
	MOVLW       160
	MOVWF       Loading_Fill_x1_L0+0 
	MOVLW       0
	MOVWF       Loading_Fill_x1_L0+1 
	MOVLW       90
	MOVWF       Loading_Fill_y1_L0+0 
	MOVLW       0
	MOVWF       Loading_Fill_y1_L0+1 
;Control_Fn.c,2652 :: 		int fillX = x0 + ((x1 - x0) * percent) / 100;
	MOVF        Loading_Fill_x0_L0+0, 0 
	SUBWF       Loading_Fill_x1_L0+0, 0 
	MOVWF       R0 
	MOVF        Loading_Fill_x0_L0+1, 0 
	SUBWFB      Loading_Fill_x1_L0+1, 0 
	MOVWF       R1 
	MOVF        FARG_Loading_Fill_percent+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	ADDWF       Loading_Fill_x0_L0+0, 0 
	MOVWF       Loading_Fill_fillX_L0+0 
	MOVF        R1, 0 
	ADDWFC      Loading_Fill_x0_L0+1, 0 
	MOVWF       Loading_Fill_fillX_L0+1 
;Control_Fn.c,2656 :: 		T6963C_box(108, 72, 132,80, T6963C_BLACK);
	MOVLW       108
	MOVWF       FARG_T6963C_box_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x0+1 
	MOVLW       72
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVLW       132
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       80
	MOVWF       FARG_T6963C_box_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y1+1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2658 :: 		GLCD_Print_Int_With_LeadingZero(percent , 108 , 72 );
	MOVF        FARG_Loading_Fill_percent+0, 0 
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_value+0 
	MOVLW       108
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_x+0 
	MOVLW       72
	MOVWF       FARG_GLCD_Print_Int_With_LeadingZero_y+0 
	CALL        _GLCD_Print_Int_With_LeadingZero+0, 0
;Control_Fn.c,2659 :: 		T6963C_Write_Text_Adv_ROM("%",123,72);
	MOVLW       ?lstr_158_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_158_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_158_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       123
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       72
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,2660 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_Loading_Fill605:
	DECFSZ      R13, 1, 1
	BRA         L_Loading_Fill605
	DECFSZ      R12, 1, 1
	BRA         L_Loading_Fill605
	NOP
	NOP
;Control_Fn.c,2663 :: 		T6963C_box(x0, y0, fillX, y1, T6963C_WHITE);
	MOVF        Loading_Fill_x0_L0+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	MOVF        Loading_Fill_x0_L0+1, 0 
	MOVWF       FARG_T6963C_box_x0+1 
	MOVF        Loading_Fill_y0_L0+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVF        Loading_Fill_y0_L0+1, 0 
	MOVWF       FARG_T6963C_box_y0+1 
	MOVF        Loading_Fill_fillX_L0+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVF        Loading_Fill_fillX_L0+1, 0 
	MOVWF       FARG_T6963C_box_x1+1 
	MOVF        Loading_Fill_y1_L0+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	MOVF        Loading_Fill_y1_L0+1, 0 
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2666 :: 		}
L_end_Loading_Fill:
	RETURN      0
; end of _Loading_Fill

_Verify_EEPROM_Data_Clear:

;Control_Fn.c,2670 :: 		void Verify_EEPROM_Data_Clear()
;Control_Fn.c,2673 :: 		unsigned int i=0,j=0,k=0;
	CLRF        Verify_EEPROM_Data_Clear_i_L0+0 
	CLRF        Verify_EEPROM_Data_Clear_i_L0+1 
	CLRF        Verify_EEPROM_Data_Clear_j_L0+0 
	CLRF        Verify_EEPROM_Data_Clear_j_L0+1 
	CLRF        Verify_EEPROM_Data_Clear_k_L0+0 
	CLRF        Verify_EEPROM_Data_Clear_k_L0+1 
;Control_Fn.c,2675 :: 		T6963C_PanelFill(0);
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
;Control_Fn.c,2676 :: 		T6963C_Write_Text_Adv_ROM("CHECKING DATA..",60,60);
	MOVLW       ?lstr_159_Control_Fn+0
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+0 
	MOVLW       hi_addr(?lstr_159_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+1 
	MOVLW       higher_addr(?lstr_159_Control_Fn+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_text+2 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_x+0 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_ROM_y+0 
	CALL        _T6963C_Write_Text_Adv_ROM+0, 0
;Control_Fn.c,2685 :: 		T6963C_rectangle(80,104, 160, 90 , T6963C_WHITE); //FOR ANMIATION OUTER BOX
	MOVLW       80
	MOVWF       FARG_T6963C_rectangle_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_rectangle_x0+1 
	MOVLW       104
	MOVWF       FARG_T6963C_rectangle_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_rectangle_y0+1 
	MOVLW       160
	MOVWF       FARG_T6963C_rectangle_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_rectangle_x1+1 
	MOVLW       90
	MOVWF       FARG_T6963C_rectangle_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_rectangle_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_rectangle_pcolor+0 
	CALL        _T6963C_rectangle+0, 0
;Control_Fn.c,2687 :: 		for (i=0 ;i<16 ;i++)
	CLRF        Verify_EEPROM_Data_Clear_i_L0+0 
	CLRF        Verify_EEPROM_Data_Clear_i_L0+1 
L_Verify_EEPROM_Data_Clear606:
	MOVLW       0
	SUBWF       Verify_EEPROM_Data_Clear_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Verify_EEPROM_Data_Clear748
	MOVLW       16
	SUBWF       Verify_EEPROM_Data_Clear_i_L0+0, 0 
L__Verify_EEPROM_Data_Clear748:
	BTFSC       STATUS+0, 0 
	GOTO        L_Verify_EEPROM_Data_Clear607
;Control_Fn.c,2689 :: 		j=i*96;
	MOVF        Verify_EEPROM_Data_Clear_i_L0+0, 0 
	MOVWF       R0 
	MOVF        Verify_EEPROM_Data_Clear_i_L0+1, 0 
	MOVWF       R1 
	MOVLW       96
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       Verify_EEPROM_Data_Clear_j_L0+0 
	MOVF        R1, 0 
	MOVWF       Verify_EEPROM_Data_Clear_j_L0+1 
;Control_Fn.c,2691 :: 		for(k=j ; k< (96+j) ; k++)   //EXTERNAL
	MOVF        R0, 0 
	MOVWF       Verify_EEPROM_Data_Clear_k_L0+0 
	MOVF        R1, 0 
	MOVWF       Verify_EEPROM_Data_Clear_k_L0+1 
L_Verify_EEPROM_Data_Clear609:
	MOVLW       96
	ADDWF       Verify_EEPROM_Data_Clear_j_L0+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      Verify_EEPROM_Data_Clear_j_L0+1, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       Verify_EEPROM_Data_Clear_k_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Verify_EEPROM_Data_Clear749
	MOVF        R1, 0 
	SUBWF       Verify_EEPROM_Data_Clear_k_L0+0, 0 
L__Verify_EEPROM_Data_Clear749:
	BTFSC       STATUS+0, 0 
	GOTO        L_Verify_EEPROM_Data_Clear610
;Control_Fn.c,2693 :: 		Loading_Fill(i+50);// from 50 to  66
	MOVLW       50
	ADDWF       Verify_EEPROM_Data_Clear_i_L0+0, 0 
	MOVWF       FARG_Loading_Fill_percent+0 
	CALL        _Loading_Fill+0, 0
;Control_Fn.c,2694 :: 		EEPROM_Value_Read_Check = EEPROM_AT24C32_RdInt(InchA_addr+(2*k));
	MOVF        Verify_EEPROM_Data_Clear_k_L0+0, 0 
	MOVWF       R0 
	MOVF        Verify_EEPROM_Data_Clear_k_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       16
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdInt_rAddr+1 
	CALL        _EEPROM_AT24C32_RdInt+0, 0
	MOVF        R0, 0 
	MOVWF       _EEPROM_Value_Read_Check+0 
	MOVF        R1, 0 
	MOVWF       _EEPROM_Value_Read_Check+1 
;Control_Fn.c,2695 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_Verify_EEPROM_Data_Clear612:
	DECFSZ      R13, 1, 1
	BRA         L_Verify_EEPROM_Data_Clear612
	DECFSZ      R12, 1, 1
	BRA         L_Verify_EEPROM_Data_Clear612
	NOP
	NOP
;Control_Fn.c,2696 :: 		if( 0  != EEPROM_Value_Read_Check  )
	MOVLW       0
	XORWF       _EEPROM_Value_Read_Check+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Verify_EEPROM_Data_Clear750
	MOVF        _EEPROM_Value_Read_Check+0, 0 
	XORLW       0
L__Verify_EEPROM_Data_Clear750:
	BTFSC       STATUS+0, 2 
	GOTO        L_Verify_EEPROM_Data_Clear613
;Control_Fn.c,2698 :: 		EEPROM_RST_Check_bit=1;
	BSF         _EEPROM_RST_Check_bit+0, BitPos(_EEPROM_RST_Check_bit+0) 
;Control_Fn.c,2699 :: 		break;
	GOTO        L_Verify_EEPROM_Data_Clear610
;Control_Fn.c,2700 :: 		}
L_Verify_EEPROM_Data_Clear613:
;Control_Fn.c,2691 :: 		for(k=j ; k< (96+j) ; k++)   //EXTERNAL
	INFSNZ      Verify_EEPROM_Data_Clear_k_L0+0, 1 
	INCF        Verify_EEPROM_Data_Clear_k_L0+1, 1 
;Control_Fn.c,2702 :: 		}
	GOTO        L_Verify_EEPROM_Data_Clear609
L_Verify_EEPROM_Data_Clear610:
;Control_Fn.c,2687 :: 		for (i=0 ;i<16 ;i++)
	INFSNZ      Verify_EEPROM_Data_Clear_i_L0+0, 1 
	INCF        Verify_EEPROM_Data_Clear_i_L0+1, 1 
;Control_Fn.c,2703 :: 		}
	GOTO        L_Verify_EEPROM_Data_Clear606
L_Verify_EEPROM_Data_Clear607:
;Control_Fn.c,2705 :: 		for(i=0;i<16;i++)   //INTERNAL
	CLRF        Verify_EEPROM_Data_Clear_i_L0+0 
	CLRF        Verify_EEPROM_Data_Clear_i_L0+1 
L_Verify_EEPROM_Data_Clear614:
	MOVLW       0
	SUBWF       Verify_EEPROM_Data_Clear_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Verify_EEPROM_Data_Clear751
	MOVLW       16
	SUBWF       Verify_EEPROM_Data_Clear_i_L0+0, 0 
L__Verify_EEPROM_Data_Clear751:
	BTFSC       STATUS+0, 0 
	GOTO        L_Verify_EEPROM_Data_Clear615
;Control_Fn.c,2708 :: 		Loading_Fill(i+84);// from 84 to  100
	MOVLW       84
	ADDWF       Verify_EEPROM_Data_Clear_i_L0+0, 0 
	MOVWF       FARG_Loading_Fill_percent+0 
	CALL        _Loading_Fill+0, 0
;Control_Fn.c,2709 :: 		EEPROM_Value_Read_Check=EEPROM_Read_int((InchA_addr_Temp+(2*i)));
	MOVF        Verify_EEPROM_Data_Clear_i_L0+0, 0 
	MOVWF       R0 
	MOVF        Verify_EEPROM_Data_Clear_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       32
	ADDWF       R0, 0 
	MOVWF       FARG_EEPROM_Read_int_Addr+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_EEPROM_Read_int_Addr+1 
	CALL        _EEPROM_Read_int+0, 0
	MOVF        R0, 0 
	MOVWF       _EEPROM_Value_Read_Check+0 
	MOVF        R1, 0 
	MOVWF       _EEPROM_Value_Read_Check+1 
;Control_Fn.c,2710 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_Verify_EEPROM_Data_Clear617:
	DECFSZ      R13, 1, 1
	BRA         L_Verify_EEPROM_Data_Clear617
	DECFSZ      R12, 1, 1
	BRA         L_Verify_EEPROM_Data_Clear617
	NOP
	NOP
;Control_Fn.c,2711 :: 		if( 0  != EEPROM_Value_Read_Check  )
	MOVLW       0
	XORWF       _EEPROM_Value_Read_Check+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Verify_EEPROM_Data_Clear752
	MOVF        _EEPROM_Value_Read_Check+0, 0 
	XORLW       0
L__Verify_EEPROM_Data_Clear752:
	BTFSC       STATUS+0, 2 
	GOTO        L_Verify_EEPROM_Data_Clear618
;Control_Fn.c,2713 :: 		EEPROM_RST_Check_bit=1;
	BSF         _EEPROM_RST_Check_bit+0, BitPos(_EEPROM_RST_Check_bit+0) 
;Control_Fn.c,2714 :: 		break;
	GOTO        L_Verify_EEPROM_Data_Clear615
;Control_Fn.c,2715 :: 		}
L_Verify_EEPROM_Data_Clear618:
;Control_Fn.c,2705 :: 		for(i=0;i<16;i++)   //INTERNAL
	INFSNZ      Verify_EEPROM_Data_Clear_i_L0+0, 1 
	INCF        Verify_EEPROM_Data_Clear_i_L0+1, 1 
;Control_Fn.c,2716 :: 		}
	GOTO        L_Verify_EEPROM_Data_Clear614
L_Verify_EEPROM_Data_Clear615:
;Control_Fn.c,2744 :: 		if(EEPROM_RST_Check_bit == 1 && EEPROM_Reset_Attempt_Count_bit == 0 )  //FIRST TIME
	BTFSS       _EEPROM_RST_Check_bit+0, BitPos(_EEPROM_RST_Check_bit+0) 
	GOTO        L_Verify_EEPROM_Data_Clear621
	BTFSC       _EEPROM_Reset_Attempt_Count_bit+0, BitPos(_EEPROM_Reset_Attempt_Count_bit+0) 
	GOTO        L_Verify_EEPROM_Data_Clear621
L__Verify_EEPROM_Data_Clear695:
;Control_Fn.c,2746 :: 		EEPROM_Reset_Attempt_Count_bit=1;
	BSF         _EEPROM_Reset_Attempt_Count_bit+0, BitPos(_EEPROM_Reset_Attempt_Count_bit+0) 
;Control_Fn.c,2747 :: 		}
	GOTO        L_Verify_EEPROM_Data_Clear622
L_Verify_EEPROM_Data_Clear621:
;Control_Fn.c,2748 :: 		else if(EEPROM_RST_Check_bit == 1 && EEPROM_Reset_Attempt_Count_bit == 1) //SECOND TIME
	BTFSS       _EEPROM_RST_Check_bit+0, BitPos(_EEPROM_RST_Check_bit+0) 
	GOTO        L_Verify_EEPROM_Data_Clear625
	BTFSS       _EEPROM_Reset_Attempt_Count_bit+0, BitPos(_EEPROM_Reset_Attempt_Count_bit+0) 
	GOTO        L_Verify_EEPROM_Data_Clear625
L__Verify_EEPROM_Data_Clear694:
;Control_Fn.c,2751 :: 		EEPROM_Reset_Attempt_Count_bit=2;//TO AVOID ENDLESS RESET PURPOSE
	BCF         _EEPROM_Reset_Attempt_Count_bit+0, BitPos(_EEPROM_Reset_Attempt_Count_bit+0) 
;Control_Fn.c,2753 :: 		}
L_Verify_EEPROM_Data_Clear625:
L_Verify_EEPROM_Data_Clear622:
;Control_Fn.c,2759 :: 		}
L_end_Verify_EEPROM_Data_Clear:
	RETURN      0
; end of _Verify_EEPROM_Data_Clear

_Left_Side_Meter_Update:

;Control_Fn.c,2762 :: 		void Left_Side_Meter_Update()
;Control_Fn.c,2766 :: 		for( i=0 ;i < 8 ; i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_Left_Side_Meter_Update626:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Left_Side_Meter_Update754
	MOVLW       8
	SUBWF       _i+0, 0 
L__Left_Side_Meter_Update754:
	BTFSC       STATUS+0, 0 
	GOTO        L_Left_Side_Meter_Update627
;Control_Fn.c,2768 :: 		asm CLRWDT;
	CLRWDT
;Control_Fn.c,2769 :: 		Meter[i]=( (float)(0.0254*Inch[i] ));
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVF        _i+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _Meter+0
	ADDWF       R0, 0 
	MOVWF       FLOC__Left_Side_Meter_Update+0 
	MOVLW       hi_addr(_Meter+0)
	ADDWFC      R1, 0 
	MOVWF       FLOC__Left_Side_Meter_Update+1 
	MOVLW       _Inch+0
	ADDWF       R0, 0 
	MOVWF       FSR2L+0 
	MOVLW       hi_addr(_Inch+0)
	ADDWFC      R1, 0 
	MOVWF       FSR2L+1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R0 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        POSTINC2+0, 0 
	MOVWF       R3 
	MOVLW       169
	MOVWF       R4 
	MOVLW       19
	MOVWF       R5 
	MOVLW       80
	MOVWF       R6 
	MOVLW       121
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVFF       FLOC__Left_Side_Meter_Update+0, FSR1L+0
	MOVFF       FLOC__Left_Side_Meter_Update+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;Control_Fn.c,2770 :: 		T6963C_box(75+Fi_Xpos, 1+Ypos+(13*i), 75+Fi_Xpos+35, Ypos+(13*i)+10, T6963C_BLACK);//BOX
	MOVLW       75
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FLOC__Left_Side_Meter_Update+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
	MOVWF       FLOC__Left_Side_Meter_Update+1 
	MOVF        FLOC__Left_Side_Meter_Update+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	MOVF        FLOC__Left_Side_Meter_Update+1, 0 
	MOVWF       FARG_T6963C_box_x0+1 
	MOVLW       1
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y0+1 
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
	ADDWF       FARG_T6963C_box_y0+0, 1 
	MOVF        R1, 0 
	ADDWFC      FARG_T6963C_box_y0+1, 1 
	MOVLW       35
	ADDWF       FLOC__Left_Side_Meter_Update+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	ADDWFC      FLOC__Left_Side_Meter_Update+1, 0 
	MOVWF       FARG_T6963C_box_x1+1 
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       10
	ADDWF       FARG_T6963C_box_y1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2771 :: 		FloatToStr_SingleDecimal(Meter[i],Text);
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVF        _i+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _Meter+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_Meter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+3 
	MOVLW       _Text+0
	MOVWF       FARG_FloatToStr_SingleDecimal_str+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_FloatToStr_SingleDecimal_str+1 
	CALL        _FloatToStr_SingleDecimal+0, 0
;Control_Fn.c,2772 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,2773 :: 		T6963C_Write_Text_Adv(Text,82+Fi_Xpos       ,Ypos+(13*i));// VALUE [METER]
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       82
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
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
;Control_Fn.c,2774 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,2775 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Left_Side_Meter_Update629:
	DECFSZ      R13, 1, 1
	BRA         L_Left_Side_Meter_Update629
	DECFSZ      R12, 1, 1
	BRA         L_Left_Side_Meter_Update629
	NOP
;Control_Fn.c,2766 :: 		for( i=0 ;i < 8 ; i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;Control_Fn.c,2776 :: 		}
	GOTO        L_Left_Side_Meter_Update626
L_Left_Side_Meter_Update627:
;Control_Fn.c,2778 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Left_Side_Meter_Update630:
	DECFSZ      R13, 1, 1
	BRA         L_Left_Side_Meter_Update630
	DECFSZ      R12, 1, 1
	BRA         L_Left_Side_Meter_Update630
	NOP
;Control_Fn.c,2779 :: 		}
L_end_Left_Side_Meter_Update:
	RETURN      0
; end of _Left_Side_Meter_Update

_Left_Side_Meter_PAY_Update:

;Control_Fn.c,2782 :: 		void Left_Side_Meter_PAY_Update()
;Control_Fn.c,2799 :: 		for( i=0 ;i < 8 ; i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_Left_Side_Meter_PAY_Update631:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Left_Side_Meter_PAY_Update756
	MOVLW       8
	SUBWF       _i+0, 0 
L__Left_Side_Meter_PAY_Update756:
	BTFSC       STATUS+0, 0 
	GOTO        L_Left_Side_Meter_PAY_Update632
;Control_Fn.c,2801 :: 		asm CLRWDT;
	CLRWDT
;Control_Fn.c,2804 :: 		T6963C_box(44+Fi_Xpos, 1+Ypos+(13*i), 44+Fi_Xpos+27, Ypos+(13*i)+10, T6963C_BLACK);//CLEAR PURPOSE
	MOVLW       44
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FLOC__Left_Side_Meter_PAY_Update+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
	MOVWF       FLOC__Left_Side_Meter_PAY_Update+1 
	MOVF        FLOC__Left_Side_Meter_PAY_Update+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	MOVF        FLOC__Left_Side_Meter_PAY_Update+1, 0 
	MOVWF       FARG_T6963C_box_x0+1 
	MOVLW       1
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y0+1 
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
	ADDWF       FARG_T6963C_box_y0+0, 1 
	MOVF        R1, 0 
	ADDWFC      FARG_T6963C_box_y0+1, 1 
	MOVLW       27
	ADDWF       FLOC__Left_Side_Meter_PAY_Update+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	ADDWFC      FLOC__Left_Side_Meter_PAY_Update+1, 0 
	MOVWF       FARG_T6963C_box_x1+1 
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       10
	ADDWF       FARG_T6963C_box_y1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2805 :: 		MulFloat_To1DecimalStr(Meter[i] , Pay_Value , Text);
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVF        _i+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _Meter+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_Meter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_A+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_A+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_A+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_A+3 
	MOVF        _Pay_Value+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_B+0 
	MOVF        _Pay_Value+1, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_B+1 
	MOVF        _Pay_Value+2, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_B+2 
	MOVF        _Pay_Value+3, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_B+3 
	MOVLW       _Text+0
	MOVWF       FARG_MulFloat_To1DecimalStr_out+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_MulFloat_To1DecimalStr_out+1 
	CALL        _MulFloat_To1DecimalStr+0, 0
;Control_Fn.c,2807 :: 		T6963C_Write_Text_Adv(Text,52+Fi_Xpos       ,Ypos+(13*i));
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       52
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
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
;Control_Fn.c,2808 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Left_Side_Meter_PAY_Update634:
	DECFSZ      R13, 1, 1
	BRA         L_Left_Side_Meter_PAY_Update634
	DECFSZ      R12, 1, 1
	BRA         L_Left_Side_Meter_PAY_Update634
	NOP
;Control_Fn.c,2799 :: 		for( i=0 ;i < 8 ; i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;Control_Fn.c,2809 :: 		}
	GOTO        L_Left_Side_Meter_PAY_Update631
L_Left_Side_Meter_PAY_Update632:
;Control_Fn.c,2811 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Left_Side_Meter_PAY_Update635:
	DECFSZ      R13, 1, 1
	BRA         L_Left_Side_Meter_PAY_Update635
	DECFSZ      R12, 1, 1
	BRA         L_Left_Side_Meter_PAY_Update635
	NOP
;Control_Fn.c,2812 :: 		}
L_end_Left_Side_Meter_PAY_Update:
	RETURN      0
; end of _Left_Side_Meter_PAY_Update

_Right_Side_Meter_Update:

;Control_Fn.c,2815 :: 		void Right_Side_Meter_Update()
;Control_Fn.c,2818 :: 		for( i= 0 ;i < 8 ; i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_Right_Side_Meter_Update636:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Right_Side_Meter_Update758
	MOVLW       8
	SUBWF       _i+0, 0 
L__Right_Side_Meter_Update758:
	BTFSC       STATUS+0, 0 
	GOTO        L_Right_Side_Meter_Update637
;Control_Fn.c,2820 :: 		asm CLRWDT;
	CLRWDT
;Control_Fn.c,2823 :: 		Meter [i+8]=( (float)(0.0254*Inch[i+8] ));
	MOVLW       8
	ADDWF       _i+0, 0 
	MOVWF       R3 
	MOVLW       0
	ADDWFC      _i+1, 0 
	MOVWF       R4 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _Meter+0
	ADDWF       R0, 0 
	MOVWF       FLOC__Right_Side_Meter_Update+0 
	MOVLW       hi_addr(_Meter+0)
	ADDWFC      R1, 0 
	MOVWF       FLOC__Right_Side_Meter_Update+1 
	MOVLW       _Inch+0
	ADDWF       R0, 0 
	MOVWF       FSR2L+0 
	MOVLW       hi_addr(_Inch+0)
	ADDWFC      R1, 0 
	MOVWF       FSR2L+1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R0 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        POSTINC2+0, 0 
	MOVWF       R3 
	MOVLW       169
	MOVWF       R4 
	MOVLW       19
	MOVWF       R5 
	MOVLW       80
	MOVWF       R6 
	MOVLW       121
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVFF       FLOC__Right_Side_Meter_Update+0, FSR1L+0
	MOVFF       FLOC__Right_Side_Meter_Update+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;Control_Fn.c,2824 :: 		T6963C_box(195+Fi_Xpos, 1+Ypos+(13*i), 195+Fi_Xpos+35, Ypos+(13*i)+10, T6963C_BLACK);
	MOVLW       195
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FLOC__Right_Side_Meter_Update+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
	MOVWF       FLOC__Right_Side_Meter_Update+1 
	MOVF        FLOC__Right_Side_Meter_Update+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	MOVF        FLOC__Right_Side_Meter_Update+1, 0 
	MOVWF       FARG_T6963C_box_x0+1 
	MOVLW       1
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y0+1 
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
	ADDWF       FARG_T6963C_box_y0+0, 1 
	MOVF        R1, 0 
	ADDWFC      FARG_T6963C_box_y0+1, 1 
	MOVLW       35
	ADDWF       FLOC__Right_Side_Meter_Update+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	ADDWFC      FLOC__Right_Side_Meter_Update+1, 0 
	MOVWF       FARG_T6963C_box_x1+1 
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       10
	ADDWF       FARG_T6963C_box_y1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2825 :: 		FloatToStr_SingleDecimal(Meter [i+8],Text);
	MOVLW       8
	ADDWF       _i+0, 0 
	MOVWF       R3 
	MOVLW       0
	ADDWFC      _i+1, 0 
	MOVWF       R4 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _Meter+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_Meter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FloatToStr_SingleDecimal_num+3 
	MOVLW       _Text+0
	MOVWF       FARG_FloatToStr_SingleDecimal_str+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_FloatToStr_SingleDecimal_str+1 
	CALL        _FloatToStr_SingleDecimal+0, 0
;Control_Fn.c,2826 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,2827 :: 		T6963C_Write_Text_Adv(Text,204+Fi_Xpos       ,Ypos+(13*i));// VALUE [METER]
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       204
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
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
;Control_Fn.c,2828 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,2829 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Right_Side_Meter_Update639:
	DECFSZ      R13, 1, 1
	BRA         L_Right_Side_Meter_Update639
	DECFSZ      R12, 1, 1
	BRA         L_Right_Side_Meter_Update639
	NOP
;Control_Fn.c,2818 :: 		for( i= 0 ;i < 8 ; i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;Control_Fn.c,2830 :: 		}
	GOTO        L_Right_Side_Meter_Update636
L_Right_Side_Meter_Update637:
;Control_Fn.c,2831 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Right_Side_Meter_Update640:
	DECFSZ      R13, 1, 1
	BRA         L_Right_Side_Meter_Update640
	DECFSZ      R12, 1, 1
	BRA         L_Right_Side_Meter_Update640
	NOP
;Control_Fn.c,2832 :: 		}
L_end_Right_Side_Meter_Update:
	RETURN      0
; end of _Right_Side_Meter_Update

_Right_Side_Meter_PAY_Update:

;Control_Fn.c,2835 :: 		void Right_Side_Meter_PAY_Update()
;Control_Fn.c,2838 :: 		for( i= 0 ;i < 8 ; i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_Right_Side_Meter_PAY_Update641:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Right_Side_Meter_PAY_Update760
	MOVLW       8
	SUBWF       _i+0, 0 
L__Right_Side_Meter_PAY_Update760:
	BTFSC       STATUS+0, 0 
	GOTO        L_Right_Side_Meter_PAY_Update642
;Control_Fn.c,2840 :: 		asm CLRWDT;
	CLRWDT
;Control_Fn.c,2842 :: 		Value_float= (float)Meter [i+8]  * (float) Pay_Value;
	MOVLW       8
	ADDWF       _i+0, 0 
	MOVWF       R3 
	MOVLW       0
	ADDWFC      _i+1, 0 
	MOVWF       R4 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _Meter+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_Meter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        _Pay_Value+0, 0 
	MOVWF       R4 
	MOVF        _Pay_Value+1, 0 
	MOVWF       R5 
	MOVF        _Pay_Value+2, 0 
	MOVWF       R6 
	MOVF        _Pay_Value+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Value_float+0 
	MOVF        R1, 0 
	MOVWF       _Value_float+1 
	MOVF        R2, 0 
	MOVWF       _Value_float+2 
	MOVF        R3, 0 
	MOVWF       _Value_float+3 
;Control_Fn.c,2843 :: 		T6963C_box(164+Fi_Xpos, 1+Ypos+(13*i), 164+Fi_Xpos+27, Ypos+(13*i)+10, T6963C_BLACK);//CLEAR PURPOSE
	MOVLW       164
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FLOC__Right_Side_Meter_PAY_Update+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
	MOVWF       FLOC__Right_Side_Meter_PAY_Update+1 
	MOVF        FLOC__Right_Side_Meter_PAY_Update+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	MOVF        FLOC__Right_Side_Meter_PAY_Update+1, 0 
	MOVWF       FARG_T6963C_box_x0+1 
	MOVLW       1
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y0+1 
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
	ADDWF       FARG_T6963C_box_y0+0, 1 
	MOVF        R1, 0 
	ADDWFC      FARG_T6963C_box_y0+1, 1 
	MOVLW       27
	ADDWF       FLOC__Right_Side_Meter_PAY_Update+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	ADDWFC      FLOC__Right_Side_Meter_PAY_Update+1, 0 
	MOVWF       FARG_T6963C_box_x1+1 
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       10
	ADDWF       FARG_T6963C_box_y1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2844 :: 		MulFloat_To1DecimalStr(Meter[i+8] , Pay_Value , Text);
	MOVLW       8
	ADDWF       _i+0, 0 
	MOVWF       R3 
	MOVLW       0
	ADDWFC      _i+1, 0 
	MOVWF       R4 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _Meter+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_Meter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_A+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_A+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_A+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_A+3 
	MOVF        _Pay_Value+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_B+0 
	MOVF        _Pay_Value+1, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_B+1 
	MOVF        _Pay_Value+2, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_B+2 
	MOVF        _Pay_Value+3, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_B+3 
	MOVLW       _Text+0
	MOVWF       FARG_MulFloat_To1DecimalStr_out+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_MulFloat_To1DecimalStr_out+1 
	CALL        _MulFloat_To1DecimalStr+0, 0
;Control_Fn.c,2845 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,2846 :: 		T6963C_Write_Text_Adv(Text,173+Fi_Xpos       ,Ypos+(13*i));//PAY VALUE
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       173
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
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
;Control_Fn.c,2847 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,2848 :: 		Value_float=0;
	CLRF        _Value_float+0 
	CLRF        _Value_float+1 
	CLRF        _Value_float+2 
	CLRF        _Value_float+3 
;Control_Fn.c,2849 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Right_Side_Meter_PAY_Update644:
	DECFSZ      R13, 1, 1
	BRA         L_Right_Side_Meter_PAY_Update644
	DECFSZ      R12, 1, 1
	BRA         L_Right_Side_Meter_PAY_Update644
	NOP
;Control_Fn.c,2838 :: 		for( i= 0 ;i < 8 ; i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;Control_Fn.c,2850 :: 		}
	GOTO        L_Right_Side_Meter_PAY_Update641
L_Right_Side_Meter_PAY_Update642:
;Control_Fn.c,2851 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Right_Side_Meter_PAY_Update645:
	DECFSZ      R13, 1, 1
	BRA         L_Right_Side_Meter_PAY_Update645
	DECFSZ      R12, 1, 1
	BRA         L_Right_Side_Meter_PAY_Update645
	NOP
;Control_Fn.c,2852 :: 		}
L_end_Right_Side_Meter_PAY_Update:
	RETURN      0
; end of _Right_Side_Meter_PAY_Update

_Left_Side_Pick_Update:

;Control_Fn.c,2857 :: 		void Left_Side_Pick_Update()
;Control_Fn.c,2860 :: 		for( i=0 ;i < 8 ; i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_Left_Side_Pick_Update646:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Left_Side_Pick_Update762
	MOVLW       8
	SUBWF       _i+0, 0 
L__Left_Side_Pick_Update762:
	BTFSC       STATUS+0, 0 
	GOTO        L_Left_Side_Pick_Update647
;Control_Fn.c,2862 :: 		asm CLRWDT;
	CLRWDT
;Control_Fn.c,2863 :: 		Picks[i]= (float) ( Picks4inch [i] * Inch[i] );
	MOVF        _i+0, 0 
	MOVWF       R3 
	MOVF        _i+1, 0 
	MOVWF       R4 
	RLCF        R3, 1 
	BCF         R3, 0 
	RLCF        R4, 1 
	RLCF        R3, 1 
	BCF         R3, 0 
	RLCF        R4, 1 
	MOVLW       _Picks+0
	ADDWF       R3, 0 
	MOVWF       FLOC__Left_Side_Pick_Update+2 
	MOVLW       hi_addr(_Picks+0)
	ADDWFC      R4, 0 
	MOVWF       FLOC__Left_Side_Pick_Update+3 
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVF        _i+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _Picks4inch+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_Picks4inch+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVLW       _Inch+0
	ADDWF       R3, 0 
	MOVWF       FLOC__Left_Side_Pick_Update+0 
	MOVLW       hi_addr(_Inch+0)
	ADDWFC      R4, 0 
	MOVWF       FLOC__Left_Side_Pick_Update+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVFF       FLOC__Left_Side_Pick_Update+0, FSR0L+0
	MOVFF       FLOC__Left_Side_Pick_Update+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
	MOVF        POSTINC0+0, 0 
	MOVWF       R6 
	MOVF        POSTINC0+0, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVFF       FLOC__Left_Side_Pick_Update+2, FSR1L+0
	MOVFF       FLOC__Left_Side_Pick_Update+3, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;Control_Fn.c,2865 :: 		T6963C_box(75+Fi_Xpos, 1+Ypos+(13*i), 75+Fi_Xpos+35, Ypos+(13*i)+10, T6963C_BLACK);//BOX
	MOVLW       75
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FLOC__Left_Side_Pick_Update+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
	MOVWF       FLOC__Left_Side_Pick_Update+1 
	MOVF        FLOC__Left_Side_Pick_Update+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	MOVF        FLOC__Left_Side_Pick_Update+1, 0 
	MOVWF       FARG_T6963C_box_x0+1 
	MOVLW       1
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y0+1 
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
	ADDWF       FARG_T6963C_box_y0+0, 1 
	MOVF        R1, 0 
	ADDWFC      FARG_T6963C_box_y0+1, 1 
	MOVLW       35
	ADDWF       FLOC__Left_Side_Pick_Update+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	ADDWFC      FLOC__Left_Side_Pick_Update+1, 0 
	MOVWF       FARG_T6963C_box_x1+1 
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       10
	ADDWF       FARG_T6963C_box_y1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2866 :: 		LongToStr( (long)Picks[i],Text);
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVF        _i+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _Picks+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_Picks+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _double2longint+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_LongToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_LongToStr_input+1 
	MOVF        R2, 0 
	MOVWF       FARG_LongToStr_input+2 
	MOVF        R3, 0 
	MOVWF       FARG_LongToStr_input+3 
	MOVLW       _Text+0
	MOVWF       FARG_LongToStr_output+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_LongToStr_output+1 
	CALL        _LongToStr+0, 0
;Control_Fn.c,2867 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,2868 :: 		T6963C_Write_Text_Adv(Text,78+Fi_Xpos       ,Ypos+(13*i));//  VALUE [PICKS]
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       78
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
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
;Control_Fn.c,2869 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,2870 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Left_Side_Pick_Update649:
	DECFSZ      R13, 1, 1
	BRA         L_Left_Side_Pick_Update649
	DECFSZ      R12, 1, 1
	BRA         L_Left_Side_Pick_Update649
	NOP
;Control_Fn.c,2860 :: 		for( i=0 ;i < 8 ; i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;Control_Fn.c,2871 :: 		}
	GOTO        L_Left_Side_Pick_Update646
L_Left_Side_Pick_Update647:
;Control_Fn.c,2872 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Left_Side_Pick_Update650:
	DECFSZ      R13, 1, 1
	BRA         L_Left_Side_Pick_Update650
	DECFSZ      R12, 1, 1
	BRA         L_Left_Side_Pick_Update650
	NOP
;Control_Fn.c,2873 :: 		}
L_end_Left_Side_Pick_Update:
	RETURN      0
; end of _Left_Side_Pick_Update

_Left_Side_Pick_Pay_Update:

;Control_Fn.c,2876 :: 		void Left_Side_Pick_Pay_Update()
;Control_Fn.c,2879 :: 		for( i=0 ;i < 8 ; i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_Left_Side_Pick_Pay_Update651:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Left_Side_Pick_Pay_Update764
	MOVLW       8
	SUBWF       _i+0, 0 
L__Left_Side_Pick_Pay_Update764:
	BTFSC       STATUS+0, 0 
	GOTO        L_Left_Side_Pick_Pay_Update652
;Control_Fn.c,2881 :: 		asm CLRWDT;
	CLRWDT
;Control_Fn.c,2882 :: 		T6963C_box(44+Fi_Xpos, 1+Ypos+(13*i), 44+Fi_Xpos+27, Ypos+(13*i)+10, T6963C_BLACK);//CLEAR PURPOSE
	MOVLW       44
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FLOC__Left_Side_Pick_Pay_Update+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
	MOVWF       FLOC__Left_Side_Pick_Pay_Update+1 
	MOVF        FLOC__Left_Side_Pick_Pay_Update+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	MOVF        FLOC__Left_Side_Pick_Pay_Update+1, 0 
	MOVWF       FARG_T6963C_box_x0+1 
	MOVLW       1
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y0+1 
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
	ADDWF       FARG_T6963C_box_y0+0, 1 
	MOVF        R1, 0 
	ADDWFC      FARG_T6963C_box_y0+1, 1 
	MOVLW       27
	ADDWF       FLOC__Left_Side_Pick_Pay_Update+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	ADDWFC      FLOC__Left_Side_Pick_Pay_Update+1, 0 
	MOVWF       FARG_T6963C_box_x1+1 
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       10
	ADDWF       FARG_T6963C_box_y1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2883 :: 		MulFloat_To1DecimalStr( Picks[i] , Pay_Value , Text);
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVF        _i+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _Picks+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_Picks+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_A+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_A+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_A+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_A+3 
	MOVF        _Pay_Value+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_B+0 
	MOVF        _Pay_Value+1, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_B+1 
	MOVF        _Pay_Value+2, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_B+2 
	MOVF        _Pay_Value+3, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_B+3 
	MOVLW       _Text+0
	MOVWF       FARG_MulFloat_To1DecimalStr_out+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_MulFloat_To1DecimalStr_out+1 
	CALL        _MulFloat_To1DecimalStr+0, 0
;Control_Fn.c,2884 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,2885 :: 		T6963C_Write_Text_Adv(Text,50+Fi_Xpos       ,Ypos+(13*i));
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       50
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
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
;Control_Fn.c,2886 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Left_Side_Pick_Pay_Update654:
	DECFSZ      R13, 1, 1
	BRA         L_Left_Side_Pick_Pay_Update654
	DECFSZ      R12, 1, 1
	BRA         L_Left_Side_Pick_Pay_Update654
	NOP
;Control_Fn.c,2879 :: 		for( i=0 ;i < 8 ; i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;Control_Fn.c,2887 :: 		}
	GOTO        L_Left_Side_Pick_Pay_Update651
L_Left_Side_Pick_Pay_Update652:
;Control_Fn.c,2888 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Left_Side_Pick_Pay_Update655:
	DECFSZ      R13, 1, 1
	BRA         L_Left_Side_Pick_Pay_Update655
	DECFSZ      R12, 1, 1
	BRA         L_Left_Side_Pick_Pay_Update655
	NOP
;Control_Fn.c,2889 :: 		}
L_end_Left_Side_Pick_Pay_Update:
	RETURN      0
; end of _Left_Side_Pick_Pay_Update

_Right_Side_Pick_Update:

;Control_Fn.c,2894 :: 		void Right_Side_Pick_Update()
;Control_Fn.c,2898 :: 		for( i= 0 ;i < 8 ; i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_Right_Side_Pick_Update656:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Right_Side_Pick_Update766
	MOVLW       8
	SUBWF       _i+0, 0 
L__Right_Side_Pick_Update766:
	BTFSC       STATUS+0, 0 
	GOTO        L_Right_Side_Pick_Update657
;Control_Fn.c,2900 :: 		asm CLRWDT;
	CLRWDT
;Control_Fn.c,2902 :: 		Picks[i+8]= (float) (Picks4inch [i+8] * Inch[i+8] );
	MOVLW       8
	ADDWF       _i+0, 0 
	MOVWF       R5 
	MOVLW       0
	ADDWFC      _i+1, 0 
	MOVWF       R6 
	MOVF        R5, 0 
	MOVWF       R3 
	MOVF        R6, 0 
	MOVWF       R4 
	RLCF        R3, 1 
	BCF         R3, 0 
	RLCF        R4, 1 
	RLCF        R3, 1 
	BCF         R3, 0 
	RLCF        R4, 1 
	MOVLW       _Picks+0
	ADDWF       R3, 0 
	MOVWF       FLOC__Right_Side_Pick_Update+2 
	MOVLW       hi_addr(_Picks+0)
	ADDWFC      R4, 0 
	MOVWF       FLOC__Right_Side_Pick_Update+3 
	MOVF        R5, 0 
	MOVWF       R0 
	MOVF        R6, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _Picks4inch+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_Picks4inch+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVLW       _Inch+0
	ADDWF       R3, 0 
	MOVWF       FLOC__Right_Side_Pick_Update+0 
	MOVLW       hi_addr(_Inch+0)
	ADDWFC      R4, 0 
	MOVWF       FLOC__Right_Side_Pick_Update+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVFF       FLOC__Right_Side_Pick_Update+0, FSR0L+0
	MOVFF       FLOC__Right_Side_Pick_Update+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
	MOVF        POSTINC0+0, 0 
	MOVWF       R6 
	MOVF        POSTINC0+0, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVFF       FLOC__Right_Side_Pick_Update+2, FSR1L+0
	MOVFF       FLOC__Right_Side_Pick_Update+3, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;Control_Fn.c,2903 :: 		T6963C_box(195+Fi_Xpos, 1+Ypos+(13*i), 195+Fi_Xpos+35, Ypos+(13*i)+10, T6963C_BLACK);
	MOVLW       195
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FLOC__Right_Side_Pick_Update+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
	MOVWF       FLOC__Right_Side_Pick_Update+1 
	MOVF        FLOC__Right_Side_Pick_Update+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	MOVF        FLOC__Right_Side_Pick_Update+1, 0 
	MOVWF       FARG_T6963C_box_x0+1 
	MOVLW       1
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y0+1 
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
	ADDWF       FARG_T6963C_box_y0+0, 1 
	MOVF        R1, 0 
	ADDWFC      FARG_T6963C_box_y0+1, 1 
	MOVLW       35
	ADDWF       FLOC__Right_Side_Pick_Update+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	ADDWFC      FLOC__Right_Side_Pick_Update+1, 0 
	MOVWF       FARG_T6963C_box_x1+1 
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       10
	ADDWF       FARG_T6963C_box_y1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2904 :: 		LongToStr( (long)Picks[i+8],Text);
	MOVLW       8
	ADDWF       _i+0, 0 
	MOVWF       R3 
	MOVLW       0
	ADDWFC      _i+1, 0 
	MOVWF       R4 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _Picks+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_Picks+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _double2longint+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_LongToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_LongToStr_input+1 
	MOVF        R2, 0 
	MOVWF       FARG_LongToStr_input+2 
	MOVF        R3, 0 
	MOVWF       FARG_LongToStr_input+3 
	MOVLW       _Text+0
	MOVWF       FARG_LongToStr_output+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_LongToStr_output+1 
	CALL        _LongToStr+0, 0
;Control_Fn.c,2905 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,2906 :: 		T6963C_Write_Text_Adv(Text, 196+Fi_Xpos       ,Ypos+(13*i));// VALUE [PICKS]
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       196
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
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
;Control_Fn.c,2907 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,2908 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Right_Side_Pick_Update659:
	DECFSZ      R13, 1, 1
	BRA         L_Right_Side_Pick_Update659
	DECFSZ      R12, 1, 1
	BRA         L_Right_Side_Pick_Update659
	NOP
;Control_Fn.c,2898 :: 		for( i= 0 ;i < 8 ; i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;Control_Fn.c,2909 :: 		}
	GOTO        L_Right_Side_Pick_Update656
L_Right_Side_Pick_Update657:
;Control_Fn.c,2910 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Right_Side_Pick_Update660:
	DECFSZ      R13, 1, 1
	BRA         L_Right_Side_Pick_Update660
	DECFSZ      R12, 1, 1
	BRA         L_Right_Side_Pick_Update660
	NOP
;Control_Fn.c,2911 :: 		}
L_end_Right_Side_Pick_Update:
	RETURN      0
; end of _Right_Side_Pick_Update

_Right_Side_Pick_Pay_Update:

;Control_Fn.c,2914 :: 		void Right_Side_Pick_Pay_Update()
;Control_Fn.c,2918 :: 		for( i= 0 ;i < 8 ; i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_Right_Side_Pick_Pay_Update661:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Right_Side_Pick_Pay_Update768
	MOVLW       8
	SUBWF       _i+0, 0 
L__Right_Side_Pick_Pay_Update768:
	BTFSC       STATUS+0, 0 
	GOTO        L_Right_Side_Pick_Pay_Update662
;Control_Fn.c,2920 :: 		asm CLRWDT;
	CLRWDT
;Control_Fn.c,2921 :: 		T6963C_box(164+Fi_Xpos, 1+Ypos+(13*i), 164+Fi_Xpos+27, Ypos+(13*i)+10, T6963C_BLACK);//CLEAR PURPOSE
	MOVLW       164
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FLOC__Right_Side_Pick_Pay_Update+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
	MOVWF       FLOC__Right_Side_Pick_Pay_Update+1 
	MOVF        FLOC__Right_Side_Pick_Pay_Update+0, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	MOVF        FLOC__Right_Side_Pick_Pay_Update+1, 0 
	MOVWF       FARG_T6963C_box_x0+1 
	MOVLW       1
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y0+1 
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
	ADDWF       FARG_T6963C_box_y0+0, 1 
	MOVF        R1, 0 
	ADDWFC      FARG_T6963C_box_y0+1, 1 
	MOVLW       27
	ADDWF       FLOC__Right_Side_Pick_Pay_Update+0, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	ADDWFC      FLOC__Right_Side_Pick_Pay_Update+1, 0 
	MOVWF       FARG_T6963C_box_x1+1 
	MOVF        R0, 0 
	ADDWF       _Ypos+0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	MOVF        R1, 0 
	ADDWFC      _Ypos+1, 0 
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       10
	ADDWF       FARG_T6963C_box_y1+0, 1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	CLRF        FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;Control_Fn.c,2923 :: 		MulFloat_To1DecimalStr( Picks[i+8] , Pay_Value , Text);
	MOVLW       8
	ADDWF       _i+0, 0 
	MOVWF       R3 
	MOVLW       0
	ADDWFC      _i+1, 0 
	MOVWF       R4 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _Picks+0
	ADDWF       R0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_Picks+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_A+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_A+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_A+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_A+3 
	MOVF        _Pay_Value+0, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_B+0 
	MOVF        _Pay_Value+1, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_B+1 
	MOVF        _Pay_Value+2, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_B+2 
	MOVF        _Pay_Value+3, 0 
	MOVWF       FARG_MulFloat_To1DecimalStr_B+3 
	MOVLW       _Text+0
	MOVWF       FARG_MulFloat_To1DecimalStr_out+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_MulFloat_To1DecimalStr_out+1 
	CALL        _MulFloat_To1DecimalStr+0, 0
;Control_Fn.c,2924 :: 		Ltrim(Text);
	MOVLW       _Text+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;Control_Fn.c,2925 :: 		T6963C_Write_Text_Adv(Text,170+Fi_Xpos       ,Ypos+(13*i));//PAY VALUE
	MOVLW       _Text+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(_Text+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       170
	ADDWF       _Fi_Xpos+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	ADDWFC      _Fi_Xpos+1, 0 
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
;Control_Fn.c,2926 :: 		Glcd_Buffer_Clear();
	CALL        _Glcd_Buffer_Clear+0, 0
;Control_Fn.c,2927 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Right_Side_Pick_Pay_Update664:
	DECFSZ      R13, 1, 1
	BRA         L_Right_Side_Pick_Pay_Update664
	DECFSZ      R12, 1, 1
	BRA         L_Right_Side_Pick_Pay_Update664
	NOP
;Control_Fn.c,2918 :: 		for( i= 0 ;i < 8 ; i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;Control_Fn.c,2928 :: 		}
	GOTO        L_Right_Side_Pick_Pay_Update661
L_Right_Side_Pick_Pay_Update662:
;Control_Fn.c,2930 :: 		delay_ms(5);
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_Right_Side_Pick_Pay_Update665:
	DECFSZ      R13, 1, 1
	BRA         L_Right_Side_Pick_Pay_Update665
	DECFSZ      R12, 1, 1
	BRA         L_Right_Side_Pick_Pay_Update665
	NOP
;Control_Fn.c,2931 :: 		}
L_end_Right_Side_Pick_Pay_Update:
	RETURN      0
; end of _Right_Side_Pick_Pay_Update
