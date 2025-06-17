package Lab_2;

import java.util.*;

class Prob2 {

    static ArrayList<Integer> bfs(ArrayList<ArrayList<Integer>> adj) {
        int V = adj.size();
        int s = 0;
        ArrayList<Integer> res = new ArrayList<>();
        Queue<Integer> q = new LinkedList<>();
        boolean[] visited = new boolean[V];
        visited[s] = true;
        q.add(s);

        while (!q.isEmpty()) {
            int curr = q.poll();
            res.add(curr);

            for (int x : adj.get(curr)) {
                if (!visited[x]) {
                    visited[x] = true;
                    q.add(x);
                }
            }
        }
        return res;
    }

    public static void main(String[] args) {

        ArrayList<ArrayList<Integer>> adj = new ArrayList<>();
        // adj.add(new ArrayList<>(Arrays.asList(1, 2)));
        // adj.add(new ArrayList<>(Arrays.asList(0, 2, 3)));
        // adj.add(new ArrayList<>(Arrays.asList(0, 1, 4)));
        // adj.add(new ArrayList<>(Arrays.asList(1, 4)));
        // adj.add(new ArrayList<>(Arrays.asList(2, 3)));

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

        ArrayList<Integer> ans = bfs(adj);
        for (int i : ans) {
            System.out.print(i + " ");
        }

        sc.close();
    }
}
