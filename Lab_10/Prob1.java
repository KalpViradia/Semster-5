package Lab_10;

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

        for (int i = 0; i < m; i++) {
            System.out.print("Enter the first vertex of edge " + (i + 1) + ": ");
            edges[i][0] = sc.nextInt();
            System.out.println();
            System.out.print("Enter the second vertex of edge " + (i + 1) + ": ");
            edges[i][1] = sc.nextInt();
            System.out.println();

            adjMat[edges[i][0] - 1][edges[i][1] - 1] = 1;
            adjMat[edges[i][1] - 1][edges[i][0] - 1] = 1;
        }

        HashMap<Integer, ArrayList<Integer>> h = new HashMap<>();
        for (int i = 0; i < n; i++) {
            h.putIfAbsent(i + 1, new ArrayList<>());
            for (int j = 0; j < n; j++) {
                if (i == j) {
                    h.get(i + 1).add(i + 1);
                } else if (adjMat[i][j] == 1) {
                    h.get(i + 1).add(j + 1);
                }
            }
        }

        List<Integer> li = new ArrayList<>(h.keySet());
        Collections.sort(li, (a, b) -> Integer.compare(h.get(b).size(), h.get(a).size()));

        boolean[] bool = new boolean[n];
        List<Integer> ans = new ArrayList<>();

        for (Integer data : li) {
            ArrayList<Integer> curr = h.get(data);
            ans.add(data);
            
            for (Integer c : curr) {
                bool[c - 1] = true;
            }

            boolean isAllCovered = true;
            for (boolean b : bool) {
                if (!b) {
                    isAllCovered = false;
                    break;
                }
            }
            
            if (isAllCovered) {
                break;
            }
        }

        System.out.println("The dominating set is: " + ans);

        sc.close();
    }
}
