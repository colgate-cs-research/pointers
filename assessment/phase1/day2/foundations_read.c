#include <stdio.h>
int main() {
    char s = 'S';
    char *t = &s;
    int u = 3;
    int *v = &u;
    int *w = v;
    printf("%c %c %d %d %d\n", s, *t, u, *v, *w);
    *t = 'B';
    u = 2;
    printf("%c %c %d %d %d\n", s, *t, u, *v, *w);
    s = s + *v;
    printf("%c %c %d %d %d\n", s, *t, u, *v, *w);
}
