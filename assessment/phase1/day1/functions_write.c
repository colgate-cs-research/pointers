/*
Write a function called `add` which takes an integer (`num`) and an integer pointer (`ptr`) and adds `num` to the value `ptr` points to. 

Also write a `main` function which:
1) Stores `20` in a variable
2) Calls `add` with the number `5` and a pointer to the aforementioned variable
3) Prints the value stored in the variable after `add` returns
*/
#include <stdio.h>
void add(int num, int *ptr) {
    *ptr = *ptr + num;
}
int main() {
    int x = 20;
    add(5, &x);
    printf("%d\n", x);
}
