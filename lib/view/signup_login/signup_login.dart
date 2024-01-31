import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/utils/style_constant/style_constant.dart';
import 'package:ebook_apk/view/login_screen/login_screen.dart';
import 'package:ebook_apk/view/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';

class SignupLoginScreen extends StatelessWidget {
  const SignupLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("WELCOME", style: styleConstant.textStyleLS1),
            SizedBox(height: 25),
            Text(
                "Login into your existing account or create a new one to access all the ebooks",
                textAlign: TextAlign.justify,
                style: styleConstant.textStyleLS2),
            SizedBox(height: 150),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              child: Text(
                "Login",
                style: TextStyle(
                    color: ColorConstant.mainWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(5),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 150, vertical: 10)),
                  backgroundColor:
                      MaterialStatePropertyAll(ColorConstant.themeColor)),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ));
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: ColorConstant.themeColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                elevation: MaterialStatePropertyAll(5),
                padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 140, vertical: 10)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
