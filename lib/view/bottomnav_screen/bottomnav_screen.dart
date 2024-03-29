import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/view/home_screen/home_screen.dart';
import 'package:ebook_apk/view/liabrary_screen.dart/liabrary_screen.dart';
import 'package:ebook_apk/view/profile_screen/profile_screen.dart';
import 'package:ebook_apk/view/search_screen/search_screen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  var currentIndex = 0;
  List<Widget> tabWidgets = [
    HomeScreen(),
    SearchScreen(),
    LibraryScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Bottom Navigation Bar
        bottomNavigationBar: _buildBottomNavigationBar(),

        // Body content based on the selected tab
        body: Center(child: tabWidgets.elementAt(currentIndex)),
      ),
    );
  }

  // Widget to build the bottom navigation bar
  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorConstant.mainWhite,
          boxShadow: [
            BoxShadow(color: Colors.black54, spreadRadius: 5, blurRadius: 15),
          ],
        ),
        child: BottomNavigationBar(
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
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: ColorConstant.themeColor,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          iconSize: 25,
          elevation: 0,
        ),
      ),
    );
  }
}
