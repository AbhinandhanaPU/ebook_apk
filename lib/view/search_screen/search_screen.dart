import 'package:ebook_apk/controller/books/search_controller.dart';
import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/utils/image_constant/image_constant.dart';
import 'package:ebook_apk/utils/style_constant/style_constant.dart';
import 'package:ebook_apk/view/widgets_reusable/booklist_vertical.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchFormController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final searchController = Provider.of<BookSearchController>(context);

    return Scaffold(
      body: Column(
        children: [
          // Header section with a decorative background and text
          _buildHeader(),

          // Search textfield and button
          _buildSearchBar(context),

          // Display search results
          _buildSearchResults(searchController),
        ],
      ),
    );
  }

  // Widget to display header section
  Widget _buildHeader() {
    return Container(
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
              "Search from more than 30 million books",
              style: styleConstant.containerSubText,
            ),
          ],
        ),
      ),
    );
  }

  // Widget to display search bar
  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 8, right: 8),
      child: Form(
        key: _formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSearchTextField(),
            SizedBox(width: 5),
            _buildSearchButton(context),
          ],
        ),
      ),
    );
  }

  // Widget to display search textfield
  Widget _buildSearchTextField() {
    return Expanded(
      child: TextFormField(
        controller: searchFormController,
        cursorColor: ColorConstant.mainBlack,
        decoration: InputDecoration(
          hintText: "Book title",
          constraints: BoxConstraints(maxHeight: 50),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: styleConstant.errorBorder,
          focusedBorder: styleConstant.focusedBorder,
        ),
        validator: MultiValidator([
          RequiredValidator(
              errorText: 'Type the book name in the search field'),
        ]),
      ),
    );
  }

  // Widget to display search button
  Widget _buildSearchButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          Provider.of<BookSearchController>(context, listen: false)
              .fetchSearchData(
                  searchItem: searchFormController.text.toLowerCase());
        }
      },
      child: Text("SEARCH", style: styleConstant.buttonText),
      style: styleConstant.buttonStyle,
    );
  }

  // Widget to display list of search results
  Widget _buildSearchResults(BookSearchController searchController) {
    return Expanded(
      child: searchController.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: searchController.apiSearchModel?.items?.length ?? 0,
              itemBuilder: (context, index) {
                final item = searchController.apiSearchModel?.items?[index];
                return BookListVertical(
                  image: item?.volumeInfo?.imageLinks?.smallThumbnail ?? "",
                  title: item?.volumeInfo?.title ?? "",
                  author: item?.volumeInfo?.authors?.isNotEmpty ?? false
                      ? item!.volumeInfo!.authors![0]
                      : "",
                  publisher: item?.volumeInfo?.publisher ?? "",
                  date: item?.volumeInfo?.publishedDate ?? "",
                  pageNo: item?.volumeInfo?.pageCount ?? 0,
                  desc: item?.volumeInfo?.description ?? "",
                  url: item?.volumeInfo?.previewLink ?? "",
                  infoUrl: item?.volumeInfo?.infoLink ?? "",
                );
              },
            ),
    );
  }
}
