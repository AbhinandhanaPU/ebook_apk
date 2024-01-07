import 'package:ebook_apk/view/bottomnav_screen/bottomnav_screen.dart';
import 'package:ebook_apk/view/intro_screen/intro_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool iswaiting = true;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4)).then((value) {
      iswaiting = false;
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (iswaiting == false) {
      return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BottomNavScreen();
          } else {
            return IntroScreen();
          }
        },
      );
    } else {
      return Scaffold(
        body: Center(
          child: Lottie.asset("asset/animation/Animation - 1703144519437.json",
              fit: BoxFit.cover),
        ),
      );
    }
  }
}
