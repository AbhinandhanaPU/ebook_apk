import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/utils/style_constant/style_constant.dart';
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
                  Text("Welcome Back!", style: styleConstant.textStyleLS1),
                  SizedBox(height: 15),
                  Text("Login Into Your Existing Account",
                      style: styleConstant.textStyleLS2),
                  SizedBox(height: 80),
                  TextFormField(
                    controller: mailLoginController,
                    decoration: InputDecoration(
                        hintText: "Email ID",
                        prefixIcon:
                            Icon(Icons.person, color: ColorConstant.iconGrey),
                        enabledBorder: styleConstant.enabledBorder,
                        focusedBorder: styleConstant.focusedBorder,
                        focusedErrorBorder: styleConstant.errorBorder,
                        errorBorder: styleConstant.errorBorder),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Email ID is required'),
                      EmailValidator(errorText: 'Enter a valid email address')
                    ]),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: passLoginController,
                    obscureText: true,
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
                        enabledBorder: styleConstant.enabledBorder,
                        focusedBorder: styleConstant.focusedBorder,
                        focusedErrorBorder: styleConstant.errorBorder,
                        errorBorder: styleConstant.errorBorder),
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
                                      style: styleConstant.textStyleLS3,
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
                        style: styleConstant.buttonStyle,
                        child: Text(
                          "LOGIN",
                          style: styleConstant.buttonText,
                        )),
                  ),
                  SizedBox(height: 170),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Don’t have an account?  ",
                          style: styleConstant.textStyleLS3),
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
                            style: styleConstant.textStyleLS4,
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
