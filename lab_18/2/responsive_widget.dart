import 'utils/import_export.dart';

class ResponsiveWidgetPage extends StatelessWidget {
  const ResponsiveWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    Widget displayedWidget = screenWidth < 600
        ? const SmallScreenWidget()
        : const LargeScreenWidget();

    return Scaffold(
      appBar: AppBar(title: const Text('Responsive UI')),
      body: Center(child: displayedWidget),
    );
  }
}

class SmallScreenWidget extends StatelessWidget {
  const SmallScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.phone_android, size: 80, color: Colors.green),
        SizedBox(height: 20),
        Text('Small Screen', style: TextStyle(fontSize: 24)),
      ],
    );
  }
}

class LargeScreenWidget extends StatelessWidget {
  const LargeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.desktop_windows, size: 80, color: Colors.blue),
        SizedBox(width: 20),
        Text('Large Screen', style: TextStyle(fontSize: 28)),
      ],
    );
  }
}
