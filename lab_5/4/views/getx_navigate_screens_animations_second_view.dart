import 'package:advance_flutter_lab/lab_5/4/utils/import_export.dart';

class GetxNavigateScreensAnimationsSecondView extends StatelessWidget {
  const GetxNavigateScreensAnimationsSecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE_SCREEN2)),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.back(),
          child: Text(BTN_FIRST_SCREEN),
        ),
      ),
    );
  }
}