
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CheckScreenLayout{

  final Widget mobile;
  final Widget web;

  const CheckScreenLayout({required this.mobile,required this.web});

  Widget getLayout(){
    return ScreenTypeLayout.builder(
      breakpoints: ScreenBreakpoints(desktop: 769, tablet: 480, watch:320),
      mobile: (context) => mobile,
      desktop :  (context) => web,
    );
  }
}
