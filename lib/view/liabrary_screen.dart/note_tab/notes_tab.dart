import 'package:ebook_apk/view/liabrary_screen.dart/note_tab/notecard_widget.dart';
import 'package:flutter/material.dart';

class NotesTab extends StatelessWidget {
  const NotesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: ListView.separated(
          itemCount: 2,
          separatorBuilder: (context, index) => SizedBox(height: 30),
          itemBuilder: (context, index) {
            return noteCardWidget();
          },
        ),
      ),
    );
  }
}
