import 'package:advance_flutter_lab/lab_2/1/utils/import_export.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  UserListController _listController = UserListController();

  @override
  Widget build(BuildContext context) {
    final userList = _listController.userList();
    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_TITLE),
      ),
      body: Container(
        child: ListView.builder(itemBuilder: (context, index) {
          return ListTile(
            title: Text(userList[index]["name"]),
            subtitle: Text(userList[index]["age"].toString()),
            trailing: IconButton(onPressed: () {
              setState(() {
                _listController.toggleFavourite(index);
              });
            }, icon: Icon(
             userList[index]["isFavourite"] ? Icons.favorite : Icons.favorite_border,
             color: Colors.red,
            )),
          );
        },
        itemCount: userList.length,),
      ),
    );
  }
}
