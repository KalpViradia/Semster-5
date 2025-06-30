#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 100

int binarySearch(int arr[], int size, int target) {
    int left = 0;
    int right = size - 1;

    while (right >= left) {
        int middle = (left + right) / 2;

        if (arr[middle] == target) return middle;
        else if (arr[middle] < target) left = middle;
        else right = middle;
    }

    return -1;
}

int readArrayFromFile(const char *fileName, int arr[], int n) {
    FILE *f = fopen(fileName, "r");

    if (!f) {
        printf("Cannot open file %s\n", fileName);
        return 0;
    }

    for (int i = 0; i < n; i++) fscanf(f, "%d", &arr[i]);

    fclose(f);

    return 1;
}

void main() {
    int arr[N];
    clock_t start, end;
    double timeTaken;
    int target;

    printf("Enter a number to search:");
    scanf("%d", &target);

    if (readArrayFromFile("../Arrays/best_case_100.txt", arr, N)) {
        start = clock();
        int result = binarySearch(arr, N, target);
        end = clock();
        timeTaken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        
        if (result == -1)
            printf("Element not found.");
        else
            printf("Element found at index %d\n", result);
            printf("Time taken to search %d in the best case array is %f ms\n", target, timeTaken);
    }
    else {
        printf("Failed to read best case file");
    }
}