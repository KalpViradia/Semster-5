import 'utils/import_export.dart';

class ScreenSizePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Size'),
      ),
      body: Center(
        child: Text(
          'Width: ${screenWidth.toStringAsFixed(2)} px\n'
              'Height: ${screenHeight.toStringAsFixed(2)} px',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
