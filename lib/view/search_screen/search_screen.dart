import 'package:ebook_apk/controller/search_controller.dart';
import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/view/home_screen/booklist_vertical.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchFormController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 40, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 250,
                  height: 50,
                  child: TextField(
                    controller: searchFormController,
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              width: 2.5, color: ColorConstant.themeColor)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<BookSearchController>(context, listen: false)
                        .fetchSearchData(
                            searchItem:
                                searchFormController.text.toLowerCase());
                  },
                  child: Text(
                    "SEARCH",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.mainWhite,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(ColorConstant.themeColor),
                    elevation: MaterialStatePropertyAll(10),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 25, vertical: 11)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          BookListVertical(title: "books on your preferences")
        ]),
      ),
    );
  }
}
