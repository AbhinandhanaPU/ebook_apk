class UserModel {
  final String? id;
  final String name;
  final String email;
  final String password;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });
  toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
