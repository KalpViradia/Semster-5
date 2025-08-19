import java.util.*;

public class Prob1 {

    public static int minCostMaxThroughput(int[][] costMat, int[][] vmCap, int[][] taskReq) {
        int n = costMat.length;
        int m = costMat[0].length;

        boolean[] taskAssigned = new boolean[m];
        int totalCost = 0;
        int throughput = 0;

        for (int task = 0; task < m; task++) {
            int minCost = Integer.MAX_VALUE;
            int selectedVM = -1;

            for (int vm = 0; vm < n; vm++) {
                if (vmCap[vm][0] >= taskReq[task][0] && vmCap[vm][1] >= taskReq[task][1]) {
                    if (costMat[vm][task] < minCost) {
                        minCost = costMat[vm][task];
                        selectedVM = vm;
                    }
                }
            }

            if (selectedVM != -1) {
                vmCap[selectedVM][0] -= taskReq[task][0];
                vmCap[selectedVM][1] -= taskReq[task][1];
                totalCost += costMat[selectedVM][task];
                throughput++;
                taskAssigned[task] = true;
            }
        }

        System.out.println("\nTotal tasks successfully assigned (throughput): " + throughput);
        return totalCost;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter the number of VMs: ");
        int n = sc.nextInt();

        System.out.print("Enter the number of tasks: ");
        int m = sc.nextInt();

        int[][] costMat = new int[n][m];
        int[][] vmCap = new int[n][2];
        int[][] taskReq = new int[m][2];

        System.out.println("\nEnter the cost matrix:");
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                System.out.print("Cost of assigning VM " + (i + 1) + " to Task " + (j + 1) + ": ");
                costMat[i][j] = sc.nextInt();
            }
        }

        System.out.println("\nEnter VM capabilities (CPU and Memory):");
        for (int i = 0; i < n; i++) {
            System.out.print("VM " + (i + 1) + " CPU: ");
            vmCap[i][0] = sc.nextInt();
            System.out.print("VM " + (i + 1) + " Memory: ");
            vmCap[i][1] = sc.nextInt();
        }

        System.out.println("\nEnter Task requirements (CPU and Memory):");
        for (int i = 0; i < m; i++) {
            System.out.print("Task " + (i + 1) + " CPU: ");
            taskReq[i][0] = sc.nextInt();
            System.out.print("Task " + (i + 1) + " Memory: ");
            taskReq[i][1] = sc.nextInt();
        }

        // System.out.println("\nCost Matrix:");
        // for (int i = 0; i < n; i++) {
        //     System.out.println(Arrays.toString(costMat[i]));
        // }

        // System.out.println("\nVM Capabilities:");
        // for (int i = 0; i < n; i++) {
        //     System.out.println(Arrays.toString(vmCap[i]));
        // }

        // System.out.println("\nTask Requirements:");
        // for (int i = 0; i < m; i++) {
        //     System.out.println(Arrays.toString(taskReq[i]));
        // }

        int[][] vmCapCopy = new int[n][2];
        for (int i = 0; i < n; i++) {
            vmCapCopy[i][0] = vmCap[i][0];
            vmCapCopy[i][1] = vmCap[i][1];
        }

        int totalCost = minCostMaxThroughput(costMat, vmCapCopy, taskReq);
        System.out.println("\nMinimum cost for maximum throughput: " + totalCost);

        sc.close();
    }
}
