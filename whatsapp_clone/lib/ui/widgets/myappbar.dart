import 'package:flutter/material.dart';

import 'custom_icon.dart';


class MyAppBar {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  final IconData? icon;

  const MyAppBar({
    required this.title,
    required this.color,
    this.icon,
    required this.fontWeight,
  });

  PreferredSizeWidget? getAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: fontWeight,
          letterSpacing: 1,
          fontSize: 25,
          color: color, //GetColors.colorOriginal,
        ),
      ),
      actions: [
        CustomIcon(icon: Icons.qr_code_scanner, fontSize: 25),
        SizedBox(width: 17),
        if (icon != null) CustomIcon(icon: icon, fontSize: 25),
        if (icon != null) SizedBox(width: 15),
        CustomIcon(icon: Icons.more_vert, fontSize: 25),
        SizedBox(width: 10),
      ],
    );
  }
}
