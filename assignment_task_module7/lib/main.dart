import 'package:flutter/material.dart';

import 'View/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily:'MyFont'
        ),
        debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
