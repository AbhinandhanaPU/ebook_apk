import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/view/bottomnav_screen/tab_screens/home_screen.dart';
import 'package:ebook_apk/view/bottomnav_screen/tab_screens/liabrary_screen.dart';
import 'package:ebook_apk/view/bottomnav_screen/tab_screens/profile_screen.dart';
import 'package:ebook_apk/view/bottomnav_screen/tab_screens/search_screen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  var indexNum = 0;
  List tabWidgets = [
    HomeScreen(),
    SearchScreen(),
    LiabraryScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "HOME",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "SEARCH",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books_outlined),
              label: "LIABRARY",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "PROFILE",
            ),
          ],
          currentIndex: indexNum,
          onTap: (int index) {
            setState(() {
              indexNum = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorConstant.themeColor,
          selectedItemColor: ColorConstant.mainWhite,
          elevation: 10,
        ),
        body: Center(child: tabWidgets.elementAt(indexNum)),
      ),
    );
  }
}
