SECTION .text

GLOBAL memmove

memmove:
        XOR RCX, RCX
        MOV R13, RDX
        .loop:
                CMP SIL, 0
                JE .loop2
                CMP DL, 0
                JE .loop2
                MOV R11B, [RSI + RCX]
                MOV [R12 + RCX], R11B
                INC RCX
                DEC DL
                JMP .loop
        .loop2:
                CMP R12B, 0
                JE end
                CMP R13B, 0
                JE end
                MOV R11B, [R12 + RCX]
                MOV [RDI + RCX], R11B
                INC RCX
                DEC R13B
                JMP .loop2

end:
        MOV RAX, RDI
        RET
