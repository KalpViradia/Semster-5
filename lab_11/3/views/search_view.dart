import 'package:second/lab_11/3/utils/import_export.dart';

class ApiSearchView extends StatelessWidget {
  const ApiSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApiSearchController());

    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) => controller.filterData(value),
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.dataList.isEmpty) {
                return const Center(child: Text('No data found.'));
              }

              return ListView.builder(
                itemCount: controller.dataList.length,
                itemBuilder: (context, index) {
                  final item = controller.dataList[index];
                  return ListTile(
                    title: Text(item.name ?? 'No Name'),
                    subtitle: Text(item.description ?? 'No Description'),
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