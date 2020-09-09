.text

main:
#load arguments
	lw	$s0,($a1)
	lw	$s1,4($a1)
#display input message	
	la	$a0, key_msg
	li	$v0, 4
	syscall
#display entered key
	la	$a0, ($s0)
	li	$v0, 4
	syscall

#display given text message
	la	$a0, givenText_msg
	li	$v0, 4
	syscall
#display enterd string to decrypt
	la	$a0, ($s1)
	li	$v0, 4
	syscall

	jal	encode	#call encode funtion

#display encrypted text message
	la	$a0, encrypted_msg
	li	$v0, 4
	syscall	

#add null character to end of the string	
	add	$t1, $zero, $zero
	sb	$t1, encrypted_array($s3)
	add	$t0, $zero, $zero
	add	$t2, $zero, $zero
	
#print new encrypted string
loop_array:
	lb	$t0, encrypted_array($t2)
	beqz 	$t0, decrypt
	move	$a0, $t0
	li	$v0, 11
	syscall
	addi	$t2, $t2, 1
	b	loop_array

decrypt:

#display decrypted message
	la	$a0, decrypted_msg
	li	$v0, 4
	syscall

	jal	decode	#call decode function
	
#add null character at the end of decrypted string
	add	$t1, $zero, $zero
	sb	$t1, decrypted_array($s3)
	add	$t0, $zero, $zero
	add	$t2, $zero, $zero
	
#print decrypted string
decode_array:
	lb	$t0, decrypted_array($t2)
	beqz 	$t0, end_program
	move	$a0, $t0
	li	$v0, 11
	syscall
	addi	$t2, $t2, 1
	b	decode_array
	
end_program:
#End the program
	li	$v0, 10 # 10 is the exit syscall.
	syscall
	
	
##################Encode Function#########################
encode:
	move	$t0, $s0	#move key to $t0
	move	$t1, $s1	#move string to $t0
	add	$t2, $zero, $zero#length of key counter
	add	$t3, $zero, $zero#length of string counter
	
key_length:
	lb	$t4, ($t0)		# load first byte into $t4.
	beq 	$t4, $zero, text_length	# check if at the end of the string.
	addi 	$t0, $t0, 1		#increment address of $t0
	addi	$t2, $t2, 1		#increment length of key counter
	b	key_length
	
text_length:
	lb	$t4, ($t1)		# load first byte into $t4.
	beq 	$t4, $zero, next	# check if at the end of the string.
	addi 	$t1, $t1, 1		#increment address of $t1	
	addi	$t3, $t3, 1		#increment length of string counter
	b	text_length
	
next:	
	move	$s2, $t2	#save key length
	move	$s3, $t3	#save text length
#####################set registers back to zero###################
	add	$t1, $zero, $zero
	add	$t2, $zero, $zero	
	add	$t3, $zero, $zero	
	add	$t4, $zero, $zero	
	add	$t5, $zero, $zero	
	add	$t6, $zero, $zero	
	add	$t7, $zero, $zero	
	move	$t7, $s1	#move string to $t7
encrypt_loop:
	rem	$t4, $t3, $s2		#t4=i%lengh of key
	addu	$t0, $s0, $t4		#t0=address key[i%lk]
	lb	$t2, ($t0)		#t2=load key[i%lk]
	lb	$t5, ($t7)		#t5=load string[i]
	beqz	$t5, done
	addu	$t6, $t5, $t2
	rem	$t1, $t6, 128		#t1=(text[i]+key[i%lk])%128
	add	$t7, $t7, 1
	sb	$t1, encrypted_array($t3)	#store in array
	add	$t3, $t3, 1
	
	
	b	encrypt_loop
	
#########################Decode Function######################

decode:
#####################set registers back to zero###################
	add	$t0, $zero, $zero
	add	$t1, $zero, $zero
	add	$t2, $zero, $zero	
	add	$t3, $zero, $zero	
	add	$t4, $zero, $zero	
	add	$t5, $zero, $zero	
	add	$t6, $zero, $zero	
	add	$t7, $zero, 128		#set $t7 to 128
decrypt_loop:
	rem	$t4, $t3, $s2		#t4=i%lengh of key
	addu	$t0, $s0, $t4		#t0=address key[i%lk]
	lb	$t2, ($t0)		#t2=load key[i%lk]
	lb	$t5, encrypted_array($t3)		#load character from the encrypted array into $t5
	beqz	$t5, done
	subu	$t6, $t5, $t2
	divu	$t6, $t7		#t1=(text[i]-key[i%lk])%128
	mfhi	$t1
	sb	$t1, decrypted_array($t3)#store in decrypted array
	add	$t3, $t3, 1
	b	decrypt_loop
	
##########################################################################################
	
done:
	jr	$ra	#return
	
	
	

# Data for the program:
.data
key_msg:	.asciiz 	"\n\nThe given key is: "
givenText_msg: 	.asciiz 	"\nThe given text is: "
encrypted_msg: 	.asciiz 	"\nThe encrypted text is: "
decrypted_msg: 	.asciiz 	"\nThe decrypted text is: "
newline: 	.asciiz 	"\n"
encrypted_array:	.space	100
decrypted_array:	.space	100
