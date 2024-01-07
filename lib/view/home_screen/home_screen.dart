import 'package:ebook_apk/controller/book_controller.dart';
import 'package:ebook_apk/controller/category_controller.dart';
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
    await Provider.of<BookCategoryController>(context, listen: false)
        .fetchFantacyData();
    await Provider.of<BookCategoryController>(context, listen: false)
        .fetchHorrorData();
    await Provider.of<BookCategoryController>(context, listen: false)
        .fetchAdventureData();
    await Provider.of<BookCategoryController>(context, listen: false)
        .fetchRomanceData();
    await Provider.of<BookCategoryController>(context, listen: false)
        .fetchThirillerData();
  }

  @override
  Widget build(BuildContext context) {
    final newestController = Provider.of<NewestBookController>(context);
    final categoryController = Provider.of<BookCategoryController>(context);

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
      body: Padding(
        padding: const EdgeInsets.only(top: 22, left: 20),
        child: SingleChildScrollView(
          child: newestController.isLoading == true
              ? Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Latest release",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            newestController.apiResModel?.items?.length ?? 0,
                            (index) => BookListHoriz(
                                  title: newestController.apiResModel
                                          ?.items?[index].volumeInfo?.title
                                          .toString() ??
                                      "",
                                  image: newestController
                                          .apiResModel
                                          ?.items?[index]
                                          .volumeInfo
                                          ?.imageLinks
                                          ?.thumbnail ??
                                      "",
                                  author: newestController
                                          .apiResModel
                                          ?.items?[index]
                                          .volumeInfo
                                          ?.authors?[0]
                                          .toString() ??
                                      "",
                                  publisher: newestController.apiResModel
                                          ?.items?[index].volumeInfo?.publisher
                                          .toString() ??
                                      "",
                                  date: newestController
                                          .apiResModel
                                          ?.items?[index]
                                          .volumeInfo
                                          ?.publishedDate
                                          .toString() ??
                                      "",
                                  pageNo: newestController
                                          .apiResModel
                                          ?.items?[index]
                                          .volumeInfo
                                          ?.pageCount ??
                                      0,
                                  desc: newestController
                                          .apiResModel
                                          ?.items?[index]
                                          .volumeInfo
                                          ?.description
                                          .toString() ??
                                      "",
                                  url: newestController
                                          .apiResModel
                                          ?.items?[index]
                                          .accessInfo
                                          ?.webReaderLink ??
                                      '',
                                )),
                      ),
                    ),
                    Text(
                      "Fantasy",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          categoryController
                                  .apiResModelFantacy?.items?.length ??
                              0,
                          (index) => BookListHoriz(
                            title: categoryController.apiResModelFantacy
                                    ?.items?[index].volumeInfo?.title
                                    .toString() ??
                                "",
                            image: categoryController
                                    .apiResModelFantacy
                                    ?.items?[index]
                                    .volumeInfo
                                    ?.imageLinks
                                    ?.thumbnail ??
                                "",
                            author: categoryController.apiResModelFantacy
                                    ?.items?[index].volumeInfo?.authors?[0]
                                    .toString() ??
                                "",
                            publisher: categoryController.apiResModelFantacy
                                    ?.items?[index].volumeInfo?.publisher
                                    .toString() ??
                                "",
                            date: categoryController.apiResModelFantacy
                                    ?.items?[index].volumeInfo?.publishedDate
                                    .toString() ??
                                "",
                            pageNo: categoryController.apiResModelFantacy
                                    ?.items?[index].volumeInfo?.pageCount ??
                                0,
                            desc: categoryController.apiResModelFantacy
                                    ?.items?[index].volumeInfo?.description
                                    .toString() ??
                                "",
                            url: categoryController.apiResModelFantacy
                                    ?.items?[index].accessInfo?.webReaderLink ??
                                "",
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Horror",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          categoryController.apiResModelHorror?.items?.length ??
                              0,
                          (index) => BookListHoriz(
                            title: categoryController.apiResModelHorror
                                    ?.items?[index].volumeInfo?.title
                                    .toString() ??
                                "",
                            image: categoryController
                                    .apiResModelHorror
                                    ?.items?[index]
                                    .volumeInfo
                                    ?.imageLinks
                                    ?.thumbnail ??
                                "",
                            author: categoryController.apiResModelHorror
                                    ?.items?[index].volumeInfo?.authors?[0]
                                    .toString() ??
                                "",
                            publisher: categoryController.apiResModelHorror
                                    ?.items?[index].volumeInfo?.publisher
                                    .toString() ??
                                "",
                            date: categoryController.apiResModelHorror
                                    ?.items?[index].volumeInfo?.publishedDate
                                    .toString() ??
                                "",
                            pageNo: categoryController.apiResModelHorror
                                    ?.items?[index].volumeInfo?.pageCount ??
                                0,
                            desc: categoryController.apiResModelHorror
                                    ?.items?[index].volumeInfo?.description
                                    .toString() ??
                                "",
                            url: categoryController.apiResModelHorror
                                    ?.items?[index].accessInfo?.webReaderLink ??
                                "",
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Adventure",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          categoryController
                                  .apiResModelAdventure?.items?.length ??
                              0,
                          (index) => BookListHoriz(
                            title: categoryController.apiResModelAdventure
                                    ?.items?[index].volumeInfo?.title
                                    .toString() ??
                                "",
                            image: categoryController
                                    .apiResModelAdventure
                                    ?.items?[index]
                                    .volumeInfo
                                    ?.imageLinks
                                    ?.thumbnail ??
                                "",
                            author: categoryController.apiResModelAdventure
                                    ?.items?[index].volumeInfo?.authors?[0]
                                    .toString() ??
                                "",
                            publisher: categoryController.apiResModelAdventure
                                    ?.items?[index].volumeInfo?.publisher
                                    .toString() ??
                                "",
                            date: categoryController.apiResModelAdventure
                                    ?.items?[index].volumeInfo?.publishedDate
                                    .toString() ??
                                "",
                            pageNo: categoryController.apiResModelAdventure
                                    ?.items?[index].volumeInfo?.pageCount ??
                                0,
                            desc: categoryController.apiResModelAdventure
                                    ?.items?[index].volumeInfo?.description
                                    .toString() ??
                                "",
                            url: categoryController.apiResModelAdventure
                                    ?.items?[index].accessInfo?.webReaderLink ??
                                "",
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Romance",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          categoryController.apiResModelRom?.items?.length ?? 0,
                          (index) => BookListHoriz(
                            title: categoryController.apiResModelRom
                                    ?.items?[index].volumeInfo?.title
                                    .toString() ??
                                "",
                            image: categoryController
                                    .apiResModelRom
                                    ?.items?[index]
                                    .volumeInfo
                                    ?.imageLinks
                                    ?.thumbnail ??
                                "",
                            author: categoryController.apiResModelRom
                                    ?.items?[index].volumeInfo?.authors?[0]
                                    .toString() ??
                                "",
                            publisher: categoryController.apiResModelRom
                                    ?.items?[index].volumeInfo?.publisher
                                    .toString() ??
                                "",
                            date: categoryController.apiResModelRom
                                    ?.items?[index].volumeInfo?.publishedDate
                                    .toString() ??
                                "",
                            pageNo: categoryController.apiResModelRom
                                    ?.items?[index].volumeInfo?.pageCount ??
                                0,
                            desc: categoryController.apiResModelRom
                                    ?.items?[index].volumeInfo?.description
                                    .toString() ??
                                "",
                            url: categoryController.apiResModelRom
                                    ?.items?[index].accessInfo?.webReaderLink ??
                                "",
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Thriller",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          categoryController
                                  .apiResModelThriller?.items?.length ??
                              0,
                          (index) => BookListHoriz(
                            title: categoryController.apiResModelThriller
                                    ?.items?[index].volumeInfo?.title
                                    .toString() ??
                                "",
                            image: categoryController
                                    .apiResModelThriller
                                    ?.items?[index]
                                    .volumeInfo
                                    ?.imageLinks
                                    ?.thumbnail ??
                                "",
                            author: categoryController.apiResModelThriller
                                    ?.items?[index].volumeInfo?.authors?[0]
                                    .toString() ??
                                "",
                            publisher: categoryController.apiResModelThriller
                                    ?.items?[index].volumeInfo?.publisher
                                    .toString() ??
                                "",
                            date: categoryController.apiResModelThriller
                                    ?.items?[index].volumeInfo?.publishedDate
                                    .toString() ??
                                "",
                            pageNo: categoryController.apiResModelThriller
                                    ?.items?[index].volumeInfo?.pageCount ??
                                0,
                            desc: categoryController.apiResModelThriller
                                    ?.items?[index].volumeInfo?.description
                                    .toString() ??
                                "",
                            url: categoryController.apiResModelThriller
                                    ?.items?[index].accessInfo?.webReaderLink ??
                                "",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
