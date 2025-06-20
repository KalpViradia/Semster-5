import 'package:advance_flutter_lab/lab_5/3/utils/import_export.dart';

class GetxNavigateScreensNamedView extends StatelessWidget {
  final GetxNavigateScreensNamedController navController = Get.put(GetxNavigateScreensNamedController());

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