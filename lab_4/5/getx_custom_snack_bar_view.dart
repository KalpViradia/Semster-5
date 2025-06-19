import 'package:advance_flutter_lab/lab_4/5/utils/import_export.dart';

class GetxCustomSnackBarView extends StatelessWidget {
  const GetxCustomSnackBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  'Top SnackBar',
                  'This appears at the TOP',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.orange[200],
                  colorText: Colors.black,
                  duration: Duration(seconds: 2),
                  borderRadius: 12,
                  margin: EdgeInsets.all(16),
                );
              },
              child: Text(BTN_TEXT_TOP),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  'Bottom SnackBar',
                  'This appears at the BOTTOM',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.purple[200],
                  colorText: Colors.white,
                  duration: Duration(seconds: 2),
                  borderRadius: 12,
                  margin: EdgeInsets.all(16),
                );
              },
              child: Text(BTN_TEXT_BOTTOM),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  'Center SnackBar',
                  'This appears FLOATING',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green[300],
                  colorText: Colors.black,
                  duration: Duration(seconds: 2),
                  borderRadius: 30,
                  margin: EdgeInsets.only(bottom: 100, left: 20, right: 20),
                  isDismissible: true,
                  snackStyle: SnackStyle.FLOATING,
                );
              },
              child: Text(BTN_TEXT_FLOATING),
            ),
          ],
        ),
      ),
    );
  }
}
