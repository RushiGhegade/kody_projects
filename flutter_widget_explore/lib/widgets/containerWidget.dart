
import 'package:flutter/material.dart';
import 'dart:math' as math;


class ContainerWidget extends StatefulWidget {
  const ContainerWidget({super.key});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {

  Widget _size(double size) {
    return SizedBox(height: size);
  }

  Widget _text(int i, String name) {
    return Text("${i}) $name");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Container Widget"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
        
              _text(1, "height width color"),
        
              Container(
                height: 100,
                width: 100
                ,color: Colors.yellow,
              ),
        
              _text(2, "alignment : Center,topCenter,bottomCenter,bottomleft,bottomRight,topleft,topRight"),
              // _size(10),
              Wrap(
                spacing: 10,
                children: [
                 Container(
                   height: 100,
                   width: 100,
                   color: Colors.yellow,
                   alignment: Alignment.center,
                   child: Text("Center"),
                 ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                    alignment: Alignment.topLeft,
                    child: Text("topLeft"),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                    alignment: Alignment.bottomRight,
                    child: Text("bottomRight"),
                  )
                ],
              ),
        
              _text(3, "padding : inside Container"),
              Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
                padding: EdgeInsets.all(20),
                child: Container(
                  color: Colors.red,
                )
              ),
        
              _text(4, "margin : outside Container"),
              Container(
                  height: 100,
                  width: 100,
                  color: Colors.yellow,
                  margin: EdgeInsets.all(20),
                  child: Container(
                    // margin: EdgeInsets.all(10),
                    color: Colors.red,
                  )
              ),
        
        
              _text(5, "Decoration : decorate the container"),
              Container(
                  height: 100,
                  width: 100,
                  // constraints: BoxConstraints(minHeight: 10,maxHeight: 50,minWidth: 10,maxWidth: 50),
                  // clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20),
                    border:BoxBorder.all(),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(5, 5),
blurRadius: 10
                      )
                    ]
                  ),
                  child: Text("Hello")
              ),


              _text(6, "clipBehavior : add all inside the container"),
              Container(
                  height: 100,
                  width: 100,

                  clipBehavior:Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  // margin: EdgeInsets.all(20),
                  child: Text("hello Word"),
              ),


              _text(7, "constraints : Max width min width max height min height"),
              Container(
                // height: 100,
                // width: 100,
                constraints:BoxConstraints(
                  minWidth: 10,
                  maxWidth: 120,
                  minHeight: 20,
                  maxHeight: 120,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                // margin: EdgeInsets.all(20),
                child:Container(
                  height: 4,
                  width: 4,
                  color: Colors.green,
                ),
              ),


              _text(8, "transform : Rotating a widget , Scaling a widget , Translating a widget , Skewing a widget "),



              Container(
                height: 100,
                width: 100,

                transform: Transform(
                  transform: Matrix4.skew(0.3, 0.2),
                ).transform,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                // margin: EdgeInsets.all(20),
                child: Container(height: 20,width: 20,color: Colors.red,),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
