import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/utils/image_constant/image_constant.dart';
import 'package:flutter/material.dart';

class BookListVertical extends StatelessWidget {
  BookListVertical({
    super.key,
    this.title = '',
  });
  final String title;

  @override
  Widget build(BuildContext context) {
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
                    bottom: 15, left: 10, right: 10, top: 1),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: ColorConstant.inActiveGrey,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "Title",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Author",
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
