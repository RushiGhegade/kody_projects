import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/framework/controller/select_category_controller.dart';
import 'package:todoapp/framework/enums/select_mode.dart';
import 'package:todoapp/ui/home/splash_screen.dart';
import 'package:todoapp/ui/utils/theme/app_theme.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child:ScreenUtilInit(
        child:Screen1(),
      ),
    );
  }
}


class Screen1 extends ConsumerWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final isDarkMode = ref.watch(isDark);

    return MaterialApp(

      themeMode:(isDarkMode==SelectDarkMode.Light)? ThemeMode.light:ThemeMode.dark,
      theme: AppTheme.themeDataLight(),
      darkTheme:AppTheme.themeDataDark(),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
