import 'package:ebook_apk/controller/search_controller.dart';
import 'package:ebook_apk/utils/color_constant/color_constant.dart';
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
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: searchFormController,
                cursorColor: ColorConstant.mainBlack,
                decoration: InputDecoration(
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
                      EdgeInsets.symmetric(horizontal: 25, vertical: 11)),
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
            child: isSearched == false
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Search",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      SizedBox(width: 10),
                      Icon(
                        Icons.search,
                        weight: 30,
                      )
                    ],
                  )
                : searchController.isLoading == true
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
                          publisher: searchController.apiSearchModel
                                  ?.items?[index].volumeInfo?.publisher ??
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
                          infoUrl: searchController.apiSearchModel
                                  ?.items?[index].volumeInfo?.infoLink ??
                              '',
                        ),
                      ))
      ]),
    );
  }
}
