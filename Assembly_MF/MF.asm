#Author:	Peter Athey
#Description: 	MF - MazeFighter: A rudimentary 3D rendering program

# Some command prompts I used to run this on my machine
# java -jar /c/Users/Peter/Downloads/Mars4_5.jar MF.asm


.data
player:			.asciiz "0"		#This is the player symbol on the overhead map
newline:		.asciiz  "\n"
map:				#This defines a map for the player to navigate
			.asciiz "####################"
			.asciiz "#       # #        #"
			.asciiz "#       # #        #"
			.asciiz "#       # #        #"
			.asciiz "#       # #        #"
			.asciiz "#       # #        #"
			.asciiz "#       # #        #"
			.asciiz "#       # #        #"
			.asciiz "#         #        #"
			.asciiz "#       # ##### ####"
			.asciiz "#       #          #"
			.asciiz "#       ############"
			.asciiz "#                  #"
			.asciiz "#                  #"
			.asciiz "#                  #"
			.asciiz "#                  #"
			.asciiz "#                  #"
			.asciiz "#                  #"
			.asciiz "#                  #"
			.asciiz "####################\0"
			
map2:			
			.word 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x20 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x20 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x20 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x20 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x20 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x20 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x20 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x20 0x23 0x23 0x23 0x23 0x23 0x20 0x23 0x23 0x23 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x00
			.word 0x23 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x20 0x23 0x00
			.word 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x23 0x00 0x00
		
#clear_screen:   	.asciiz "\033[2J"      # Escape sequence to clear the screen
clear_screen:   	.byte 0x1b 0x5b 0x32 0x4a 0x00
#cursor_home:    	.asciiz "\033[20A"     # Escape sequence to move cursor to home (top-left corner)
cursor_home:    	.byte 0x1b 0x5b 0x32 0x31 0x41 0x00
cursor_down:    	.asciiz "\033[B"       # Escape sequence to move cursor down

bonk:			.asciiz "\nBONK!\n"		#triggered by colliding with a wall.


.text 				#Code starts here

.macro storetvalues
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
addi $sp, $sp, -4
sw $t7, ($sp)
.end_macro

.macro restoretvalues
lw $t7, ($sp)
addi $sp, $sp, 4
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
.end_macro

.macro storesvalues
addi $sp, $sp, -4
sw $s0, ($sp)
addi $sp, $sp, -4
sw $s1, ($sp)
addi $sp, $sp, -4
sw $s2, ($sp)
addi $sp, $sp, -4
sw $s3, ($sp)
addi $sp, $sp, -4
sw $s4, ($sp)
addi $sp, $sp, -4
sw $s5, ($sp)
addi $sp, $sp, -4
sw $s6, ($sp)
addi $sp, $sp, -4
sw $s7, ($sp)
.end_macro

.macro restoresvalues
lw $s7, ($sp)
addi $sp, $sp, 4
lw $s6, ($sp)
addi $sp, $sp, 4
lw $s5, ($sp)
addi $sp, $sp, 4
lw $s4, ($sp)
addi $sp, $sp, 4
lw $s3, ($sp)
addi $sp, $sp, 4
lw $s2, ($sp)
addi $sp, $sp, 4
lw $s1, ($sp)
addi $sp, $sp, 4
lw $s0, ($sp)
addi $sp, $sp, 4
.end_macro


#gp +4 is the x-coordinate
#gp +8 is the y coordinate
#gp +12 is the pickup type
#gp +16 is the pickup availability (on cooldown or not)
#gp +20 is the number of characters in a row
#gp +24 is the previous x coordinate
#gp +28 is the previous y coordinate
#gp +32 is the previous pickup type
#gp +36 is the previous availability
#gp +40 is the base address for the bitmap display

main:
	
	li $t0, 9
	sw $t0, 4($gp)			#Loads and stores x and y coordinates
	sw $t0, 24($gp)
	li $t1, 1
	sw $t1, 8($gp)
	sw $t1, 28($gp)
	li $t2, 1
	sw $t2, 12($gp)
	sw $t2, 32($gp)
	li $t3, 0
	sw $t3, 16($gp)
	sw $t3, 36($gp)
	li $t4, 22
	sw $t4, 20($gp)
	li $t5, 0x10040000
	sw $t5, 40($gp)
	
	
	#li $v0, 4
  	#la $a0, clear_screen
  	#syscall

	#j end
	
	#la $t0, map2
	#li $t1, 0
	#wordTestLoop:
	#lw $t2, 0($t0)
	#beq $t2, 0, endOfLoop
	#addi $t0, $t0, 4
	#addi $t1, $t1, 1
	#j wordTestLoop
	#endOfLoop:
	#li $v0, 1
	#move $a0, $t1
	#syscall
	#j end
	
	jal clearScreen
	

	jal bitMapMapDraw	         	# Jump to the printMap subroutine
	
	jal drawPerson
	
	
	#li $a0, 9
	#li $a1, 1
	#li $a2, 0xffdead
	#jal setpixel
	
  	#li $v0, 4
 	#la $a0, clear_screen
  	#syscall
	#jal draw
	#j end
	
while:
	
	
	addi $sp, $sp, -4
	sw $v0, ($sp)
	
	jal checkChange
	
	move $t4, $v0
	
	lw $v0, ($sp)
	addi $sp, $sp, 4
	
	beq $t4, 0, skipDraw
    	jal drawPerson           		# Jump to the printMap subroutine
    	skipDraw:
    	
    	li $v0, 12			#Checking for user input/jumping appropriately
    	syscall
    	
    	move $a0, $v0			#storing v0 in a0 for convention matching
    	
    	beq $a0, 0x71, end		#Jump to end if input character is q

	beq $a0, -1, noInputHandling	#Handle input if it isn't -1
	jal inputHandler
	noInputHandling:

	j while				#Loop unless player hits X to exit



#Check if there is a need to re-render
checkChange:
	
	storetvalues
	
	#MUST REBUILD TO PROPERLY HANDLE CANON/NONCANON POSITIONS (STORE IN ANOTHER GP POSITION, THEN CHECK)
	
	lw $t0, 24($gp)			#Grab the previous values
	lw $t1, 28($gp)
	lw $t2, 32($gp)
	lw $t3, 36($gp)
	
	
	lw $t4, 4($gp)			#Grab the currently stored values
	lw $t5, 8($gp)
	lw $t6, 12($gp)
	lw $t7, 16($gp)

	bne $t4, $t0, changeTrue	
	bne $t5, $t1, changeTrue
	bne $t6, $t2, changeTrue
	bne $t7, $t3, changeTrue
	
	li $v0, 0
	
	restoretvalues
	
	jr $ra
	
	changeTrue:
	li $v0, 1
	
	
	
	restoretvalues
	
	jr $ra
	
	
inputHandler:
	storetvalues
	storesvalues
	
	lw $t1, 4($gp)			#Store x and y coordinates for current access
	lw $t2, 8($gp)
	
	
	
	
	lw $t5, 4($gp)			#Store x and y coordinates in temporary registers for checking after
	lw $t6, 8($gp)
	
	move $t0, $a0
	
	bne $t0, 0x77, noForward
	addi $t2, $t2, -1
	noForward:
	bne $t0, 0x73, noBackward
	addi $t2, $t2, 1
	noBackward:
	bne $t0, 0x61, noLeft
	addi $t1, $t1, -1
	noLeft:
	bne $t0, 0x64, noRight
	addi $t1, $t1, 1
	noRight:
	
	lw $t6, 20($gp)
	
	la $a0, map            		# Load the address of the map into $a0
    	li $v0, 4               	# System call code for printing a string
       	mul $t3, $t2, $t6
       	add $a0, $a0, $t3
       	add $a0, $a0, $t1

       	li $s1, 4				#divisor
			
	div $a0, $s1				#Perform Division
	mfhi $s2				#Fetch remainder and store in $s2
		
	mflo $t0
		
	mul $t0, $t0, 4
		
	lw $t3, 0($t0)
	mul $s2, $s2, 8
	srlv $t3, $t3, $s2
	and $t3, 0xff
	beq $t3, 0x23, cantMove
	sw $t1, 4($gp)
       	sw $t2, 8($gp)
       	j canMove
	cantMove:
	li $v0, 4           	# System call code for printing a string
        la $a0, bonk     	# Load the newline string address
        syscall
	canMove:
	
	
	
	restoresvalues
	restoretvalues
	
	
	jr $ra

drawPerson:
	storetvalues
	storesvalues
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	
	lw $t0, 4($gp)
	lw $t1, 8($gp)
	lw $t2, 24($gp)
	lw $t3, 28($gp)
	
	move $a0, $t2
	move $a1, $t3
	li $a2, 0x000000
	jal setpixel
	
	move $a0, $t0
	move $a1, $t1
	li $a2, 0xffdead
	jal setpixel
	
	
	
	
	lw $ra, ($sp)
	addi $sp, $sp, 4
	restoresvalues
	restoretvalues
	
	jr $ra

bitMapMapDraw:

	storetvalues
	storesvalues
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	li $s0, 0
	li $s1, 0
	li $s2, 0
	li $s3, 0
	li $s4, 0
	
	li $a0, 0
	li $a1, 0
	li $a2, 0
	

	
	
	la $t0, map2         	 				# Load the address of the map into $t0
	li $a0, 0						#x-coordinate to print
    	li $a1, 0						#y-coordinate to print
    	li $a2, 0x5B0E68					#Set color of wall to go into setpixel
    	outerMapDrawLoop:
		lw $t1, 0($t0)					
		bne $t1, 0, maybeMapDraw
		li $a0, 0
		addi $a1, $a1, 1
		addi $t0, $t0, 4
		lw $t1, 0($t0)
		beq $t1, 0, endMapDraw
		maybeMapDraw:
		bne $t1, 0x23, dontDraw
		jal setpixel
		dontDraw:
		addi $a0, $a0, 1
		addi $t0, $t0, 4
		j outerMapDrawLoop
		
    	endMapDraw:	
		
	
	
	lw $ra, ($sp)
	addi $sp, $sp, 4
	restoresvalues
	restoretvalues
	
	
	jr $ra
	
	

	
clearScreen:
	storetvalues
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	li $a0, 0						#x-coordinate to print
	li $a1, 0						#y-coordinate to print
	li $a2, 0x000000
	clsOuterLoop:
		li $a0, 0
		clsInnerLoop:
			jal setpixel
			addi $a0, $a0, 1
			bge $a0, 64, clsNextLine
			j clsInnerLoop
		clsNextLine:
		addi $a1, $a1, 1
		bge $a1, 64, clsEndLoop
		j clsOuterLoop
		
	
	clsEndLoop:
	
	lw $ra, ($sp)
	addi $sp, $sp, 4
	
	restoretvalues
	
	
	
	jr $ra
	
	
	#a0 is x
	#a1 is y
	#a2 is color	
	
setpixel:
	storetvalues
	storesvalues
	
	lw $t0, 40($gp)
	li $t2, 64			#Set to 64 because of # of pixels in a line
	
	mul $t1, $a0, 4			
	mul $t3, $a1, 4
	
	mul $t2, $t2, $t3
	add $t2, $t2, $t1
	add $t0, $t0, $t2
	
	sw $a2, 0($t0)
	
	restoresvalues
	restoretvalues
	
	jr $ra

# Subroutine to print the map
draw:

	addi $sp, $sp, -4		#Preserves space for current function
	sw $a0, 0($sp)
	storetvalues
	storesvalues
	
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
	
	lw $t1, 4($gp)				# Load x-coordinate into t1
	lw $t2, 8($gp)				# Load y-coordinate into t2
	li $t3, 0
	li $t6, 0x51
	
	
	la $a0, map         	 			  	# Load the address of the map into $a0
    	li $v0, 4               				# System call code for printing a string
    	loop:
        	lb $a1, 0($a0) 				     	# Load a string from the map
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
        	
	sw $t1, 24($gp)
	sw $t2, 28($gp)
	
	restoresvalues
	restoretvalues
        lw $a0, 0($sp)
        addi $sp, $sp, 4		#Restores saved space
	
	jr $ra            	  	# Return from the subroutine


end:
    # End of the program
