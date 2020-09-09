Rogelio Molina-Marquez, rgmolina@ucsc.edu
Due 11/01/17
Lab 3: Decimal Converter
CMPE12L-01G - Justin Lee

Title: Decimal Converter

Purpose:
Use assembly and MARS simulator to take an input string, convert it into an
integer, and then print out the number in binary

Procedure:
To build a running summer I implemented four parts which work together. 

Part 1 was outputting an welcome message along with the number entered by
the user.

Part 2 is taking the input string and converting it into an integer after
checking whether the input is positive or negatice. To convert this
I iterated through the string and subtracted 48 from the ascii value of each
character. I then combined the integers for from each character into the single
integer.

Part 3 was using a bitmask to print the binary number representation of the
integer. To do this i used a loop and shefted the bitmask to print each number.

Part 4 was using 2s complement to print the binary representation of a negative
number.

Discuss the algorithm(s) you designed. Were there any issues in implementing them?
I designed an algorithm which converts the number entered as a string into an
integer. It does this by taking each character and subtracting 48 from the ascii
value. I then multiply by the correct power of 10 in order to combine the charecters
into a single integer. I also have an algorithm which through the use of a mask
prints the integer as a binary number.

Discuss any assembly language techniques you developed or discovered.
I discovered how to make for loops, while loops, and if statements in assembly.
These were very helpful in the lab when iterating through the string and printing
each digit for the binary number.

Several pseudo-ops were needed to complete this lab. Compare the code written with the
assembled code and look at what the assembler did. How many more lines of assembly were
written? 
The assmebler wrote six additional lines of assembly. It split some lines of code into
two lines.

Conclusion:
After building the 4 parts seperately and getting them to work individually I was
able to combine them in order to build a running summer. The only issue I had was
trying to keep the 6-bit full adder organized. It became difficult to make out
what was wired to what. To debug I added LEDs to the adder but later removed them.
To debug I also added 7-segment LEDs displaying the ouput of the adder and the 
keypad in addition to the required diplays for the register. 
From testing I noticed that subtracting a larger number from a smaller number
does not give a result that makes sense. Also, if the two added numbers are
larger than 6-bits the ouput will also not be correct since anything past 6-bits
is ignored. The summer, in the end, worked according to specifications and used
sequential and combinational logic to sum or subtract a sequence of numbers.
