import 'package:ebook_apk/controller/book_controller.dart';
import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/view/home_screen/booklist_horiz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    await Provider.of<NewestBookController>(context, listen: false).fetchData();
  }

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
            BookListHoriz(headings: "Latest Release"),
            // BookListHoriz(headings: "Novels"),
            // BookListHoriz(headings: "Fiction"),
          ],
        ),
      ),
    );
  }
}
