import 'package:ebook_apk/view/liabrary_screen.dart/note_tab/notecard_widget.dart';
import 'package:flutter/material.dart';

class NotesTab extends StatelessWidget {
  const NotesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: ListView.separated(
          itemCount: 2,
          separatorBuilder: (context, index) => SizedBox(height: 30),
          itemBuilder: (context, index) {
            return noteCardWidget();
          },
        ),
      ),
    );
  }
}
  //  DefaultTabController(
    //   length: 3,
    //   initialIndex: 0,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text("Your Liabrary"),
    //       backgroundColor: ColorConstant.mainWhite,
    //       foregroundColor: ColorConstant.themeColor,
    //       elevation: 3,
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(text: "My Readings"),
    //           Tab(text: "My Bookshelf"),
    //           Tab(text: "Notes")
    //         ],
    //         indicatorSize: TabBarIndicatorSize.tab,
    //         indicatorWeight: 4,
    //         labelStyle: TextStyle(
    //             fontSize: 16,
    //             fontWeight: FontWeight.w500,
    //             color: ColorConstant.themeColor),
    //       ),
    //     ),
    //     body: TabBarView(children: [
    //       // SingleChildScrollView(child: BookListVertical()),
    //       ShelfScreen(),
    //       NotesTab()
    //     ]),
    //   ),
    // );
