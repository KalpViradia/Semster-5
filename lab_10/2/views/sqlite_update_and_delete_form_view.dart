import 'package:advance_flutter_lab/lab_10/2/utils/import_export.dart';

class SQLiteInsertAndUpdateFormView extends StatefulWidget {
  final SQLiteInsertAndUpdateModel? student;

  const SQLiteInsertAndUpdateFormView({super.key, this.student});

  @override
  State<SQLiteInsertAndUpdateFormView> createState() =>
      _SQLiteInsertAndUpdateFormViewState();
}

class _SQLiteInsertAndUpdateFormViewState
    extends State<SQLiteInsertAndUpdateFormView> {
  final controller = Get.find<SQLiteInsertAndUpdateController>();

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
    controller.fetchDropdownData().then((_) {
      final s = widget.student;
      if (s != null) {
        nameController.text = s.name;
        enrollController.text = s.enrollmentNumber;
        grade12Controller.text = s.grade12?.toString() ?? '';
        diplomaCgpaController.text = s.diplomaCgpa?.toString() ?? '';
        currentCgpaController.text = s.currentCgpa.toString();
        emailController.text = s.email;
        phoneController.text = s.phone;
        cityController.text = s.city;

        setState(() {
          selectedUniversityId = s.universityId;
          selectedSemesterId = s.semesterId;
          selectedBranchId = s.branchId;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isUpdate = widget.student != null;

    return Scaffold(
      appBar: AppBar(title: Text(isUpdate ? APPBAR_TITLE_UPDATE : APPBAR_TITLE_ADD)),
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
                  selectedId: selectedUniversityId,
                  onChanged: (val) => setState(() => selectedUniversityId = val?.id),
                ),
                _dropdown<Semester>(
                  title: "Semester",
                  items: controller.semesters,
                  selectedId: selectedSemesterId,
                  onChanged: (val) => setState(() => selectedSemesterId = val?.id),
                ),
                _dropdown<Branch>(
                  title: "Branch",
                  items: controller.branches,
                  selectedId: selectedBranchId,
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

                    final student = SQLiteInsertAndUpdateModel(
                      id: widget.student?.id,
                      name: nameController.text,
                      enrollmentNumber: enrollController.text,
                      grade12: double.tryParse(grade12Controller.text),
                      diplomaCgpa: double.tryParse(diplomaCgpaController.text),
                      currentCgpa: double.tryParse(currentCgpaController.text) ?? 0.0,
                      email: emailController.text,
                      phone: phoneController.text,
                      city: cityController.text,
                      universityId: selectedUniversityId,
                      semesterId: selectedSemesterId,
                      branchId: selectedBranchId,
                    );

                    if (isUpdate) {
                      await controller.updateStudent(student);
                    } else {
                      await controller.insertStudent(student);
                    }

                    Get.back();
                  },
                  child: Text(isUpdate ? BTN_UPDATE : BTN_SUBMIT),
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
    required int? selectedId,
    required Function(T?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(labelText: title, border: OutlineInputBorder()),
        value: items.cast<dynamic>().firstWhere(
              (e) => e.id == selectedId,
          orElse: () => null,
        ),
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