import 'package:flutter/material.dart';
import 'package:flutter_navigation/Screen1.dart';

import 'demo1.dart';
import 'navigatorObserver.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [MyNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      home: MyWidget(), //Screen1(),
    );
  }
}
