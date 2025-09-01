

import 'package:flutter/material.dart';

class ListviewDemo extends StatelessWidget {
  const ListviewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SingleChildScrollView(
      //   padding: EdgeInsets.symmetric(horizontal: 20),
      //   child: Column(
      //     children: [
      //       Container(
      //         height:MediaQuery.of(context).size.height,
      //         width: double.infinity,
      //         color: Colors.orange,
      //         child: Container(
      //           height: double.infinity,
      //           width: 50,
      //           color: Colors.red,
      //         ),
      //       ),
      //       Container(
      //         height: 30,
      //         width: 50,
      //         color: Colors.pink,
      //       ),
      //
      //     ],
      //   ),
      // ),

      body: Container(
        height: 300,
        child: ListView(
          shrinkWrap: true,
          children:List.generate(200, (index){
            print("Listview indez $index");
            print(double.infinity);
            print(MediaQuery.of(context).size.height);
            return Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 10),
              color: Colors.yellow,
            );}),
        ),
      ),

      // body: ListView.builder(
      //     shrinkWrap: true,
      //     itemCount: 200,
      //     itemBuilder: (context,int index){
      //       print("Listview Builder index $index");
      //       return Container(
      //         height: 20,
      //         color: Colors.orange,
      //         margin: EdgeInsets.only(bottom: 10),
      //         child: Text("$index"),
      //       );
      //       },
      // ),
    );
  }
}
