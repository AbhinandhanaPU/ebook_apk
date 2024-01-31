import 'package:ebook_apk/controller/books/search_controller.dart';
import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/utils/image_constant/image_constant.dart';
import 'package:ebook_apk/utils/style_constant/style_constant.dart';
import 'package:ebook_apk/view/widgets_reusable/booklist_vertical.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchFormController = TextEditingController();
  bool isSearched = false;
  @override
  Widget build(BuildContext context) {
    final searchController = Provider.of<BookSearchController>(context);

    return Scaffold(
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 230,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConstant.mainBlack,
                ColorConstant.mainBlack,
                ColorConstant.redBlack,
                ColorConstant.redBlack,
                ColorConstant.mainBlack,
                ColorConstant.mainBlack
              ],
              begin: Alignment.bottomLeft,
            ),
            image: DecorationImage(
              image: AssetImage(ImageConstant.homeScreen),
              fit: BoxFit.fill,
              opacity: 0.7,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Discover", style: styleConstant.containerMainText),
                Text(
                  "Search from more than 30 millioin books",
                  style: styleConstant.containerSubText,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: searchFormController,
                cursorColor: ColorConstant.mainBlack,
                decoration: InputDecoration(
                  hintText: "Book title",
                  constraints: BoxConstraints(maxWidth: 245, maxHeight: 55),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: styleConstant.errorBorder,
                  focusedBorder: styleConstant.focusedBorder,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (searchFormController.text.isNotEmpty) {
                    Provider.of<BookSearchController>(context, listen: false)
                        .fetchSearchData(
                            searchItem:
                                searchFormController.text.toLowerCase());
                    isSearched = true;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Type the book name in the search fileld ",
                            style: styleConstant.textStyleLS3),
                        backgroundColor: ColorConstant.themeColor,
                        showCloseIcon: true,
                      ),
                    );
                  }
                },
                child: Text("SEARCH", style: styleConstant.buttonText),
                style: styleConstant.buttonStyle,
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        Expanded(
            child: searchController.isLoading == true
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount:
                        searchController.apiSearchModel?.items?.length ?? 0,
                    itemBuilder: (context, index) => BookListVertical(
                      image: searchController.apiSearchModel?.items?[index]
                              .volumeInfo?.imageLinks?.smallThumbnail ??
                          "",
                      title: searchController.apiSearchModel?.items?[index]
                              .volumeInfo?.title ??
                          "",
                      author: searchController.apiSearchModel?.items?[index]
                              .volumeInfo?.authors?[0] ??
                          "",
                      publisher: searchController.apiSearchModel?.items?[index]
                              .volumeInfo?.publisher ??
                          "",
                      date: searchController.apiSearchModel?.items?[index]
                              .volumeInfo?.publishedDate ??
                          "",
                      pageNo: searchController.apiSearchModel?.items?[index]
                              .volumeInfo?.pageCount ??
                          0,
                      desc: searchController.apiSearchModel?.items?[index]
                              .volumeInfo?.description ??
                          "",
                      url: searchController.apiSearchModel?.items?[index]
                              .volumeInfo?.previewLink ??
                          '',
                      infoUrl: searchController.apiSearchModel?.items?[index]
                              .volumeInfo?.infoLink ??
                          '',
                    ),
                  ))
      ]),
    );
  }
}
