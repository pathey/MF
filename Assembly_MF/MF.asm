#Author:	Peter Athey
#Description: 	MF - MazeFighter: A rudimentary 3D rendering program

.data
player:		.asciiz "0"		#This is the player symbol on the overhead map
newline:	.asciiz  "\n"
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


.text 				#Code starts here

main:
    la $a0, map            # Load the address of the map into $a0
    jal printMap           # Jump to the printMap subroutine
    j end                   # Jump to the end of the program

# Subroutine to print the map
printMap:
    li $v0, 4               # System call code for printing a string
    loop:
        lb $a1, 0($a0)      # Load a character from the map
        beqz $a1, endPrint   # If the character is null, end the loop
        syscall             # Print the character
        addi $a0, $a0, 22    # Move to the next character in the map
        j loop              # Repeat the loop
    endPrint:
        li $v0, 4           # System call code for printing a string
        la $a0, newline     # Load the newline string address
        syscall             # Print a newline
        jr $ra              # Return from the subroutine

end:
    # End of the program
