import 'package:flutter/material.dart';

class Buttonwidget extends StatelessWidget {
  const Buttonwidget({super.key});
  Widget _text(int i, String name) {
    return Text("${i}) $name");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button widget"),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    _text(1, "ElevatedButton"),
                    ElevatedButton(
                        onPressed: (){},
                        child: Text("Elevated Button"),)
                    ,
                    _text(2, "TextButton"),
                   TextButton(
                       onPressed: (){},
                       child: Text("Text Button"),),


                  _text(3, "OutlinedButton"),
                OutlinedButton(
                    onPressed: (){},
                    child: Text("OutlinedButton"),),
                    // _text(4, "Properties"),

                    Text("Properties",style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),),

                  Text("onPress, onLongPress, style,  clipBehavior, "),
            ],
                ),
              )
          ),
      ),
    );
  }
}
