#include <stdio.h>
#include <stdlib.h>
#include "strlen.h"

char* mystrcat(char *, char *);

int main(int argc, char **argv)  {
    char *first = argv[1];
    char *second = argv[2];
    char *tmp = mystrcat(first, second);
    printf("%s\n", tmp);
    return 0;
}

char* mystrcat(char *first, char* second)
{
    int i, j;
    int len1 = mystrlen(first);
    int len2 = mystrlen(second);
    char *tmp = malloc(len1 + len2 + 1);
    for (i = 0; i < len1; i++)
        tmp[i] = first[i];
    for (j = 0; i < len1 + len2; i++)
        tmp[i] = second[j++];
    tmp[++i] = '\0';
    return tmp;
}
