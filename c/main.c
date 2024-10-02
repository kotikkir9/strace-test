#include <stdio.h>

int main()
{
    FILE *file = fopen("/mnt/c/Users/kiril/Desktop/strace/README.md", "r");
    if (file == NULL)
    {
        perror("Could not open file");
        return 1;
    }

    char ch;
    while ((ch = fgetc(file)) != EOF)
    {
        putchar(ch);
    }

    fclose(file);
    return 0;
}