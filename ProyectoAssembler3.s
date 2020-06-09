.text
.align 2
.global main
.type main, %function

main:
	stmfd sp!, {lr}
	/*apunta a los arreglo*/
	ldr r8, =vector1
	ldr r9, =vector2
	ldr r10, =vector3
	ldr r11, =vector4
	ldr r6, =vector5

	/*contador*/
	mov r5, #0 
tableroMostrar:
	/*muestra el tablero*/
	ldr r0, =tablero1
	bl puts
	add r5, r5, #1
	cmp r5, #5
	bne tableroMostrar

ingreso_columna:
	/*el usuario ingresa la columna en donde quiere ingresar la ficha*/
	ldr r0, =columna
	bl puts

	ldr r0, =entrada
	ldr r1, =opcion
	bl scanf

	ldr r1, =opcion
	ldr r3, [r1]

opciones_columnas:
	/*compara las opciones*/
	cmp r3, #1
	beq columna1

	cmp r3, #2
	beq columna2

	cmp r3, #3
	beq columna3

	cmp r3, #4
	beq columna4

	cmp r3, #5
	beq columna5

columna1:
	ldr r1, =num1
	ldr r4, [r1]
	bl ingresar_fila
columna2:
	ldr r1, =num2
	ldr r4, [r1]
	bl ingresar_fila
columna3:
	ldr r1, =num3
	ldr r4, [r1]
	bl ingresar_fila
columna4:
	ldr r1, =num4
	ldr r4, [r1]
	bl ingresar_fila
columna5:
	ldr r1, =num5
	ldr r4, [r1]
	bl ingresar_fila

ingresar_fila:
	/*el usuario ingresa la columna en donde quiere ingresar la ficha*/
	ldr r0, =fila
	bl puts

	ldr r0, =entrada
	ldr r1, =opcion
	bl scanf

	ldr r1, =opcion
	ldr r3, [r1]

opciones_columnas:
	/*compara las opciones*/
	cmp r3, #1
	beq fila1

	cmp r3, #2
	beq fila2

	cmp r3, #3
	beq fila3

	cmp r3, #4
	beq fila4

	cmp r3, #5
	beq fila5

fila1:
	/*accede a la primera fila*/
	add r5, r5, #1
	ldr r1, =ficha
	ldr r1, [r1]

	str r1, [r8, r4]
	mov r5, #0
	ldr r0, =mostrarV
	bl puts

	ldr r5, =vector1
	mov r7, #5
	push {r7, r8, r9, r10, r11}
	bl CF
	pop{r7, r8, r9, r10, r11}
	bl mostrar

fila2:
	/*accede a la segunda fila*/
	add r5, r5, #1
	ldr r1, =ficha
	ldr r1, [r1]

	str r1, [r9, r4]
	mov r5, #0
	ldr r0, =mostrarV
	bl puts

	ldr r5, =vector2
	mov r7, #5
	push {r7, r8, r9, r10, r11}
	bl CF
	pop{r7, r8, r9, r10, r11}
	bl mostrar
fila3:
	/*accede a la tercera fila*/
	add r5, r5, #1
	ldr r1, =ficha
	ldr r1, [r1]

	str r1, [r10, r4]
	mov r5, #0
	ldr r0, =mostrarV
	bl puts

	ldr r5, =vector3
	mov r7, #5
	push {r7, r8, r9, r10, r11}
	bl CF
	pop{r7, r8, r9, r10, r11}	
	bl mostrar
fila4:
	/*accede a la cuarta fila*/
	add r5, r5, #1
	ldr r1, =ficha
	ldr r1, [r1]

	str r1, [r11, r4]
	mov r5, #0
	ldr r0, =mostrarV
	bl puts

	ldr r5, =vector4
	mov r7, #5
	push {r7, r8, r9, r10, r11}
	bl CF
	pop{r7, r8, r9, r10, r11}	
	bl mostrar
fila5:
	/*accede a la quinta fila*/
	add r5, r5, #1
	ldr r1, =ficha
	ldr r1, [r1]

	str r1, [r6, r4]
	mov r5, #0
	ldr r0, =mostrarV
	bl puts

	ldr r5, =vector5
	mov r7, #5
	push {r7, r8, r9, r10, r11}
	bl CF
	pop{r7, r8, r9, r10, r11}
	bl mostrar

mostrar:
	ldr r1, [r5]
	ldr r0, =formato
	bl printf
	add r5, #4
	subs r7, #1
	bne mostrar

	bl ingreso_columna
/*salida*/
	mov r0, #0
	mov r3, #0
	ldmfd sp!, {lr}
	bx lr


	

/*datos*/
.data
.align 2

ficha: .word 1
num1:  .word 4
num2:  .word 4
num3:  .word 8
num4:  .word 12
num5:  .word 16

vector1: .word 0,0,0,0,0
vector2: .word 0,0,0,0,0
vector3: .word 0,0,0,0,0
vector4: .word 0,0,0,0,0
vector5: .word 0,0,0,0,0

temp:   .word 0
opcion: .word 0

entrada:  .asciz "%d"
formato:  .asciz "[%d]"
fila:     .asciz "Ingrese el numero de fila:"
columna:  .asciz "Ingrese el numero de columna:"
mostrarV: .asciz "VECTOR >>>"
tablero1: .asciz "[0][0][0][0][0]"