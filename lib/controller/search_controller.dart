import 'dart:convert';

import 'package:ebook_apk/model/bookapi_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookSearchController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  BookApiModel? apiSearchModel;
  bool isLoading = false;

  Future fetchSearchData({required String searchItem}) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
      "https://www.googleapis.com/books/v1/volumes?q=$searchItem&key=AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA",
    );
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      apiSearchModel = BookApiModel.fromJson(decodedData);
    } else {
      print("api failed");
    }
    isLoading = false;

    notifyListeners();
  }
}
