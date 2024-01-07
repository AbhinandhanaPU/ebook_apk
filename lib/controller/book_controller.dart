import 'dart:convert';

import 'package:ebook_apk/model/bookapi_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class NewestBookController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  BookApiModel? apiResModel;
  bool isLoading = false;

  Future fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=maxResults=40&download=epub&orderBy=newest&key=AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA");
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      apiResModel = BookApiModel.fromJson(decodedData);
    } else {
      print("api failed");
    }
    isLoading = false;

    notifyListeners();
  }

  // Function to launch a URL
  // Future<void> launchURL(String url) async {
  //   try {
  //     if (await canLaunchUrl(Uri.parse(url))) {
  //       await launchUrl(Uri.parse(url));
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   } catch (e) {
  //     print('Error launching URL: $e');
  //   }
  //   notifyListeners();
  // }
  Future openUrl(String urllink) async {
    var url = Uri.parse(urllink);

    try {
      await launchUrl(url);
    } catch (e) {
      return e;
    }
  }

  // void shareText({String textToShare = ""}) {
  //   try {
  //     Share.share(textToShare);
  //   } catch (e) {
  //     print('Error sharing: $e');
  //   }
  //   notifyListeners();
  // }
}
