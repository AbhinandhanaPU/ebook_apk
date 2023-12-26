import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/view/home_screen/booklist_vertical.dart';
import 'package:flutter/material.dart';

class LiabraryScreen extends StatelessWidget {
  const LiabraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2,
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
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                color: ColorConstant.activegrey,
                width: 50,
              );
            },
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                color: ColorConstant.activegrey,
                width: 50,
              );
            },
          )
        ]),
      ),
    );
  }
}
