import 'package:flutter/material.dart';

import 'Screen3.dart';

class Screen2 extends StatefulWidget {
   Screen2({super.key,this.str1});

  String? str1;

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [

            Text("Welcome to Screen2 ${widget.str1}"),

            ElevatedButton(
              onPressed: (){
                // Navigator.pop(context,"Done");
                Navigator.push(context, MaterialPageRoute(builder:(context){return Screen3(str: widget.str1,);})).then((value){
                  Navigator.pop(context,value);
                });
                // Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>Screen3(str:widget.str1,)));
                // Navigator.pop(context);
              },

              child: Text("Screen2"),
            ),
          ],
        ),
      ),
    );
  }
}
