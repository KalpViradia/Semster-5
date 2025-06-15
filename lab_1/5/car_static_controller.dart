import 'package:advance_flutter_lab/lab_1/5/utils/import_export.dart';

class CarFactoryA {
  void produceCar() {
    CarStaticCounter.increment();
    print("CarFactoryA produced a car. Total cars: ${CarStaticCounter.totalCars}");
  }
}

class CarFactoryB {
  void produceCar() {
    CarStaticCounter.increment();
    print("CarFactoryB produced a car. Total cars: ${CarStaticCounter.totalCars}");
  }
}