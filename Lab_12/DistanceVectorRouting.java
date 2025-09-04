import java.util.*;

public class DistanceVectorRouting {
    private static final int INF = 9999;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter the number of routers: ");
        int numRouters = scanner.nextInt();

        int[][] costMatrix = new int[numRouters][numRouters];
        System.out.println("Enter the cost matrix (use " + INF + " for infinity):");
        for (int i = 0; i < numRouters; i++) {
            for (int j = 0; j < numRouters; j++) {
                costMatrix[i][j] = scanner.nextInt();
            }
        }

        int[][] distanceVector = new int[numRouters][numRouters];
        int[][] nextHop = new int[numRouters][numRouters];

        for (int i = 0; i < numRouters; i++) {
            for (int j = 0; j < numRouters; j++) {
                distanceVector[i][j] = costMatrix[i][j];
                nextHop[i][j] = (costMatrix[i][j] != INF && i != j) ? j : -1;
            }
        }

        boolean updated;
        do {
            updated = false;
            for (int i = 0; i < numRouters; i++) {
                for (int j = 0; j < numRouters; j++) {
                    for (int k = 0; k < numRouters; k++) {
                        if (distanceVector[i][k] + distanceVector[k][j] < distanceVector[i][j]) {
                            distanceVector[i][j] = distanceVector[i][k] + distanceVector[k][j];
                            nextHop[i][j] = nextHop[i][k];
                            updated = true;
                        }
                    }
                }
            }
        } while (updated);

        System.out.println("\nFinal Distance Vector Table:");
        for (int i = 0; i < numRouters; i++) {
            System.out.println("Router " + (i + 1) + ":");
            for (int j = 0; j < numRouters; j++) {
                if (distanceVector[i][j] == INF) {
                    System.out.print("INF ");
                } else {
                    System.out.print((distanceVector[i][j] + 1) + " ");
                }
            }
            System.out.println();
        }

        scanner.close();
    }
}