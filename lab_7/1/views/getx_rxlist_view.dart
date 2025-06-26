import 'package:advance_flutter_lab/lab_7/1/utils/import_export.dart';

class GetXRxListView extends StatelessWidget {
  const GetXRxListView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE)),

      body: GetX<GetXRxListController>(
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}