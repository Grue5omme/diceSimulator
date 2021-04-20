# diceSimulator
Master File for the `diceSimulator` Assembly Language program. This program simulates rolling two six-sided dice. It then keeps track of how many of each number (2-12) are rolled, and after 1000 iterations it prints the empirical distribution.

This program was written first as practice for, and then modified for submission as, the midterm for for *CSCI 212: Machine Org/Assembly Language*.

`diceSimulator` Files:
- `Main.s`: Initializes the array and houses loops that calls several subfunctions (described below)
- `incArray.s`: Increments the necessary array index based on the number passed to it
- `initArray.s`: Sets the value of each index of the array to 0.
- `modulo.s`: Performs a modulo of two arguments passed to it and returns the result.
- `printTable.s`: Prints a table showing the empirical distribution of the dice rolls.
- `rollDie.s`: Generates a random number between 1 and 6 and returns it.
