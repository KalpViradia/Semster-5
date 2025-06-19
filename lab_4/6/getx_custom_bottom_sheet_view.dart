import 'package:advance_flutter_lab/lab_4/6/utils/import_export.dart';

class GetxCustomBottomSheetView extends StatelessWidget {
  const GetxCustomBottomSheetView({super.key});

  void showBottomSheetWithHeight(double height, Color color, String title) {
    Get.bottomSheet(
      Container(
        height: height,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 10),
            Text(
              'This bottom sheet will close automatically in 3 seconds.',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
      isDismissible: true,
    );

    // Auto close after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      if (Get.isBottomSheetOpen ?? false) {
        Get.back();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showBottomSheetWithHeight(
                    150, Colors.blue, 'Small Bottom Sheet');
              },
              child: Text(BTN_TEXT_SMALL),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showBottomSheetWithHeight(
                    300, Colors.green, 'Medium Bottom Sheet');
              },
              child: Text(BTN_TEXT_MEDIUM),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showBottomSheetWithHeight(
                    450, Colors.purple, 'Large Bottom Sheet');
              },
              child: Text(BTN_TEXT_LARGE),
            ),
          ],
        ),
      ),
    );
  }
}
