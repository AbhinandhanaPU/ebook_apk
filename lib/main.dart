import 'package:ebook_apk/controller/book_controller.dart';
import 'package:ebook_apk/controller/category_controller.dart';
import 'package:ebook_apk/controller/search_controller.dart';
import 'package:ebook_apk/view/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDAdgHphprTccNbugmwVgHrSdsy1ciFYh4",
      appId: "1:629850133472:android:0ffed4dde14debf92d5185",
      messagingSenderId: '',
      projectId: "ebook-2a118",
      storageBucket: "ebook-2a118.appspot.com",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewestBookController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookSearchController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookCategoryController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
