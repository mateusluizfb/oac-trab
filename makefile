# Makefile

OBJS = ./mips_instructions/load/load.o ./mips_instructions/store/store.o
OPTS = -W -Wall -lm
LOAD_FILES = ./mips_instructions/load/load.o ./mips_instructions/load/load.c
STORE_FILES = ./mips_instructions/store/store.o ./mips_instructions/store/store.c

all: compile_load compile_store compile_main clean

go: compile_load compile_store compile_main clean
	./main

compile_load: ./mips_instructions/load/load.c ./mips_instructions/load/load.h
	gcc -c -o $(LOAD_FILES)

compile_store: ./mips_instructions/store/store.c ./mips_instructions/store/store.h
	gcc -c -o $(STORE_FILES)

compile_main: main.c ./mips_instructions/load/load.h
	gcc -o main main.c $(OBJS) $(OPTS)

clean:
	find . -name '*.o' -delete
