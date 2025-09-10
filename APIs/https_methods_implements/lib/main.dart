
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:https_methods_implements/ui/auth/splash_screen.dart';
import 'package:https_methods_implements/ui/utils/theme/app_theme.dart';


void main(){

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme().themeDataLight(),
        home: SplashScreen(),
      ),
    );
  }
}
