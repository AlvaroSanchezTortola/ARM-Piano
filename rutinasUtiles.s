/*********************************************************/
/*                PROYECTO No.1: PIANO                   */
/* rutinasUtiles.s	     		                         */
/* Autores: Olga Lucía Cobaquil,    13020             	 */
/*          Álvaro Sánchez Tórtola, 13657             	 */
/* Fecha: 22/08/2014						         	 */	
/* Curso: CC4010 Taller de Assembler				     */
/*********************************************************/

.globl Reproducir
Reproducir:
	push {lr}
	
	mov r6, #0 /* contador arreglo*/
	mov r7, #10  /* Contador*/

	loop$:
		ldr r4, [r2, r6]
		push {r6}
			cmp r4, #1
			bleq notaDoLarga
			cmp r4, #2
			bleq notaReLarga
			cmp r4, #3
			bleq notaMiLarga
			cmp r4, #4
			bleq notaFaLarga
			cmp r4, #5
			bleq notaSolLarga
			cmp r4, #6
			bleq notaLaLarga
			cmp r4, #7
			bleq notaSiLarga
		pop {r6}

		cmp r7, #0
		addne r6, r6, #4
		subne r7, r7, #1
		bne loop$
		@@beq loop	

	pop {pc}



/*************************************************************/
/* -------------Subrutina Encender-------------------------  */
/* Recibe en R0 el número de puerto GPIO                     */
/* Coloca en R1 un 1 para encender el puerto (lógica directa)*/
/*************************************************************/
.globl Encender
Encender:
	push {lr}
	mov r1,#1   /* Encender el puerto (lógica directa) */
    bl SetGpio
	pop {pc}
	
/*************************************************************/
/* -------------Subrutina Apagar---------------------------  */
/* Recibe en R0 el número de puerto GPIO                     */
/* Coloca en R1 un 0 para apagar el puerto (lógica directa)  */
/*************************************************************/
.globl Apagar
Apagar:
	push {lr}
	mov r1,#0   /* Apagar el puerto (lógica directa) */
    bl SetGpio
	pop {pc}

/*************************************************************/
/* ------------Subrutina GetGpio  -------------------------  */
/* Recibe en R1 el número de puerto GPIO                     */
/* Devuelve en R5 un 1 si botón está en HIGH (lógica directa)*/
/* Devuelve en R5 un 0 si botón está en LOW (lógica directa) */
/*************************************************************/
.globl GetGpio
GetGpio:
	push {lr}
	bl GetGpioAddress
	mov r4, r0
	ldr r5, [r4, #0x34]  /* Dirección base GPIO entrada (0x20200034) */
	mov r0, #1
	lsl r0, r1	
	and r5, r0 
	pop {pc}