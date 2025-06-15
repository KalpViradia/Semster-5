import 'package:advance_flutter_lab/lab_1/3/utils/import_export.dart';

class CarOverridingController {
  CarOverridingModel getCar() {
    return CarOverridingModel(brand: "Toyota", model: "Corolla", year: "2022");
  }

  String getDetails() {
    final car = getCar();
    return "Car: ${car.brand} ${car.model} (${car.year})";
  }
}

class ExtendedCarOverridingController extends CarOverridingController {
  @override
  ExtendedCarOverridingModel getCar() {
    return ExtendedCarOverridingModel(brand: "Tesla", model: "Model S", year: "2024");
  }

  @override
  String getDetails() {
    final car = getCar();
    return "Electric Car: ${car.brand} - ${car.model}, Released in ${car.year}";
  }
}