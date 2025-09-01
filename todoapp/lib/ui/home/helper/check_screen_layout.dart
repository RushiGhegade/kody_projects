import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CheckScreenLayout {
  final Widget mobile;
  final Widget web;
  final Widget tablet;

  const CheckScreenLayout({required this.mobile, required this.tablet,required this.web});

  Widget getLayout() {
    return ScreenTypeLayout.builder(
      mobile: (context) => mobile,
      desktop: (context) => web,
      tablet: (context)=> tablet,
    );
  }
}
