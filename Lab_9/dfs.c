#include<stdio.h>
#include<stdlib.h>
#define V 8

void DFShelper(int graph[V][V],int visited[V],int key){
    visited[key] = 1;
    printf("%d ", key+1);

    for(int i=0;i<V;i++){
        if(graph[key][i] && !visited[i]){
            DFShelper(graph, visited, i);
        }
    }
}

void DFS(int graph[V][V]){
    int visited[V]={0};
    DFShelper(graph, visited, 0);
}

int main(){
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
    DFS(graph);
}