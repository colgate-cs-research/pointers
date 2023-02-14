#include <stdio.h>
int main() {
    char phrase[] = "the cat sits";
    char *mysteryA = phrase + 4;
    char *mysteryB = mysteryA + 4;
    printf("%c%c\n", *mysteryA, *mysteryB);
    *(mysteryA + 2) = 'p';
    *mysteryB = 'f';
    printf("%s\n", phrase);
    mysteryA--;
    mysteryB += 2;
    *mysteryB = 'n';
    printf("red%s\n", mysteryA);
}
