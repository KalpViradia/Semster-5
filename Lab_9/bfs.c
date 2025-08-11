#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#define V 8

struct Queue {
    int items[V];
    int front;
    int rear;
};

struct Queue q;

void initQueue(struct Queue* q) {
    q->front = -1;
    q->rear = -1;
}

bool isEmpty(struct Queue* q) {
    return q->front == -1;
}

bool isFull(struct Queue* q) {
    return q->rear == V - 1;
}

void enqueue(int value) {
    if (isFull(&q)) {
        printf("Queue is full\n");
        return;
    }
    if (q.front == -1) q.front = 0;
    q.items[++q.rear] = value;
}

int dequeue() {
    if (isEmpty(&q)) {
        printf("Queue is empty\n");
        return -1;
    }
    int item = q.items[q.front++];
    if (q.front > q.rear) {
        q.front = q.rear = -1;
    }
    return item;
}

void BFS(int graph[V][V]) {
    int visited[V] = {0};
    initQueue(&q);

    visited[0] = 1;
    enqueue(0);

    while (!isEmpty(&q)) {
        int key = dequeue();
        printf("%d ", key + 1);

        for (int i = 0; i < V; i++) {
            if (graph[key][i] && !visited[i]) {
                visited[i] = 1;
                enqueue(i);
            }
        }
    }
}

int main() {
    int graph[V][V] = {
        {0,1,1,1,1,0,0,0},
        {1,0,0,0,0,1,0,0},
        {1,0,0,0,0,1,0,0},
        {1,0,0,0,0,0,1,0},
        {1,0,0,0,0,0,1,0},
        {0,1,1,0,0,0,0,1},
        {0,0,0,1,1,0,0,1},
        {0,0,0,0,0,1,1,0}
    };

    printf("BFS Traversal: ");
    BFS(graph);
    return 0;
}