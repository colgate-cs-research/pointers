#include <stdio.h>
void swap1(char *c, char *d) {
    char *tmp = c;
    c = d;
    d = tmp;
}
void swap2(char *a, char *b) {
    char tmp = *a;
    *a = *b;
    *b = tmp;
}
int main() {
    char q = 'Q';
    char r = 'R';
    swap1(&q, &r);
    printf("%c %c\n", q, r);
    char s = 'S';
    char t = 'T';
    swap2(&s, &t);
    printf("%c %c\n", s, t);
}
