import './utils/import_export.dart';

class CarController {
  Tesla _tesla = Tesla();
  CyberTruck _cyberTruck = CyberTruck();

  String startTesla() => _tesla.start();

  String startCyberTruck() => _cyberTruck.start();
}