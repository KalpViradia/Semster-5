import 'package:advance_flutter_lab/lab_10/4/utils/import_export.dart';

class SQLiteLazyLoadingView extends StatelessWidget {
  final controller = Get.put(SQLiteLazyLoadingController());
  final ScrollController scrollController = ScrollController();

  SQLiteLazyLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE_VIEW)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by name or enrollment number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                controller.searchQuery.value = value;
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              final students = controller.filteredStudents;

              if (students.isEmpty && !controller.isLoading.value) {
                return Center(
                  child: Text(
                    MSG_NO_DATA,
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                controller: scrollController,
                itemCount: students.length + 1,
                itemBuilder: (context, index) {
                  if (index < students.length) {
                    final s = students[index];
                    return ListTile(
                      title: Text(s.name),
                      subtitle: Text(s.enrollmentNumber),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () =>
                                Get.to(() => SQLiteLazyLoadingFormView(student: s)),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              await controller.deleteStudent(s.id!);
                            },
                          ),
                        ],
                      ),
                    );
                  } else if (controller.hasMoreData.value) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.to(() => const SQLiteLazyLoadingFormView()),
      ),
    );
  }
}