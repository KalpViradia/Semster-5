#include<stdio.h>

int factorial(int n) {
    int result = 1;
    int i;

    if (n == 0 || n == 1) {
        return result;
    }

    for (i = 0; i < n; i++) {
        result *= i;
    }

    return result;
}

int main() {
    int num;
    printf("Enter a number: ");
    scanf("%d", &num);
    
    if (num < 0) {
        printf("Factorial is not defined for negative numbers.\n");
    } else {
        int fact = factorial(num);
        printf("Factorial of %d is %d\n", num, fact);
    }
    
    return 0;
}
