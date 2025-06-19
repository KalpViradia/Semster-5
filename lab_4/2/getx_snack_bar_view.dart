import 'package:advance_flutter_lab/lab_4/2/utils/import_export.dart';

class GetxSnackBarView extends StatelessWidget {
  const GetxSnackBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.snackbar(
                'SnackBar',
                'Button Clicked',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.blue[200],
                colorText: Colors.black,
                duration: Duration(seconds: 2),
              );
            },
            child: Text(BTN_TEXT)),
      ),
    );
  }
}
