#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 100

int pivot(int arr[], int low, int high)
{
    int p = arr[low];
    int k = low + 1;
    int l = high;

    while (k <= l)
    {
        while (k <= high && arr[k] <= p)
            k++;
        while (l >= low && arr[l] > p)
            l--;

        if (k < l)
        {
            int temp = arr[k];
            arr[k] = arr[l];
            arr[l] = temp;
        }
    }

    int temp = arr[low];
    arr[low] = arr[l];
    arr[l] = temp;

    return l;
}

void quickSort(int arr[], int low, int high)
{
    if (low < high)
    {
        int p = pivot(arr, low, high);
        quickSort(arr, low, p - 1);
        quickSort(arr, p + 1, high);
    }
}

void printArray(int arr[], int size)
{
    for (int i = 0; i < size; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

int readArrayFromFile(const char *fileName, int arr[], int n)
{
    FILE *f = fopen(fileName, "r");

    if (!f)
    {
        printf("Cannot open file %s\n", fileName);
        return 0;
    }

    for (int i = 0; i < n; i++)
        fscanf(f, "%d", &arr[i]);

    fclose(f);

    return 1;
}

void main()
{
    int arr[N];
    clock_t low, high;
    double timeTaken;

    if (readArrayFromFile("../Arrays/best_case_100.txt", arr, N))
    {
        low = clock();
        quickSort(arr, 0, N - 1);
        high = clock();
        timeTaken = ((double)(high - low)) / CLOCKS_PER_SEC * 1000;
        printf("Time taken to sort the best case array is %f ms\n", timeTaken);
        // printf("Sorted Array: \n");
        // printArray(arr, N);
    }
    else
    {
        printf("Failed to read best case file");
    }

    if (readArrayFromFile("../Arrays/worst_case_100.txt", arr, N))
    {
        low = clock();
        quickSort(arr, 0, N - 1);
        high = clock();
        timeTaken = ((double)(high - low)) / CLOCKS_PER_SEC * 1000;
        printf("Time taken to sort the worst case array is %f ms\n", timeTaken);
        // printf("Sorted Array: \n");
        // printArray(arr, N);
    }
    else
    {
        printf("Failed to read worst case file");
    }

    if (readArrayFromFile("../Arrays/average_case_100.txt", arr, N))
    {
        low = clock();
        quickSort(arr, 0, N - 1);
        high = clock();
        timeTaken = ((double)(high - low)) / CLOCKS_PER_SEC * 1000;
        printf("Time taken to sort the average case array is %f ms\n", timeTaken);
        // printf("Sorted Array: \n");
        // printArray(arr, N);
    }
    else
    {
        printf("Failed to read average case file");
    }
}