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
	string11: .asciz "\nDESCRIPCION FUNCIÓN BOOLEANA: F...  \n"

	exit: .asciz "EL RESULTADO ES: %d\n"

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

	# F(A,B,C,D,E) = A.B.D + A.C./E + /B.C./D + C./D./E + /A.C.E + /C./D.E + /A./B.D + /A.B./C./E

	#ASIGANCIÓN

	MOV r2,1 /*A*/
	MOV r3,0 /*B*/
	MOV r4,1 /*C*/
	MOV r5,1 /*D*/
	MOV r6,1 /*E*/

	#NEGACIÓN DE LAS VARIABLES

	MVN r7, r2 /*/A*/
	MVN r8, r3 /*/B*/
	MVN r9, r4 /*/C*/
	MVN r10, r5 /*/D*/
	MVN r11, r6 /*/E*/

	#A.B.D
	AND r12, r2, r3
	AND r12, r12, r5
	#FIN F1
	ORR r1, r1, r12

	#A.C./E
	AND r12, r2, r4
	AND r12, r12, r11
	#FIN F2
	#OR DE F1 CON F2
	ORR r1, r1, r12

	#/B.C/D
	AND r12, r8, r4
	AND r12, r12, r10
	#FIN F3
	#OR DE F1 CON F2 Y F3
	ORR r1, r1, r12

	#C./D./E
	AND r12, r4, r10
	AND r12, r12, r11
	#FIN F4
	#OR DE F1, F2, F3 Y F4
	ORR r1, r1, r12

	#/A.C.E
	AND r12, r7, r4	
	AND r12, r12, r6
	#FIN F5
	#OR DE F1,F2,F3,F4 Y F5
	ORR r1,r1,r12

	#/C./D.E
	AND r12, r9, r10
	AND r12, r12, r6
	#FIN F6
	#OR DE F1, F2, F3, F4, F5 Y F6
	ORR r1, r1, r12

	#/A./B.D
	AND r12, r7, r8
	AND r12, r12, r5
	#FIN F7
	#OR DE F1,F2,F3,F4,F5,F6 Y F7
	ORR r1, r1, r12

	#/A.B/C./E
	AND r12, r7, r3
	AND r12, r12, r9
	AND r12, r12, r11
	#FIN F8
	#OR DE F1,F2,F3,F4,F5,F6,F7 Y F8
	ORR r1,r1,r12

		
	LDR r0, =exit
	BL printf

	POP {ip, pc}
