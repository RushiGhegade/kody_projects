import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:localizationflutter/ui/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  print("Berofre Run ");

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
        Locale('fr'),
        Locale('hi'),
      ],

      /// This line defines which languages and regions your app supports.
      path: 'assets/lang/', // <-- change the path of the lang
      fallbackLocale: Locale('en'),

      /// This sets a default language for your app.
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("material Build");
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomeScreen(),
    );
  }
}
