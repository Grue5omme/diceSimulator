@ initArray.s
@ This function sets the initial array values to 0

.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global initArray
.syntax unified
.type initArray, %function

initArray:
	push	{fp, lr}		@ Pushes fp and lr onto the stack
   	add 	fp, sp, #4		@ Adds 4 to sp and stores it in fp

