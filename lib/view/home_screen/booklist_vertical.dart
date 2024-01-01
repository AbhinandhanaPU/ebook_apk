import 'package:flutter/material.dart';

class BookListVertical extends StatelessWidget {
  BookListVertical({
    super.key,
    this.title = '',
    required this.author,
    required this.image,
  });
  final String title;
  final String author;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
