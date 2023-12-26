import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class ShelfScreen extends StatelessWidget {
  const ShelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shelfController = TextEditingController();
    final OutlineInputBorder enabledBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(width: 1.5, color: ColorConstant.iconGrey));
    final OutlineInputBorder focusedBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(width: 2.5, color: ColorConstant.themeColor));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              padding: EdgeInsets.only(
                  top: 22,
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: shelfController,
                    decoration: InputDecoration(
                        hintText: "shelf name",
                        focusedBorder: focusedBorder,
                        enabledBorder: enabledBorder),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "ADD",
                        style: TextStyle(color: ColorConstant.themeColor),
                      )),
                  SizedBox(height: 10)
                ],
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: ColorConstant.themeColor,
        ),
      ),
    );
  }
}
