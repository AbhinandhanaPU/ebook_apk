import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/utils/image_constant/image_constant.dart';
import 'package:flutter/material.dart';

class IntroWidget1 extends StatelessWidget {
  const IntroWidget1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Welcome to ebooks,",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: ColorConstant.themeColor),
          ),
          SizedBox(height: 10),
          Text(
            "The best place for your digital bookshelf!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              // color: ColorConstant.mainBlack,
            ),
          ),
          SizedBox(height: 50),
          Container(
            width: double.infinity,
            height: 400,
            child: Image.asset(
              ImageConstant.intro1,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
