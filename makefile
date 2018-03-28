# Makefile

OBJS = ./mips_instructions/load/load.o ./mips_instructions/store/store.o
OPTS = -W -Wall -ansi
LOAD_FILES = ./mips_instructions/load/load.o ./mips_instructions/load/load.c
STORE_FILES = ./mips_instructions/store/store.o ./mips_instructions/store/store.c

compile_load: ./mips_instructions/load/load.c ./mips_instructions/load/load.h
	gcc -c -o $(LOAD_FILES)

compile_store: ./mips_instructions/store/store.c ./mips_instructions/store/store.h
	gcc -c -o $(STORE_FILES)

main.o: main.c ./mips_instructions/load/load.h
	gcc -o main main.c $(OBJS) $(OPTS)

clean:
	rm -rf -r *.o
