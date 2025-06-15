import 'package:advance_flutter_lab/lab_2/4/utils/import_export.dart';

class ProfileView extends StatelessWidget {
  final ProfileController _profileController = ProfileController();

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final profiles = _profileController.getUsers();

    if (profiles.isEmpty) {
      return const Scaffold(
        body: Center(child: Text('No profiles available')),
      );
    }

    final profile = profiles[0]; // Show only the first profile

    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profile['imageUrl']),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    profile['name'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    profile['email'],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    profile['phone'],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Action can go here
                    },
                    icon: const Icon(Icons.message),
                    label: const Text("Send Message"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
