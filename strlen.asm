BITS 64
SECTION .text

GLOBAL strlen

strlen:
        XOR RCX, RCX
        .loop:
                CMP BYTE[RDI], 0
                JE end
                INC RCX
                INC RDI
                JMP .loop

end:
        MOV RAX, RCX
        RET
