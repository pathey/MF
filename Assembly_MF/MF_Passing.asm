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
			
			
#Map 1 was originally how I planned to implement my 2D array, I've left it in as a visualization tool/to show the path I took
			
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
x_coord:		.asciiz "x: "
y_coord:		.asciiz "y: "
totalFruits:		.asciiz "Total fruit picked up: "
blueberries:		.asciiz "Blueberries picked up: "
apples:			.asciiz "Apples picked up: "
oranges:		.asciiz "Oranges picked up: "
bananas:		.asciiz "Bananas picked up: "
dragonfruit:		.asciiz "Dragonfruits picked up: "


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

.macro jumpStore
	addi $sp, $sp, -4
	sw $ra, ($sp)
.end_macro

.macro jumpRestore
	lw $ra, ($sp)
	addi $sp, $sp, 4
.end_macro

.macro newLine
	li $v0, 4           			# System call code for printing a string
        la $a0, newline     			# Load the newline string address
        syscall
.end_macro


#gp +4 is the x-coordinate
#gp +8 is the y coordinate
#gp +12 is the pickup #1 type
#gp +16 is the pickup availability (on cooldown or not)
#gp +20 is the width of a row
#gp +24 is the previous x coordinate
#gp +28 is the previous y coordinate
#gp +32 is the previous pickup type
#gp +36 is the previous availability
#gp +40 is the base address for the bitmap display
#gp +44 is total fruits picked up
#gp +48 is blueberries picked up
#gp +52 is apples picked up
#gp +56 is oranges picked up
#gp +60 is bananas picked up
#gp +64 is dragonfruits picked up
#gp +68 is pickup #2 type
#gp +72 is pickup #3 type
#gp +76 is pickup #4 type





main:
	
	li $t0, 9
	sw $t0, 4($gp)				#Loads and stores x coordinate to position and previous position
	sw $t0, 24($gp)
	li $t1, 1
	sw $t1, 8($gp)				#Loads and stores y coordinate to position and previous position
	sw $t1, 28($gp)
	li $t2, 1
	sw $t2, 12($gp)				#Loads and stores pick up info to current and previous
	sw $t2, 32($gp)
	li $t3, 0
	sw $t3, 16($gp)
	sw $t3, 36($gp)
	sw $t3, 44($gp)
	sw $t3, 48($gp)
	sw $t3, 52($gp)
	sw $t3, 56($gp)
	sw $t3, 60($gp)
	sw $t3, 64($gp)
	sw $t3, 68($gp)
	sw $t3, 72($gp)
	sw $t3, 76($gp)
	li $t4, 21
	sw $t4, 20($gp)				#Loads and stores row width
	li $t5, 0x10040000
	sw $t5, 40($gp)				#Loads and stores bitmap base address
	
	
	
	
	#la $a0, map2            		# Load the address of the map into $a0
	
	#mul $s0, $t4, $t1			# Multiply current y position by length of a row for y offset from base memory address		
	#add $s0, $s0, $t0			# Add x offset to base memory address
	
	#add $s1, $a0, $s0			# Add total offset to base memory address
	#move $s2, $s1				#Move calculated memory address into s2
	
	#lw $t6, ($s2)
	
	#j end
	
	
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
	
	jal infoDraw
	
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
    	
    	jal infoDraw				# Jump to infoDraw
    	
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
	
	lw $t7, 20($gp)
	
	
	
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
	
	la $a0, map2            		# Load the address of the map into $a0
	
	mul $s0, $t7, $t2			# Multiply current y position by length of a row for y offset from base memory address
	add $s0, $s0, $t1			# Add x offset to base memory address
	mul $s0, $s0, 4
	add $s1, $a0, $s0			# Add total offset to base memory address
	
	
	
	lw $s2, 0($s1)
	
	#move $s2, $s1				#Move calculated memory address into s2
	
	#li $s3, 4
	#div $s1, $s3
	
	#mfhi $s4
	#mflo $s5
	
	#mul $s5, $s5, 4
	
	#lw $s2, 0($s5)
	#mul $s4, $s4, 8
	#srlv $s2, $s2, $s4
	#and $s2, 0xff
	
	#lw $s2, ($s1)
	
	
	beq $s2, 0x23, cantMove
	sw $t1, 4($gp)
	sw $t2, 8($gp)
	sw $t5, 24($gp)
	sw $t6, 28($gp)
	j canMove
	cantMove:
	li $v0, 4           			# System call code for printing a string
        la $a0, bonk     			# Load the bonk string address
        syscall
	canMove:
	
	
    	#li $v0, 4               		# System call code for printing a string
       	#mul $t3, $t2, $t6
       	#add $a0, $a0, $t3
       	#add $a0, $a0, $t1

       	#li $s1, 4				#divisor
			
	#div $a0, $s1				#Perform Division
	#mfhi $s2				#Fetch remainder and store in $s2
		
	#mflo $t0
		
	#mul $t0, $t0, 4
		
	#lw $t3, 0($t0)
	#mul $s2, $s2, 8
	#srlv $t3, $t3, $s2
	#and $t3, 0xff
	#beq $t3, 0x23, cantMove
	#sw $t1, 4($gp)
       	#sw $t2, 8($gp)
       	#j canMove
	#cantMove:
	#li $v0, 4           	# System call code for printing a string
        #la $a0, bonk     	# Load the newline string address
        #syscall
	#canMove:
	
	
	
	restoresvalues
	restoretvalues
	
	
	jr $ra

drawPerson:
	storetvalues
	storesvalues
	jumpStore
	
	
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
	
	
	
	
	jumpRestore
	restoresvalues
	restoretvalues
	
	jr $ra

bitMapMapDraw:

	storetvalues
	storesvalues
	jumpStore
	
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
		
	
	
	jumpRestore
	restoresvalues
	restoretvalues
	
	
	jr $ra

infoDraw:
	storetvalues
	storesvalues
	jumpStore
	
	newLine
        
        la $a0, x_coord
        syscall
        li $v0, 1
        lw $a0, 4($gp)
        syscall				#Print "x: [Player x-coordinate]"
        
        newLine
        
        la $a0, y_coord
        syscall
        li $v0, 1
        lw $a0, 8($gp)
        syscall				#Print "y: [Player y-coordinate]"
        
        newLine
        
        la $a0, totalFruits
        syscall
        li $v0, 1
        lw $a0, 44($gp)
        syscall
        
        newLine
	
	jumpRestore
	restoresvalues
	restoretvalues
	
	jr $ra
	
	
	
	
	
clearScreen:
	storetvalues
	jumpStore
	
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
	
	jumpRestore
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



end:
    # End of the program
