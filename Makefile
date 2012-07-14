CFLAGS = -Wall -g -c

all : strcmp strcat

strcat : strcat.o strlen.o
	${CC} strcat.o strlen.o -o strcat 

strcmp : strcmp.o strlen.o
	${CC} strcmp.o strlen.o -o strcmp

strlen.co : strlen.c
	${CC} $(CFLAGS) strlen.c -o strlen.o

strcmp.o : strcmp.c strlen.h
	${CC} $(CFLAGS) strcmp.c -o strcmp.o

strcat.o : strcat.c strlen.h
	${CC} $(CFLAGS) strcat.c -o strcat.o

clean :
	${RM} core *~ *.swp *.o strcat strcmp
