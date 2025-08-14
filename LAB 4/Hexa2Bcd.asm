        AREA    RESET, DATA, READONLY
        EXPORT  __Vectors

__Vectors
        DCD     0x10008000
        DCD     Reset_Handler

        ALIGN

        AREA    MyCode, CODE, READONLY
        EXPORT  Reset_Handler

        ENTRY
Reset_Handler
        MOV     R0, #0x2D
        BL      HEX2BCD
        B       .

HEX2BCD
        MOV     R2, #0
        MOV     R3, #10
LOOP    CMP     R0, R3
        BLT     PACK
        SUB     R0, R0, R3
        ADD     R2, R2, #1
        B       LOOP
PACK    MOV     R1, R2, LSL #4
        ORR     R1, R1, R0
        BX      LR

        END
