import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook_apk/model/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserManagement with ChangeNotifier {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final currentUser = FirebaseAuth.instance;

  createNewUser(UserModel user, context) async {
    try {
      await userCollection.add(user.toJson()).whenComplete(
          () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Success, Your account has been created."),
              )));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error, Something went wrong. Try again"),
      ));
      print(e);
    }
  }

  Future<UserModel> getUserDetails() async {
    final snapshot = await userCollection
        .where("uid", isEqualTo: currentUser.currentUser!.uid)
        .get();
    final userData = snapshot.docs.map((e) => UserModel.fromJson(e)).single;
    return userData;
  }
}
