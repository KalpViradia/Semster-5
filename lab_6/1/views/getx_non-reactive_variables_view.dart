import 'package:advance_flutter_lab/lab_6/1/utils/import_export.dart';

class GetXNonReactiveVariablesView extends StatelessWidget {
  final GetXNonReactiveVariablesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE)),
      body: Center(
        child: StatefulBuilder(
          builder: (context, setState) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Counter: ${controller.counter}',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.increment();
                  setState(() {});
                },
                child: Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}