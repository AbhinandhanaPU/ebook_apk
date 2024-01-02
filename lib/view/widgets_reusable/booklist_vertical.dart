import 'package:ebook_apk/view/widgets_reusable/book_details.dart';
import 'package:flutter/material.dart';

class BookListVertical extends StatelessWidget {
  BookListVertical({
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
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetails(
                  title: title,
                  image: image,
                  subtitle: subtitle,
                  author: author,
                  lang: lang,
                  publisher: publisher,
                  date: date,
                  pageNo: pageNo,
                  desc: desc),
            ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            // color: Colors.amber,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 110,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 10),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 205,
                      child: Text(title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                    ),
                    Icon(Icons.more_vert)
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  author,
                  style: TextStyle(fontSize: 17),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
