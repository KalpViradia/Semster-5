import 'package:second/lab_8/1/utils/import_export.dart';

void main() {
  try {
    stdout.write("Enter the numerator: ");
    double a = double.parse(stdin.readLineSync()!);

    stdout.write("Enter the denominator: ");
    double b = double.parse(stdin.readLineSync()!);

    if (b == 0) {
      throw DivisionByZeroException("Attempted to divide $a by zero");
    }
    double result =  a / b;
    print("Result: $result");
  } on DivisionByZeroException catch (e) {
    print("Custom Exception Caught: $e");
  } catch (e) {
    print("Other Exception: $e");
  }
}
