class ProfileModel {
  final List<Map<String, dynamic>> _users = [
    {
      "name": "User1",
      "email": "user1@gmail.com",
      "phone": "9876543210",
      "imageUrl": "https://i.pravatar.cc/150?img=1",
    },
    {
      "name": "User2",
      "email": "user2@gmail.com",
      "phone": "9123456780",
      "imageUrl": "https://i.pravatar.cc/150?img=2",
    },
    {
      "name": "User3",
      "email": "user3@gmail.com",
      "phone": "9988776655",
      "imageUrl": "https://i.pravatar.cc/150?img=3",
    },
  ];

  List<Map<String, dynamic>> getUsers() {
    return _users;
  }
}
