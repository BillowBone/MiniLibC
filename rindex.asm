BITS 64
SECTION .text

GLOBAL rindex

rindex:
        .loop:
                CMP BYTE[RDI], 0
                JE .loop2
                INC RDI
                JMP .loop
        .loop2:
                CMP RDI, 0
                JE end2
                CMP BYTE[RDI], SIL
                JE end
                DEC RDI
                JMP .loop2

end:
        MOV RAX, RDI
        RET

end2:
        XOR RAX, RAX
        RET
