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
        LDR R0, =ARR    
        MOV R1, #0         
        MOV R2, #9         

Loop
        CMP R1, R2
        BGE STOP           

        ADD R3, R0, R1, LSL #2     
        ADD R4, R0, R2, LSL #2     

        LDR R5, [R3]
        LDR R6, [R4]
        STR R6, [R3]
        STR R5, [R4]

        ADD R1, R1, #1    
        SUB R2, R2, #1     

        B Loop

STOP    B STOP

        AREA Mydata, DATA, READWRITE
ARR     DCD 0x00000010,0x00000021,0x00000032,0x00000043,0x00000054,0x00000065,0x00000076,0x00000087,0x00000098,0x000000A9
