#include <stdio.h>
void copy1(int a, int b) {
    a = b;
}
void copy2(int *c, int *d) {
    c = d;
}
void copy3(int *e, int *f) {
    *e = *f;
}
int main() {
    int q = 1;
    int r = 2;
    copy1(q, r);
    printf("%d %d\n", q, r);
    int s = 3;
    int t = 4;
    copy2(&s, &t);
    printf("%d %d\n", s, t);
    int u = 5;
    int v = 6;
    copy3(&u, &v);
    printf("%d %d\n", u, v);
}
