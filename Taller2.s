
#Programa: 				TALLER #2
#Realizado por: 		Daniel Santiago Garcia
#						Daniel Ramirez Gallo
#                       Valentina Garcia Aguirre
#                       Cristian Fernando Pelaez Moncada
#                       Daniel Fernando Ramirez Giraldo
#Profesor: 				Hernando Vanegas
#Asignatura:			Arquitectura de Hardware
#Fecha Inicio:			03/15/2021
#Fecha Fin:				03/15/2021
#Version: 				V 1.0
#Funcion: 				F(A,B,C,D,E) = π(0,5,7,6,27,26,31,8)
#Funcion Simplificada:	F(A,B,C,D,E) = /A/C/D/E +/A/BCE + /A/BCD + AB/CD + ABDE
#-------------------------------------------------------------------------------------------------

.syntax unified

.data
aut1:
	.asciz	"Autor: Daniel Santiago Garcia\n"
aut2:
	.asciz	"Daniel Ramirez Gallo\n"
aut2:
	.asciz	"Valentina Garcia Aguirre\n"
aut2:
	.asciz	"Cristian Fernando Pelaez Moncada\n"
aut2:
	.asciz	"Daniel Fernando Ramirez Giraldo\n"
city:
	.asciz	"Ciudad: Medellin, Antioquia\n"
prof:
	.asciz	"Profesor: Hernando Vanegas\n"
prog:
	.asciz	"Asignatura: Arquitectura de Hardware\n"
univ:
	.asciz	"Universidad: Politecnico colombiano JIC\n"
func:
	.asciz	"F(A,B,C,D,E) = π(0,5,7,6,27,26,31,8)\n"
ver:
	.asciz	"Version: V0.1\n"
desc:
	.asciz	"Descripcion: taller #2 Arquitectura\n"
fechai:
	.asciz	"Fecha Incio:03/15/2021\n"
fechaf:
	.asciz	"Fecha Fin: 03/15/2021\n"

.text
resp:
	.asciz	"Resultado: %d \n"
.global main
.extern printf

main:	PUSH {ip, lr}

	LDR r0, =aut
	BL printf

	LDR r0, =city
	BL printf

	LDR r0, =prof
	BL printf

	LDR r0, =prog
	BL printf

	LDR r0, =fechai
	BL printf

	LDR r0, =fechaf
	BL printf

	LDR r0, =func
	BL printf

	/*Asignar valores de variables*/
	/*F(A,B,C,D,E) = /A/C/D/E +/A/BCE + /A/BCD + AB/CD + ABDE*/

	MOV r2, 0 	/* A */
	MOV r3, 0 	/* B */
	MOV r4, 0  	/* C */
	MOV r5, 0 	/* D */
	MOV r6, 0 	/* E */

	MOV R7, 1 	/* /A */
	MOV R8, 1 	/* /B */
	MOV R9, 1 	/* /C */
	MOV R10, 1 	/* /D */
	MOV R11, 1 	/* /E */

	/* Funcion 1 */
	AND R11, R10
	AND R11, R9  
	AND R11, R7

	/* Funcion 4 */
	AND R10, R9, R5
	AND R10, R3	
	AND R10, R2

	/* Funcion 2*/

	AND R9, R4, R6
	AND R9, R8
	AND R9, R7

	/* Funcion 3*/

	AND R8, R7
	AND R8, R4	
	AND R8, R5

	/* Funcion 5*/

	AND R7, R5, R6
	AND R7, R3
	AND R7, R2


	ORR R2, R11, R10
	ORR R3, R2, R9
	ORR R4, R3, R8
	ORR R5, R4, R7

	LDR r0, =resp
	MOV r1,r5
	BL printf

	POP {ip, pc}
