.text
.align 2
.global main
.type main. %function

main:
	stmfd sp!, {lr}
	mov r11, #0
	ldr r10, =vector
loop:
	ldr r0, =mensaje1
	bl puts

	ldr r0, =entrada
	ldr r1, =temp
	ldr r1, [r1]
	str r1, [r10], #4

	cmp r11, #5
	bne loop

	mov r11, #0
	ldr r0, =mensaje2
	bl puts
	ldr r10, =vector

	ldr r4, [r10], #4
	add r4, r4, #1
	mov r1, r4
	ldr r0, =formato
	bl printf

	b salida

salida:
	mov r3, #0
	mov r0, r3
	ldmfd sp!, {lr}
	bx lr

.data
.align 2

mensaje1: .asciz "ingrese numero:"
mensaje2: .asciz ">>"
formato: .asciz "%d"
entrada: .asciz "%d"

vector: .byte '0','0','0','0','0'
temp: .byte '0'
