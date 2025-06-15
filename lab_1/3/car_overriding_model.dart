class CarOverridingModel {
  String brand;
  String model;
  String year;

  CarOverridingModel({
    required this.brand,
    required this.model,
    required this.year,
  });
}

class ExtendedCarOverridingModel extends CarOverridingModel {
  ExtendedCarOverridingModel({
    required String brand,
    required String model,
    required String year,
  }) : super(
    brand: brand,
    model: model,
    year: year,
  );
}