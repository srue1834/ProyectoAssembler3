.text
.align 2

.global CF
CF:
@R5 <- para operaciones
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
@R5 -> 0 

    sub r5, r7, R9
    cmp r5, #0
    moveq r8 

    fin:
    mov pc, lr