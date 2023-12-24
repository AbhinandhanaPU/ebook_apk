import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/utils/image_constant/image_constant.dart';
import 'package:flutter/material.dart';

class BookListHoriz extends StatelessWidget {
  BookListHoriz({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 22, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                10,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 15, left: 1, top: 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorConstant.mainBlack,
                              strokeAlign: BorderSide.strokeAlignOutside),
                          image: DecorationImage(
                            image: AssetImage(
                              ImageConstant.intro1,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Title",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Author",
                        style: TextStyle(fontSize: 17),
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
