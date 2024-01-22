import 'package:ebook_apk/controller/services/users.dart';
import 'package:ebook_apk/model/users.dart';
import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/view/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController mailSignController = TextEditingController();
  TextEditingController passSignController = TextEditingController();
  TextEditingController confirmSignController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final OutlineInputBorder enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(width: 1.5, color: ColorConstant.iconGrey));
  final OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(width: 2.5, color: ColorConstant.themeColor));

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserManagement>(context);

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
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "Name",
                    prefixIcon:
                        Icon(Icons.person, color: ColorConstant.iconGrey),
                    enabledBorder: enabledBorder,
                    focusedBorder: focusedBorder,
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(width: 2.5, color: ColorConstant.red))),
              ),
              SizedBox(height: 30),
              TextField(
                controller: mailSignController,
                decoration: InputDecoration(
                    hintText: "Email ID",
                    prefixIcon:
                        Icon(Icons.email, color: ColorConstant.iconGrey),
                    enabledBorder: enabledBorder,
                    focusedBorder: focusedBorder,
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(width: 2.5, color: ColorConstant.red))),
              ),
              SizedBox(height: 30),
              TextField(
                controller: passSignController,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon:
                        Icon(Icons.lock_open, color: ColorConstant.iconGrey),
                    enabledBorder: enabledBorder,
                    focusedBorder: focusedBorder),
              ),
              SizedBox(height: 30),
              TextField(
                controller: confirmSignController,
                decoration: InputDecoration(
                    hintText: "Confirm Password",
                    prefixIcon:
                        Icon(Icons.lock_open, color: ColorConstant.iconGrey),
                    enabledBorder: enabledBorder,
                    focusedBorder: focusedBorder),
              ),
              SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      if (nameController.text.isNotEmpty &&
                          mailSignController.text.isNotEmpty &&
                          passSignController.text.isNotEmpty &&
                          confirmSignController.text.isNotEmpty) {
                        if (passSignController.text !=
                            confirmSignController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Password and confirm password is not matching",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          );
                        } else {
                          try {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: mailSignController.text,
                              password: passSignController.text,
                            );
                            if (credential.user?.uid != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'The given password is invalid. Password should be at least 6 characters',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              );
                              print(
                                  'The given password is invalid. Password should be at least 6 characters');
                            } else if (e.code == 'email-already-in-use') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'The account already exists for that email.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ),
                              );
                              print(
                                  'The account already exists for that email.');
                            }
                          } catch (e) {
                            print(e);
                          }
                          final user = UserModel(
                            name: nameController.text,
                            email: mailSignController.text,
                          );
                          userController.createNewUser(user, context);
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Email ID and Password is required",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(ColorConstant.themeColor),
                      elevation: MaterialStatePropertyAll(10),
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 25, vertical: 11)),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      "CREATE",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.mainWhite),
                    )),
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
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
