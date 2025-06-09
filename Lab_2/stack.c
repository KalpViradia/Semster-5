#include <stdio.h>
#define SIZE 100

struct stack {
    int top;
    int arr[SIZE];
} s;

void push(int element) {
    s.arr[++s.top] = element;
}

void pop() {
    printf("Popped element is: %d\n", s.arr[s.top--]);
}

void change(int element, int index) {
    s.arr[s.top - index + 1] = element;
}

void display() {
    int i = 0;
    printf("Stack elements are: ");
    for (i = s.top; i >= 0; i--) {
        printf("%d ", s.arr[i]);
    }
    printf("\n");
}

void main() {
    int choice;
    int element;
    int index;

    while (choice != 5) {
        printf("Enter your choice of operation:\n");
        printf("1. Push\n");
        printf("2. Pop\n");
        printf("3. Change\n");
        printf("4. Display\n");
        printf("5. Exit\n");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter a element to push: \n");
                scanf("%d", &element);
                push(element);
                break;
            
            case 2:
                pop();
                break;

            case 3:
                printf("Enter a index to change: \n");
                scanf("%d", &index);
                printf("Enter new value: \n");
                scanf("%d", &element);
                change(element, index);
                break;

            case 4:
                display();
                break;

            default:
                printf("Invalid Choice.\n");
                break;
        }
    }
}