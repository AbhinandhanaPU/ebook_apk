import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/view/intro_screen/intro_widget1.dart';
import 'package:ebook_apk/view/intro_screen/intro_widget2.dart';
import 'package:ebook_apk/view/intro_screen/intro_widget3.dart';
import 'package:ebook_apk/view/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int? indexNo = 0;
  int widgetNo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          indexNo == 0
              ? IntroWidget1()
              : indexNo == 1
                  ? IntroWidget2()
                  : IntroWidget3(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 30),
                child: ElevatedButton(
                  onPressed: () {
                    indexNo = widgetNo++;
                    if (indexNo == 3) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                          (route) => false);
                    }
                    setState(() {});
                  },
                  child: Text(
                    indexNo == 2 ? "Done" : "SKIP",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(ColorConstant.themeColor),
                      foregroundColor:
                          MaterialStatePropertyAll(ColorConstant.mainWhite)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
