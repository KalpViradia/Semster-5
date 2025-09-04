#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define MAX 100

int adj[MAX][MAX];
int visited[MAX];
int low[MAX];
bool onStack[MAX];
int stack[MAX];
int top = -1;
int time = 0;
int V;

void push(int v) {
    stack[++top] = v;
    onStack[v] = true;
}

int pop() {
    int v = stack[top--];
    onStack[v] = false;
    return v;
}

void tarjanDFS(int u) {
    visited[u] = low[u] = ++time;
    push(u);

    for (int v = 0; v < V; v++) {
        if (adj[u][v]) {
            if (!visited[v]) {
                tarjanDFS(v);
                if (low[v] < low[u])
                    low[u] = low[v];
            } else if (onStack[v]) {
                if (visited[v] < low[u])
                    low[u] = visited[v];
            }
        }
    }

    if (visited[u] == low[u]) {
        printf("SCC: ");
        int v;
        do {
            v = pop();
            printf("%d ", v);
        } while (u != v);
        printf("\n");
    }
}

void tarjan() {
    for (int i = 0; i < V; i++) {
        visited[i] = 0;
        low[i] = 0;
        onStack[i] = false;
    }

    for (int i = 0; i < V; i++) {
        if (!visited[i])
            tarjanDFS(i);
    }
}

int main() {
    printf("Enter number of vertices: ");
    scanf("%d", &V);

    printf("Enter adjacency matrix (0/1):\n");
    for (int i = 0; i < V; i++)
        for (int j = 0; j < V; j++)
            scanf("%d", &adj[i][j]);

    printf("\nStrongly Connected Components:\n");
    tarjan();

    return 0;
}
