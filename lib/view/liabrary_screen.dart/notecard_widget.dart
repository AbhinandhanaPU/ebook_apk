import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/view/liabrary_screen.dart/note_detail.dart';
import 'package:flutter/material.dart';

class noteCardWidget extends StatefulWidget {
  const noteCardWidget({
    super.key,
  });

  @override
  State<noteCardWidget> createState() => _noteCardWidgetState();
}

class _noteCardWidgetState extends State<noteCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoteDetail(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: ColorConstant.activegrey,
          border: Border.all(
            color: ColorConstant.mainBlack,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "book name",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "author",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Text("at page 3,", style: TextStyle(fontSize: 15)),
                SizedBox(width: 8),
                Text("time", style: TextStyle(fontSize: 15)),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking",
              textAlign: TextAlign.justify,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
