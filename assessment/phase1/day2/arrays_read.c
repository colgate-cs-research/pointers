#include <stdio.h>
void mystery(int arr[]) {
    *arr = *arr * 5;
    arr[1] = arr[1] * 10;
}

int main() {
    int nums[] = {1, 2, 3, 4};
    printf("%d %d\n", *nums, nums[1]);
    int *ptr = &nums[1];
    printf("%d %d\n", *ptr, ptr[1]);
    mystery(nums);
    printf("%d %d\n", *nums, nums[1]);
    printf("%d %d\n", *ptr, ptr[1]);
}
