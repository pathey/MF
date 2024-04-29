.data

n:		.space	4
lfsr:		.space	4
bit:		.space	4


.text
	
main:
	
	li $v0, 30
	syscall
	li $v0, 34
	syscall
	
	move $t0, $a0
	
	#li $t0, 0xFFAA5510
	sw $t0, n

	#li $t0, 27
	#lw $t0, n
	addi $t1, $t0, 0
	
	sw $t0, lfsr
	
	lw $t0, lfsr
	
	srl $t3, $t0, 0
	srl $t2, $t0, 10		# lfsr >> 10
	xor $t3, $t3, $t2		# (lfsr >> 0) ^ (lfsr >> 10)
	srl $t2, $t0, 30		# lfsr >> 30
	xor $t3, $t3, $t2		# (lfsr >> 0) ^ (lfsr >> 10) ^ (lfsr >> 30)
	srl $t2, $t0, 31		# lfsr >> 31
	xor $t3, $t3, $t2		# (lfsr >> 0) ^ (lfsr >> 10) ^ (lfsr >> 30) ^ (lfsr >> 31)
	li $t2, 1
	and $t3, $t3, $t2		# ((lfsr >> 0) ^ (lfsr >> 10) ^ (lfsr >> 30) ^ (lfsr >> 31)) & 1
	
	sw $t3, bit			# store new bit to be inputed at address allocated by label "bit"

	srl $t2, $t0, 1			# lfsr >> 1	 shift right 1 to make space for new bit
	sll $t3, $t3, 31		# bit << 31	 shift left 31 to get LSB to MSB position
	or $t3, $t2, $t3		# (lfsr >> 1) | (bit << 31)
	sw $t3, lfsr			# store generated rand num at lfsr
	    
	li $v0, 34			# syscall to print integer in hex
	lw $a0, lfsr			# load lfsr to be printed
	syscall

	li $v0, 10			# syscall to terminate program
	syscall
