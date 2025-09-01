import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  Widget _text(int i, String name) {
    return Text("${i}) $name",);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack Widget"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
        
              _text(1, "Stack implementation"),
              Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.yellow,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 5,
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                      ),
        
                    ),
                  )
                ],
              ),
        
        
              _text(2, "Alignment :How to align the non-positioned and partially-positioned children in the stack. "),
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                    ),
        
                  )
                ],
              )
        
        
              ,_text(3, "fit: default =>losse expand => means child nonpositional show all parent space:  How to align the non-positioned and partially-positioned children in the stack. "),
              Container(
                height: 200,
                width: 200,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      color: Colors.grey,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                      ),
        
                    )
                  ],
                ),
              ),
        
              _text(4, "clipBehavior: The content will be clipped (or not) according to this option. "),
              Container(
                height: 100,
                width: 200,
                color: Colors.yellow,
                child: Stack(
                  clipBehavior: Clip.antiAlias,
                  // textDirection: TextDirection.rtl,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    ),
                    Positioned(
                      top: 80,
                      child: Container(
                        height: 40,
                        width: 40,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                      ),
        
                    )
                  ],
                ),
              ),


              _text(5, "textDirection: TextDirection.rtl  it show all children from right to left"),
              Container(
                height: 100,
                width: 200,
                color: Colors.yellow,
                child: Stack(
                  clipBehavior: Clip.antiAlias,
                  textDirection: TextDirection.rtl,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    ),
                    Positioned(
                      top: 80,
                      child: Container(
                        height: 40,
                        width: 40,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                      ),

                    )
                  ],
                ),
              ),

           SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
