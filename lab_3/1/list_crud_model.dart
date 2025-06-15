class ListCrudModel {
  List<Map<String, dynamic>> userList = [];

  List<Map<String, dynamic>> getUsers() {
    return userList;
  }

  Map<String, dynamic> getUserById(int name) {
    return userList.firstWhere((user) => user['name'] == name);
  }

  void addUser(String name, String email) {
    Map<String, dynamic> user = {
      'name': name,
      'email': email,
    };
    userList.add(user);
  }

  void updateUserById(int index, String name, String email) {
    userList[index] = {
      'name': name,
      'email': email,
    };
  }

  void deleteUser(String name) {
    userList.removeWhere((user) => user['name'] == name);
  }
}
