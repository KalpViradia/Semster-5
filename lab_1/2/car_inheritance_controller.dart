import 'package:advance_flutter_lab/lab_1/2/utils/import_export.dart';

class CarInheritanceController {
  CarInheritanceModel getCar() {
    return CarInheritanceModel(brand: "Toyota", model: "Corolla", year: "2022");
  }
}

class ExtendedCarInheritanceController extends CarInheritanceController {
  @override
  ExtendedCarInheritanceModel getCar() {
    return ExtendedCarInheritanceModel(brand: "Tesla", model: "Model S", year: "2024");
  }

  void displayDetails() {
    var car = getCar();
    print("Car brand is: ${car.brand}");
    print("Car model is: ${car.model}");
    print("Car year is: ${car.year}");
  }
}