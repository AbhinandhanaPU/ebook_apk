import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle largeTextStyle =
        TextStyle(fontSize: 18, fontWeight: FontWeight.w800);
    final TextStyle smallTextStyle =
        TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
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
              // Image container
              Center(
                child: Container(
                  height: 200,
                  width: 130,
                  child: Image.network("src"),
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage("url"))),
                ),
              ),
              SizedBox(height: 10),
              // Title
              Center(
                child: Text(
                  "In publishing and graphic design",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              // subtitle
              Text(
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate ",
                textAlign: TextAlign.justify,
                style: largeTextStyle,
              ),
              SizedBox(height: 10),
              // Author
              Row(
                children: [
                  Text("Authors : ", style: largeTextStyle),
                  Text("abhinandhana", style: smallTextStyle),
                ],
              ),
              SizedBox(height: 10),
              // Langauge
              Row(
                children: [
                  Text("language :", style: largeTextStyle),
                  Text(" english", style: smallTextStyle)
                ],
              ),
              SizedBox(height: 10),
              // publisher
              Row(
                children: [
                  Text("publisher : ", style: largeTextStyle),
                  Text("usjdfkagwosvdhjah", style: smallTextStyle),
                ],
              ),
              SizedBox(height: 10),
              // published date
              Row(
                children: [
                  Text("Published date : ", style: largeTextStyle),
                  Text("05/05/15", style: smallTextStyle),
                ],
              ),
              SizedBox(height: 10),
              // No. of pages
              Row(
                children: [
                  Text("No. of pages : ", style: largeTextStyle),
                  Text("200", style: smallTextStyle),
                ],
              ),
              SizedBox(height: 10),
              // descrption
              Text("Descrption", style: largeTextStyle),
              SizedBox(height: 5),

              Text(
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking",
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
          onPressed: () {},
          child: Text(
            "READ",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorConstant.mainWhite),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(ColorConstant.themeColor),
            padding:
                MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 10)),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
