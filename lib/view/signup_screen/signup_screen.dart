import 'package:ebook_apk/controller/services/users.dart';
import 'package:ebook_apk/model/users.dart';
import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/utils/style_constant/style_constant.dart';
import 'package:ebook_apk/view/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController mailSignController = TextEditingController();
  TextEditingController passSignController = TextEditingController();
  TextEditingController confirmSignController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final userController = Provider.of<UserManagement>(context);

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
                  Text("Let's get Started!", style: styleConstant.textStyleLS1),
                  SizedBox(height: 15),
                  Text("Create An Account To Get All Features",
                      style: styleConstant.textStyleLS2),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: "Name",
                        prefixIcon:
                            Icon(Icons.person, color: ColorConstant.iconGrey),
                        enabledBorder: styleConstant.enabledBorder,
                        focusedBorder: styleConstant.focusedBorder,
                        focusedErrorBorder: styleConstant.errorBorder,
                        errorBorder: styleConstant.errorBorder),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Name is required'),
                    ]),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: mailSignController,
                    decoration: InputDecoration(
                      hintText: "Email ID",
                      prefixIcon:
                          Icon(Icons.email, color: ColorConstant.iconGrey),
                      enabledBorder: styleConstant.enabledBorder,
                      focusedBorder: styleConstant.focusedBorder,
                      focusedErrorBorder: styleConstant.errorBorder,
                      errorBorder: styleConstant.errorBorder,
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Email ID is required'),
                      EmailValidator(errorText: 'Enter a valid email address')
                    ]),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: passSignController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon:
                          Icon(Icons.lock_open, color: ColorConstant.iconGrey),
                      enabledBorder: styleConstant.enabledBorder,
                      focusedBorder: styleConstant.focusedBorder,
                      focusedErrorBorder: styleConstant.errorBorder,
                      errorBorder: styleConstant.errorBorder,
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Password is required'),
                      MinLengthValidator(6,
                          errorText:
                              'Password must be at least 6 characters long')
                    ]),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: confirmSignController,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      prefixIcon:
                          Icon(Icons.lock_open, color: ColorConstant.iconGrey),
                      enabledBorder: styleConstant.enabledBorder,
                      focusedBorder: styleConstant.focusedBorder,
                      focusedErrorBorder: styleConstant.errorBorder,
                      errorBorder: styleConstant.errorBorder,
                    ),
                    validator: (val) {
                      if (val != passSignController.text) {
                        return 'Password and confirm password do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: mailSignController.text,
                                password: passSignController.text,
                              );
                              if (credential.user?.uid != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Account created successfully")));
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
                                      style: styleConstant.textStyleLS3,
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
                                        style: styleConstant.textStyleLS3),
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
                                uid: auth.currentUser!.uid);
                            userController.createNewUser(user, context);
                          }
                        },
                        style: styleConstant.buttonStyle,
                        child: Text(
                          "CREATE",
                          style: styleConstant.buttonText,
                        )),
                  ),
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: styleConstant.textStyleLS3,
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
