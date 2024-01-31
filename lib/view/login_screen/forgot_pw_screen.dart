import 'package:ebook_apk/controller/services/users.dart';
import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/utils/style_constant/style_constant.dart';
import 'package:ebook_apk/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPwScreen extends StatefulWidget {
  const ForgotPwScreen({super.key});

  @override
  State<ForgotPwScreen> createState() => _ForgotPwScreenState();
}

class _ForgotPwScreenState extends State<ForgotPwScreen> {
  final mailController = TextEditingController();

  @override
  void dispose() {
    mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ColorConstant.themeColor,
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 120,
                    backgroundColor: ColorConstant.themeColor.withOpacity(0.1),
                    child: Icon(
                      Icons.lock,
                      size: 130,
                      color: ColorConstant.themeColor,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Forgot Password ?",
                    style: styleConstant.textStyleLS1,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Enter your email address associated with your account and we'll send you a link into your Email to reset your password",
                    textAlign: TextAlign.justify,
                    style: styleConstant.textStyleLS3,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                decoration: BoxDecoration(
                    color: ColorConstant.themeColor.withOpacity(0.3),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  children: [
                    TextFormField(
                      controller: mailController,
                      decoration: InputDecoration(
                        hintText: "Email ID",
                        filled: true,
                        fillColor: ColorConstant.activegrey,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: styleConstant.focusedBorder,
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () async {
                          Provider.of<UserManagement>(context, listen: false)
                              .passwordReset(
                                  context: context,
                                  mail: mailController.text.trim());
                        },
                        style: styleConstant.buttonStyle,
                        child: Text(
                          "Reset Password",
                          style: styleConstant.buttonText,
                        )),
                    SizedBox(height: 50),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: Text(
                        "Return to Login",
                        style: styleConstant.textStyleLS3,
                      ),
                      style: ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(
                              ColorConstant.mainBlack)),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
