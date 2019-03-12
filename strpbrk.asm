BITS 64
SECTION .text

GLOBAL strpbrk

strpbrk:
        .loop:
                CMP BYTE[RDI], 0
                JE end_null
                JMP .xor_rcx
        .xor_rcx:
                XOR RCX, RCX
                JMP .loop2
        .loop2:
                CMP BYTE[RSI + RCX], 0
                JE .inc_rdi
                MOV R11B, [RSI + RCX]
                CMP BYTE[RDI], R11B
                JE end
                INC RCX
                JMP .loop2
        .inc_rdi:
                INC RDI
                JMP .loop

end:
        MOV RAX, RDI
        RET

end_null:
        XOR RAX, RAX
        RET
