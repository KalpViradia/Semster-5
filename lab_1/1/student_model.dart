class StudentModel {
  int enrollmentNumber;
  String name;

  StudentModel(
      {this.enrollmentNumber = 23010101299, this.name = 'Kalp Viradia'});

  Map<String, dynamic> displayDetails() {
    return {"enrollmentNumber": enrollmentNumber, "name": name};
  }
}
