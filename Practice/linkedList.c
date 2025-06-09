#include <stdio.h>
#include <stdlib.h>

struct node {
    int data;
    struct node *link;
};

struct node* createNode(int data) {
    struct node* newNode = (struct node*)malloc(sizeof(struct node));
    newNode->data = data;
    newNode->link = NULL;
    return newNode;
}

void insertAtBeginning(struct node** head, int data) {
    struct node* newNode = createNode(data);
    newNode->link = *head;
    *head = newNode;
}

void insertAtEnd(struct node** head, int data) {
    struct node* newNode = createNode(data);
    if (*head == NULL) {
        *head = newNode;
        return;
    }
    struct node* temp = *head;
    while (temp->link != NULL) {
        temp = temp->link;
    }
    temp->link = newNode;
}

void deleteNode(struct node** head, int key) {
    struct node* temp = *head;
    struct node* prev = NULL;

    if (temp != NULL && temp->data == key) {
        *head = temp->link; // Changed head
        free(temp); // Free old head
        return;
    }

    while (temp != NULL && temp->data != key) {
        prev = temp;
        temp = temp->link;
    }

    if (temp == NULL) return; // Key not found

    prev->link = temp->link; // Unlink the node
    free(temp); // Free memory
}

void displayList(struct node* head) {
    struct node* temp = head;
    while (temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->link;
    }
    printf("NULL\n");
}

int main() {
    struct node* head = NULL;

    insertAtBeginning(&head, 10);
    insertAtBeginning(&head, 20);
    insertAtEnd(&head, 30);
    insertAtEnd(&head, 40);

    printf("Linked List: ");
    displayList(head);

    deleteNode(&head, 20);
    printf("After deleting 20: ");
    displayList(head);

    deleteNode(&head, 10);
    printf("After deleting 10: ");
    displayList(head);

    return 0;
}