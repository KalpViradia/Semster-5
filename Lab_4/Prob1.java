package Lab_4;

import java.util.*;

public class Prob1 {
    static void dfs(ArrayList<ArrayList<Integer>> adj,boolean visited[], int person) {
        visited[person] = true;

        for (int friend = 0; friend < adj.size(); friend++) {
            if (adj.get(person).get(friend) == 1 && !visited[friend]) {
                dfs(adj, visited, friend);
            }
        }
    }

    static int countCircle(ArrayList<ArrayList<Integer>> adj) {
        int n = adj.size();
        boolean visited[] = new boolean[n];
        int circles = 0;

        for (int i = 0; i < n; i++) {
            if (!visited[i]) {
                dfs(adj, visited, i);
                circles++;
            }
        }
        return circles;
    }
    
    public static void main(String[] args) {
        ArrayList<ArrayList<Integer>> adj = new ArrayList<>();
        Scanner sc = new Scanner(System.in);
        int n;

        System.out.println("Enter the number of friends: ");
        n = sc.nextInt();

        for (int i = 0; i < n; i++) {
            ArrayList<Integer> edges = new ArrayList<>();
            System.out.println("Enter 1 if friend or 0 if not friend for " + i + ": ");

            for (int j = 0; j < n; j++) {
                edges.add(sc.nextInt());
            }
            adj.add(edges);
        }

        int circles = countCircle(adj);
        System.out.println("The number of friend circles is: " + circles);

        sc.close();
    }
}