import 'package:flutter/material.dart';

class Alignwidget extends StatelessWidget {
  const Alignwidget({super.key});

  Widget _text(int i, String name) {
    return Text("${i}) $name");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Align Widget")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            color: Colors.yellow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                _text(
                  1,
                  "Alignment : Set the alignment according to its child",
                ),
                Container(
                  height: 200,
                  color: Colors.orange,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        // heightFactor: 1.5,
                        // widthFactor: 1.3,
                        child: Container(
                          height: 100,
                          width: 130,
                          alignment: Alignment.center,
                          color: Colors.red,
                          child: Text(
                            "Alignment bottom Left",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _text(
                  1,
                  "HeightFactor:1.5 : it give height to its child only 1.5 height it take  not take all orage space ",
                ),
                Container(
                  height: 200,
                  color: Colors.orange,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        heightFactor: 1.5,
                        // widthFactor: 1.3,
                        child: Container(
                          height: 100,
                          width: 130,
                          alignment: Alignment.center,
                          color: Colors.red,
                          child: Text(
                            "Alignment bottom Left",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                _text(
                  1,
                  "WithFactor:1.5 : it give width to its child only 1.5 width it take  not take all orage space ",
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.orange,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        heightFactor: 1.5,
                        widthFactor: 1.5,
                        child: Container(
                          height: 100,
                          width: 130,
                          alignment: Alignment.center,
                          color: Colors.red,
                          child: Text(
                            "Alignment bottom Left",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
