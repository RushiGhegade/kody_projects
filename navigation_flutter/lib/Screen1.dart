import 'package:flutter/material.dart';
import 'package:navigation_flutter/Screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text("Welcome to Screen 1"),
            ElevatedButton(
              onPressed: () {


                Navigator.push(context,
                    PageRouteBuilder(
                    pageBuilder: (context,animation,secondaryAnimation){

                      return Screen2();
                    },
                  transitionsBuilder: (context,animation,secondaryAnimation,child){
                      return SlideTransition(
                          position:animation.drive(
                        Tween(begin: Offset(-1,-1),end:Offset.zero).chain(CurveTween(curve: Curves.bounceInOut))
                      ),child: child,);
                  }
                )).then((value){
                  print("----- $value");
                });
                // Navigator.push(context, MaterialPageRoute(builder:(context){return Screen2(str1: "Rushikesh",);})).then((value){
                //   print("---- $value");
                // });
              },
              child: Text("Screen1"),
            ),
          ],
        ),
      ),
    );
  }
}
