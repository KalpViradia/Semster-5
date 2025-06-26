class GetXRxListModel {
  String? _name;

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }
  int? _rollNumber;

  int? get rollNumber => _rollNumber;

  set rollNumber(int? value) {
    _rollNumber = value;
  }

  GetXRxListModel({String? name, int? rollNumber}) : _rollNumber = rollNumber, _name = name;
}