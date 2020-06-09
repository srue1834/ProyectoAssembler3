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


    cmp r7, #1 /*Se compara el valor de la primera casilla con la ficha de numero 1 */
    cmpeq r9, #1/*Se compara el tercer valor con la ficha uno */
    moveq r8, #1 /*de ser los anteriores 1, la ficha de en medio debe ser 1 */

    cmp r7,#1 /*Se compara el valor de la primera ficha */
    cmpeq r10, #1 /*Se compara el valor de la cuarta ficha */
    beq DC1 /*de ser asi, se va al branch DC1 */

    cmp r7, #1  /*Se compara el valor de la primera ficha */
    cmpeq r11, #1  /*Se compara el valor de la ultima ficha */
    beq TC1  /*de ser así, se ejecuta TC1 */

    cmp r7, #2
    cmpeq r9, #2
    moveq r8, #2

    cmp r7,#2
    cmpeq r10, #2
    beq DC2

    cmp r7, #2
    cmpeq r11, #2
    beq TC2

    /*Convierte dos fichas a la del jugador 1 */
    DC1:
        mov r8, #1
        mov r9, #1

    /*Convierte tres fichas a la del jugador 1 */
    TC1:
        mov r8, #1
        mov r9, #1
        mov r10, #1

    /*Convierte dos fichas a las del jugador 2 */
    DC2:
        mov r8, #2
        mov r9, #2

    /*Convierte tres fichas a las del jugador 2 */
    TC2:
        mov r8, #2
        mov r9, #2
        mov r10, #2

    bl fin

    fin:
    mov pc, lr