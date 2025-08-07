        AREA RESET, DATA, READONLY
        EXPORT __Vectors
__Vectors
        DCD 0x10001000
        DCD Reset_Handler
        ALIGN

        AREA MYCODE, CODE, READONLY
        ENTRY
        EXPORT Reset_Handler

Reset_Handler
        LDR R0, =src
        LDR R1 ,=src+36
		MOV R5 ,#5
up
		LDR R2,[R0]
		LDR R3,[R1]
		STR R2,[R0],#-4
		STR R3,[R0],#4
		
		SUBS R5,#1
		BNE up

DONE
        B DONE

        AREA Mydata, DATA, READWRITE
src     DCD 0x00000010,0x00000021,0x00000032,0x00000043,0x00000054,0x00000065,0x00000076,0x00000087,0x00000098,0x000000A9
