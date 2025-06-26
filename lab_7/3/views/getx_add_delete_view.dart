import 'package:advance_flutter_lab/lab_7/3/utils/import_export.dart';

class GetXAddDeleteView extends StatelessWidget {
  GetXAddDeleteView({super.key});

  final nameController = TextEditingController();
  final rollController = TextEditingController();
  final GetXAddDeleteController controller = Get.put(GetXAddDeleteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: rollController,
                  decoration: const InputDecoration(labelText: 'Roll Number'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    final name = nameController.text.trim();
                    final roll = int.tryParse(rollController.text.trim());

                    if (name.isNotEmpty && roll != null) {
                      controller.addStudent(name, roll);
                      nameController.clear();
                      rollController.clear();
                    }
                  },
                  child: Text(BTN_ADD_STUDENT),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: Obx(() {
              final list = controller.studentList;

              if (list.isEmpty) {
                return Center(child: Text(MSG_NO_DATA));
              }

              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final student = list[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      title: Text(student.name ?? 'No Name'),
                      subtitle: Text('Roll Number: ${student.rollNumber}'),
                      leading: Obx(() => IconButton(
                        icon: Icon(
                          student.isFavourite.value
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: student.isFavourite.value ? Colors.red : Colors.grey,
                        ),
                        onPressed: () => controller.toggleFavourite(index),
                      )),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => controller.deleteStudent(index),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}