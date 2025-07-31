import 'utils/import_export.dart';

class OrientationLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    final bool isPortrait = orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(title: Text('Orientation Layout')),
      body: isPortrait
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.phone_android, size: 80, color: Colors.green),
          SizedBox(height: 20),
          Text('Portrait Mode', style: TextStyle(fontSize: 24)),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.desktop_windows, size: 80, color: Colors.blue),
          SizedBox(width: 20),
          Text('Landscape Mode', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
