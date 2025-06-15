import 'package:advance_flutter_lab/lab_1/4/utils/import_export.dart';

class CarAbstractView extends StatefulWidget {
  const CarAbstractView({super.key});

  @override
  State<CarAbstractView> createState() => _CarAbstractViewState();
}

class _CarAbstractViewState extends State<CarAbstractView> {
  final CarInheritanceController carController = BaseCarInheritanceController();
  final ExtendedCarInheritanceController extendedCarController =
  ExtendedCarInheritanceController();

  @override
  Widget build(BuildContext context) {
    final CarInheritanceModel baseCar = carController.getCar();
    final CarInheritanceModel extendedCar = extendedCarController.getCar();

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