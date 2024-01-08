import 'package:ebook_apk/view/widgets_reusable/book_details.dart';
import 'package:flutter/material.dart';

class BookListVertical extends StatelessWidget {
  BookListVertical({
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
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetails(
                title: title,
                image: image,
                author: author,
                publisher: publisher,
                date: date,
                pageNo: pageNo,
                desc: desc,
                url: url,
                infoUrl: infoUrl,
              ),
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
                SizedBox(
                  width: 205,
                  child: Text(title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
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
