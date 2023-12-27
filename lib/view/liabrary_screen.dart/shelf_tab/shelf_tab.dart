import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/view/liabrary_screen.dart/shelf_tab/shelf_card.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView.separated(
          itemCount: 2,
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemBuilder: (context, index) {
            return ShelfCardWidget();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottomSheetRefactor(
              context, shelfController, focusedBorder, enabledBorder);
        },
        child: Icon(
          Icons.add,
          color: ColorConstant.themeColor,
        ),
      ),
    );
  }

  Future<dynamic> bottomSheetRefactor(
      BuildContext context,
      TextEditingController shelfController,
      OutlineInputBorder focusedBorder,
      OutlineInputBorder enabledBorder) {
    return showModalBottomSheet(
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
            Text(
              "Name",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            TextField(
              controller: shelfController,
              decoration: InputDecoration(
                  hintText: "shelf name",
                  focusedBorder: focusedBorder,
                  enabledBorder: enabledBorder),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    shelfController.clear();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: ColorConstant.themeColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Create",
                    style: TextStyle(
                        color: ColorConstant.themeColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
