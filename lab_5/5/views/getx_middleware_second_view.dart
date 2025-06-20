import 'package:advance_flutter_lab/lab_5/5/utils/import_export.dart';

class GetxMiddlewareSecondView extends StatelessWidget {
  final FormController formController = Get.find();

  @override
  Widget build(BuildContext context) {
    final user = formController.user;

    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE_SCREEN2)),
      body: Center(
        child: Text(
          'Welcome, ${user.name}!\nYour age is ${user.age}.',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}