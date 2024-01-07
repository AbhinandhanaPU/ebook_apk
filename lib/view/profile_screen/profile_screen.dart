import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/view/profile_screen/option_screen.dart';
import 'package:ebook_apk/view/signup_login/signup_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle profileStyle =
        TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
    final TextStyle themeStyle =
        TextStyle(fontSize: 18, color: ColorConstant.mainBlack);
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
                  radius: 45,
                  child: Text(
                    "U",
                    style: TextStyle(fontSize: 50),
                  ),
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
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.settings, size: 22),
                    SizedBox(width: 35),
                    Text(
                      "Settings",
                      style: profileStyle,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OptionScreen(),
                        ));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.tune, size: 22),
                      SizedBox(width: 35),
                      Text(
                        "Preferences",
                        style: profileStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          actionsAlignment: MainAxisAlignment.start,
                          actionsPadding: EdgeInsets.all(20),
                          alignment: Alignment.center,
                          actions: [
                            Column(
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "System Default",
                                      style: themeStyle,
                                    )),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Light",
                                      style: themeStyle,
                                    )),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Dark",
                                      style: themeStyle,
                                    )),
                              ],
                            )
                          ]),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.contrast, size: 22),
                      SizedBox(width: 35),
                      Text(
                        "Theme",
                        style: profileStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          "Do you want to Log out?",
                          style: TextStyle(fontSize: 22),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                        color: ColorConstant.themeColor),
                                  )),
                              ElevatedButton(
                                  onPressed: () async {
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SignupLoginScreen(),
                                        ),
                                        (route) => false);
                                  },
                                  child: Text(
                                    "Logout",
                                    style: TextStyle(
                                        color: ColorConstant.themeColor),
                                  )),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.logout, size: 22),
                      SizedBox(width: 35),
                      Text(
                        "Logout",
                        style: profileStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
