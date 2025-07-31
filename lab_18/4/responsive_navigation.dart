import 'utils/import_export.dart';

class ResponsiveNavigationPage extends StatefulWidget {
  const ResponsiveNavigationPage({super.key});

  @override
  State<ResponsiveNavigationPage> createState() => _ResponsiveNavigationPageState();
}

class _ResponsiveNavigationPageState extends State<ResponsiveNavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text('Home', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
    Center(child: Text('Settings', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  Widget _buildSidebar() {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: _selectedIndex == 0,
            onTap: () {
              Navigator.pop(context);
              _onItemTapped(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            selected: _selectedIndex == 1,
            onTap: () {
              Navigator.pop(context);
              _onItemTapped(1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            selected: _selectedIndex == 2,
            onTap: () {
              Navigator.pop(context);
              _onItemTapped(2);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.blue,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isTablet = screenWidth >= 600;

    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Navigation')),
      drawer: isTablet ? _buildSidebar() : null,
      body: _pages[_selectedIndex],
      bottomNavigationBar: isTablet ? null : _buildBottomNavigationBar(),
    );
  }
}
