import 'package:ebook_apk/view/widgets_reusable/book_details.dart';
import 'package:flutter/material.dart';

class BookListHoriz extends StatelessWidget {
  BookListHoriz({
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, bottom: 30),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetails(
                image: image,
                title: title,
                author: author,
                publisher: publisher,
                date: date,
                pageNo: pageNo,
                desc: desc,
                url: url,
                infoUrl: infoUrl,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 95,
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
