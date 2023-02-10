/*
Write a function called `transfer` which takes an integer (`amount`) and two integer pointers (`from` and `to`) and moves the specified `amount` from one integer to the other.

Also write a `main` function which:
1) Stores `50` in one variable and `100` in another variable
2) Calls `transfer` with the amount `25` and pointers to the aforementioned variable
3) Prints the value stored in the variables after `transfer` returns
*/
#include <stdio.h>
void transfer(int amount, int *from, int *to) {
    *from = *from - amount;
    *to = *to + amount;
}
int main() {
    int x = 50;
    int y = 100;
    transfer(25, &x, &y);
    printf("%d %d\n", x, y);
}
