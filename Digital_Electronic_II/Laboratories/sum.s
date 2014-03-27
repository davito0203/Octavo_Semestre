# ADD MIPS Assembly
# By: David Mart[inez
        .data        # Declaracion dato
input_a:   .asciiz "Ingrese el valor de A: ";
input_b:   .asciiz "Ingrese el valor de B: ";
solve:	   .asciiz "El valor es: "
        .text
main:                # Inicio del main
	add $s0, $zero, $zero
	add $s1, $zero, $zero
	add $s2, $zero, $zero

	li $v0, 4
	la $a0, input_a
	syscall
	# Lee a A
	li $v0, 5
	syscall
	add $s0, $zero, $v0

	li $v0, 4
	la $a0, input_b
	syscall
	# Lee a B
	li $v0, 5
	syscall
	add $s1, $zero, $v0

suma:	#No he podido mostrar el resulado
	add $a2, $a0, $a1
	li $v0, 4
	la $a2, solve
	syscall
	
	# Now do a graceful exit
        li $v0, 10
        syscall
# END OF PROGRAM
