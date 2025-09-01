import 'package:flutter/material.dart';
import 'package:flutter_navigation/Screen1.dart';

import 'modelclass.dart';

class Screen3 extends StatefulWidget {
  final UserInfo userInfo;
  const Screen3({super.key, required this.userInfo});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  List<String> status = ["Yes", "No"];
  String select = "Yes";

  Widget button(String str) {
    print(str);
    return Radio(
      value: str,
      groupValue: select,
      onChanged: (val) {
        print(select);
        print(val);
        select = val!;
        print(select);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            Text("Name : ${widget.userInfo.name}"),
            Text("age : ${widget.userInfo.age}"),
            Text("Gender : ${widget.userInfo.gender}"),
            Text("Job Discription : ${widget.userInfo.jobDiscription}"),

            Row(
              children: [
                button(status[0]),
                Text("Yes"),
                button(status[1]),
                Text("No"),
              ],
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(15),
                ),
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
              ),
              onPressed: () {
                Navigator.pop(context, select);
              },
              child: Text("Go To Home"),
            ),
          ],
        ),
      ),
    );
  }
}
