import 'package:flutter/material.dart';
import 'package:navigation_task/navigatorobserver.dart';
import 'package:navigation_task/trave_info.dart';
import 'VacationFornScreen.dart';
import 'summary_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [MyNavigatorObserver(),],
      onGenerateRoute: (settings) {
        if (settings.name == '/SummaryScreen') {
          TravelInfo travelInfo = settings.arguments as TravelInfo;
          return MaterialPageRoute(
            builder: (context) => SummaryScreen(travelInfo: travelInfo),
          );
        } else {
          return MaterialPageRoute(builder: (context) => VacationFornScreen());
        }
      },
      // home: VacationFornScreen(),
    );
  }
}
