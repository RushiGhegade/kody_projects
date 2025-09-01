
import 'package:flutter/material.dart';
import 'package:shopping_app/ui/auth/mobile/screens/home_screen_mobile.dart';
import 'package:shopping_app/ui/auth/mobile/screens/login_screen_mobile.dart';
import 'package:shopping_app/ui/auth/web/screens/home_screen_web.dart';
import 'package:shopping_app/ui/auth/web/screens/login_screen_web.dart';
import 'package:shopping_app/ui/helper/check_screen_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return CheckScreenLayout(mobile: LoginScreenMobile(), web: LoginScreenWeb()).getLayout();
        }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset("assets/images/buy.png",height: 150,width: 150, fit: BoxFit.cover)),
    );
  }
}