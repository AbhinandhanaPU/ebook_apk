import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class ShelfScreen extends StatelessWidget {
  const ShelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shelfController = TextEditingController();
    final shelfEditController = TextEditingController();
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
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: ColorConstant.activegrey,
                border: Border.all(
                  color: ColorConstant.mainBlack,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    color: ColorConstant.inActiveGrey,
                  ),
                  Text(
                    "Favorites",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          editBottomSheet(context, shelfEditController,
                              focusedBorder, enabledBorder);
                        },
                        icon: Icon(Icons.edit, size: 22),
                        tooltip: "Edit name",
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Delete confirmation"),
                              content:
                                  Text("Do you want to delete this shelf?"),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "No",
                                        style: TextStyle(
                                            color: ColorConstant.themeColor),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "yes",
                                        style: TextStyle(
                                            color: ColorConstant.themeColor),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        icon: Icon(Icons.delete, size: 22),
                        tooltip: "Delete Shelfe",
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottomShetetRefactor(
              context, shelfController, focusedBorder, enabledBorder);
        },
        child: Icon(
          Icons.add,
          color: ColorConstant.themeColor,
        ),
      ),
    );
  }

  Future<dynamic> editBottomSheet(
      BuildContext context,
      TextEditingController shelfEditController,
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
            TextField(
              controller: shelfEditController,
              decoration: InputDecoration(
                  hintText: "New name",
                  focusedBorder: focusedBorder,
                  enabledBorder: enabledBorder),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Update",
                  style: TextStyle(color: ColorConstant.themeColor),
                )),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  Future<dynamic> bottomShetetRefactor(
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
  }
}
