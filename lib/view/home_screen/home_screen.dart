import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/view/home_screen/booklist_horiz.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.themeColor,
        foregroundColor: ColorConstant.mainWhite,
        elevation: 10,
        shadowColor: ColorConstant.mainBlack,
        actions: [
          Icon(Icons.dark_mode_outlined, size: 30),
          SizedBox(width: 20)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BookListHoriz(title: "Latest Release"),
            BookListHoriz(title: "Novels"),
            BookListHoriz(title: "Fiction"),
          ],
        ),
      ),
    );
  }
}
