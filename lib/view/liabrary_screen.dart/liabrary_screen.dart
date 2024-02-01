import 'package:ebook_apk/controller/services/crud_controller.dart';
import 'package:ebook_apk/model/books.dart';
import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/utils/image_constant/image_constant.dart';
import 'package:ebook_apk/utils/style_constant/style_constant.dart';
import 'package:ebook_apk/view/widgets_reusable/booklist_vertical.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header section with a decorative background and text
          _buildHeader(),

          SizedBox(height: 20),

          // displays library bookmark list
          Expanded(
            child: _buildLibraryList(),
          ),
        ],
      ),
    );
  }

  // Widget to display header container
  Widget _buildHeader() {
    return Container(
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
              style: styleConstant.containerMainText,
            ),
            Text(
              "All your saved books are here",
              style: styleConstant.containerSubText,
            ),
          ],
        ),
      ),
    );
  }

  // Widget to display Library List
  Widget _buildLibraryList() {
    return Consumer<CrudController>(
      builder: (context, crudController, child) {
        return StreamBuilder<List<BooksModel>>(
          stream: crudController.readBookCollectionStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error : ${snapshot.error}"));
            } else if (!snapshot.hasData) {
              return Center(child: Text("No books found"));
            } else {
              List<BooksModel> booksList = snapshot.data ?? [];
              return ListView.builder(
                itemCount: booksList.length,
                itemBuilder: (context, index) {
                  return BookListVertical(
                    title: booksList[index].title,
                    image: booksList[index].image,
                    author: booksList[index].author,
                    publisher: booksList[index].publisher,
                    date: booksList[index].publisheddate,
                    pageNo: booksList[index].pageno,
                    desc: booksList[index].desc,
                    url: booksList[index].previewurl,
                    infoUrl: booksList[index].infourl,
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}
