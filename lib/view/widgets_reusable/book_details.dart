import 'package:ebook_apk/controller/books/book_controller.dart';
import 'package:ebook_apk/controller/services/crud_controller.dart';
import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/utils/style_constant/style_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class BookDetails extends StatefulWidget {
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
    required this.infoUrl,
  });
  final String title;
  final String image;
  final String author;
  final String publisher;
  final String date;
  final int pageNo;
  final String desc;
  final String url;
  final String infoUrl;
  // final DocumentSnapshot<Object?> employee;

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  bool bookmark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        foregroundColor: ColorConstant.themeColor,
        actions: [
          // Share button
          IconButton(
              onPressed: () {
                Share.share(
                    "Check out this Book: \n ${widget.title} \n \n${widget.infoUrl}");
              },
              icon: Icon(Icons.share)),
          // Bookmark button
          IconButton(
              onPressed: () {
                if (bookmark != true) {
                  // Add to bookmark
                  Provider.of<CrudController>(context, listen: false)
                      .addBookCollection(
                          title: widget.title,
                          image: widget.image,
                          author: widget.author,
                          publisher: widget.publisher,
                          date: widget.date,
                          pageNo: widget.pageNo,
                          desc: widget.desc,
                          url: widget.url,
                          infoUrl: widget.infoUrl);
                  bookmark = true;
                  setState(() {});
                } else {
                  // remove from bookmark
                  bookmark = false;
                  setState(() {});
                  Provider.of<CrudController>(context, listen: false)
                      .deleteBookCollection(title: widget.title);
                }
              },
              icon: bookmark != false
                  ? Icon(Icons.bookmark)
                  : Icon(Icons.bookmark_border),
              iconSize: 30),
          SizedBox(width: 20)
        ],
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
                          image: NetworkImage(widget.image), fit: BoxFit.fill),
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
                child: Text(widget.title,
                    // "In publishing and graphic design",
                    textAlign: TextAlign.center,
                    style: styleConstant.textStyle),
              ),
              SizedBox(height: 15),
              // Author
              Row(
                children: [
                  Text("Authors : ", style: styleConstant.largeTextStyle),
                  Expanded(
                      child: Text("${widget.author}",
                          style: styleConstant.smallTextStyle)),
                ],
              ),
              SizedBox(height: 15),
              // publisher
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("publisher : ", style: styleConstant.largeTextStyle),
                  Expanded(
                      child: Text("${widget.publisher}",
                          style: styleConstant.smallTextStyle)),
                ],
              ),
              SizedBox(height: 15),
              // published date
              Row(
                children: [
                  Text("Published date : ",
                      style: styleConstant.largeTextStyle),
                  Text("${widget.date}", style: styleConstant.smallTextStyle),
                ],
              ),
              SizedBox(height: 15),
              // No. of pages
              Row(
                children: [
                  Text("No. of pages : ", style: styleConstant.largeTextStyle),
                  Text("${widget.pageNo}", style: styleConstant.smallTextStyle),
                ],
              ),
              SizedBox(height: 15),
              // descrption
              Text("Description", style: styleConstant.largeTextStyle),
              SizedBox(height: 10),
              Text(
                widget.desc,
                // "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking",
                textAlign: TextAlign.justify,
                style: styleConstant.smallTextStyle,
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
                  .openUrl(widget.url);
            },
            child: Text("Preview", style: styleConstant.previewStyle),
            style: styleConstant.buttonStyle),
      ),
    );
  }
}
