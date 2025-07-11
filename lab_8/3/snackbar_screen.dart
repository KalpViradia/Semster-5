import 'package:second/lab_8/3/utils/import_export.dart';

class SnackBarExceptionView extends StatelessWidget {
  SnackBarExceptionView({super.key});

  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  final RxString result = "".obs;

  void divideNumbers(String a, String b, RxString result) {
    try {
      double num1 = double.parse(a);
      double num2 = double.parse(b);

      if (num2 == 0) {
        throw DivisionByZeroException();
      }

      result.value = "Result: ${(num1 / num2).toStringAsFixed(2)}";
    } on DivisionByZeroException catch (e) {
      Get.snackbar(
        "Division Error",
        e.message,
        backgroundColor: const Color(0xFFffcccc),
        colorText: const Color(0xFFcc0000),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } on FormatException {
      Get.snackbar(
        "Input Error",
        "Please enter valid numbers",
        backgroundColor: const Color(0xFFffcccc),
        colorText: const Color(0xFFcc0000),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Divide Two Numbers")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Enter numerator"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Enter denominator"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                divideNumbers(
                  num1Controller.text.trim(),
                  num2Controller.text.trim(),
                  result,
                );
              },
              child: const Text("Divide"),
            ),
            const SizedBox(height: 20),
            Obx(() => Text(
              result.value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
