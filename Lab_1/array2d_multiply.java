import java.util.Scanner;

public class array2d_multiply {
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

        int[][] product = new int[n][m];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                for(int k = 0; k < m; k++) {
                    product[i][j] += arr1[i][k] * arr2[k][j];
                }
            }
        }
        System.out.println("The multiplication of arrays is: ");
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                System.out.print(product[i][j] + " ");
            }
            System.out.println();
        }

        sc.close();
    }
}
