import java.util.Scanner;

public class array2d_add {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n;
        int m;

        System.out.print("Enter the number of rows in the arrays: ");
        n = sc.nextInt();

        System.out.print("Enter the number of columns in the arrays: ");
        m = sc.nextInt();

        int[][] arr1 = new int[n][m];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                System.out.print("Enter a value for element in the array1 at position " + i + " " + j + ": ");
                arr1[i][j] = sc.nextInt();
            }
        }

        int[][] arr2 = new int[n][m];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                System.out.print("Enter a value for element in the array2 at position " + i + " " + j + ": ");
                arr2[i][j] = sc.nextInt();
            }
        }

        int[][] sum = new int[n][m];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                sum[i][j] = arr1[i][j] + arr2[i][j];
            }
        }

        System.out.println("The sum of arrays is: ");
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                System.out.print(sum[i][j] + " ");
            }
            System.out.println();
        }

        sc.close();
    }
}
