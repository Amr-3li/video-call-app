class UserModel {
  final String id;
  final String name;
  final String email;
  final String? imageUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.imageUrl,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      imageUrl: json['imageUrl'] ?? "",
    );
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'imageUrl': imageUrl};
  }
}
