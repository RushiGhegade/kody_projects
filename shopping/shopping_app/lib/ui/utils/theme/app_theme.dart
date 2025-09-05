

import 'package:flutter/material.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';

// her store the aoo them
class AppTheme{

   static ThemeData AppThemeLight() {
      return ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColor.backgroundColor,
        primaryColor: AppColor.primaryColor,
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: AppColor.textColor),
          bodyMedium: TextStyle(color: AppColor.textColor),
        )
      );
   }

}