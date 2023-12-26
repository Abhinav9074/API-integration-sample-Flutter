class UserModel{
  final int id;
  final String title;
  final int userId;
  final String body;

  UserModel(
      {required this.id,
      required this.title,
      required this.userId,
      required this.body,});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id']as int,
        title: json['title'],
        userId: json['userId']as int,
        body: json['body'],);
  }
}
