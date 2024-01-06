square_root:
        push    rbp
        mov     rbp, rsp
        movsd   QWORD PTR [rbp-24], xmm0
        movsd   QWORD PTR [rbp-32], xmm1
        movsd   xmm0, QWORD PTR [rbp-24]
        movsd   xmm1, QWORD PTR .LC0[rip]
        divsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-8], xmm0
        jmp     .L2
.L3:
        movsd   xmm0, QWORD PTR [rbp-24]
        divsd   xmm0, QWORD PTR [rbp-8]
        addsd   xmm0, QWORD PTR [rbp-8]
        movsd   xmm1, QWORD PTR .LC0[rip]
        divsd   xmm0, xmm1
        movsd   QWORD PTR [rbp-8], xmm0
.L2:
        movsd   xmm0, QWORD PTR [rbp-8]
        mulsd   xmm0, xmm0
        subsd   xmm0, QWORD PTR [rbp-24]
        movq    xmm1, QWORD PTR .LC1[rip]
        andpd   xmm0, xmm1
        comisd  xmm0, QWORD PTR [rbp-32]
        ja      .L3
        movsd   xmm0, QWORD PTR [rbp-8]
        movq    rax, xmm0
        movq    xmm0, rax
        pop     rbp
        ret
.LC4:
        .string "Square root of %.2f is %.6f\n"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        movsd   xmm0, QWORD PTR .LC2[rip]
        movsd   QWORD PTR [rbp-8], xmm0
        movsd   xmm0, QWORD PTR .LC3[rip]
        movsd   QWORD PTR [rbp-16], xmm0
        movsd   xmm0, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        movapd  xmm1, xmm0
        movq    xmm0, rax
        call    square_root
        movq    rax, xmm0
        mov     QWORD PTR [rbp-24], rax
        movsd   xmm0, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rbp-8]
        movapd  xmm1, xmm0
        movq    xmm0, rax
        mov     edi, OFFSET FLAT:.LC4
        mov     eax, 2
        call    printf
        mov     eax, 0
        leave
        ret
.LC0:
        .long   0
        .long   1073741824
.LC1:
        .long   -1
        .long   2147483647
        .long   0
        .long   0
.LC2:
        .long   0
        .long   1077477376
.LC3:
        .long   -1598689907
        .long   1051772663