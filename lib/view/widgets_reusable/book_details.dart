import 'package:ebook_apk/controller/book_controller.dart';
import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({
    super.key,
    required this.title,
    required this.image,
    required this.author,
    required this.publisher,
    required this.date,
    required this.pageNo,
    required this.desc,
    required this.url,
  });
  final String title;
  final String image;
  final String author;
  final String publisher;
  final String date;
  final int pageNo;
  final String desc;
  final String url;
  @override
  Widget build(BuildContext context) {
    final TextStyle largeTextStyle =
        TextStyle(fontSize: 18, fontWeight: FontWeight.w800);
    final TextStyle smallTextStyle =
        TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ColorConstant.themeColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 4),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              // Image container
              Center(
                child: Container(
                  height: 200,
                  width: 130,
                  // child: Image.network(image),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.fill),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                              2.0, 10.0), // shadow direction: bottom right
                        )
                      ]),
                ),
              ),
              SizedBox(height: 20),
              // Title
              Center(
                child: Text(
                  title,
                  // "In publishing and graphic design",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              // Author
              Row(
                children: [
                  Text("Authors : ", style: largeTextStyle),
                  Expanded(child: Text("$author", style: smallTextStyle)),
                ],
              ),
              SizedBox(height: 10),
              // publisher
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("publisher : ", style: largeTextStyle),
                  Expanded(child: Text("$publisher", style: smallTextStyle)),
                ],
              ),
              SizedBox(height: 10),
              // published date
              Row(
                children: [
                  Text("Published date : ", style: largeTextStyle),
                  Text("$date", style: smallTextStyle),
                ],
              ),
              SizedBox(height: 10),
              // No. of pages
              Row(
                children: [
                  Text("No. of pages : ", style: largeTextStyle),
                  Text("$pageNo", style: smallTextStyle),
                ],
              ),
              SizedBox(height: 10),
              // descrption
              Text("Description", style: largeTextStyle),
              SizedBox(height: 5),
              Text(
                desc,
                // "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking",
                textAlign: TextAlign.justify,
                style: smallTextStyle,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 5),
        child: ElevatedButton(
          onPressed: () {
            Provider.of<NewestBookController>(context, listen: false)
                .openUrl(url);
          },
          child: Text(
            "Preview",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorConstant.themeColor),
          ),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(ColorConstant.mainWhite),
              padding:
                  MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 10)),
              shape: MaterialStatePropertyAll(BeveledRectangleBorder(
                  side: BorderSide(color: ColorConstant.themeColor)))),
        ),
      ),
    );
  }
}
