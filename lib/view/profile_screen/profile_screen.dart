import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle profileStyle =
        TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            color: ColorConstant.activegrey,
            child: Row(
              children: [
                SizedBox(width: 30),
                CircleAvatar(
                  backgroundColor: ColorConstant.themeColor,
                  foregroundColor: ColorConstant.mainWhite,
                  radius: 50,
                ),
                SizedBox(width: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "User name",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Useremailid",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Settings",
                  style: profileStyle,
                ),
                SizedBox(height: 30),
                Text(
                  "Preferences",
                  style: profileStyle,
                ),
                SizedBox(height: 30),
                Text(
                  "Theme",
                  style: profileStyle,
                ),
                SizedBox(height: 30),
                Text(
                  "Logout",
                  style: profileStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
