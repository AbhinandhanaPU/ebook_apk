import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/utils/image_constant/image_constant.dart';
import 'package:ebook_apk/view/widgets_reusable/booklist_vertical.dart';
import 'package:flutter/material.dart';

class LiabraryScreen extends StatefulWidget {
  const LiabraryScreen({super.key});

  @override
  State<LiabraryScreen> createState() => _LiabraryScreenState();
}

class _LiabraryScreenState extends State<LiabraryScreen> {
  CollectionReference bookCollection =
      FirebaseFirestore.instance.collection('books');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            gradient: LinearGradient(
              colors: [
                ColorConstant.mainBlack,
                ColorConstant.redBlack,
                ColorConstant.mainBlack
              ],
              begin: Alignment.bottomLeft,
            ),
            image: DecorationImage(
              image: AssetImage(ImageConstant.bookStore),
              fit: BoxFit.fill,
              opacity: 0.7,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Bookshelf",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.mainWhite),
                ),
                Text(
                  "",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.mainWhite),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder(
            stream: bookCollection.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot books = snapshot.data!.docs[index];
                    return BookListVertical(
                      title: "${books["title"]}",
                      image: "${books["image"]}",
                      author: "${books["author"]}",
                      publisher: "${books["publisher"]}",
                      date: "${books["publisheddate"]}",
                      pageNo: books['pageno'],
                      desc: "${books["desc"]}",
                      url: "${books["previewurl"]}",
                      infoUrl: "${books["infourl"]}",
                    );
                  },
                );
              } else {
                return Center(
                  child: Text("no books Found"),
                );
              }
            },
          ),
        )
      ]),
    );
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
  }
}
