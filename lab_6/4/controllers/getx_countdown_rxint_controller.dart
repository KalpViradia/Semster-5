import 'package:advance_flutter_lab/lab_6/4/utils/import_export.dart';

class GetXCountdownRxIntController extends GetxController {
  final GetXCountdownRxIntModel _model = GetXCountdownRxIntModel();
  Timer? _timer;

  RxInt get seconds => _model.seconds;

  void startCountdown() {
    _timer?.cancel();

    _model.seconds.value = 10;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_model.seconds.value > 0) {
        _model.seconds.value--;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}