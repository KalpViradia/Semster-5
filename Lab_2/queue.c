#include <stdio.h>
#define SIZE 100

struct queue {
    int front;
    int rear;
    int arr[SIZE];
} q;

void enqueue(int element) {
    q.arr[q.rear] = element;
    q.rear = q.rear + 1 % SIZE;
}

void dequeue() {
    printf("Popped element is: %d\n", q.arr[q.front]);
    q.front = q.front + 1 % SIZE;
}

void display() {
    int i = 0;
    printf("Queue elements are: ");
    for (i = q.front; i < q.rear; i++) {
        printf("%d ", q.arr[i]);
    }
    printf("\n");
}

void main() {
    int choice;
    int element;

    while (choice != 4) {
        printf("Enter your choice of operation:\n");
        printf("1. Enqueue\n");
        printf("2. Dequeue\n");
        printf("3. Display\n");
        printf("4. Exit\n");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter a element to push: \n");
                scanf("%d", &element);
                enqueue(element);
                break;
            
            case 2:
                dequeue();
                break;

            case 3:
                display();
                break;

            default:
                printf("Invalid Choice.\n");
                break;
        }
    }
}