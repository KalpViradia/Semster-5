import 'utils/import_export.dart';

class ResponsivePaddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    double horizontalPadding;
    if (screenWidth > 1000) {
      horizontalPadding = 100;
    } else if (screenWidth > 600) {
      horizontalPadding = 40;
    } else {
      horizontalPadding = 16;
    }

    return Scaffold(
      appBar: AppBar(title: Text('Responsive Padding')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20),
        child: Container(
          color: Colors.blueAccent,
          child: Text(
            'This container has responsive padding!\n\n'
                'Screen Width: ${screenWidth.toStringAsFixed(2)} px\n'
                'Horizontal Padding: $horizontalPadding px',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
