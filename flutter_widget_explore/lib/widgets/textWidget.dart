import 'package:flutter/material.dart';

class Textwidget extends StatelessWidget {
  Widget _size(double size) {
    return SizedBox(height: size);
  }

  Widget _text(int i, String name) {
    return Text("${i}) $name");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Widget")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _text(1, "Style :"),
              Text(
                "Hello Word",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10,
                ),
              ),
              _size(20),
              _text(2, "overflow :"),
              _size(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 30,
                    color: Colors.amber,
                    child: Text(
                      'Hello Word Hello Word  Hello Word Hello Word ',
                      // overflow: TextOverflow.visible, // Allow overflow
                    ),
                  ),
                  Text("=>"),
                  Container(
                    width: 100,
                    height: 30,
                    color: Colors.amber,
                    child: Text(
                      'Hello Word Hello Word  Hello Word Hello Word ',
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
              _size(40),
              _text(3, "textAlign"),
              _size(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.amber,
                    child: Text('start'),
                  ),
                  Text("=>"),
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.amber,
                    child: Text('Center', textAlign: TextAlign.center),
                  ),
                ],
              ),
              _size(20),
              _text(4, "maxLine :"),
              _size(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 70,
                    color: Colors.amber,
                    child: Text('maxLine 2222222222222222222222222222'),
                  ),
                  Text("=>"),
                  Container(
                    width: 100,
                    height: 70,
                    color: Colors.amber,
                    child: Text(
                      'maxLine 2222222222222222222222222222',
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              _size(20),
              _text(5, "textDirection :"),
              _size(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.amber,
                    child: Text('Direction rtl'),
                  ),
                  Text("=>"),
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.amber,
                    child: Text(
                      'Direction rtl',
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
              _size(20),
              _text(6, "softWrap :"),
              _size(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.amber,
                    child: Text('softwrap property true'),
                  ),
                  Text("=>"),
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.amber,
                    child: Text('softwrap property false', softWrap: false),
                  ),
                ],
              ),

              _size(20),
              _text(7, "textScaler :"),
              _size(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.amber,
                    child: Text('Text Scalar property'),
                  ),
                  Text("=>"),
                  Container(
                    width: 200,
                    height: 50,
                    color: Colors.amber,
                    child: Text(
                      'Text Scalar property',
                      textScaler: TextScaler.linear(2.1),
                    ),
                  ),
                ],
              ),

              _size(20),
              _text(
                8,
                "struct Style : it give the equal vertical specing in multiple line",
              ),
              _size(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    // height: 50,
                    color: Colors.amber,
                    child: Text(
                      'it give the equal vertical specing in multiple line',
                    ),
                  ),
                  Text("=>"),
                  Container(
                    width: 100,
                    // height: 200,
                    color: Colors.amber,
                    child: Text(
                      'it give the equal vertical specing in multiple line',
                      strutStyle: StrutStyle(fontSize: 11, height: 2),
                    ),
                  ),
                ],
              ),

              _size(20),
              _text(9, "locale :"),
              _size(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 70,
                    color: Colors.amber,
                    child: Text('maxLine 2222222222222222222222222222'),
                  ),
                  Text("=>"),
                  Container(
                    width: 100,
                    height: 70,
                    color: Colors.amber,
                    child: Text('हिंदी', locale: Locale('hi', 'EG')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

 
}
