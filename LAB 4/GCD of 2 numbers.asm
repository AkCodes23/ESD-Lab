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
        ; a in R0, b in R1
        MOV     R0, #48        
        MOV     R1, #18        

GCD_LOOP
        CMP     R1, #0         
        BEQ     DONE

        MOV     R3, R1         
        BL      MODULO         
        MOV     R0, R3         
        B       GCD_LOOP

MODULO
        MOV     R2, R0
MOD_LOOP
        CMP     R2, R1
        BLT     MOD_DONE
        SUB     R2, R2, R1
        B       MOD_LOOP
MOD_DONE
        MOV     R1, R2
        BX      LR

DONE
        ; GCD is now in R0 (for 48 and 18, R0 = 6)
        B       DONE

        END
