BITS 64
SECTION .text

GLOBAL strstr

strstr:
        XOR RCX, RCX
        XOR RDX, RDX
        .loop:
                CMP RDX, 0
                JNE .new_char
                MOV R11B, [RSI]
                MOV R12B, [RDI]
                CMP R11B, R12B
                JE .xor_rcx
                CMP R12B, 0
                JE end_null
                INC RDI
                JMP .loop
        .new_char:
                XOR RDX, RDX
                INC RDI
                JMP .loop
        .xor_rcx:
                XOR RCX, RCX
                JMP .check_needle
        .check_needle:
                MOV R11B, [RSI + RCX]
                MOV R12B, [RDI + RCX]
                CMP R11B, 0
                JE end
                CMP R12B, 0
                JE end_null
                CMP R11B, R12B
                JNE .loop
                INC RDX
                INC RCX
                JMP .check_needle

end:
        MOV RAX, RDI
        RET

end_null:
        XOR RAX, RAX
        RET
