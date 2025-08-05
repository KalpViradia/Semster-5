import java.util.*;

public class Prob1 {

    static class Edge {
        int target, weight;

        Edge(int target, int weight) {
            this.target = target;
            this.weight = weight;
        }
    }

    public static int[] dijkstra(List<List<Edge>> graph, int source) {
        int n = graph.size();
        int[] dist = new int[n];
        Arrays.fill(dist, Integer.MAX_VALUE);
        dist[source] = 0;

        PriorityQueue<int[]> pq = new PriorityQueue<>(Comparator.comparingInt(a -> a[1]));
        pq.offer(new int[]{source, 0});

        while (!pq.isEmpty()) {
            int[] current = pq.poll();
            int node = current[0];
            int currDist = current[1];

            if (currDist > dist[node]) continue;

            for (Edge edge : graph.get(node)) {
                int neighbor = edge.target;
                int newDist = dist[node] + edge.weight;
                if (newDist < dist[neighbor]) {
                    dist[neighbor] = newDist;
                    pq.offer(new int[]{neighbor, newDist});
                }
            }
        }

        return dist;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n, m;

        System.out.print("Enter the number of vertices: ");
        n = sc.nextInt();
        System.out.print("Enter the number of edges: ");
        m = sc.nextInt();

        List<List<Edge>> graph = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            graph.add(new ArrayList<>());
        }

        for (int i = 0; i < m; i++) {
            System.out.print("Enter the first vertex of edge " + (i + 1) + ": ");
            int u = sc.nextInt() - 1;

            System.out.print("Enter the second vertex of edge " + (i + 1) + ": ");
            int v = sc.nextInt() - 1;

            System.out.print("Enter the weight of edge " + (i + 1) + ": ");
            int w = sc.nextInt();

            graph.get(u).add(new Edge(v, w));
            graph.get(v).add(new Edge(u, w));
        }

        System.out.print("Enter the source vertex: ");
        int source = sc.nextInt() - 1;

        int[] distances = dijkstra(graph, source);

        System.out.println("\nShortest distances from node " + (source + 1) + ":");
        for (int i = 0; i < distances.length; i++) {
            System.out.println("To node " + (i + 1) + " => " + distances[i]);
        }

        sc.close();
    }
}
