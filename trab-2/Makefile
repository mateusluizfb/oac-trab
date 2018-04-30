CC = gcc
LIB = lib
DEP = functions.o declarations.o
FLAGS = -w

go: functions
		$(CC) $(FLAGS) ./main.c -o mips_simulator $(DEP)

functions: declarations
		$(CC) $(FLAGS) -c $(LIB)/functions.c

declarations:
		$(CC) $(FLAGS) -c $(LIB)/declarations.c
