import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook_apk/model/users.dart';
import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class UserManagement with ChangeNotifier {
  createNewUser(UserModel user, context) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .add(user.toJson())
          .whenComplete(
              () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Success, Your account has been crated."),
                    backgroundColor: ColorConstant.red.withOpacity(0.1),
                  )));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error, Something went wrong. Try again"),
        backgroundColor: ColorConstant.red.withOpacity(0.1),
      ));
      print(e);
    }
  }
}
