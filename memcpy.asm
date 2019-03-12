BITS 64
SECTION .text

GLOBAL memcpy

memcpy:
        XOR RCX, RCX
        .loop:
                CMP SIL, 0
                JE end
                CMP DL, 0
                JE end
                MOV R11B, [RSI + RCX]
                MOV [RDI + RCX], R11B
                INC RCX
                DEC DL
                JMP .loop

end:
        MOV RAX, RDI
        RET
