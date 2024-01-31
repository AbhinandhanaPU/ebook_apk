import 'package:ebook_apk/controller/books/book_controller.dart';
import 'package:ebook_apk/controller/books/category_controller.dart';
import 'package:ebook_apk/utils/image_constant/image_constant.dart';
import 'package:ebook_apk/utils/style_constant/style_constant.dart';
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

  Future<void> getData() async {
    final newestController =
        Provider.of<NewestBookController>(context, listen: false);
    final categoryController =
        Provider.of<BookCategoryController>(context, listen: false);

    await newestController.fetchData();
    await categoryController.fetchFantasyData();
    await categoryController.fetchHorrorData();
    await categoryController.fetchAdventureData();
    await categoryController.fetchRomanceData();
    await categoryController.fetchThrillerData();
  }

  @override
  Widget build(BuildContext context) {
    final newestController = Provider.of<NewestBookController>(context);
    final categoryController = Provider.of<BookCategoryController>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          child: newestController.isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(ImageConstant.bookStore),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Explore Books",
                              style: styleConstant.containerMainText,
                            ),
                            Text(
                              "",
                              style: styleConstant.containerSubText,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Latest release", style: styleConstant.textStyle),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var item
                              in newestController.apiResModel?.items ?? [])
                            BookListHoriz(
                              title: item.volumeInfo?.title?.toString() ?? "",
                              image:
                                  item.volumeInfo?.imageLinks?.thumbnail ?? "",
                              author:
                                  item.volumeInfo?.authors?[0]?.toString() ??
                                      "",
                              publisher:
                                  item.volumeInfo?.publisher?.toString() ?? "",
                              date:
                                  item.volumeInfo?.publishedDate?.toString() ??
                                      "",
                              pageNo: item.volumeInfo?.pageCount ?? 0,
                              desc: item.volumeInfo?.description?.toString() ??
                                  "",
                              url: item.volumeInfo?.previewLink ?? "",
                              infoUrl: item.volumeInfo?.infoLink ?? "",
                            ),
                        ],
                      ),
                    ),
                    for (var category in categoryController.categoryData.keys)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.capitalizeFirstLetter(),
                            style: styleConstant.textStyle,
                          ),
                          SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (var item in categoryController
                                        .categoryData[category]!.items ??
                                    [])
                                  BookListHoriz(
                                    title: item.volumeInfo?.title?.toString() ??
                                        "",
                                    image: item.volumeInfo?.imageLinks
                                            ?.thumbnail ??
                                        "",
                                    author: item.volumeInfo?.authors?[0]
                                            ?.toString() ??
                                        "",
                                    publisher: item.volumeInfo?.publisher
                                            ?.toString() ??
                                        "",
                                    date: item.volumeInfo?.publishedDate
                                            ?.toString() ??
                                        "",
                                    pageNo: item.volumeInfo?.pageCount ?? 0,
                                    desc: item.volumeInfo?.description
                                            ?.toString() ??
                                        "",
                                    url: item.volumeInfo?.previewLink ?? "",
                                    infoUrl: item.volumeInfo?.infoLink ?? "",
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
