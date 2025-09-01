
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key});

  Widget _text(int i, String name) {
    return Text("${i}) $name");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListTile Widget"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _text(1, "ListTile"),

          ListTile(

          ),

        ],
      ),
    );
  }
}
