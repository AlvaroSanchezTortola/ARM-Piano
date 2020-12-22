/*************************************************************/
/*                    PROYECTO No.1: PIANO                   */
/* notas.s						                         	 */
/* Autores: Olga Lucía Cobaquil,    13020             	     */
/*          Álvaro Sánchez Tórtola, 13657             	     */
/* Fecha: 22/08/2014						         	     */	
/* Curso: CC4010 Taller de Assembler				         */
/*************************************************************/

/*************************************************************/
/* -------------Subrutina notaDo---------------------------  */
/* Coloca en R0 el número de puerto GPIO (Bocina: GPIO 25)   */
/* Coloca en R1 el estado del puerto (1: HIGH, 0:LOW)        */
/* Coloca en R0 la frecuencia de salida (en microsegundos)   */
/*************************************************************/
.globl notaDo
notaDo:
	push {lr}
	mov r0, #25
	bl Encender

    ldr r0,=1300  		/* Delay de 1000 μs */
    bl Wait
    /*--------------------------------------*/
    mov r0, #25
	bl Apagar
	
	ldr r0,=1300 		/* Delay de 1000 μs */
    bl Wait
	pop {pc}

/*************************************************************/
/* -------------Subrutina notaRe---------------------------  */
/* Coloca en R0 el número de puerto GPIO (Bocina: GPIO 25)   */
/* Coloca en R1 el estado del puerto (1: HIGH, 0:LOW)        */
/* Coloca en R0 la frecuencia de salida (en microsegundos)   */
/*************************************************************/
.globl notaRe
notaRe:
	push {lr}
	mov r0, #25
	bl Encender

    ldr r0,=1200 		/* Delay de 900 μs */
    bl Wait
    /*--------------------------------------*/
    mov r0, #25
	bl Apagar
	
	ldr r0,=1200		/* Delay de 900 μs */
    bl Wait
	pop {pc}

/*************************************************************/
/* -------------Subrutina notaMi---------------------------  */
/* Coloca en R0 el número de puerto GPIO (Bocina: GPIO 25)   */
/* Coloca en R1 el estado del puerto (1: HIGH, 0:LOW)        */
/* Coloca en R0 la frecuencia de salida (en microsegundos)   */
/*************************************************************/
.globl notaMi
notaMi:
	push {lr}
	mov r0, #25
	bl Encender

    ldr r0,=1100 		/* Delay de 800 μs */
    bl Wait
    /*--------------------------------------*/
    mov r0, #25
	bl Apagar
	
	ldr r0,=1100		/* Delay de 800 μs */
    bl Wait
	pop {pc}

/*************************************************************/
/* -------------Subrutina notaFa---------------------------  */
/* Coloca en R0 el número de puerto GPIO (Bocina: GPIO 25)   */
/* Coloca en R1 el estado del puerto (1: HIGH, 0:LOW)        */
/* Coloca en R0 la frecuencia de salida (en microsegundos)   */
/*************************************************************/
.globl notaFa
notaFa:
	push {lr}
	mov r0, #25
	bl Encender

    ldr r0,=1000 		/* Delay de 730 μs */
    bl Wait
    /*--------------------------------------*/
    mov r0, #25
	bl Apagar
	
	ldr r0,=1000 		/* Delay de 730 μs */
    bl Wait
	pop {pc}

/*************************************************************/
/* -------------Subrutina notaSol---------------------------  */
/* Coloca en R0 el número de puerto GPIO (Bocina: GPIO 25)   */
/* Coloca en R1 el estado del puerto (1: HIGH, 0:LOW)        */
/* Coloca en R0 la frecuencia de salida (en microsegundos)   */
/*************************************************************/
.globl notaSol
notaSol:
	push {lr}
	mov r0, #25
	bl Encender

    ldr r0,=900 		/* Delay de 600 μs */
    bl Wait
    /*--------------------------------------*/
    mov r0, #25
	bl Apagar
	
	ldr r0,=900 		/* Delay de 600 μs */
    bl Wait
	pop {pc}

/*************************************************************/
/* -------------Subrutina notaLa---------------------------  */
/* Coloca en R0 el número de puerto GPIO (Bocina: GPIO 25)   */
/* Coloca en R1 el estado del puerto (1: HIGH, 0:LOW)        */
/* Coloca en R0 la frecuencia de salida (en microsegundos)   */
/*************************************************************/
.globl notaLa
notaLa:
	push {lr}
	mov r0, #25
	bl Encender

    ldr r0,=800 		/* Delay de 500 μs */
    bl Wait
    /*--------------------------------------*/
    mov r0, #25
	bl Apagar
	
	ldr r0,=800 		/* Delay de 500 μs */
    bl Wait
	pop {pc}

/*************************************************************/
/* -------------Subrutina notaSi---------------------------  */
/* Coloca en R0 el número de puerto GPIO (Bocina: GPIO 25)   */
/* Coloca en R1 el estado del puerto (1: HIGH, 0:LOW)        */
/* Coloca en R0 la frecuencia de salida (en microsegundos)   */
/*************************************************************/
.globl notaSi
notaSi:
	push {lr}
	mov r0, #25
	bl Encender

    ldr r0,=700 		/* Delay de 420 μs */
    bl Wait
    /*--------------------------------------*/
    mov r0, #25
	bl Apagar
	
	ldr r0,=700 		/* Delay de 420 μs */
    bl Wait
	pop {pc}

.globl notaDoLarga
notaDoLarga:
	push {lr}

	mov r5, #0
	cmp r5, #4000
	blne notaDo
	addne r5, r5, #1

	pop {pc}

.globl notaReLarga
notaReLarga:
	push {lr}

	mov r5, #0
	cmp r5, #4000
	blne notaRe
	addne r5, r5, #1

	pop {pc}

.globl notaMiLarga
notaMiLarga:
	push {lr}

	mov r5, #0
	cmp r5, #4000
	blne notaMi
	addne r5, r5, #1

	pop {pc}

	.globl notaFaLarga
notaFaLarga:
	push {lr}

	mov r5, #0
	cmp r5, #4000
	blne notaFa
	addne r5, r5, #1

	pop {pc}

	.globl notaSolLarga
notaSolLarga:
	push {lr}

	mov r5, #0
	cmp r5, #4000
	blne notaSol
	addne r5, r5, #1

	pop {pc}

	.globl notaLaLarga
notaLaLarga:
	push {lr}

	mov r5, #0
	cmp r5, #4000
	blne notaLa
	addne r5, r5, #1

	pop {pc}

	.globl notaSiLarga
notaSiLarga:
	push {lr}

	mov r5, #0
	cmp r5, #4000
	blne notaSi
	addne r5, r5, #1

	pop {pc}