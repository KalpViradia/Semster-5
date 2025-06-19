import 'package:advance_flutter_lab/lab_4/4/utils/import_export.dart';

class GetxCustomDialogView extends StatelessWidget {
  const GetxCustomDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                    backgroundColor: Colors.green[100],
                    title: Text(
                      'Custom Alert Dialog',
                      style: TextStyle(
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold),
                    ),
                    content: Text(
                      'This is custom dialog',
                      style: TextStyle(color: Colors.black87),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          BTN_CANCEL,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(BTN_OK),
                      )
                    ],
                  ),
                );
              },
              child: Text(BTN_TEXT))),
    );
  }
}
