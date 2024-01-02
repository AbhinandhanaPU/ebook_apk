import 'package:ebook_apk/view/widgets_reusable/book_details.dart';
import 'package:flutter/material.dart';

class BookListHoriz extends StatelessWidget {
  BookListHoriz({
    super.key,
    required this.title,
    required this.image,
    required this.subtitle,
    required this.author,
    required this.lang,
    required this.publisher,
    required this.date,
    required this.pageNo,
    required this.desc,
  });
  final String title;
  final String image;
  final String subtitle;
  final String author;
  final String lang;
  final String publisher;
  final String date;
  final int pageNo;
  final String desc;

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
                subtitle: subtitle,
                author: author,
                lang: lang,
                publisher: publisher,
                date: date,
                pageNo: pageNo,
                desc: desc,
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
