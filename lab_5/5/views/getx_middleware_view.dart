import 'package:advance_flutter_lab/lab_5/5/utils/import_export.dart';

class GetxMiddlewareView extends StatelessWidget {
  final FormController formController = Get.put(FormController());
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE_SCREEN1)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Enter Name'),
            ),
            SizedBox(height: 15),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Enter Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final age = int.tryParse(ageController.text) ?? 0;
                formController.submitForm(name, age);
                Get.toNamed('/second');
              },
              child: Text(BTN_SUBMIT),
            )
          ],
        ),
      ),
    );
  }
}