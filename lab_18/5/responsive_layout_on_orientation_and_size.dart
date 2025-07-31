import 'utils/import_export.dart';

class ResponsiveLayoutOnOrientationAndSizePage extends StatelessWidget {
  const ResponsiveLayoutOnOrientationAndSizePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final Orientation orientation = MediaQuery.of(context).orientation;

    final bool isWide = width >= 600 && orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(title: const Text("Responsive Layout")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isWide ? _buildGridLayout() : _buildListLayout(),
      ),
    );
  }

  Widget _buildListLayout() {
    return ListView(
      children: List.generate(6, (index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.widgets),
            title: Text('Item ${index + 1}'),
            subtitle: const Text('This is a description.'),
          ),
        );
      }),
    );
  }

  Widget _buildGridLayout() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 3,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.widgets),
            title: Text('Item ${index + 1}'),
            subtitle: const Text('This is a description.'),
          ),
        );
      },
    );
  }
}
