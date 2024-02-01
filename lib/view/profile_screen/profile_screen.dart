import 'package:ebook_apk/controller/services/users.dart';
import 'package:ebook_apk/model/users.dart';
import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/utils/style_constant/style_constant.dart';
import 'package:ebook_apk/view/profile_screen/option_screen.dart';
import 'package:ebook_apk/view/signup_login/signup_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserManagement>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display user information
            _buildUserProfile(usercontroller: userController),

            SizedBox(height: 50),

            // Settings, Preferences, Theme, and Logout options
            _buildMenuOption(
              icon: Icons.settings,
              label: "Settings",
            ),
            SizedBox(height: 30),
            _buildMenuOption(
              icon: Icons.tune,
              label: "Preferences",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OptionScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 30),
            _buildMenuOption(
              icon: Icons.contrast,
              label: "Theme",
              onTap: () {
                _showThemeDialogBox(context);
              },
            ),
            SizedBox(height: 30),
            _buildMenuOption(
              icon: Icons.logout,
              label: "Logout",
              onTap: () {
                _showLogoutDialogBox(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget to display user information
  Widget _buildUserProfile({usercontroller}) {
    return FutureBuilder(
      future: usercontroller.getUserDetails(),
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
                  style: styleConstant.textStyleLS1,
                ),
                SizedBox(height: 8),
                Text(
                  userData.email,
                  style: styleConstant.textStyleLS2,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(
              child: Text("Something went wrong"),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // Widget to build each menu option
  Widget _buildMenuOption({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            child: Icon(
              icon,
              size: 22,
              color: ColorConstant.themeColor,
            ),
          ),
          SizedBox(width: 30),
          Text(
            label,
            style: styleConstant.profileStyle,
          ),
        ],
      ),
    );
  }

  // Dialog box to change the theme
  Future<void> _showThemeDialogBox(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsAlignment: MainAxisAlignment.start,
        actionsPadding: EdgeInsets.all(20),
        alignment: Alignment.center,
        actions: [
          Column(
            children: [
              _buildThemeButton("System Default"),
              _buildThemeButton("Light"),
              _buildThemeButton("Dark"),
            ],
          )
        ],
      ),
    );
  }

  // Helper method to build a theme button
  Widget _buildThemeButton(String theme) {
    return TextButton(
      onPressed: () {
        // TODO: Implement theme change logic
      },
      child: Text(
        theme,
        style: styleConstant.themeStyle,
      ),
    );
  }

  // Dialog box to confirm logout
  Future<void> _showLogoutDialogBox(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Do you want to log out?",
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDialogButton(
                text: "Cancel",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              _buildDialogButton(
                text: "Logout",
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupLoginScreen(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  // Helper method to build dialog buttons
  Widget _buildDialogButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: ColorConstant.themeColor),
      ),
    );
  }
}
