import java.util.Scanner;

public class ParityBitCheck {

    public static String addParityBit(String dataBits, String parityType) {
        int countOnes = 0;
        for (char bit : dataBits.toCharArray()) {
            if (bit == '1') countOnes++;
        }

        char parityBit;

        if (parityType.equalsIgnoreCase("even")) {
            parityBit = (countOnes % 2 == 0) ? '0' : '1';
        } else {
            parityBit = (countOnes % 2 == 0) ? '1' : '0';
        }

        return dataBits + parityBit;
    }

    public static boolean checkParity(String data, String parityType) {
        char parityBit = data.charAt(data.length() - 1);
        String dataBits = data.substring(0, data.length() - 1);

        int countOnes = 0;
        for (char bit : dataBits.toCharArray()) {
            if (bit == '1') countOnes++;
        }

        boolean isValid;
        if (parityType.equalsIgnoreCase("even")) {
            isValid = ((countOnes % 2 == 0) && parityBit == '0') ||
                      ((countOnes % 2 == 1) && parityBit == '1');
        } else {
            isValid = ((countOnes % 2 == 0) && parityBit == '1') ||
                      ((countOnes % 2 == 1) && parityBit == '0');
        }

        return isValid;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter binary data (without parity bit): ");
        String dataBits = scanner.nextLine();

        System.out.print("Enter parity type (even/odd): ");
        String parityType = scanner.nextLine();

        String dataWithParity = addParityBit(dataBits, parityType);
        System.out.println("Data with " + parityType + " parity bit: " + dataWithParity);

        if (checkParity(dataWithParity, parityType)) {
            System.out.println("Parity check PASSED.");
        } else {
            System.out.println("Parity check FAILED.");
        }

        scanner.close();
    }
}
