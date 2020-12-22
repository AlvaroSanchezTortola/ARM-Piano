mov contador,#0   @Inicializa en cero el contador para recorrer el vector
                      @desde el principio
   
vcloop:
    ldr r5,=vectorCompu       @Se crea un puntero de 'vectorCompu' a r5
    ldr r5,[r5,contador]   @Asigna el valor de vector compu en r5
    push {contador}           @Se almacena el contador en la pila   
   
        cmp r5,#1
        bleq EncenderRojo

        cmp r5,#2
        bleq EncenderAzul

        cmp r5,#3
        bleq EncenderAmarillo

        cmp r5,#4
        bleq EncenderVerde

    pop {contador}
        cmp contador,contadorCiclo
        addne contador,contador,#4
        bne vcloop
        beq loop