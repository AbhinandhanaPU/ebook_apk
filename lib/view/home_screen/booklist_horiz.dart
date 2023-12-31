import 'package:ebook_apk/controller/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListHoriz extends StatelessWidget {
  BookListHoriz({
    super.key,
    required this.headings,
  });
  final String headings;

  @override
  Widget build(BuildContext context) {
    final newestController = Provider.of<NewestBookController>(context);
    return Container(
      padding: EdgeInsets.only(top: 22, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headings,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                newestController.apiResModel?.items?.length ?? 0,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 15, left: 1, top: 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        height: 160,
                        decoration: BoxDecoration(
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
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 95,
                            child: Text(
                              newestController.apiResModel?.items?[index]
                                      .volumeInfo?.title
                                      .toString() ??
                                  "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.more_vert)
                        ],
                      ),
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
