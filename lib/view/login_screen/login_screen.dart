import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/view/bottomnav_screen/bottomnav_screen.dart';
import 'package:ebook_apk/view/signup_screen/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController mailLoginController = TextEditingController();
    TextEditingController passLoginController = TextEditingController();
    final OutlineInputBorder enabledBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(width: 1.3, color: ColorConstant.iconGrey));
    final OutlineInputBorder focusedBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(width: 2.5, color: ColorConstant.themeColor));
    final OutlineInputBorder errorBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(width: 1.2, color: ColorConstant.red));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Builder(builder: (context) {
              return Column(
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
                  TextFormField(
                    controller: mailLoginController,
                    decoration: InputDecoration(
                        hintText: "Email ID",
                        prefixIcon:
                            Icon(Icons.person, color: ColorConstant.iconGrey),
                        enabledBorder: enabledBorder,
                        focusedBorder: focusedBorder,
                        focusedErrorBorder: errorBorder,
                        errorBorder: errorBorder),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Email ID is required'),
                      EmailValidator(errorText: 'Enter a valid email address')
                    ]),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: passLoginController,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock_open,
                            color: ColorConstant.iconGrey),
                        counter: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.themeColor),
                        ),
                        enabledBorder: enabledBorder,
                        focusedBorder: focusedBorder,
                        focusedErrorBorder: errorBorder,
                        errorBorder: errorBorder),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Password is required'),
                      MinLengthValidator(6,
                          errorText:
                              'Password must be at least 6 characters long')
                    ]),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          if (Form.of(context).validate()) {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: mailLoginController.text,
                                      password: passLoginController.text);
                              if (credential.user?.uid != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Login successfull")));
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BottomNavScreen(),
                                    ),
                                    (route) => false);
                              }
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Invalid mail id",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                );

                                print('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                              }
                            }
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                ColorConstant.themeColor),
                            elevation: MaterialStatePropertyAll(10),
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 35, vertical: 11)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
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
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
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
              );
            }),
          ),
        ),
      ),
    );
  }
}
