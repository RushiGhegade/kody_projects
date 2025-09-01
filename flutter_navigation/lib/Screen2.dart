import 'package:flutter/material.dart';
import 'package:flutter_navigation/modelclass.dart';

import 'Screen3.dart';

class Screen2 extends StatefulWidget {
  final UserInfo userInfo;
  Screen2({super.key, required this.userInfo});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final TextEditingController _jobDiscription = TextEditingController();

  Widget _textWidget(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Enter the Job Discription",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(15),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textWidget(_jobDiscription),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(15),
                ),
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
              ),
              onPressed: () {
                widget.userInfo.jobDiscription = _jobDiscription.text
                    .toString();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Screen3(userInfo: widget.userInfo),
                  ),
                ).then((val) {
                  print("1st screen => ${val}");
                  Navigator.pop(context, val);
                });
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
