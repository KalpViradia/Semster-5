#include <stdio.h>
#include <stdlib.h>

struct queue
{
    int size;
    int front;
    int rear;
    int *arr;
};

int isEmpty(struct queue *ptr)
{
    return ptr->front == ptr->rear;
}

int isFull(struct queue *ptr)
{
    return (ptr->rear + 1) % ptr->size == ptr->front;
}

void enqueue(struct queue *ptr, int val)
{
    if (isFull(ptr))
    {
        printf("Queue Overflow! Cannot enqueue %d\n", val);
    }
    else
    {
        ptr->arr[ptr->rear] = val;
        ptr->rear = (ptr->rear + 1) % ptr->size;
        printf("%d enqueued to queue\n", val);
    }
}

int dequeue(struct queue *ptr)
{
    if (isEmpty(ptr))
    {
        printf("Queue Underflow! Cannot dequeue from empty queue\n");
        return -1;
    }
    else
    {
        int val = ptr->arr[ptr->front];
        ptr->front = (ptr->front + 1) % ptr->size;
        return val;
    }
}

void display(struct queue *ptr)
{
    if (isEmpty(ptr))
    {
        printf("Queue is empty\n");
    }
    else
    {
        printf("Queue elements are: ");
        int i = ptr->front;
        while (i != ptr->rear)
        {
            printf("%d ", ptr->arr[i]);
            i = (i + 1) % ptr->size;
        }
        printf("\n");
    }
}

int main()
{
    struct queue *q = (struct queue *)malloc(sizeof(struct queue));
    q->size = 6; // Changed from 5 to 6 to store 5 elements
    q->front = 0;
    q->rear = 0;
    q->arr = (int *)malloc(q->size * sizeof(int));

    enqueue(q, 10);
    enqueue(q, 20);
    enqueue(q, 30);
    display(q);

    printf("Dequeued: %d\n", dequeue(q));
    display(q);

    enqueue(q, 40);
    enqueue(q, 50);
    enqueue(q, 60); // OK now
    enqueue(q, 70); // Should show overflow
    display(q);

    free(q->arr);
    free(q);

    return 0;
}
