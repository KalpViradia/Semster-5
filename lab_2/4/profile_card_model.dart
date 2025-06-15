class ProfileModel {
  final List<Map<String, dynamic>> _users = [
    {
      "name": "User1",
      "email": "user1@gmail.com",
      "phone": "9876543210",
      "imageUrl": "https://i.pravatar.cc/150?img=1",
    }
  ];

  List<Map<String, dynamic>> getUsers() {
    return _users;
  }
}
