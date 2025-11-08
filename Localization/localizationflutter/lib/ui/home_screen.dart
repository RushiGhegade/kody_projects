import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:localizationflutter/ui/utils/app_strings.g.dart';
import 'package:localizationflutter/ui/utils/base_widget.dart';
import 'package:localizationflutter/ui/utils/string_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with BaseStatfulWidget {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Child itit");
  }

  @override
  Widget build(BuildContext context) {
    return buildPage(context);
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            Text("Hello ${LocaleKeys.hello.localized}"),
            Text("thank_you ${LocaleKeys.hello.localized}"),
            Text("Good Morning ${LocaleKeys.hello.localized}"),
            Text("how_are_you ${LocaleKeys.hello.localized}"),

            ElevatedButton(
              onPressed: () {
                context.setLocale(Locale('hi'));
              },
              child: Text("Hindi"),
            ),
            ElevatedButton(
              onPressed: () {
                context.setLocale(Locale('en'));
              },
              child: Text("English"),
            ),
            ElevatedButton(
              onPressed: () {
                context.setLocale(Locale('fr'));
              },
              child: Text("French"),
            ),
            ElevatedButton(
              onPressed: () {
                context.setLocale(Locale('ar'));
              },
              child: Text("Arbic"),
            ),
          ],
        ),
      ),
    );
  }
}
