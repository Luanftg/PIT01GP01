class UserModel {
  final String userId;
  final String name;
  final String image;
  UserModel({
    required this.userId,
    required this.name,
    required this.image,
  });

  factory UserModel.fromJson(Map json) {
    return UserModel(
      userId: json['userId'],
      name: json['name'],
      image: json['image'],
    );
  }
}
