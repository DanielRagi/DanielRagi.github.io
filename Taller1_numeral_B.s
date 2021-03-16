.syntax unified

.data

	string1: .asciz "\n NOMBRE DEL PROYECTO: \n"
	string2: .asciz "\n INTEGRANTES: \n"
	string3: .asciz "\n MATEO PRÉSIGA HIDALGO\n"
	string4: .asciz "\n JUAN JOSÉ HUGUET OSPINA\n"
	string5: .asciz "\n TOMAS ECHEVERRI\n"
	string6: .asciz "\n CRISTIAN BEDOYA CADENA\n"
	string7: .asciz "\n DANIEL RAMIREZ GIRALDO\n"
	string8: .asciz "\n ISABELA CEBALLOS FRANCO\n"
	string9: .asciz "\n FECHA INICIO: 02/03/2021 FECHA FINAL: 15/03/2021\n"
	string10: .asciz "\n VERSIÓN:0.0\n"
	string11: .asciz "\nDESCRIPCION FUNCIÓN BOOLEANA: F(Q, X, Y, Z) = X./Y + /Q./X.Y + /Q.X./Z  \n"

	exit: .asciz "EL RESULTADO ES: %d \n"

	A: .word 0
	B: .word 0
	C: .word 0
	D: .word 0
	E: .word 0

.text
.global main
.extern printf

main:	PUSH {ip, lr}

	LDR r0, = string1
	BL printf

	LDR r0, = string2
	BL printf

	LDR r0, = string3
	BL printf

	LDR r0, = string4
	BL printf

	LDR r0, = string5
	BL printf

	LDR r0, = string6
	BL printf

	LDR r0, = string7
	BL printf

	LDR r0, = string8
	BL printf

	LDR r0, = string9
	BL printf
	
	LDR r0, = string10
	BL printf

	LDR r0, = string11
	BL printf

	# F(Q, X, Y, Z) = X./Y + /Q./X.Y + /Q.X./Z

	#ASIGANCIÓN

	MOV r2,1 /*Q*/
	MOV r3,1 /*X*/
	MOV r4,0 /*Y*/
	MOV r5,1 /*Z*/

	#NEGACIÓN DE LAS VARIABLES

	MVN r6, r2 /*/Q*/
	MVN r7, r3 /*/X*/
	MVN r8, r4 /*/Y*/
	MVN r9, r5 /*/Z*/

	# X./Y
	AND r12, r3, r8
	#FIN F1
	ORR r1, r1, r12

	# /Q./X.Y
	AND r12, r6, r7
	AND r12, r12, r4
	#FIN F2
	#OR DE F1 CON F2
	ORR r1, r1, r12

	#/Q.X./Z
	AND r12, r6, r3
	AND r12, r12, r9
	#FIN F3
	#OR DE F1 CON F2 Y F3
	ORR r1, r1, r12
	
	LDR r0, =exit
	BL printf

	POP {ip, pc}
