
import 'package:flutter/material.dart';



class ColumnWidget extends StatelessWidget{

  Widget _size(double size) {
    return SizedBox(height: size);
  }

  Widget _text(int i, String name) {
    return Text("${i}) $name");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Column Widget"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
        
              _text(1, "mainAxisAlignment And crossAxisAlignment"),
              SizedBox(height: 20,),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
        
                  Container(
                    height: 100,
                    width: 150,
                    color:Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Start:Start")
                      ],
                    ),
                  ),
        
                  Container(
                    height: 100,
                    width: 150,
                    color:Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Start:center")
                      ],
                    ),
                  ),
        
                  Container(
                    height: 100,
                    width: 150,
                    color:Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end
                      ,
                      children: [
                        Text("Start:End")
                      ],
                    ),
                  ),
        
                  Container(
                    height: 100,
                    width: 150,
                    color:Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("center:Start")
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 150,
                    color:Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Center:Center")
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 150,
                    color:Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("center:end")
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 150,
                    color:Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("end:start")
                      ],
                    ),
                  ),
        
                  Container(
                    height: 100,
                    width: 150,
                    color:Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("end:center")
                      ],
                    ),
                  ),
        
                  Container(
                    height: 100,
                    width: 150,
                    color:Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      
                      children: [
                        Text("end:end")
                      ],
                    ),
                  ),
                  
                ],
              ),
        _size(10),
        
              _text(2,"Text Direction :TextDirection.rtl or ltr" ),
              SizedBox(height: 20,),
        
              Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,

                  children: [
                    Text("rtl R->L",style: TextStyle(backgroundColor: Colors.red),),

                  ],
                ),
              ),


              _size(10),

              _text(3,"verticalDirection :VerticalDirection.up or down" ),
              SizedBox(height: 20,),

              Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    Text("down",style: TextStyle(backgroundColor: Colors.red),),


                  ],
                ),
              ),




              _size(10),

              _text(4,"spacing : int" ),
              SizedBox(height: 20,),

              Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 21,
                  children: [
                    Text("Spacing",style: TextStyle(backgroundColor: Colors.red),),

                    Text("Spacing",style: TextStyle(backgroundColor: Colors.red),),

                  ],
                ),
              )



,
              _size(10),

              _text(5,"MainAxisSize : Min and max" ),
              SizedBox(height: 20,),

              Wrap(
                spacing: 10,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      textBaseline:TextBaseline.ideographic ,
                      children: [
                        Text("Min size",style: TextStyle(backgroundColor: Colors.red),),

                      ],
                    ),
                  ),

                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                    child: Container(
                      color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text("Max size",style: TextStyle(backgroundColor: Colors.red)),
                        ],
                      ),
                    ),
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