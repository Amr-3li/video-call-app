class UserModel {
  final String id;
  final String name;
  final String email;
  final String ?imageUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
     this.imageUrl,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      imageUrl: json['imageUrl'] ??"",
    );
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'imageUrl': imageUrl};
  }
}
