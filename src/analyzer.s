.section .data
msg: .ascii "ALERTA: 3 errores consecutivos\n"
len = . - msg

.section .bss
buffer: .skip 100

.section .text
.global _start

_start:
    // read(stdin, buffer, 100)
    mov x0, #0
    adr x1, buffer
    mov x2, #100
    mov x8, #63
    svc #0

    // x0 = bytes leídos
    mov x2, x0        // tamaño
    adr x1, buffer    // apuntador

    mov x3, #0        // índice
    mov x5, #0        // número actual
    mov x7, #0        // contador de errores consecutivos

loop:
    cmp x3, x2
    b.ge fin

    ldrb w4, [x1, x3]

    // si es salto de línea '\n'
    cmp w4, #10
    b.eq fin_numero

    // convertir ASCII a número
    sub w4, w4, #48

    // numero = numero * 10 + digito
    mov x6, #10
    mul x5, x5, x6
    add x5, x5, x4

    add x3, x3, #1
    b loop

fin_numero:
    // evaluar número en x5

    cmp x5, #400
    b.ge es_error

no_error:
    mov x7, #0
    b continuar

es_error:
    add x7, x7, #1

    cmp x7, #3
    b.eq tres_errores

continuar:
    mov x5, #0
    add x3, x3, #1
    b loop

tres_errores:
    tres_errores:
    // write(stdout, msg, len)
    mov x0, #1        // stdout
    adr x1, msg       // dirección del mensaje
    mov x2, #33       // tamaño del mensaje
    mov x8, #64       // syscall write
    svc #0

    b fin

fin:
    mov x0, #0
    mov x8, #93
    svc #0
