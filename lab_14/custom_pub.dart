import 'package:lab_14_custom_pub/lab_14_custom_pub.dart';

void main() {
  final calc = Calculator();

  print('5 + 3 = ${calc.add(5, 3)}');
  print('10 - 4 = ${calc.subtract(10, 4)}');
  print('2 × 6 = ${calc.multiply(2, 6)}');
  print('10 ÷ 2 = ${calc.divide(10, 2)}');
}
