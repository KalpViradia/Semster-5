import 'package:advance_flutter_lab/lab_5/4/utils/import_export.dart';

class GetxNavigateScreensAnimationsView extends StatelessWidget {
  const GetxNavigateScreensAnimationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE_SCREEN1)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => GetxNavigateScreensAnimationsSecondView(), transition: Transition.fade);
              },
              child: Text('Fade Transition'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => GetxNavigateScreensAnimationsSecondView(), transition: Transition.zoom);
              },
              child: Text('Zoom Transition'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => GetxNavigateScreensAnimationsSecondView(), transition: Transition.rightToLeftWithFade);
              },
              child: Text('Slide with Fade'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => GetxNavigateScreensAnimationsSecondView(), transition: Transition.cupertinoDialog);
              },
              child: Text('Cupertino Dialog'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => GetxNavigateScreensAnimationsSecondView(), transition: Transition.circularReveal);
              },
              child: Text('Circular Reveal'),
            ),
          ],
        ),
      ),
    );
  }
}