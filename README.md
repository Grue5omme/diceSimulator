# diceSimulator
Master File for the `diceSimulator` Assembly Language program. In terms of its probability distribution, this program does not actually simulate rolling two six-sided dice. It merely generates a number between 2 and 12.

This program was written as practice for *CSCI 212 Machine Org/Assembly Language*.

`diceSimulator` Files:
- `Main.s`: Initializes the array and houses loops that calls several subfunctions (described below)
- `incArray.s`: Increments the necessary array index
- `modulo.s`: Performs a modulo of two arguments passed to it and returns the result
- `randomNumber.s`: Generates a random number and returns it
- `printHist.s`: Prints a horizontal histogram of the empirical distribution
