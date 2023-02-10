#include <stdio.h>
int main() {
    int a = 1;
    int b = 2;
    int *x = &a;
    int *y = &b;
    printf("%d %d %d %d\n", a, b, *x, *y);
    a = 5;
    *y = 7;
    printf("%d %d %d %d\n", a, b, *x, *y);
    *x = *x + 4;
    b = b + 3;
    printf("%d %d %d %d\n", a, b, *x, *y);
    x = y;
    printf("%d %d %d %d\n", a, b, *x, *y);
}
