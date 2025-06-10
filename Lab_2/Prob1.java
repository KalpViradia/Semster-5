package Lab_2;

import java.util.*;

public class Prob1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int vertices;
        int edges;
        System.out.println("Enter number of Vertices: ");
        vertices = sc.nextInt();

        System.out.println("Enter number of Edges: ");
        edges = sc.nextInt();

        List<List<Integer>> adjList = new ArrayList<>();

        for (int i = 0; i < vertices; i++) {
            adjList.add(new ArrayList<>());
        }

        for (int i = 0; i < edges; i++) {
            System.out.println("Enter edge " + (i + 1) + " (u v): ");
            int u = sc.nextInt();
            int v = sc.nextInt();
            adjList.get(u).add(v);
        }

        System.out.println("Adjacent List: ");

        for (int i = 0; i < vertices; i++) {
            System.out.print(i + " -> ");
            for (int j : adjList.get(i)) {
                System.out.print(j + " ");
            }
            System.out.println();
        }
        sc.close();
    }
}
