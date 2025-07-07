import 'package:advance_flutter_lab/lab_10/1/utils/import_export.dart';

class SQLiteInsertFormView extends StatefulWidget {
  const SQLiteInsertFormView({super.key});

  @override
  State<SQLiteInsertFormView> createState() => _SQLiteInsertFormViewState();
}

class _SQLiteInsertFormViewState extends State<SQLiteInsertFormView> {
  final controller = Get.find<SQLiteInsertController>();

  final nameController = TextEditingController();
  final enrollController = TextEditingController();
  final grade12Controller = TextEditingController();
  final diplomaCgpaController = TextEditingController();
  final currentCgpaController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();

  int? selectedUniversityId;
  int? selectedSemesterId;
  int? selectedBranchId;

  @override
  void initState() {
    super.initState();
    controller.fetchDropdownData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE_FORM)),
      body: Obx(() {
        if (controller.universities.isEmpty ||
            controller.semesters.isEmpty ||
            controller.branches.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _textField(nameController, "Name"),
                _textField(enrollController, "Enrollment Number"),
                _textField(grade12Controller, "12th Grade %", isNumber: true),
                _textField(diplomaCgpaController, "Diploma CGPA", isNumber: true),
                _textField(currentCgpaController, "Current CGPA", isNumber: true),
                _textField(emailController, "Email"),
                _textField(phoneController, "Phone"),
                _textField(cityController, "City"),

                const SizedBox(height: 16),

                _dropdown<University>(
                  title: "University",
                  items: controller.universities,
                  onChanged: (val) => setState(() => selectedUniversityId = val?.id),
                ),
                _dropdown<Semester>(
                  title: "Semester",
                  items: controller.semesters,
                  onChanged: (val) => setState(() => selectedSemesterId = val?.id),
                ),
                _dropdown<Branch>(
                  title: "Branch",
                  items: controller.branches,
                  onChanged: (val) => setState(() => selectedBranchId = val?.id),
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (selectedUniversityId == null ||
                        selectedSemesterId == null ||
                        selectedBranchId == null) {
                      Get.snackbar("Error", "Please select all dropdowns");
                      return;
                    }

                    final student = SQLiteInsertModel(
                      name: nameController.text,
                      enrollmentNumber: enrollController.text,
                      grade12: double.tryParse(grade12Controller.text) ?? 0.0,
                      diplomaCgpa: double.tryParse(diplomaCgpaController.text),
                      currentCgpa: double.tryParse(currentCgpaController.text) ?? 0.0,
                      email: emailController.text,
                      phone: phoneController.text,
                      city: cityController.text,
                    );

                    await controller.insertStudent(
                      student,
                      universityId: selectedUniversityId!,
                      semesterId: selectedSemesterId!,
                      branchId: selectedBranchId!,
                    );

                    Get.back();
                  },
                  child: Text(BTN_SUBMIT),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _textField(TextEditingController controller, String label,
      {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _dropdown<T>({
    required String title,
    required List<T> items,
    required Function(T?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(labelText: title, border: OutlineInputBorder()),
        items: items
            .map((e) => DropdownMenuItem<T>(
          value: e,
          child: Text((e as dynamic).name),
        ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}