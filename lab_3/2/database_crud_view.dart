import 'package:advance_flutter_lab/lab_3/2/utils/import_export.dart';

class DatabaseView extends StatefulWidget {
  const DatabaseView({Key? key}) : super(key: key);

  @override
  _DatabaseViewState createState() => _DatabaseViewState();
}

class _DatabaseViewState extends State<DatabaseView> {
  final _controller = DatabaseController();
  final _nameController = TextEditingController();
  final _cityController = TextEditingController();
  final _genderController = TextEditingController();

  List<DatabaseModel> _users = [];
  int? _editingUserId;

  bool get _isEditing => _editingUserId != null;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final users = await _controller.getUsers();
    setState(() {
      _users = users;
    });
  }

  Future<void> _saveUser() async {
    if (_nameController.text.isEmpty || _cityController.text.isEmpty || _genderController.text.isEmpty) return;

    final user = DatabaseModel(
      uid: _editingUserId,
      name: _nameController.text,
      city: _cityController.text,
      gender: _genderController.text,
    );

    if (_isEditing) {
      await _controller.updateUser(user);
    } else {
      await _controller.addUser(user);
    }

    _clearInputs();
    await _loadUsers();
  }

  void _clearInputs() {
    _nameController.clear();
    _cityController.clear();
    _genderController.clear();
    _editingUserId = null;
  }

  Future<void> _deleteUser(int uid) async {
    await _controller.deleteUser(uid);
    await _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(labelText: 'City'),
            ),
            TextField(
              controller: _genderController,
              decoration: const InputDecoration(labelText: 'Gender'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveUser,
              child: Text(_isEditing ? 'Update User' : 'Add User'),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return ListTile(
                    title: Text('${user.name} - ${user.city}'),
                    subtitle: Text('Gender: ${user.gender}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            setState(() {
                              _editingUserId = user.uid;
                              _nameController.text = user.name;
                              _cityController.text = user.city;
                              _genderController.text = user.gender;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteUser(user.uid!),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
