import 'package:flutter/material.dart';

class ShelfDetails extends StatelessWidget {
  const ShelfDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("favorites"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined))
        ],
      ),
      // body: SingleChildScrollView(child: BookListVertical()),
    );
  }
}
