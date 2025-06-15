import './utils/import_export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student details using MVC',
      home: StudentView(),
    );
  }
}

class StudentView extends StatefulWidget {
  StudentView({super.key});

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {

  StudentController _studentController = StudentController();
  late Map<String, dynamic> student;

  @override
  void initState() {
    super.initState();
    student = _studentController.displayDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE),
      ),

      body: Container(
        child: Column(
          children: [
            Text("Enrollment number of the student is: ${student['enrollmentNumber']}"),
            SizedBox(height: 10,),
            Text("Name of the student is: ${student['name']}"),
          ],
        ),
      ),
    );
  }
}
