/*
Write a program which:
1) Stores the character 'A' in a variable
2) Creates and uses a pointer to print the character
3) Uses the same pointer to change the character to 'B'
4) Uses the same pointer to advance the character by 3 (to 'E')
5) Creates and uses a second pointer to print the character
*/

#include <stdio.h>
int main() {
    char ch = 'A';
    char *ptr = &ch;
    printf("%c\n", *ptr);
    *ptr = 'B';
    *ptr = *ptr + 3;
    char *ptr2 = ptr;
    printf("%c\n", *ptr2);
}
