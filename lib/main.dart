import 'package:ebook_apk/controller/book_controller.dart';
import 'package:ebook_apk/controller/category_controller.dart';
import 'package:ebook_apk/controller/search_controller.dart';
import 'package:ebook_apk/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
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
