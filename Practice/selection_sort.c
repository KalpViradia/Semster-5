#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 100

void selectionSort(int arr[], int size) {
    for (int i = 0; i < size - 1; i++) {
        int minIndex = i;
        for (int j = i + 1; j < size; j++) {
            if (arr[j] < arr[minIndex]) {
                minIndex = j;
            }
        }
        if (minIndex != i) {
            int temp = arr[i];
            arr[i] = arr[minIndex];
            arr[minIndex] = temp;
        }
    }
}

void printArray(int arr[], int size) {
    for (int i = 0; i < size; i++) printf("%d ", arr[i]);
    printf("\n");
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

    if (readArrayFromFile("../Arrays/best_case_100.txt", arr, N)) {
        start = clock();
        selectionSort(arr, N);
        end = clock();
        timeTaken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        printf("Time taken to sort the best case array is %f ms\n", timeTaken);
        // printf("Sorted Array: \n");
        // printArray(arr, N);
    }
    else {
        printf("Failed to read best case file");
    }

    if (readArrayFromFile("../Arrays/worst_case_100.txt", arr, N)) {
        start = clock();
        selectionSort(arr, N);
        end = clock();
        timeTaken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        printf("Time taken to sort the worst case array is %f ms\n", timeTaken);
        // printf("Sorted Array: \n");
        // printArray(arr, N);
    }
    else {
        printf("Failed to read worst case file");
    }

    if (readArrayFromFile("../Arrays/average_case_100.txt", arr, N)) {
        start = clock();
        selectionSort(arr, N);
        end = clock();
        timeTaken = ((double)(end - start)) / CLOCKS_PER_SEC * 1000;
        printf("Time taken to sort the average case array is %f ms\n", timeTaken);
        // printf("Sorted Array: \n");
        // printArray(arr, N);
    }
    else {
        printf("Failed to read average case file");
    }
}