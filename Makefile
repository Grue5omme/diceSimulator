midterm: Main.o rollDie.o modulo.o incArray.o initArray.o printPiles.o
	gcc -o midterm Main.o rollDie.o modulo.o incArray.o initArray.o printPiles.o

Main.o: Main.s
	gcc -g -c Main.s

rollDie.o: rollDie.s
	gcc -g -c rollDie.s

modulo.o: modulo.s
	gcc -g -c modulo.s

incArray.o: incArray.s
	gcc -g -c incArray.s

initArray.o: initArray.s
	gcc -g -c initArray.s

printPiles.o: printPiles.s
	gcc -g -c printPiles.s

clean:
	rm *.o
