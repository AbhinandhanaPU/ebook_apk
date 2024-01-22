import 'package:ebook_apk/controller/books/search_controller.dart';
import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/utils/image_constant/image_constant.dart';
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
                Text(
                  "Discover",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.mainWhite),
                ),
                Text(
                  "Search from more than 30 millioin books",
                  style:
                      TextStyle(fontSize: 18, color: ColorConstant.mainWhite),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: searchFormController,
                cursorColor: ColorConstant.mainBlack,
                decoration: InputDecoration(
                  hintText: "Book title",
                  constraints: BoxConstraints(maxWidth: 250, maxHeight: 60),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(width: 2.5, color: ColorConstant.red)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          width: 2.5, color: ColorConstant.themeColor)),
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
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        backgroundColor: ColorConstant.themeColor,
                        showCloseIcon: true,
                      ),
                    );
                  }
                },
                child: Text(
                  "SEARCH",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorConstant.mainWhite,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(ColorConstant.themeColor),
                  elevation: MaterialStatePropertyAll(10),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 25, vertical: 12)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
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
