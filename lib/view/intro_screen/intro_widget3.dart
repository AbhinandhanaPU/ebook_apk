import 'package:ebook_apk/utils/image_constant/image_constant.dart';
import 'package:flutter/material.dart';

class IntroWidget3 extends StatelessWidget {
  const IntroWidget3({
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
            """Download your Favorite books ,
you can enjoy your books without any worries""",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w400,
              // color: ColorConstant.mainBlack,
            ),
          ),
          SizedBox(height: 50),
          Container(
            width: double.infinity,
            height: 400,
            child: Image.asset(
              ImageConstant.intro3,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
