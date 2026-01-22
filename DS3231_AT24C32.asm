
_EEPROM_AT24C32_Init:

;DS3231_AT24C32.c,6 :: 		void EEPROM_AT24C32_Init(void)
;DS3231_AT24C32.c,8 :: 		I2C1_Init(100000);
	MOVLW       160
	MOVWF       SSP1ADD+0 
	CALL        _I2C1_Init+0, 0
;DS3231_AT24C32.c,9 :: 		delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_EEPROM_AT24C32_Init0:
	DECFSZ      R13, 1, 1
	BRA         L_EEPROM_AT24C32_Init0
	DECFSZ      R12, 1, 1
	BRA         L_EEPROM_AT24C32_Init0
	DECFSZ      R11, 1, 1
	BRA         L_EEPROM_AT24C32_Init0
	NOP
;DS3231_AT24C32.c,10 :: 		}
L_end_EEPROM_AT24C32_Init:
	RETURN      0
; end of _EEPROM_AT24C32_Init

_Read_RTC:

;DS3231_AT24C32.c,12 :: 		unsigned short Read_RTC(unsigned short rAddr)
;DS3231_AT24C32.c,16 :: 		I2C1_Start();             // issue I2C1 start signal
	CALL        _I2C1_Start+0, 0
;DS3231_AT24C32.c,17 :: 		I2C1_Wr(0xD0);            // send byte via I2C1  (device address + W)
	MOVLW       208
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;DS3231_AT24C32.c,18 :: 		I2C1_Wr(rAddr);           // send byte (data address)
	MOVF        FARG_Read_RTC_rAddr+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;DS3231_AT24C32.c,19 :: 		I2C1_Start();             // issue I2C1 signal repeated start
	CALL        _I2C1_Start+0, 0
;DS3231_AT24C32.c,20 :: 		I2C1_Wr(0xD1);            // send byte (device address + R)
	MOVLW       209
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;DS3231_AT24C32.c,21 :: 		reslt = I2C1_Rd(0u);      // Read the data (NO acknowledge)
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       Read_RTC_reslt_L0+0 
;DS3231_AT24C32.c,22 :: 		while (!I2C1_Is_Idle())
L_Read_RTC1:
	CALL        _I2C1_Is_Idle+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_Read_RTC2
;DS3231_AT24C32.c,23 :: 		asm nop;                // Wait for the read cycle to finish
	NOP
	GOTO        L_Read_RTC1
L_Read_RTC2:
;DS3231_AT24C32.c,24 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;DS3231_AT24C32.c,25 :: 		Delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_Read_RTC3:
	DECFSZ      R13, 1, 1
	BRA         L_Read_RTC3
	DECFSZ      R12, 1, 1
	BRA         L_Read_RTC3
	NOP
	NOP
;DS3231_AT24C32.c,26 :: 		return Bcd2Dec(reslt);
	MOVF        Read_RTC_reslt_L0+0, 0 
	MOVWF       FARG_Bcd2Dec_bcdnum+0 
	CALL        _Bcd2Dec+0, 0
	GOTO        L_end_Read_RTC
;DS3231_AT24C32.c,27 :: 		delay_ms(10);
L_Read_RTC4:
	DECFSZ      R13, 1, 1
	BRA         L_Read_RTC4
	DECFSZ      R12, 1, 1
	BRA         L_Read_RTC4
	NOP
	NOP
;DS3231_AT24C32.c,28 :: 		}
L_end_Read_RTC:
	RETURN      0
; end of _Read_RTC

_Write_RTC:

;DS3231_AT24C32.c,30 :: 		void Write_RTC(unsigned short wAddr, unsigned short wData)
;DS3231_AT24C32.c,32 :: 		I2C1_Start();             // issue I2C1 start signal
	CALL        _I2C1_Start+0, 0
;DS3231_AT24C32.c,33 :: 		I2C1_Wr(0xD0);            // send byte via I2C1  (command to 24c32)
	MOVLW       208
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;DS3231_AT24C32.c,35 :: 		I2C1_Wr(wAddr);           // send byte (Low address of EEPROM location)
	MOVF        FARG_Write_RTC_wAddr+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;DS3231_AT24C32.c,36 :: 		I2C1_Wr(Dec2Bcd(wData));           // send data (data to be written)
	MOVF        FARG_Write_RTC_wData+0, 0 
	MOVWF       FARG_Dec2Bcd_decnum+0 
	CALL        _Dec2Bcd+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;DS3231_AT24C32.c,37 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;DS3231_AT24C32.c,38 :: 		Delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_Write_RTC5:
	DECFSZ      R13, 1, 1
	BRA         L_Write_RTC5
	DECFSZ      R12, 1, 1
	BRA         L_Write_RTC5
	NOP
	NOP
;DS3231_AT24C32.c,39 :: 		}
L_end_Write_RTC:
	RETURN      0
; end of _Write_RTC

_EEPROM_AT24C32_WrByte:

;DS3231_AT24C32.c,43 :: 		void EEPROM_AT24C32_WrByte(unsigned int wAddr, unsigned int wData)
;DS3231_AT24C32.c,45 :: 		I2C1_Start();             // issue I2C1 start signal
	CALL        _I2C1_Start+0, 0
;DS3231_AT24C32.c,46 :: 		I2C1_Wr(0xAE);            // send byte via I2C1  (command to 24c32)
	MOVLW       174
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;DS3231_AT24C32.c,47 :: 		I2C1_Wr(wAddr>>8);           // send byte (High address of EEPROM location)
	MOVF        FARG_EEPROM_AT24C32_WrByte_wAddr+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;DS3231_AT24C32.c,48 :: 		I2C1_Wr(wAddr);           // send byte (Low address of EEPROM location)
	MOVF        FARG_EEPROM_AT24C32_WrByte_wAddr+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;DS3231_AT24C32.c,49 :: 		I2C1_Wr(wData);           // send data (data to be written)
	MOVF        FARG_EEPROM_AT24C32_WrByte_wData+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;DS3231_AT24C32.c,50 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;DS3231_AT24C32.c,51 :: 		Delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_EEPROM_AT24C32_WrByte6:
	DECFSZ      R13, 1, 1
	BRA         L_EEPROM_AT24C32_WrByte6
	DECFSZ      R12, 1, 1
	BRA         L_EEPROM_AT24C32_WrByte6
	NOP
	NOP
;DS3231_AT24C32.c,52 :: 		}
L_end_EEPROM_AT24C32_WrByte:
	RETURN      0
; end of _EEPROM_AT24C32_WrByte

_EEPROM_AT24C32_WrInt:

;DS3231_AT24C32.c,54 :: 		void EEPROM_AT24C32_WrInt(unsigned int wAddr, unsigned int wData)
;DS3231_AT24C32.c,56 :: 		unsigned char temp=0;
;DS3231_AT24C32.c,58 :: 		temp = wData>>8;
	MOVF        FARG_EEPROM_AT24C32_WrInt_wData+1, 0 
	MOVWF       FARG_EEPROM_AT24C32_WrByte_wData+0 
	CLRF        FARG_EEPROM_AT24C32_WrByte_wData+1 
;DS3231_AT24C32.c,59 :: 		EEPROM_AT24C32_WrByte(wAddr, temp);
	MOVF        FARG_EEPROM_AT24C32_WrInt_wAddr+0, 0 
	MOVWF       FARG_EEPROM_AT24C32_WrByte_wAddr+0 
	MOVF        FARG_EEPROM_AT24C32_WrInt_wAddr+1, 0 
	MOVWF       FARG_EEPROM_AT24C32_WrByte_wAddr+1 
	MOVLW       0
	MOVWF       FARG_EEPROM_AT24C32_WrByte_wData+1 
	CALL        _EEPROM_AT24C32_WrByte+0, 0
;DS3231_AT24C32.c,60 :: 		temp = wData&0x00FF;
	MOVLW       255
	ANDWF       FARG_EEPROM_AT24C32_WrInt_wData+0, 0 
	MOVWF       FARG_EEPROM_AT24C32_WrByte_wData+0 
;DS3231_AT24C32.c,61 :: 		EEPROM_AT24C32_WrByte(wAddr+1, temp);
	MOVLW       1
	ADDWF       FARG_EEPROM_AT24C32_WrInt_wAddr+0, 0 
	MOVWF       FARG_EEPROM_AT24C32_WrByte_wAddr+0 
	MOVLW       0
	ADDWFC      FARG_EEPROM_AT24C32_WrInt_wAddr+1, 0 
	MOVWF       FARG_EEPROM_AT24C32_WrByte_wAddr+1 
	MOVLW       0
	MOVWF       FARG_EEPROM_AT24C32_WrByte_wData+1 
	CALL        _EEPROM_AT24C32_WrByte+0, 0
;DS3231_AT24C32.c,62 :: 		Delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_EEPROM_AT24C32_WrInt7:
	DECFSZ      R13, 1, 1
	BRA         L_EEPROM_AT24C32_WrInt7
	DECFSZ      R12, 1, 1
	BRA         L_EEPROM_AT24C32_WrInt7
	NOP
	NOP
;DS3231_AT24C32.c,63 :: 		}
L_end_EEPROM_AT24C32_WrInt:
	RETURN      0
; end of _EEPROM_AT24C32_WrInt

_EEPROM_AT24C32_RdByte:

;DS3231_AT24C32.c,66 :: 		unsigned int EEPROM_AT24C32_RdByte(unsigned int rAddr)
;DS3231_AT24C32.c,70 :: 		I2C1_Start();             // issue I2C1 start signal
	CALL        _I2C1_Start+0, 0
;DS3231_AT24C32.c,71 :: 		I2C1_Wr(0xAE);            // send byte via I2C1  (device address + W)
	MOVLW       174
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;DS3231_AT24C32.c,72 :: 		I2C1_Wr(rAddr>>8);           // send byte (data address)
	MOVF        FARG_EEPROM_AT24C32_RdByte_rAddr+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;DS3231_AT24C32.c,73 :: 		I2C1_Wr(rAddr);           // send byte (data address)
	MOVF        FARG_EEPROM_AT24C32_RdByte_rAddr+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;DS3231_AT24C32.c,74 :: 		I2C1_Repeated_Start();    // issue I2C1 signal repeated start
	CALL        _I2C1_Repeated_Start+0, 0
;DS3231_AT24C32.c,75 :: 		I2C1_Wr(0xAF);            // send byte (device address + R)
	MOVLW       175
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;DS3231_AT24C32.c,76 :: 		reslt = I2C1_Rd(0u);      // Read the data (NO acknowledge)
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       EEPROM_AT24C32_RdByte_reslt_L0+0 
;DS3231_AT24C32.c,77 :: 		while (!I2C1_Is_Idle())
L_EEPROM_AT24C32_RdByte8:
	CALL        _I2C1_Is_Idle+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_EEPROM_AT24C32_RdByte9
;DS3231_AT24C32.c,78 :: 		asm nop;                // Wait for the read cycle to finish
	NOP
	GOTO        L_EEPROM_AT24C32_RdByte8
L_EEPROM_AT24C32_RdByte9:
;DS3231_AT24C32.c,79 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;DS3231_AT24C32.c,80 :: 		Delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_EEPROM_AT24C32_RdByte10:
	DECFSZ      R13, 1, 1
	BRA         L_EEPROM_AT24C32_RdByte10
	DECFSZ      R12, 1, 1
	BRA         L_EEPROM_AT24C32_RdByte10
	NOP
	NOP
;DS3231_AT24C32.c,81 :: 		return reslt;
	MOVF        EEPROM_AT24C32_RdByte_reslt_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;DS3231_AT24C32.c,82 :: 		}
L_end_EEPROM_AT24C32_RdByte:
	RETURN      0
; end of _EEPROM_AT24C32_RdByte

_EEPROM_AT24C32_RdInt:

;DS3231_AT24C32.c,85 :: 		unsigned int EEPROM_AT24C32_RdInt(unsigned int rAddr)
;DS3231_AT24C32.c,88 :: 		unsigned char L_temp=0, H_temp=0;
	CLRF        EEPROM_AT24C32_RdInt_H_temp_L0+0 
;DS3231_AT24C32.c,90 :: 		H_temp = EEPROM_AT24C32_RdByte(rAddr);
	MOVF        FARG_EEPROM_AT24C32_RdInt_rAddr+0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdByte_rAddr+0 
	MOVF        FARG_EEPROM_AT24C32_RdInt_rAddr+1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdByte_rAddr+1 
	CALL        _EEPROM_AT24C32_RdByte+0, 0
	MOVF        R0, 0 
	MOVWF       EEPROM_AT24C32_RdInt_H_temp_L0+0 
;DS3231_AT24C32.c,91 :: 		L_temp = EEPROM_AT24C32_RdByte(rAddr+1);
	MOVLW       1
	ADDWF       FARG_EEPROM_AT24C32_RdInt_rAddr+0, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdByte_rAddr+0 
	MOVLW       0
	ADDWFC      FARG_EEPROM_AT24C32_RdInt_rAddr+1, 0 
	MOVWF       FARG_EEPROM_AT24C32_RdByte_rAddr+1 
	CALL        _EEPROM_AT24C32_RdByte+0, 0
;DS3231_AT24C32.c,92 :: 		reslt = H_temp;
	MOVF        EEPROM_AT24C32_RdInt_H_temp_L0+0, 0 
	MOVWF       EEPROM_AT24C32_RdInt_reslt_L0+0 
	MOVLW       0
	MOVWF       EEPROM_AT24C32_RdInt_reslt_L0+1 
;DS3231_AT24C32.c,93 :: 		reslt = ((reslt<<8) & 0xff00);
	MOVF        EEPROM_AT24C32_RdInt_reslt_L0+0, 0 
	MOVWF       R3 
	CLRF        R2 
	MOVLW       0
	ANDWF       R2, 1 
	MOVLW       255
	ANDWF       R3, 1 
	MOVF        R2, 0 
	MOVWF       EEPROM_AT24C32_RdInt_reslt_L0+0 
	MOVF        R3, 0 
	MOVWF       EEPROM_AT24C32_RdInt_reslt_L0+1 
;DS3231_AT24C32.c,94 :: 		reslt += L_temp;
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
	ADDWF       R0, 1 
	MOVF        R3, 0 
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       EEPROM_AT24C32_RdInt_reslt_L0+0 
	MOVF        R1, 0 
	MOVWF       EEPROM_AT24C32_RdInt_reslt_L0+1 
;DS3231_AT24C32.c,95 :: 		return reslt;
	GOTO        L_end_EEPROM_AT24C32_RdInt
;DS3231_AT24C32.c,96 :: 		delay_ms(10);
L_EEPROM_AT24C32_RdInt11:
	DECFSZ      R13, 1, 1
	BRA         L_EEPROM_AT24C32_RdInt11
	DECFSZ      R12, 1, 1
	BRA         L_EEPROM_AT24C32_RdInt11
	NOP
	NOP
;DS3231_AT24C32.c,97 :: 		}
L_end_EEPROM_AT24C32_RdInt:
	RETURN      0
; end of _EEPROM_AT24C32_RdInt
