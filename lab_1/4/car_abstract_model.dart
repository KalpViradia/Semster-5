class CarInheritanceModel {
  String brand;
  String model;
  String year;

  CarInheritanceModel({
    required this.brand,
    required this.model,
    required this.year,
  });
}

class ExtendedCarInheritanceModel extends CarInheritanceModel {
  ExtendedCarInheritanceModel({
    required String brand,
    required String model,
    required String year,
  }) : super(
    brand: brand,
    model: model,
    year: year,
  );
}