package Lab_3;

import java.util.*;

public class Prob2 {
    static ArrayList<Integer> dfs(ArrayList<ArrayList<Integer>> adj) {
        int n = adj.size();

        boolean[] visited = new boolean[n];
        ArrayList<Integer> res = new ArrayList<>();

        Stack<Integer> stack = new Stack<>();
        stack.push(0);

        while (!stack.isEmpty()) {
            int node = stack.pop();
        
            if (visited[node] == true) {
                continue;
            }
            
            visited[node] = true;
            res.add(node);
            
            int size = adj.get(node).size();
            for (int i = size - 1; i >= 0; i--) {
                int v = adj.get(node).get(i);
                if (!visited[v]) stack.push(v);
            }
        }

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