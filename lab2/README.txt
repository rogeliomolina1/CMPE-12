Rogelio Molina-Marquez, rgmolina@ucsc.edu
Due 10/22/17
Lab 2: Adding and Subtracting
CMPE12L-01G - Justin Lee

Title: Adding and Subtracting

Purpose:
Use sequential and combinational logic to sum or subtract a sequence of numbers
together.

Procedure:
To build a running summer I implemented four parts which work together. 

Part 1 was the input/output page. Here a keypad lets the user select one
hexadecimal digit, and outputs the corresponding 4-bit binary number.
The "Store" and "Reset" buttons were momentary buttons to store numbers
in the register and to clear the register. There is also a switch that
selects addition and subtraction.
THe output on this page consists of the 7-segment LEDS showing the contents
of the register, adder, and the selected number on the keypad.

Part 2 is the register. This is what stores the running sum and sends the ouput
to be diplayed in part 1. The register uses 6 flip flops for storage. The "Reset"
button clears the flip flops and the "Store" button stores data in the flip flops.

Part 3 is a 6-bit full adder. The adder has 13 inputs, one for each of the 6
bits of the 2 summands. It also has one ones-place carry bit.

Part 4 is where we invert and add one in order to be able to subtract. Here I use
a "MUX" component to select between the original bit and its inverse.

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