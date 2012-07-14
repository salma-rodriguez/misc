#include <stdio.h>
#include <stdlib.h>
#include "strlen.h"

int mystrcmp(char *first, char *second);

int main(int argc, char **argv) {
    char *first = argv[1];
    char *second = argv[2];
    int eq = mystrcmp(first, second);
    if (eq)
        printf("Strings are equal.\n");
    else
        printf("Strings are not equal.\n");
    return 0;
}

int mystrcmp(char *first, char *second)
{
    int i;
    int len1 = mystrlen(first);
    for (i = 0; i < len1; i++)
        if (first[i] != second[i])
            return 0;
    return 1;
}
