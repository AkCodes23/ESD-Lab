        AREA RESET, CODE, READONLY
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
        MOV R1, #10         
        MOV R2, #0           
        MOV R3, #0           

loop
        LDR R4, [R0], #4     
        ADDS R2, R2, R4      
        ADC R3, R3, #0      
        SUBS R1, R1, #1      
        BNE loop            

 
        LDR R0, =RESULT
        STR R2, [R0]         
        STR R3, [R0, #4]     

STOP 
        B STOP

        AREA data, DATA, READWRITE
SRC     DCD 0x00000032, 0x00000050, 0x00000010, 0x00000008, 0x00000004,0x00000002, 0x00000001, 0x00000005, 0x00000003, 0x00000009

RESULT  DCD 0x0, 0x0         
        END
