BITS 64
SECTION .text

GLOBAL strcasecmp

strcasecmp:
        XOR RCX, RCX
        XOR RDX, RDX
        .loop:
                CMP RDX, 0
                JE .new_char
                CMP R12B, 97
                JGE .analyse
                CMP R11B, 97
                JGE .analyse2
                CMP R11B, 0
                JE end2
                CMP R12B, 0
                JE end3
                CMP R12B, R11B
                JNE end
                INC RCX
                XOR RDX, RDX
                JMP .loop
        .new_char:
                MOV R11B, [RSI + RCX]
                MOV R12B, [RDI + RCX]
                INC RDX
                JMP .loop
        .analyse:
                CMP R12B, 122
                JLE .substract
                JMP .loop
        .substract:
                SUB R12B, 32
                JMP .loop
        .analyse2:
                CMP R11B, 122
                JLE .substract2
                JMP .loop
        .substract2:
                SUB R11B, 32
                JMP .loop

end:
        SUB R12B, R11B
        MOVSX RAX, R12B
        RET

end2:
        CMP R12B, 0
        JE end
        SUB R12B, R11B
        ADD R12B, 32
        MOVSX RAX, R12B
        RET

end3:
        CMP R11B, 0
        JE end
        SUB R12B, R11B
        SUB R12B, 32
        MOVSX RAX, R12B
        RET
