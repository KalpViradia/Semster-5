import 'package:advance_flutter_lab/lab_3/1/utils/import_export.dart';

class ListCrudView extends StatefulWidget {
  const ListCrudView({super.key});

  @override
  State<ListCrudView> createState() => _ListCrudViewState();
}

class _ListCrudViewState extends State<ListCrudView> {
  final ListCrudController _listCrudController = ListCrudController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _openUserDialog({int? index}) {
    if (index != null) {
      final user = _listCrudController.getUsers()[index];
      _nameController.text = user['name'];
      _emailController.text = user['email'];
    } else {
      _nameController.clear();
      _emailController.clear();
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(index == null ? 'Add User' : 'Edit User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              if (index == null) {
                _listCrudController.addUser(
                  _nameController.text,
                  _emailController.text,
                );
              } else {
                _listCrudController.updateUserById(
                  index,
                  _nameController.text,
                  _emailController.text,
                );
              }
              setState(() {});
              Navigator.pop(context);
            },
            child: Text(index == null ? 'Add' : 'Update'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final users = _listCrudController.getUsers();

    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE)),
      body: ListView.builder(
        itemCount: users.length,
          itemBuilder: (_, index) {
            final user = users[index];
            return ListTile(
              title: Text(user['name']),
              subtitle: Text(user['email']),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _openUserDialog(index: index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _listCrudController.deleteUser(user['name']);
                      setState(() {});
                    },
                  ),
                ],
              ),
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openUserDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
