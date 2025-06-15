import 'package:advance_flutter_lab/lab_1/5/utils/import_export.dart';

class CarStaticView extends StatefulWidget {
  const CarStaticView({super.key});

  @override
  State<CarStaticView> createState() => _CarStaticViewState();
}

class _CarStaticViewState extends State<CarStaticView> {
  final CarFactoryA factoryA = CarFactoryA();
  final CarFactoryB factoryB = CarFactoryB();

  void _produceFromA() {
    setState(() {
      factoryA.produceCar();
    });
  }

  void _produceFromB() {
    setState(() {
      factoryB.produceCar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total Cars Produced: ${CarStaticCounter.totalCars}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _produceFromA,
              child: const Text("Produce Car from Factory A"),
            ),
            ElevatedButton(
              onPressed: _produceFromB,
              child: const Text("Produce Car from Factory B"),
            ),
          ],
        ),
      ),
    );
  }
}