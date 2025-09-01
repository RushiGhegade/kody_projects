import 'package:flutter/material.dart';


import '../../framework/getassets/images.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(GetImages.logo, height: 100, width: 100),
            Spacer(),
            Text("From"),
            SizedBox(
              height: 30,
              width: 90,
              child: Image.asset(
                GetImages.metaLogo,
                fit: BoxFit.fitWidth,
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
