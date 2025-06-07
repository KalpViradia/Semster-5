abstract class CarModel {
  String start();
}

class Tesla extends CarModel {
  static const String brand = 'Tesla';

  @override
  String start() {
    return '$brand is starting.';
  }
}

class CyberTruck extends Tesla {
  static const String model = 'CyberTruck';

  @override
  String start() {
    return '${Tesla.brand} $model is starting.';
  }
}
