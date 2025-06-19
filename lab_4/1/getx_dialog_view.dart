import 'package:advance_flutter_lab/lab_4/1/utils/import_export.dart';

class GetxDialogView extends StatelessWidget {
  const GetxDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'ALERT',
                middleText: 'This is GetX Dialog',
                textConfirm: BTN_OK,
                textCancel: BTN_CANCEL,
                onConfirm: () {
                  Get.back();
                },
                onCancel: () {
                  Get.back();
                },
              );
            },
            child: Text(BTN_TEXT)),
      ),
    );
  }
}
