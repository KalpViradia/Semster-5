import 'utils/import_export.dart';

class DynamicFontPage extends StatelessWidget {
  const DynamicFontPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    double fontSize;
    if (screenWidth >= 900) {
      fontSize = 32;
    } else if (screenWidth >= 600) {
      fontSize = 24;
    } else {
      fontSize = 18;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic Font Size')),
      body: Center(
        child: Text(
          'Responsive Text\n(Screen width: ${screenWidth.toStringAsFixed(0)} px)',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
