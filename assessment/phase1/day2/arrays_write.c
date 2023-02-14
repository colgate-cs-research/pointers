/*
Write a function called `underscore` which takes an array of characters and replaces all spaces (`' '`) with underscores (`'_'`). Also write a `main` function which:
    1. Stores the string `"This has spaces"` in an array of characters
    2. Calls the `underscore` function on the array
    3. Prints the string after `underscore` returns
*/
#include <stdio.h>
#include <string.h>
void underscore(char *str) {
    for (int i = 0; i < strlen(str); i++) {
        if (str[i] == ' ') {
            str[i] = '_';
        }
    }
}
int main() {
    char phrase[] = "This has spaces";
    underscore(phrase);
    printf("%s\n", phrase);
}
