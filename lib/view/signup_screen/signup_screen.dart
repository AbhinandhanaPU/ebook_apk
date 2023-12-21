import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Text(
                "Let's get Started!",
                style: TextStyle(
                    color: ColorConstant.themeColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 15),
              Text(
                "Create An Account To Get All Features",
                style: TextStyle(
                    color: ColorConstant.mainBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 40),
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  labelText: "User Name",
                  labelStyle: TextStyle(color: ColorConstant.themeColor),
                  prefixIcon: Icon(Icons.person, color: ColorConstant.iconGrey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: ColorConstant.themeColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 2.5,
                        color: ColorConstant.themeColor,
                      )),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: mailController,
                decoration: InputDecoration(
                  labelText: "Email ID",
                  labelStyle: TextStyle(color: ColorConstant.themeColor),
                  prefixIcon: Icon(Icons.email, color: ColorConstant.iconGrey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: ColorConstant.themeColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 2.5,
                        color: ColorConstant.themeColor,
                      )),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: passController,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: ColorConstant.themeColor),
                  prefixIcon:
                      Icon(Icons.lock_open, color: ColorConstant.iconGrey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: ColorConstant.themeColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 2.5,
                        color: ColorConstant.themeColor,
                      )),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: confirmController,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  labelStyle: TextStyle(color: ColorConstant.themeColor),
                  prefixIcon:
                      Icon(Icons.lock_open, color: ColorConstant.iconGrey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: ColorConstant.themeColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 2.5,
                        color: ColorConstant.themeColor,
                      )),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(ColorConstant.themeColor),
                        elevation: MaterialStatePropertyAll(10),
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 25, vertical: 11)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    child: Text("CREATE",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        " Login Here",
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
