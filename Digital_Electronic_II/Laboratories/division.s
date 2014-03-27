.data
	dividendo: .asciiz "Ingrese el dividendo\n";
	divisor: .asciiz "Ingrese el divisor\n";
	cociente: .asciiz "El cociente es: \n";
	residuo: .asciiz "El residuo es: \n";
	endl: .asciiz "\n";
.text
main:
	add $s0,$zero,$zero
	add $s1,$zero,$zero
	add $s2,$zero,$zero
	add $s3,$zero,$zero
	add $s4,$zero,$zero
	add $t0,$zero,$zero
	add $t1,$zero,$zero

	la $a0, dividendo
	li $v0, 4
	syscall
	li $v0,5
	syscall
	add $s0,$zero,$v0
	#add $s5,$zero,$s0
	
	la $a0, divisor
	li $v0, 4
	syscall
	li $v0,5
	syscall
	
	sll $s1,$v0,16
	#add $s6,$zero,$s1
	addi $s4,$zero,17
loop:	
	sub $s0,$s0,$s1
	slt $t0,$s0,$zero
	add $t1,$zero,1
	beq $t1,$t0,L1	
	sll $s2,$s2,1
	addi $s2,$s2,1
	j mm

L1:	add $s0,$s1,$s0
	sll $s2,$s2,1
	j mm

mm:	srl $s1,$s1,1
	add $s3,$s3,1
	beq $s3,$s4,exit
	j loop

exit:	la $a0, cociente
        li $v0, 4
        syscall
	add $a0,$s2,$zero
	#sll $a0,$s2,1
	li $v0,1
	syscall

	la $a0, endl
        li $v0, 4
        syscall

	la $a0, residuo
        li $v0, 4
        syscall

	add $a0,$s0,$zero
	li $v0,1
	syscall

	la $a0, endl
	li $v0, 4
	syscall

	j main

	li $v0, 10
      	syscall
#s0 resto
#s1 divisor
#s2 cociente
