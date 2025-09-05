import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/utils/hive_init.dart';
import 'package:shopping_app/ui/auth/splash_screen.dart';
import 'package:shopping_app/ui/utils/theme/app_theme.dart';

void main()async{

  // initialize the Hive in this class
  HiveInitialize.initHive();


  runApp(
    const MyApp(),
  );

}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: AppTheme.AppThemeLight(),
          home: SplashScreen(),
        ),
      ),
    );
  }
}

