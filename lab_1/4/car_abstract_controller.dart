import 'package:advance_flutter_lab/lab_1/4/utils/import_export.dart';

abstract class CarInheritanceController {
  CarInheritanceModel getCar();
}

class BaseCarInheritanceController extends CarInheritanceController {
  @override
  CarInheritanceModel getCar() {
    return CarInheritanceModel(
        brand: "Toyota", model: "Corolla", year: "2022");
  }
}

class ExtendedCarInheritanceController extends CarInheritanceController {
  @override
  ExtendedCarInheritanceModel getCar() {
    return ExtendedCarInheritanceModel(
        brand: "Tesla", model: "Model S", year: "2024");
  }

  void displayDetails() {
    final car = getCar();
    print("Car brand is: ${car.brand}");
    print("Car model is: ${car.model}");
    print("Car year is: ${car.year}");
  }
}