package Lab_3;

import java.util.*;

public class Prob1 {
    private static void dfsRec(ArrayList<ArrayList<Integer>> adj, boolean[] visited, int s, ArrayList<Integer> res) {
        visited[s] = true;
        res.add(s);

        for (int i : adj.get(s)) {
            if (!visited[i]) {
                dfsRec(adj, visited, i, res);
            }
        }
    }

    public static ArrayList<Integer> dfs(ArrayList<ArrayList<Integer>> adj) {
        boolean[] visited = new boolean[adj.size()];
        ArrayList<Integer> res = new ArrayList<>();
        dfsRec(adj, visited, 0, res);
        return res;
    }

    public static void main(String[] args) {
        ArrayList<ArrayList<Integer>> adj = new ArrayList<>();
        Scanner sc = new Scanner(System.in);
        int v;

        System.out.println("Enter the number of vertices: ");
        v = sc.nextInt();

        for (int i = 0; i < v; i++) {
            System.out.println("Enter the number of edges for vertex " + i + ": ");
            int e = sc.nextInt();

            ArrayList<Integer> edges = new ArrayList<>();
            System.out.println("Enter the edges for vertex " + i + ": ");

            for (int j = 0; j < e; j++) {
                edges.add(sc.nextInt());
            }
            adj.add(edges);
        }

        ArrayList<Integer> ans = dfs(adj);
        for (int i : ans) {
            System.out.print(i + " ");
        }

        sc.close();
    }
}