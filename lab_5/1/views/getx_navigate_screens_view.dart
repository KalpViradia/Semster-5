import 'package:advance_flutter_lab/lab_5/1/utils/import_export.dart';

class GetxNavigateScreensView extends StatelessWidget {
  final GetxNavigateScreensController navController = Get.put(GetxNavigateScreensController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE_SCREEN1)),
      body: Center(
        child: ElevatedButton(
          onPressed: navController.goToSecondScreen,
          child: Text(BTN_SECOND_SCREEN),
        ),
      ),
    );
  }
}
