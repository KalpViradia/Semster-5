package Lab_6;

import java.util.*;

class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;

    TreeNode(int val) {
        this.val = val;
    }
}

public class Prob2 {
    public static TreeNode buildTree(Integer[] arr) {
        if (arr.length == 0 || arr[0] == null) return null;

        TreeNode root = new TreeNode(arr[0]);
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);
        int i = 1;

        while (i < arr.length) {
            TreeNode current = queue.poll();
            if (i < arr.length && arr[i] != null) {
                current.left = new TreeNode(arr[i]);
                queue.add(current.left);
            }
            i++;

            if (i < arr.length && arr[i] != null) {
                current.right = new TreeNode(arr[i]);
                queue.add(current.right);
            }
            i++;
        }

        return root;
    }

    public static void printLeafNodes(TreeNode root) {
        if (root == null) return;

        if (root.left == null && root.right == null) {
            System.out.print(root.val + " ");
        }

        printLeafNodes(root.left);
        printLeafNodes(root.right);
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of nodes: ");
        int n = sc.nextInt();
        Integer[] arr = new Integer[n];

        for (int i = 0; i < n; i++) {
            System.out.print("Enter node value at position " + i + " (type -1 for null): ");
            int val = sc.nextInt();
            arr[i] = (val == -1) ? null : val;
        }

        TreeNode root = buildTree(arr);
        printLeafNodes(root);
        
        sc.close();
    }
}
