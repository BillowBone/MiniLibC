BITS 64
SECTION .text

GLOBAL strchr

strchr:
        .loop:
                CMP BYTE[RDI], SIL
                JE end
                INC RDI
                CMP BYTE[RDI], 0
                JE end2
                JMP .loop

end:
        MOV RAX, RDI
        RET

end2:
        XOR RAX, RAX
        RET
