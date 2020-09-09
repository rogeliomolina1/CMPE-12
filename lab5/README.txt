Rogelio Molina-Marquez, rgmolina@ucsc.edu
Due 11/26/17
Lab 5: Vignere cipher
CMPE12L-01G - Justin Lee

Title: Vignere cipher

Purpose:
Use assembly and MARS simulator to take an input string, encrypt it using a 
provided key then take that encrypted string and decrypt it using the key.

Procedure:
-Use the program arguments to determine both the key and the clear text. The
 key will be the first string while the second will be the clear text. 
-Print out the given clear text and the key. 
-Encode using the encode function and print out the encoded version. 
-Decode using the decode function and print out the decoded version. They 
 should match and you may not print out the input text again. 

Lab Questions:
Discuss the encode/decode algorithms. What similarities are there between them? 

The encode and decode algorithms were almost identical the only difference
between them was that in encode the ascii value of the key is added to the
ascii of the string while in decoded the ascii value of the key is
subtracted.

Discuss the functions you made and what you were required to save. 

Before calling any function I saved the string to be encrypted and the key. Then
when I called the encode and decode funcitons I moved these strings into a 
temporary register in order to manipulate them without affecting the original.
I also saved the length of the key and string to be encrypted, which was found
in the encode function, for use in the encryption and decryption algorithms.
In the encode and decode funtions I used the length of the key to keep the
current key character index within the length of the key string.

Conclusion:
After building the encode and decode funtions individually I was able to call them
in order to encrypt a given string, print the new string, then decrypt that string
back to the original string. I only ran into issues when I was attempting to
decode, but the problem was easily fixed by making the operations unsigned.
In the end the program worked according to specifications and with a little
more time could likely be made significantly shorter.
