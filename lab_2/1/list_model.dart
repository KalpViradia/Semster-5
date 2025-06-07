class UserListModel {
  final List<Map> userList = [
    {
      "name": "User1",
      "age": 56,
      "isFavourite": false
    },
    {
      "name": "User2",
      "age": 26,
      "isFavourite": false
    },
    {
      "name": "User3",
      "age": 64,
      "isFavourite": false
    },
    {
      "name": "User4",
      "age": 36,
      "isFavourite": false
    },
    {
      "name": "User5",
      "age": 48,
      "isFavourite": false
    }
  ];

  List<dynamic> getUsers() => userList;

  void toggleFavourite(int index) => userList[index]["isFavourite"] = !userList[index]["isFavourite"];
}