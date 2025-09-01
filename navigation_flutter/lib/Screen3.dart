import 'package:flutter/material.dart';
import 'package:navigation_flutter/Screen1.dart';

class Screen3 extends StatefulWidget {
  Screen3({super.key,this.str});

  String? str;

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text("Welcome to Screen3 ${widget.str}"),
        ElevatedButton(
          onPressed: () {

            // Navigator.push(context, MaterialPageRoute(builder:(context){return Screen1();}));
            // Navigator.pop(context,"Done");
            Navigator.popUntil(context, (route)=>route.isFirst);
          },
          child: Text("Screen3")),
          ],
        ),
      ),
    );
  }
}
