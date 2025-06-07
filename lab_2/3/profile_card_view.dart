import 'package:advance_flutter_lab/lab_2/3/utils/import_export.dart';

class ProfileView extends StatelessWidget {
  final ProfileController _profileController = ProfileController();

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final profiles = _profileController.getUsers();

    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE),
      ),
      body: profiles.isEmpty
          ? const Center(child: Text('No profiles available'))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 6,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profile['imageUrl']),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    profile['name'],
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    profile['email'],
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    profile['phone'],
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
