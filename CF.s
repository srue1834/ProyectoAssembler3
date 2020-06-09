.text
.align 2

.global CF
CF:
@R7 <- primer valor del arreglo
@R8 <- segundo valor del arreglo
@R9 <- Tercer valor del arreglo
@R10 <- Cuarto valor del arreglo
@R11 <- Quinto valor del arreglo
@R7 -> primer valor del arreglo
@R8 -> segundo valor del arreglo
@R9 -> Tercer valor del arreglo
@R10 -> Cuarto valor del arreglo
@R11 -> Quinto valor del arreglo
    cmp r7, #1
    cmpeq r9, #1
    moveq r8, #1

    cmp r7,#1
    cmpeq r10, #1
    beq DC1

    cmp r7, #1
    cmpeq r11, #1
    beq TC1

    cmp r7, #2
    cmpeq r9, #2
    moveq r8, #2

    cmp r7,#2
    cmpeq r10, #2
    beq DC2

    cmp r7, #2
    cmpeq r11, #2
    beq TC2

    DC1:
        mov r8, #1
        mov r9, #1

    TC1:
        mov r8, #1
        mov r9, #1
        mov r10, #1

    DC2:
        mov r8, #2
        mov r9, #2

    TC2:
        mov r8, #2
        mov r9, #2
        mov r10, #2

    bl fin

    fin:
    mov pc, lr