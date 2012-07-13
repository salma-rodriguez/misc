CFLAGS = -Wall -g -c

all : strcmp strcat

strcat : strcat.o strlen.o
	cc strcat.o strlen.o -o strcat 

strcmp : strcmp.o strlen.o
	cc strcmp.o strlen.o -o strcmp

strlen.o : strlen.c
	cc $(CFLAGS) strlen.c -o strlen.o

strcmp.o : strcmp.c strlen.h
	cc $(CFLAGS) strcmp.c -o strcmp.o

strcat.o : strcat.c strlen.h
	cc $(CFLAGS) strcat.c -o strcat.o

clean :
	${RM} core *~ *.swp *.o strcat strcmp
