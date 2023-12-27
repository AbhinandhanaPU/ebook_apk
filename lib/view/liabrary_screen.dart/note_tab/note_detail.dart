import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class NoteDetail extends StatelessWidget {
  const NoteDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                dialogBox(context);
              },
              icon: Icon(Icons.delete),
              iconSize: 28),
          SizedBox(width: 15)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "book name",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "author",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text("at page 3,", style: TextStyle(fontSize: 16)),
                  SizedBox(width: 8),
                  Text("time", style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 25),
              Text(
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Future<dynamic> dialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete confirmation"),
        content: Text("Do you want to delete note"),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "No",
                  style: TextStyle(color: ColorConstant.themeColor),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "yes",
                  style: TextStyle(color: ColorConstant.themeColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
