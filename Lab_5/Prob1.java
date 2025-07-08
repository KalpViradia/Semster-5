package Lab_5;

import java.util.*;

public class Prob1 {

    static boolean isMirror(int[] arr, int i, int j) {
        if (i >= arr.length && j >= arr.length) return true;
        if (i >= arr.length || j >= arr.length) return false;

        if (arr[i] != arr[j]) return false;

        return isMirror(arr, 2 * i + 1, 2 * j + 2) && isMirror(arr, 2 * i + 2, 2 * j + 1);
    }

    static boolean isSymmetric(int[] arr) {
        if (arr.length == 0) return true;
        return isMirror(arr, 1, 2);
    }
    
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n;

        System.out.println("Enter the number of nodes in the tree: ");
        n = sc.nextInt();
        int[] arr = new int[n];

        for (int i = 0; i < n; i++) {
            System.out.println("Enter the value of node in the tree at postion: " + i + ": ");
            arr[i] = sc.nextInt();
        }

        if (isSymmetric(arr)) System.out.println("The tree is symmetric.");
        else System.out.println("The tree is symmetric.");
        
        sc.close();
    }
}
