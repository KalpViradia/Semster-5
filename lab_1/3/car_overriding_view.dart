import 'package:advance_flutter_lab/lab_1/3/utils/import_export.dart';

class CarOverridingView extends StatefulWidget {
  const CarOverridingView({super.key});

  @override
  State<CarOverridingView> createState() => _CarOverridingViewState();
}

class _CarOverridingViewState extends State<CarOverridingView> {
  final CarOverridingController carController = CarOverridingController();
  final ExtendedCarOverridingController extendedCarController = ExtendedCarOverridingController();

  @override
  Widget build(BuildContext context) {
    CarOverridingModel baseCar = carController.getCar();
    CarOverridingModel extendedCar = extendedCarController.getCar();

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
            const SizedBox(height: 10),
            Text(carController.getDetails(), style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
            const SizedBox(height: 30),
            const Text(
              'Extended Car:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Brand: ${extendedCar.brand}', style: const TextStyle(fontSize: 18)),
            Text('Model: ${extendedCar.model}', style: const TextStyle(fontSize: 18)),
            Text('Year: ${extendedCar.year}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(extendedCarController.getDetails(), style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}