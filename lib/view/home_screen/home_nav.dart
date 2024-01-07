// import 'package:ebook_apk/utils/color_constant/color_constant.dart';
// import 'package:ebook_apk/utils/image_constant/image_constant.dart';
// import 'package:flutter/material.dart';

// class HomeNav extends StatefulWidget {
//   const HomeNav({super.key});

//   @override
//   State<HomeNav> createState() => _HomeNavState();
// }

// class _HomeNavState extends State<HomeNav> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             width: double.infinity,
//             height: 230,
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(ImageConstant.homeScreen),
//                     fit: BoxFit.fill),
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(30),
//                     bottomRight: Radius.circular(30))),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     mainAxisSpacing: 30,
//                     crossAxisSpacing: 30),
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     decoration: BoxDecoration(
//                         color: ColorConstant.mainWhite,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black26,
//                             blurRadius: 5.0,
//                             spreadRadius: 1.0,
//                             offset: Offset(
//                                 2.0, 10.0), // shadow direction: bottom right
//                           )
//                         ]),
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                               height: 50,
//                               width: 50,
//                               child: Image.asset(ImageConstant.drama)),
//                           SizedBox(height: 5),
//                           Text("drama")
//                         ]),
//                   );
//                 },
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
