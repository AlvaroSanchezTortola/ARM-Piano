/*************************************************************/
/*                    PROJECT PIANO                  		 */
/* main.s			    			                         */
/* Authors: Olga Lucía Cobaquil			            	     */
/*          Álvaro Sánchez Tórtola             	    		 */
/* Date: 22/08/2014						         	         */	
/* Course: CC4010 Taller de Assembler				         */
/*************************************************************/

.section .init
.globl _start

_start:
b main

/* -------------------Macro SetPuerto----------------------- */
/* Recibe en R0 el número de puerto GPIO                     */
/* Recibe en R1 un 1 para establecer puerto como salida,     */
/* 0 para entrada.						                     */
/* Utiliza la funcion SetGpioFunction de gpio.s  			 */
/* --------------------------------------------------------- */
.macro SetPuerto puerto, funcion
    mov r0, \puerto
    mov r1, \funcion
    bl SetGpioFunction
.endm

/* ------------------Macro SetNota-------------------------- */
/* Recibe en R1 el número de puerto GPIO                     */
/* Recibe el nombre de la subrutina de la nota 				 */						                     
/* Utiliza la funcion SetGpio de gpio.s  					 */
/* --------------------------------------------------------- */
.macro SetNota puerto, subrutina, numero
    mov r1, \puerto
    bl GetGpio
    teq r5, #0
    blne \subrutina
    movne r4, \numero
    ldrne r2, =arreglo
    strne r4, [r2, r3]
    addne r3, r3, #4
    moveq r0, #25
    bleq Apagar
.endm



.section .text

/**************************************************************/
/* 				       ARCHIVO PRINCIPAL                      */
/**************************************************************/
main:
	mov sp, #0x8000
	/*--------------------------------------------------------*/
    /* -----Establecer puertos GPIO de entrada y salida-----  */
    /*--------------------------------------------------------*/

    /* ----------Puertos GPIO de entrada (botones)----------- */
    SetPuerto #7,  #0       /* Establecer puerto GPIO 07 como entrada */    
    SetPuerto #8,  #0		/* Establecer puerto GPIO 08 como entrada */  
    SetPuerto #9,  #0		/* Establecer puerto GPIO 09 como entrada */  
    SetPuerto #10, #0		/* Establecer puerto GPIO 10 como entrada */
    SetPuerto #11, #0		/* Establecer puerto GPIO 11 como entrada */    
    SetPuerto #17, #0		/* Establecer puerto GPIO 17 como entrada */  
    SetPuerto #22, #0		/* Establecer puerto GPIO 22 como entrada */
    SetPuerto #23, #0  
    
	
	/* -------------Puerto GPIO de salida (bocina)----------- */
	SetPuerto #25, #1		/* Establecer puerto GPIO 25 como salida  */  

    
    mov r3, #0              /* Contador*/
    
 
loop:  	/* ***********Ciclo infinito del programa***********  */

	/* ----Establecer notas correspondientes a cada boton---- */
    SetNota #7,  notaDo, #1     /* Si GPIO 07 está en HIGH, tocar nota Do */
    SetNota #8,  notaRe, #2     /* Si GPIO 08 está en HIGH, tocar nota Re */
    SetNota #9,  notaMi, #3     /* Si GPIO 09 está en HIGH, tocar nota Mi */
    SetNota #10, notaFa, #4     /* Si GPIO 10 está en HIGH, tocar nota Fa */
    SetNota #11, notaSol, #5    /* Si GPIO 11 está en HIGH, tocar nota Sol */
    SetNota #17, notaLa, #6     /* Si GPIO 17 está en HIGH, tocar nota La */
    SetNota #22, notaSi, #7     /* Si GPIO 22 está en HIGH, tocar nota Si */


    mov r1, #23
    bl GetGpio
    teq r5, #0
    ldrne r2, =arreglo
    @@blne Reproducir
    movne r6, #0 	/* contador arreglo*/
	movne r7, #10  	/* Contador*/
	blne loop$

	
	b loop

	loop$:
		ldr r4, [r2, r6]
		push {r6}
		push {r7}
			cmp r4, #1
			bleq notaDoLarga
			bleq notaDoLarga
			bleq notaDoLarga
			moveq r0, #25
			bleq Apagar
			ldreq r0,=4000000 		/* Delay de 1000 μs */
    		bleq Wait

			cmp r4, #2
			bleq notaReLarga
			bleq notaReLarga
			bleq notaReLarga
			moveq r0, #25
			bleq Apagar
			ldreq r0,=4000000 		/* Delay de 1000 μs */
    		bleq Wait

			cmp r4, #3
			bleq notaMiLarga
			bleq notaMiLarga
			bleq notaMiLarga
			moveq r0, #25
			bleq Apagar
			ldreq r0,=4000000 		/* Delay de 1000 μs */
    		bleq Wait

			cmp r4, #4
			bleq notaFaLarga
			bleq notaFaLarga
			bleq notaFaLarga
			moveq r0, #25
			bleq Apagar
			ldreq r0,=4000000 		/* Delay de 1000 μs */
    		bleq Wait

			cmp r4, #5
			bleq notaSolLarga
			bleq notaSolLarga
			bleq notaSolLarga
			moveq r0, #25
			bleq Apagar
			ldreq r0,=4000000 		/* Delay de 1000 μs */
    		bleq Wait

			cmp r4, #6
			bleq notaLaLarga
			bleq notaLaLarga
			bleq notaLaLarga
			moveq r0, #25
			bleq Apagar
			ldreq r0,=4000000 		/* Delay de 1000 μs */
    		bleq Wait

			cmp r4, #7
			bleq notaSiLarga
			bleq notaSiLarga
			bleq notaSiLarga
			moveq r0, #25
			bleq Apagar
			ldreq r0,=4000000 		/* Delay de 1000 μs */
    		bleq Wait
		pop {r7}
		pop {r6}
		cmp r7, #0
		addne r6, r6, #4
		subne r7, r7, #1
		blne loop$
		beq loop

.section .data
.align 2
arreglo:
.int 1,2,3,4,5,6,7,1,2,3
