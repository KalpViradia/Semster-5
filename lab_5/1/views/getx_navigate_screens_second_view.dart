import 'package:advance_flutter_lab/lab_5/1/utils/import_export.dart';

class GetxNavigateScreensSecondView extends StatelessWidget {
  final GetxNavigateScreensController navController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE_SCREEN2)),
      body: Center(
        child: ElevatedButton(
          onPressed: navController.goBack,
          child: Text(BTN_FIRST_SCREEN),
        ),
      ),
    );
  }
}