.text
main:
	la	 $a0, hello_msg # load the addr of hello_msg into $a0.
	li	 $v0, 4 # 4 is the print_string syscall.
	syscall 	# do the syscall.
	
	la	 $a0, prompt_msg # load the addr of prompt_msg into $a0.
	li	 $v0, 4
	syscall 
	
	li	 $v0, 5		# Get user input integer
	syscall
	move	 $s0, $v0
	
	ble	 $s0, 2, error
	
	la	 $a0, input_msg # load the addr of input_msg into $a0.
	li	 $v0, 4
	syscall
	
	la	 $a0, ($s0)	
	li	 $v0, 1		# 1 is the print_int syscall.
	syscall		
	
	la	 $a0, output_msg # load the addr of output_msg into $a0.
	li	 $v0, 4
	syscall
	
	addi 	 $t0, $zero, 1	# set counter for outer_loop to 1 in $t0
	addi	 $t5, $zero, 2	# set $t5 to 2 to divide in inner loop
	addi	 $t3, $s0, 1	# set $t3 to be $s0+1
	
	
outer_loop:
	addi 	 $t0, $t0, 1	# increment $t0
	addi 	 $t1, $zero, 1	# set counter for inner_loop to 1 in $t1
	beq	 $t0, $t3, done	# if $t0==$s0+1 end program
inner_loop:
	addi 	 $t1, $t1, 1	# increment $t1
	div	 $t0, $t5	# divide $t0 by 2
	mflo	 $t4		# set $t4 to $t0/2
	bge	 $t1, $t4, print# if $t1>=$t0/2 print
	div 	 $t0, $t1	# $t0%$t1
	mfhi	 $t2		# store $t0 mod $t1
	beqz	 $t2, outer_loop# if $t2==0 exit to outer_loop
	b	 inner_loop

print:
	mfhi	 $t2		# check if divisible
	beqz	 $t2, outer_loop#exit if divisible
	la	 $a0, space	# load the addr of space into $a0.
	li	 $v0, 4		# 1 is the print_int syscall.
	syscall	
	la	 $a0, ($t0)	
	li	 $v0, 1		# 1 is the print_int syscall.
	syscall	
	b	 outer_loop

error:
	la	 $a0, error_msg # load the addr of error_msg into $a0.
	li	 $v0, 4
	syscall

done:
	# your code goes here above the exit syscall
	li	 $v0, 10 # 10 is the exit syscall.
	syscall
	
# Data for the program:
.data
hello_msg: 	.asciiz 	"\nWelcome to Prime Finder.\n"
prompt_msg: 	.asciiz 	"Please enter a number greater than 2: "
input_msg: 	.asciiz 	"Input Number: "
output_msg:	.asciiz 	"\nPrime Numbers:\n2"
error_msg:	.asciiz 	"The number entered was less than 3"
space: 		.asciiz 	", "
