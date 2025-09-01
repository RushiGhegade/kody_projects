import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/utils/hive_init.dart';
import 'package:shopping_app/ui/auth/splash_screen.dart';
import 'package:shopping_app/ui/utils/theme/app_theme.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();

  // initialize the Hive in this class
  HiveInitialize.initHive();

  // run method
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.AppThemeLight(),
        home: SplashScreen(),
      ),
    );
  }
}
