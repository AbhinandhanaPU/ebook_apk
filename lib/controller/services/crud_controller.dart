import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CrudController with ChangeNotifier {
  final currentUser = FirebaseAuth.instance;

  // Reference to the Firestore collection
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

// function to add book details as subcollection
  Future<void> addBookCollection({
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
    // Query for the document with the specified uid
    QuerySnapshot querySnapshot = await usersCollection
        .where('uid', isEqualTo: currentUser.currentUser!.uid)
        .get();

    // Check if the document with the specified uid exists
    if (querySnapshot.docs.isNotEmpty) {
      // Get the reference to the document
      DocumentReference userDocument = querySnapshot.docs.first.reference;

      // Adding books a subcollection to the document of first collection
      await userDocument.collection('books').add({
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

      print('Subcollection added successfully!');
    } else {
      print('Document with uid Current uid not found.');
    }
  }

// delete data
  Future<void> deleteBookCollection({
    required String title,
  }) async {
    // Query for the document with the specified uid
    QuerySnapshot querySnapshot = await usersCollection
        .where('uid', isEqualTo: currentUser.currentUser!.uid)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Get the reference to the document
      DocumentReference userDocument = querySnapshot.docs.first.reference;

      // Reference to the subcollection
      CollectionReference subcollectionReference =
          userDocument.collection("books");

      // Query for the document with the specified title in the subcollection
      QuerySnapshot subcollectionQuery =
          await subcollectionReference.where('title', isEqualTo: title).get();

      if (subcollectionQuery.docs.isNotEmpty) {
        // Get the reference to the document in the subcollection
        DocumentReference documentToDelete =
            subcollectionQuery.docs.first.reference;

        // Delete the document from the subcollection
        await documentToDelete.delete();

        print('Document deleted from subcollection successfully!');
      } else {
        print('Document with title $title not found in subcollection.');
      }
    } else {
      print('Document with current uid not found.');
    }
  }
}
