import 'package:advance_flutter_lab/lab_7/2/utils/import_export.dart';

class GetXRxListItemView extends StatelessWidget {
  GetXRxListItemView({super.key});

  final nameController = TextEditingController();
  final rollController = TextEditingController();
  final GetXRxListItemController controller = Get.put(GetXRxListItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE)),
      body: GetX<GetXRxListItemController>(
        builder: (controller) {
          final list = controller.list;

          if (list.isEmpty) {
            return Center(child: Text(MSG_NO_DATA));
          }

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final student = list[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(student.name ?? 'No Name'),
                  subtitle: Text('Roll Number: ${student.rollNumber}'),
                  trailing: Obx(() => IconButton(
                    icon: Icon(
                      student.isFavourite.value ? Icons.favorite : Icons.favorite_border,
                      color: student.isFavourite.value ? Colors.red : Colors.grey,
                    ),
                    onPressed: () => controller.toggleFavourite(index),
                  )),
                ),
              );
            },
          );
        },
      ),
    );
  }
}