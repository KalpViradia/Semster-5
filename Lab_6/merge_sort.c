#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 100

void merge(int arr[], int left, int mid, int right) {
    int n1 = mid - left + 1;
    int n2 = right - mid;

    int *L = (int *)malloc(n1 * sizeof(int));
    int *R = (int *)malloc(n2 * sizeof(int));

    for (int i = 0; i < n1; i++)
        L[i] = arr[left + i];
    for (int j = 0; j < n2; j++)
        R[j] = arr[mid + 1 + j];

    int i = 0, j = 0, k = left;

    while (i < n1 && j < n2) {
        if (L[i] <= R[j])
            arr[k++] = L[i++];
        else
            arr[k++] = R[j++];
    }

    while (i < n1) arr[k++] = L[i++];
    while (j < n2) arr[k++] = R[j++];

    free(L);
    free(R);
}

void mergeSortHelper(int arr[], int left, int right) {
    if (left < right) {
        int mid = left + (right - left) / 2;

        mergeSortHelper(arr, left, mid);
        mergeSortHelper(arr, mid + 1, right);

        merge(arr, left, mid, right);
    }
}

void mergeSort(int arr[], int size) {
    mergeSortHelper(arr, 0, size - 1);
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
        mergeSort(arr, N);
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
        mergeSort(arr, N);
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
        mergeSort(arr, N);
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