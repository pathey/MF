#Author:	Peter Athey
#Description: 	MF - MazeFighter: A rudimentary 3D rendering program

.data
player:			.asciiz "0"		#This is the player symbol on the overhead map
newline:		.asciiz  "\n"
map:				#This defines a map for the player to navigate
			.asciiz "####################\n"
			.asciiz "#       # #        #\n"
			.asciiz "#       # #        #\n"
			.asciiz "#       # #        #\n"
			.asciiz "#       # #        #\n"
			.asciiz "#       # #        #\n"
			.asciiz "#       # #        #\n"
			.asciiz "#       # #        #\n"
			.asciiz "#         #        #\n"
			.asciiz "#       # ##### ####\n"
			.asciiz "#       #          #\n"
			.asciiz "#       ############\n"
			.asciiz "#                  #\n"
			.asciiz "#                  #\n"
			.asciiz "#                  #\n"
			.asciiz "#                  #\n"
			.asciiz "#                  #\n"
			.asciiz "#                  #\n"
			.asciiz "#                  #\n"
			.asciiz "####################\n\0\0"
		
clear_screen:   	.asciiz "\x1b[2J"      # Escape sequence to clear the screen
cursor_home:    	.asciiz "\033[20A\0"       # Escape sequence to move cursor to home (top-left corner)
cursor_down:    	.asciiz "\033[B\0"       # Escape sequence to move cursor down


.text 				#Code starts here


#gp +4 is the x-coordinate
#gp +8 is the y coordinate
#gp +12 is the pickup type
#gp +16 is the pickup availability (on cooldown or not)
#gp +20 is the number of characters in a row


main:
	
	li $t0, 9
	sw $t0, 4($gp)			#Loads and stores x and y coordinates
	li $t1, 1
	sw $t1, 8($gp)
	li $t2, 1
	sw $t2, 12($gp)
	li $t3, 0
	sw $t3, 16($gp)
	li $t4, 22
	sw $t4, 20($gp)
	
	li $v0, 4
    	la $a0, clear_screen
    	syscall

	jal draw	         	# Jump to the printMap subroutine
	
	li $v0, 4
    	la $a0, clear_screen
    	syscall
	
	jal draw
	
	j end
	
while:
	
	
	addi $sp, $sp, -4
	sw $v0, ($sp)
	
	jal checkChange
	
	move $t4, $v0
	
	lw $v0, ($sp)
	addi $sp, $sp, 4
	
	beq $t4, 0, skipDraw
    	jal draw           	# Jump to the printMap subroutine
    	skipDraw:
    	
    	li $v0, 11			#Checking for user input/jumping appropriately
    	syscall
    	
    	move $a0, $v0			#storing v0 in a0 for convention matching
    	
    	beq $a0, 0x71, end		#Jump to end if input character is q

	bne $a0, -1, noInputHandling	#Handle input if it isn't -x
	jal inputHandler
	noInputHandling:

	j while				#Loop unless player hits X to exit



#Check if there is a need to re-render
checkChange:

	lw $t4, 4($gp)
	lw $t5, 8($gp)
	lw $t6, 12($gp)
	lw $t7, 16($gp)

	bne $t4, $t0, changeTrue	
	bne $t5, $t1, changeTrue
	bne $t6, $t2, changeTrue
	bne $t7, $t3, changeTrue
	
	li $v0, 0
	
	jr $ra
	
	changeTrue:
	li $v0, 1
	lw $t0, 4($gp)
	lw $t1, 8($gp)
	lw $t2, 12($gp)
	lw $t3, 16($gp)
	
	
	jr $ra
	
	
inputHandler:
	addi $sp, $sp, -4
	sw $t0, ($sp)
	addi $sp, $sp, -4
	sw $t1, ($sp)
	addi $sp, $sp, -4
	sw $t2, ($sp)
	addi $sp, $sp, -4
	sw $t3, ($sp)
	addi $sp, $sp, -4
	sw $t4, ($sp)
	addi $sp, $sp, -4
	sw $t5, ($sp)
	addi $sp, $sp, -4
	sw $t6, ($sp)
	
	lw $t3, 4($gp)			#Store x and y coordinates in temporary registers for checking after
	lw $t4, 8($gp)
	
	move $t0, $a0
	
	bne $t0, 0x77, noForward
	addi $t4, $t4, -1
	noForward:
	bne $t0, 0x73, noBackward
	addi $t4, $t4, 1
	noBackward:
	bne $t0, 0x61, noLeft
	addi $t3, $t3, -1
	noLeft:
	bne $t0, 0x64, noRight
	addi $t3, $t3, 1
	noRight:
	
	lw $t6, 20($gp)
	
	la $a0, map            	# Load the address of the map into $a0
    	li $v0, 4               	# System call code for printing a string
       	mul $t1, $t4, $t6
       	add $a0, $a0, $t1
       	add $a0, $a0, $t3

       	li $s1, 4				#divisor
			
	div $a0, $s1				#Perform Division
	mfhi $s2				#Fetch remainder and store in $s2
		
	mflo $t0
		
	mul $t0, $t0, 4
		
	lw $t1, ($t0)
	mul $s2, $s2, 8
	srlv $t1, $t1, $s2
	and $t1, 0xff
	beq $t1, 0x23, checkFail
	sw $t3, 4($gp)
       	sw $t4, 8($gp)
        
        checkFail:
        li $v0, -1
	
	jr $ra
	
	lw $t6, ($sp)
	addi $sp, $sp, 4
	lw $t5, ($sp)
	addi $sp, $sp, 4
	lw $t4, ($sp)
	addi $sp, $sp, 4
	lw $t3, ($sp)
	addi $sp, $sp, 4
	lw $t2, ($sp)
	addi $sp, $sp, 4
	lw $t1, ($sp)
	addi $sp, $sp, 4
	lw $t0, ($sp)
	addi $sp, $sp, 4

#ClearScreen Subroutine
clearScreen:
	addi $sp, $sp, -4
	sw $t0, ($sp)
	addi $sp, $sp, -4
	sw $a0, ($sp)
	
	li $t0, 25
	clsLoop:
		la $a0, newline
		li $v0, 4
		syscall
		
		addi $t0, $t0, -1
		bnez $t0, clsLoop
	lw $a0, ($sp)
	addi $sp, $sp, 4
	lw $t0, ($sp)
	addi $sp, $sp, 4
	jr $ra


# Subroutine to print the map
draw:

	addi $sp, $sp, -4		#Preserves space for current function
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t4, 0($sp)
	addi $sp, $sp, -4
	sw $t5, 0($sp)
	addi $sp, $sp, -4
	sw $t6, 0($sp)
	addi $sp, $sp, -4
	sw $t7, 0($sp)
	addi $sp, $sp, -4
	sw $s0, 0($sp)
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	addi $sp, $sp, -4
	sw $s3, 0($sp)
	
	#li $v0, 4
    	#la $a0, clear_screen
    	#syscall
    	
    	li $v0, 4
    	la $a0, cursor_home
    	syscall
	
	#addi $sp, $sp, -4
	#sw $ra, ($sp)
	#jal clearScreen			#clears the screen (also saves $ra)
	#lw $ra, ($sp)
	#addi $sp, $sp, 4
	
	lw $t1, 4($gp)			# Load x-coordinate into t1
	lw $t2, 8($gp)			# Load y-coordinate into t2
	li $t3, 0
	li $t6, 0x51
	
	
	la $a0, map            	# Load the address of the map into $a0
    	li $v0, 4               	# System call code for printing a string
    	loop:
        	lb $a1, 0($a0)      	# Load a string from the map
        	bne $t2, $t3, postPrintMapPlayerCheck		#If the player y coordinate doesn't match the current row, jump past the x coord check
        	li $t4, 0
        	playerInsert:
        		addi $t4, $t4, 1
        		bne $t1, $t4, playerInsert
        		add $t5, $a0, $t4
        		
        		move $s0, $t5				#dividend
        		li $s1, 4				#divisor
			
			div $s0, $s1				#Perform Division
			mfhi $s2				#Fetch remainder and store in $s2
			
			sub $t5, $t5, $s2			#Bitwise shenanigans to insert player character "Q" into current string
			lw $t7, 0($t5)
			mul $s3, $s2, 8
			sllv $t6, $t6, $s3
			li $t0, 0xffffff00
			
			rol $t0, $t0, $s3
			and $t7, $t7, $t0
			or $t7, $t7, $t6
        		
        		#lw $t7, 0($t5 - ($t5 % 4))
        		#shift $t6 left ($t5 % 4)
        		#sw $t7, ($t6 OR $t7)
        		#sw $t7 0($t5 - ($t5 % 4)
        		
        		sw $t7, 0($t5)
        	postPrintMapPlayerCheck:
        	beqz $a1, endPrint   	# If the character is null, end the loop
        	syscall             	# Print the character
        	addi $a0, $a0, 22    	# Move to the next character in the map
        	addi $t3, $t3, 1
        	j loop              	# Repeat the loop
    	endPrint:
        	li $v0, 4           	# System call code for printing a string
        	la $a0, newline     	# Load the newline string address
        	syscall             	# Print a newline
        	jr $ra              	# Return from the subroutine
	
	
	lw $s3, 0($sp)
        addi $sp, $sp, 4
	lw $s2, 0($sp)
        addi $sp, $sp, 4
        lw $s1, 0($sp)
        addi $sp, $sp, 4
        lw $s0, 0($sp)
        addi $sp, $sp, 4
	lw $t7, 0($sp)
        addi $sp, $sp, 4    
        lw $t6, 0($sp)
        addi $sp, $sp, 4        
        lw $t5, 0($sp)
        addi $sp, $sp, 4
        lw $t4, 0($sp)
        addi $sp, $sp, 4
        lw $t3, 0($sp)
        addi $sp, $sp, 4
        lw $t2, 0($sp)
        addi $sp, $sp, 4
        lw $t1, 0($sp)
        addi $sp, $sp, 4
        lw $t0, 0($sp)
        addi $sp, $sp, 4
        lw $a0, 0($sp)
        addi $sp, $sp, 4		#Restores saved space

end:
    # End of the program