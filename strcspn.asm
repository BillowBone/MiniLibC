BITS 64
SECTION .text

GLOBAL strcspn

strcspn:
    XOR RCX, RCX
        .loop:
                CMP BYTE[RDI + RCX], 0
                JE end
                JMP .xor_rdx
        .xor_rdx:
                XOR RDX, RDX
                JMP .loop2
        .loop2:
                CMP BYTE[RSI + RDX], 0
                JE .inc_rcx
                MOV R11B, [RSI + RDX]
                CMP BYTE[RDI + RCX], R11B
                JE end
                INC RDX
                JMP .loop2
        .inc_rcx:
                INC RCX
                JMP .loop

end:
        MOV RAX, RCX
        RET
