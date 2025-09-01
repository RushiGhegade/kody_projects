import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> list = ["one", "Two", "Three", "Four"];
  String select = "one";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            DropdownButton(
              value: select,
                items:list.map((ele)=>DropdownMenuItem(value: ele,child: Text("$ele"),)).toList() ,
                onChanged: (val1){
              select = val1!;
              setState(() {
              });
            }),

          
          PopupMenuButton(
            offset: Offset(40, 40),
            icon: Icon(Icons.more_horiz),
            onSelected: (val){},
            itemBuilder:(context){
              return list.map((ele)=> PopupMenuItem( value: ele,child: Text("$ele"))).toList();
            },
          ),
            ElevatedButton(onPressed: () {

            }, child: Text("Screen1")),


          ],
        ),
      ),
    );
  }

  void showpopup() {

    PopupMenuButton(
      onSelected: (val){},
      itemBuilder:(context){
        return list.map((ele)=> PopupMenuItem( value: ele,child: Text("$ele"))).toList();
      },
    );

  }
}
