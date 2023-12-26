import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/view/home_screen/booklist_vertical.dart';
import 'package:ebook_apk/view/liabrary_screen.dart/notes_tab.dart';
import 'package:ebook_apk/view/liabrary_screen.dart/shelf_tab.dart';
import 'package:flutter/material.dart';

class LiabraryScreen extends StatelessWidget {
  const LiabraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your Liabrary"),
          backgroundColor: ColorConstant.mainWhite,
          foregroundColor: ColorConstant.themeColor,
          elevation: 3,
          bottom: TabBar(
            tabs: [
              Tab(text: "Your books"),
              Tab(text: "Shelfes"),
              Tab(text: "Notes")
            ],
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 4,
            labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ColorConstant.themeColor),
          ),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(child: BookListVertical()),
          ShelfScreen(),
          NotesTab()
        ]),
      ),
    );
  }
}
