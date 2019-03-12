BITS 64
SECTION .text

GLOBAL strcmp

strcmp:
        XOR RCX, RCX
        .loop:
                MOV R11B, [RSI + RCX]
                MOV R12B, [RDI + RCX]
                CMP BYTE[RDI + RCX], 0
                JE end
                CMP BYTE[RSI + RCX], 0
                JE end
                CMP R12B, R11B
                JNE end
                INC RCX
                JMP .loop

end:
        SUB R12B, R11B
        MOVSX RAX, R12B
        RET
