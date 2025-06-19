import 'package:advance_flutter_lab/lab_4/3/utils/import_export.dart';

class GetxBottomSheetView extends StatelessWidget {
  const GetxBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.bottomSheet(BottomSheet(
                onClosing: () {
                  Get.back();
                },
                builder: (context) {
                  return Container(
                      height: 250,
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'List View: ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Icon(Icons.list),
                                    title: Text('Item ${index + 1}'),
                                  );
                                },
                                itemCount: 5,
                              ),
                            )
                          ]));
                },
              ));
            },
            child: Text(BTN_TEXT)),
      ),
    );
  }
}
