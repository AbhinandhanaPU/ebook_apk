import 'package:ebook_apk/controller/services/users.dart';
import 'package:ebook_apk/model/users.dart';
import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/view/profile_screen/option_screen.dart';
import 'package:ebook_apk/view/signup_login/signup_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserManagement>(context);

    final TextStyle profileStyle =
        TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
    final TextStyle themeStyle =
        TextStyle(fontSize: 18, color: ColorConstant.mainBlack);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: userController.getUserDetails(),
              builder: (context, snapshot) {
                UserModel userData = snapshot.data as UserModel;
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorConstant.themeColor,
                          foregroundColor: ColorConstant.mainWhite,
                          radius: 65,
                          child: Text(
                            "U",
                            style: TextStyle(fontSize: 50),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          userData.name,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          userData.email,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return Center(
                      child: Text("something went wrong"),
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            SizedBox(height: 60),
            Row(
              children: [
                CircleAvatar(
                    radius: 24,
                    child: Icon(
                      Icons.settings,
                      size: 22,
                      color: ColorConstant.themeColor,
                    )),
                SizedBox(width: 30),
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
                  CircleAvatar(
                      radius: 24,
                      child: Icon(
                        Icons.tune,
                        size: 22,
                        color: ColorConstant.themeColor,
                      )),
                  SizedBox(width: 30),
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
                  CircleAvatar(
                      radius: 24,
                      child: Icon(
                        Icons.contrast,
                        size: 22,
                        color: ColorConstant.themeColor,
                      )),
                  SizedBox(width: 30),
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
                                style:
                                    TextStyle(color: ColorConstant.themeColor),
                              )),
                          ElevatedButton(
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignupLoginScreen(),
                                    ),
                                    (route) => false);
                              },
                              child: Text(
                                "Logout",
                                style:
                                    TextStyle(color: ColorConstant.themeColor),
                              )),
                        ],
                      )
                    ],
                  ),
                );
              },
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 24,
                      child: Icon(
                        Icons.logout,
                        size: 22,
                        color: ColorConstant.themeColor,
                      )),
                  SizedBox(width: 30),
                  Text(
                    "Logout",
                    style: profileStyle,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
