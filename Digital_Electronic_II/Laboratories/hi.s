# Hola Mundo in MIPS Assembly
        .data        # Declaracion dato
hello_msg:   .asciiz "Hola Mundo \n";
        .text
main:                # Start of code section
        la $a0, hello_msg
        li $v0, 4
        syscall
        # Hacia la salida
        li $v0, 10
        syscall
# Fin
