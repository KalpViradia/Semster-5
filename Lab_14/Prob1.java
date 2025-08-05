package Lab_14;

import java.util.*;

public class Prob1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = 0, m = 0, e = 0;

        System.out.print("Enter the number of vertices in set 1: ");
        n = sc.nextInt();
        System.out.print("Enter the number of vertices in set 2: ");
        m = sc.nextInt();
        System.out.print("Enter the number of edges: ");
        e = sc.nextInt();

        int[][] mat = new int[n][m];

        for (int i = 0; i < e; i++) {
            System.out.print("Enter vertex of set 1 for edge " + (i + 1) + ": ");
            int u = sc.nextInt() - 1;

            System.out.print("Enter vertex of set 2 for edge " + (i + 1) + ": ");
            int v = sc.nextInt() - 1;

            mat[u][v] = 1;
        }

        System.out.print("Select the set for subset of Hall's condition (1 or 2): ");
        int setNo = sc.nextInt();

        System.out.print("Enter the number of vertices in subset: ");
        int x = sc.nextInt();

        int[] subset = new int[x];

        for (int i = 0; i < x; i++) {
            System.out.print("Enter vertex " + (i + 1) + " for the subset: ");
            subset[i] = sc.nextInt() - 1;
        }

        int connections = 0;

        if (setNo == 1) {
            boolean[] isVisited = new boolean[m];
            for (int i = 0; i < x; i++) {
                int u = subset[i];
                for (int v = 0; v < m; v++) {
                    if (mat[u][v] == 1 && !isVisited[v]) {
                        connections++;
                        isVisited[v] = true;
                    }
                }
            }
        } else {
            boolean[] isVisited = new boolean[n];
            for (int i = 0; i < x; i++) {
                int v = subset[i];
                for (int u = 0; u < n; u++) {
                    if (mat[u][v] == 1 && !isVisited[u]) {
                        connections++;
                        isVisited[u] = true;
                    }
                }
            }
        }

        if (x > connections) {
            System.out.println("The graph does NOT follow Hall's condition.");
        } else {
            System.out.println("The graph follows Hall's condition.");
        }

        sc.close();
    }
}
