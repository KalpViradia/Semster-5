import 'package:advance_flutter_lab/lab_1/2/utils/import_export.dart';

class CarInheritanceView extends StatefulWidget {
  const CarInheritanceView({super.key});

  @override
  State<CarInheritanceView> createState() => _CarInheritanceViewState();
}

class _CarInheritanceViewState extends State<CarInheritanceView> {
  final CarInheritanceController carController = CarInheritanceController();
  final ExtendedCarInheritanceController extendedCarController = ExtendedCarInheritanceController();

  @override
  Widget build(BuildContext context) {
    CarInheritanceModel baseCar = carController.getCar();
    CarInheritanceModel extendedCar = extendedCarController.getCar();

    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Base Car:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Brand: ${baseCar.brand}', style: const TextStyle(fontSize: 18)),
            Text('Model: ${baseCar.model}', style: const TextStyle(fontSize: 18)),
            Text('Year: ${baseCar.year}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            const Text(
              'Extended Car:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Brand: ${extendedCar.brand}', style: const TextStyle(fontSize: 18)),
            Text('Model: ${extendedCar.model}', style: const TextStyle(fontSize: 18)),
            Text('Year: ${extendedCar.year}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}