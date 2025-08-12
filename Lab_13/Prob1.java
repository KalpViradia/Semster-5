package Lab_13;

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

        int minDeg = degMat[0][0], maxDeg = degMat[0][0];

        for (int i = 0; i < n; i++) {
            if (minDeg > degMat[i][i])
                minDeg = degMat[i][i];
            if (maxDeg < degMat[i][i])
                maxDeg = degMat[i][i];
        }

        HashSet<ArrayList<Integer>> vertexSet = new HashSet<>();

        for (int currDeg = minDeg; currDeg <= maxDeg; currDeg++) {
            for (int i = 0; i < n; i++) {
                if (degMat[i][i] == currDeg) {
                    ArrayList<Integer> newSet = new ArrayList<>();
                    for (int j = 0; j < n; j++) {
                        if (adjMat[i][j] == 1) {
                            newSet.add(j + 1);
                        }
                    }

                    if (vertexSet.isEmpty()) {
                        vertexSet.add(newSet);
                    }
                    else {
                        boolean shouldAdd = true;
                        Iterator<ArrayList<Integer>> it = vertexSet.iterator();

                        while (it.hasNext()) {
                            ArrayList<Integer> currSet = it.next();

                            if (newSet.containsAll(currSet)) {
                                shouldAdd = false;
                                break;
                            }
                        }

                        if (shouldAdd) {
                            vertexSet.add(newSet);
                        }
                    }
                }
            }
        }

        System.out.println("Vertex Set are:");
        System.out.println(vertexSet);

        sc.close();
    }
}
