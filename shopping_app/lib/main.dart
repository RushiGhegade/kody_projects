import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/auth_controller/auth_controllers.dart';
import 'package:shopping_app/framework/utils/hive_init.dart';
import 'package:shopping_app/framework/utils/local_database_sharedpreferance.dart';
import 'package:shopping_app/ui/auth/splash_screen.dart';
import 'package:shopping_app/ui/utils/theme/app_theme.dart';

void main()async{

  // WidgetsFlutterBinding.ensureInitialized();

  // initialize the Hive in this class
  HiveInitialize.initHive();

  // run method
  runApp(
    const MyApp(),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
