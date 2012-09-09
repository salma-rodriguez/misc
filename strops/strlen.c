int mystrlen(char *str)
{
    int count;
    count = 0;
    while (str[++count] != '\0')
        ;
    return count;
}
