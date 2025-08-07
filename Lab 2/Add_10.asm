        AREA VECTORS, CODE, READONLY
        EXPORT __Vectors

__Vectors
        DCD 0x40001000
        DCD Reset_Handler

        ALIGN
        AREA mycode, CODE, READONLY
        ENTRY
        EXPORT Reset_Handler

Reset_Handler
        LDR R0, =SRC
        MOV R3, #10
loop
        LDR R1,[R0], #4
        ADDS R2,R1
        ADC R5,#0
        SUBS R3,#1
        BNE loop

        LDR R4, =RESULT
        STR R1, [R4],#4
		STR R2, [R4]

STOP
        B STOP

        AREA data, DATA, READWRITE
SRC     DCD 0x00000032, 0x00000050, 0x00000010, 0x00000008, 0x00000004, 0x00000002, 0x00000001, 0x00000005, 0x00000003, 0x00000009

RESULT  DCD 0x0, 0x0

        END
