#*******************************************************************************
#    AUTORES:
#				MATEO PRESIGA HIDALGO
#				DIMAR ANDREY SUAREZ HIDALGO
#				JUAN JOSE HUGET
# FECHA INICIO: 09/03/2021
# FECHA FINAL:  16/03/2021
# VERSION: 1.0
# DESCRIPCION: ASSEMBLER CODIFICADO CON BASE AL CIRCUITO 
#              OPERATIVO DEL TALLER 2, REALIZADO EN GRUPOS POR FINALIZACIÓN DE CC.
# FUNCION BOOLEANA: F= π(0,14,17,23,28,10,11,7)
# 
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


.syntax unified

.data
	.data
	string1: .asciz "\n NOMBRE DEL PROYECTO: \n"
	string2: .asciz "INTEGRANTES:	-> MATEO PRESIGA HIDALGO \n"
	string3: .asciz "			-> DIMAR ANDREY SUAREZ \n"
	string4: .asciz "			-> HUGUET \n"
	string5: .asciz "FECHA INICIO: 20/10/2020 FECHA FINAL: 20/10/2020\n"
	string6: .asciz "VERSION\n"
	string7: .asciz "DESCRIPCION FUNCION BOOLEANA: F(A,B,C,D,E)=\n"
	
	exit: .asciz "EL RESULTADO ES: %d "

	A: .word 0
	B: .word 0
	C: .word 0
	D: .word 0
	E: .word 0


.text
.global main
.extern printf

main:	PUSH {ip, lr}

	LDR r0, =string1
	BL printf

	LDR r0, =string2
	BL printf

	LDR r0, =string3
	BL printf

	LDR r0, =string4
	BL printf

	LDR r0, =string5
	BL printf

	LDR r0, =string6
	BL printf

	LDR r0, =string7
	BL printf


	# F(A,B,C,D,E) = A.D./E + /B.C./D + /A.B./D + A.B./C+ B.C.E + A./B./E + /B./.C.D + /B.D./E + /A./D.E

	MOV r2, 1 /* A */ 
	MOV r3, 1 /* B */ 
	MOV r4, 1 /* C */
	MOV r5, 1 /* D */
	MOV r6, 0 /* E */ 

	
	# NEGACION DE LAS VARIABLES

	MVN r7,  r2 /* /A */
	MVN r8,  r3 /* /B */
	MVN r9,  r4 /* /C */
 	MVN r10, r5 /* /D */
	MVN r11, r6 /* /E */ 
	

	# A.D./E
	AND r12, r2, r5
	AND r12, r12, r11
        #---
	ORR r1, r12, r12
	
	# /B.C./D
	AND r12, r8, r4
	AND r12, r12, r11    
	# A.D./E + /B.C./D
	ORR r1, r1, r12
	
	# /A.B./D
	AND r12, r7, r3
	AND r12, r12, r10
	# A.D./E + /B.C./D + /A.B./D
	ORR r1, r1, r12


	# A.B./C
	AND r12, r2, r3
	AND r12, r12, r9
	# A.D./E + /B.C./D + /A.B./D + A.B./C
	ORR r1, r1, r12

	# B.C.E
	AND r12, r3, r4
	AND r12, r12, r6
	# A.D./E + /B.C./D + /A.B./D + A.B./C + B.C.E
	ORR r1, r1, r12
	
	# A./B./E
	AND r12, r2, r8
	AND r12, r12, r11
	# A.D./E + /B.C./D + /A.B./D + A.B./C + B.C.E + A./B./E
	ORR r1, r1, r12
	
	# /B./C.D
	AND r12, r8, r9
	AND r12, r12, r5
	# A.D./E + /B.C./D + /A.B./D + A.B./C + B.C.E + A./B./E + /B./C.D
	ORR r1, r1, r12
		
	# /B.D./E
	AND r12, r8, r5
	AND r12, r12, r11
	# A.D./E + /B.C./D + /A.B./D + A.B./C + B.C.E + A./B./E + /B./C.D + /B.D./E
	ORR r1, r1, r12
	
	# /A./D.E
	AND r12, r7, r10
	AND r12, r12, r6
	# A.D./E + /B.C./D + /A.B./D + A.B./C + B.C.E + A./B./E + /B./C.D + /B.D./E + /A./D.E
	ORR r1, r1, r12

	LDR r0, =exit
	BL printf

	POP {ip, pc}
