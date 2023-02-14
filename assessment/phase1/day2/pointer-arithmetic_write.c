/*
Write a function called `sum` which takes an array of integers and a length and returns the sum of the numbers. The function **must** use a pointer to iterate over the array.
*/
#include <stdio.h>
int sum(int *nums, int len) {
    int *curr = nums;
    int total = 0;
    for (int i = 0; i < len; i++) {
        total += *curr;
        curr++;
    }
    return total;
}
int main() {
    int nums[] = {1, 2, 4, 8};
    printf("%d\n", sum(nums, 4));
}
