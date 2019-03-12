BITS 64
SECTION .text

GLOBAL strncmp

strncmp:
        XOR RCX, RCX
        DEC DL
        .loop:
                MOV R11B, [RSI + RCX]
                MOV R12B, [RDI + RCX]
                CMP BYTE[RDI + RCX], 0
                JE end
                CMP BYTE[RSI + RCX], 0
                JE end
                CMP DL, 0
                JE end
                CMP R12B, R11B
                JNE end
                INC RCX
                DEC DL
                JMP .loop

end:
        SUB R12B, R11B
        MOVSX RAX, R12B
        RET
