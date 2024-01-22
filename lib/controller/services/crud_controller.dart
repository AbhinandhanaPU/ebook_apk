import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CrudController with ChangeNotifier {
  CollectionReference users = FirebaseFirestore.instance.collection('books');

//  add data
  addUser({
    required String title,
    required String image,
    required String author,
    required String publisher,
    required String date,
    required int pageNo,
    required String desc,
    required String url,
    required String infoUrl,
  }) async {
    await users.add({
      "title": title,
      "image": image,
      "author": author,
      "publisher": publisher,
      "publisheddate": date,
      "pageno": pageNo,
      "desc": desc,
      "previewurl": url,
      "infourl": infoUrl,
    });
  }

// delete data
  deleteUser({
    required String id,
  }) async {
    await users.doc(id).delete();
  }
}
