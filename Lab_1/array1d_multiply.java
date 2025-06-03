import java.util.Scanner;

public class array1d_multiply {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n;

        System.out.print("Enter the number of elements in the arrays: ");
        n = sc.nextInt();

        int[] arr1 = new int[n];

        for (int i = 0; i < n; i++) {
            System.out.print("Enter a value for element in the array1 at position " + i + ": ");
            arr1[i] = sc.nextInt();
        }

        int[] arr2 = new int[n];

        for (int i = 0; i < n; i++) {
            System.out.print("Enter a value for element in the array2 at position " + i + ": ");
            arr2[i] = sc.nextInt();
        }

        int[] product = new int[n];

        for (int i = 0; i < n; i++) {
            product[i] = arr1[i] * arr2[i];
        }

        System.out.println("The multiplication of the arrays is: ");
        for (int i = 0; i < n; i++) {
            System.out.print(product[i] + " ");
        }

        sc.close();
    }
}
