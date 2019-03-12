BITS 64
SECTION .text

GLOBAL memset

memset:
        XOR RCX, RCX
        .loop:
                CMP DL, 0
                JE end
                MOV [RDI + RCX], SIL
                INC RCX
                DEC DL
                JMP .loop

end:
        MOV RAX, RDI
        RET
