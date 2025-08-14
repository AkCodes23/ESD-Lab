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
        LDR     R0, =ARR
        MOV     R1, #8
        BL      SELSORT
        BL      CHECKSORT       ; R0 = 1 if sorted, 0 otherwise
        B       .

SELSORT
        MOV     R2, #0
OUTER   CMP     R2, R1
        BHS     DONE
        MOV     R4, R2
        MOV     R7, R2, LSL #2
        ADD     R7, R0, R7
        LDR     R5, [R7]
        ADD     R3, R2, #1
INNER   CMP     R3, R1
        BHS     CHECKSWAP
        MOV     R6, R3, LSL #2
        ADD     R6, R0, R6
        LDR     R7, [R6]
        CMP     R7, R5
        BGE     SKIP
        MOV     R5, R7
        MOV     R4, R3
SKIP    ADD     R3, R3, #1
        B       INNER
CHECKSWAP
        CMP     R4, R2
        BEQ     NEXT
        MOV     R6, R2, LSL #2
        ADD     R6, R0, R6
        MOV     R7, R4, LSL #2
        ADD     R7, R0, R7
        LDR     R3, [R6]
        STR     R5, [R6]
        STR     R3, [R7]
NEXT    ADD     R2, R2, #1
        B       OUTER
DONE    BX      LR

CHECKSORT
        CMP     R1, #2
        BLO     OK
        LDR     R3, [R0]
        MOV     R2, #1
CS_LP   CMP     R2, R1
        BHS     OK
        LDR     R4, [R0, R2, LSL #2]
        CMP     R3, R4
        BLE     CS_CONT
        MOV     R0, #0
        BX      LR
CS_CONT MOV     R3, R4
        ADD     R2, R2, #1
        B       CS_LP
OK      MOV     R0, #1
        BX      LR

        AREA    MyData, DATA, READWRITE
        ALIGN
ARR     DCD     0x2D, 0x45, 0x23, 0x11, 0x7F, 0x00, 0x10, 0x99

        END
