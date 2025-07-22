package Lab_7;

import java.util.*;

public class Prob1 {

    static class Edge implements Comparable<Edge> {
        int u, v, weight;

        Edge(int u, int v, int weight) {
            this.u = u;
            this.v = v;
            this.weight = weight;
        }

        public int compareTo(Edge other) {
            return this.weight - other.weight;
        }
    }

    static int find(int[] parent, int i) {
        if (parent[i] != i)
            parent[i] = find(parent, parent[i]);
        return parent[i];
    }

    static void union(int[] parent, int x, int y) {
        int xRoot = find(parent, x);
        int yRoot = find(parent, y);
        parent[xRoot] = yRoot;
    }

    public static void main(String[] args) {
        int V = 4;
        int[][] edgeList = {
            {0, 1, 10},
            {0, 2, 6},
            {0, 3, 5},
            {1, 3, 15},
            {2, 3, 4}
        };

        List<Edge> edges = new ArrayList<>();
        for (int[] e : edgeList)
            edges.add(new Edge(e[0], e[1], e[2]));

        Collections.sort(edges);

        int[] parent = new int[V];
        for (int i = 0; i < V; i++)
            parent[i] = i;

        int totalWeight = 0;
        System.out.println("Edges in MST:");
        for (Edge edge : edges) {
            int uSet = find(parent, edge.u);
            int vSet = find(parent, edge.v);
            if (uSet != vSet) {
                System.out.println(edge.u + " -- " + edge.v + " == " + edge.weight);
                totalWeight += edge.weight;
                union(parent, uSet, vSet);
            }
        }

        System.out.println("Total weight of MST: " + totalWeight);
    }
}
