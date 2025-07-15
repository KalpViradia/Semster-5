package Lab_8;

import java.util.Arrays;
import java.util.Scanner;

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

        for (int i = 0; i < m; i++) {
            System.out.print("Enter the first vertex of " + (i + 1) + ": ");
            edges[i][0] = sc.nextInt();
            System.out.println();
            System.out.print("Enter the second vertex of " + (i + 1) + ": ");
            edges[i][1] = sc.nextInt();
            System.out.println();

            adjMat[edges[i][0] - 1][edges[i][1] - 1] = 1;
            adjMat[edges[i][1] - 1][edges[i][0] - 1] = 1;
        }

        System.out.println("The adjacent matrix is:");

        for (int i = 0; i < n; i++) {
            System.out.println(Arrays.toString(adjMat[i]));
        }

        sc.close();
    }
}
