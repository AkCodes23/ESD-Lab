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
        LDR R0, =NUM1
        LDR R1, =NUM2
        LDR R4, =RESULT
        MOV R5, #4
        MOV R2, #0
        MOV R3, #0

loop
        LDR R6, [R0], #4
        LDR R7, [R1], #4
        ADDS R2, R6, R7
        ADC  R3, R3, #0
        STR  R2, [R4], #4
        MOV  R2, R3
        MOV  R3, #0
        SUBS R5, R5, #1
        BNE loop

STOP
        B STOP

        AREA data, DATA, READWRITE
NUM1    DCD 0x11111111, 0x22222222, 0x33333333, 0x44444444
NUM2    DCD 0xAAAAAAAA, 0xBBBBBBBB, 0xCCCCCCCC, 0xDDDDDDDD
RESULT  DCD 0, 0, 0, 0

        END
