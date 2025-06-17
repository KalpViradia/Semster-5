package Lab_2;

import java.util.*;

public class Extra1 {

    static boolean isValid(String s) {
        Stack<Character> stack = new Stack<>();
        for (char c : s.toCharArray()) {
            if (c == '(' || c == '{' || c == '[')
                stack.push(c);
            else {
                if (stack.isEmpty())
                    return false;
                char top = stack.pop();
                if ((c == ')' && top != '(') || (c == '}' && top != '{') || (c == ']' && top != '['))
                    return false;
            }
        }
        return stack.isEmpty();
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String s;

        System.out.println("Enter the string to validate: ");
        s = sc.nextLine();

        if (isValid(s))
            System.out.println("String is valid");
        else
            System.out.println("String is invalid");

        sc.close();
    }
}
