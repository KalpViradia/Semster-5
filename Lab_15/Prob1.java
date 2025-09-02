package Lab_15;

import java.util.*;

public class Prob1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = 0;
        int m = 0;

        System.out.print("Enter the number of vertices: ");
        n = sc.nextInt();
        System.out.println();
        System.out.print("Enter the number of edges: ");
        m = sc.nextInt();
        System.out.println();

        int[][] edges = new int[m][2];
        int[][] adjMat = new int[n][n];
        int[][] degMat = new int[n][n];

        for (int i = 0; i < m; i++) {
            System.out.print("Enter the first vertex of " + (i + 1) + ": ");
            edges[i][0] = sc.nextInt();
            System.out.println();
            System.out.print("Enter the second vertex of " + (i + 1) + ": ");
            edges[i][1] = sc.nextInt();
            System.out.println();

            adjMat[edges[i][0] - 1][edges[i][1] - 1] = 1;
            adjMat[edges[i][1] - 1][edges[i][0] - 1] = 1;

            degMat[edges[i][0] - 1][edges[i][0] - 1]++;
            degMat[edges[i][1] - 1][edges[i][1] - 1]++;
        }

        System.out.println("\nDegree of each vertex:");
        for (int i = 0; i < n; i++) {
            System.out.println("Vertex " + (i + 1) + " -> degree " + degMat[i][i]);
        }

        Map<Integer, Integer> degreeCount = new HashMap<>();
        for (int i = 0; i < n; i++) {
            int degree = degMat[i][i];
            degreeCount.put(degree, degreeCount.getOrDefault(degree, 0) + 1);
        }

        System.out.println("\nDegree Distribution:");
        for (Map.Entry<Integer, Integer> entry : degreeCount.entrySet()) {
            System.out.println("Degree " + entry.getKey() + " : " + entry.getValue() + " vertices");
        }

        double[] centrality = new double[n];
        Arrays.fill(centrality, 1.0); // start vector

        for (int iter = 0; iter < 100; iter++) { // 100 iterations
            double[] next = new double[n];

            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    next[i] += adjMat[i][j] * centrality[j];
                }
            }

            // normalize
            double norm = 0;
            for (double v : next)
                norm += v * v;
            norm = Math.sqrt(norm);
            for (int i = 0; i < n; i++)
                next[i] /= norm;

            centrality = next;
        }

        System.out.println("\nEigenvector Centrality:");
        for (int i = 0; i < n; i++) {
            System.out.printf("Vertex %d : %.4f%n", (i + 1), centrality[i]);
        }

        sc.close();
    }
}
