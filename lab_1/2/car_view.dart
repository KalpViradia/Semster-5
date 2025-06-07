import './utils/import_export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car details using MVC',
      home: CarView(),
    );
  }
}

class CarView extends StatefulWidget {
  CarView({super.key});

  @override
  State<CarView> createState() => _CarViewState();
}

class _CarViewState extends State<CarView> {

  CarController _carController = CarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE),
      ),

      body: Container(
        child: Column(
          children: [
            Text(_carController.startTesla()),
            SizedBox(height: 10,),
            Text(_carController.startCyberTruck()),
          ],
        ),
      ),
    );
  }
}
