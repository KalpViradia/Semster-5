#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 100

int linearSearch(int arr[], int size, int target) {
    for (int i = 0; i < size; i++) {
        if (arr[i] == target) return i;
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

    printf("Enter an element to search:");
    scanf("%d", &target);

    if (readArrayFromFile("../Arrays/best_case_100.txt", arr, N)) {
        start = clock();
        int result = linearSearch(arr, N, target);
        end = clock();
        timeTaken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        
        if (result == -1)
            printf("Element not found.\n");
        else {
            printf("Element found at index %d\n", result);
            printf("Time taken to search %d in the best case array is %f ms\n", target, timeTaken);
        }
    }
    else {
        printf("Failed to read best case file");
    }

    if (readArrayFromFile("../Arrays/worst_case_100.txt", arr, N)) {
        start = clock();
        int result = linearSearch(arr, N, target);
        end = clock();
        timeTaken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        
        if (result == -1)
            printf("Element not found.\n");
        else {
            printf("Element found at index %d\n", result);
            printf("Time taken to search %d in the worst case array is %f ms\n", target, timeTaken);
        }
    }
    else {
        printf("Failed to read worst case file");
    }

    if (readArrayFromFile("../Arrays/average_case_100.txt", arr, N)) {
        start = clock();
        int result = linearSearch(arr, N, target);
        end = clock();
        timeTaken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        
        if (result == -1)
            printf("Element not found.\n");
        else {
            printf("Element found at index %d\n", result);
            printf("Time taken to search %d in the average case array is %f ms\n", target, timeTaken);
        }
    }
    else {
        printf("Failed to read average case file");
    }
}