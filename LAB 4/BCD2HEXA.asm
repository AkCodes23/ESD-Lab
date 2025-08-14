        AREA    RESET, CODE, READONLY
        EXPORT  __Vectors
        EXPORT  Reset_Handler

__Vectors
        DCD     0x10008000     
        DCD     Reset_Handler  

        ALIGN

        AREA    Mycode, CODE, READONLY
        ENTRY

Reset_Handler
        MOV     R0, #0x25      

        
        MOV     R1, R0, LSR #4
        AND     R1, R1, #0x0F

        MOV     R2, R1, LSL #3 
        ADD     R1, R2, R1, LSL #1 

        
        AND     R2, R0, #0x0F

        ADD     R1, R1, R2


DONE
        B       DONE

        END
