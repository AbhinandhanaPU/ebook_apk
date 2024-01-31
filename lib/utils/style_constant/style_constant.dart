import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class textConstant {
  static List Langconst = [
    "Malayalam",
    "English",
    "German",
    "Chinese",
    "Korean",
    "Spanish",
  ];
}

class styleConstant {
  // textformfield border style
  static OutlineInputBorder enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(width: 1.3, color: ColorConstant.iconGrey));
  static OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(width: 2.5, color: ColorConstant.themeColor));
  static OutlineInputBorder errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(width: 1.2, color: ColorConstant.red));

  // book details screen title textsyle
  static TextStyle textStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

  // book details screen subtitle textsyle
  static TextStyle largeTextStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w800);

  // book details screen subtitle description textsyle
  static TextStyle smallTextStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w400, height: 1.5);

  // book details screen preview title textsyle
  static TextStyle previewStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ColorConstant.mainWhite,
    letterSpacing: 1.0,
  );

  // image container titile textstyle
  static TextStyle containerMainText = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: ColorConstant.mainWhite);

  // image container subtitile textstyle
  static TextStyle containerSubText =
      TextStyle(fontSize: 18, color: ColorConstant.mainWhite);

  // login screen & signin screen title
  static TextStyle textStyleLS1 = TextStyle(
      color: ColorConstant.themeColor,
      fontSize: 30,
      fontWeight: FontWeight.w800);

  // login screen & signin screen subtitle
  static TextStyle textStyleLS2 = TextStyle(
      color: ColorConstant.mainBlack,
      fontSize: 20,
      fontWeight: FontWeight.w500);

  // login screen & signin screen check title
  static TextStyle textStyleLS3 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  // login screen & signin screen -signin/login
  static TextStyle textStyleLS4 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w900,
      color: ColorConstant.themeColor);

  // profile head textstyle
  static TextStyle profileStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
  static TextStyle themeStyle =
      TextStyle(fontSize: 18, color: ColorConstant.mainBlack);

  //  button textstyle
  static TextStyle buttonText = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: ColorConstant.mainWhite);

  // buttonstyle
  static ButtonStyle buttonStyle = ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(ColorConstant.themeColor),
    elevation: MaterialStatePropertyAll(10),
    padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 30, vertical: 11)),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
