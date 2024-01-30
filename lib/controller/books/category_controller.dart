import 'dart:convert';
import 'package:ebook_apk/model/bookapi_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookCategoryController with ChangeNotifier {
  Map<String, BookApiModel?> categoryData = {};
  bool isLoading = false;

  Future<void> _fetchData(String category) async {
    isLoading = true;
    notifyListeners();

    final url = await Uri.parse(
      "https://www.googleapis.com/books/v1/volumes?q=subject:$category&maxResults=40&download=epub&orderBy=newest&key=AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA",
    );

    try {
      final response = await http.get(url);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        categoryData[category] = BookApiModel.fromJson(decodedData);
      } else {
        print("API failed for category: $category");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchFantasyData() async {
    await _fetchData("fantasy");
  }

  Future<void> fetchThrillerData() async {
    await _fetchData("thriller");
  }

  Future<void> fetchAdventureData() async {
    await _fetchData("adventure");
  }

  Future<void> fetchHorrorData() async {
    await _fetchData("horror");
  }

  Future<void> fetchRomanceData() async {
    await _fetchData("romance");
  }
}
