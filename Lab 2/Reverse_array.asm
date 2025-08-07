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
        LDR R1, =src+36
        MOV R2, #5

up
        LDR R3, [R0]
        LDR R4, [R1]
        STR R4, [R0],#4
        STR R3, [R1],#-4       
        SUBS R2,#1
        BNE up

DONE
        B DONE

        AREA Mydata, DATA, READWRITE
src     DCD 0x4F2A1C3D, 0x9B7E5D20, 0x12345678, 0xA1B2C3D4, 0xFFEEDDCC,0x87654321, 0x0ABCDEF0, 0x13579BDF, 0x2468ACE0, 0xDEADFFFF
