import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String name;
  final String email;

  UserModel({
    this.uid,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(QueryDocumentSnapshot json) => UserModel(
        name: json["name"],
        email: json["email"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "email": email,
      };
}
