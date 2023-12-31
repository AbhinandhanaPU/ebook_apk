import 'package:ebook_apk/controller/book_controller.dart';
import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/utils/image_constant/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListVertical extends StatelessWidget {
  BookListVertical({
    super.key,
    this.title = '',
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    final newestController = Provider.of<NewestBookController>(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: List.generate(
              10,
              (index) => Padding(
                padding: const EdgeInsets.only(
                    bottom: 8, left: 10, right: 8, top: 1),
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
                            image: NetworkImage(newestController
                                    .apiResModel
                                    ?.items?[index]
                                    .volumeInfo
                                    ?.imageLinks
                                    ?.smallThumbnail ??
                                ""),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 205,
                                child: Text(
                                  newestController.apiResModel?.items?[index]
                                          .volumeInfo?.title ??
                                      "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Icon(Icons.more_vert)
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            newestController.apiResModel?.items?[index]
                                    .volumeInfo?.authors?[0] ??
                                "",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
