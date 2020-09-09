#Rogelio Molina-Marquez
#rgmolina@ucsc.edu
#Due 10/29/17
#Lab 3: Decimal Converter
#CMPE12L-01G - Justin Lee
.text
main:
	move	 $s0,$a1
	lw	 $s0,($s0)
	la	 $a0, hello_msg # load the addr of hello_msg into $a0.
	li	 $v0, 4 # 4 is the print_string syscall.
	syscall 	# do the syscall.
	
	la	 $a0, input_msg # load the addr of input_msg into $a0.
	li	 $v0, 4
	syscall 	# do the syscall.
	
	la	 $a0, ($s0)	# load the addr of $s0 into $a0.
	li	 $v0, 4
	syscall		# do the syscall
	
	la	 $a0, output_msg # load the addr of output_msg into $a0.
	li	 $v0, 4
	syscall 	# do the syscall.

	lb	 $t7, ($s0)	#load the first byte into $t7.
	beq 	 $t7, 45, IsNeg	# check if the first byte is a negative sign.
	
#Iterates through string
iterate_loop:
	lb	 $t0, ($s0)			# load first byte into $t0.
	beq 	 $t0, $zero, iterate_done	# check if at the end of the string.
	addi 	 $t1, $t0, -48			# subtract 48 from ASCII to obtain an int
		#combine the digits
	mul	 $t2, $s1, 10
	add	 $s1, $t2, $t1
	addi 	 $s0, $s0, 1			#increment address of $s0
	b 	 iterate_loop
iterate_done:
	
	add	 $t4, $zero, 1			# set $t4 to be 1
	add	 $t3, $zero, 1			# set mask
	sll	 $t3, $t3, 31			# set mask
	beq 	 $t7, 45, negative		# check if the number was a negative
	
# Converts to binary
convert_loop:
	beq	 $t3, $zero, convert_done	# check that the mask is not zero
	and	 $t5, $s1, $t3			# set $t5 for the and of $s1 and mask
	bne	 $t5, $zero, print_one		# check if digit was a 1 or zero and print accordingly
	la	 $a0, ($t5)
	li	 $v0, 1
	syscall	 
	srl	 $t3, $t3, 1			# shift mask
	b	 convert_loop

negative:					# make $s1 number negative
	sub	 $s1, $zero, $s1
	j	 convert_loop

convert_done:

	# your code goes here above the exit syscall
	li	 $v0, 10 # 10 is the exit syscall.
	syscall 	# do the syscall.
	
print_one:					# print_one: prints prints a 1 if called by loop
	la	 $a0, ($t4)
	li	 $v0, 1
	syscall
	srl	 $t3, $t3, 1
	b	 convert_loop
	
IsNeg:
	addi 	 $s0, $s0, 1			#increment address of $s0
	b 	 iterate_loop
	
# Data for the program:
.data
hello_msg: .asciiz 	"\nWelcome to Decimal Converter.\n"
input_msg: .asciiz 	"Input Number: "
output_msg: .asciiz 	"\nOutput Number: "
# end hello.asm
