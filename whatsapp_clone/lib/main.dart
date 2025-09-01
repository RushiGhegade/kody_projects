import 'package:flutter/material.dart';
import 'package:whatsapp_clone/framework/getassets/getdata.dart';
import 'package:whatsapp_clone/ui/view/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

int currentPageIndex = 0;
PageController pageController = PageController();
PageController pageControllerStatus = PageController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Data.getUsersMessage();
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
