/*
Write a program which:
1) Stores 5 in a variable, and stores 10 in another variable
2) Creates and uses pointers to print each number
3) Uses the pointers to add the numbers together and store the result in a new variable
4) Repurposes one of the existing pointers to print the aforementioned result 
*/

#include <stdio.h>
int main() {
    int i = 5;
    int j = 10;
    int *p = &i;
    int *q = &j;
    int k = *p + *q;
    p = &k;
    printf("%d\n", *p);
}
