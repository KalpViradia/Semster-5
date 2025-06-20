import 'package:advance_flutter_lab/lab_5/2/utils/import_export.dart';

class GetxPassDataSecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE_SCREEN2)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: ${user.name}\nAge: ${user.age}',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text(BTN_FIRST_SCREEN),
            )
          ],
        ),
      ),
    );
  }
}