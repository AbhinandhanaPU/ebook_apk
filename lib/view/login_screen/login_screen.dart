import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/view/option_screen/option_screen.dart';
import 'package:ebook_apk/view/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userLoginController = TextEditingController();
    TextEditingController passLoginController = TextEditingController();
    final OutlineInputBorder enabledBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(width: 1.5, color: ColorConstant.iconGrey));
    final OutlineInputBorder focusedBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(width: 2.5, color: ColorConstant.themeColor));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Text(
                "Welcome Back!",
                style: TextStyle(
                    color: ColorConstant.themeColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 15),
              Text(
                "Login Into Your Existing Account",
                style: TextStyle(
                    color: ColorConstant.mainBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 80),
              TextField(
                controller: userLoginController,
                decoration: InputDecoration(
                    hintText: "User Name",
                    prefixIcon:
                        Icon(Icons.person, color: ColorConstant.iconGrey),
                    enabledBorder: enabledBorder,
                    focusedBorder: focusedBorder),
              ),
              SizedBox(height: 40),
              TextField(
                controller: passLoginController,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon:
                        Icon(Icons.lock_open, color: ColorConstant.iconGrey),
                    counter: Text(
                      "Forgot Password ?",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorConstant.themeColor),
                    ),
                    enabledBorder: enabledBorder,
                    focusedBorder: focusedBorder),
              ),
              SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OptionScreen(),
                          ));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(ColorConstant.themeColor),
                        elevation: MaterialStatePropertyAll(10),
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                            horizontal: 150, vertical: 11)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.mainWhite),
                    )),
              ),
              SizedBox(height: 170),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?  ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
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
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: ColorConstant.themeColor),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
