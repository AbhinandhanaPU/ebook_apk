import 'dart:convert';

import 'package:ebook_apk/model/bookapi_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookCategoryController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  BookApiModel? apiResModelFantacy;
  BookApiModel? apiResModelThriller;
  BookApiModel? apiResModelAdventure;
  BookApiModel? apiResModelHorror;
  BookApiModel? apiResModelRom;
  bool isLoading = false;

  Future fetchFantacyData() async {
    isLoading = true;
    notifyListeners();
    final urlFantacy = Uri.parse(
      "https://www.googleapis.com/books/v1/volumes?q=subject:fantasy&maxResults=40&download=epub&orderBy=newest&key=AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA",
    );
    final responseFantacy = await http.get(urlFantacy);
    print(responseFantacy.statusCode);
    if (responseFantacy.statusCode == 200) {
      decodedData = jsonDecode(responseFantacy.body);
      apiResModelFantacy = BookApiModel.fromJson(decodedData);
    } else {
      print("api failed");
    }
    isLoading = false;

    notifyListeners();
  }

  Future fetchThirillerData() async {
    isLoading = true;
    notifyListeners();
    final urlThiriller = Uri.parse(
      "https://www.googleapis.com/books/v1/volumes?q=subject:thriller&maxResults=40&download=epub&orderBy=newest&key=AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA",
    );
    final responseThiriller = await http.get(urlThiriller);
    print(responseThiriller.statusCode);
    if (responseThiriller.statusCode == 200) {
      decodedData = jsonDecode(responseThiriller.body);
      apiResModelThriller = BookApiModel.fromJson(decodedData);
    } else {
      print("api failed");
    }
    isLoading = false;

    notifyListeners();
  }

  Future fetchAdventureData() async {
    isLoading = true;
    notifyListeners();
    final urlAdventure = Uri.parse(
      "https://www.googleapis.com/books/v1/volumes?q=subject:adventure&maxResults=40&download=epub&orderBy=newest&key=AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA",
    );
    final responseAdventure = await http.get(urlAdventure);
    print(responseAdventure.statusCode);
    if (responseAdventure.statusCode == 200) {
      decodedData = jsonDecode(responseAdventure.body);
      apiResModelAdventure = BookApiModel.fromJson(decodedData);
    } else {
      print("api failed");
    }
    isLoading = false;

    notifyListeners();
  }

  Future fetchHorrorData() async {
    isLoading = true;
    notifyListeners();
    final urlRomance = Uri.parse(
      "https://www.googleapis.com/books/v1/volumes?q=subject:romance&maxResults=40&download=epub&orderBy=newest&key=AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA",
    );
    final responseRomance = await http.get(urlRomance);
    print(responseRomance.statusCode);
    if (responseRomance.statusCode == 200) {
      decodedData = jsonDecode(responseRomance.body);
      apiResModelHorror = BookApiModel.fromJson(decodedData);
    } else {
      print("api failed");
    }
    isLoading = false;

    notifyListeners();
  }

  Future fetchRomanceData() async {
    isLoading = true;
    notifyListeners();
    final urlRomance = Uri.parse(
      "https://www.googleapis.com/books/v1/volumes?q=subject:Romance&maxResults=40&download=epub&orderBy=newest&key=AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA",
    );
    final responseRomance = await http.get(urlRomance);
    print(responseRomance.statusCode);
    if (responseRomance.statusCode == 200) {
      decodedData = jsonDecode(responseRomance.body);
      apiResModelRom = BookApiModel.fromJson(decodedData);
    } else {
      print("api failed");
    }
    isLoading = false;

    notifyListeners();
  }
}
