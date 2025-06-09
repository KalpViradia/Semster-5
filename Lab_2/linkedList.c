#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node* link;
};

struct Node* head = NULL;

void insertAtEnd(int value) {
    struct Node* newNode = (struct Node*) malloc(sizeof(struct Node));
    newNode->data = value;
    newNode->link = NULL;

    if(head == NULL) {
        head = newNode;
        return;
    }

    struct Node* temp = head;
    while(temp->link != NULL)
        temp = temp->link;

    temp->link = newNode;
}

void deleteAtEnd() {
    if(head == NULL) {
        printf("List is empty\n");
        return;
    }

    if(head->link == NULL) {
        free(head);
        head = NULL;
        return;
    }

    struct Node* temp = head;
    while(temp->link->link != NULL)
        temp = temp->link;

    free(temp->link);
    temp->link = NULL;
}

void display() {
    if (head == NULL) {
        printf("List is empty.\n");
        return;
    }

    struct Node* current = head;
    printf("Linked list: ");
    while (current != NULL) {
        printf("%d -> ", current->data);
        current = current->link;
    }
    printf("NULL\n");
}

void main() {
    int choice, element;

    while (choice != 4) {
        printf("\nEnter your choice of operation:\n");
        printf("1. Insert at Last\n");
        printf("2. Delete at Last\n");
        printf("3. Display\n");
        printf("4. Exit\n");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter an element to insert: ");
                scanf("%d", &element);
                insertAtEnd(element);
                break;

            case 2:
                deleteAtEnd();
                break;

            case 3:
                display();
                break;

            default:
                printf("Invalid choice.\n");
        }
    }
}